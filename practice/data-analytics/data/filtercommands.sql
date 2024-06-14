select * from customer where city in ('Philadeplhia','Seattle');

select * from customer where age between 20 and 30;

select * from customer where age not between 20 and 30;

select * from customer where age >= 20 and  age<=30;

select * from sales where order_date between '2015-04-01' and '2016-04-01';

select * from customer where customer_name like 'J%';

select * from customer where customer_name like '%Nelson%';

select * from customer where customer_name like '____ %';

select * from customer where customer_name like 'R\%';

select distinct city from customer where city not like 'S%';









