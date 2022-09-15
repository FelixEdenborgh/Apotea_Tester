import pypyodbc as odbc # pip install pypyodbc

DRIVER_NAME = 'SQL SERVER'
SERVER_NAME = 'FELIX-PC\SQLEXPRESS'
DATABASE_NAME = 'Apotea'

connection_string = f"""
    DRIVER={{{DRIVER_NAME}}};
    SERVER={SERVER_NAME};
    DATABASE={DATABASE_NAME};
    Trust_Connection=yes;
"""


conn = odbc.connect(connection_string)
print(conn)

cursor = conn.cursor()
cursor.execute('SELECT data1.zip_code as ZipCode, data1.order_number as OrderNumber, data2.sku_id as SkuID, data2.quantity as Quantity, data2.price as Price, data3.[weight] as Weight FROM data1,data2,data3 where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number and data1.order_date >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -12,current_timestamp)), 0) order by zip_code desc')

for i in cursor:
    print(i)


print(sorted(cursor.execute('SELECT data1.zip_code as ZipCode, data1.order_number as OrderNumber, data2.sku_id as SkuID, data2.quantity as Quantity, data2.price as Price, data3.[weight] as Weight FROM data1,data2,data3 where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number and data1.order_date >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -12,current_timestamp)), 0) order by zip_code desc')))

datareader = cursor.execute('SELECT data1.zip_code as ZipCode, data1.order_number as OrderNumber, data2.sku_id as SkuID, data2.quantity as Quantity, data2.price as Price, data3.[weight] as Weight FROM data1,data2,data3 where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number and data1.order_date >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -12,current_timestamp)), 0) order by zip_code desc')


p = 0
oldzip = 0
while(datareader):
    if oldzip == 0: oldzip = datareader['ZipCode']
    if datareader['ZipCode'] == oldzip:
        p += datareader['Price']
    else:
        print(oldzip, " - ", p)
        p = 0
        oldzip = datareader['ZipCode']
        p += datareader['Price']




