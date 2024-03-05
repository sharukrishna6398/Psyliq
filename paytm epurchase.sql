create database paytm;
use paytm;
create table paytm_tb(S_no varchar(50),
Name_ varchar(100),shipping_city varchar(100),
category_grouped varchar(100),category varchar(100),
sub_category varchar(100),product_gender varchar(100),
segment varchar(100),class varchar(100),Family varchar(100),
Brand varchar(100),Brick varchar(100),
Item_NM varchar(100),Color varchar(100),
Size varchar(100),Sale_Flag varchar(100),
Payment_Mode varchar(100),
Coupon_money_effective float,Coupon_Percentage int,
Quantity int,Cost_price float,Item_Prize int,
Special_price_effective int,Paid_pr_effective float,
value_CM1 float,value_CM2 float,Special_price int,
Paid_pr int);

select*from paytm_tb;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\paytm_epurchase_data_psyliq.csv'
INTO TABLE paytm_tb
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select distinct(category_grouped)as unique_categories,count(*)as no_of_unique_categories
from paytm_tb
group by category_grouped
order by unique_categories;
SELECT Shipping_city ,COUNT(Shipping_city) as Total_Orders
FROM paytm_tb
GROUP BY Shipping_city
ORDER BY Total_Orders desc
LIMIT 5 ;
SELECT * FROM paytm_tb
WHERE Category = "Electronics";

SELECT * FROM paytm_tb
WHERE Sale_Flag LIKE "Sale" ;
select*from paytm_tb;

SELECT Item_NM , Item_Prize
FROM paytm_tb
ORDER BY Item_Prize DESC
 LIMIT 1 ;

SELECT Category , SUM(Item_Prize) as Total_Sales_Value
FROM paytm_tb
Group by Category ;
SELECT Category , SUM(Item_Prize) as Total_Sales
FROM paytm_tb
Group by Category
ORDER BY Total_Sales;


SELECT Family ,COUNT(Family)asTotal_Products_in_Family
FROM paytm_tb
Group by Family ;

select *
 from paytm_tb
 where Payment_Mode in ("COD","Prepaid");
 
 SELECT Product_Gender , AVG(Quantity) as Total_Quantity_Sold
FROM paytm_tb
WHERE Category_Grouped ="Apparels"
GROUP BY Product_Gender;

SELECT *, ROUND((Value_CM1/Value_CM2),2) AS Ration
FROM paytm_tb
ORDER BY Ration DESC
LIMIT 5 ;

SELECT Class, SUM(Item_Prize) AS Total_Sales
FROM paytm_tb
Group by Class
Order by Total_Sales DESC
LIMIT 3 ;

select Color
from paytm_tb
where Item_NM ="your specific Item_NM";

SELECT Category , SUM(coupon_money_effective) AS Total_Coupon_Money ,SUM(Coupon_Percentage) AS
Total_Coupon_Percentage
FROM paytm_tb
WHERE Category = "Electronics" ;

select extract(Month from Sale_Flag) as Month,
extract(Year from Sale_Flag) as Year , Sum(Paid_pr) as Total_Sales
from paytm_tb
group by Month,Year
order by Total_Sales desc
limit 1;

SELECT Segment , SUM(Item_Prize) AS Total_Sales
FROM paytm_tb
GROUP BY Segment;

SELECT Item_NM,AVG(Item_Prize)
FROM paytm_tb
WHERE Sale_Flag="ON Sale"
Group by Item_NM ;

select Family , Brand , Item_NM,Paid_pr
from paytm_tb
where paid_pr >( select avg(paid_pr)
 from paytm_tb)
 group by Family,Brand , Item_NM,Paid_pr
 order by Paid_pr desc ;
 
SELECT DISTINCT Color ,SUM(Item_Prize) AS Total_Sales
FROM paytm_tb
WHERE Category_Grouped = "Apparels"
GROUP BY Color ;