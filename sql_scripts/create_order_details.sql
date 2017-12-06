use knight_hardware_db;

drop table if exists order_details;

create table order_details (
    order_number int not null,
    part_number varchar(20) not null,
    num_ordered int,
    primary key (order_number, part_number),
    foreign key (order_number) references orders(order_number),
    foreign key (part_number) references parts(part_number)
);