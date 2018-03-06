insert into products (name, description, price, image_path) 
values ('Persistence of Memory', '4 Canvas Panels 7" x 11"', 47.52, 'images/PofM.png');
insert into products (name, description, price, image_path) 
Values ('Ship With Butterfly Sails', '11" X 15" Poster', 14.99, 'images/Butterfly Sails.jpg');
insert into products (name, description, price, image_path) 
values ('The Anthropomorphic Cabinet', 'Galaxy S6 Edge Case', 24.99, 'images/The Anthropomorphic Cabinet.jpg');

insert into categories (name, description) Values ('Clothing', 'Dali artwork on t-shirts, hoodies and more.' );
insert into categories (name, description) Values ('Sculptures and Collectibles',  'Dali art in 3D. ' );

update products Set category_id = 1 Where product_id = 1 or product_id = 2;
update products Set category_id = 2 Where product_id = 3;

insert into customers (first_name, last_name, address1, city, state, zip, phone, email) 
values ('Miles', 'Dyson', '18144 El Camino Real', 'Sunnyvale', 'CA',  94043, 6025552122, ' mdyson@cyberdyne.com' ) ;

insert into delivery_address (first_name, last_name, address1, address2, city, state, zip, phone, email) 
values ('Sarah', 'Connor', '225 S Providence', '', 'Palo Alto', 'CA', 94020, 6505551245, 'sconnor@sky.net');

insert into orders (customer_id, delivery_address_id, order_date, total, tax)
values (1, 1, '1985-2-28', 20.27, 2.29);

insert into order_items (order_id, product_id, sell_price) values (1,2,14.99);
insert into order_items (order_id, product_id, sell_price) values (1,1,47.52);