
CREATE TABLE SHOP(
SHOPID INT PRIMARY KEY, 
	SHOPNAME VARCHAR(25)
)
INSERT INTO SHOP VALUES (1,'Amal Stores'), (2,'Jyothi Stores'), (3,'Indira Stores') 
CREATE TABLE ITEM(ITEMID INT PRIMARY KEY,
	ITEMNAME VARCHAR(20)
)
INSERT INTO ITEM VALUES (1,'Bar-One'), (2,'KitKat'), (3,'MilkyBar'), (4,'Munch')

CREATE TABLE details (
   ID INT PRIMARY KEY IDENTITY,
    ShopID INT,
    ItemID INT,
    Quantity INT,
	UnitPrice DECIMAL(10, 2),
	SaleDate DATE,
    FOREIGN KEY (ShopID) REFERENCES SHOP (SHOPID),
    FOREIGN KEY (ItemID) REFERENCES ITEM (ITEMID)
);

INSERT INTO details VALUES
   ( 1, 1, 100, 10.00,'05-Oct-2018'),
    ( 1, 2, 200, 15.00,'05-Oct-2018'),
    ( 1, 3, 50, 5.00,'05-Oct-2018'),
    ( 1, 4, 150, 10.00,'05-Oct-2018'),
    (2, 1, 10 * 28, 280.00,'10-Oct-2018'),
    ( 2, 2, 30 * 28, 420.00,'10-Oct-2018'),
    (2, 3, 40 * 28, 140.00,'10-Oct-2018'),
    ( 2, 4, 20 * 28, 280.00,'10-Oct-2018'),
    (3, 1, 50 * 28, 280.00,'15-Sep-2018'),
    (3, 2, 70 * 28, 420.00,'15-Sep-2018'),
    (3, 3, 30 * 28, 140.00,'10-Oct-2018'),
    (1, 1, 150, 10.00,'15-Sep-2018'),
    (1, 2, 250, 15.00,'15-Sep-2018'),
    ( 1, 4, 200, 10.00,'10-Oct-2018');

select * from item
select * from details
select * from shop

q.1.2

SELECT TOP(1) i.itemname, SUM(d.quantity * d.unitprice) AS Revenue
FROM details d JOIN item i ON d.itemid =i.itemid
WHERE datepart(m, d.saledate) = 10
GROUP BY i.itemname
ORDER BY Revenue DESC

q.1.3
SELECT TOP(1) i.itemname, SUM(d.quantity) AS TotalQuantity
FROM details d JOIN item i ON d.itemid = i.itemid
WHERE datepart(M,d.SaleDate) = 10 and d.shopid=1
GROUP BY i.itemname ORDER BY TotalQuantity DESC

--	q.1.4
SELECT i.itemname,SUM(d.Quantity * d.UnitPrice) AS Revenue
FROM details d  JOIN Item I ON d.ItemID = I.ItemID
WHERE datepart(m,d.SaleDate) = 10
GROUP BY i.itemName
HAVING SUM(d.Quantity * d.UnitPrice) > 10000
ORDER BY Revenue DESC;

--q.1.5
SELECT TOP(1) s.shopname, sum(d.quantity*d.unitprice) AS revenue
FROM details d join shop s ON s.shopid=d.shopid
WHERE datepart(m,d.SaleDate) = 10
GROUP BY s.shopname
ORDER BY revenue DESC
    

