# Generated by Django 3.0.8 on 2020-07-11 02:38

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Doorway',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=100)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='DPU',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('dpu_id', models.PositiveIntegerField(unique=True)),
                ('doorway', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='dpu.Doorway')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='DPUEvent',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('timestamp', models.DateTimeField()),
                ('direction', models.SmallIntegerField(help_text='1 designates and entry; -1 designates an exit.')),
                ('dpu', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='dpu.DPU')),
            ],
            options={
                'ordering': ['-timestamp'],
            },
        ),
        migrations.CreateModel(
            name='Space',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=100)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='SpaceOccupancy',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('status', models.CharField(choices=[('PENDING', 'Pending'), ('SETTLED', 'Settled')], default='PENDING', max_length=30)),
                ('occupancy', models.IntegerField(default=0, help_text='The total occupancy of this space as of this record’s timestamp.')),
                ('dpu_event', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='dpu.DPUEvent')),
                ('space', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='dpu.Space')),
            ],
            options={
                'ordering': ['-dpu_event__timestamp'],
            },
        ),
        migrations.AddField(
            model_name='dpu',
            name='entry_space',
            field=models.ForeignKey(blank=True, help_text='An entry (+1) on this DPU represents an entry into this space. Leave blank for an untracked space.', null=True, on_delete=django.db.models.deletion.PROTECT, related_name='entry_dpus', to='dpu.Space'),
        ),
        migrations.AddField(
            model_name='dpu',
            name='exit_space',
            field=models.ForeignKey(blank=True, help_text='An exit (-1) on this DPU represents an exit from this space. Leave blank for an untracked space.', null=True, on_delete=django.db.models.deletion.PROTECT, related_name='exit_dpus', to='dpu.Space'),
        ),
    ]