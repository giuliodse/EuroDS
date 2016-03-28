-- Your boss looks at the user engagement dashboard and freaks out. 
-- Engagement has been going down steadily. Engagement is defined as the number 
-- of users who logged in at least once during the previous week.
--  i.e. on sept 7, it would be the distinct count of users who logged 
--  in at least once from sept 1 to sept 7. 
--  Please, verify that engagement is really going down.

# ====> Engagement from day ~81 is trending downward. See engagement_exercise_graph.png for verification




select to_date(occurred_at) as occurred_at_date, count(distinct user_id) over (partition by to_date(occurred_at) order by occurred_at rows between 7 preceding and current row) as engagement
from events
where event_name == 'login' 
group by to_date(occurred_at)
;
