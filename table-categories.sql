create table categories(
	id 		varchar(10)  not null,
	name 	varchar(100) not null,
	primary key(id)
)


select * from categories

insert into categories(id, name)
values ('C0001', 'Makanan'),
	   ('C0002', 'Minuman')
	   