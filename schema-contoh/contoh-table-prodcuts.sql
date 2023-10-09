-- pindah schema dari schema public ke schema contoh
set search_path to contoh

-- -- melihat schema tempat ditaruh table saat ini
select current_schema()

-- membuat table products dan ditaruh pada schema contoh
create table contoh.products(
	id 		serial 			not null,
	name 	varchar(100) 	not null,
	primary key (id)
)

select * from products


