select Name
from Artist
where Name like 'A%' -- this means give us all artists whos name starts with A and follows with any amount of characters

select Name
from Artist
where Name like '%s' -- this means give us all artists whos name ends with S

select Name
from Artist
where Name like '%m%' -- this gives us all artists that have the character m in their name

select Name
from Artist
where ArtistId in (1, 24, 57, 112) -- gives us the 4 artists at those artistID slots.

select Name
from Artist
where ArtistId in (1, 24, 57, 112) and ArtistId > 100 -- gives us the artist whos ArtistID is greater than 100 out of those 4 options.

-- inner join
-- artist that have matching albums
select Artist.Name as ArtistName, Album.Title as AlbumName -- only shows artists that also have an album.
from Artist
	join Album
		on Artist.ArtistId = Album.ArtistId

-- left outer join
-- all artists and any matching albums if they exist.
select Artist.Name as ArtistName, Album.Title as AlbumName -- Left Join gets all of the artists and if they have an album it shows, if not null.
from Artist
	left join Album
		on Artist.ArtistId = Album.ArtistId

-- right outer join
-- all albums and any matching artist
select Artist.Name as ArtistName, Album.Title as AlbumName -- Right Join gets all of the albums and the artists attached.
from Artist
	right join Album
		on Artist.ArtistId = Album.ArtistId

-- left outer join with where
-- all artists that don't have an album
select Artist.Name as ArtistName, Album.Title as AlbumName -- Left Join gets all of the artists and if they have an album it shows, if not null.
from Artist
	left join Album
		on Artist.ArtistId = Album.ArtistId
		where Album.Title is null

-- all albums with an artist thats name starts with A
select Album.*
from Album
	join Artist
		on Album.ArtistId = Artist.ArtistId
		where Artist.Name like 'a%'
--UNION -- union pulls together both of these queries. 
--EXCEPT -- only those from the first set that don't appear in the second set
-- all Albums that have at least one track that start with a B
select distinct Album.*
from Album 
	join Track
		on Track.AlbumId = Album.AlbumId
			where Track.Name like 'B%'
				order by Album.Title desc -- add desc if looking for descending. Ascending is natural, default.

--SUBQUERY-- Same as the above query that gets all albums with an artist thats name starts with an A. 
select * -- Just a different way of solving the same problem. 
from Album
where ArtistId in (select ArtistId from Artist where Name like 'a%')

--ORDERING -- all Albums that have at least one track that start with a B in descending order
select distinct Album.*
from Album 
	join Track
		on Track.AlbumId = Album.AlbumId
			where Track.Name like 'B%'
				order by Album.Title desc -- add desc if looking for descending. Ascending is natural, default.

select ArtistId, count(*) as AlbumCount-- count(*) Aggregates all of the rows and collapses it into single row that lists the rows that exist.
from Album
where ArtistId in (select ArtistId from Artist where Name like 'a%')
group by ArtistId -- this query will take the artist Id and list out the album count for that artist.


select Artist.ArtistId, Artist.Name, count(*) as AlbumCount
from Album
	join Artist
		on Album.ArtistId = Artist.ArtistId
		where Artist.Name like 'a%'
		group by artist.ArtistId, Artist.Name

select invoiceId, sum(unitprice * quantity)
from InvoiceLine
group by InvoiceId