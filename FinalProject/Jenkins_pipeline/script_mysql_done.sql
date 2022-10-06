/* Create books table */

CREATE TABLE books
(
 id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(64), 
 author VARCHAR(32),
 format ENUM('paperback', 'hardback', 'ebook'),
 price DECIMAL(5,2)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO books (title, author, format, price) 
  VALUES ('The Adventures of Duck and Goose', 'Sir Quackalot', 'paperback', 10.99);
INSERT INTO books (title, author, format, price)
  VALUES ('The Return of Duck and Goose', 'Sir Quackalot', 'paperback', 11.99);
INSERT INTO books (title, author, format, price)
  VALUES ('More Fun with Duck and Goose', 'Sir Quackalot', 'paperback', 12.99);
INSERT INTO books (title, author, format, price)
  VALUES ('Duck and Goose on Holiday', 'Sir Quackalot', 'paperback', 11.99);
INSERT INTO books (title, author, format, price)
  VALUES ('The Return of Duck and Goose', 'Sir Quackalot', 'hardback', 19.99);
INSERT INTO books (title, author, format, price)
  VALUES ('The Adventures of Duck and Goose', 'Sir Quackalot', 'hardback', 18.99);
INSERT INTO books (title, author, format, price)
  VALUES ('My Friend is a Duck', 'A. Parrot', 'paperback', 14.99);
INSERT INTO books (title, author, format, price)
  VALUES ('Annotated Notes on the вЂDuck and GooseвЂ™ chronicles', 'Prof Macaw', 'ebook', 8.99);
INSERT INTO books (title, author, format, price)
  VALUES ('вЂDuck and GooseвЂ™ Cheat Sheet for Students', 'Polly Parrot', 'ebook', 5.99);
INSERT INTO books (title, author, format, price)
  VALUES ('вЂDuck and GooseвЂ™: an allegory for modern times?', 'Bor Ing', 'hardback', 59.99);

/* Create people table */

CREATE TABLE people
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  forenames VARCHAR(32) NOT NULL, 
  surname VARCHAR(32) NOT NULL,
  title VARCHAR(8),
  address1 VARCHAR(32) NOT NULL,
  address2 VARCHAR(32),
  town VARCHAR(32) NOT NULL,
  county VARCHAR(32),
  country CHAR(2) NOT NULL,
  postcode VARCHAR(32),
  subscribed BIT(1) DEFAULT 0,
  gender ENUM('male', 'female'),
  dob DATE,
  INDEX(id, surname)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO people (forenames, surname, title, address1, address2, town, county, country, postcode, subscribed, gender, dob) 
  VALUES ('Polly', 'Parrot', 'Miss', '42 The Lane', NULL, 'Some Town', 'Noshire', 'gb', 'AB1 2XY', 1, 'female', '1970-12-31');
INSERT INTO people (forenames, surname, title, address1, address2, town, county, country, postcode, subscribed, gender, dob) 
  VALUES ('Mabel', 'Canary', 'Mrs', '24 The Street', 'Some Village', 'Some Town', 'Noshire', 'gb', 'AB1 2YZ', 0, 'female', '1968-01-23');
INSERT INTO people (forenames, surname, title, address1, address2, town, county, country, postcode, subscribed, gender, dob) 
  VALUES ('ZГ¶e', 'Zebra', 'Ms', '856 The Avenue', NULL, 'Some City', 'CA', 'us', '123456', 1, 'female', '1989-07-16');
INSERT INTO people (forenames, surname, title, address1, address2, town, county, country, postcode, subscribed, gender, dob) 
  VALUES ('JosГ©', 'Arara', NULL, 'Nenhuma Rua', NULL, 'SГЈo Paulo', NULL, 'br', '123457', 1, 'male', '1991-05-30');
INSERT INTO people (forenames, surname, title, address1, address2, town, county, country, postcode, subscribed, gender, dob) 
  VALUES ('Dickie', 'Duck', 'Mr', '1 The Street', 'Another Village', 'Some City', 'Imagineshire', 'gb', 'YZ1 2AB', 0, 'male', '1952-11-25');
INSERT INTO people (forenames, surname, title, address1, address2, town, county, country, postcode, subscribed, gender, dob) 
  VALUES ('Fred', 'Canary', 'Mr', '24 The Street', 'Some Village', 'Some Town', 'Noshire', 'gb', 'AB1 2YZ', 1, 'male', '1967-08-04');


/* Create country codes table */

CREATE TABLE countries
(
  code CHAR(2) PRIMARY KEY NOT NULL,
  name VARCHAR(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO countries (code, name)
  VALUES ('ad', 'Andorra');
INSERT INTO countries (code, name)
  VALUES ('ae', 'United Arab Emirates');
INSERT INTO countries (code, name)
  VALUES ('af', 'Afghanistan');
INSERT INTO countries (code, name)
  VALUES ('ag', 'Antigua and Barbuda');
INSERT INTO countries (code, name)
  VALUES ('ai', 'Anguilla');
INSERT INTO countries (code, name)
  VALUES ('al', 'Albania');
INSERT INTO countries (code, name)
  VALUES ('am', 'Armenia');
INSERT INTO countries (code, name)
  VALUES ('ao', 'Angola');
INSERT INTO countries (code, name)
  VALUES ('aq', 'Antarctica');
INSERT INTO countries (code, name)
  VALUES ('ar', 'Argentina');
INSERT INTO countries (code, name)
  VALUES ('as', 'American Samoa');
INSERT INTO countries (code, name)
  VALUES ('at', 'Austria');
INSERT INTO countries (code, name)
  VALUES ('au', 'Australia');
INSERT INTO countries (code, name)
  VALUES ('aw', 'Aruba');
INSERT INTO countries (code, name)
  VALUES ('ax', 'Г…land Islands');
INSERT INTO countries (code, name)
  VALUES ('az', 'Azerbaijan');
INSERT INTO countries (code, name)
  VALUES ('ba', 'Bosnia and Herzegovina');
INSERT INTO countries (code, name)
  VALUES ('bb', 'Barbados');
INSERT INTO countries (code, name)
  VALUES ('bd', 'Bangladesh');
INSERT INTO countries (code, name)
  VALUES ('be', 'Belgium');
INSERT INTO countries (code, name)
  VALUES ('bf', 'Burkina Faso');
INSERT INTO countries (code, name)
  VALUES ('bg', 'Bulgaria');
INSERT INTO countries (code, name)
  VALUES ('bh', 'Bahrain');
INSERT INTO countries (code, name)
  VALUES ('bi', 'Burundi');
INSERT INTO countries (code, name)
  VALUES ('bj', 'Benin');
INSERT INTO countries (code, name)
  VALUES ('bl', 'Saint BarthГ©lemy');
INSERT INTO countries (code, name)
  VALUES ('bm', 'Bermuda');
INSERT INTO countries (code, name)
  VALUES ('bn', 'Brunei Darussalam');
INSERT INTO countries (code, name)
  VALUES ('bo', 'Bolivia');
INSERT INTO countries (code, name)
  VALUES ('bq', 'Bonaire');
INSERT INTO countries (code, name)
  VALUES ('br', 'Brazil');
INSERT INTO countries (code, name)
  VALUES ('bs', 'Bahamas');
INSERT INTO countries (code, name)
  VALUES ('bt', 'Bhutan');
INSERT INTO countries (code, name)
  VALUES ('bv', 'Bouvet Island');
INSERT INTO countries (code, name)
  VALUES ('bw', 'Botswana');
INSERT INTO countries (code, name)
  VALUES ('by', 'Belarus');
INSERT INTO countries (code, name)
  VALUES ('bz', 'Belize');
INSERT INTO countries (code, name)
  VALUES ('ca', 'Canada');
INSERT INTO countries (code, name)
  VALUES ('cc', 'Cocos (Keeling) Islands');
INSERT INTO countries (code, name)
  VALUES ('cd', 'Congo');
INSERT INTO countries (code, name)
  VALUES ('cf', 'Central African Republic');
INSERT INTO countries (code, name)
  VALUES ('cg', 'Congo');
INSERT INTO countries (code, name)
  VALUES ('ch', 'Switzerland');
INSERT INTO countries (code, name)
  VALUES ('ci', 'CГґte dвЂ™Ivoire');
INSERT INTO countries (code, name)
  VALUES ('ck', 'Cook Islands');
INSERT INTO countries (code, name)
  VALUES ('cl', 'Chile');
INSERT INTO countries (code, name)
  VALUES ('cm', 'Cameroon');
INSERT INTO countries (code, name)
  VALUES ('cn', 'China');
INSERT INTO countries (code, name)
  VALUES ('co', 'Colombia');
INSERT INTO countries (code, name)
  VALUES ('cr', 'Costa Rica');
INSERT INTO countries (code, name)
  VALUES ('cu', 'Cuba');
INSERT INTO countries (code, name)
  VALUES ('cv', 'Cape Verde');
INSERT INTO countries (code, name)
  VALUES ('cw', 'CuraГ§ao');
INSERT INTO countries (code, name)
  VALUES ('cx', 'Christmas Island');
INSERT INTO countries (code, name)
  VALUES ('cy', 'Cyprus');
INSERT INTO countries (code, name)
  VALUES ('cz', 'Czech Republic');
INSERT INTO countries (code, name)
  VALUES ('de', 'Germany');
INSERT INTO countries (code, name)
  VALUES ('dj', 'Djibouti');
INSERT INTO countries (code, name)
  VALUES ('dk', 'Denmark');
INSERT INTO countries (code, name)
  VALUES ('dm', 'Dominica');
INSERT INTO countries (code, name)
  VALUES ('do', 'Dominican Republic');
INSERT INTO countries (code, name)
  VALUES ('dz', 'Algeria');
INSERT INTO countries (code, name)
  VALUES ('ec', 'Ecuador');
INSERT INTO countries (code, name)
  VALUES ('ee', 'Estonia');
INSERT INTO countries (code, name)
  VALUES ('eg', 'Egypt');
INSERT INTO countries (code, name)
  VALUES ('eh', 'Western Sahara');
INSERT INTO countries (code, name)
  VALUES ('er', 'Eritrea');
INSERT INTO countries (code, name)
  VALUES ('es', 'Spain');
INSERT INTO countries (code, name)
  VALUES ('et', 'Ethiopia');
INSERT INTO countries (code, name)
  VALUES ('fi', 'Finland');
INSERT INTO countries (code, name)
  VALUES ('fj', 'Fiji');
INSERT INTO countries (code, name)
  VALUES ('fk', 'Falkland Islands (Malvinas)');
INSERT INTO countries (code, name)
  VALUES ('fm', 'Micronesia');
INSERT INTO countries (code, name)
  VALUES ('fo', 'Faroe Islands');
INSERT INTO countries (code, name)
  VALUES ('fr', 'France');
INSERT INTO countries (code, name)
  VALUES ('ga', 'Gabon');
INSERT INTO countries (code, name)
  VALUES ('gb', 'United Kingdom');
INSERT INTO countries (code, name)
  VALUES ('gd', 'Grenada');
INSERT INTO countries (code, name)
  VALUES ('ge', 'Georgia');
INSERT INTO countries (code, name)
  VALUES ('gf', 'French Guiana');
INSERT INTO countries (code, name)
  VALUES ('gg', 'Guernsey');
INSERT INTO countries (code, name)
  VALUES ('gh', 'Ghana');
INSERT INTO countries (code, name)
  VALUES ('gi', 'Gibraltar');
INSERT INTO countries (code, name)
  VALUES ('gl', 'Greenland');
INSERT INTO countries (code, name)
  VALUES ('gm', 'Gambia');
INSERT INTO countries (code, name)
  VALUES ('gn', 'Guinea');
INSERT INTO countries (code, name)
  VALUES ('gp', 'Guadeloupe');
INSERT INTO countries (code, name)
  VALUES ('gq', 'Equatorial Guinea');
INSERT INTO countries (code, name)
  VALUES ('gr', 'Greece');
INSERT INTO countries (code, name)
  VALUES ('gs', 'South Georgia and the South Sandwich Islands');
INSERT INTO countries (code, name)
  VALUES ('gt', 'Guatemala');
INSERT INTO countries (code, name)
  VALUES ('gu', 'Guam');
INSERT INTO countries (code, name)
  VALUES ('gw', 'Guinea-Bissau');
INSERT INTO countries (code, name)
  VALUES ('gy', 'Guyana');
INSERT INTO countries (code, name)
  VALUES ('hk', 'Hong Kong');
INSERT INTO countries (code, name)
  VALUES ('hm', 'Heard Island and McDonald Islands');
INSERT INTO countries (code, name)
  VALUES ('hn', 'Honduras');
INSERT INTO countries (code, name)
  VALUES ('hr', 'Croatia');
INSERT INTO countries (code, name)
  VALUES ('ht', 'Haiti');
INSERT INTO countries (code, name)
  VALUES ('hu', 'Hungary');
INSERT INTO countries (code, name)
  VALUES ('id', 'Indonesia');
INSERT INTO countries (code, name)
  VALUES ('ie', 'Ireland');
INSERT INTO countries (code, name)
  VALUES ('il', 'Israel');
INSERT INTO countries (code, name)
  VALUES ('im', 'Isle of Man');
INSERT INTO countries (code, name)
  VALUES ('in', 'India');
INSERT INTO countries (code, name)
  VALUES ('io', 'British Indian Ocean Territory');
INSERT INTO countries (code, name)
  VALUES ('iq', 'Iraq');
INSERT INTO countries (code, name)
  VALUES ('ir', 'Iran');
INSERT INTO countries (code, name)
  VALUES ('is', 'Iceland');
INSERT INTO countries (code, name)
  VALUES ('it', 'Italy');
INSERT INTO countries (code, name)
  VALUES ('je', 'Jersey');
INSERT INTO countries (code, name)
  VALUES ('jm', 'Jamaica');
INSERT INTO countries (code, name)
  VALUES ('jo', 'Jordan');
INSERT INTO countries (code, name)
  VALUES ('jp', 'Japan');
INSERT INTO countries (code, name)
  VALUES ('ke', 'Kenya');
INSERT INTO countries (code, name)
  VALUES ('kg', 'Kyrgyzstan');
INSERT INTO countries (code, name)
  VALUES ('kh', 'Cambodia');
INSERT INTO countries (code, name)
  VALUES ('ki', 'Kiribati');
INSERT INTO countries (code, name)
  VALUES ('km', 'Comoros');
INSERT INTO countries (code, name)
  VALUES ('kn', 'Saint Kitts and Nevis');
INSERT INTO countries (code, name)
  VALUES ('kp', 'Korea');
INSERT INTO countries (code, name)
  VALUES ('kr', 'Korea');
INSERT INTO countries (code, name)
  VALUES ('kw', 'Kuwait');
INSERT INTO countries (code, name)
  VALUES ('ky', 'Cayman Islands');
INSERT INTO countries (code, name)
  VALUES ('kz', 'Kazakhstan');
INSERT INTO countries (code, name)
  VALUES ('la', 'Lao PeopleвЂ™s Democratic Republic');
INSERT INTO countries (code, name)
  VALUES ('lb', 'Lebanon');
INSERT INTO countries (code, name)
  VALUES ('lc', 'Saint Lucia');
INSERT INTO countries (code, name)
  VALUES ('li', 'Liechtenstein');
INSERT INTO countries (code, name)
  VALUES ('lk', 'Sri Lanka');
INSERT INTO countries (code, name)
  VALUES ('lr', 'Liberia');
INSERT INTO countries (code, name)
  VALUES ('ls', 'Lesotho');
INSERT INTO countries (code, name)
  VALUES ('lt', 'Lithuania');
INSERT INTO countries (code, name)
  VALUES ('lu', 'Luxembourg');
INSERT INTO countries (code, name)
  VALUES ('lv', 'Latvia');
INSERT INTO countries (code, name)
  VALUES ('ly', 'Libya');
INSERT INTO countries (code, name)
  VALUES ('ma', 'Morocco');
INSERT INTO countries (code, name)
  VALUES ('mc', 'Monaco');
INSERT INTO countries (code, name)
  VALUES ('md', 'Moldova');
INSERT INTO countries (code, name)
  VALUES ('me', 'Montenegro');
INSERT INTO countries (code, name)
  VALUES ('mf', 'Saint Martin (French part) ');
INSERT INTO countries (code, name)
  VALUES ('mg', 'Madagascar');
INSERT INTO countries (code, name)
  VALUES ('mh', 'Marshall Islands');
INSERT INTO countries (code, name)
  VALUES ('mk', 'Macedonia');
INSERT INTO countries (code, name)
  VALUES ('ml', 'Mali');
INSERT INTO countries (code, name)
  VALUES ('mm', 'Myanmar');
INSERT INTO countries (code, name)
  VALUES ('mn', 'Mongolia');
INSERT INTO countries (code, name)
  VALUES ('mo', 'Macao');
INSERT INTO countries (code, name)
  VALUES ('mp', 'Northern Mariana Islands');
INSERT INTO countries (code, name)
  VALUES ('mq', 'Martinique');
INSERT INTO countries (code, name)
  VALUES ('mr', 'Mauritania');
INSERT INTO countries (code, name)
  VALUES ('ms', 'Montserrat');
INSERT INTO countries (code, name)
  VALUES ('mt', 'Malta');
INSERT INTO countries (code, name)
  VALUES ('mu', 'Mauritius');
INSERT INTO countries (code, name)
  VALUES ('mv', 'Maldives');
INSERT INTO countries (code, name)
  VALUES ('mw', 'Malawi');
INSERT INTO countries (code, name)
  VALUES ('mx', 'Mexico');
INSERT INTO countries (code, name)
  VALUES ('my', 'Malaysia');
INSERT INTO countries (code, name)
  VALUES ('mz', 'Mozambique');
INSERT INTO countries (code, name)
  VALUES ('na', 'Namibia');
INSERT INTO countries (code, name)
  VALUES ('nc', 'New Caledonia');
INSERT INTO countries (code, name)
  VALUES ('ne', 'Niger');
INSERT INTO countries (code, name)
  VALUES ('nf', 'Norfolk Island');
INSERT INTO countries (code, name)
  VALUES ('ng', 'Nigeria');
INSERT INTO countries (code, name)
  VALUES ('ni', 'Nicaragua');
INSERT INTO countries (code, name)
  VALUES ('nl', 'Netherlands');
INSERT INTO countries (code, name)
  VALUES ('no', 'Norway');
INSERT INTO countries (code, name)
  VALUES ('np', 'Nepal');
INSERT INTO countries (code, name)
  VALUES ('nr', 'Nauru');
INSERT INTO countries (code, name)
  VALUES ('nu', 'Niue');
INSERT INTO countries (code, name)
  VALUES ('nz', 'New Zealand');
INSERT INTO countries (code, name)
  VALUES ('om', 'Oman');
INSERT INTO countries (code, name)
  VALUES ('pa', 'Panama');
INSERT INTO countries (code, name)
  VALUES ('pe', 'Peru');
INSERT INTO countries (code, name)
  VALUES ('pf', 'French Polynesia');
INSERT INTO countries (code, name)
  VALUES ('pg', 'Papua New Guinea');
INSERT INTO countries (code, name)
  VALUES ('ph', 'Philippines');
INSERT INTO countries (code, name)
  VALUES ('pk', 'Pakistan');
INSERT INTO countries (code, name)
  VALUES ('pl', 'Poland');
INSERT INTO countries (code, name)
  VALUES ('pm', 'Saint Pierre and Miquelon');
INSERT INTO countries (code, name)
  VALUES ('pn', 'Pitcairn');
INSERT INTO countries (code, name)
  VALUES ('pr', 'Puerto Rico');
INSERT INTO countries (code, name)
  VALUES ('ps', 'Palestine');
INSERT INTO countries (code, name)
  VALUES ('pt', 'Portugal');
INSERT INTO countries (code, name)
  VALUES ('pw', 'Palau');
INSERT INTO countries (code, name)
  VALUES ('py', 'Paraguay');
INSERT INTO countries (code, name)
  VALUES ('qa', 'Qatar');
INSERT INTO countries (code, name)
  VALUES ('re', 'RГ©union');
INSERT INTO countries (code, name)
  VALUES ('ro', 'Romania');
INSERT INTO countries (code, name)
  VALUES ('rs', 'Serbia');
INSERT INTO countries (code, name)
  VALUES ('ru', 'Russian Federation');
INSERT INTO countries (code, name)
  VALUES ('rw', 'Rwanda');
INSERT INTO countries (code, name)
  VALUES ('sa', 'Saudi Arabia');
INSERT INTO countries (code, name)
  VALUES ('sb', 'Solomon Islands');
INSERT INTO countries (code, name)
  VALUES ('sc', 'Seychelles');
INSERT INTO countries (code, name)
  VALUES ('sd', 'Sudan');
INSERT INTO countries (code, name)
  VALUES ('se', 'Sweden');
INSERT INTO countries (code, name)
  VALUES ('sg', 'Singapore');
INSERT INTO countries (code, name)
  VALUES ('sh', 'Saint Helena');
INSERT INTO countries (code, name)
  VALUES ('si', 'Slovenia');
INSERT INTO countries (code, name)
  VALUES ('sj', 'Svalbard and Jan Mayen');
INSERT INTO countries (code, name)
  VALUES ('sk', 'Slovakia');
INSERT INTO countries (code, name)
  VALUES ('sl', 'Sierra Leone');
INSERT INTO countries (code, name)
  VALUES ('sm', 'San Marino');
INSERT INTO countries (code, name)
  VALUES ('sn', 'Senegal');
INSERT INTO countries (code, name)
  VALUES ('so', 'Somalia');
INSERT INTO countries (code, name)
  VALUES ('sr', 'Suriname');
INSERT INTO countries (code, name)
  VALUES ('ss', 'South Sudan');
INSERT INTO countries (code, name)
  VALUES ('st', 'Sao Tome and Principe');
INSERT INTO countries (code, name)
  VALUES ('sv', 'El Salvador');
INSERT INTO countries (code, name)
  VALUES ('sx', 'Sint Maarten (Dutch part)');
INSERT INTO countries (code, name)
  VALUES ('sy', 'Syrian Arab Republic');
INSERT INTO countries (code, name)
  VALUES ('sz', 'Swaziland');
INSERT INTO countries (code, name)
  VALUES ('tc', 'Turks and Caicos Islands');
INSERT INTO countries (code, name)
  VALUES ('td', 'Chad');
INSERT INTO countries (code, name)
  VALUES ('tf', 'French Southern Territories');
INSERT INTO countries (code, name)
  VALUES ('tg', 'Togo');
INSERT INTO countries (code, name)
  VALUES ('th', 'Thailand');
INSERT INTO countries (code, name)
  VALUES ('tj', 'Tajikistan');
INSERT INTO countries (code, name)
  VALUES ('tk', 'Tokelau');
INSERT INTO countries (code, name)
  VALUES ('tl', 'Timor-Leste');
INSERT INTO countries (code, name)
  VALUES ('tm', 'Turkmenistan');
INSERT INTO countries (code, name)
  VALUES ('tn', 'Tunisia');
INSERT INTO countries (code, name)
  VALUES ('to', 'Tonga');
INSERT INTO countries (code, name)
  VALUES ('tr', 'Turkey');
INSERT INTO countries (code, name)
  VALUES ('tt', 'Trinidad and Tobago');
INSERT INTO countries (code, name)
  VALUES ('tv', 'Tuvalu');
INSERT INTO countries (code, name)
  VALUES ('tw', 'Taiwan');
INSERT INTO countries (code, name)
  VALUES ('tz', 'Tanzania');
INSERT INTO countries (code, name)
  VALUES ('ua', 'Ukraine');
INSERT INTO countries (code, name)
  VALUES ('ug', 'Uganda');
INSERT INTO countries (code, name)
  VALUES ('um', 'United States Minor Outlying Islands');
INSERT INTO countries (code, name)
  VALUES ('us', 'United States');
INSERT INTO countries (code, name)
  VALUES ('uy', 'Uruguay');
INSERT INTO countries (code, name)
  VALUES ('uz', 'Uzbekistan');
INSERT INTO countries (code, name)
  VALUES ('va', 'Holy See (Vatican City State)');
INSERT INTO countries (code, name)
  VALUES ('vc', 'Saint Vincent and the Grenadines');
INSERT INTO countries (code, name)
  VALUES ('ve', 'Venezuela');
INSERT INTO countries (code, name)
  VALUES ('vg', 'Virgin Islands, British');
INSERT INTO countries (code, name)
  VALUES ('vi', 'Virgin Islands, USA');
INSERT INTO countries (code, name)
  VALUES ('vn', 'Viet Nam');
INSERT INTO countries (code, name)
  VALUES ('vu', 'Vanuatu');
INSERT INTO countries (code, name)
  VALUES ('wf', 'Wallis and Futuna');
INSERT INTO countries (code, name)
  VALUES ('ws', 'Samoa');
INSERT INTO countries (code, name)
  VALUES ('ye', 'Yemen');
INSERT INTO countries (code, name)
  VALUES ('yt', 'Mayotte');
INSERT INTO countries (code, name)
  VALUES ('za', 'South Africa');
INSERT INTO countries (code, name)
  VALUES ('zm', 'Zambia');
INSERT INTO countries (code, name)
  VALUES ('zw', 'Zimbabwe');

/* Create ordergroups table */

CREATE TABLE ordergroups
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  customerid INT NOT NULL REFERENCES people (id),
  discount DECIMAL(5,2),
  postage DECIMAL(5,2)
) ENGINE=MyISAM;

INSERT INTO ordergroups (customerid, discount, postage)
 VALUES (2, 0.0, 5.0);
INSERT INTO ordergroups (customerid, discount, postage)
 VALUES (4, 2.5, 20.0);
INSERT INTO ordergroups (customerid, discount, postage)
 VALUES (1, 0.0, 5.0);

/* Create orders table */

CREATE TABLE orders
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  groupid INT NOT NULL REFERENCES ordergroups (id),
  bookid INT NOT NULL REFERENCES books (id),
  quantity INT NOT NULL
) ENGINE=MyISAM;

INSERT INTO orders (groupid, bookid, quantity)
  VALUES (1, 6, 1);
INSERT INTO orders (groupid, bookid, quantity)
  VALUES (1, 1, 4);
INSERT INTO orders (groupid, bookid, quantity)
  VALUES (2, 10, 1);
INSERT INTO orders (groupid, bookid, quantity)
  VALUES (2, 7, 20);
INSERT INTO orders (groupid, bookid, quantity)
  VALUES (2, 8, 1);
INSERT INTO orders (groupid, bookid, quantity)
  VALUES (3, 1, 4);
INSERT INTO orders (groupid, bookid, quantity)
  VALUES (3, 6, 5);
INSERT INTO orders (groupid, bookid, quantity)
  VALUES (3, 7, 2);