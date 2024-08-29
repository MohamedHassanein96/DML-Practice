-- create new table
create table SALES.trips(
trip_id int primary key,
trip_destinatin varchar(30),
trip_date date,
trip_price decimal,
seats_available int
)


-- insert data 
insert into SALES.trips
values (1,'maccah','2023-08-10',150,40);
insert into SALES.trips
values (2,'madinaa','2023-08-1',152,10);


-- create newtable to reservation 
create table SALES.reservation
(
reservation_id int identity primary key,
trip_id int,
traveller_name varchar(30),
reservatio_date date ,
no_of_tickets int 
)

-- create trigger to update the availble seats of trips's table after reservation 
create   or alter TRIGGER update_available_tickets
on SALES.reservation
after insert
as 
begin 
set nocount on;
update SALES.trips
set seats_available =t.seats_available-i.no_of_tickets
from  SALES.trips t , inserted i 
where i.trip_id = t.trip_id
end


select *
FROM SALES.trips

INSERT INTO SALES.reservation
values (1,'mohame',GETDATE(),20)

delete from SALES.reservation
where  trip_id =1;

-- create trigger to Check_available_tickets before insert data
create   or alter TRIGGER Check_available_tickets
on SALES.reservation
instead of  insert
as 
begin 
set nocount on;
if exists(select * from trips t , inserted i 
where t.trip_id = i.trip_id and t.seats_available >= i.no_of_tickets)
insert into SALES.reservation
select trip_id,traveller_name,reservatio_date,no_of_tickets
from inserted;
else 
raiserror('no availble seats',16,1);
end

select * 
from SALES.trips


insert into SALES.reservation
values(1,'mohamed',GETDATE(),10)