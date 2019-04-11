# Generated by Django 2.0.8 on 2019-03-14 13:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('inventory', '0003_auto_20190314_0951'),
    ]

    operations = [
        migrations.AlterField(
            model_name='item',
            name='category',
            field=models.ForeignKey(help_text='Select the category of the equipment', null=True, on_delete=django.db.models.deletion.CASCADE, to='inventory.Categorie'),
        ),
    ]