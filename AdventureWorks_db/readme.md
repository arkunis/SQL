
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
    from HumanResources.Employee 
    inner join Person.Person on Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID 
    inner join Person.PersonPhone on PersonPhone.BusinessEntityID = HumanResources.Employee.BusinessEntityID
    inner join Person.PhoneNumberType on PhoneNumberType.PhoneNumberTypeID = PersonPhone.PhoneNumberTypeID
    where PersonPhone.PhoneNumberTypeID = 1
    order by HumanResources.Employee.OrganizationLevel

#### 4/

    SELECT Person.LastName, Person.FirstName, PhoneNumber, PhoneNumberType.Name
    from HumanResources.Employee 
    inner join Person.Person on Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID 
    inner join Person.PersonPhone on PersonPhone.BusinessEntityID = HumanResources.Employee.BusinessEntityID
    inner join Person.PhoneNumberType on PhoneNumberType.PhoneNumberTypeID = PersonPhone.PhoneNumberTypeID
    where PersonPhone.PhoneNumberTypeID = 3
    order by HumanResources.Employee.OrganizationLevel

#### 5/

    SELECT Person.LastName, Person.FirstName, PhoneNumber, PhoneNumberType.Name
    from HumanResources.Employee 
    inner join Person.Person on Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID 
    inner join Person.PersonPhone on PersonPhone.BusinessEntityID = HumanResources.Employee.BusinessEntityID
    inner join Person.PhoneNumberType on PhoneNumberType.PhoneNumberTypeID = PersonPhone.PhoneNumberTypeID
    order by HumanResources.Employee.OrganizationLevel

#### 6/

    SELECT Person.LastName, 
    Person.FirstName,
    Person.BusinessEntityAddress.AddressID,
    Address.AddressID,
    Person.AddressType.Name
    from HumanResources.Employee 
    inner join Person.Person on Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID 
    inner join Person.AddressType on AddressType.AddressTypeID = 2
    inner join Person.BusinessEntityAddress on BusinessEntityAddress.BusinessEntityID = HumanResources.Employee.BusinessEntityID
    inner join Person.Address on Address.AddressID = BusinessEntityAddress.AddressID
    order by Person.BusinessEntityID asc

#### 7/

    SELECT Person.LastName, 
    Person.FirstName,
    Person.BusinessEntityAddress.AddressID,
    Address.AddressID,
    Person.AddressType.Name
    from HumanResources.Employee 
    inner join Person.Person on Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID 
    inner join Person.AddressType on AddressType.AddressTypeID = 3
    inner join Person.BusinessEntityAddress on BusinessEntityAddress.BusinessEntityID = HumanResources.Employee.BusinessEntityID
    inner join Person.Address on Address.AddressID = BusinessEntityAddress.AddressID
    order by Person.BusinessEntityID asc

#### 8/

    SELECT Person.LastName, 
    Person.FirstName,
    EmailAddress.EmailAddress
    from HumanResources.Employee 
    inner join Person.Person on Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID 
    inner join Person.EmailAddress on EmailAddress.BusinessEntityID = HumanResources.Employee.BusinessEntityID
    where Person.EmailPromotion > 1

#### 9/

    SELECT Person.LastName, 
    Person.FirstName,
    Person.BusinessEntityID,
    Customer.AccountNumber
    from HumanResources.Employee 
    inner join Person.Person on Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID 
    inner join HumanResources.Department on Department.DepartmentID = HumanResources.Employee.OrganizationLevel
    inner join Sales.Customer on Customer.CustomerID = HumanResources.Employee.BusinessEntityID
    where Person.PersonType like 'SP'
    order by BusinessEntityID asc

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
