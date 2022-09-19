SELECT data1.zip_code, data1.order_date, data1.order_number, data2.sku_id, data2.quantity, data2.price, data3.[weight], SUM(data2.price) from data1,data2,data3 where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number GROUP BY zip_code

SELECT data1.zip_code, data1.order_date, data1.order_number, data2.sku_id, data2.quantity, data2.price, data3.sku_id, data3.[weight] from data1,data2,data3 where data2.sku_id=data3.sku_id and data2.order_number=data1.order_number

SELECT data1.zip_code, data1.order_date, data1.order_number, data2.sku_id, data2.quantity, data2.price, data3.sku_id, data3.[weight] from data1,data2,data3 where data2.sku_id=data3.sku_id and data2.order_number=data1.order_number GROUP BY data1.zip_code




SELECT data1.zip_code, data1.order_date, data1.order_number, data1.first_name, data1.last_name, data2.sku_id, data2.quantity, data2.price, data3.article_name, data3.[weight] from data1,data2,data3 where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number

select data1.zip_code, data1.order_date, data1.order_number, data1.first_name, data1.last_name, data2.sku_id,data2.quantity,data2.price, data3.article_name, data3.[weight] 
	from data1,data2,data3 
		where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number

select top 100 data1.zip_code, data1.order_date, data1.order_number, data1.first_name, data1.last_name, data2.sku_id,data2.quantity,data2.price, data3.article_name, data3.[weight]
	from data1, data2, data3
		inner join data2 on data2.sku_id = data3.sku_id
		inner join order_number on data2.order_number = data1.order_number

select data1.order_number, data1.zip_code, data2.quantity, data3.article_name, data3.[weight] from data1
	inner join data2 on data1.order_number = data2.order_number
	inner join data3 on data2.sku_id = data3.sku_id
		where data1.order_number = 2999000

select data1.first_name, data1.order_number, count(data1.zip_code) as snopp
	from data1
		group by data1.order_number, data1.first_name
			order by count(data1.zip_code);

select data1.zip_code, count(*) as number
	from data1
		group by data1.zip_code
			order by number desc

select data1.zip_code, count(*) as number
	from data1
		where data1.order_date >= convert(datetime, '2021-12-08 22:26:03')
--		where data1.order_date >= dateadd(DD, -60, getdate())
		group by data1.zip_code
			order by number desc

			select getdate()



SELECT data1.zip_code as ZipCode, data1.order_number as OrderNumber, data2.sku_id as SkuID, data2.quantity as Quantity, data2.price as Price, data3.[weight] as Weight 
	FROM data1,data2,data3 
		where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number and data1.order_date >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -12,current_timestamp)), 0) 
			order by zip_code desc

Create table tempT(ZipCode int, OrderNumber bigint, SkuID int, Quantity tinyint, Price smallint, [Weight] smallint, shipping_method_id smallint)
insert into tempT(ZipCode, OrderNumber, SkuID, Quantity, Price, [Weight]) SELECT data1.zip_code as ZipCode, data1.order_number as OrderNumber, data1.shipping_method_id as shipping_method_id, data2.sku_id as SkuID, data2.quantity as Quantity, data2.price as Price, data3.[weight] as Weight FROM data1,data2,data3 where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number and data1.order_date >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -12,current_timestamp)), 0) order by zip_code desc



Create table tempTable2(ZipCode int, OrderNumber bigint, SkuID int, Quantity tinyint, Price smallint, [Weight] smallint, shipping_method_id smallint)
insert into tempT(ZipCode, OrderNumber, shipping_method_id, SkuID, Quantity, Price, [Weight]) SELECT data1.zip_code as ZipCode, data1.order_number as OrderNumber, data1.shipping_method_id as shipping_method_id, data2.sku_id as SkuID, data2.quantity as Quantity, data2.price as Price, data3.[weight] as Weight FROM data1,data2,data3 where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number and data1.order_date >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -12,current_timestamp)), 0) order by zip_code desc

Select * from tempT order by ZipCode desc


select AVG(Price)
from tempTable
group by Quantity

select AVG([weight])
from tempTable
group by Quantity


select * from tempTable order by ZipCode desc
union 
select TOP 10 ZipCode
from tempTable
order by ZipCode desc

select * from tempTable order by count(*) order by ZipCode desc

select top 1 PERCENT ZipCode, Price from tempTable
union
select AVG(Price) from tempTable group by Quantity


select zip_code, order_number from data1
union
select order_number, sku_id, quantity, price from data2
union
select [weight] from data3
order by order_number


select ZipCode, AVG(Price) as Average_Price, AVG([Weight]) as Average_Weight
from tempTable
group by ZipCode
order by ZipCode desc

select ZipCode, Quantity, OrderNumber, AVG(Price) as Average_Price, AVG([Weight]) as Average_Weight, SUM(Quantity) as Totaly_Orders
from tempTable
group by Quantity, ZipCode, OrderNumber
order by Totaly_Orders desc


select ZipCode, SUM(Quantity) as total_orders, Quantity as howMany, COUNT(Quantity) as counting
from tempTable
group by ZipCode, Quantity
order by ZipCode desc

select Zipcode, Quantity, COUNT(ZipCode, Quantity)
from tempTable
group by ZipCode, Quantity
order by Quantity desc

select ZipCode, count(Quantity)
from tempTable
group by ZipCode
order by 2 desc



select ZipCode, sum(Quantity) as SumOfQuantity
from tempTable
group by ZipCode
order by SumOfQuantity desc



select ZipCode, AVG(Price) as Average_Price, AVG([Weight]) as Average_Weight, SUM(Quantity) as SumOfQuantity
from tempTable2
group by ZipCode
order by SumOfQuantity desc
