﻿
## Correction

> Lien pour tout télécharger
> https://drive.google.com/drive/folders/1CsEVxUp4nVZI7Mu3WnOEaQcr5-tSR6vn?usp=sharing


#### 1/ 

    SELECT Person.LastName, Person.FirstName, HumanResources.Employee.JobTitle 
    from HumanResources.Employee 
    inner join Person.Person on Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID order by HumanResources.Employee.BusinessEntityID

#### 2/

    SELECT Person.LastName, Person.FirstName, HumanResources.Employee.OrganizationLevel, HumanResources.EmployeeDepartmentHistory.StartDate
    from HumanResources.Employee 
    inner join Person.Person on Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID 
    inner join HumanResources.Department on HumanResources.Department.DepartmentID = HumanResources.Employee.OrganizationLevel
    inner join HumanResources.EmployeeDepartmentHistory on HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID
    order by HumanResources.Employee.OrganizationLevel

#### 3/

    SELECT Person.LastName, Person.FirstName, PhoneNumber, PhoneNumberType.Name
    from Person.Person 
    inner join Person.PersonPhone on PersonPhone.BusinessEntityID = Person.Person.BusinessEntityID
    inner join Person.PhoneNumberType on PhoneNumberType.PhoneNumberTypeID = PersonPhone.PhoneNumberTypeID
    where PhoneNumberType.Name like '%Cell%'

#### 4/

    SELECT Person.LastName, Person.FirstName, PhoneNumber, PhoneNumberType.Name
    from Person.Person 
    inner join Person.PersonPhone on PersonPhone.BusinessEntityID = Person.Person.BusinessEntityID
    inner join Person.PhoneNumberType on PhoneNumberType.PhoneNumberTypeID = PersonPhone.PhoneNumberTypeID
    where PhoneNumberType.Name like '%Work%'

#### 5/

    SELECT Person.LastName, Person.FirstName, PhoneNumber, PhoneNumberType.Name
    from Person.Person
    inner join Person.PersonPhone on PersonPhone.BusinessEntityID = Person.BusinessEntityID
    inner join Person.PhoneNumberType on PhoneNumberType.PhoneNumberTypeID = PersonPhone.PhoneNumberTypeID

#### 6/

    select Person.FirstName, Person.LastName, CONCAT(Person.Address.AddressLine1, Person.Address.AddressLine2) ,Person.AddressType.Name  from Person.Person
    right join Person.BusinessEntityAddress on Person.BusinessEntityAddress.BusinessEntityID = Person.BusinessEntityID
    inner join Person.AddressType on Person.AddressType.AddressTypeID = Person.BusinessEntityAddress.AddressTypeID
    inner join Person.Address on Person.Address.AddressID = Person.BusinessEntityAddress.AddressID
    where Person.BusinessEntityAddress.AddressTypeID = 2

#### 7/

    select Person.FirstName, Person.LastName, CONCAT(Person.Address.AddressLine1, Person.Address.AddressLine2) ,Person.AddressType.Name  from Person.Person
    right join Person.BusinessEntityAddress on Person.BusinessEntityAddress.BusinessEntityID = Person.BusinessEntityID
    inner join Person.AddressType on Person.AddressType.AddressTypeID = Person.BusinessEntityAddress.AddressTypeID
    inner join Person.Address on Person.Address.AddressID = Person.BusinessEntityAddress.AddressID
    where Person.BusinessEntityAddress.AddressTypeID = 3

#### 8/

    SELECT LastName, FirstName, STRING_AGG(EmailAddress,' - ') FROM Person.Person
    JOIN Person.EmailAddress ON(Person.Person.BusinessEntityID =Person.EmailAddress.BusinessEntityID)
    GROUP BY LastName, FirstName
    HAVING COUNT(EmailAddress)>=2
    ORDER BY LastName, FirstName ASC

#### 9/

    Select Person.FirstName, Person.LastName, Sales.Customer.AccountNumber from Sales.Customer
    inner join Person.Person on Person.BusinessEntityID = Sales.Customer.PersonID
    where PersonID is not NULL and StoreID is not NULL

#### 10/

    select name,
    ProductDescription.Description
    from Production.ProductModel
    inner join Production.ProductModelProductDescriptionCulture on ProductModelProductDescriptionCulture.ProductModelID = Production.ProductModel.productModelId
    inner join Production.ProductDescription on ProductDescription.ProductDescriptionID = ProductModelProductDescriptionCulture.ProductDescriptionID
    where ProductModelProductDescriptionCulture.CultureID = 'FR'

#### 11/ 

    select SalesOrderNumber, OrderDate from Sales.SalesOrderHeader
    where OrderDate like '%2014%'
#### 12/

    select count(SalesOrderHeader.CreditCardID) 'Nombre Vente', CreditCard.CardType from Sales.SalesOrderHeader
    inner join Sales.CreditCard on CreditCard.CreditCardID = SalesOrderHeader.CreditCardID
    group by CreditCard.CardType
#### 13/

    select Product.Name, count(SalesOrderDetail.ProductID) 'Nombre Vente Par Produit' from Sales.SalesOrderDetail
    inner join Production.Product on Product.ProductID = SalesOrderDetail.ProductID
    group by Name
#### 14/

    select Product.Name, Production.Product.ProductID, count(SalesOrderDetail.ProductID) 'Nombre Vente Par Produit', sum(SalesOrderDetail.UnitPrice) 'Total Vente' from Sales.SalesOrderDetail
    inner join Production.Product on Product.ProductID = SalesOrderDetail.ProductID
    group by Name, Product.ProductID
    order by Product.ProductID ASC
#### 15/

    select ProductNumber,  Production.Product.Name,  Production.ProductCategory.Name from Production.Product
    inner join Production.ProductSubcategory on ProductSubcategory.ProductSubcategoryID = Production.Product.ProductSubcategoryID
    inner join Production.ProductCategory on Production.ProductCategory.ProductCategoryID = ProductSubcategory.ProductCategoryID
    order by Production.ProductCategory.ProductCategoryID

#### 16/

    select Production.Product.Name, OrderQty from Sales.SalesOrderDetail
    inner join Production.Product on Production.Product.ProductID = Sales.SalesOrderDetail.ProductID
    where OrderQty > (select max(OrderQty) from Sales.SalesOrderDetail) -1

#### 17/

    select Production.Product.ProductNumber, Production.Product.Name, Production.ProductPhoto.LargePhotoFileName, Production.ProductDescription.Description, Production.ProductSubcategory.Name, Purchasing.PurchaseOrderDetail.OrderQty
    from Production.Product
    inner join Production.ProductProductPhoto on ProductProductPhoto.ProductID = Production.Product.ProductID
    inner join Production.ProductPhoto on Production.ProductPhoto.ProductPhotoID = ProductProductPhoto.ProductPhotoID
    inner join Production.ProductModelProductDescriptionCulture on Production.ProductModelProductDescriptionCulture.ProductModelID = Production.Product.ProductModelID
    inner join Production.ProductDescription on Production.ProductDescription.ProductDescriptionID = Production.ProductModelProductDescriptionCulture.ProductDescriptionID
    inner join Production.ProductSubcategory on Production.ProductSubcategory.ProductSubcategoryID = Product.ProductSubcategoryID
    inner join Purchasing.PurchaseOrderDetail on Purchasing.PurchaseOrderDetail.ProductID = Production.Product.ProductID
    where Production.ProductModelProductDescriptionCulture.CultureID like '%fr%'
