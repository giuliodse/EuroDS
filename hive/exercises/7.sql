# How many users have never clicked on an email?
# Get all users that have nethier opened nor clicked through the email 
# as well as users that havent been sent any emails 
# ====> 73807

select count(z.user_id)
from (
	select x.user_id, y.action
	from users x
	left join email y
	on x.user_id = y.user_id
) z
where z.action is null or z.action not in ('email_open', 'email_clickthrough')
;
