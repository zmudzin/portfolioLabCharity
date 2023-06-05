INSERT INTO categories (name) VALUES ('Ubrania');
INSERT INTO categories (name) VALUES ('Zabawki');
INSERT INTO categories (name) VALUES ('Elektronika');
INSERT INTO categories (name) VALUES ('Meble');
INSERT INTO categories (name) VALUES ('Książki');

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



INSERT INTO donations (quantity, street, city, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id) VALUES (5,  'Kwiaciarska 5', 'Warszawa', '01-234', '2024-06-01', '10:00:00', 'Proszę o kontakt przed przyjazdem.',2);
INSERT INTO donations (quantity, street, city, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id) VALUES (10,  'Słoneczna 10', 'Kraków', '30-111', '2024-06-15', '13:00:00', 'Proszę o kontakt przed przyjazdem.',3);
INSERT INTO donations (quantity, street, city, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id) VALUES (8,  'Leśna 15', 'Poznań', '61-626', '2024-06-20', '15:00:00', 'Proszę o kontakt przed przyjazdem.',2);
INSERT INTO donations (quantity, street, city, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id) VALUES (2,  'Wiśniowa 20', 'Wrocław', '50-137', '2024-07-01', '12:00:00', 'Proszę o kontakt przed przyjazdem.',5);
INSERT INTO donations (quantity, street, city, zip_code, pick_up_date, pick_up_time, pick_up_comment, institution_id) VALUES (6,  'Jabłkowa 25', 'Gdańsk', '80-180', '2024-07-15', '14:00:00', 'Proszę o kontakt przed przyjazdem.',4);

insert into donations_categories (donation_id, category_id) values (1,3);
insert into donations_categories (donation_id, category_id) values (1,4);
insert into donations_categories (donation_id, category_id) values (2,4);
insert into donations_categories (donation_id, category_id) values (2,3);
insert into donations_categories (donation_id, category_id) values (3,2);
insert into donations_categories (donation_id, category_id) values (4,1);
insert into donations_categories (donation_id, category_id) values (5,3);
insert into donations_categories (donation_id, category_id) values (5,5);
