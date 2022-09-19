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

-- vilka postnummer som under de senaste 6 månaderna haft hög försäljning i frågan om totalt antal beställningar.
select data1.zip_code, count(*) as number
	from data1
		where data1.order_date >= convert(datetime, '2021-12-08 22:26:03')
--		where data1.order_date >= dateadd(DD, -60, getdate())
		group by data1.zip_code
			order by number desc

			select getdate()

select data1.zip_code, count(*) as number from data1 where data1.order_date >= convert(datetime, '2021-12-08 22:26:03') group by data1.zip_code order by number desc

SELECT data1.zip_code as ZipCode, data1.order_number as OrderNumber, data2.sku_id as SkuID, data2.quantity as Quantity, data2.price as Price, data3.[weight] as Weight FROM data1,data2,data3 where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number and data1.order_date >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -12,current_timestamp)), 0) order by zip_code desc


select @@SERVERNAME

select data1.zip_code, count(*) as buy_orders
	from data1
		where data1.order_date >= convert(datetime, '2021-12-08 22:26:03')
--		where data1.order_date >= dateadd(DD, -60, getdate())
		group by data1.zip_code
		union
		select data2.price, COUNT(*) as total_price
		from data2
		group by data2.price
		order by buy_orders desc;




select data1.zip_code, COUNT(*) as buy_orders
	from data1
	where data1.order_date >= convert(datetime, '2021-12-08 22:26:03')
	Group by data1.zip_code
	union
	select data2.price, COUNT(*) as total_price
	from data2
	group by data2.price
	order by count(*) desc;


select * from data1
select * from data2
select * from data3

select data1.zip_code, data1.order_number, data1.order_date, data2.price, data2.quantity from data1
inner join data2 on
data1.order_number = data2.order_number
where data1.order_date >= convert(datetime, '2021-12-08 22:26:03')
union
	select data1.zip_code, COUNT(*) by buy_orders
	from data1




SELECT data1.zip_code as ZipCode, data1.order_date as OrderDate, data1.order_number as OrderNumber, data2.order_number as OrderNumb2Two, data2.sku_id as SkuID, data2.quantity as Quantity, data2.price as Price, data3.article_name as articleName, data3.[weight] as Weight 
FROM data1,data2,data3 
where data3.sku_id=data2.sku_id and data2.order_number=data1.order_number and data1.order_date >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -12,current_timestamp)), 0) 
order by zip_code 


Select * from tempTable2 order by ZipCode desc