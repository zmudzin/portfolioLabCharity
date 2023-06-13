INSERT INTO categories (name) VALUES ('Ubrania');
INSERT INTO categories (name) VALUES ('Zabawki');
INSERT INTO categories (name) VALUES ('Elektronika');
INSERT INTO categories (name) VALUES ('Meble');
INSERT INTO categories (name) VALUES ('Książki');

insert into role (name) values ('ROLE_USER');
insert into role (name) values ('ROLE_ADMIN');

insert into users(email, enabled, password) VALUES ('admin@admin.pl',1,'$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW');
insert into user_role(user_id, role_id) values (1,2);

insert into users(email, enabled, password) VALUES ('user@user.pl',1,'$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW');
insert into user_role(user_id, role_id) values (2,1);

insert into users(email, enabled, password) VALUES ('user666@user.pl',1,'$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW');
insert into user_role(user_id, role_id) values (3,1);

INSERT INTO institutions (name, description) VALUES ('Fundacja "Słoneczny Dzień"', 'Fundacja pomagająca dzieciom z niepełnosprawnościami poprzez organizowanie terapii i warsztatów.');
INSERT INTO institutions (name, description) VALUES ('Fundacja "Radosna Przyszłość"', 'Fundacja skupiająca się na wspieraniu edukacji dzieci z ubogich rodzin.');
INSERT INTO institutions (name, description) VALUES ('Fundacja "Zdrowe Pokolenie"', 'Fundacja prowadząca programy edukacyjne na temat zdrowego stylu życia dla dzieci i młodzieży.');
INSERT INTO institutions (name, description) VALUES ('Fundacja "Kreatywny Rozwój"', 'Fundacja wspierająca rozwój kreatywności u dzieci i młodzieży poprzez organizowanie różnego rodzaju warsztatów.');
INSERT INTO institutions (name, description) VALUES ('Fundacja "Ekologiczny Świat"', 'Fundacja promująca ekologiczne style życia i działania na rzecz ochrony środowiska.');
INSERT INTO institutions (name, description) VALUES ('Fundacja "Dobry Start"', 'Fundacja wspierająca dzieci w starcie do edukacji szkolnej.');
INSERT INTO institutions (name, description) VALUES ('Fundacja "Dobre Serce"', 'Fundacja pomagająca osobom w potrzebie poprzez dostarczanie żywności i ubrań.');
INSERT INTO institutions (name, description) VALUES ('Fundacja "Młode Talenty"', 'Fundacja wspierająca rozwój talentów artystycznych u dzieci i młodzieży.');
INSERT INTO institutions (name, description) VALUES ('Fundacja "Senior Aktywny"', 'Fundacja organizująca zajęcia i wydarzenia dla seniorów, promująca aktywny styl życia.');
INSERT INTO institutions (name, description) VALUES ('Fundacja "Nadzieja na Jutro"', 'Fundacja pomagająca osobom bezdomnym w znalezieniu dachu nad głową i wsparciu.');



INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (5,  'Kwiaciarska 5', 'Warszawa',false, '01-234', '2024-06-01', '10:00:00', 'Proszę o kontakt przed przyjazdem.',2, 2);

INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (5, 'Kwiaciarska 5', 'Warszawa', false, '01-234', '2024-06-01', '10:00:00', 'Proszę o kontakt przed przyjazdem.', 2, 2);

INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (3, 'Główna 10', 'Kraków', false, '12-345', '2024-06-02', '12:00:00', 'Proszę o wcześniejsze potwierdzenie.', 1, 1);

INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (7, 'Pomorska 8', 'Gdańsk', false, '45-678', '2024-06-03', '15:00:00', 'Proszę zostawić w portierni.', 3, 1);

INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (2, 'Szkolna 3', 'Poznań', false, '90-123', '2024-06-04', '14:00:00', 'Proszę o potwierdzenie odbioru.', 1, 2);

INSERT INTO donations (quantity, street, city, collected, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id, user_id) VALUES (4, 'Kwiatowa 7', 'Wrocław', false, '67-890', '2024-06-05', '16:00:00', 'Proszę o kontakt w celu uzgodnienia szczegółów.', 2, 2);

insert into donations_categories (donation_id, category_id) values (1,3);
insert into donations_categories (donation_id, category_id) values (1,4);
insert into donations_categories (donation_id, category_id) values (2,4);
insert into donations_categories (donation_id, category_id) values (2,3);
insert into donations_categories (donation_id, category_id) values (3,2);
insert into donations_categories (donation_id, category_id) values (4,1);
insert into donations_categories (donation_id, category_id) values (5,3);
insert into donations_categories (donation_id, category_id) values (5,5);


