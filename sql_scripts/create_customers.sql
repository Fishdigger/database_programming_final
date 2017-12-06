use knight_hardware_db;

drop table if exists customers;

create table customers (
    customer_number int not null primary key,
    name varchar(100) not null,
    city varchar(60),
    state varchar(2)
);