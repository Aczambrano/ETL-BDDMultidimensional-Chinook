-- Dataframe de Album
select title from albums;

-- Dataframe de artists
select name from artists;

-- Dataframe de customers
select FirstName, LastName,  Phone, Fax, Email from customers;

-- Dataframe de employees
select LastName, FirstName, Title, BirthDate, HireDate, Address, City, State,
Country, PostalCode, Phone, Fax, Email from employees;

-- Dataframe de Album
select UnitPrice, Quantity from invoice_items;


-- Dataframe de invoices
select BillingAddress as Address, BillingCity as City, BillingState as State, BillingCountry as Country,
BillingPostalCode as PostalCode from invoices;


-- Dataframe de tiempo
select fecha, año, mes, dia,
nombre_dia, dia_semana, semana, trimestre from Dim_Time;


-- Dataframe de tracks
select t.name, mt.Name as Mediatype, g.Name as Genre, t.Composer, t.Milliseconds,t.Bytes,t.UnitPrice 
from tracks t inner join media_types mt
on t.MediaTypeId  = mt.MediaTypeId inner join genres g
on t.GenreId = g.GenreId;


-- Dataframe de Tabla de Hechos
SELECT invoice_items.InvoiceLineId as InvoicesId, customers.CustomerId,
employees.EmployeeId,dim_time.Timeid,
invoices.InvoiceId as LocationId, tracks.TrackId, artists.ArtistId, albums.AlbumId, invoices.Total
FROM invoices INNER JOIN customers
ON invoices.CustomerId= customers.CustomerId
INNER JOIN employees
ON customers.SupportRepId = employees.EmployeeId
INNER JOIN invoice_items
ON invoice_items.InvoiceId= invoices.InvoiceId
INNER JOIN tracks
ON tracks.TrackId=  invoice_items.TrackId
INNER JOIN albums
ON tracks.AlbumId= albums.AlbumId
INNER JOIN artists 
ON albums.ArtistId= artists.ArtistId 
INNER JOIN dim_time
ON invoices.InvoiceDate = substr(dim_time.fecha,0,20);

--
