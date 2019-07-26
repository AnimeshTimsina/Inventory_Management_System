# Create your models here.

from django.db import models
import datetime
from django.contrib.postgres.fields import JSONField
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

def validate_single_word(value):
     if (' ' in value) == True:
        raise ValidationError(
            _('%(value)s contains space '),
            params={'value': value},
        )

# Create your models here.


class Categorie(models.Model):

    category_name = models.CharField(max_length=50, default='Generic',
                                     help_text='Enter the category of the item', validators=[validate_single_word])

    extra_fields = JSONField(blank=True, null=True)

    def __str__(self):

        return str(self.category_name)


class Item(models.Model):

    category = models.ForeignKey('Categorie', on_delete=models.CASCADE,
                                 help_text='Select the category of the equipment', null=True)

    name = models.CharField(max_length=50, default='Generic',
                            help_text='Enter the brand name of the item')

    model = models.CharField(max_length=50, default='Generic',
                             help_text='Enter the model of the item', blank=True, null=True)

    cost_per_item = models.DecimalField(
        decimal_places=2, max_digits=10, null=True, help_text='Enter the cost per item',blank=True)

    room = models.ForeignKey('Room', null=True, on_delete=models.SET_NULL,
                             help_text='Select room where it is kept')

    date_of_acquire = models.DateField(
        default=datetime.date.today, help_text='Enter the date of acquire')

    working = models.IntegerField(default=0)

    in_maintenance = models.IntegerField(default=0)

    out_of_order = models.IntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True, null=True)

    last_modified = models.DateTimeField(auto_now=True, null=True)

    extra_value = JSONField(blank=True, null=True, default={})

    def __str__(self):

        return "{}-{}".format(self.name, self.model)


class Floor(models.Model):

    floor = models.PositiveSmallIntegerField(help_text='Enter the floor', primary_key=True)

    def __str__(self):

        return str(self.floor)


class Room(models.Model):

    room_no = models.PositiveSmallIntegerField(primary_key=True, help_text='Enter the room number')

    room_name = models.CharField(max_length=50, default='Generic',
                                 help_text='Enter the name of the room')

    floor = models.ForeignKey(
        'Floor', help_text='In which floor is this room?', on_delete=models.CASCADE)

    def __str__(self):

        return "{}:{}".format(self.room_no, self.room_name)

