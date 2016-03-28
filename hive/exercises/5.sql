# Count of users with at least 2 actions per day by day.

# What do you notice?
# ===> There is a seasonality in the activity
# On saturdays the activity will start to die down and end at a low point on Sundays.
# The activity starts to pick back up again on Mondays, but is the highest throughout the middle
# of the week.

select  y.occurred_at_date, count(y.user_id) as user_count
from (
select user_id, to_date(occurred_at) as occurred_at_date, sum(if(event_type is not null, 1, 0)) as sum_actions
from events
group by user_id, to_date(occurred_at)
having sum_actions >= 2
) y
group by y.occurred_at_date
;




