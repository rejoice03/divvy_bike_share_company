select top (1000) * 
from dbo.[01_2021];

-- combine all 12 months CSV files into one CSV

insert into dbo.[01_2021]
select *
from [02_2021]

insert into dbo.[01_2021]
select *
from [03_2021]

insert into dbo.[01_2021]
select *
from [04_2021]

insert into dbo.[01_2021]
select *
from [05_2021]

insert into dbo.[01_2021]
select *
from [06_2021]

insert into dbo.[01_2021]
select *
from [07_2021]

insert into dbo.[01_2021]
select *
from [08_2021]

insert into dbo.[01_2021]
select *
from [09_2021]

insert into dbo.[01_2021]
select *
from [10_2021]

insert into dbo.[01_2021]
select *
from [11_2021]

insert into dbo.[01_2021]
select *
from [12_2021]

-- finding the null in rows

select *
from [01_2021]
where start_station_name is null or end_station_name is null;

-- remove null rows from start_ station_name and end_station_name

begin tran

delete from dbo.[01_2021]
where end_station_name is null

select @@TRANCOUNT

select *
from dbo.[01_2021]
where start_station_name is null

commit

--add new column for “ride_length” and Calculate the length of each ride by subtracting the column “started_at” from the column “ended_at” then convert to time(minute)
--and weekday, month as proper name eg: weekday (monday), month(january) 

begin tran

select*, DATEDIFF(MINUTE, started_at, ended_at) as ride_length,
DATENAME (WEEKDAY, started_at) as weekday,
DATENAME (month, started_at) as month
from dbo.[01_2021]
commit
select *
from dbo.[01_2021]

commit

---delete unwanted columns

ALTER TABLE [dbo].[01_2021]
DROP COLUMN start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng

---save as CSV file


