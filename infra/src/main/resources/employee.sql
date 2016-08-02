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

DROP TABLE if EXISTS messages CASCADE;
CREATE TABLE messages (
    id bigserial NOT NULL,
    sender bigint,
    receiver bigint NOT NULL,
    message varchar(250),
	seen boolean,
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