from peewee import *

database = PostgresqlDatabase('big_data_l1', **{'port': 32020, 'user': 'postgres', 'password': 'pass'})

class UnknownField(object):
    def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = database

class Item(BaseModel):
    en_description = TextField(null=True)
    en_label = TextField(null=True)
    item_id = AutoField()

    class Meta:
        table_name = 'item'

class ItemAliases(BaseModel):
    en_alias = TextField(null=True)
    item_id = IntegerField(null=True)

    class Meta:
        table_name = 'item_aliases'
        primary_key = False

class Page(BaseModel):
    item_id = IntegerField(null=True)
    page_id = AutoField()
    title = TextField(null=True)
    views = IntegerField(null=True)

    class Meta:
        table_name = 'page'

class Property(BaseModel):
    en_description = TextField(null=True)
    en_label = TextField(null=True)
    property_id = AutoField()

    class Meta:
        table_name = 'property'

class PropertyAliases(BaseModel):
    en_alias = TextField(null=True)
    property = ForeignKeyField(column_name='property_id', field='property_id', model=Property, null=True)

    class Meta:
        table_name = 'property_aliases'
        primary_key = False

class Statements(BaseModel):
    edge_property = ForeignKeyField(column_name='edge_property_id', field='property_id', model=Property, null=True)
    source_item_id = IntegerField(null=True)
    target_item_id = IntegerField(null=True)

    class Meta:
        table_name = 'statements'
        primary_key = False