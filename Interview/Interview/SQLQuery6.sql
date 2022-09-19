/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ZipCode]
      ,[OrderNumber]
      ,[SkuID]
      ,[Quantity]
      ,[Price]
      ,[Weight]
      ,[shipping_method_id]
  FROM [Apotea].[dbo].[tempTable2]


  select * from tempTable2


  select ZipCode, shipping_method_id, AVG(Price) as Average_Price, AVG([Weight]) as Average_Weight, SUM(Quantity) as SumOfQuantity
  from tempTable2
  group by shipping_method_id, ZipCode
  order by SumOfQuantity desc

  select ZipCode, shipping_method_id, AVG(Price) 
  from tempTable2
  group by ZipCode or !shipping_method_id


  select shipping_method_id, STRING_AGG(Distinct ZipCode) as shipping_method_id, AVG(Price) as Average_Price, AVG([Weight]) as Average_Weight, SUM(Quantity) as SumOfQuantity
  from tempTable2
  group by shipping_method_id
  order by SumOfQuantity desc

  select shipping_method_id, ZipCode, AVG(Price) as Average_Price, AVG([Weight]) as Average_Weight, SUM(Quantity) as Sum_Of_Quantity
  from tempTable2
  group by shipping_method_id, ZipCode
  order by Sum_Of_Quantity desc

select ZipCode, shipping_method_id, AVG(Price) as Average_Price, AVG([Weight]) as Average_Weight, SUM(Quantity) as Totaly_Orders 
from tempT 
group by ZipCode, shipping_method_id 
order by Totaly_Orders desc