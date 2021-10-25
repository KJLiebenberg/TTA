CREATE DATABASE Flowering_Plants;

USE Flowering_Plants;

-- Create a table with 10 rows of plants and their correspondering details
CREATE TABLE Plant_Details (
	Plant_Number smallint unsigned auto_increment,
    Plant_Name1 varchar(20),
    Plant_Name2 varchar(20),
    Category varchar(20),
    Planting_Season enum('Spring','Summer','Autumn','Winter'),
    Height_cm int,
    CONSTRAINT pk_Plant_Details PRIMARY KEY(Plant_Number)
);

-- Populate the table with relevant data
INSERT INTO Plant_Details
	(Plant_Number, Plant_Name1, Plant_Name2, Category, Planting_Season, Height_cm)
    VALUES(NULL,'Dahlia','Waltzing Matilda','Tuber','Spring',	70),
    (NULL,'Dahlia','Bacardi','Tuber','Spring',75),
	(NULL,'Dahlia','La Recoleta','Tuber','Spring',80),
    (NULL,'Dahlia','Totally Tangerine','Tuber','Spring',90),
    (NULL,'Dahlia','Purple Flame','Tuber','Spring',90),
    (NULL,'Narcissus','Bridal Crown','Bulb','Autumn',35),
    (NULL,'Narcissus','Albus Plenus','Bulb','Autumn',40),
    (NULL,'Anemone','The Bride','Corm','Spring',25),
    (NULL,'Allium','Sphaerocephalon','Bulb','Autumn',90),
    (NULL,'Allium','Atropurpureum','Bulb','Autumn',70);

-- Display the table containing the 10 plants with their details
SELECT * FROM Plant_Details;

-- Update a record
UPDATE Plant_Details
SET Plant_Name2 = 'Cafe Au Lait',
Height_cm = 100
WHERE Plant_Number = 5;

-- Display the newly updated table (row 5 has changed)
SELECT * FROM Plant_Details;

-- Delete a record (the first row)
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM Plant_Details
WHERE Plant_Number = 1;
SET FOREIGN_KEY_CHECKS=1;

-- Display the newly modified table (with row 1 removed)
SELECT * FROM Plant_Details;

-- Create a secondary table listing each plant's flowering months
CREATE TABLE Flowering_Mnths(
	Plant_Number smallint unsigned,
    Flowering_Months enum('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'),
    CONSTRAINT pk_Flowering_Months PRIMARY KEY (Plant_Number,Flowering_Months),
    CONSTRAINT fk_Plant_Number_Flowering FOREIGN KEY (Plant_Number)
    REFERENCES Plant_Details (Plant_Number)
);

-- Populate the table with data
INSERT INTO Flowering_Mnths(Plant_Number, Flowering_Months)
	VALUES(1,'Aug'),(1,'Sep'),(1,'Oct'),(1,'Nov'),
		(2,'Aug'),(2,'Sep'),(2,'Oct'),(2,'Nov'),
        (3,'Aug'),(3,'Sep'),(3,'Oct'),(3,'Nov'),
        (4,'Aug'),(4,'Sep'),(4,'Oct'),(4,'Nov'),
        (5,'Aug'),(5,'Sep'),(5,'Oct'),(5,'Nov'),
        (6,'Mar'),(6,'Apr'),
        (7,'Apr'),(7,'May'),
        (8,'Apr'),(8,'May'),
        (9,'May'),(9,'Jun'),
        (10,'May'),(7,'Jun');

-- Display the secondary table
SELECT * FROM Flowering_Mnths;




    