# Generated by Django 2.2.3 on 2019-08-18 09:14

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('inventory', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='floor',
            name='floor',
            field=models.PositiveSmallIntegerField(help_text='Enter the floor number', validators=[django.core.validators.MinValueValidator(0)]),
        ),
        migrations.AlterField(
            model_name='item',
            name='cost_per_item',
            field=models.DecimalField(blank=True, decimal_places=2, help_text='Enter the cost per item', max_digits=10, null=True, validators=[django.core.validators.MinValueValidator(0)]),
        ),
        migrations.AlterField(
            model_name='item',
            name='in_maintenance',
            field=models.IntegerField(default=0, validators=[django.core.validators.MinValueValidator(0)]),
        ),
        migrations.AlterField(
            model_name='item',
            name='out_of_order',
            field=models.IntegerField(default=0, validators=[django.core.validators.MinValueValidator(0)]),
        ),
        migrations.AlterField(
            model_name='item',
            name='working',
            field=models.IntegerField(default=0, validators=[django.core.validators.MinValueValidator(0)]),
        ),
        migrations.AlterField(
            model_name='room',
            name='room_no',
            field=models.PositiveSmallIntegerField(help_text='Enter the room number', validators=[django.core.validators.MinValueValidator(0)]),
        ),
        migrations.AlterField(
            model_name='subitem',
            name='cost_per_item',
            field=models.DecimalField(blank=True, decimal_places=2, help_text='Enter the cost per sub-item', max_digits=10, null=True, validators=[django.core.validators.MinValueValidator(0)]),
        ),
        migrations.AlterField(
            model_name='subitem',
            name='in_maintenance',
            field=models.IntegerField(default=0, validators=[django.core.validators.MinValueValidator(0)]),
        ),
        migrations.AlterField(
            model_name='subitem',
            name='out_of_order',
            field=models.IntegerField(default=0, validators=[django.core.validators.MinValueValidator(0)]),
        ),
        migrations.AlterField(
            model_name='subitem',
            name='working',
            field=models.IntegerField(default=0, validators=[django.core.validators.MinValueValidator(0)]),
        ),
    ]