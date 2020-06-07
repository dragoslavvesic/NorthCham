/*
1)  Display names of representatives, details of the products they represent, 
    and names of their supervisors.
*/ 

SELECT EmployeeID, EmployeeFName, EmployeeLName, ProductName, ProductDescription, ProductPrice, SupervisorName, SupervisorSurname
FROM 
    (SELECT *
     FROM
        (SELECT * 
        FROM
            (SELECT ProductName, ProductDescription, ProductPrice, ProductRepresentative
            FROM GeneralChemical
            UNION
            SELECT ProductName, ProductDescription, ProductPrice, ProductRepresentative
            FROM Paint
            UNION
            SELECT ProductName, ProductDescription, ProductPrice, ProductRepresentative
            FROM FeedstuffAdditive)
        t3
        RIGHT OUTER JOIN Employee e
        ON e.EmployeeID = t3.ProductRepresentative)
    t4
    INNER JOIN (SELECT e.EmployeeID AS ID, e.EmployeeFName AS SupervisorName, e.EmployeeLName AS SupervisorSurname, e.EmployeeGrade AS
                Grade, e.Supervisor AS Superior
                FROM Employee e) t5
    ON t4.Supervisor = t5.ID);


/*
2)  Display details of customers together with details of their areas and names
    of the managers of their areas.
*/

SELECT CustomerID, CustomerFName, CustomerLName, CustomerAddress, CustomerArea, AreaName, AreaDepot, AreaManagerName, 
AreaManagerSurname
FROM
    (SELECT *
    FROM
        (SELECT *
        FROM
            (SELECT CustomerID, CustomerFName, CustomerLName, CustomerAddress, CustomerArea 
            FROM Customer)
        t
        LEFT OUTER JOIN Area a
        ON t.CustomerArea = a.AreaID
        )
    t1
    LEFT OUTER JOIN(SELECT e.EmployeeID AS EmployeeID, e.EmployeeFName AS AreaManagerName, e.EmployeeLName AS AreaManagerSurname, 
                    e.EmployeeGrade AS EmployeeGrade, e.Supervisor AS Supervisor
                    FROM Employee e) t2
    ON t1.AreaManager = t2.EmployeeID);



