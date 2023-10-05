-- membuat id secara serial (auto increment)
create table admin(
	id serial not null,
	first_name varchar(100) not null,
	last_name varchar(100),
	primary key (id)
);

select * from admin

-- memasukkan data first_name dan last_name ke dalam tabel admin tanpa memasukan id karna id sudah auto increment
insert into admin(first_name, last_name)
values ('Agung', 'Aji'),
	   ('Budi', 'Nugraha'),
	   ('Joko', 'Morro');
	   
-- melihat id terakhir dengan currval pada sequence admin_id_seq
select currval('admin_id_seq')

-- membuat sequence dengan nama contoh_sequence untuk membuat auto increment
create sequence contoh_sequence

-- menammbahkan nilai pada sequence contoh_sequence setiap nextval dijalankan/dipanggil
select nextval('contoh_sequence')

-- melihat id terakhir dengan currval pada sequence contoh_sequence
select currval('contoh_sequence')
	   
	   