# For each company find the firts users who joined the SN
# ====> Some companies had users register at the same time
create table first_users_by_company as
select company_id, user_id, min(unix_timestamp(created_at)) over (partition by company_id)
from users
;

