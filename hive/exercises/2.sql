# How many companies? =====> 13198
select count(distinct company_id)
from users;

# Which is the company with the most users =====> company 1 
select company_id, count(company_id) as num_users
from users
group by company_id
order by num_users desc
limit 1;


