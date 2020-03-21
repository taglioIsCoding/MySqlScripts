/*QUERY*/

/*1*/Select * from (Shipper as s join Orders as o ) 
                join Employees as e
                    where s.ShipperID = o.ShipperID
                    and e.EmployeesID = o.EmployeesID
                    and e.LastName = "Adam"

/*2*/Select City from Customers
                group by Country 

/*3*/Select e.Name, e.Surname from (Shipper as s join Orders as o ) 
                join Employees as e
                    where s.ShipperID = o.ShipperID
                    and e.EmployeesID = o.EmployeesID
                    and e.LastName = "Federal Shipping"
                    and o.OrderDate between  '7/4/1996' and '7/8/1996'

/*4*/Select Avg(p.price) as PrezzoMedio from (Category as c join Products as p ) 
                                        where p.categoryID = c.categoryID
                                        and c.CategoryName = "Bavarage"
                                        
/*5*/Select p.productName from (OrderDetail as od join Orders as o ) 
                join Products as p)
                join Customers as c
                    where od.OrederID = o.OrederID
                    and p.ProductID = od.ProductsID
                    and o.CustomersID = c.CustomersID
                    and c.CustomerName like "L%"

/*6*/Select count(o.OrederID) from (Customers as c join Orders as o ) 
                                where o.CustomersID = c.CustomersID
                                and c.Country = "MEXICO"

/*7*/Select c.addres from (Customers as c join Orders as o ) 
                    join Employees as e
                    where c.CustomersID = o.CustomersID
                    and o.EmployeesID = e.EmployeesID
                    and e.EmployeeName = "Davolio Nancy" or e.EmployeeName = "King Robert"

/*8*/Select s.city from (Products as p join Supplier as s)
                    where p.supplierID = s.supplierID
                    and p.price between 10 and 20

/*9*/Select s.name from Supplier as s 
                    where s.ContactName = "ikura"
