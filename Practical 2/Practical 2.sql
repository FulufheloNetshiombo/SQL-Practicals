--1. INNER JOIN: Orders with Customer and Product Names
--Question:
--List all orders along with the customer name and product name.
--Expected Output Columns:
--• OrderID, OrderDate, CustomerName, ProductName, Quantity

Select A.orderid,A.ORDERDATE, B.CUSTOMERNAME,C.PRODUCTNAME,A.QUANTITY
from practical2.shop.orders_large AS A
INNER join practical2.shop.customers_large AS B on A.customerid=B.CUSTOMERID
INNER JOIN PRACTICAL2.SHOP.PRODUCTS_LARGE AS C ON A.PRODUCTID=C.PRODUCTID;

--2. INNER JOIN: Customers Who Placed Orders
--Question:
--Which customers have placed at least one order?
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate
select A.customerID, B.CustomerName, B.Country, A.OrderID,A.OrderDate
FROM ORDERS_LARGE AS A
INNER JOIN CUSTOMERS_LARGE AS B  on A.customerid=B.customerid
Inner Join products_large AS C ON A.PRODUCTID = C.PRODUCTID
WHERE QUANTITY>1;

--3. LEFT JOIN: All Customers and Their Orders
--Question:
--List all customers and any orders they might have placed. Include customers who have
--not placed any orders.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

select A.customerid, A.customername, A.country,B.orderID,B.orderdate, B.ProductID, B.Quantity
from customers_large AS A
LEFT join orders_large as B ON A.customerid=B.customerid;

--4. LEFT JOIN: Product Order Count
--Question:
--List all products and how many times each was ordered (if any).
--Expected Output Columns:
--• ProductID, ProductName, TotalOrders
--(TotalOrders is the count of how many times the product appears in orders)

SELECT A.PRODUCTID, A.ProductName, Count(B.orderID) AS TotalOrders
From products_large as A
LEFT Join orders_large as B on A.PRODUCTID = B.PRODUCTID
GROUP By A.PRODUCTID, A.PRODUCTNAME;



--5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered)
--Question:
--Find all orders along with product details, including any products that might not have
--been ordered.
--Expected Output Columns:
--• OrderID, OrderDate, ProductID, ProductName, Price, Quantity
SELECT A.ORDERID, A.ORDERDATE, B.PRODUCTID, B.PRODUCTNAME, B.PRICE ,A.QUANTITY
FROM ORDERS_LARGE AS A
RIGHT JOIN PRODUCTS_LARGE AS B ON A.PRODUCTID = B.PRODUCTID;

--6. RIGHT JOIN: Customer Info with Orders (Include All Customers)
--Question:
--Which customers have made orders, and include customers even if they have never
--placed an order.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT B.CUSTOMERID, B.CUSTOMERNAME, B.COUNTRY, A.ORDERID, A.ORDERDATE, A.PRODUCTID, A.QUANTITY
FROM ORDERS_LARGE AS A
RIGHT JOIN CUSTOMERS_LARGE AS B ON A.CUSTOMERID=B.CUSTOMERID;

--7. FULL OUTER JOIN: All Customers and All Orders
--Question:
--List all customers and orders, showing NULLs where customers have not ordered or
--where orders have no customer info.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT A.CUSTOMERID, A.CUSTOMERNAME,A.COUNTRY, B.ORDERID, B.ORDERDATE, B.PRODUCTID, B.QUANTITY
FROM CUSTOMERS_LARGE AS A
FULL OUTER JOIN ORDERS_LARGE AS B ON A.CUSTOMERID = B.CUSTOMERID;

--8. FULL OUTER JOIN: All Products and Orders
--Question:
--List all products and orders, showing NULLs where products were never ordered or
--orders are missing product info.
--Expected Output Columns:
--• ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

SELECT A.PRODUCTID, A.PRODUCTNAME, A.PRICE, B.ORDERID, B.ORDERDATE, B.CUSTOMERID, B.QUANTITY
FROM PRODUCTS_LARGE AS A 
FULL OUTER JOIN ORDERS_LARGE AS B ON A.PRODUCTID = B.PRODUCTID;





















































