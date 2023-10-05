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

-- menampilkan data yang berada pada tabel products dengan operator OR dan AND
select * from products where quantity > 100 or category = 'Makanan' and price > 15000

-- menampilkan data yang berada pada tabel products dengan prioritas ()
select * from products where category = 'Makanan' or (quantity > 100 and price > 15000)

-- menampilkan data yang berada pada tabel products dengan operator ilike(tidak peduli huruf besar dan kecil)
select * from products where name ilike '%es%'

-- menampilkan data yang berada pada tabel products dengan operator like(huruf sesuai yang ditulis pada syntax)
select * from products where name like '%es%'

-- menampilkan data yang berada pada tabel products dengan operator like(huruf sesuai yang ditulis pada syntax)
select * from products where name like '%Es%'

-- menampilkan data description yang bernilai null yang berada pada tabel products 
select * from products where description is null

-- menampilkan data description yang bernilai not null yang berada pada tabel products 
select * from products where description is not null

-- menampilkan data yang berada pada tabel products diantara price > 10000 dan price < 20000 dengan operator between
select * from products where price between 10000 and 20000

-- menampilkan data yang berada pada tabel products tidak diantara price > 10000 dan price < 20000 dengan operator between
select * from products where price not between 1000 and 20000

-- menampilkan data yang berada pada tabel products dengan category 'Makanan', 'Minuman' dengan operator in
select * from products where category in ('Makanan', 'Minuman')

-- menampilkan data yang berada pada tabel products dengan category 'Minuman' dengan operator in
select * from products where category in ('Minuman')

-- menampilkan data yang berada pada tabel products dengan order by price secara asc dan id secara desc
select * from products order by price asc, id desc

-- menampilkan data yang berada pada tabel products dengan price > 0 dengan order by price secara asc, 
-- id secara desc dan limit 2 data
select * from products where price > 0 order by price asc, id desc limit 2

-- menampilkan data yang berada pada tabel products dengan price > 0 dengan order by price secara asc, 
-- id secara desc, limit 2 data dan offset 2 (mengskip 2 data diawal dan dimulai dari data ke 3)
select * from products where price > 0 order by price asc, id desc limit 2 offset 2

-- menampilkan data pada column category dengan distinct (menghilangkan duplikat) pada tabel products
select distinct category from products

-- menampilkan data id, name, price dengan arithmetic operator (/) 1000 dan price alias price_in_k pada tabel products
select id, name, price / 1000 as price_in_k from products

-- mathematical functions
select pi()
select power(10, 2)
select cos(10), sin(10), tan(10)

-- menampilkan id, name, quantity di pangkatkan dua dengan mathematical functions power (quantity, 2) 
-- alias quantity_power_2 pada tabel products
select id, name, power(quantity, 2) as quantity_power_2 from products

-- menggunakan string function untuk menampilkan lower(name) merubah text name menjadi huruf kecil, 
-- length(name) melihat panjang character, dan lower(description) merubah text name menjadi huruf kecil
select id, lower(name), length(name), lower(description) from products

-- menggunakan date and time function extract untuk melihat tahun dan bulan dari kolom created_at pada tabel products 
select id, extract(year from created_at), extract(month from created_at) from products 

-- menggunakan flow control function atau di bahasa pemrogrman seperti pengkondisian if else
select id, category,
		case category
				when 'Makanan' then 'Enak'
				when 'Minuman' then 'Seger'
				else 'Apa itu?'
		end as category_case
from products;

-- menggunakan flow control function dengan perbandingan atau di bahasa pemrogrman seperti pengkondisian if else
select id, price,
		case 
			when price <= 15000 then 'Murah'
			when price <= 20000 then 'Mahal'
			else 'Mahal Banget'
		end as "apakah murah?"
from products

-- menggunakan flow control function untuk mengecek null atau di bahasa pemrogrman seperti pengkondisian if else
select id, name,
		case 
			when description is null then 'kosong'
			else description
		end as description
from products

-- menggunakan aggregate function
select count(id) as "Total Product" from products
select avg(price) as "Rata-Rata Harga" from products
select max(price) as "Harga Termahal" from products
select min(price) as "Harga Termurah" from products

-- menggunakan group by
select category, count(id) as "Total Product" from products group by category

select category, 
		avg(price) as "Rata-Rata Harga", 
		min(price) as "Harga Termurah",
		max(price) as "Harga Termahal"		
from products 
group by category

-- melihat data di column category yang memiliki total product lebih dari 3 menggunakan having
select category, count(id) as "Total Product" from products group by category having count(id) > 3 

-- melihat data di column category yang memiliki rata-rata price lebih dari 20000 menggunakan having
select category, 
		avg(price) as "Rata-Rata Harga", 
		min(price) as "Harga Termurah",
		max(price) as "Harga Termahal"		
from products 
group by category
having avg(price) >= 20000

-- menambahkan check constraint dengan nama price_check di column price dengan price 
-- lebih dari (>) 1000 pada tabel products
alter table products add constraint price_check check (price > 1000)

-- menambahkan check constraint dengan nama quantity_check di column quantity dengan quantity
-- lebih dari (>=) 0 pada tabel products
alter table products add constraint quantity_check check (quantity >= 0)

-- memasukkan data ke dalam tabel products dengan price < 10 dan quantity < 0 dan akan menghasilkan
-- ERROR:  new row for relation "products" violates check constraint "price_check"
-- DETAIL:  Failing row contains (xxx1, Contoh Gagal, null, 10, 0, 2023-10-06 00:33:48.851849, Minuman).
-- karna pada check constraint, ketika memasukan data ke dalam column price harus > 1000 dan quantity harus > 100
insert into products(id, name, price, quantity, category)
values ('xxx1', 'Contoh Gagal', 10, 0, 'Minuman')

-- mencari data pada tabel products dengan operator ilike
select * from products where name ilike '%mie%'

-- mencari data pada tabel products dengan Full-Text search tanpa index jadi akan lama ketika mencari data
select * from products where to_tsvector(name) @@ to_tsquery('mie')

-- untuk mengecek bahasa apa saja yang tersedia yang nanti digunakan untuk membuat index Full-Text search
select cfgname from pg_ts_config

-- membuat index Full-Text search
create index products_name_search on products using gin (to_tsvector('indonesian', name))
create index products_description_search on products using gin (to_tsvector('indonesian', description))

-- mencari data products berdasarkan name pada tabel products dengan Full-Text search dengan index 
-- pada index yang tadi dibuat yaitu "products_name_search"
select * from products where name @@ to_tsquery('mie')

-- mencari data products berdasarkan description pada tabel products dengan Full-Text search dengan index 
-- pada index yang tadi dibuat yaitu "products_description_search"
select * from products where description @@ to_tsquery('mie')

-- menghapus index 
drop index products_name_search
drop index products_description_search

-- Note: penggunaan Full-Text search tidak se flexible operator like dan ilike karena jika menggunakan
--		 Full-Text search dia akan mencari 1 kata saja seperti "mie", jika mencari dengan kata "mi" atau
--		 "mie ayam" tidak akan tampil
--		 jika ingin mencari lebih dari 1 kata harus menggunakan query operator seperti &, |, !, dan ''''
--		 berbeda dengan operator like dan ilike dia dapat menampilkan per huruf/character

-- mencari data dengan query operator & (AND) pada penggunaan Full-Text search
select * from products where name @@ to_tsquery('mie & ayam')

-- mencari data dengan query operator | pada penggunaan Full-Text search
select * from products where name @@ to_tsquery('mie | bakso')

-- mencari data dengan query operator ! pada penggunaan Full-Text search
select * from products where name @@ to_tsquery('!bakso')

-- mencari data dengan query operator '''' (petik satu 2 kali bukan petik dua) pada penggunaan Full-Text search
select * from products where name @@ to_tsquery('''mie ayam''')





