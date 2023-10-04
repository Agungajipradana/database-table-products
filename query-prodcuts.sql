create table products (
	id varchar(10) not null,
	name varchar(100) not null,
	description text,
	price int not null,
	quantity int not null default 0,
	created_at timestamp not null default current_timestamp
);

-- menampilkan semua data yang berada didalam tabel products
select * from products;
-- menampilkan data berdasarkan nama kolom yang berada didalam tabel products
select id, name, price, quantity from products;
-- memasukkan data ke dalam tabel products secara satu persatu
insert into products(id, name, price, quantity)
values('P0001', 'Mie Ayam Original', 15000, 100)

insert into products(id, name, description, price, quantity)
values('P0002', 'Mie Ayam Bakso Tahu', 'Mie Ayam Original + Bakso Tahu', 20000, 100)

-- memasukkan data ke dalam tabel products dengan lebih dari satu data
insert into products(id, name, price, quantity)
values('P0003', 'Mie Ayam Ceker', 20000, 100),
   	('P0004', 'Mie Ayam Spesial', 25000, 100),
	('P0005', 'Mie Ayam Yamin', 15000, 100)

-- mendajadikan id sebagai primary key yang berada didalam tabel products
alter table products
add primary key (id);

-- menampilkan data id, name, price, quantity dari tabel products berdasarkan quantity = 0
select id, name, price, quantity from products where quantity = 0

-- menampilkan data id, name, price, quantity dari tabel products berdasarkan price = 20000
select id, name, price, quantity from products where price = 20000

-- menampilkan data id, name, price, quantity dari tabel products berdasarkan id = 'P0004'
select id, name, price, quantity from products where id = 'P0004'

-- membuat type PRODUCT_CATEGORY
create type PRODUCT_CATEGORY as enum ('Makanan', 'Minuman', 'Lain-lain');

-- menambahkan column category yang mempunyai type PRODUCT_CATEGORY pada tabel products
alter table products add column category PRODUCT_CATEGORY;

-- merubah data yang berada pada tabel products pada column category berdasarkan id
update products set category = 'Makanan' where id = 'P0001'
update products set category = 'Makanan' where id = 'P0002'
update products set category = 'Makanan' where id = 'P0003'
update products set category = 'Makanan' where id = 'P0004'
update products set category = 'Makanan' where id = 'P0005'

-- merubah data yang berada pada tabel products pada column category, description berdasarkan id  
update products set category = 'Makanan', description = 'Mie Ayam + Ceker' where id = 'P0003'

-- merubah data yang berada pada tabel products pada column price = harga lama + 5000 berdasarkan id
update products set price = price + 5000 where id = 'P0004'

-- menambahkan data ke dalam tabel products
insert into products(id, name, price, quantity, category) 
values ('P0009', 'Contoh', 10000, 100, 'Minuman')

-- menghapus data yang berada pada tabel products berdasarkan id
delete from products where id = 'P0009'

-- menampilkan data berdasarkan nama kolom dengan alias yang berada pada tabel products
select id as Kode, price as Harga, description as Deskripsi from products

-- menampilkan data berdasarkan nama kolom dengan alias menggunakan " " untuk menamakan lebih dari satu nama yang berada pada tabel products
select id as "Kode Barang", price as "Harga Barang", description as "Deskripsi Barang" from products

-- menampilkan data berdasarkan nama tabel dengan alias yang berada pada tabel products
select p.id as "Kode Barang", 
	   p.price as "Harga Barang", 
	   p.description as "Deskripsi Barang" 
from products as p

-- menampilkan data yang berada pada tabel products yang memiliki price lebih (>) 15000
select * from products where price > 15000
-- menampilkan data yang berada pada tabel products yang memiliki price kurang dari (<=) 15000
select * from products where price <= 15000
-- menampilkan data yang berada pada tabel products yang memiliki category tidak sama dengan (!=) minuman
select * from products where category != 'Minuman'

-- menampilkan data yang berada pada tabel products dengan operator AND
select * from products where price > 15000 and category = 'Makanan'

-- memasukan data ke dalam tabel products
insert into products(id, name, price, quantity, category)
values ('P0006', 'Es teh tawar', 10000, 100, 'Minuman'),
	   ('P0007', 'Es Campur', 20000, 100, 'Minuman'),
	   ('P0008', 'Jus Jeruk', 15000, 100, 'Minuman')
	   
-- menampilkan data yang berada pada tabel products dengan operator AND
select * from products where price > 15000 and category = 'Minuman'

-- menampilkan data yang berada pada tabel products dengan operator OR
select * from products where price > 15000 or category = 'Makanan'



