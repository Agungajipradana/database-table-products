create table orders_detail(
	id_product 	varchar(10)	not null,
	id_order 	int 		not null,
	price 		int 		not null,
	quantity	int			not null,
	primary key (id_product, id_order)
)

select * from orders_detail

-- pada tabel orders_detail membuat "id_product" sebagai foreign key dan berelasi ke id pada tabel products 
alter table orders_detail add constraint fk_orders_detail_product foreign key (id_product) references products(id)

-- pada tabel orders_detail membuat "id_order" sebagai foreign key dan berelasi ke id pada tabel orders
alter table orders_detail add constraint fk_orders_detail_order foreign key (id_order) references orders(id)

select * from products order by id

-- memasukan data dummy
insert into orders_detail (id_product, id_order, price, quantity)
values ('P0001', 1, 1000, 2),
	   ('P0002', 1, 1000, 2),
	   ('P0003', 1, 1000, 2)
	   
insert into orders_detail (id_product, id_order, price, quantity)
values ('P0004', 2, 1000, 2),
	   ('P0006', 2, 1000, 2),
	   ('P0007', 2, 1000, 2)
	   
insert into orders_detail (id_product, id_order, price, quantity)
values ('P0001', 3, 1000, 2),
	   ('P0004', 3, 1000, 2),
	   ('P0005', 3, 1000, 2)



