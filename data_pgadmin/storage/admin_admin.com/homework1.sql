/*select DATE(lpep_pickup_datetime) as lpep_pickup_date, max(trip_distance) as longest_trip_distance
from green_taxi_trips
group by lpep_pickup_date
order by longest_trip_distance desc
limit 1;
*/
/*
select DATE(g.lpep_pickup_datetime) as lpep_pickup_date, sum(total_amount) as total_amount_all_trips, z."Zone"
from green_taxi_trips g
join zones z
on g."PULocationID" = z."LocationID" 
where DATE(g.lpep_pickup_datetime) = '2019-10-18'
group by lpep_pickup_date, z."Zone"
having sum(total_amount) > 13000
*/
select to_char(g.lpep_pickup_datetime, 'YYYY-MM') as lpep_pickup_date, puz."Zone" as pickup_zone, doz."Zone" as dropoff_zone, g.tip_amount
from green_taxi_trips g
join zones puz
on g."PULocationID" = puz."LocationID"
join zones doz 
on g."DOLocationID" = doz."LocationID"
where puz."Zone" = 'East Harlem North' AND to_char(g.lpep_pickup_datetime, 'YYYY-MM') = '2019-10'
order by g.tip_amount desc
limit 1;