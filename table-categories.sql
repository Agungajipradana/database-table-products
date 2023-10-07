create table categories(
	id 		varchar(10)  not null,
	name 	varchar(100) not null,
	primary key(id)
)


select * from categories

insert into categories(id, name)
values ('C0001', 'Makanan'),
	   ('C0002', 'Minuman')
	   
insert into categories(id, name)
values ('C0003', 'Gadget'),
	   ('C0004', 'Laptop'),
	   ('C0005', 'Pulsa')

-- Penggunaan inner join
-- Note:inner join dan join tidak memiliki perbedaan

-- menampilkan data pada tabel categories dengan inner join pada column id_category di tabel products yang berelasi
-- pada column id pada tabel categories
select * from categories
inner join products on products.id_category = categories.id

-- Note Penggunaan inner join: Jika ada data di tabel pertama yang tidak memiliki relasi di tabel kedua ataupun 
--							   sebaliknya, maka hasil inner join tidak akan ditampilkan. Pada contoh penggunaan 
--							   inner join diatas, data yang keluar hanya tabel/column yang memiliki relasi saja.


-- Penggunaan left join
select * from categories
left join products on products.id_category = categories.id

-- Note penggunaan left join: Jika ada data di tabel pertama yang tidak memiliki relasi di tabel kedua 
--							  maka hasil left join akan menampilkan semua data yang ada pada tabel pertama 
--							  tetapi jika tidak memiliki relasi di table kedua, maka hasilnya akan null.
--							  berbeda dengan inner join/join tidak akan menampilkan data yang tidak memiliki relasi. 
--							  Pada contoh penggunaan left join diatas, tabel pertama menampilkan semua data. 
--					          pada tabel kedua yang tidak memiliki relasi akan menampilkan null

-- Penggunaan right join
select * from categories
right join products on products.id_category = categories.id

-- Note penggunaan right join: Kebalikan dari left join. Jika ada data di tabel pertama yang tidak memiliki 
--							   relasi di tabel kedua maka hasil right join pada tabel pertama adalah null.
--							   Tetapi pada table kedua, akan menampilkan semua data yang ada pada tabel kedua.
--							   berbeda dengan inner join/join tidak akan menampilkan data yang tidak memiliki relasi. 
--							   Pada contoh penggunaan right join diatas, tabel pertama yang tidak memiliki
--							   relasi pada tabel kedua akan menampilkan null. 
--					           pada tabel kedua yang tidak memiliki relasi akan menampilkan semua data


-- Penggunaan full join
select * from categories
full join products on products.id_category = categories.id

-- Note penggunaan full join:  Kombinasi/gabungan dari left join dan right join.
--							   Jika ada data di tabel pertama yang tidak memiliki relasi di tabel kedua 
--							   maka hasil full join pada tabel pertama akan menampilkan semua data yang ada pada
--							   tabel pertama.
--							   pada table kedua juga sama, akan menampilkan semua data yang ada pada tabel kedua.
--							   berbeda dengan inner join/join tidak akan menampilkan data yang tidak memiliki relasi. 
--							   Pada contoh penggunaan full join diatas, tabel pertama yang tidak memiliki
--							   relasi pada tabel kedua akan menampilkan semua data. 
--					           pada tabel kedua yang tidak memiliki relasi akan menampilkan semua data juga

	
	   

	   