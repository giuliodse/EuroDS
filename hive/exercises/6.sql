# Count distinct user_ids by week, experiment, experiment_group



select y.week, y.experiment, y.experiment_group, sum(y.user_count) as user_count
from(
	select x.week, x.experiment, x.experiment_group, count(x.user_id) as user_count
		from (
			select weekofyear(to_date(occurred_at)) as week, user_id, experiment, experiment_group
			from experiments
			order by week
		) x
	group by x.week, x.experiment, x.experiment_group
) y
group by y.experiment_group, y.experiment, y.week
;




