INSERT INTO categories (name) VALUES ('Clothes');
INSERT INTO categories (name) VALUES ('Toys');
INSERT INTO categories (name) VALUES ('Electronics');
INSERT INTO categories (name) VALUES ('Games');
INSERT INTO categories (name) VALUES ('Books');

insert into role (name) values ('ROLE_USER');
insert into role (name) values ('ROLE_ADMIN');

insert into users(email, enabled, password) VALUES ('admin@admin.pl',1,'$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW');
insert into user_role(user_id, role_id) values (1,2);

insert into users(email, enabled, password) VALUES ('user@user.pl',1,'$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW');
insert into user_role(user_id, role_id) values (2,1);

insert into users(email, enabled, password) VALUES ('user666@user.pl',1,'$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW');
insert into user_role(user_id, role_id) values (3,1);

insert into users(email, enabled, password) VALUES ('user123@user.pl', 1, '$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW');
insert into user_role(user_id, role_id) values (4, 1);

insert into users(email, enabled, password) VALUES ('user456@user.pl', 1, '$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW');
insert into user_role(user_id, role_id) values (5, 1);

insert into users(email, enabled, password) VALUES ('user789@user.pl', 1, '$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW');
insert into user_role(user_id, role_id) values (6, 1);

INSERT INTO institutions (name, description) VALUES ('Sunshine Day Foundation', 'A foundation that helps children with disabilities by organizing therapies and workshops.');
INSERT INTO institutions (name, description) VALUES ('Joyful Future Foundation', 'A foundation focused on supporting the education of children from low-income families.');
INSERT INTO institutions (name, description) VALUES ('Healthy Generation Foundation', 'A foundation conducting educational programs about a healthy lifestyle for children and youth.');
INSERT INTO institutions (name, description) VALUES ('Creative Development Foundation', 'A foundation supporting creative development in children and youth through various workshops.');
INSERT INTO institutions (name, description) VALUES ('Ecological World Foundation', 'A foundation promoting ecological lifestyles and actions for environmental protection.');
INSERT INTO institutions (name, description) VALUES ('Good Start Foundation', 'A foundation supporting children in their start towards school education.');
INSERT INTO institutions (name, description) VALUES ('Kind Heart Foundation', 'A foundation helping people in need by providing food and clothing.');
INSERT INTO institutions (name, description) VALUES ('Young Talents Foundation', 'A foundation supporting the artistic talent development of children and youth.');
INSERT INTO institutions (name, description) VALUES ('Active Senior Foundation', 'A foundation organizing activities and events for seniors, promoting an active lifestyle.');
INSERT INTO institutions (name, description) VALUES ('Hope for Tomorrow Foundation', 'A foundation helping homeless individuals find shelter and support.');




INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (5, 'Flower Street 5', 'Warsaw', false, '01-234', '2024-06-01', '10:00:00', 'Please contact before arrival.', 2, 2);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (5, 'Flower Street 5', 'Warsaw', false, '01-234', '2024-06-01', '10:00:00', 'Please contact before arrival.', 2, 2);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (3, 'Main Street 10', 'Berlin', true, '12-345', '2024-06-02', '12:00:00', 'Please confirm in advance.', 1, 1);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (7, 'Pomeranian Street 8', 'Gdansk', true, '45-678', '2024-06-03', '15:00:00', 'Please leave at the concierge.', 3, 1);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (2, 'School Street 3', 'Poznan', false, '90-123', '2024-06-04', '14:00:00', 'Please confirm receipt.', 1, 2);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (4, 'Flower Street 7', 'Wroclaw', false, '67-890', '2024-06-05', '16:00:00', 'Please contact to arrange details.', 2, 2);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (8, 'Green Avenue 15', 'Krakow', true, '34-567', '2024-06-06', '09:00:00', 'Please leave at the front desk.', 3, 2);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (6, 'River Road 20', 'Gdynia', false, '56-789', '2024-06-07', '11:00:00', 'Please handle with care.', 5, 1);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (4, 'Mountain View 5', 'Zakopane', false, '78-901', '2024-06-08', '13:00:00', 'Please call before arrival.', 1, 5);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (3, 'Sunny Street 12', 'Sopot', true, '23-456', '2024-06-09', '15:00:00', 'Please leave by the door.', 2, 1);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (5, 'Coastal Road 9', 'Gdansk', true, '45-678', '2024-06-10', '17:00:00', 'Please drop off at the office.', 3, 6);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (7, 'Meadow Lane 3', 'Poznan', false, '89-012', '2024-06-11', '10:00:00', 'Please leave in the mailbox.', 5, 1);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (4, 'Park Street 7', 'Warsaw', true, '01-234', '2024-06-12', '12:00:00', 'Please notify when collected.', 7, 4);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (6, 'Lakeview 10', 'Krakow', false, '34-567', '2024-06-13', '14:00:00', 'Please leave in the garage.', 3, 4);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (5, 'Forest Lane 8', 'Zakopane', false, '56-789', '2024-06-14', '16:00:00', 'Please knock before dropping off.', 5, 3);
INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (3, 'Highway 15', 'Gdansk', true, '23-456', '2024-06-15', '18:00:00', 'Please leave by the gate.', 4, 6);


insert into donations_categories (donation_id, category_id) values (1,3);
insert into donations_categories (donation_id, category_id) values (1,4);
insert into donations_categories (donation_id, category_id) values (2,4);
insert into donations_categories (donation_id, category_id) values (2,3);
insert into donations_categories (donation_id, category_id) values (3,2);
insert into donations_categories (donation_id, category_id) values (4,1);
insert into donations_categories (donation_id, category_id) values (5,3);
insert into donations_categories (donation_id, category_id) values (5,5);
insert into donations_categories (donation_id, category_id) values (6, 2);
insert into donations_categories (donation_id, category_id) values (7, 1);
insert into donations_categories (donation_id, category_id) values (8, 3);
insert into donations_categories (donation_id, category_id) values (9, 4);
insert into donations_categories (donation_id, category_id) values (10, 5);
insert into donations_categories (donation_id, category_id) values (11, 1);
insert into donations_categories (donation_id, category_id) values (12, 5);
insert into donations_categories (donation_id, category_id) values (13, 2);
insert into donations_categories (donation_id, category_id) values (14, 5);
insert into donations_categories (donation_id, category_id) values (15, 3);
insert into donations_categories (donation_id, category_id) values (16, 4);