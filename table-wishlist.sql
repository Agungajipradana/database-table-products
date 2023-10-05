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


