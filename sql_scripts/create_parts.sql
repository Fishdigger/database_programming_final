use knight_hardware_db;

drop table if exists parts;

create table parts (
    part_number varchar(20) not null primary key,
    description varchar(255),
    on_hand int default 0,
    price decimal(10, 2) default 0.00,
    part_class varchar(2),
    foreign key (part_class) references part_classes(part_class)
);