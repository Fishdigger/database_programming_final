use knight_hardware_db;

insert into customers (customer_number, name, city, state)
values
(148, "Al's Appliance and Sport", 'Fillmore', 'FL'),
(282, 'Brookings Direct', 'Grove', 'FL'),
(356, "Ferguson's", 'Northfield', 'FL'),
(408, 'The Everything Shop', 'Crystal', 'FL'),
(608, "Johnson's Department Store", 'Sheldon', 'FL');

insert into part_classes (part_class, description)
values
('AP', 'Appliances'),
('HW', 'Housewares'),
('SG', 'Sporting Goods');

insert into parts (part_number, description, on_hand, price, part_class)
values
('AT94', 'Iron', 50, 24.95, 'HW'),
('DR93', 'Gas Range', 8, 495, 'AP'),
('KT03', 'Dishwasher', 8, 595, 'AP'),
('DW11', 'Washer', 12, 399.99, 'AP'),
('KL62', 'Dryer', 12, 349.95, 'AP'),
('BV06', 'Home Gym', 45, 794.95, 'SG'),
('CD52', 'Microwave Oven', 32, 165, 'AP'),
('KV29', 'Treadmill', 9, 1390, 'SG');

insert into orders (order_number, customer_number, order_date)
values
(21608, 148, '2017-10-20'),
(21610, 356, '2017-10-19'),
(21613, 408, '2017-10-22'),
(21614, 282, '2017-10-21'),
(21617, 608, '2017-10-23'),
(21619, 148, '2017-10-23'),
(21623, 608, '2017-10-21');

insert into order_details (order_number, part_number, num_ordered)
values
(21608, 'AT94', 11),
(21610, 'DR93', 1),
(21610, 'DW11', 1),
(21613, 'KL62', 4),
(21614, 'KT03', 2),
(21617, 'BV06', 2),
(21617, 'CD52', 4),
(21619, 'DR93', 1),
(21623, 'KV29', 2);