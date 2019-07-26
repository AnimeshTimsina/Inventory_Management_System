import csv
from django.shortcuts import render, redirect, HttpResponse
from .models import Categorie, Item, Floor, Room
from .forms import addCategoryForm, addItemForm, addExistingForm, allocateForm,addRoomForm,addFloorForm,categoryEditForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required

# Create your views here.

@login_required
def dashboardView(request):
    categoryDetails = []
    working_count = in_maintenanace_count = out_of_order_count = 0
    categoryObj = Categorie.objects.order_by('id')
    for cat in categoryObj:
        itemObj = Item.objects.filter(category = cat)
        for obj in itemObj:
            working_count += obj.working if obj.working!=0 else 0
            in_maintenanace_count += obj.in_maintenance if obj.in_maintenance!=0 else 0
            out_of_order_count += obj.out_of_order if obj.out_of_order!=0 else 0
        temp = [cat.category_name,cat.id,working_count,out_of_order_count,in_maintenanace_count]
        categoryDetails.append(temp)
        working_count = in_maintenanace_count = out_of_order_count = 0
    context = {'categoryDetails':categoryDetails}
    return render(request, 'inventory/base.html',context)

@login_required
def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Account created for {username}!.LogIn again')
            return redirect('login')
    else:
        form = UserCreationForm()
    context = {'form': form}
    return render(request, 'inventory/register.html', context)

@login_required
def add1(request):
    categories = Categorie.objects.all()
    dataTemp = {}
    if request.method == 'POST':
        addCategoryform = addCategoryForm(request.POST)
        if addCategoryform.is_valid():
            if (request.POST['extraField1']):
                temp = request.POST['extraField1']
                dataTemp.update({'field1': temp})
            if (request.POST['extraField2']):
                temp = request.POST['extraField2']
                dataTemp.update({'field2': temp})
            if (request.POST['extraField3']):
                temp = request.POST['extraField3']
                dataTemp.update({'field3': temp})
            Categorie.objects.create(
                category_name=request.POST['categoryName'], extra_fields=dataTemp)
            messages.success(request, f'Category created successfully! Select the category to add some equipments')
            return redirect('add1')
    else:
        addCategoryform = addCategoryForm()
    context = {'categories': categories, 'addCategoryForm': addCategoryform}
    return render(request, 'inventory/add1.html', context)

@login_required
def add2(request, key):
    categoryObj = Categorie.objects.get(pk=key)
    itemObj = Item.objects.filter(category=categoryObj)
    if request.method == 'POST':
        addItemform = addItemForm(data=request.POST, extra_fields_dict=categoryObj.extra_fields)
        if (addItemform.is_valid):
            addItemform.save()
            obj = Item.objects.latest('created')
            obj.category = categoryObj
            obj.save()
            if len(categoryObj.extra_fields) == 1:
                temp = categoryObj.extra_fields['field1']
                # vars()[temp] = forms.CharField(max_length=100,required=False)
                obj.extra_value.update({temp: request.POST[temp]})
            elif len(categoryObj.extra_fields) == 2:
                temp1 = categoryObj.extra_fields['field1']
                temp2 = categoryObj.extra_fields['field2']
                temp = {temp1: request.POST[temp1], temp2: request.POST[temp2]}
                obj.extra_value.update(temp)
            elif len(categoryObj.extra_fields) == 3:
                temp1 = categoryObj.extra_fields['field1']
                temp2 = categoryObj.extra_fields['field2']
                temp3 = categoryObj.extra_fields['field3']
                temp = {temp1: request.POST[temp1],
                        temp2: request.POST[temp2], temp3: request.POST[temp3]}
                obj.extra_value.update(temp)
            obj.save()
            if (request.POST['room']):
                pass
            else:
                obj.room = Room.objects.get(room_name__exact= 'Store')
                obj.save()

            messages.success(request, f'Added Successfully!')
            return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))

    else:
        addItemform = addItemForm(extra_fields_dict=categoryObj.extra_fields)
    context = {'itemObj': itemObj, 'addItemform': addItemform}
    return render(request, 'inventory/add2.html', context)

@login_required
def addExisting(request, key):
    obj = Item.objects.get(pk=key)
    if request.method == 'POST':
        addExistingform = addExistingForm(request.POST)
        if addExistingform.is_valid:
            obj.working += int(request.POST['quantity'])
            obj.save()
            messages.success(request, f'Added Successfully!')
            return redirect('dashboard')
    else:
        addExistingform = addExistingForm(request.POST)
    context = {'addExistingform': addExistingform}
    return render(request, 'inventory/addExisting.html', context)

@login_required
def allocate(request, key):
    obj = Item.objects.get(pk=key)
    if request.method == 'POST':
        allocateform = allocateForm(request.POST)
        if allocateform.is_valid:
            wk = int(request.POST['working']) if (request.POST['working']) else 0
            oo = int(request.POST['out_of_order']) if (request.POST['out_of_order']) else 0
            im = int(request.POST['in_maintenance']) if (request.POST['in_maintenance']) else 0
            dr = int(request.POST['room'])
            if (dr):
                dr = Room.objects.get(pk=dr)
            if(wk > obj.working or oo > obj.out_of_order or im > obj.in_maintenance or (dr == None)):
                messages.warning(request, f'Error! Enter a valid value')
                return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
            else:
                itemDestination = Item.objects.filter(room=dr).filter(
                    name=obj.name).filter(model=obj.model)
                if (itemDestination):
                    itemDestination[0].working += wk
                    itemDestination[0].out_of_order += oo
                    itemDestination[0].in_maintenance += im
                    itemDestination[0].save()
                else:
                    Item.objects.create(category=obj.category, name=obj.name, model=obj.model, working=wk, out_of_order=oo, in_maintenance=im,
                                        date_of_acquire=obj.date_of_acquire, cost_per_item=obj.cost_per_item, room=dr, extra_value=obj.extra_value)
                obj.working -= wk
                obj.in_maintenance -= im
                obj.out_of_order -= oo
                obj.save()
                if (obj.working <= 0 and obj.in_maintenance <= 0 and obj.out_of_order <= 0):
                    obj.delete()
                messages.success(request, f'Allocated Successfully!')
    else:
        allocateform = allocateForm()
    dict ={}
    dict.update({"working":obj.working,"out_of_order":obj.out_of_order,"in_maintenance":obj.in_maintenance,"room":obj.room})
    context = {'allocateform': allocateform}
    context.update(dict)
    return render(request, 'inventory/allocate.html', context)



@login_required
def delete(request,key):
    Item.objects.get(pk=key).delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))

@login_required
def edit(request,key):
    obj = Item.objects.get(pk=key)
    categoryObj = obj.category
    if request.method == 'POST':
        addItemform = addItemForm(data=request.POST,extra_fields_dict=categoryObj.extra_fields,instance = obj)
        if (addItemform.is_valid):
            addItemform.save()
            obj.save()
            if len(categoryObj.extra_fields) ==1:
                temp = categoryObj.extra_fields['field1']
                # vars()[temp] = forms.CharField(max_length=100,required=False)
                if (request.POST[temp]):
                    obj.extra_value.update({temp:request.POST[temp]})
            elif len(categoryObj.extra_fields) ==2:
                temp1 = categoryObj.extra_fields['field1']
                temp2 = categoryObj.extra_fields['field2']
                if (request.POST[temp1]):
                    obj.extra_value.update({temp1:request.POST[temp1]})
                if (request.POST[temp2]):
                    obj.extra_value.update({temp2:request.POST[temp2]})

            elif len(categoryObj.extra_fields) ==3:
                temp1 = categoryObj.extra_fields['field1']
                temp2 = categoryObj.extra_fields['field2']
                temp3 = categoryObj.extra_fields['field3']
                if (request.POST[temp1]):
                    obj.extra_value.update({temp1:request.POST[temp1]})
                if (request.POST[temp2]):
                    obj.extra_value.update({temp2:request.POST[temp2]})
                if (request.POST[temp3]):
                    obj.extra_value.update({temp3:request.POST[temp3]})
            obj.save()
            messages.success(request, f'Edit Successful!')
            return redirect('dashboard')

    else:
        addItemform = addItemForm(extra_fields_dict=categoryObj.extra_fields,instance = obj)
    context = {'addItemform':addItemform}
    return render(request,'inventory/edit.html',context)

@login_required
def editcategory(request):
    categoryObj = Categorie.objects.all()
    return render(request,'inventory/editcategory.html',{'categoryObj':categoryObj})

@login_required
def editcategory2(request,key):
    categoryObj = Categorie.objects.get(pk=key)
    if request.method == 'POST':
        form = categoryEditForm(request.POST,instance=categoryObj)
        if form.is_valid:
            try:
                form.save()
                messages.success(request, f'Edit successful!')
            except:
                messages.warning(request, f'Edit failed! Invalid name')
            return redirect('editcategory')
    else:
        form = categoryEditForm(instance=categoryObj)
    context = {'form': form}
    return render(request,'inventory/editcategory2.html',context)

@login_required
def createroom(request):
    if request.method == 'POST':
        createRoomform = addRoomForm(request.POST)
        if createRoomform.is_valid:
            try:
                createRoomform.save()
                messages.success(request, f'Room is successfully created!')
            except:
                messages.warning(request, f'Room is either invalid or already available!')
            return redirect('createroom')
    else:
        createRoomform = addRoomForm()
    context = {'createRoomform': createRoomform}
    return render(request,'inventory/createroom.html',context)

@login_required
def createfloor(request):
    if request.method == 'POST':
        createFloorform = addFloorForm(request.POST)
        if createFloorform.is_valid:
            try:
                createFloorform.save()
                messages.success(request, f'Floor is successfully created!')
            except:
                messages.warning(request, f'Floor is either invalid or already available!')

            return redirect('createfloor')
    else:
        createFloorform = addFloorForm()
    context = {'createFloorform': createFloorform}
    return render(request,'inventory/createfloor.html',context)





def advancedSearch(request):
    if not Categorie.objects.all().exists():
        return HttpResponse('There is no data in the inventory')
    if request.method == 'POST':
        floorValue = request.POST['floorSelect']
        roomValue = request.POST['roomSelect']
        categoryValue = request.POST['categorySelect']
    else:
        floorValue = 'All'
        roomValue = 'All'
        categoryValue = 'All'
        categoryValue = Categorie.objects.all()[0].category_name
    print(categoryValue)
    categoryObj = Categorie.objects.all()       #dropdown list for category section
    floorObj = Floor.objects.all()
    if (floorValue == 'All'):
        roomObj = Room.objects.all()
    else:
        roomObj = Room.objects.filter(floor = floorValue)
        
    if (roomValue != 'All'):
        # roomNumber = roomValue.split(':')
        # print(roomValue)
        tempRoomObj = Room.objects.get(room_no = int(roomValue))
        # print(floorValue)
  
        if (floorValue!='All') and (int(tempRoomObj.floor.floor) != int(floorValue)):
           roomValue = 'All'
  
    category = Categorie.objects.get(category_name = str(categoryValue))
   
    itemObj = Item.objects.filter(category = category)
    
    if (roomValue == 'All'):
        itemTempObj = itemObj
        count=0
        if (not roomObj):
            itemObj = []
        for instance in roomObj:
            if count == 0:
                itemObj = itemTempObj.filter(room = instance)
               
            else:
                itemObj |= itemTempObj.filter(room = instance)
            count = count+1
    else:
        itemObj = itemObj.filter(room = roomValue)
    if (roomValue!='All'):
        roomValue = int(roomValue)
    if (floorValue!='All'):
        floorValue = int(floorValue)
    args = {'roomObj':roomObj, 'categoryObj':categoryObj, 'floorObj':floorObj, 'itemObj':itemObj,'floorValue':floorValue, 'roomValue':roomValue, 'categoryValue':categoryValue,'category':category}
    return render(request,'inventory/advancedSearch.html',args)

@login_required
def downloadCSV(request,key):
    obj = Categorie.objects.get(pk=key)
    itemsObj = Item.objects.filter(category = obj)
    response = HttpResponse(content_type='text/csv')
    response['Inventory-Log'] = 'attachment; filename="inventory.csv"'
    writer = csv.writer(response)
    listOfFields=['Name','Model','Cost per item','Room','Date of acquirement', 'Working', 'In Maintenance', 'Out of order', 'Created', 'Last Modified']
  
    if (obj.extra_fields):
        for key,value in obj.extra_fields.items():
            listOfFields.append(value)
    writer.writerow(listOfFields)

    for obj in itemsObj:
        valueField = [obj.name,obj.model,obj.cost_per_item,obj.room,obj.date_of_acquire,obj.working,obj.in_maintenance,obj.out_of_order,obj.created,obj.last_modified]
        if (obj.extra_value):
            for key,value in obj.extra_value.items():
                valueField.append(value)
        writer.writerow(valueField)
    
    return response
    
@login_required
def chooseCategory(request):
    return render(request,'inventory/chooseCategory.html',{'categoryObj':Categorie.objects.all()})


@login_required
def downloadCSVComplete(request):
    response = HttpResponse(content_type='text/csv')
    response['Inventory-Log'] = 'attachment; filename="inventory.csv"'
    writer = csv.writer(response)
   
    for instance in Categorie.objects.all():
        itemsObj = Item.objects.filter(category = instance)
        listOfFields=['Name','Model','Cost per item','Room','Date of acquirement', 'Working', 'In Maintenance', 'Out of order', 'Created', 'Last Modified']
        if (instance.extra_fields):
            for key,value in instance.extra_fields.items():
                listOfFields.append(value)
        writer.writerow(listOfFields)
        for obj in itemsObj:
            valueField = [obj.name,obj.model,obj.cost_per_item,obj.room,obj.date_of_acquire,obj.working,obj.in_maintenance,obj.out_of_order,obj.created,obj.last_modified]
            if (obj.extra_value):
                for key,value in obj.extra_value.items():
                    valueField.append(value)
            writer.writerow(valueField)
        writer.writerow([])
        writer.writerow([])
        
    
    return response
    
@login_required
def chooseCategory(request):
    return render(request,'inventory/chooseCategory.html',{'categoryObj':Categorie.objects.all()})
