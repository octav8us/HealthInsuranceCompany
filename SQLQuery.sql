create database Health_insurance_company;
use Health_insurance_company;
Go

CREATE TABLE customers
(
  first_name VARCHAR(30) NOT NULL,
  middle_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  Home_number VARCHAR(30)  ,
  city VARCHAR(20) NOT NULL,
  zip varchar(20) NOT NULL,
  state VARCHAR(30) NOT NULL,
  street_name VARCHAR(30) NOT NULL,
  street_number varchar(20) NOT NULL,
  Apartment_number varchar(20) NOT NULL,
  gender VARCHAR(20) NOT NULL,
  Birth_date DATE NOT NULL,
  SSN VARCHAR(30) NOT NULL,
  Job VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Phone_number VARCHAR(20) NOT NULL,
  PRIMARY KEY (SSN),
  UNIQUE (Email)
);

CREATE TABLE Enrolled_Hospitals
( hospital_ID INT NOT NULL AUTO_INCREMENT,
  Telephone_Number VARCHAR(20) NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  City VARCHAR(30) NOT NULL,
  State VARCHAR(30) NOT NULL,
  Zip VARCHAR(20) NOT NULL,
  street VARCHAR(50) NOT NULL,
  PRIMARY KEY (hospital_ID)
);


CREATE TABLE Dependents
(
  SSN VARCHAR(30) NOT NULL,
  Middle_name VARCHAR(50) NOT NULL,
  Last_name VARCHAR(50) NOT NULL,
  First_name VARCHAR(50) NOT NULL,
  Gender VARCHAR(20) NOT NULL,
  Relationship VARCHAR(30) NOT NULL,
  Birth_date DATE NOT NULL,
  customer_SSN VARCHAR(30) NOT NULL,
  PRIMARY KEY (SSN),
  FOREIGN KEY (customer_SSN) REFERENCES customers(SSN)
);

CREATE TABLE plans
(
  type VARCHAR(30) NOT NULL,
  percentage_of_costs_covered INT NOT NULL,
  yearly_cost INT NOT NULL,
  PRIMARY KEY (type)
);

CREATE TABLE cover
(
  hospital_ID INT NOT NULL ,
  type VARCHAR(30) NOT NULL,
  PRIMARY KEY (hospital_ID, type),
  FOREIGN KEY (hospital_ID) REFERENCES Enrolled_Hospitals(hospital_ID),
  FOREIGN KEY (type) REFERENCES plans(type)
);

CREATE TABLE plan_subscriptions
(
  subscription_ID INT not null AUTO_INCREMENT,
  expire_date DATE NOT NULL,
  customer_SSN  varchar(30) NOT NULL,
  type VARCHAR(30) NOT NULL,
  FOREIGN KEY (customer_SSN) REFERENCES customers(SSN),
  FOREIGN KEY (type) REFERENCES plans(type),
  primary key (subscription_ID)
);

CREATE TABLE Insurance_claims
(
  Claim_ID INT NOT NULL AUTO_INCREMENT,
  Hospital_id Int NOT NULL ,
  Expense INT NOT NULL ,
  Expense_details varchar(500) NOT NULL,
  Date Date NOT NULL,
  FOREIGN KEY (Hospital_id) REFERENCES Enrolled_Hospitals(hospital_ID);
  PRIMARY KEY (Claim_ID),
);

create table Associated
(
  hospital_id int not null ,
  plan varchar(50) not null ,
  FOREIGN KEY (hospital_id) REFERENCES Enrolled_Hospitals(hospital_ID),
  FOREIGN KEY (plan) REFERENCES plans(type)
);

CREATE TABLE files
(
  SSN VARCHAR(30) NOT NULL,
  Claim_ID INT NOT NULL,
  FOREIGN KEY (SSN) REFERENCES customers(SSN),
  FOREIGN KEY (Claim_ID) REFERENCES Insurance_claims(Claim_ID)
);

CREATE TABLE benefits
(
  customer_SSN  varchar(30) NOT NULL,
  dep_SSN VARCHAR(30) ,
  Claim_ID INT NOT NULL,
  FOREIGN KEY (customer_SSN) REFERENCES customers(SSN),
  FOREIGN KEY (dep_SSN) REFERENCES Dependants(SSN),
  FOREIGN KEY (Claim_ID) REFERENCES Insurance_claims(Claim_ID)
)

insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Perren', 'Gussie', 'Schaben', '648-326-9215', 'Tegalgunung', 1, 'Klenčí pod Čerchovem', 'Male', '1980-08-22 01:26:24', '101-92-9680', 'Director of Sales', 'gschaben0@seattletimes.com', '+420 157 540 8791', 'American', '628', 96);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Elisa', 'Debi', 'Pasquale', '553-168-5293', 'Alamar', 2, 'Vale Covo', 'Male', '1990-10-17 04:59:06', '478-52-0836', 'Physical Therapy Assistant', 'dpasquale1@macromedia.com', '+351 560 262 2053', 'Muir', '63845', 4);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Lay', 'Elle', 'Naper', '671-255-8467', 'Iţsā', 3, 'Alenquer', 'Female', '1982-07-10 12:41:48', '493-87-0858', 'Budget/Accounting Analyst III', 'enaper2@quantcast.com', '+55 272 265 4942', 'Farmco', '31', 31);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Mirella', 'Melinda', 'Tonbye', '512-145-4530', 'Yaté-Barrage', 4, 'Inderka', 'Female', '1976-11-15 22:24:15', '706-13-0912', 'Developer II', 'mtonbye3@slideshare.net', '+7 644 341 3201', 'Service', '0406', 71);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Benedetta', 'Jaimie', 'Holwell', '100-769-1498', 'Zhanjia', 5, 'Sarykemer', 'Male', '1991-05-06 17:20:51', '724-53-9334', 'Media Manager IV', 'jholwell4@google.es', '+7 196 322 5624', '3rd', '12249', 87);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Lawry', 'Dacey', 'Buglar', '371-447-2513', 'Guojia', 6, 'Midrand', 'Genderfluid', '1995-09-12 02:44:24', '151-89-5276', 'Teacher', 'dbuglar5@ask.com', '+27 868 250 9487', 'Gulseth', '40025', 31);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Silvia', 'Mellie', 'Rockey', '627-223-4508', 'Nyandoma', 7, 'Tebluru', 'Agender', '1981-04-29 22:07:02', '722-45-1521', 'Director of Sales', 'mrockey6@163.com', '+62 974 523 9949', 'Burning Wood', '2', 97);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Ernesto', 'Gal', 'Farreil', '679-397-7259', 'Lucma', 8, 'Nankang', 'Male', '1985-01-20 15:00:06', '625-68-3268', 'Recruiting Manager', 'gfarreil7@qq.com', '+86 798 390 6788', 'Mcbride', '3713', 17);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Vivien', 'Cordell', 'Scarlan', '444-886-9040', 'Leceia', 9, 'Río Cuarto', 'Female', '1975-05-15 05:51:54', '523-98-2221', 'Research Associate', 'cscarlan8@quantcast.com', '+54 369 227 1943', '1st', '292', 55);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Saw', 'Peyter', 'Francino', '734-936-1519', 'Pionerskiy', 10, 'Okunoya', 'Male', '1991-04-20 17:45:52', '344-62-3126', 'Computer Systems Analyst I', 'pfrancino9@techcrunch.com', '+81 376 903 7736', 'Delladonna', '56774', 71);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Charlton', 'Malcolm', 'Lidstone', '933-730-3848', 'Huamachuco', 11, 'Quirinópolis', 'Female', '1975-01-15 00:37:57', '800-96-7965', 'Quality Engineer', 'mlidstonea@bizjournals.com', '+55 933 855 2128', 'Sauthoff', '46080', 84);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Moyra', 'Milty', 'Stedmond', '692-640-1547', 'Sankwia', 12, 'Nirgua', 'Female', '1985-08-27 15:31:44', '280-36-0350', 'Programmer IV', 'mstedmondb@sciencedaily.com', '+58 183 503 3888', 'Heath', '44133', 57);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Chloe', 'Abeu', 'Walcot', '752-170-1940', 'Metallostroy', 13, 'Cabannungan Second', 'Male', '1986-06-29 11:44:46', '654-95-7894', 'Statistician III', 'awalcotc@smugmug.com', '+63 377 131 5340', 'Morning', '53', 80);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Briana', 'Franciskus', 'Asp', '718-766-9510', 'Eindhoven', 14, 'Delicias', 'Female', '1969-12-05 10:31:28', '809-47-4549', 'Nuclear Power Engineer', 'faspd@wufoo.com', '+58 712 191 5483', 'Graedel', '99', 53);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Ardith', 'Sadie', 'Rignold', '793-486-8802', 'Gōdo', 15, 'Muricay', 'Male', '1991-02-06 01:48:41', '323-29-5244', 'Sales Associate', 'srignolde@so-net.ne.jp', '+63 572 338 3901', 'Kim', '2133', 74);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Marianne', 'Shay', 'Partner', '100-438-3353', 'Liulin', 16, 'Harrismith', 'Male', '1979-10-08 05:55:38', '884-05-4711', 'Executive Secretary', 'spartnerf@irs.gov', '+27 861 778 9836', 'Kim', '63', 70);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Thalia', 'Zabrina', 'Lavery', '299-911-2380', 'Colón', 17, 'Győr', 'Male', '1982-07-02 17:58:10', '206-34-3407', 'Web Developer IV', 'zlaveryg@techcrunch.com', '+36 574 851 2473', 'Logan', '80', 37);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Kelcy', 'Urbano', 'Richten', '689-484-6706', 'Bergen', 18, 'Columbia', 'Bigender', '1975-07-19 13:31:05', '460-17-1939', 'Developer II', 'urichtenh@latimes.com', '+1 803 584 9596', 'American', '598', 49);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Amandie', 'Pierette', 'Arrol', '346-406-3789', 'Al Jīzah', 19, 'El Guapinol', 'Genderqueer', '1987-01-15 00:41:28', '582-79-5131', 'Programmer III', 'parroli@craigslist.org', '+504 781 880 2694', 'Golden Leaf', '5', 58);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Drusie', 'Darrick', 'Morland', '236-392-7947', 'Korsakovo', 20, 'Kalangan', 'Male', '1963-11-28 19:13:57', '783-84-0215', 'VP Accounting', 'dmorlandj@nba.com', '+62 964 183 6230', 'Kingsford', '75861', 86);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Minor', 'Payton', 'Cleynman', '882-441-4918', 'Sanfang', 21, 'Rehnān', 'Female', '1970-01-21 07:39:19', '814-15-4416', 'Account Representative IV', 'pcleynmank@ebay.co.uk', '+98 385 837 4535', 'Dryden', '6', 3);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Isabelle', 'Marcelle', 'Summerskill', '785-375-3208', 'Zhonghekou', 23, 'Le Mans', 'Female', '1991-08-25 08:18:55', '707-97-1309', 'Research Assistant IV', 'msummerskillm@blinklist.com', '+33 604 691 9232', 'Killdeer', '43', 17);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Tucker', 'Coretta', 'Detheridge', '989-195-5985', 'Sabandia', 24, 'Liang', 'Male', '1980-04-22 05:17:53', '305-93-0698', 'VP Marketing', 'cdetheridgen@yandex.ru', '+62 525 132 7465', 'Mockingbird', '80081', 6);
insert into customers (first_name, middle_name, last_name, Home_number, city, zip, state, gender, Birth_date, SSN, Job, Email, Phone_number, street_name, street_number, Apartment_number) values ('Fara', 'Anderea', 'Gordge', '771-850-4797', 'Palmira', 25, 'Desa Baregbeg', 'Male', '1963-04-01 01:09:29', '381-89-5585', 'VP Quality Control', 'agordgeo@issuu.com', '+62 112 190 0297', 'Russell', '098', 28);



insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('410-411-2892', 'Wikido Hospital', 'Ridgely', 'Maryland', 1, 'Algoma', 'nlardiner0@so-net.ne.jp');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('508-989-4827', 'Wikibox Hospital', 'Worcester', 'Massachusetts', 2, 'Lakewood', 'bdeval1@theatlantic.com');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('786-878-0144', 'Tagpad Hospital', 'Homestead', 'Florida', 3, 'Leroy', 'dsteffans2@nhs.uk');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('530-181-4011', 'Devshare Hospital', 'Sacramento', 'California', 4, 'Hoepker', 'mklemensiewicz3@artisteer.com');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('918-972-0330', 'Jaxworks Hospital', 'Tulsa', 'Oklahoma', 5, 'Kingsford', 'rseeman4@abc.net.au');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('954-537-9080', 'Wikizz Hospital', 'West Palm Beach', 'Florida', 6, 'Delladonna', 'agreswell5@gov.uk');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('334-358-4048', 'Blogpad Hospital', 'Montgomery', 'Alabama', 7, 'Karstens', 'troddick6@google.cn');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('210-165-7524', 'Lazz Hospital', 'San Antonio', 'Texas', 8, 'Hoepker', 'cfolshom7@japanpost.jp');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('919-118-1708', 'Realpoint Hospital', 'Raleigh', 'North Carolina', 9, 'Spaight', 'gjanak8@shutterfly.com');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('317-984-7196', 'Voomm Hospital', 'Indianapolis', 'Indiana', 10, 'Oriole', 'glarmouth9@nature.com');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('812-844-9907', 'Gigazoom Hospital', 'Bloomington', 'Indiana', 11, 'Prentice', 'rpericoa@mashable.com');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('714-636-6533', 'Dabjam Hospital', 'Orange', 'California', 12, 'Maple Wood', 'nattockb@hhs.gov');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('404-778-7070', 'Jabbersphere Hospital', 'Atlanta', 'Georgia', 13, 'Derek', 'bmouattc@squidoo.com');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('815-878-4281', 'Kanoodle Hospital', 'Joliet', 'Illinois', 14, 'Birchwood', 'bphilipsohnd@deviantart.com');
insert into Enrolled_Hospitals (Telephone_Number, Name, City, State, Zip, street, Email) values ('702-943-5013', 'Thoughtstorm Hospital', 'North Las Vegas', 'Nevada', 15, 'Blaine', 'abettridgee@usa.gov');



insert into Dependents (SSN, first_name, Middle_name, last_name, Relationship, gender, Birth_date, customer_SSN) values ('665-77-0151', 'Leupold', 'Hube', 'Spellar', 'son', 'Male', '2004-11-10', '724-53-9334');
insert into Dependents (SSN, first_name, Middle_name, last_name, Relationship, gender, Birth_date, customer_SSN) values ('583-28-5314', 'Jazmin', 'Benny', 'Jepperson', 'husband', 'Male', '1965-09-04', '381-89-5585');
insert into Dependents (SSN, first_name, Middle_name, last_name, Relationship, gender, Birth_date, customer_SSN) values ('525-79-6115', 'Jason', 'Seumas', 'Bohlsen', 'son', 'Male', '2002-03-14', '707-97-1309');
insert into Dependents (SSN, first_name, Middle_name, last_name, Relationship, gender, Birth_date, customer_SSN) values ('619-05-1234', 'Jany', 'Greggory', 'Leethem', 'husband', 'Male', '1970-01-29', '783-84-0215');
insert into Dependents (SSN, first_name, Middle_name, last_name, Relationship, gender, Birth_date, customer_SSN) values ('207-52-8722', 'Ikey', 'Pearce', 'Sambals', 'daughter', 'Female', '2002-09-04', '460-17-1939');
insert into Dependents (SSN, first_name, Middle_name, last_name, Relationship, gender, Birth_date, customer_SSN) values ('211-57-7594', 'Konstantin', 'Worthington', 'Londesborough', 'husband', 'Male', '1971-09-11', '809-47-4549');
insert into Dependents (SSN, first_name, Middle_name, last_name, Relationship, gender, Birth_date, customer_SSN) values ('434-83-9280', 'Hersch', 'Sax', 'Kingzett', 'husband', 'Male', '1974-10-13', '323-29-5244');
insert into Dependents (SSN, first_name, Middle_name, last_name, Relationship, gender, Birth_date, customer_SSN) values ('699-55-1014', 'Eileen', 'Berkeley', 'Killingback', 'daughter', 'Female', '1976-05-07', '706-13-0912');
insert into Dependents (SSN, first_name, Middle_name, last_name, Relationship, gender, Birth_date, customer_SSN) values ('445-52-5698', 'Carolyn', 'Skelly', 'Espine', 'son', 'Male', '2012-11-25', '706-13-0912');
insert into Dependents (SSN, first_name, Middle_name, last_name, Relationship, gender, Birth_date, customer_SSN) values ('671-37-7965', 'Hilary', 'Federico', 'Parkey', 'daughter', 'Female', '1977-04-13', '783-84-0215');



insert into plans values ('Basic', 50 , 1000 );
insert into plans values ('Premium', 70, 2000);
insert into plans values ('Golden', 95 , 3500);


insert into cover values (1,'Basic');
insert into cover values (2,'Basic');
insert into cover values (3,'Basic');
insert into cover values (4,'Basic');
insert into cover values (5,'Basic');
insert into cover values (1,'Golden');
insert into cover values (2,'Golden');
insert into cover values (3,'Golden');
insert into cover values (4,'Golden');
insert into cover values (5,'Golden');
insert into cover values (6,'Golden');
insert into cover values (7,'Golden');
insert into cover values (8,'Golden');
insert into cover values (9,'Golden');
insert into cover values (10,'Golden');
insert into cover values (1,'Premium');
insert into cover values (2,'Premium');
insert into cover values (3,'Premium');
insert into cover values (4,'Premium');
insert into cover values (5,'Premium');
insert into cover values (6,'Premium');
insert into cover values (7,'Premium');
insert into cover values (8,'Premium');
insert into cover values (9,'Premium');
insert into cover values (10,'Premium');
insert into cover values (11,'Premium');
insert into cover values (12,'Premium');
insert into cover values (13,'Premium');


insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2021-02-17', '381-89-5585', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-08-25', '654-95-7894', 'Premium');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-04-17', '305-93-0698', 'Premium');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-08-23', '523-98-2221', 'Premium');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2021-02-20', '151-89-5276', 'Basic');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-10-11', '783-84-0215', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2021-12-07', '478-52-0836', 'Basic');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2021-09-22', '493-87-0858', 'Basic');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2021-03-04', '809-47-4549', 'Premium');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-04-22', '625-68-3268', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-08-21', '101-92-9680', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-05-13', '724-53-9334', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-03-13', '800-96-7965', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-01-25', '722-45-1521', 'Premium');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2021-07-08', '280-36-0350', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-02-07', '707-97-1309', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2021-05-19', '706-13-0912', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-12-25', '582-79-5131', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-05-05', '814-15-4416', 'Premium');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-05-30', '344-62-3126', 'Premium');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2021-03-06', '884-05-4711', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-09-12', '323-29-5244', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2021-02-04', '460-17-1939', 'Basic');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2021-03-21', '206-34-3407', 'Golden');
insert into plan_subscriptions (expire_date, customer_SSN, type ) values ('2022-03-12', '381-89-5585', 'Basic');




insert into Insurance_claims (Expense, Expense_details, Date) values (5204, 'Diabetic coma and needed 2 days in hospital for emergency treatment. ', '2021-07-08');
insert into Insurance_claims (Expense, Expense_details, Date) values (4075, '50% are for dental problems the rest are usual checkups. ', '2021-14-12');
insert into Insurance_claims (Expense, Expense_details, Date) values (7109, '50% are for dental problems the rest are usual checkups. ', '2021-25-11');
insert into Insurance_claims (Expense, Expense_details, Date) values (6925, 'monthly psychiatric treatment. ', '2021-03-05');
insert into Insurance_claims (Expense, Expense_details, Date) values (6390, '50% are for dental problems the rest are usual checkups. ', '2021-10-12');
insert into Insurance_claims (Expense, Expense_details, Date) values (1723, 'monthly psychiatric treatment. ', '2021-21-02');
insert into Insurance_claims (Expense, Expense_details, Date) values (451, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-26-03');
insert into Insurance_claims (Expense, Expense_details, Date) values (5902, 'check-ups to detect cancer but it was negative. ', '2022-01-02');
insert into Insurance_claims (Expense, Expense_details, Date) values (9046, 'was hospitalized for chest infection. ', '2021-09-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (1896, 'check-ups to detect cancer but it was negative. ', '2021-28-12');
insert into Insurance_claims (Expense, Expense_details, Date) values (6385, '50% are for dental problems the rest are usual checkups. ', '2021-10-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (662, 'Diabetic coma and needed 2 days in hospital for emergency treatment. ', '2021-22-12');
insert into Insurance_claims (Expense, Expense_details, Date) values (1649, 'check-ups to detect cancer but it was negative. ', '2021-12-08');
insert into Insurance_claims (Expense, Expense_details, Date) values (2875, 'check-ups to detect cancer but it was negative. ', '2021-16-03');
insert into Insurance_claims (Expense, Expense_details, Date) values (1444, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-25-07');
insert into Insurance_claims (Expense, Expense_details, Date) values (4496, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-01-12');
insert into Insurance_claims (Expense, Expense_details, Date) values (1957, 'the customer had an accident and needed several kinds of surgery.  ', '2021-18-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (2685, 'the customer had an accident and needed several kinds of surgery.  ', '2021-08-11');
insert into Insurance_claims (Expense, Expense_details, Date) values (3861, 'monthly psychiatric treatment. ', '2021-09-29');
insert into Insurance_claims (Expense, Expense_details, Date) values (8688, 'hip dislocation surgery and was hospitalized for 2 days and physical treatment needed.', '2021-12-05');
insert into Insurance_claims (Expense, Expense_details, Date) values (1608, 'Diabetic coma and needed 2 days in hospital for emergency treatment. ', '2021-26-04');
insert into Insurance_claims (Expense, Expense_details, Date) values (7481, '50% are for dental problems the rest are usual checkups. ', '2021-07-08');
insert into Insurance_claims (Expense, Expense_details, Date) values (8945, 'monthly psychiatric treatment. ', '2021-16-05');
insert into Insurance_claims (Expense, Expense_details, Date) values (5302, 'hip dislocation surgery and was hospitalized for 2 days and physical treatment needed.', '2021-12-07');
insert into Insurance_claims (Expense, Expense_details, Date) values (1583, 'the customer had an accident and needed several kinds of surgery.  ', '2021-09-02');
insert into Insurance_claims (Expense, Expense_details, Date) values (5375, '50% are for dental problems the rest are usual checkups. ', '2021-09-06');
insert into Insurance_claims (Expense, Expense_details, Date) values (4736, 'hip dislocation surgery and was hospitalized for 2 days and physical treatment needed.', '2021-26-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (5475, 'check-ups to detect cancer but it was negative. ', '2021-23-07');
insert into Insurance_claims (Expense, Expense_details, Date) values (4961, 'monthly psychiatric treatment. ', '2021-12-05');
insert into Insurance_claims (Expense, Expense_details, Date) values (9913, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-18-05');
insert into Insurance_claims (Expense, Expense_details, Date) values (7267, 'check-ups to detect cancer but it was negative. ', '2021-16-01');
insert into Insurance_claims (Expense, Expense_details, Date) values (2135, 'check-ups to detect cancer but it was negative. ', '2021-30-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (9384, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-05-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (5426, '50% are for dental problems the rest are usual checkups. ', '2021-11-03');
insert into Insurance_claims (Expense, Expense_details, Date) values (6766, 'Diabetic coma and needed 2 days in hospital for emergency treatment. ', '2021-17-05');
insert into Insurance_claims (Expense, Expense_details, Date) values (8996, 'was hospitalized for chest infection. ', '2021-08-08');
insert into Insurance_claims (Expense, Expense_details, Date) values (2183, 'got hospitalized because severe stomach pain and got better after 4 days. ', '2021-02-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (912, 'hip dislocation surgery and was hospitalized for 2 days and physical treatment needed.', '2021-28-02');
insert into Insurance_claims (Expense, Expense_details, Date) values (8336, 'hip dislocation surgery and was hospitalized for 2 days and physical treatment needed.', '2021-14-08');
insert into Insurance_claims (Expense, Expense_details, Date) values (5157, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-27-07');
insert into Insurance_claims (Expense, Expense_details, Date) values (5751, 'the customer had an accident and needed several kinds of surgery.  ', '2021-25-10');
insert into Insurance_claims (Expense, Expense_details, Date) values (2725, 'Diabetic coma and needed 2 days in hospital for emergency treatment. ', '2021-14-05');
insert into Insurance_claims (Expense, Expense_details, Date) values (735, 'check-ups to detect cancer but it was negative. ', '2021-10-10');
insert into Insurance_claims (Expense, Expense_details, Date) values (4377, '50% are for dental problems the rest are usual checkups. ', '2021-18-03');
insert into Insurance_claims (Expense, Expense_details, Date) values (172, 'got hospitalized because severe stomach pain and got better after 4 days. ', '2021-17-03');
insert into Insurance_claims (Expense, Expense_details, Date) values (8316, 'got hospitalized because severe stomach pain and got better after 4 days. ', '2021-17-01');
insert into Insurance_claims (Expense, Expense_details, Date) values (5756, 'got hospitalized because severe stomach pain and got better after 4 days. ', '2021-11-03');
insert into Insurance_claims (Expense, Expense_details, Date) values (8877, 'the customer had an accident and needed several kinds of surgery.  ', '2021-10-12');
insert into Insurance_claims (Expense, Expense_details, Date) values (5951, 'the customer had an accident and needed several kinds of surgery.  ', '2021-26-11');
insert into Insurance_claims (Expense, Expense_details, Date) values (9187, '50% are for dental problems the rest are usual checkups. ', '2021-08-04');




insert into Insurance_claims (Expense, Expense_details, Date) values (5204, 'Diabetic coma and needed 2 days in hospital for emergency treatment. ', '2021-07-08');
insert into Insurance_claims (Expense, Expense_details, Date) values (4075, '50% are for dental problems the rest are usual checkups. ', '2021-12-14');
insert into Insurance_claims (Expense, Expense_details, Date) values (7109, '50% are for dental problems the rest are usual checkups. ', '2021-11-25');
insert into Insurance_claims (Expense, Expense_details, Date) values (6925, 'monthly psychiatric treatment. ', '2021-03-05');
insert into Insurance_claims (Expense, Expense_details, Date) values (6390, '50% are for dental problems the rest are usual checkups. ', '2021-10-12');
insert into Insurance_claims (Expense, Expense_details, Date) values (1723, 'monthly psychiatric treatment. ', '2021-02-21');
insert into Insurance_claims (Expense, Expense_details, Date) values (451, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-03-26');
insert into Insurance_claims (Expense, Expense_details, Date) values (5902, 'check-ups to detect cancer but it was negative. ', '2022-01-02');
insert into Insurance_claims (Expense, Expense_details, Date) values (9046, 'was hospitalized for chest infection. ', '2021-09-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (1896, 'check-ups to detect cancer but it was negative. ', '2021-12-28');
insert into Insurance_claims (Expense, Expense_details, Date) values (6385, '50% are for dental problems the rest are usual checkups. ', '2021-10-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (662, 'Diabetic coma and needed 2 days in hospital for emergency treatment. ', '2021-12-22');
insert into Insurance_claims (Expense, Expense_details, Date) values (1649, 'check-ups to detect cancer but it was negative. ', '2021-12-08');
insert into Insurance_claims (Expense, Expense_details, Date) values (2875, 'check-ups to detect cancer but it was negative. ', '2021-03-16');
insert into Insurance_claims (Expense, Expense_details, Date) values (1444, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-07-25');
insert into Insurance_claims (Expense, Expense_details, Date) values (4496, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-01-12');
insert into Insurance_claims (Expense, Expense_details, Date) values (1957, 'the customer had an accident and needed several kinds of surgery.  ', '2021-09-18');
insert into Insurance_claims (Expense, Expense_details, Date) values (2685, 'the customer had an accident and needed several kinds of surgery.  ', '2021-08-11');
insert into Insurance_claims (Expense, Expense_details, Date) values (3861, 'monthly psychiatric treatment. ', '2021-09-29');
insert into Insurance_claims (Expense, Expense_details, Date) values (8688, 'hip dislocation surgery and was hospitalized for 2 days and physical treatment needed.', '2021-12-05');
insert into Insurance_claims (Expense, Expense_details, Date) values (1608, 'Diabetic coma and needed 2 days in hospital for emergency treatment. ', '2021-04-26');
insert into Insurance_claims (Expense, Expense_details, Date) values (7481, '50% are for dental problems the rest are usual checkups. ', '2021-07-08');
insert into Insurance_claims (Expense, Expense_details, Date) values (8945, 'monthly psychiatric treatment. ', '2021-05-16');
insert into Insurance_claims (Expense, Expense_details, Date) values (5302, 'hip dislocation surgery and was hospitalized for 2 days and physical treatment needed.', '2021-12-07');
insert into Insurance_claims (Expense, Expense_details, Date) values (1583, 'the customer had an accident and needed several kinds of surgery.  ', '2021-09-02');
insert into Insurance_claims (Expense, Expense_details, Date) values (5375, '50% are for dental problems the rest are usual checkups. ', '2021-09-06');
insert into Insurance_claims (Expense, Expense_details, Date) values (4736, 'hip dislocation surgery and was hospitalized for 2 days and physical treatment needed.', '2021-09-26');
insert into Insurance_claims (Expense, Expense_details, Date) values (5475, 'check-ups to detect cancer but it was negative. ', '2021-07-23');
insert into Insurance_claims (Expense, Expense_details, Date) values (4961, 'monthly psychiatric treatment. ', '2021-12-05');
insert into Insurance_claims (Expense, Expense_details, Date) values (9913, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-05-18');
insert into Insurance_claims (Expense, Expense_details, Date) values (7267, 'check-ups to detect cancer but it was negative. ', '2021-01-16');
insert into Insurance_claims (Expense, Expense_details, Date) values (2135, 'check-ups to detect cancer but it was negative. ', '2021-09-30');
insert into Insurance_claims (Expense, Expense_details, Date) values (9384, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-05-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (5426, '50% are for dental problems the rest are usual checkups. ', '2021-11-03');
insert into Insurance_claims (Expense, Expense_details, Date) values (6766, 'Diabetic coma and needed 2 days in hospital for emergency treatment. ', '2021-05-17');
insert into Insurance_claims (Expense, Expense_details, Date) values (8996, 'was hospitalized for chest infection. ', '2021-08-08');
insert into Insurance_claims (Expense, Expense_details, Date) values (2183, 'got hospitalized because severe stomach pain and got better after 4 days. ', '2021-02-09');
insert into Insurance_claims (Expense, Expense_details, Date) values (912, 'hip dislocation surgery and was hospitalized for 2 days and physical treatment needed.', '2021-02-28');
insert into Insurance_claims (Expense, Expense_details, Date) values (8336, 'hip dislocation surgery and was hospitalized for 2 days and physical treatment needed.', '2021-08-14');
insert into Insurance_claims (Expense, Expense_details, Date) values (5157, 'the customer had covid-19 and was phosphatized for about 2 weeks. ', '2021-07-27');
insert into Insurance_claims (Expense, Expense_details, Date) values (5751, 'the customer had an accident and needed several kinds of surgery.  ', '2021-10-25');
insert into Insurance_claims (Expense, Expense_details, Date) values (2725, 'Diabetic coma and needed 2 days in hospital for emergency treatment. ', '2021-05-14');
insert into Insurance_claims (Expense, Expense_details, Date) values (735, 'check-ups to detect cancer but it was negative. ', '2021-10-10');
insert into Insurance_claims (Expense, Expense_details, Date) values (4377, '50% are for dental problems the rest are usual checkups. ', '2021-03-18');
insert into Insurance_claims (Expense, Expense_details, Date) values (172, 'got hospitalized because severe stomach pain and got better after 4 days. ', '2021-03-17');
insert into Insurance_claims (Expense, Expense_details, Date) values (8316, 'got hospitalized because severe stomach pain and got better after 4 days. ', '2021-01-27');
insert into Insurance_claims (Expense, Expense_details, Date) values (5756, 'got hospitalized because severe stomach pain and got better after 4 days. ', '2021-03-11');
insert into Insurance_claims (Expense, Expense_details, Date) values (8877, 'the customer had an accident and needed several kinds of surgery.  ', '2021-10-12');
insert into Insurance_claims (Expense, Expense_details, Date) values (5951, 'the customer had an accident and needed several kinds of surgery.  ', '2021-11-26');
insert into Insurance_claims (Expense, Expense_details, Date) values (9187, '50% are for dental problems the rest are usual checkups. ', '2021-08-04');


insert into Insurance_claims (Hospital_id) values (15);
insert into Insurance_claims (Hospital_id) values (15);
insert into Insurance_claims (Hospital_id) values (14);
insert into Insurance_claims (Hospital_id) values (14);
insert into Insurance_claims (Hospital_id) values (13);
insert into Insurance_claims (Hospital_id) values (13);
insert into Insurance_claims (Hospital_id) values (12);
insert into Insurance_claims (Hospital_id) values (12);
insert into Insurance_claims (Hospital_id) values (11);
insert into Insurance_claims (Hospital_id) values (11);
insert into Insurance_claims (Hospital_id) values (10);
insert into Insurance_claims (Hospital_id) values (10);
insert into Insurance_claims (Hospital_id) values (9);
insert into Insurance_claims (Hospital_id) values (9);
insert into Insurance_claims (Hospital_id) values (8);
insert into Insurance_claims (Hospital_id) values (8);
insert into Insurance_claims (Hospital_id) values (7);
insert into Insurance_claims (Hospital_id) values (7);
insert into Insurance_claims (Hospital_id) values (6);
insert into Insurance_claims (Hospital_id) values (6);
insert into Insurance_claims (Hospital_id) values (6);
insert into Insurance_claims (Hospital_id) values (5);
insert into Insurance_claims (Hospital_id) values (5);
insert into Insurance_claims (Hospital_id) values (5);
insert into Insurance_claims (Hospital_id) values (5);
insert into Insurance_claims (Hospital_id) values (5);
insert into Insurance_claims (Hospital_id) values (5);
insert into Insurance_claims (Hospital_id) values (5);
insert into Insurance_claims (Hospital_id) values (5);
insert into Insurance_claims (Hospital_id) values (4);
insert into Insurance_claims (Hospital_id) values (4);
insert into Insurance_claims (Hospital_id) values (4);
insert into Insurance_claims (Hospital_id) values (4);
insert into Insurance_claims (Hospital_id) values (4);
insert into Insurance_claims (Hospital_id) values (4);
insert into Insurance_claims (Hospital_id) values (4);
insert into Insurance_claims (Hospital_id) values (3);
insert into Insurance_claims (Hospital_id) values (3);
insert into Insurance_claims (Hospital_id) values (3);
insert into Insurance_claims (Hospital_id) values (2);
insert into Insurance_claims (Hospital_id) values (2);
insert into Insurance_claims (Hospital_id) values (2);
insert into Insurance_claims (Hospital_id) values (2);
insert into Insurance_claims (Hospital_id) values (2);
insert into Insurance_claims (Hospital_id) values (2);
insert into Insurance_claims (Hospital_id) values (1);
insert into Insurance_claims (Hospital_id) values (1);
insert into Insurance_claims (Hospital_id) values (1);
insert into Insurance_claims (Hospital_id) values (1);
insert into Insurance_claims (Hospital_id) values (1);

insert into files (SSN, Claim_ID) values ('344-62-3126', 1);
insert into files (SSN, Claim_ID) values ('722-45-1521', 2);
insert into files (SSN, Claim_ID) values ('625-68-3268', 3);
insert into files (SSN, Claim_ID) values ('523-98-2221', 4);
insert into files (SSN, Claim_ID) values ('323-29-5244', 5);
insert into files (SSN, Claim_ID) values ('460-17-1939', 6);
insert into files (SSN, Claim_ID) values ('654-95-7894', 7);
insert into files (SSN, Claim_ID) values ('654-95-7894', 8);
insert into files (SSN, Claim_ID) values ('305-93-0698', 9);
insert into files (SSN, Claim_ID) values ('654-95-7894', 10);
insert into files (SSN, Claim_ID) values ('493-87-0858', 11);
insert into files (SSN, Claim_ID) values ('722-45-1521', 12);
insert into files (SSN, Claim_ID) values ('625-68-3268', 13);
insert into files (SSN, Claim_ID) values ('151-89-5276', 14);
insert into files (SSN, Claim_ID) values ('323-29-5244', 15);
insert into files (SSN, Claim_ID) values ('344-62-3126', 16);
insert into files (SSN, Claim_ID) values ('280-36-0350', 17);
insert into files (SSN, Claim_ID) values ('344-62-3126', 18);
insert into files (SSN, Claim_ID) values ('151-89-5276', 19);
insert into files (SSN, Claim_ID) values ('783-84-0215', 20);
insert into files (SSN, Claim_ID) values ('280-36-0350', 21);
insert into files (SSN, Claim_ID) values ('707-97-1309', 22);
insert into files (SSN, Claim_ID) values ('783-84-0215', 23);
insert into files (SSN, Claim_ID) values ('625-68-3268', 24);
insert into files (SSN, Claim_ID) values ('323-29-5244', 25);
insert into files (SSN, Claim_ID) values ('800-96-7965', 26);
insert into files (SSN, Claim_ID) values ('809-47-4549', 27);
insert into files (SSN, Claim_ID) values ('722-45-1521', 28);
insert into files (SSN, Claim_ID) values ('523-98-2221', 29);
insert into files (SSN, Claim_ID) values ('809-47-4549', 30);
insert into files (SSN, Claim_ID) values ('724-53-9334', 31);
insert into files (SSN, Claim_ID) values ('305-93-0698', 32);
insert into files (SSN, Claim_ID) values ('724-53-9334', 33);
insert into files (SSN, Claim_ID) values ('206-34-3407', 34);
insert into files (SSN, Claim_ID) values ('206-34-3407', 35);
insert into files (SSN, Claim_ID) values ('151-89-5276', 36);
insert into files (SSN, Claim_ID) values ('344-62-3126', 37);
insert into files (SSN, Claim_ID) values ('523-98-2221', 38);
insert into files (SSN, Claim_ID) values ('707-97-1309', 39);
insert into files (SSN, Claim_ID) values ('800-96-7965', 40);
insert into files (SSN, Claim_ID) values ('478-52-0836', 41);
insert into files (SSN, Claim_ID) values ('305-93-0698', 42);
insert into files (SSN, Claim_ID) values ('884-05-4711', 43);
insert into files (SSN, Claim_ID) values ('381-89-5585', 44);
insert into files (SSN, Claim_ID) values ('523-98-2221', 45);
insert into files (SSN, Claim_ID) values ('478-52-0836', 46);
insert into files (SSN, Claim_ID) values ('151-89-5276', 47);
insert into files (SSN, Claim_ID) values ('884-05-4711', 48);
insert into files (SSN, Claim_ID) values ('582-79-5131', 49);
insert into files (SSN, Claim_ID) values ('654-95-7894', 50);


insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('280-36-0350', null, 1);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('800-96-7965', null, 2);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('323-29-5244', null, 3);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('323-29-5244', null, 4);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('707-97-1309', null, 5);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('884-05-4711', null, 6);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('305-93-0698', null, 7);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('582-79-5131', null, 8);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('707-97-1309', '525-79-6115', 9);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('625-68-3268', null, 10);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('460-17-1939', null, 11);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('706-13-0912', null, 12);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('381-89-5585', null, 13);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('344-62-3126', null, 14);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('101-92-9680', null, 15);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('460-17-1939', null, 16);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('493-87-0858', null, 17);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('724-53-9334', null, 18);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('478-52-0836', null, 19);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('493-87-0858', null, 20);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('151-89-5276', null, 21);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('783-84-0215', null, 22);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('344-62-3126', null, 23);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('783-84-0215', null, 24);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('523-98-2221', null, 25);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('783-84-0215', null, 26);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('523-98-2221', null, 27);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('706-13-0912', null, 28);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('783-84-0215', null, 29);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('809-47-4549', null, 30);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('800-96-7965', null, 31);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('305-93-0698', null, 32);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('724-53-9334', null, 33);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('654-95-7894', null, 34);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('783-84-0215', null, 35);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('800-96-7965', null, 36);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('460-17-1939', '207-52-8722', 37);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('493-87-0858', null, 38);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('151-89-5276', null, 39);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('582-79-5131', null, 40);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('706-13-0912', '445-52-5698', 41);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('724-53-9334', '665-77-0151', 42);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('280-36-0350', null, 43);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('101-92-9680', null, 44);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('625-68-3268', null, 45);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('381-89-5585', null, 46);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('381-89-5585', null, 47);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('344-62-3126', null, 48);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('582-79-5131', null, 49);
insert into benefits (customer_SSN, dep_SSN, Claim_ID) values ('625-68-3268', null, 50);

