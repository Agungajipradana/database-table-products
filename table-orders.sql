create table orders(
	id 			serial 		not null,
	total 		int 		not null,
	order_date 	timestamp 	not null default current_timestamp,
	primary key (id)
)

select * from orders

-- memasukan data ke dalam column total pada tabel orders sebagai data dummy
insert into orders(total)
values (1),
  	   (1),
	   (1)

-- menampilkan data pada tabel orders dengan join pada table orders_detail pada column id_order yang berelasi 
-- pada tabel orders pada column id. Dan menampilkan data pada tabel orders dengan join pada table orders_detail 
-- pada column id_product yang berelasi pada tabel products pada column id
select * from orders
	join orders_detail on orders_detail.id_order = orders.id
	join products on orders_detail.id_product = products.id

-- menampilkan data pada tabel orders dengan join pada table orders_detail pada column id_order yang berelasi 
-- pada tabel orders pada column id. Dan menampilkan data pada tabel orders dengan join pada table orders_detail 
-- pada column id_product yang berelasi pada tabel products pada column id 
-- berdasarkan id  = 1 pada tabel orders
select * from orders
	join orders_detail on orders_detail.id_order = orders.id
	join products on orders_detail.id_product = products.id
where orders.id = 1
	   
