create database knight_hardware_db;

create user 'knight'@'localhost'
identified by 'kwak_rules';

grant all on knight_hardware_db.* to 'knight'@'localhost';