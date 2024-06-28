use portfolioproject;

-- 1	Show all columns and rows in the table.
select * from salaries;

-- 2	Show only the EmployeeName and JobTitle columns.
select EmployeeName, JobTitle from salaries;

-- 3	Show the number of employees in the table.
select count(EmployeeName) as Total_Employees from salaries;

-- 4	Show the unique job titles in the table.
select distinct JobTitle from salaries;

-- 5	Show the job title and overtime pay for all employees with overtime pay greater than 50000.
select JobTitle, OvertimePay from salaries
where OvertimePay > 50000;

-- 6	Show the average base pay for all employees.
select round(avg(BasePay),2) as Avg_Base_pay from salaries;

-- 7	Show the top 10 highest paid employees.
select EmployeeName, TotalPay from salaries
order by 2 desc
limit 10;

-- 8	Show the average of BasePay, OvertimePay, and OtherPay for each employee:
select EmployeeName, (BasePay+OvertimePay+OtherPay)/3 as AveragePay from salaries;

-- 9	Show all employees who have the word "Manager" in their job title.
select EmployeeName, JobTitle from salaries
where JobTitle like '%Manager%';

-- 10	Show all employees with a job title not equal to "Manager".
select EmployeeName,JobTitle from salaries
where JobTitle != 'Manager';

-- 11	Show all employees with a total pay between 50,000 and 75,000.
select EmployeeName, TotalPay from salaries
where TotalPay between 50000 and 75000;

-- 12	Show all employees with a base pay less than 50,000 
-- or a total pay greater than 100,000.
select EmployeeName, BasePay, TotalPay from salaries
where BasePay < 50000 or TotalPay > 100000;

-- 13	Show all employees with a total pay benefits value 
-- between 125,000 and 150,000 and a job title containing the word "Director".
Select EmployeeName, JobTitle, TotalPayBenefits from salaries
where TotalPayBenefits between 125000 and 150000 
and JobTitle like '%Director%';

-- 14	Show all employees ordered by their total pay benefits in descending order.
select EmployeeName, TotalPayBenefits from salaries
order by 2 desc;

-- 15	Show all job titles with an average base pay of 
-- at least 100,000 and order them by the average base pay in descending order.
select JobTitle, avg(BasePay) as AvgBasePay from salaries
group by JobTitle
having AvgBasePay >= 100000
order by 2 desc;

-- 16	Delete any one column.
alter table salaries
drop column Notes;

select * from salaries; -- Checking whether the column is dropped or not

-- 17	Update the base pay of all employees with 
-- the job title containing "Manager" by increasing it by 10%.

update salaries
set Basepay = Basepay + (Basepay*0.1)
where JobTitle like '%Manager%';

-- 18	Delete all employees who have no OvertimePay.

-- checking the rows with no OvertimePay
select count(*) from salaries
where OvertimePay=0;

-- deleting the rows with no OvertimePay
delete from salaries
where OvertimePay=0;

-- Re-checking the rows with no OvertimePay
select count(*) from salaries
where OvertimePay=0;
	