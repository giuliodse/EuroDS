# How many users in total? ====> 19066
select sum(if(user_id is not null, 1, 0)), 
from users;

# How many active and pending users? =====> 9381, 9685
select sum(if((user_id is not null) and state == 'active', 1, 0)), sum(if((user_id is not null) and state == 'pending', 1, 0))
from users;