
--importing data from csv to MS SQL server
--take union copy from twelve tabels and union in [Cyclistic_bike] table

select *into Cyclistic_bike_share.dbo.Cyclistic_bike
from
    (select* from c1 union all 
     select *from c2 union all
     select *from c3 union all
     select *from c4 union all
     select *from c5 union all
     select *from c6 union all
     select *from c7 union all
     select *from c8 union all
     select *from c9 union all
     select *from c10 union all
     select *from c11 union all
     select *from c_12 
     )as total 

--delete uncompleted data 


delete from Cyclistic_bike
where start_station_id is null or end_station_name is null or
start_station_name is null or end_station_id is null

-- to sure no exist uncompleted data
select *from Cyclistic_bike
where ride_id is null or rideable_type is null or 
      started_at is null or ended_at is null or
      start_station_name is null or
      start_station_id is null or end_station_name is null or
      end_station_id is null or start_lat is null or
      start_lng is null or end_lat is null or
      end_lng is null or member_casual is null
--convert data type from one to another suitable

alter table Cyclistic_bike alter column started_at datetime
alter table c6 alter column ended_at datetime
alter table Cyclistic_bike alter column start_lat float
alter table Cyclistic_bike alter column start_lng float
alter table Cyclistic_bike alter column end_lat float
alter table Cyclistic_bike alter column end_lng float

--add driven column to calculte use_hours

alter table Cyclistic_bike add ride_length time


alter table Cyclistic_bike add drive_hours time

alter table Cyclistic_bike add day_of_week time
--------------------------------------------------

select ride_id, started_at,ended_at,drive_hours
from Cyclistic_bike
order by drive_hours,started_at

--delete erro data 


delete from Cyclistic_bike
where ended_at<started_at




select top(5)*from Cyclistic_bike