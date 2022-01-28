---------------------First Task-------------------------------
create database Second_Homework_Latiph
use Second_Homework_Latiph


CREATE TABLE Departments(
Id int primary key IDENTITY,
[Name] nvarchar(35) constraint Departments_Name NOT NULL check(LEN([Name])>2)
) --Departments tablem

CREATE TABLE Employees(
Id int primary key IDENTITY,
Fullname nvarchar(35) constraint Employees_Fullname NOT NULL check(LEN(Fullname)>3),
Salary int constraint Employees_Salary check(Salary>0),
DepartmentId int constraint FK_Employees_DepartmentId foreign key references Departments(Id)
)--Employees Tablem

insert into Departments  --Departments e daxil edilen deyerler
values('Programming'),
('Graphic Design'),
('Marketing'),
('Accountant'),
('Human Resource'),
('Finance'),
('System Administrator')

insert into Employees    --Employees e daxil edilen deyerler
values(N'Odin Tanrızade',3500,1),
('Herodot Yunanzade',2500,1),
(N'Qasım Gülməmmədov',3590,2),
('Steve Jobs',1000,2),
('Letif Hesenzade',7500,2),
('Harry Potter',8500,5),
('Idris Mikayil',7500,5),
('Peter Parker',3500,6),
('Aqil Hüseynov',3200,7),
('Ben Fero',1500,4),
('Trump Donald',1030,6),
('Barack Obama',2000,5)

select e.FullName, e.Salary, d.Name as 'Department Name' from Employees as e --netice bir
INNER JOIN Departments as d
on e.DepartmentId = d.Id

select d.Name as 'Name of the Department', COUNT(e.FullName) as 'Count of Department Employees' from Employees as e --netice iki
INNER JOIN Departments as d
on e.DepartmentId = d.Id
group by d.Name
-------------------------------Second task----------------------------------------------

CREATE TABLE Pricing(
Id int primary key IDENTITY,
[Name] nvarchar(15) constraint Pricing_Name NOT NULL,
Price int NOT NULL constraint Pricing_Price check(Price>=0) 
) --Pricing Table


CREATE TABLE Feature(
Id int primary key IDENTITY,
[Desc] nvarchar(40) NOT NULL
) --Feature table

CREATE TABLE PricingFeature(
Id int primary key IDENTITY,
PricingId int constraint FK_PricingFeature_PricingID foreign key references Pricing(Id),
FeatureId int constraint FK_PricingFeature_FeatureID foreign key references Feature(Id)
) --PricingTable table

insert into Pricing --Pricing deyer elave etmek
values('Free', 0),
('Business', 29),
('Developer', 49)

insert into Feature --Feature deyer elave etmek
values('Quam adipiscing vitae proin'),
('Nec feugiat nisl pretium'),
('Nulla at volutpat diam uteera'),
('Pharetra massa massa ultricies'),
('Massa ultricies mi quis hendrerit')

insert into PricingFeature --Elaqe ucun elave olunan deyerler
values(1,1),
(1,2),
(1,3), 
(1,4),
(1,5), --Pricing Id 1 olanı Feature Id 1,2,3,4,5 ile elaqelendirdi
(2,1),
(2,2),
(2,3),
(2,4),
(2,5), --Pricing Id 2 olanı Feature Id 1,2,3,4,5 ile elaqelendirdi
(3,1),
(3,2),
(3,3),
(3,4),
(3,5)  --Pricing Id 3 olanı Feature Id 1,2,3,4,5 ile elaqelendirdi

select * from PricingFeature as pf --her şeyin görünməyini istəyirsənsə(optional) 
INNER JOIN Pricing as p
on pf.PricingId=p.Id
INNER JOIN Feature as f
on pf.FeatureId=f.Id

select p.[Name], f.[Desc] as 'Feature' from PricingFeature as pf --əsasların görünməyini istəyirsənsə(main)
INNER JOIN Pricing as p
on pf.PricingId=p.Id
INNER JOIN Feature as f
on pf.FeatureId=f.Id

---------------------Third Task--------------------

CREATE TABLE Categories(
Id int primary key IDENTITY,
[Name] nvarchar(30) NOT NULL,
) --Categories table

CREATE TABLE Portfolios(
Id int primary key IDENTITY,
[Name] nvarchar(30) NOT NULL,
CategoryId int constraint FK_Portfolios_CategoryId foreign key references Categories(Id)  
) --Portfolios table

CREATE TABLE PortfolioImages(
Id int primary key IDENTITY,
[Image] nvarchar(50) NOT NULL,
PortfolioId int constraint FK_PortfolioImages_PortfolioId foreign key references Portfolios(Id)  
) --PortfolioImages table

insert into PortfolioImages
values ('basket',1),
('tea',3),
('toothpaste',1),
('honest-beauty',2),
('aerin',3),
('cocooil',1),
('water',2),
('desk',2),
('food',3) --PortfolioImages deyer elave etmek

insert into Portfolios --Portfolios deyer elave etmek
values ('app',1),
('card',2),
('web',3)

insert into Categories --Categories deyer elave etmek
values ('category-1'),
('category-2'),
('category-3')

select p.Name as 'PortfolioName', [pi].Image as 'ImageName', c.Name as 'CategoryName' from Categories as c
INNER JOIN Portfolios as p
on p.CategoryId = c.Id
INNER JOIN PortfolioImages as [pi]
on [pi].PortfolioId=p.Id
