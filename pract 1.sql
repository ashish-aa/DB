show databases;

use db;
select*from Customer;
select*from Account;

select*from Customer as c inner join Account as a using(C_Id) where a.Acc_type='Saving';
select*from Customer left join Account using(C_Id);
select*from Customer right join Account using(C_Id);
select*from Customer as c inner join Account as a using(C_Id) where c.City = (select City from Customer where Cname = 'Pooja');
select *from Customer as c inner join Account as a using(C_Id) where a.Amount <(select avg(Amount) from Account);
select C_Id, Amount from Account where Amount = (select max(Amount) from Account);

select Acc_type,( select min(Amount) from Account where Account.Acc_type = A.Acc_type) as Min_Amount from Account as A group by Acc_type;


