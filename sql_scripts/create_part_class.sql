use knight_hardware_db;

drop table if exists part_classes;

create table part_classes (
    part_class varchar(2) not null primary key,
    description varchar(255)
);