CREATE TABLE Organizator(
OrganizatorID INT PRIMARY KEY,
UserName TEXT NOT NULL,
Password TEXT NOT NULL
);
CREATE TABLE Organization(
OrganizationID INT PRIMARY KEY,
Category TEXT NOT NULL,
Name TEXT NOT NULL,
Address TEXT NOT NULL,
County TEXT NOT NULL,
City TEXT NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
Price INT NOT NULL,
Quota INT NOT NULL,
Description TEXT NULL,
OrganizatorName TEXT NOT NULL,
OrganizatorID INT,
FOREIGN KEY (OrganizatorID) REFERENCES Organizator (OrganizatorID)
);
CREATE TABLE Members(
MembersID INT NOT NULL,
Name TEXT NOT NULL,
SurName TEXT NOT NULL,
MembersUserName TEXT NOT NULL,
MembersPassword TEXT NOT NULL,
BirthDate DATE NOT NULL,
Email TEXT NOT NULL,
EventID INT NULL,
FOREIGN KEY(EventID) REFERENCES Organization(OrganizationID),
Type TEXT NOT NULL
);

INSERT INTO Organizator(OrganizatorID,UserName,Password) VALUES
(1,'FirstOrganizator','pass1'),
(2,'SecondOrganizator','pass2'),
(3,'ThirdOrganizator','pass3'),
(4,'FourthOrganizator','pass4'),
(5,'FifthOrganizator','pass5'),
(6,'SixthOrganizator','pass6'),
(7,'SeventhOrganizator','pass7'),
(8,'EighthOrganizator','pass8'),
(9,'NinthOrganizator','pass9'),
(10,'TenthOrganizator','pass10');

INSERT INTO Organization(OrganizationID,Category,Name,Address,County,City,StartDate,EndDate,Price,Quota,Description,OrganizatorName,OrganizatorID) VALUES
(1,'academic','FirstOrganization','DokuzEylulUniversity','Buca','izmir','2019-05-19','2019-05-19',100,5,NULL,'FirstOrganizator',1),
(2,'academic','SecondOrganization','Nergis Mah.','Buca','izmir','2019-05-20','2019-05-25',300,10,NULL,'SecondOrganizator',2),
(3,'art','ThirdOrganization','Yildiz Mah.','Buca','izmir','2019-06-11','2019-06-21',500,15,NULL,'ThirdOrganizator',3),
(4,'music','FourthOrganization','Merkez Mah.','Konak','izmir','2017-05-19','2017-05-25',250,8,NULL,'FourthOrganizator',4),
(5,'music','FifthOrganization','Gul Mah.','Esenler','istanbul','2018-05-19','2018-05-28',600,50,NULL,'FifthOrganizator',5),
(6,'math','SixthOrganization','Papatya Mah.','Bagcilar','istanbul','2020-01-12','2020-01-19',350,30,NULL,'SixthOrganizator',6),
(7,'theater','SeventhOrganization','Lale Mah.','ZeytinBurnu','istanbul','2019-08-10','2019-09-10',950,40,NULL,'SeventhOrganizator',7),
(8,'academic','EighthOrganization','SelcukUniversity','Selcuklu','Konya','2019-05-19','2019-05-30',400,64,NULL,'EighthOrganizator',8),
(9,'art','NinthOrganization','Papatya Mah.','Meram','Konya','2006-05-19','2006-06-30',1500,50,NULL,'NinthOrganizator',9),
(10,'music','TenthOrganization','Ortanca Mah.','Karatay','Konya','2019-05-19','2019-05-29',450,42,NULL,'TenthOrganizator',10);

INSERT INTO Members(MembersID,Name,SurName,MembersUserName,MembersPassword,BirthDate,Email,EventID,Type)VALUES
(1,'Ali','Dogan','FirstMember','member1','2000-01-20','ali@gmail.com',2,'Standart'),
(2,'Veli','Sahin','SecondMember','member2','1980-01-20','veli@gmail.com',2,'Standart'),
(3,'Ahmet','Koc','ThirdMember','member3','2004-01-20','ahmet@gmail.com',3,'Standart'),
(3,'Ahmet','Koc','ThirdMember','member3','2004-01-20','ahmet@gmail.com',4,'Standart'),
(3,'Ahmet','Koc','ThirdMember','member3','2004-01-20','ahmet@gmail.com',5,'Standart'),
(3,'Ahmet','Koc','ThirdMember','member3','2004-01-20','ahmet@gmail.com',6,'Standart'),
(4,'Hasan','Aslan','FourthMember','member4','1985-01-20','hasan@gmail.com',6,'Standart'),
(5,'Enes','Kartopu','FifthMember','member5','1997-01-20','enes@gmail.com',NULL,'Standart'),
(6,'Omer','Guzel','SixthMember','member6','1977-01-20','omer@gmail.com',7,'Standart'),
(7,'Mehmet','Uctu','SeventhMember','member7','1994-01-20','mehmet@gmail.com',8,'Standart'),
(8,'Huseyin','Gel','EighthMember','member8','2000-01-20','huseyin@gmail.com',9,'Standart'),
(9,'Eren','Kacti','NinthMember','member9','2005-01-20','eren@gmail.com',10,'Standart'),
(10,'Burak','Sustu','TenthMember','member10','2008-01-20','burak@gmail.com',NULL,'Standart'),
(11,'Baris','Kartal','EleventhMember','member11','1999-01-20','baris@gmail.com',10,'Standart');



/*1) Find the events which will be host in Izmir. */
SELECT *FROM Organization WHERE City = 'izmir';

/*2) Find the event (event’s name, category name, 
organizators name) which was held 
with the highest attendance
and the total obtained revenue. */
SELECT DISTINCT Organization.Name,Organization.Category,
Organization.OrganizatorName,Organization.Price
FROM Organization,Members WHERE Members.EventID
IN(SELECT COUNT(EventID) AS SAYI FROM Members
 GROUP BY EventID) AND
 Organization.OrganizationID=Members.EventID;

/*3) Find the total number of events for each category in a descending order. */
SELECT Category,COUNT(*) AS SAYI FROM Organization
GROUP BY Category ORDER BY SAYI DESC;

/*4) Find the past events in which 
the members (whose age is between 18-25) 
participated. */
SELECT Organization.Name,Members.Name,Members.SurName
FROM Organization,Members WHERE 
Organization.OrganizationID=Members.EventID AND
Organization.EndDate<'2019-05-26' AND 
('now'-Members.BirthDate)/365 BETWEEN 18 AND 25; 

/*5) Find the past events in which the total number of participated members is less than
(not equal) 3. */
SELECT *FROM Organization,Members WHERE 
Members.EventID IN(SELECT EventID FROM Members
GROUP BY EventID HAVING COUNT(*)<3) AND
EndDate<'2019-05-26' AND 
Organization.OrganizationID=Members.EventID;

/*6) List the members who attended at least 
3 events and update these members’
membership type to gold. */
SELECT *FROM Members WHERE MembersID IN
(SELECT MembersID FROM Members GROUP BY MembersID
 HAVING COUNT(*)>2);
 UPDATE Members SET Type='gold' WHERE MembersID IN
(SELECT MembersID FROM Members GROUP BY MembersID
 HAVING COUNT(*)>2);
SELECT *FROM Members WHERE MembersID IN
(SELECT MembersID FROM Members GROUP BY MembersID
 HAVING COUNT(*)>2);

/*7) Delete the “academic” events which 
will be organized by Dokuz Eylül University at
19th May 2019. */
SELECT *FROM Organization ;
DELETE FROM Organization WHERE Category='academic'
AND Address='DokuzEylulUniversity' AND 
EndDate='2019-05-19' AND StartDate='2019-05-19';
SELECT *FROM Organization ;

/*8) Return the member’s email 
address who paid at most. */
SELECT Email FROM Members,Organization WHERE  
Price IN(SELECT MAX(Organization.Price) 
FROM Organization)
AND Members.EventID=Organization.OrganizationID;

/*9)Update the discount rate of events which will be
organized at cities whose name starts with"i" as 25*/
SELECT *FROM Organization;
UPDATE Organization SET Description='discount %25',
Price = Price - Price/4 WHERE City LIKE 'i%';
SELECT *FROM Organization;

/*10) Delete the members 
who have not participated in any events. */
SELECT *FROM Members;
DELETE FROM Members WHERE EventID IS NULL;
SELECT *FROM Members; 