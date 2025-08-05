show databases;
show tables;
-- it show the whole table
-- drop table blinkit_data;
select* from blinkit_data;

-- we can count the number of rows in table
select count(*) from blinkit_data;


-- altering the column name 
alter table blinkit_data rename column
ItemFatContent to Item_Fat_Content;

-- turn on safe mode

set sql_safe_updates=0;
-- cleaning the data 
update blinkit_data 
set Item_Fat_Content =
case
when Item_Fat_Content in ("LF","low Fat") then "Low Fat"
when Item_Fat_Content="reg" then "Reguler"
else Item_Fat_Content
end
-- now all rows are distinct

select distinct(Item_Fat_Content) from blinkit_data;


-- Blinkit requirements

-- KPI
-- finding the total sales in millions
-- Cast is used to calculate in millions with decimal point

select CAST(SUM(Sales)/1000000 as decimal(10,2)) as Total_sales from blinkit_data


-- 2. Find out avg of total sales
 select AVG(Sales) as avg_sales from blinkit_data


select CAST(AVG(Sales) asdecimal(10,1)) as avg_sales from blinkit_data



select count(*) as NO_of_Items from blinkit_data;


-- find out total sales for low fat

select CAST(SUM(Sales)/1000000 as decimal(10,2)) as Total_sales from blinkit_data
where Item_Fat_Content="Low Fat"

-- find out for year 2022

select CAST(SUM(Sales)/1000000 as decimal(10,2)) as Total_sales from blinkit_data
where OutletEstablishmentYear=2022


select CAST(SUM(Sales)/1000000 as decimal(10,2)) as Total_sales from blinkit_data
where OutletEstablishmentYear=2022



-- find out avg rating

select avg(Rating) from blinkit_data;


-- find avg rating with decimal and cast 



-- Granular requirements

-- Total sales by fat content

SELECT 
    Item_Fat_Content,
    CAST(SUM(Sales) AS DECIMAL (10 , 2 )) AS Total_Sales,
    CAST(AVG(Sales) AS DECIMAL (10 , 2 )) AS Total_Sales,
    COUNT(*) AS NO_of_Items,
    CAST(AVG(Rating) AS DECIMAL (10 , 2 )) AS avg_rating
FROM
    blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC
 
 
-- 2. Total sales by item type

select Item_Fat_Content,
cast(SUM(Sales) as decimal(10,2)) as Total_Sales,
cast(avg(Sales) as decimal(10,2) )as Total_Sales,
count(*) as NO_of_Items,
CAST(AVG(Rating) as decimal(10,2)) as avg_rating
 from blinkit_data
 group by Item_Fat_Content
 order by Total_Sales desc
 
 select ItemType,
cast(SUM(Sales) as decimal(10,2)) as Total_Sales,
cast(avg(Sales) as decimal(10,2) )as Total_Sales,
count(*) as NO_of_Items,
CAST(AVG(Rating) as decimal(10,2)) as avg_rating
 from blinkit_data
 group by ItemType
 order by Total_Sales desc
 
 
 
 -- fat content by outlet for total sales
 select * from blinkit_data;
 
 select OutletLocationType,Item_Fat_Content,
 cast(sum(Sales) as decimal(10,2)) as Total_sales,
 cast(AVG(Sales) as decimal(10,2)) as avg_sales,
 count(*) as No_of_items,
 cast(avg(Rating) as decimal(10,2)) as avg_rating
 from blinkit_data
 group by OutletLocationType,Item_Fat_Content
 order by Total_Sales asc
 
 
 -- 4.Fat content by outlet for total sales
 
 