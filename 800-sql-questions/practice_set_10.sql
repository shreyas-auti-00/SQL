---------------------------------------------------set 10----------------------more tricky questions --------------------------------------------------------------
--100. Write down the query to print first letter of a Name in Upper Case and all other letter in Lower Case.(EmployDetail table)
select concat(upper(substring(firstname,1,1)), lower(substring(firstname, 2))) from employeedetail