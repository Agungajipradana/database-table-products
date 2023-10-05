create table sellers(
	id 			serial 			not null,
	name 		varchar(100) 	not null,
	email 		varchar(100) 	not null,
	primary key (id),
	constraint email_unique unique (email)
);

select * from sellers

insert into sellers(name, email)
values('Galeri Olahraga', 'galeri@gmail.com'),
	  ('Toko Tono', 'tono@gmail.com'),
	  ('Toko Budi', 'budi@gmail.com'),
	  ('Toko Rully', 'rully@gmail.com')

-- mencari data pada tabel sellers berdasarkan id dan id adalah sebuah index karena id adalah primary key
-- dan index digunakan untuk mencari data agar lebih cepat tanpa harus membaca semua data telebih dahulu
-- yang berada pada tabel
select * from sellers where id = 1

-- mencari data pada tabel sellers berdasarkan email dan email adalah sebuah index karena email adalah unique
select * from sellers where email = 'tono@gmail.com'

-- mencari data pada tabel sellers berdasarkan id dan name, dimana id adalah sebuah index dan name bukan index
-- jadi data yang dicari akan lebih lama karna salah satu bersifat bukan index
select * from sellers where id = 1 or name = 'Toko Tono'

-- mencari data pada tabel sellers berdasarkan email dan name, dimana email adalah sebuah index dan name bukan index
-- jadi data yang dicari akan lebih lama karna salah satu bersifat bukan index
select * from sellers where email = 'rully@gmail.com' or name = 'Toko Tono'

-- mencari data pada tabel sellers berdasarkan name, dimana email adalah sebuah index dan name bukan index
-- jadi data yang dicari akan lebih lama karna salah satu bersifat bukan index
select * from sellers where name = 'Toko Tono'

-- membuat sebuah index "sellers_id_and_name_index" pada tabel sellers agar ketika memanggil data
-- id dan name akan lebih cepat karna langsung mencari ke indeks tidak perlu mencari ke seluruh data terlebih dahulu
create index sellers_id_and_name_index on sellers(id, name)

-- membuat sebuah index "sellers_email_and_name_index" pada tabel sellers agar ketika memanggil data
-- email dan name akan lebih cepat karna langsung mencari ke indeks tidak perlu mencari ke seluruh data terlebih dahulu
create index sellers_email_and_name_index on sellers(email, name)

-- membuat sebuah index "sellers_name_index" pada tabel sellers agar ketika memanggil data
-- column name akan lebih cepat karna langsung mencari ke indeks tidak perlu mencari ke seluruh data terlebih dahulu
create index sellers_name_index on sellers(name)

-- setelah membuat index "sellers_id_and_name_index" pada tabel sellers maka saat mencari data berdasarkan
-- column id dan name akan cepat karna id dan name sudah bersifat index 
select * from sellers where id = 1 or name = 'Toko Tono'

-- setelah membuat index "sellers_email_and_name_index" pada tabel sellers maka saat mencari data berdasarkan
-- column email dan name akan cepat karna id dan name sudah bersifat index 
select * from sellers where email = 'rully@gmail.com' or name = 'Toko Tono'

-- setelah membuat index "sellers_name_index" pada tabel sellers maka saat mencari data berdasarkan
-- column name akan cepat karna id dan name sudah bersifat index 
select * from sellers where name = 'Toko Tono'

-- Note: Penggunaan index pada sebuah tabel tidak boleh semua data/column bersifat index karna jika semakin banyaknya
--		 data maka akan membuat lambat dalam pengambilan data dan pada tabel sellers seharusnya yang memiliki index
--		 hanya id dan email saja, maka penggunaan index harus sesuai kebutuhan saja.

-- menghapus index
drop index sellers_id_and_name_index
drop index sellers_email_and_name_index
drop index sellers_name_index 




	  
	  