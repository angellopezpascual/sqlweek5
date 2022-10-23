#Calcula usando subqueries: Importe medio por carrito y total de items, por año-mes, realizados en los años 2004 y 2005, por clientes asistidos por los empleados de la familia Patterson.    
  
SELECT cust2.salesRepEmployeeNumber, employeeNumber
from employees as empl
LEFT JOIN (SELECT customerNumber , cust.salesRepEmployeeNumber
			from customers as cust
			LEFT Join (SELECT year(orderDate) as Año, month(orderDate) as Mes, round(avg(quantityOrdered*priceEach),2) as Media
				from orderdetails as ordd
				Left join orders
				on orders.orderNumber = ordd.orderNumber
				group by Año, Mes) as ped
			on customerNumber = cust.salesRepEmployeeNumber) as cust2
on cust2.salesRepEmployeeNumber = employeeNumber
WHERE  lastName = "Patterson"


GROUP BY year(orderDate), month(orderDate)
ORDER BY 1 ASC, 2 ASC

	LEFT JOIN (select customerNomber, employeeNumber, salesRepEmployeeNumber
				from customers as cust					
	LEFT JOIN (select  employeeNumber, salesRepEmployeeNumber
				on customers.salesRepEmployeeNumber = employees.employeeNumber)))

on orders.orderNumber = orderdetails.orderNumber
LEFT JOIN customers
on orders.customerNumber = customers.customerNumber
LEFT JOIN employees
on customers.salesRepEmployeeNumber = employees.employeeNumber



WHERE (year(orderDate) = 2004 or year(orderDate)=2005) and lastName = "Patterson"
GROUP BY year(orderDate), month(orderDate)
ORDER BY 1 ASC, 2 ASC
