-- membuat email menjadi constraint dengan nama constraint unique_email dan bersifat unique (tidak boleh sama) 
create table customer(
	id 			serial 			not null,
	email 		varchar(100) 	not null,
	first_name 	varchar(100) 	not null,
	last_name 	varchar(100),
	primary key (id),
	constraint unique_email unique (email)
);

select * from customer

-- memasukkan data ke dalam tabel customer
insert into customer(email, first_name, last_name)
values('agungaji@gmail.com', 'Agung', 'Aji')

-- memasukkan data ke dalam tabel customer dengan email yang sudah dimasukkan sebelumnya dan akan menghasilkan 
-- ERROR: duplicate key value violates unique constraint "unique_email" DETAIL:  Key (email)=(agungaji@gmail.com) 
-- already exists. karena email bersifat unique (tidak boleh sama)
insert into customer(email, first_name, last_name)
values('agungaji@gmail.com', 'Dana', 'Aji')

-- memasukkan beberapa data ke dalam tabel customer
insert into customer(email, first_name, last_name)
values('budi@gmail.com', 'Budi', 'Nugraha'),
	  ('joko@gmail.com', 'Joko', 'Morro'),
	  ('rully@gmail.com', 'Rully', 'Irwansyah')

-- menghapus constraint dengan nama constraint yaitu unique_email pada tabel customers
alter table customer drop constraint unique_email

-- menambahkan constraint dengan nama constraint yaitu unique_email pada tabel customers 
-- (ini digunakan jika sudah terlanjur membuat tabel tetapi lupa memeberikan constraint pada column)
alter table customer add constraint unique_email unique (email)
