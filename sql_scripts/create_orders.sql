use knight_hardware_db;

drop table if exists orders;

create table orders (
    order_number int not null primary key,
    customer_number int not null,
    order_date date,
    foreign key (customer_number) references customers(customer_number)
);