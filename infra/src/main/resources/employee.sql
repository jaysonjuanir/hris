DROP TABLE if EXISTS employee CASCADE;
CREATE TABLE employee (
    id bigserial NOT NULL,
	firstName varchar(250),
    middleName varchar(250),
	lastName varchar(250),
    contact varchar(250),
    accountId bigint,
	position varchar(250),
	streetNumber varchar(250),
    barangay varchar(250),
    city varchar(250),
    CONSTRAINT employee_pkey PRIMARY KEY (id)
);
DROP TABLE if EXISTS account CASCADE;
CREATE TABLE account
(
  id bigserial NOT NULL,
  username character varying(250),
  password character varying(250),
  lvl bigint,
  employeeid bigint,
  CONSTRAINT account_pkey PRIMARY KEY (id)
);

DROP TABLE if EXISTS messages CASCADE;
CREATE TABLE messages (
    id bigserial NOT NULL,
    sender varchar(250),
    receiver bigint NOT NULL,
    message varchar(250),
	CONSTRAINT messages_pkey PRIMARY KEY (id)
);

DROP TABLE if EXISTS actions CASCADE;
CREATE TABLE actions (
    id bigserial NOT NULL,
    viewPoints varchar(250),
	type varchar(250) NOT NULL,
        times bigint NOT NULL,
	employeeId bigint NOT NULL,
	CONSTRAINT actions_pkey PRIMARY KEY (id)
);

DROP TABLE if EXISTS bulletin CASCADE;
CREATE TABLE bulletin (
    id bigserial NOT NULL,
    message character varying(250),
    bulletintype character varying(250),
	bulletinsubject character varying(250),
    employeename character varying(250),
	CONSTRAINT bulletin_pkey PRIMARY KEY (id)
);

INSERT INTO employee VALUES (1, 'Manager','Manager','Manager', '09261127796',1,'Manager', 'StreetNumber' , 'Barangay', 'City');
INSERT INTO account VALUES (1, 'manager', '123', 2 , 1);
INSERT INTO bulletin VALUES (1, 'test this bulletin', 'announcement', 'this subject' , 'Name Here');
INSERT INTO bulletin VALUES (2, 'test this update', 'update', 'this subject', 'Name Here');
INSERT INTO bulletin VALUES (3, 'test this news', 'news', 'this subject', 'Name Here');
INSERT INTO bulletin VALUES (4, 'test this news 2', 'news', 'this subject', 'Name Here');