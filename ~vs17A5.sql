
use MyFirstDatabase -- using statements just like C#

---- STORING STRINGS
---- declare @FirstName char(50) = 'Nathan'
declare @FirstName varchar(50) = 'Jamie' -- max of 8000 characters
declare @reallybigText varchar(max) = 'Jamieeeee' -- 2 gb of text
declare @lastname nvarchar(255) = 'Phillips' -- maximum 4000 characters
declare @lotsofemojis nvarchar(max) = 'jkejf' -- 2 gb of text

----STORING INTEGERS
declare @myAge bigint = 32 -- Int64
declare @myAgee int = 32 -- Int32
declare @id int = 3

---- STORING BOOLS
declare @isCool bit = 1 -- bit == bool, 1 == true, 0 == false.
declare @isLame bit = 0 

---- STORING DECIMALS
declare @bankAccountBalance decimal = 100.00 -- same as C#
-eclare @money money = 100.0000 -- most people use decimals, but can do this.

----STORING DATES/TIMES
declare @lockUpDate datetime = '1988-01-07 13:30:00.000'

-- STORING A UNIQUE ID
declare @uniqueID uniqueidentifier = 'asd8asefe3y824f' -- GUID --or newid() generates a new ID in SQL  



-- CREATING TABLES, OR LISTS/ARRAYS
create table Clinker (
ID int not null,
[Name] varchar(255) not null,
IsCool bit null,
lockUpDate datetime not null,
)

alter table Clinker add FirstName nvarchar(255) not null -- adding a column

alter table Clinker drop column [Name]

create table Interest (
ID int primary key identity(1, 1) not null, -- (1, 1) First number is what to start at, second number is increment number
[Name] nvarchar(255) not null, 
[Description] nvarchar(255) null,
)

insert into clinker (ID, lockUpDate, FirstName)
values (2, getDate(), 'Jamie')

alter table Clinker drop column IsCool

insert into clinker (ID, lockUpDate, FirstName, LastName)
values (1, getDate(), 'Martin', 'Cross')

insert into clinker (ID, lockUpDate, FirstName, LastName)
values (@id, @lockUpDate, @FirstName, @lastname)

select firstName, LastName
from clinker
where id >= 2 --where variable is essentially the filter. don't need it unless you need to filter results.

select * -- the * means give me all of the data.
from clinker

select FirstName + ' ' + LastName as FullName
from clinker

select FirstName + ' ' + isnull(LastName, '') as FullName -- if you have one of the concat strings that is null but still want a full value.
from clinker

insert into Interest ([name], [description])
values ('Shiving', 'a cool hobby for people on death row')

-- CREATING A FOREIGN KEY
alter table clinker add InterestId int
alter table clinker
add foreign key (InterestId) references Interest(ID)

select * 
from clinker
	join Interest
		on clinker.InterestId = Interest.Id
