use retail;
-- 1.1 Define meta data in mysql workbench or any other SQL tool
describe onlineretail;



-- 1.2 What is the distribution of order values across all customers in the dataset?
-- cleaning data so that the total sales should be positive.alter
SET SQL_SAFE_UPDATES = 0;
DELETE FROM onlineretail
WHERE customerid IN (
    SELECT customerid
    FROM (
        SELECT customerid, SUM(quantity * unitprice) AS TotalAmountSpent
        FROM onlineretail
        GROUP BY customerid
        HAVING TotalAmountSpent < 0
    ) AS temp
);
-- select  count(customerid) from onlineretail;

select customerid, min(quantity*unitprice)as MinPurchase,max(quantity*unitprice) as MaxPurchase,round(avg(quantity*unitprice),2) as AvgPurchase
,count(quantity*unitprice) as TotalPurchases,sum(quantity*unitprice) as TotalAmountSpent
from onlineretail
group by customerid
order by totalamountspent;


-- 1.3 How many unique products has each customer purchased?
select customerid, count(distinct stockcode) as 'Distinct Products'
from onlineretail
group by customerid;


-- 1.4 Which customers have only made a single purchase from the company?
select customerid
from onlineretail
group by customerid
having count(distinct stockcode)=1;

-- 1.5 Which products are most commonly purchased together by customers in the dataset?
use sales;
select count(invoiceno) from online_retail;
select t1.stockcode as product1, t2.stockcode as product2,count(*) as TimesPurchasedTogether
from online_retail t1
join online_retail t2
 on t1.invoiceno=t2.invoiceno
 and t1.stockcode>t2.stockcode
 where t1.customerid=t2.customerid
 group by t1.stockcode,t2.stockcode
 order by TimesPurchasedTogether desc;
 
--  2.1 Group customers into segments based on their purchase frequency, 
-- such as high, medium, and low frequency customers.
SELECT customerid,count(invoiceno) as frequency,
case
when count(invoiceno)>100 then 'High Frequency'
when count(invoiceno) between 30 and 100 then 'Medium Frequency'
else 'Low Frequency'
end as FrequencySegment
from onlineretail
group by customerid;

-- 2.2 Calculate the average order value for each country to identify where your most valuable customers are located.
select country, round(avg(quantity*unitprice),2) as AvgMonetaryValue
from onlineretail
group by country
order by AvgMonetaryValue;








-- 2.3  Identify customers who haven't made a purchase in a specific period (e.g., last 6 months) to assess churn.
use sales;
describe online_retail;
SET SQL_SAFE_UPDATES = 0;
UPDATE online_retail
SET InvoiceDate = STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i');
ALTER TABLE online_retail MODIFY COLUMN InvoiceDate DATETIME;


select customerid,max(invoicedate) as LastPurchaseDate,
datediff((select max(InvoiceDate) from onlineretail),max(invoicedate)) as DaysSinceLastPurchase
from online_retail
group by customerid
having DaysSinceLastPurchase >180 -- for 6 months
order by lastPurchasedate;







-- 2.4 Determine which products are often purchased together by calculating the correlation between product purchases.
use sales;
select invoiceno,stockcode,
count(*) as ProductCount
from online_retail
group by invoiceno,StockCode;
select invoiceno,stockcode,
case when sum(quantity)>0 then 1 else 0 end as purchased
from online_retail
group by InvoiceNo, stockcode;
select
p1.stockcode as Product1,p2.stockcode as Product2,
sum(p1.purchased*p2.purchased) as CoOccurence
from(
select invoiceNo,StockCode,
case when sum(quantity)>0 then 1 else 0 end as purchased
from online_retail
group by InvoiceNo,StockCode
) p1
join(
select invoiceNo,StockCode,
case when sum(quantity)>0 then 1 else 0 end as purchased
from online_retail
group by InvoiceNo,StockCode
) p2
on p1.invoiceno=p2.invoiceno
where p1.stockcode<>p2.stockcode
group by p1.stockcode,p2.stockcode;

select stockcode,
sum(purchased) as PurchaseCount
from
(select invoiceNo,Stockcode,
case when sum(quantity)>0 then 1 else 0 end as purchased
from online_retail
group by invoiceno,stockcode) as subquery
group by stockcode;

with CoOccurence as(
select
p1.StockCode as ProductA,
p2.StockCode as ProductB,
sum(p1.purchased*p2.purchased) as CoOccurence
from(
select InvoiceNo,StockCode,
case when sum(quantity)>0 then 1 else 0 end as purchased
from online_retail
group by InvoiceNo,StockCode
) p1
join(
select InvoiceNo,StockCode,
case when sum(quantity)>0 then 1 else 0 end as purchased
from online_retail
group by InvoiceNo,StockCode
) p2
on p1.InvoiceNo=p2.InvoiceNo
where p1.StockCode<>p2.StockCode
group by p1.StockCode,p2.StockCode
),
ProductPurchasedCounts As (
select StockCode,
sum(purchased) as PurchasedCount
from
(select InvoiceNo,StockCode,
case when sum(quantity) >0 then 1 else 0 end as purchased
from online_retail
group by StockCode,InvoiceNo
)as inner_counts
group by StockCode
)
select 
CoOccurence.ProductA,
CoOccurence.ProductB,
CoOccurence.CoOccurence,
(CoOccurence.CoOccurence)/SQRT(pcA.PurchasedCount*pcB.PurchasedCount) as Correlation
from 
CoOccurence
join ProductPurchasedCounts pcA on CoOccurence.ProductA = pcA.StockCode
join ProductPurchasedCounts pcB on CoOccurence.ProductB = pcB.StockCode;







-- 2.5   Explore trends in customer behavior over time, such as monthly or quarterly sales patterns.
select 
year(invoicedate) as Year,
quarter(invoicedate)as Quarter,
sum(quantity*unitprice) as totalspent
from onlineretail
group by Year,Quarter
order by Year, Quarter;
-- Checking customer spending each quater of year
SELECT customerid,
year(invoicedate) as Year,
quarter(invoicedate)as Quarter,
sum(quantity*unitprice) as totalspent
from onlineretail
group by customerid,Year,Quarter
order by Year, Quarter,totalspent desc;


















 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



-- Calculate the average order value for each country to identify where your most valuable customers are located.
select country, avg(quantity*unitprice) as 'AverageSale'
from onlineretail 
group by country
order by AverageSale;

 -- Identify customers who haven't made a purchase in a specific period (e.g., last 6 months) to assess churn.
 
 select count(distinct(customerid)) 
 from onlineretail
 where invoicedate not between '2010-12-01' and '2011-06-01';
 
 

 
 
 
 
 
 



