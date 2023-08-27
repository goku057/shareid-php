CREATE TABLE user_info (user_name varchar(57) NOT NULL, user_pass longtext NOT NULL, first_name varchar(57) NOT NULL, last_name varchar(57) NOT NULL, dob date NOT NULL, email text NOT NULL, phone varchar(20) NOT NULL, city varchar(30) NOT NULL, country varchar(57) NOT NULL, PRIMARY KEY (user_name));
CREATE TABLE posts (user_name varchar(57) NOT NULL, post_time datetime NOT NULL, title text NOT NULL , catagory varchar(20) NOT NULL, price int(11) NOT NULL, comment longtext, uid text NOT NULL, upass longtext NOT NULL, status varchar(7) NOT NULL, PRIMARY KEY (user_name, post_time));
CREATE TABLE pending_post (buyer varchar(57) NOT NULL, seller varchar(57) NOT NULL, post_time datetime NOT NULL, trans_id text, PRIMARY KEY (seller, post_time));
CREATE TABLE rating (user_name varchar(57) NOT NULL, rate int(11) NOT NULL);
CREATE TABLE inbox (sender varchar(57) NOT NULL, reciever varchar(57) NOT NULL, msg_time datetime NOT NULL, msg longtext, PRIMARY KEY (sender, reciever, msg_time));
CREATE TABLE admin (admin_id varchar(57) NOT NULL, pass longtext NOT NULL, PRIMARY KEY (admin_id));
ALTER TABLE pending_post ADD INDEX FKpending_po721667 (buyer), ADD CONSTRAINT FKpending_po721667 FOREIGN KEY (buyer) REFERENCES user_info (user_name) ON DELETE CASCADE;
ALTER TABLE pending_post ADD INDEX FKpending_po788440 (seller, post_time), ADD CONSTRAINT FKpending_po788440 FOREIGN KEY (seller, post_time) REFERENCES posts (user_name, post_time) ON DELETE CASCADE;
ALTER TABLE rating ADD INDEX FKrating783820 (user_name), ADD CONSTRAINT FKrating783820 FOREIGN KEY (user_name) REFERENCES user_info (user_name) ON DELETE CASCADE;
ALTER TABLE inbox ADD INDEX FKinbox73443 (sender), ADD CONSTRAINT FKinbox73443 FOREIGN KEY (sender) REFERENCES user_info (user_name) ON DELETE CASCADE;
INSERT INTO user_info VALUES("admin","abcd12345","First","Last","2020-2-2","something@mail.com","00112233","CITY","COUNTRY");
INSERT INTO admin VALUES("admin","12345");