/*
1. `Orders`
2. `FoodOrders`
3. `BankTransactions`
4. `MovieBookings`
5. `PatientVisits`
6. `Reviews`
7. `HotelBookings`
8. `Results`
9. `FlightBookings`
10. `Videos`
*/
--1
select sum(amount) as tot_sales, productCategory 
from orders 
group by ProductCategory
having sum(amount) > 100000 
order by  tot_sales desc;
--2
select avg(BillAmount)as avg_bill, restaurant
from foodorders
where city = 'Pune'
group by restaurant
having avg(BillAmount) > 500
order by avg_bill desc;
--3
select sum(amount) as tot_amt, accountType 
from bankTransactions
where transactiontype = 'withdrawal'
group by accountType
having sum(amount) > 500000
order by tot_amt desc;
--4
select count(*)as cnt, movieName
from MovieBookings 
where BookingStatus = 'Confirmed'
group by movieName
having count(*) > 100
order by cnt desc;
--5
select avg(consultationfee) as a, department
from PatientVisits
where PatientAge > 40
group by department 
having avg(consultationfee)>800
order by a desc;
--6
select avg(rating) as avg_rating, productCategory
from Reviews 
where verifiedcustomer = 1
group by ProductCategory 
having avg(rating) >4
order by avg_rating desc;
--7
select sum(amount) as revenue, roomtype
from HotelBookings
where bookingstatus = 'completed'
group by roomtype
having sum(amount) > 200000
order by revenue desc;
--8
select avg(marks) as avg_marks, Subject 
from Results
where marks >= 60 
group by Subject
having avg(marks)  > 70
order by avg_marks desc;
--9
select sum(fare) as total_fare, Airline
from FlightBookings
where bookingStatus = 'Confirmed'
group by Airline
having sum(fare) > 1000000
order by total_fare desc;
--10
select sum(views) as total_views, category
from Videos
where uploadYear = 2026
group by category
having sum(views) > 100000
order by total_views desc;