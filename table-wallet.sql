create table wallet(
	id 			serial 	not null,
	id_customer int 	not null,
	balance 	int 	not null default 0,
	primary key (id),
	constraint wallet_customer_unique unique (id_customer),
	constraint fk_wallet_customer foreign key (id_customer) references customer (id)
);

-- menghapus constraint Foreign Key "fk_wallet_customer" pada table wallet
ALTER TABLE wallet DROP CONSTRAINT fk_wallet_customer;

-- menghapus constraint Unique atau Primary Key "wallet_customer_unique" pada table wallet
ALTER TABLE wallet DROP CONSTRAINT wallet_customer_unique;

-- menghapus table wallet
DROP TABLE wallet;

select * from wallet
select * from customer

-- memasukan data ke dalam tabel wallet dan id_customer adalah relasi ke table customer (id)
-- maka ketika memasukan id_customer harus sama dengan id yang ada pada table customer 
insert into wallet(id_customer, balance)
values (1, 1000000),
	   (3, 2000000),
	   (4, 3000000),
	   (5, 4000000)
	   
-- menampilkan data pada table customer dengan join table wallet 
select * from customer join wallet on wallet.id_customer = customer.id

-- menampilkan data pada table customer dengan join table wallet jika menggunakan as agar lebih singkat
select * from customer as c join wallet as w on w.id_customer = c.id
