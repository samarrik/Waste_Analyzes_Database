--Autors: Ivan Samarskyi
--      : Jiri Hunka ( remove_all() function )
--      : https://dbs.fit.cvut.cz/

--deletion of all records from all tables
CREATE or replace FUNCTION clean_tables() RETURNS void AS $$
declare
  l_stmt text;
begin
  select 'truncate ' || string_agg(format('%I.%I', schemaname, tablename) , ',')
    into l_stmt
  from pg_tables
  where schemaname in ('public');

  execute l_stmt || ' cascade';
end;
$$ LANGUAGE plpgsql;

select clean_tables();

--reset the sequence (serial)
CREATE or replace FUNCTION restart_sequences() RETURNS void AS $$
DECLARE
i TEXT;
BEGIN
 FOR i IN (SELECT column_default FROM information_schema.columns WHERE column_default SIMILAR TO 'nextval%')
  LOOP
         EXECUTE 'ALTER SEQUENCE'||' ' || substring(substring(i from '''[a-z_]*')from '[a-z_]+') || ' '||' RESTART 1;';
  END LOOP;
END $$ LANGUAGE plpgsql;
select restart_sequences();
--end of reset and deletion

--fill the person (using default in case of a serial)
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Consuela', 'Adanez', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Raimundo', 'Axten', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Quincey', 'Ikringill', 68, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Ronnica', 'Odams', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Chloe', 'Andreopolos', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Hastings', 'Fenich', 40, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Uta', 'Letty', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Durand', 'Wrates', 59, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Gaye', 'Dybell', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Ivan', 'Samarskyi', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Porter', 'Calyton', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Currey', 'McClintock', 46, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Gabe', 'Rimour', 51, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Marshal', 'Fost', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Webb', 'Stenner', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Kit', 'Blunt', 48, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Dahlia', 'Gainsborough', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Sophi', 'Mawford', 20, 'Female');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Wilbur', 'Chaffin', 21, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Wenonah', 'Bulward', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Amalia', 'Moncey', 68, 'Polygender');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Rebeka', 'Hamlyn', 64, 'Female');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Redd', 'Heinssen', 61, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Torie', 'Bockh', 43, 'Female');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Bronny', 'Hambling', 30, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Brendis', 'McLelland', 32, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Becki', 'Salmen', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Aron', 'Threadgill', 57, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Foss', 'Jeandet', 20, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Cleon', 'Curd', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Pedro', 'Davy', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Gareth', 'Jozwiak', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Dorothee', 'Wheater', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Leola', 'Eixenberger', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Bronnie', 'Plumptre', 28, 'Bigender');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Pace', 'Lackham', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Lincoln', 'Gowanlock', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Dorette', 'Carletto', 66, 'Genderqueer');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Leonora', 'Rosenschein', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Gardie', 'Beneteau', 47, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Flory', 'Bourdel', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Inglis', 'Ayre', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Maurita', 'Ten Broek', 68, 'Female');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Lyndsie', 'Michelin', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Henrieta', 'Hedman', 29, 'Female');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Aubrie', 'Archer', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Orson', 'Jessen', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Chaddie', 'Stansbury', 41, 'Male');
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Peggy', 'Averall', null, null);
insert into person (id_person, name, surname, age, gender) values (DEFAULT, 'Elysia', 'Bowmen', null, null);

-- fill sorting_company (without using default (we skip default, because when the type is serial,
-- it can be auto-filled)
insert into sorting_company (name) values ('Leffler, Jaskolski and Kohler');
insert into sorting_company (name) values ('Reinger-Heller');
insert into sorting_company (name) values ('Osinski, Block and Larkin');
insert into sorting_company (name) values ('MacGyver, Streich and Erdman');
insert into sorting_company (name) values ('Leuschke-Corwin');
insert into sorting_company (name) values ('Smith, Towne and Frami');
insert into sorting_company (name) values ('Kassulke Group');
insert into sorting_company (name) values ('Cronin-Fritsch');
insert into sorting_company (name) values ('Gislason Inc');
insert into sorting_company (name) values ('Waelchi, Robel and Johnston');
insert into sorting_company (name) values ('Rath LLC');
insert into sorting_company (name) values ('Ratke-Gulgowski');
insert into sorting_company (name) values ('Leannon-Corwin');
insert into sorting_company (name) values ('Keebler-Luettgen');
insert into sorting_company (name) values ('Schmeler, Monahan and Walker');
insert into sorting_company (name) values ('Murray, Yundt and Harris');
insert into sorting_company (name) values ('Balistreri, Legros and Koelpin');
insert into sorting_company (name) values ('Fadel and Sons');
insert into sorting_company (name) values ('Rau, Rippin and Thiel');
insert into sorting_company (name) values ('Feest, Hane and Dach');
insert into sorting_company (name) values ('Robel LLC');
insert into sorting_company (name) values ('Towne LLC');
insert into sorting_company (name) values ('Purdy and Sons');
insert into sorting_company (name) values ('Shields-West');
insert into sorting_company (name) values ('Walter-Shields');

--fill agreement
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (22, 16, '8/18/2017', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (33, 19, '8/30/2016', '11/22/2016');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (25, 5, '12/15/2022', '3/13/2023');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (39, 3, '11/10/2022', '11/10/2023');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (10, 1, '11/27/2016', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (22, 2, '6/14/2015', '7/29/2021');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (1, 2, '2/24/2023', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (7, 3, '7/22/2021', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (34, 22, '9/5/2016', '4/13/2017');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (21, 19, '12/17/2021', '6/28/2023');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (35, 22, '4/18/2018', '7/1/2022');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (28, 11, '7/17/2022', '11/2/2022');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (35, 17, '8/25/2017', '3/5/2019');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (3, 4, '10/22/2015', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (20, 6, '6/4/2019', '1/16/2023');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (25, 18, '8/14/2020', '12/13/2022');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (16, 4, '9/12/2022', '12/18/2022');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (1, 14, '4/17/2023', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (33, 24, '10/26/2017', '12/10/2022');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (5, 25, '9/5/2015', '9/14/2015');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (39, 4, '6/10/2019', '3/2/2023');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (19, 4, '1/25/2020', '5/16/2020');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (7, 16, '4/13/2017', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (1, 11, '11/8/2020', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (18, 10, '12/25/2015', '2/11/2018');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (32, 4, '2/2/2018', '6/13/2019');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (15, 4, '6/3/2015', '10/4/2015');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (1, 8, '1/29/2018', '3/15/2019');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (30, 5, '12/13/2019', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (25, 11, '2/21/2022', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (22, 8, '9/11/2017', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (19, 17, '1/14/2015', '4/29/2018');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (42, 16, '2/25/2022', '10/26/2023');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (1, 17, '7/10/2023', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (47, 1, '3/24/2016', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (47, 5, '8/29/2017', '1/21/2019');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (34, 14, '1/5/2020', '8/15/2020');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (35, 13, '8/16/2018', '12/25/2019');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (30, 1, '8/20/2017', '5/31/2020');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (16, 11, '1/20/2015', '7/16/2022');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (12, 6, '1/24/2016', '12/14/2018');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (38, 19, '12/11/2019', '3/26/2022');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (44, 1, '12/22/2022', '7/7/2023');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (34, 17, '6/3/2015', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (32, 15, '12/28/2019', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (48, 3, '6/3/2019', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (47, 13, '8/15/2017', '3/24/2020');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (41, 1, '10/22/2017', '2/14/2020');
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (1, 9, '9/19/2023', null);
insert into agreement (id_person, id_sorting_cp, date_start, date_till) values (33, 5, '5/6/2020', '11/17/2020');

--fill employee
insert into employee (id_agreement, salary, birthday, email, phone) values (2, 67033, null, null, null);
insert into employee (id_agreement, salary, birthday, email, phone) values (4, 18601, null, 'lkettleson1@wiley.com', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (6, 60630, '8/15/2021', 'bflanne2@mapy.cz', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (8, 72184, null, 'cffrench3@msu.edu', '3073166744');
insert into employee (id_agreement, salary, birthday, email, phone) values (10, 55203, null, 'dmoorcraft4@geocities.com', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (12, 12088, null, 'awestall5@sphinn.com', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (14, 70320, '9/27/2020', 'ledgehill6@seattletimes.com', '4701296698');
insert into employee (id_agreement, salary, birthday, email, phone) values (16, 8910, null, 'jaird7@oaic.gov.au', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (18, 81501, null, 'gfouracres8@seesaa.net', '4313544154');
insert into employee (id_agreement, salary, birthday, email, phone) values (20, 122841, '9/29/2016', 'jdeverose9@yahoo.co.jp', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (22, 76804, '11/11/2018', null, null);
insert into employee (id_agreement, salary, birthday, email, phone) values (24, 26791, '2/28/2020', null, null);
insert into employee (id_agreement, salary, birthday, email, phone) values (28, 24711, null, null, null);
insert into employee (id_agreement, salary, birthday, email, phone) values (26, 83447, null, 'mlawdhamd@hp.com', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (30, 22336, '5/20/2016', 'krenarde@ftc.gov', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (32, 27640, null, 'kepdellf@is.gd', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (34, 79869, '1/2/2016', 'parzug@ameblo.jp', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (36, 8921, '3/27/2021', null, null);
insert into employee (id_agreement, salary, birthday, email, phone) values (38, 112917, '12/7/2016', 'cspenslyi@earthlink.net', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (40, 42350, null, 'kdominicoj@fema.gov', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (42, 86483, '3/21/2018', null, null);
insert into employee (id_agreement, salary, birthday, email, phone) values (44, 70672, '4/26/2016', 'bskulel@t.co', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (46, 104750, '4/12/2022', 'fmidghallm@msu.edu', '1655982747');
insert into employee (id_agreement, salary, birthday, email, phone) values (48, 112474, null, 'etomainon@deliciousdays.com', null);
insert into employee (id_agreement, salary, birthday, email, phone) values (50, 10624, null, null, null);

--fill volunteer
insert into volunteer (id_agreement, purpose) values (1, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.');
insert into volunteer (id_agreement, purpose) values (3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.');
insert into volunteer (id_agreement, purpose) values (5, 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.');
insert into volunteer (id_agreement, purpose) values (7, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.');
insert into volunteer (id_agreement, purpose) values (9, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');
insert into volunteer (id_agreement, purpose) values (11, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.');
insert into volunteer (id_agreement, purpose) values (13, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.');
insert into volunteer (id_agreement, purpose) values (15, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.');
insert into volunteer (id_agreement, purpose) values (17, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
insert into volunteer (id_agreement, purpose) values (19, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.');
insert into volunteer (id_agreement, purpose) values (21, 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into volunteer (id_agreement, purpose) values (23, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.');
insert into volunteer (id_agreement, purpose) values (25, 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.');
insert into volunteer (id_agreement, purpose) values (27, 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.');
insert into volunteer (id_agreement, purpose) values (29, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.');
insert into volunteer (id_agreement, purpose) values (31, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.');
insert into volunteer (id_agreement, purpose) values (33, 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');
insert into volunteer (id_agreement, purpose) values (35, 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.');
insert into volunteer (id_agreement, purpose) values (37, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.');
insert into volunteer (id_agreement, purpose) values (39, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.');

--fill address (insert in another way)
insert into address ( city, country, street, street_num ) values
('Štoky', 'Czech Republic', 'Arkansas', '6'),
('Okocim', 'Poland', 'Knutson', '024'),
('Rozsypne', 'Ukraine', 'Florence', '2'),
('Wodzierady', 'Poland', 'Reindahl', '663'),
('Augustów', 'Poland', 'Coleman', '0757'),
('Pohrebyshche', 'Ukraine', 'Northridge', '2'),
('Klevan’', 'Ukraine', 'Barby', '1274'),
('Józefów', 'Poland', 'Ilene', '74'),
('Žacléř', 'Czech Republic', 'Heffernan', '1323'),
('Kęsowo', 'Poland', 'Westend', '637'),
('Mierzęcice', 'Poland', 'Mcbride', '85'),
('Slavkov u Brna', 'Czech Republic', 'Sycamore', '696'),
('Krynice', 'Poland', 'Dexter', '668'),
('Kamień Pomorski', 'Poland', 'Bashford', '231'),
('Ochla', 'Poland', 'Muir', '7'),
('Połaniec', 'Poland', 'Arizona', '6'),
('Krasni Okny', 'Ukraine', 'Anhalt', '67'),
('Strašice', 'Czech Republic', 'Reinke', '5198'),
('Grabów', 'Poland', 'Darwin', '167'),
('Energodar', 'Ukraine', 'Yunosti', '7'),
('Zagórów', 'Poland', 'Messerschmidt', '8');




--fill client_company
insert into client_company (id_address, name, field_of_activity) values (13, 'Sauer Inc', null);
insert into client_company (id_address, name, field_of_activity) values (4, 'King, Medhurst and Sporer', 'Business Services');
insert into client_company (id_address, name, field_of_activity) values (9, 'Legros and Sons', null);
insert into client_company (id_address, name, field_of_activity) values (17, 'Fahey-Upton', null);
insert into client_company (id_address, name, field_of_activity) values (10, 'Nitzsche, Gutmann and Howe', 'Recreational Products/Toys');
insert into client_company (id_address, name, field_of_activity) values (18, 'Nienow Group', 'n/a');
insert into client_company (id_address, name, field_of_activity) values (13, 'Herzog-Kozey', 'n/a');
insert into client_company (id_address, name, field_of_activity) values (11, 'Ruecker-Pacocha', 'n/a');
insert into client_company (id_address, name, field_of_activity) values (15, 'Blick Group', null);
insert into client_company (id_address, name, field_of_activity) values (18, 'Parker-Buckridge', 'n/a');
insert into client_company (id_address, name, field_of_activity) values (9, 'Schaden Group', 'Telecommunications Equipment');
insert into client_company (id_address, name, field_of_activity) values (9, 'Jerde-Altenwerth', null);
insert into client_company (id_address, name, field_of_activity) values (16, 'Stiedemann, Howe and Kihn', 'Medical/Nursing Services');
insert into client_company (id_address, name, field_of_activity) values (19, 'Parisian, Kub and Lebsack', 'Real Estate Investment Trusts');
insert into client_company (id_address, name, field_of_activity) values (18, 'Bayer, Simonis and Champlin', null);
insert into client_company (id_address, name, field_of_activity) values (20, 'Parker, Bergstrom and Green', null);
insert into client_company (id_address, name, field_of_activity) values (14, 'Kessler, Corwin and Borer', 'Major Pharmaceuticals');
insert into client_company (id_address, name, field_of_activity) values (5, 'Leuschke Inc', null);
insert into client_company (id_address, name, field_of_activity) values (12, 'Kuphal, Schimmel and Herman', 'n/a');
insert into client_company (id_address, name, field_of_activity) values (9, 'Ebert-Vandervort', null);
insert into client_company (id_address, name, field_of_activity) values (6, 'Schaefer-Lemke', 'n/a');
insert into client_company (id_address, name, field_of_activity) values (2, 'Waters-Kemmer', 'n/a');
insert into client_company (id_address, name, field_of_activity) values (17, 'Stehr, Wilkinson and Stiedemann', 'Major Pharmaceuticals');
insert into client_company (id_address, name, field_of_activity) values (14, 'Weimann Group', 'Radio And Television Broadcasting And Communications Equipment');
insert into client_company (id_address, name, field_of_activity) values (15, 'Gulgowski-Stracke', 'Hotels/Resorts');
insert into client_company (id_address, name, field_of_activity) values (15, 'Samarrik Inc.', 'IT');

--fill analysis
insert into analysis (id_company, date, note) values (16, '01/01/2047', 'lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo');
insert into analysis (id_company, date, note) values (2, '4/28/2021', 'tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl');
insert into analysis (id_company, date, note) values (7, '6/21/2016', 'et tempus semper est quam pharetra magna ac consequat metus sapien');
insert into analysis (id_company, date, note) values (17, '12/30/2022', 'bibendum felis sed interdum venenatis turpis enim blandit mi in');
insert into analysis (id_company, date, note) values (1, '11/20/2020', null);
insert into analysis (id_company, date, note) values (20, '10/25/2022', 'orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio');
insert into analysis (id_company, date, note) values (4, '10/25/2017', null);
insert into analysis (id_company, date, note) values (10, '3/16/2021', null);
insert into analysis (id_company, date, note) values (2, '6/23/2020', 'proin at turpis a pede posuere nonummy integer non velit');
insert into analysis (id_company, date, note) values (19, '3/24/2021', 'orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo');
insert into analysis (id_company, date, note) values (2, '3/24/2018', null);
insert into analysis (id_company, date, note) values (18, '4/13/2020', 'sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus');
insert into analysis (id_company, date, note) values (19, '5/6/2022', 'enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien');
insert into analysis (id_company, date, note) values (12, '12/22/2021', null);
insert into analysis (id_company, date, note) values (5, '8/18/2022', null);
insert into analysis (id_company, date, note) values (6, '4/24/2016', 'rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce');
insert into analysis (id_company, date, note) values (18, '8/26/2018', null);
insert into analysis (id_company, date, note) values (1, '8/1/2017', 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum');
insert into analysis (id_company, date, note) values (5, '3/10/2022', 'ligula vehicula consequat morbi a ipsum integer a nibh in quis');
insert into analysis (id_company, date, note) values (4, '5/24/2019', 'luctus et ultrices posuere cubilia curae nulla dapibus dolor vel');
insert into analysis (id_company, date, note) values (14, '12/17/2016', 'cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec');
insert into analysis (id_company, date, note) values (7, '8/15/2020', 'ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna');
insert into analysis (id_company, date, note) values (14, '3/17/2020', null);
insert into analysis (id_company, date, note) values (15, '6/27/2015', null);
insert into analysis (id_company, date, note) values (12, '12/13/2020', 'ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia');
insert into analysis (id_company, date, note) values (6, '7/15/2022', 'faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio');
insert into analysis (id_company, date, note) values (7, '11/13/2022', null);
insert into analysis (id_company, date, note) values (2, '7/27/2016', null);
insert into analysis (id_company, date, note) values (11, '7/23/2020', 'praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede');
insert into analysis (id_company, date, note) values (13, '7/19/2019', null);
insert into analysis (id_company, date, note) values (13, '4/27/2016', 'enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec');
insert into analysis (id_company, date, note) values (3, '1/27/2016', 'ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien');
insert into analysis (id_company, date, note) values (3, '1/18/2020', 'tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non');
insert into analysis (id_company, date, note) values (8, '2/26/2020', 'risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis');
insert into analysis (id_company, date, note) values (4, '1/20/2017', 'massa id lobortis convallis tortor risus dapibus augue vel accumsan');
insert into analysis (id_company, date, note) values (5, '3/24/2020', 'mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere');
insert into analysis (id_company, date, note) values (19, '6/19/2020', null);
insert into analysis (id_company, date, note) values (3, '11/26/2018', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae');
insert into analysis (id_company, date, note) values (9, '1/16/2023', 'curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin');
insert into analysis (id_company, date, note) values (2, '5/25/2017', 'convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit');
insert into analysis (id_company, date, note) values (13, '6/28/2015', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis');
insert into analysis (id_company, date, note) values (10, '2/21/2017', null);
insert into analysis (id_company, date, note) values (13, '11/1/2020', 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in');
insert into analysis (id_company, date, note) values (6, '4/1/2018', 'mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis');
insert into analysis (id_company, date, note) values (17, '10/21/2019', 'nec molestie sed justo pellentesque viverra pede ac diam cras');
insert into analysis (id_company, date, note) values (6, '1/27/2023', 'ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst');
insert into analysis (id_company, date, note) values (17, '10/23/2016', 'vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget');
insert into analysis (id_company, date, note) values (19, '10/4/2022', 'dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero');
insert into analysis (id_company, date, note) values (14, '1/6/2023', null);
insert into analysis (id_company, date, note) values (1, '12/9/2019', null);

--fill participation
insert into participation (id_analysis, id_agreement) values (1, 7);
insert into participation (id_analysis, id_agreement) values (1, 34);
insert into participation (id_analysis, id_agreement) values (1, 18);
insert into participation (id_analysis, id_agreement) values (1, 49);
insert into participation (id_analysis, id_agreement) values (2, 22);
insert into participation (id_analysis, id_agreement) values (3, 18);
insert into participation (id_analysis, id_agreement) values (22, 7);
insert into participation (id_analysis, id_agreement) values (44, 39);
insert into participation (id_analysis, id_agreement) values (16, 11);
insert into participation (id_analysis, id_agreement) values (16, 24);
insert into participation (id_analysis, id_agreement) values (13, 5);
insert into participation (id_analysis, id_agreement) values (8, 32);
insert into participation (id_analysis, id_agreement) values (44, 19);
insert into participation (id_analysis, id_agreement) values (12, 43);
insert into participation (id_analysis, id_agreement) values (31, 50);
insert into participation (id_analysis, id_agreement) values (49, 24);
insert into participation (id_analysis, id_agreement) values (45, 22);
insert into participation (id_analysis, id_agreement) values (15, 1);
insert into participation (id_analysis, id_agreement) values (37, 16);
insert into participation (id_analysis, id_agreement) values (42, 39);
insert into participation (id_analysis, id_agreement) values (33, 48);
insert into participation (id_analysis, id_agreement) values (17, 24);
insert into participation (id_analysis, id_agreement) values (31, 36);
insert into participation (id_analysis, id_agreement) values (43, 49);
insert into participation (id_analysis, id_agreement) values (36, 7);
insert into participation (id_analysis, id_agreement) values (38, 10);
insert into participation (id_analysis, id_agreement) values (15, 35);
insert into participation (id_analysis, id_agreement) values (44, 22);
insert into participation (id_analysis, id_agreement) values (42, 36);
insert into participation (id_analysis, id_agreement) values (30, 50);
insert into participation (id_analysis, id_agreement) values (27, 1);
insert into participation (id_analysis, id_agreement) values (7, 19);
insert into participation (id_analysis, id_agreement) values (18, 4);
insert into participation (id_analysis, id_agreement) values (8, 29);
insert into participation (id_analysis, id_agreement) values (18, 19);
insert into participation (id_analysis, id_agreement) values (29, 27);
insert into participation (id_analysis, id_agreement) values (41, 10);
insert into participation (id_analysis, id_agreement) values (8, 42);
insert into participation (id_analysis, id_agreement) values (11, 19);
insert into participation (id_analysis, id_agreement) values (11, 45);
insert into participation (id_analysis, id_agreement) values (18, 13);
insert into participation (id_analysis, id_agreement) values (6, 2);
insert into participation (id_analysis, id_agreement) values (46, 21);
insert into participation (id_analysis, id_agreement) values (28, 47);
insert into participation (id_analysis, id_agreement) values (42, 27);
insert into participation (id_analysis, id_agreement) values (24, 1);
insert into participation (id_analysis, id_agreement) values (38, 5);
insert into participation (id_analysis, id_agreement) values (1, 28);
insert into participation (id_analysis, id_agreement) values (35, 15);
insert into participation (id_analysis, id_agreement) values (16, 13);
insert into participation (id_analysis, id_agreement) values (14, 23);
insert into participation (id_analysis, id_agreement) values (41, 39);
insert into participation (id_analysis, id_agreement) values (47, 10);
insert into participation (id_analysis, id_agreement) values (48, 9);
insert into participation (id_analysis, id_agreement) values (19, 18);
insert into participation (id_analysis, id_agreement) values (19, 16);
insert into participation (id_analysis, id_agreement) values (19, 41);
insert into participation (id_analysis, id_agreement) values (38, 17);
insert into participation (id_analysis, id_agreement) values (32, 11);
insert into participation (id_analysis, id_agreement) values (42, 18);
insert into participation (id_analysis, id_agreement) values (32, 26);
insert into participation (id_analysis, id_agreement) values (17, 2);
insert into participation (id_analysis, id_agreement) values (7, 46);
insert into participation (id_analysis, id_agreement) values (5, 50);
insert into participation (id_analysis, id_agreement) values (7, 17);
insert into participation (id_analysis, id_agreement) values (36, 32);
insert into participation (id_analysis, id_agreement) values (15, 11);
insert into participation (id_analysis, id_agreement) values (15, 10);
insert into participation (id_analysis, id_agreement) values (13, 29);
insert into participation (id_analysis, id_agreement) values (15, 27);
insert into participation (id_analysis, id_agreement) values (48, 12);
insert into participation (id_analysis, id_agreement) values (27, 27);
insert into participation (id_analysis, id_agreement) values (24, 24);
insert into participation (id_analysis, id_agreement) values (8, 25);
insert into participation (id_analysis, id_agreement) values (40, 18);
insert into participation (id_analysis, id_agreement) values (49, 26);
insert into participation (id_analysis, id_agreement) values (6, 49);
insert into participation (id_analysis, id_agreement) values (22, 16);
insert into participation (id_analysis, id_agreement) values (39, 6);
insert into participation (id_analysis, id_agreement) values (39, 15);
insert into participation (id_analysis, id_agreement) values (16, 47);
insert into participation (id_analysis, id_agreement) values (37, 45);
insert into participation (id_analysis, id_agreement) values (41, 37);
insert into participation (id_analysis, id_agreement) values (42, 25);
insert into participation (id_analysis, id_agreement) values (16, 46);
insert into participation (id_analysis, id_agreement) values (27, 13);
insert into participation (id_analysis, id_agreement) values (23, 25);
insert into participation (id_analysis, id_agreement) values (42, 5);
insert into participation (id_analysis, id_agreement) values (42, 34);
insert into participation (id_analysis, id_agreement) values (23, 42);
insert into participation (id_analysis, id_agreement) values (19, 35);
insert into participation (id_analysis, id_agreement) values (19, 7);
insert into participation (id_analysis, id_agreement) values (31, 1);
insert into participation (id_analysis, id_agreement) values (25, 41);
insert into participation (id_analysis, id_agreement) values (2, 34);
insert into participation (id_analysis, id_agreement) values (47, 39);
insert into participation (id_analysis, id_agreement) values (32, 45);
insert into participation (id_analysis, id_agreement) values (28, 31);

--fill record
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (2, 20, 'Plastic', 12.56, 11.32);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (12, 6, 'Stone', 13.85, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (4, 40, 'Granite', 14.43, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (10, 24, 'Steel', 2.64, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (48, 14, 'Plastic', 17.02, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (41, 12, 'Plastic', 9.65, 21.81);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (41, 40, 'Aluminum', 1.65, 8.86);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (8, 42, 'Vinyl', 10.83, 35.5);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (42, 40, 'Wood', 18.31, 13.23);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (31, 18, 'Plexiglass', 2.07, 17.93);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (5, 26, 'Brass', 10.8, 39.4);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (41, 36, 'Plexiglass', 8.85, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (21, 8, 'Steel', 10.81, 1.03);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (25, 22, 'Steel', 9.81, 12.23);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (24, 40, 'Aluminum', 2.9, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (20, 44, 'Rubber', 8.23, 25.67);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (9, 44, 'Plexiglass', 6.85, 18.44);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (49, 2, 'Wood', 16.5, 7.39);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (33, 16, 'Rubber', 10.37, 21.23);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (43, 8, 'Glass', 19.53, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (34, 42, 'Vinyl', 5.63, 30.82);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (48, 16, 'Brass', 3.25, 23.37);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (45, 44, 'Aluminum', 3.81, 32.48);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (34, 28, 'Stone', 6.35, 22.56);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (45, 44, 'Rubber', 10.62, 38.22);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (48, 30, 'Glass', 13.76, 28.99);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (20, 50, 'Aluminum', 16.06, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (7, 38, 'Glass', 8.41, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (41, 28, 'Granite', 17.2, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (24, 18, 'Steel', 4.83, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (45, 48, 'Rubber', 19.07, 2.4);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (12, 12, 'Brass', 10.55, 28.65);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (21, 4, 'Steel', 6.41, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (24, 32, 'Glass', 5.97, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (11, 20, 'Wood', 14.79, 21.31);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (48, 18, 'Glass', 18.4, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (22, 14, 'Rubber', 3.87, 7.95);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (23, 38, 'Rubber', 14.66, 31.71);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (25, 36, 'Glass', 9.22, 35.85);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (50, 16, 'Plexiglass', 8.66, 35.14);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (3, 42, 'Plastic', 6.68, 26.26);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (16, 8, 'Granite', 3.77, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (46, 32, 'Vinyl', 10.97, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (26, 14, 'Granite', 17.03, 34.06);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (45, 26, 'Glass', 10.88, 32.06);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (8, 34, 'Aluminum', 11.51, 2.4);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (39, 12, 'Plexiglass', 4.44, 15.0);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (24, 30, 'Granite', 9.59, 12.87);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (49, 22, 'Wood', 16.16, 39.62);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (4, 38, 'Plastic', 7.11, 11.06);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (34, 18, 'Granite', 8.31, 16.44);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (31, 34, 'Rubber', 11.16, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (50, 4, 'Plastic', 12.07, 22.32);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (44, 44, 'Plastic', 3.22, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (11, 8, 'Rubber', 12.53, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (24, 34, 'Plexiglass', 5.08, 3.12);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (10, 2, 'Brass', 18.99, 35.38);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (1, 38, 'Glass', 17.04, 27.87);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (5, 42, 'Stone', 8.76, 13.99);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (12, 8, 'Aluminum', 2.35, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (39, 20, 'Plastic', 6.15, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (35, 30, 'Vinyl', 9.48, 4.85);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (20, 24, 'Aluminum', 16.78, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (33, 34, 'Stone', 6.03, 22.34);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (20, 8, 'Aluminum', 8.21, 26.69);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (46, 38, 'Wood', 1.24, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (13, 22, 'Rubber', 10.65, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (32, 14, 'Vinyl', 8.88, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (4, 12, 'Brass', 14.15, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (14, 50, 'Plexiglass', 19.4, 14.76);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (40, 14, 'Plastic', 16.98, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (5, 24, 'Steel', 16.8, 6.41);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (44, 44, 'Plexiglass', 3.66, 38.9);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (49, 44, 'Plastic', 4.68, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (13, 4, 'Rubber', 1.22, 27.09);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (44, 14, 'Brass', 17.0, 26.71);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (23, 8, 'Plexiglass', 12.26, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (2, 38, 'Brass', 14.92, 2.94);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (3, 12, 'Brass', 6.67, 38.2);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (23, 30, 'Plexiglass', 11.18, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (5, 8, 'Plastic', 8.25, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (27, 48, 'Granite', 11.8, 8.18);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (20, 46, 'Wood', 19.49, 27.31);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (46, 20, 'Plastic', 4.06, 19.48);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (31, 16, 'Glass', 10.89, 34.12);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (32, 28, 'Plexiglass', 3.95, 20.07);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (11, 6, 'Aluminum', 17.18, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (43, 42, 'Vinyl', 14.25, 36.79);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (17, 36, 'Plastic', 19.1, 3.2);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (25, 2, 'Steel', 11.42, 3.28);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (39, 2, 'Rubber', 5.36, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (6, 6, 'Vinyl', 19.55, 23.21);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (44, 38, 'Rubber', 10.55, 36.28);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (23, 36, 'Glass', 5.61, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (37, 48, 'Glass', 15.41, 27.76);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (4, 32, 'Wood', 3.0, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (21, 12, 'Aluminum', 9.41, null);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (14, 32, 'Plastic', 19.0, 3.95);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (35, 6, 'Brass', 8.05, 15.68);
insert into record (id_analysis, id_agreement, type, weight, tax_czk) values (38, 38, 'Brass', 3.7, null);

--if autocommit off
commit;