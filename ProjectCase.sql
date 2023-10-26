--Final Project Database
--2502030145 - Sammodaka Wijaya


--1.	Query to create the database system. (.sql)
CREATE DATABASE JPGamingStore

USE JPGamingStore

CREATE TABLE Staff (
	StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) NOT NULL,
	StaffEmail VARCHAR(50) NOT NULL,
	StaffPhoneNumber VARCHAR(50),
	StaffDOB DATE NOT NULL,
	StaffGender VARCHAR(50) NOT NULL CHECK(StaffGender IN ('Female', 'Male')),
	StaffAddress VARCHAR(50) NOT NULL CHECK(LEN(StaffAddress) > 1),
	StaffSalary VARCHAR (50) NOT NULL

);


DROP TABLE Staff

CREATE TABLE Vendor (
	VendorID CHAR(5) PRIMARY KEY CHECK (VendorID LIKE 'VE[0-9][0-9][0-9]'),
	VendorName VARCHAR(50) NOT NULL CHECK(LEN(VendorName) > 3),
	VendorEmail VARCHAR(50) NOT NULL,
	VendorPhoneNumber VARCHAR(50),
	VendorDOB DATE NOT NULL,
	VendorGender VARCHAR(50) NOT NULL CHECK(VendorGender IN ('Female', 'Male')),
	VendorAddress VARCHAR(50) NOT NULL
	
);

DROP TABLE Vendor

CREATE TABLE ComponentTransaction (
	ComponentTransactionID CHAR(5) PRIMARY KEY CHECK (ComponentTransactionID LIKE 'CT[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	VendorID CHAR(5) FOREIGN KEY REFERENCES Vendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ComponentID CHAR(5) FOREIGN KEY REFERENCES Component(ComponentID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL,
	Quantity INT NOT NULL CHECK(Quantity > 0)
);

DROP TABLE ComponentTransaction

CREATE TABLE Component (
	ComponentID CHAR(5) PRIMARY KEY CHECK (ComponentID LIKE 'CO[0-9][0-9][0-9]'),
	ComponentName VARCHAR(50) NOT NULL,
	ComponentDescription VARCHAR(50) NOT NULL,
	ComponentPrice INT NOT NULL CHECK(ComponentPrice > 5000)

);

DROP TABLE Component

CREATE TABLE Customer (
	CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL CHECK(LEN(CustomerName) > 3),
	CustomerEmail VARCHAR(50) NOT NULL CHECK(CustomerEmail LIKE '%@yahoo.com' OR CustomerEmail LIKE '%@gmail.com'),
	CustomerPhoneNumber VARCHAR(50) NOT NULL CHECK(CustomerPhoneNumber LIKE '+62%'),
	CustomerDOB DATE NOT NULL,
	CustomerGender VARCHAR(50) NOT NULL CHECK(CustomerGender IN ('Female', 'Male')),
	CustomerAddress VARCHAR(50) NOT NULL CHECK(LEN(CustomerAddress) > 1)
);


DROP TABLE Customer


DROP TABLE Customer

CREATE TABLE ProductTransaction (
	ProductTransactionID CHAR(5) PRIMARY KEY CHECK (ProductTransactionID LIKE 'PT[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ProductID CHAR(5) FOREIGN KEY REFERENCES Product(ProductID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL,
	Quantity INT NOT NULL CHECK(Quantity > 0)

	);

	DROP TABLE ProductTransaction

CREATE TABLE Product (
	ProductID CHAR(5) PRIMARY KEY CHECK (ProductID LIKE 'PR[0-9][0-9][0-9]'),
	ProductCategoryID CHAR(5) FOREIGN KEY REFERENCES ProductCategory(ProductCategoryID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ProductName VARCHAR(50) NOT NULL,
	ProductDescription VARCHAR(50) NOT NULL,
	ProductWeight VARCHAR(50) NOT NULL CHECK(ProductWeight BETWEEN 1 AND 40),
	ProductPrice INT NOT NULL CHECK(ProductPrice > 5000)
);

DROP TABLE Product

CREATE TABLE ProductCategory (
	ProductCategoryID CHAR(5) PRIMARY KEY CHECK (ProductCategoryID LIKE 'PC[0-9][0-9][0-9]'),
	CategoryName VARCHAR(50) NOT NULL
);

DROP TABLE ProductCategory

--3.	Query to insert data into tables. (.sql)
--4.	Query to simulate the transactions processes. (.sql)
INSERT INTO Staff Values
('ST001','Henri Putra','henput@gmail.com','+628341465428','2000-06-06','male','Cakung, Jakarta Timur',8200000),
('ST002','Bambang Herlambang','kipit@gmail.com','+628256374281','2000-06-06','male','BSD, Tanggerang Selatan',9200000),
('ST003','Mike Hartone','Harton10@gmail.com','+6287648591923','2000-06-06','male','Cilandak, Jakarta Selatan',3500000),
('ST004','Felicia Monroe','Angelicia@gmail.com','+628934287319','2000-06-06','female','Menteng, Jakarta Pusat',5000000),
('ST005','Dono Sudirman','Blackmamba@gmail.com','+628153267234','2000-06-06','male','Tebet, Jakarta Selatan',2500000),
('ST006','Dini Diningrat','Dinigcantik@gmail.com','+628534687210','2000-06-06','female','Bandung, Jawa Barat',6000000),
('ST007','Siti Juliandra','SitiJuliandra@gmail.com','+628843900192','2000-06-06','female','Banjar, Jawa Barat',8000000),
('ST008','Wisnu Pranata','Draxc@gmail.com','+628994284103','2000-06-06','male','Medan, Sumatra Utara',9000000),
('ST009','Diki Budiono','Tampan@gmail.com','+628000627319','2000-06-06','male','Malang, Jawa Timur',7102000),
('ST000','Raka Baswedan','rakaa@gmail.com','+628000234319','2001-05-02','male','Sumedang, Jawa Timur',8000000)


INSERT INTO Vendor Values
('VE001','Henri Putra','henput@gmail.com','+628341465428','2001-03-06','Male','Cakung, Jakarta Timur'),
('VE002','Shirley Jaya','ShirleyJ@gmail.com','+628342342428','1999-03-06','Female','Cengkareng, Jakarta Barat'),
('VE003','Bambang Nur','BambangN@gmail.com','+62834456428','1997-06-12','Male','Kalideres, Jakarta Barat'),
('VE004','Visaka Rey','visakarey@gmail.com','+6282345428','1998-10-06','Female','Duri Kosambi, Jakarta Barat'),
('VE005','Hendry Tan','Hendrytan@gmail.com','+6284565428','1990-10-06','Male','Semanan, Jakarta Barat'),
('VE006','Hanabi Che','Hanabice@gmail.com','+628344568','2005-03-10','Female','Sudirman, Jakarta Pusat'),
('VE007','reyner bass','Reynerbs@gmail.com','+62834456428','2003-06-01','Male','Tangerang, Jakarta Barat'),
('VE008','Christian sutanto','Christianss@gmail.com','+62834145628','2002-03-01','Male','Cakung, Jakarta Timur'),
('VE009','felix suryana','felixsur@gmail.com','+62834146458','2000-07-06','Male','Cakung, Jakarta Timur')
('VE000','Jaya Jaya','jayaj@gmail.com','+6283412345428','2003-03-06','Male','Capung, Jakarta Pusat')


INSERT INTO Customer Values
  ('CU001','Bagas sulaiman','Bagas@gmail.com','+6284574457','2001-05-10','male','Serang Banten'),
  ('CU002','Cinta Laura','Laura@gmail.com','+62864375821','2001-06-04','Female','Bandung Jawa Barat'),
  ('CU003','Dimas sasi','Dims@gmail.com','+6287545321789','2001-01-08','male','Semarang Jawa Tengah'),
  ('CU004','Genedius Montana','Montana@gmail.com','+628000666723','2001-08-01','male','Surabaya Jawa Timur'),
  ('CU005','Eka Gilang','Ekahospital@gmail.com','+628888795712','2001-10-12','male','Pontianak Kalimantan Barat')
  ('CU006','Arabi Nay','Arabin@gmail.com','+6288433455712','2000-09-01','male','Kipas Jakarta Utara'),
  ('CU007','Alexander Ave','Alexandera@gmail.com','+62888825712','2002-11-10','male','Riau Pulau Jawa'),
  ('CU008','Ryan Trahan','ryant@gmail.com','+62888435712','1998-04-03','male','Yogyakarta Bandung'),
  ('CU009','Logan Max','Loganm@gmail.com','+6288887234712','1997-05-02','male','Kalideres Jakarta Barat'),
  ('CU010','Wasabi Rex','Rexkun@gmail.com','+62888879432','2001-10-12','male','Pontianak Kalimantan Barat')


  INSERT INTO ProductCategory Values
 ('PC001','Chair'),
 ('PC002','Mouse'),
 ('PC003','Headphone'),
 ('PC004','Monitor'),
 ('PC005','Computer'),
 ('PC006','Keyboard'),
 ('PC007','Table'),
 ('PC008','Speaker'),
 ('PC009','Laptop'),
 ('PC010','Accessories');


   INSERT INTO Product Values
  ('PR001','PC010','Accessories','Panci Import',5,1000000),
  ('PR002','PC003','Headphone','Hedphone tanpa kabel',5,500000),
  ('PR003','PC004','Monitor','Monitor 127inc',4,4000000),
  ('PR004','PC001','Chair','Kursi Goyang',10,900000),
  ('PR005','PC007','Table','Meja Gaming',15,5000000),
  ('PR006','PC002','Mouse','Mouse Gaming',2,1500000),
  ('PR007','PC009','Laptop','Laptop Gaming',7,250000),
  ('PR008','PC005','Computer','Computer Kerja',10,6000000),
  ('PR009','PC006','Keyboard','Keyboard Gaming/Kerja',5,1000000),
  ('PR010','PC008','Speaker','Speaker Waterproof',5,1500000);

 
 INSERT INTO ProductTransaction Values
('PT001','ST001','CU001','PR009','2019-01-10',5),
('PT002','ST002','CU009','PR009','2022-04-10',2),
('PT003','ST003','CU003','PR002','2022-01-05',1),
('PT004','ST004','CU004','PR003','2021-02-16',4),
('PT005','ST005','CU005','PR007','2018-10-20',1),
('PT006','ST006','CU002','PR005','2019-01-25',6),
('PT007','ST007','CU006','PR006','2022-03-01',3),
('PT008','ST008','CU007','PR007','2020-10-10',2),
('PT009','ST009','CU008','PR008','2021-12-18',3),
('PT010','ST000','CU010','PR001','2021-06-10',2),
('PT011','ST003','CU002','PR004','2021-12-18',5),
('PT012','ST005','CU005','PR005','2022-10-06',1),
('PT013','ST004','CU003','PR002','2021-12-08',2),
('PT014','ST001','CU002','PR006','2022-01-02',4),
('PT015','ST002','CU003','PR007','2021-02-08',3),
('PT016','ST004','CU004','PR004','2021-02-28',5),
('PT017','ST006','CU006','PR003','2019-02-18',1),
('PT018','ST008','CU007','PR002','2021-12-18',2),
('PT019','ST009','CU009','PR001','2020-12-12',4),
('PT020','ST007','CU008','PR010','2022-01-28',1),
('PT021','ST002','CU005','PR010','2022-03-15',2),
('PT022','ST005','CU010','PR007','2020-05-09',1),
('PT023','ST006','CU010','PR006','2021-12-10',1),
('PT024','ST000','CU005','PR004','2018-03-25',2),
('PT025','ST000','CU002','PR009','2019-05-20',1);


INSERT INTO Component Values
('CO001','Flash Disk','FlashDisk Asli',100000),
('CO002','Graphic Card','Vga Asli',25000000),
('CO003','Random Access Memory','RAM 16GB',8000000),
('CO004','Processor Intel','Processor Baru',10000000),
('CO005','Casing RoG','Casing Baru',5000000),
('CO006','Hard Disk','HardDisk Intel',900000),
('CO007','Power Supply','RoG Asli',800000),
('CO008','Kipas PC','Cooler Asli',800000),
('CO009','Processor AMD','Processor Baru',10000000),
('CO010','Mother Board','Jenis EATX',15000000),
('CO011','SSD','240 GB',1500000),
('CO012','Casing Sades','Casing Baru',5000000),
('CO013','Graphic Card','VGA Geforce',18000000),
('CO014','Mother Board','Intel Core I7',12000000),
('CO015','Random Acces Memory','RAM 8GB',1000000);

INSERT INTO ComponentTransaction  Values
('CT001','ST001','VE002','CO011','2022-06-21',70),
('CT002','ST002','VE005','CO002','2022-06-11',13),
('CT003','ST003','VE006','CO003','2022-06-03',90),
('CT004','ST004','VE003','CO004','2022-06-01',7),
('CT005','ST005','VE004','CO005','2022-06-09',20),
('CT006','ST006','VE001','CO006','2022-06-08',12),
('CT007','ST007','VE009','CO007','2022-06-10',8),
('CT008','ST008','VE007','CO008','2022-06-15',10),
('CT009','ST009','VE008','CO009','2022-06-18',4),
('CT010','ST000','VE000','CO010','2022-06-22',17),
('CT011','ST001','VE001','CO014','2022-06-25',19),
('CT012','ST002','VE001','CO002','2022-06-28',22),
('CT013','ST003','VE002','CO013','2022-07-11',25),
('CT014','ST004','VE002','CO004','2022-07-13',88),
('CT015','ST005','VE008','CO005','2022-07-14',32),
('CT016','ST006','VE001','CO006','2022-07-18',27),
('CT017','ST006','VE003','CO006','2022-07-20',89),
('CT018','ST007','VE006','CO006','2022-07-21',11),
('CT019','ST000','VE006','CO011','2022-07-25',17),
('CT020','ST002','VE003','CO002','2022-07-28',18),
('CT021','ST004','VE002','CO015','2022-07-27',17),
('CT022','ST003','VE008','CO006','2022-07-21',12),
('CT023','ST002','VE000','CO009','2022-07-23',14),
('CT024','ST006','VE000','CO005','2022-07-25',15),
('CT025','ST008','VE009','CO012','2022-07-24',22)
DROP TABLE ComponentTransaction

--5.	Query to answer the 10 cases. (.sql)
--1
SELECT c.CustomerID, UPPER(c.CustomerName) AS CustomerName, SUM(pt.Quantity) AS TotalItemsBought
FROM Customer c
JOIN ProductTransaction pt ON c.CustomerID = pt.CustomerID
WHERE YEAR(pt.TransactionDate) = '2021' AND
YEAR(CustomerDOB) = '2001'
GROUP BY c.CustomerID, c.CustomerName

--2
SELECT p.ProductID, p.ProductName, pc.CategoryName
FROM Product p
JOIN ProductTransaction pt ON p.ProductID = pt.ProductID
JOIN ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE YEAR(pt.TransactionDate) = '2020' 
GROUP BY p.ProductID, p.ProductName, pc.CategoryName
HAVING COUNT(pt.ProductID) >= 2

--3
SELECT p.ProductID, UPPER(p.ProductName) AS ProductName, SUM(p.ProductPrice * pt.Quantity) AS Income, COUNT(pt.Quantity) AS TotalTransaction
FROM Product p
JOIN ProductTransaction pt ON p.ProductID = pt.ProductID AND p.ProductDescription LIKE '%Gaming%'
JOIN ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID AND pc.CategoryName = 'Mouse' OR pc.CategoryName = 'Keyboard'
GROUP BY p.ProductID, p.ProductName
ORDER BY Income DESC

--4 
SELECT s.StaffID, s.StaffName, SUBSTRING(s.StaffEmail, 0, CHARINDEX('@', s.StaffEmail)) AS UserName, COUNT(pt.ProductID) AS TotalTransaction, SUM(pt.Quantity * p.ProductPrice) AS MoneySpend
FROM Staff s, Product p, ProductTransaction pt
WHERE StaffGender = 'male'
AND YEAR(pt.TransactionDate) = '2019'
GROUP BY s.StaffID,s.StaffName,s.StaffEmail

--5
SELECT v.VendorName + RIGHT(v.VendorID, 3) AS VendorNameID, v.VendorPhoneNumber, v.VendorDOB AS YearOfBirth, COUNT(ct.Quantity) AS TransactionCount
FROM Vendor v
JOIN ComponentTransaction ct ON v.VendorID = ct.VendorID, (
SELECT Vendor.VendorID [VendorID]
FROM Vendor 
JOIN ComponentTransaction  ON Vendor.VendorID = ComponentTransaction.VendorID
WHERE ComponentTransaction.Quantity > 60 AND Vendor.VendorGender = 'Female' 
) AS x
WHERE v.VendorID IN (x.[VendorID]) 
GROUP BY v.VendorName, v.VendorPhoneNumber, v.VendorDOB, v.VendorID
ORDER BY TransactionCount DESC 

--6
SELECT c.ComponentID, SUBSTRING(c.ComponentDescription, 0, CHARINDEX(' ', c.ComponentDescription)) AS ComponentKeyword
FROM Component c
JOIN ComponentTransaction ct ON c.ComponentID = ct.ComponentID ,(
SELECT AVG(co.ComponentPrice) AS Average
FROM Component co
) AS x
WHERE c.ComponentPrice > x.Average AND YEAR(ct.TransactionDate) = '2020'

--7
SELECT RIGHT(p.ProductID, 3) + LEFT (p.ProductName, 3) AS ProductIdentifier, p.ProductWeight, p.ProductPrice, COUNT(*) AS TransactionCount
FROM Product p
JOIN ProductTransaction pt ON p.ProductID = pt.ProductID,  (
SELECT COUNT(*) AS ct
FROM ProductTransaction
GROUP BY ProductID
) AS x
WHERE YEAR(pt.TransactionDate) > 2019
GROUP BY ProductTransactionID, p.ProductID, p.ProductName, p.ProductWeight, p.ProductPrice
HAVING COUNT(*) > AVG(x.ct)

--8
SELECT c.CustomerName, SUBSTRING(c.CustomerEmail, CHARINDEX('@', c.CustomerEmail)+1, LEN(c.CustomerEmail)) AS EmailProvider, SUM(pt.Quantity) AS TotalQty
FROM Customer c
JOIN ProductTransaction pt ON c.CustomerID = pt.CustomerID, (
SELECT AVG(Quantity) AS AverageQuantity
FROM ProductTransaction
) AS x
WHERE c.CustomerGender = 'Male' 
GROUP BY c.CustomerName, c.CustomerEmail
HAVING SUM(pt.Quantity) > AVG(x.AverageQuantity)



--9
CREATE VIEW StaffCompactView 
AS
SELECT s.StaffName, REPLACE(s.StaffPhoneNumber, '+62', '0') AS StaffPhone, s.StaffDOB AS YearOfBirth, SUM(p.ProductPrice * pt.Quantity) AS Earning, COUNT(pt.ProductID) AS TotalTransactions
FROM Staff s, Product p, ProductTransaction pt
WHERE s.StaffGender = 'Female' AND p.ProductWeight > 0
GROUP BY s.StaffName, s.StaffPhoneNumber, s.StaffDOB

SELECT * FROM StaffCompactView

--10
CREATE VIEW CustomerFLView 
AS
SELECT c.CustomerID, LOWER(c.CustomerName) AS CustomerName, MAX(pt.TransactionDate) AS FirstTransaction, MIN(pt.TransactionDate) AS LastTransaction
FROM Customer c, ProductTransaction pt, Staff s
WHERE LEN(CustomerName) > 1 AND StaffSalary > 7000000
GROUP BY c.CustomerID, c.CustomerName

SELECT * FROM CustomerFLView
ORDER BY CustomerName ASC







SELECT * FROM ProductTransaction
SELECT * FROM PRODUCT
SELECT * FROM ComponentTransaction
SELECT * FROM Component
SELECT * FROM ProductCategory
SELECT * FROM Customer
SELECT * FROM Vendor
SELECT * FROM Staff