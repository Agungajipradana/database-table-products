-- membuat table wishlist dengan foreign key
create table wishlist (
	id 			serial 		not null,
	id_product 	varchar(10) not null,
	description text,
	primary key (id),
	constraint fk_wishlist_product foreign key (id_product) references products(id)
)

-- Note: pada column id_product dia berelasi ke id yang memiiliki primary key yang berada pada tabel products
--		 jadi id_product harus memiliki tipe data yang sama yaitu varchar(10)

select * from wishlist

-- jika tabel sudah dibuat dan lupa menambahkan foreign key kita dapat menambahkanya tanpa harus membuat tabel ulang
alter table wishlist add constraint fk_wishlist_product foreign key (id_product) references products(id)

-- menambahkan data yang salah ke dalam table wishlist dengan relasi ke tabel products
-- ERROR:  insert or update on table "wishlist" violates foreign key constraint "fk_wishlist_product"
-- DETAIL:  Key (id_product)=(salah) is not present in table "products". 
-- karena id "salah" tidak ada pada tabel products
insert into wishlist(id_product, description) values ('salah', 'contoh salah')

-- menambahkan data yang benar ke dalam table wishlist dengan relasi ke tabel products
insert into wishlist(id_product, description) 
values ('P0001', 'Mie ayam kesukaan'),
	   ('P0002', 'Mie ayam kesukaan'),
	   ('P0005', 'Mie ayam kesukaan');

-- menghapus foreign key
alter table wishlist drop constraint fk_wishlist_product

-- menambahkan foreign key yang tadi dihapus tetapi tidak secara default
-- jika secara default dia on delete restrict on update restrict
-- dan sekarang menggunakan on delete cascade on update cascade
alter table wishlist 
add constraint fk_wishlist_product foreign key (id_product) references products(id)
on delete cascade on update cascade;

-- menampilkan semua data pada tabel wishlist pada column id_product(foreign key) yang berelasi pada tabel products
-- pada column id (primary key) dengan join table
select * from wishlist join products on wishlist.id_product = products.id

-- menampilkan data description pada tabel wishlist pada column id_product(foreign key) yang berelasi 
-- pada tabel products dengan menampilkan data id dan name pada column id (primary key) dengan join table
select products.id, products.name, wishlist.description 
from wishlist join products 
on wishlist.id_product = products.id

-- menampilkan data dengan mempersingkat nama tabel dengan alias description pada tabel wishlist as w pada 
-- column id_product(foreign key) yang berelasi pada tabel products as p dengan menampilkan data id dan name 
-- pada column id (primary key) dengan join table
select p.id, p.name, w.description 
from wishlist as w join products as p
on w.id_product = p.id

-- menambahkan column id_customer dengan tipe data int pada tabel wishlist
alter table wishlist add column id_customer int

-- membuat column id_customer pada tabel wishlist sebagai foreign key dan berelasi 
-- ke tabel customer pada column id(primary key)
alter table wishlist add constraint fk_wishlist_customer foreign key (id_customer) references customer(id)

-- merubah/menambahkan pada column id_customer menjadi nilainya 1, pada column id yang memiliki nilai 2 dan 3
-- pada tabel wishlist
update wishlist set id_customer = 1 where id in (2,3)

-- merubah/menambahkan pada column id_customer menjadi nilainya 4, pada column id yang memiliki nilai 4
-- pada tabel wishlist
update wishlist set id_customer = 4 where id in (4)
-- atau bisa juga seperti ini
update wishlist set id_customer = 4 where id = 4

-- Join Multiple Table
-- Menggunakan alias untuk tabel agar nama tabel lebih singkat dan mudah digunakan.
-- Mengambil kolom 'email' dari tabel 'customer' dengan alias 'c' berdasarkan kolom 'id' (primary key) 
-- sebagai kunci hubung.
-- Mengambil kolom 'description' dari tabel 'wishlist' dengan alias 'w' berdasarkan kolom 'id_product' (foreign key) 
-- yang berhubungan dengan tabel 'products' dengan alias 'p' berdasarkan kolom 'id' (primary key).
-- Mengambil data dari kolom 'id' dan 'name' dari tabel 'products' dengan alias 'p' berdasarkan kolom 'id' (primary key).
-- Menggunakan pernyataan JOIN untuk menghubungkan beberapa tabel berdasarkan kriteria yang sesuai.
select c.email, p.id, p.name, w.description 
from wishlist as w 
	join products as p on w.id_product = p.id
	join customer as c on c.id = w.id_customer
	
	