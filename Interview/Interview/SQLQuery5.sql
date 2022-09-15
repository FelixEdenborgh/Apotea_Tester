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
