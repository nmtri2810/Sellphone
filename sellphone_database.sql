create database ShoppingDB;

CREATE TABLE Account(
	`user_mail` varchar(100) NOT NULL,
	`password` varchar(64) NOT NULL,
	`user_name` varchar(50) NOT NULL,
	`user_address` varchar(255) NULL,
	`user_phone` varchar(10) NULL,
    `role_id` int NOT NULL,
PRIMARY KEY 
(
	`user_mail` ASC
) 
);

CREATE TABLE Role(
	`role_id` int AUTO_INCREMENT NOT NULL,
	`role_name` varchar(50) NOT NULL,
PRIMARY KEY 
(
	`role_id` ASC
) 
);

ALTER TABLE Account ADD FOREIGN KEY(`role_id`)
REFERENCES Role (`role_id`);

CREATE TABLE Products(
	`product_id` int AUTO_INCREMENT NOT NULL,
	`product_name` varchar(100) NOT NULL,
	`product_des` varchar(255) NULL,
	`product_price` Double NOT NULL,
	`product_img_source` varchar(255) NULL,
	`product_type` varchar(100) NULL,
	`product_brand` varchar(100) NULL,
PRIMARY KEY 
(
	`product_id` ASC
) 
);

CREATE TABLE Orders(
	`order_id` int AUTO_INCREMENT NOT NULL,
    `order_date` date NOT NULL DEFAULT (current_date()),
    `order_discount_code` varchar(8) NULL,
	`order_status` int NULL,
    `user_mail` varchar(100) NOT NULL,
PRIMARY KEY 
(
	`order_id` ASC
) 
);

ALTER TABLE Orders ADD FOREIGN KEY(`user_mail`)
REFERENCES Account (`user_mail`);

CREATE TABLE Items_In_Cart(
	`product_id` int NOT NULL,
	`order_id` int NOT NULL,
	`item_quantity` int NULL,
	`item_price` double NULL,
PRIMARY KEY 
(
	`product_id` ASC,
    `order_id` ASC
) 
);

ALTER TABLE Items_In_Cart ADD FOREIGN KEY(`product_id`)
REFERENCES Products (`product_id`);

ALTER TABLE Items_In_Cart ADD FOREIGN KEY(`order_id`)
REFERENCES Orders (`order_id`);


insert into Products(product_name, product_des, product_price, product_img_source, product_type, product_brand)
values
('iPhone 14 Pro Max 128GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
1132.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m_18.png',
'cellphone',
'apple'),
('iPhone 13 128GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
727.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/4/14_1_9_2_9.jpg',
'cellphone',
'apple'),
('iPhone 14 128GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
855.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/i/p/iphone-14-storage-select-202209-6-1inch-y889.jpg',
'cellphone',
'apple'),
('iPhone 14 Pro 128GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
1059.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m_12.png',
'cellphone',
'apple'),
('iPhone 11 64GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
440.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_225.jpg',
'cellphone',
'apple'),
('iPhone 14 Pro Max 256GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
1272.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/_/v_ng_20.png',
'cellphone',
'apple'),
('iPhone 12 64GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
625.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_252.jpg',
'cellphone',
'apple'),
('iPhone 11 128GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
513.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/4/_/4_187_1.jpg',
'cellphone',
'apple'),
('iPhone 13 Pro Max 128GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
1052.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_51_1_7.jpg',
'cellphone',
'apple'),
('iPhone 13 Pro Max 256GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
1155.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_66_6_2_1_12.jpg',
'cellphone',
'apple');

insert into Products(product_name, product_des, product_price, product_img_source, product_type, product_brand)
values
('iPhone 14 Plus 128GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
922.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-51_4.jpg',
'cellphone',
'apple'),
('iPhone 12 128GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
679.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/_/2_241_2.jpg',
'cellphone',
'apple'),
('iPhone 14 Plus 256GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
1045.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/h/photo_2022-09-28_21-58-51_6.jpg',
'cellphone',
'apple'),
('iPhone 12 Pro 256GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
1063.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_251_3.jpg',
'cellphone',
'apple'),
('iPhone 14 Pro Max 512GB',
N'Màn hình: 6.7", Super Retina XDR
HĐH: iOS 16
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
1531.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m-iphone-14-pro_2.png',
'cellphone',
'apple'),
('Samsung Galaxy S23 Ultra 256GB',
N'Màn hình: 6.9", Super Retina XDR
HĐH: android 19
CPU: Samsung A14 Bionic 8 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
1105.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/2/s23-ultra-tim.png',
'cellphone',
'samsung'),
('Samsung Galaxy S22 Ultra 128GB',
N'Màn hình: 6.9", Super Retina XDR
HĐH: android 19
CPU: Samsung A14 Bionic 8 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
743.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_burgundy_211119.jpg',
'cellphone',
'samsung'),
('Samsung Galaxy Z Flip4 128GB',
N'Màn hình: 6.9", Super Retina XDR
HĐH: android 19
CPU: Samsung A14 Bionic 8 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
820.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung_galaxy_z_flip_m_i_2022-1_1.jpg',
'cellphone',
'samsung'),
('Samsung Galaxy S20 FE 256GB',
N'Màn hình: 6.9", Super Retina XDR
HĐH: android 19
CPU: Samsung A14 Bionic 8 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
373.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-20-fe_4_.jpg',
'cellphone',
'samsung'),
('Samsung Galaxy A34 5G 128GB',
N'Màn hình: 6.9", Super Retina XDR
HĐH: android 19
CPU: Samsung A14 Bionic 8 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
313.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-a346_galaxy_a34_5g_awesome_silver_front.png',
'cellphone',
'samsung');

insert into Products(product_name, product_des, product_price, product_img_source, product_type, product_brand)
values
('Xiaomi Redmi Note 12',
N'Màn hình: 6.8", Super Retina XDR
HĐH: android 18
CPU: Xiaomi A11 Bionic 8 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
190.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/t/gtt_7766_3__1.jpg',
'cellphone',
'xiaomi'),
('Xiaomi Redmi Note 12 Pro 5G',
N'Màn hình: 6.8", Super Retina XDR
HĐH: android 18
CPU: Xiaomi A11 Bionic 8 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
382.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/t/gtt7766.jpg',
'cellphone',
'xiaomi'),
('Xiaomi Redmi Note 11 Pro',
N'Màn hình: 6.8", Super Retina XDR
HĐH: android 18
CPU: Xiaomi A11 Bionic 8 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
254.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_i_xu_ng_2_18.png',
'cellphone',
'xiaomi'),
('Xiaomi 13 256GB',
N'Màn hình: 6.8", Super Retina XDR
HĐH: android 18
CPU: Xiaomi A11 Bionic 8 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
764.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/m/pms_1670745783.80967984.png',
'cellphone',
'xiaomi'),
('Huawei P30',
N'Màn hình: 6.7", Super Retina XDR
HĐH: android 17
CPU: Huawei A17 Bionic 7 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
614.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/e/l/elle_aurora_rear_rgb-500x500_1.png',
'cellphone',
'huawei'),
('Huawei P40',
N'Màn hình: 6.7", Super Retina XDR
HĐH: android 17
CPU: Huawei A17 Bionic 7 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
676.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/4/p40_0000_layer_2.jpg',
'cellphone',
'huawei'),
('Huawei Mate 20',
N'Màn hình: 6.7", Super Retina XDR
HĐH: android 17
CPU: Huawei A17 Bionic 7 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
679.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/6/3/636753307469671737_huawei-mate20-xanhden-1_1_2.jpg',
'cellphone',
'huawei'),
('Huawei Nova Y60',
N'Màn hình: 6.7", Super Retina XDR
HĐH: android 17
CPU: Huawei A17 Bionic 7 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
345.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/h/u/huawei-nova-y60-600x600.jpg',
'cellphone',
'huawei'),
('OPPO Reno8 T 128GB',
N'Màn hình: 6.9", Super Retina XDR
HĐH: android 19
CPU: Oppo A18 Bionic 10 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
424.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/o/p/oppo-reno8t-vang1-thumb-600x600.jpg',
'cellphone',
'oppo'),
('OPPO Find N2 Flip',
N'Màn hình: 6.9", Super Retina XDR
HĐH: android 19
CPU: Oppo A18 Bionic 10 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
850.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/2/n2_flip_-_combo_product_-_black.png',
'cellphone',
'oppo'),
('OPPO A77s',
N'Màn hình: 6.9", Super Retina XDR
HĐH: android 19
CPU: Oppo A18 Bionic 10 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
297.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_a77s-_en_2.jpg',
'cellphone',
'oppo'),
('OPPO A57',
N'Màn hình: 6.9", Super Retina XDR
HĐH: android 19
CPU: Oppo A18 Bionic 10 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
172.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_a57_-_black.jpg',
'cellphone',
'oppo');

insert into role (role_name)
VALUES 
('admin'),
('user');

insert into Account (user_mail, password, user_name, user_address, user_phone, role_id) 
VALUES 
(N'duongdt@fpt.com.vn', N'123', N'Đinh Tùng Dương', N'Đại học FPT', N'0765870407', 1),
(N'quytd@fpt.com.vn', N'456', N'Thái Duy Quý', N'Đại học Đà Lạt', N'0123456789', 1),
(N'trinm@gmail.com', N'123', N'Nguyễn Minh Trí', N'Hà Nội', N'0123456789', 2),
(N'test123@yahoo.com', N'456', N'Nguyễn Văn A', N'Đà Nẵng', N'0123456782', 2);

insert into Products(product_name, product_des, product_price, product_img_source, product_type, product_brand)
values
('Xiaomi Redmi Note 12 test',
N'Màn hình: 6.8", Super Retina XDR
HĐH: android 18
CPU: Xiaomi A11 Bionic 8 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',
190.99,
'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/t/gtt_7766_3__1.jpg',
'cellphone',
'xiaomi');

select * from account;

select * from products;

select * from orders;

select * from items_in_cart
order by order_id;



