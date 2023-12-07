create table products(
id Integer,
product_id Integer not null,
product_name Varchar(50) not null,
manufacturing_date date,
warranty_duration_months Integer,
product_description Varchar(255),
created_date date,
updated_date date,
created_by VARCHAR(255),
updated_by VARCHAR(255),
primary key (id)
);

create table inventory_details(
id Integer,
product_id Integer not null,
price Integer not null,
quantity Integer default 0,
created_date date,
updated_date date,
created_by VARCHAR(255),
updated_by VARCHAR(255),
primary key (id),
foreign key (product_id) references products(id)
);


INSERT INTO public.products
(id, product_id, product_name, manufacturing_date, warranty_duration_months, product_description, created_date, updated_date, created_by, updated_by)
VALUES(1, 1, 'Samsung Fridge', '2023-7-14', 14, 'colloquially fridge,thermally insulated compartment', '2023-12-06', '2023-12-06', 'Dharanish', 'Bala');

INSERT INTO public.products
(id, product_id, product_name, manufacturing_date, warranty_duration_months, product_description, created_date, updated_date, created_by, updated_by)
VALUES(2, 2, 'Closet', '2023-4-12', 48, 'utensil holder,plywood', '2023-12-07', '2023-12-07', 'Bala', 'Dharanish');

INSERT INTO public.products
(id, product_id, product_name, manufacturing_date, warranty_duration_months, product_description, created_date, updated_date, created_by, updated_by)
VALUES(3, 3, 'Web camera', '2023-8-12', 12, '360 degree,4k vision', '2023-12-08', '2023-12-08', 'Dharanish', 'Bala');

INSERT INTO public.inventory_details
(id, product_id, price, quantity, created_date, updated_date, created_by, updated_by)
VALUES(1, 1, 150000, 2, '2023-12-20', '2023-12-20', 'Dharanish', 'Bala');

INSERT INTO public.inventory_details
(id, product_id, price, quantity, created_date, updated_date, created_by, updated_by)
VALUES(2, 2, 170000, 1, '2023-12-25', '2023-12-25', 'Bala', 'Dharanish');

alter table products 
alter column product_name type VARCHAR(200);

alter table products 
rename product_name to prod_name;

select * from products;
select prod_name from products p ;

select prod_name from products p
inner join inventory_details i on p.id =i.id ;

select prod_name,quantity  from products p
left join inventory_details i on p.id=i.id;

select count(*) as Produc_Count from products p 

select created_by,count(*)  from products p 
group by created_by order by created_by 

select created_by,count(*)  from products p 
group by created_by order by created_by limit 1

explain select * from products p where prod_name='Samsung Fridge'

create index idx_prod_name
on products(prod_name)

explain select * from products p where prod_name='Samsung Fridge'

