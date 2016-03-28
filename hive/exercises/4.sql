# Click through rate/ open rate for emails? total emails clicked / total emails sent
# 											total emails opened / total emails sent

# ====> Clickthrough rate - .09968, Open rate - .2263


# Check to make sure an email was actually sent
select sum(if(action == 'email_clickthrough', 1, 0)) / sum(if(action is not null, 1, 0)) as clickthrough_rate, 
sum(if(action == 'email_open', 1, 0)) / sum(if(action is not null, 1, 0)) as open_rate
from email;
