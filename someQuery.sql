/*Ex 46 p 142*/
/*1*/Select *
            from customers
              where customers.customersName
                like "%Gift%"
/*2*/Select *
            from employees
              order by employees.reportsTo

/*3*/Select Costumers.Name, Costumers.State
            from Payments Join customers
              on Payments.customersNumber = customers.costumersNumber
               where Payments.peymentDate like "%2004%"
               and Payments.amount > 1000

/*4*/Select *
          (from Orders join customers
          on Orders.customersNumber= customers.customersNumber as ro) Join employees
          on ro.salesRepEmployeeNumber = employees.salesRepEmployeeNumber
            where ro.orderDate like "%2004%"
            and employees.firstName = "King"

/*5*/Select *
            from employees Join Offices
              on Offices.officeCode = employees.officeCode
               where Offices.country = "USA"

/*6*/Select distinct *
            from customers join Orders
            on customers.customersNumber = orders.customersNumber
              where ro.orderDate like "%2004%"

/*7*/

/*9*/
/*10*/
/*11*/
/*12*/
/*13*/
/*14*/
/*15*/
