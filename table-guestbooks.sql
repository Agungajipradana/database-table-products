create table guestbooks(
	id 		serial 			not null,
	email 	varchar(100) 	not null,
	title 	varchar(100) 	not null,
	content text,
	primary key (id)
)

select * from guestbooks

select * from customer

insert into guestbooks(email, title, content)
values ('agungaji@gmail.com', 'feedback agung', 'ini feedback agung'),
	   ('agungaji@gmail.com', 'feedback agung', 'ini feedback agung'),
	   ('budi@gmail.com', 'feedback budi', 'ini feedback budi'),
	   ('rully@gmail.com', 'feedback rully', 'ini feedback rully'),
	   ('tono@gmail.com', 'feedback tono', 'ini feedback tono'),
	   ('tono@gmail.com', 'feedback tono', 'ini feedback tono')
	   
-- set operator

-- penggunaan set operator union

select distinct email from customer union select distinct email from guestbooks

-- Note penggunaan union: operasi menggabungkan dua buah select query, dimana jika terdapat data yang duplikat,
--						  data duplikatnya akan dihapus dari hasil query. Jadi pada hasil diatas adalah
--						  column "email" pada table "customer" dan column "email" pada table "guestbooks" 
--						  akan digabung dan jika ada data yang sama maka akan dijadikan satu data.
	

-- penggunaan set operator union all

select distinct email from customer union all select distinct email from guestbooks

-- Note penggunaan union all: operasi yang sama dengan union, tetapi union all jika terdapat data yang duplikat,
--						  	  data duplikatnya akan ditamplilkan sebanyak maksimal 2 data dari hasil query. 
--							  Jadi pada hasil diatas adalah column "email" pada table "customer" dan 
--							  column "email" pada table "guestbooks" akan digabung, dan jika ada data yang sama maka 
--							  akan ditampilkan sebanyak maksimal 2 data.

-- penggunaan set operator union all tidak dengan "distinct" akan menampilkan data sebanyak lebih dari 2 kali
select email from customer union all  select email from guestbooks

-- penggunaan set operator union all dengan "count" agar menampilkan berapa banyak email yang ada pada 
-- column email pada table customer dan column email pada table guestbooks dengan alias "contoh" di group by email
select email, count(email) from (select email from customer union all select email from guestbooks) as contoh
group by email

-- penggunaan set operator intersect

select distinct email from customer intersect select distinct email from guestbooks

-- Note penggunaan intersect: Akan menampilkan data yang sama pada column "email" pada tabel "customer" dan
--							  column "email" pada tabel "guestbooks" tetapi hanya menampilkan data yang sama, 
--							  Jadi pada hasil diatas adalah column "email" pada table "customer" dan 
--							  column "email" pada table "guestbooks" akan digabung, dan data yang ditampilkan hanya
--							  data yang sama dan jika data yang sama duplikat atau lebih dari 1 maka data tersebut
--							  tetap akan ditampilkan hanya 1 saja

-- penggunaan set operator except

select distinct email from customer except select distinct email from guestbooks

-- Note penggunaan except : Akan menampilkan data pada column "email" pada tabel "customer" yang tidak ada dengan
--							column "email" pada tabel "guestbooks".  
--							Jadi pada hasil diatas adalah column "email" pada table "customer" dan 
--							column "email" pada table "guestbooks" hanya menampilkan data pada tabel "customer"
--							yang dimana data tersebut tidak ada pada tabel "guestbooks"

-- transaction

start transaction

insert into guestbooks(email, title, content)
values ('transaction@gmail.com', 'transaction', 'transaction')

insert into guestbooks(email, title, content)
values ('transaction@gmail.com', 'transaction', 'transaction 2')

insert into guestbooks(email, title, content)
values ('transaction@gmail.com', 'transaction', 'transaction 3')

insert into guestbooks(email, title, content)
values ('transaction@gmail.com', 'transaction', 'transaction 4')

insert into guestbooks(email, title, content)
values ('transaction@gmail.com', 'transaction', 'transaction 5')

select * from guestbooks

-- pada saat melakukan "start transaction" dan memasukan data ke tabel, nanti data akan bersifat sementara
-- dan saat melakukkan perintah "commit" data yang dimasukan bersifat permanen
commit

-- rollback

start transaction

insert into guestbooks(email, title, content)
values ('transaction@gmail.com', 'transaction', 'rollback')

insert into guestbooks(email, title, content)
values ('transaction@gmail.com', 'transaction', 'rollback 2')

insert into guestbooks(email, title, content)
values ('transaction@gmail.com', 'transaction', 'rollback 3')

insert into guestbooks(email, title, content)
values ('transaction@gmail.com', 'transaction', 'rollback 4')

insert into guestbooks(email, title, content)
values ('transaction@gmail.com', 'transaction', 'rollback 5')

select * from guestbooks

-- pada saat melakukan "start transaction" dan memasukan data ke tabel, nanti data akan bersifat sementara
-- dan saat melakukkan perintah "rollback" data yang dimasukan tadi akan hilang/dihapus karna biasanya
-- penggunaan rollback digunakan jika ada salah satu data yang gagal/bermasalah 

rollback
