create table if not exists location
(
    id   bigint not null
        constraint location_pkey
            primary key,
    name varchar(255)
);

alter table location
    owner to mjs;

INSERT INTO public.location (id, name) VALUES (1, 'amersfoort');
INSERT INTO public.location (id, name) VALUES (2, 'utrecht');



create table if not exists device_type
(
    id   bigint not null
        constraint device_type_pkey
            primary key,
    name varchar(255)
);

alter table device_type
    owner to mjs;

INSERT INTO public.device_type (id, name) VALUES (10, 'MJS001');
INSERT INTO public.device_type (id, name) VALUES (11, 'MJS002');


create table if not exists device
(
    id             bigint not null
        constraint device_pkey
            primary key,
    name           varchar(255),
    device_type_id bigint
        constraint fko9oabhnk3f79y77ifapu6yp7t
            references device_type,
    location_id    bigint
        constraint fkpi1ebkqu0bc3f3yh500kyf1m8
            references location
);

alter table device
    owner to mjs;

INSERT INTO public.device (id, name, device_type_id, location_id) VALUES (100, 'de war', 10, 1);
INSERT INTO public.device (id, name, device_type_id, location_id) VALUES (101, 'zeelt', 11, 1);
INSERT INTO public.device (id, name, device_type_id, location_id) VALUES (102, 'catherine', 10, 2);
INSERT INTO public.device (id, name, device_type_id, location_id) VALUES (103, 'croeselaan', 11, 2);


create table if not exists variable
(
    id   bigint not null
        constraint variable_pkey
            primary key,
    name varchar(255),
    unit varchar(255)
);

alter table variable
    owner to mjs;

INSERT INTO public.variable (id, name, unit) VALUES (200, 'CO2', 'ppm');
INSERT INTO public.variable (id, name, unit) VALUES (201, 'temperatuur', '°C');
INSERT INTO public.variable (id, name, unit) VALUES (202, 'luchtvochtigheid', '%RH');


create table if not exists measurement
(
    id          bigint not null
        constraint measurement_pkey
            primary key,
    date_time   timestamp,
    value       varchar(255),
    device_id   bigint
        constraint fkfk341lu27m89eohc71wnwf8bt
            references device,
    variable_id bigint
        constraint fkheatxji7vvs2bgcur4jrw9t0a
            references variable
);

alter table measurement
    owner to mjs;

INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1000, '2021-11-29 19:15:21.241836', '10', 103, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1001, '2021-11-29 19:15:21.262172', '410', 102, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1002, '2021-11-29 19:15:21.265815', '61', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1003, '2021-11-29 19:15:21.269227', '54', 103, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1004, '2021-11-29 19:15:21.272576', '82', 101, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1005, '2021-11-29 19:15:21.276401', '924', 101, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1006, '2021-11-29 19:15:21.279830', '33', 103, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1007, '2021-11-29 19:15:21.283103', '18', 100, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1008, '2021-11-29 19:15:21.286189', '22', 103, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1009, '2021-11-29 19:15:21.289381', '407', 102, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1010, '2021-11-29 19:15:21.292513', '20', 103, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1011, '2021-11-29 19:15:21.295693', '553', 102, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1012, '2021-11-29 19:15:21.298840', '937', 103, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1013, '2021-11-29 19:15:21.301946', '24', 101, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1014, '2021-11-29 19:15:21.305415', '40', 100, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1015, '2021-11-29 19:15:21.308912', '40', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1016, '2021-11-29 19:15:21.312682', '47', 100, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1017, '2021-11-29 19:15:21.316122', '25', 101, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1018, '2021-11-29 19:15:21.319240', '25', 103, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1019, '2021-11-29 19:15:21.322351', '509', 103, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1020, '2021-11-29 19:16:18.052821', '41', 100, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1021, '2021-11-29 19:16:18.074427', '73', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1022, '2021-11-29 19:16:18.078232', '71', 101, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1023, '2021-11-29 19:16:18.081926', '533', 103, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1024, '2021-11-29 19:16:18.085512', '86', 103, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1025, '2021-11-29 19:16:18.089392', '20', 102, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1026, '2021-11-29 19:16:18.093181', '87', 101, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1027, '2021-11-29 19:16:18.096557', '24', 102, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1028, '2021-11-29 19:16:18.099850', '815', 103, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1029, '2021-11-29 19:16:18.103948', '23', 101, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1030, '2021-11-29 19:16:18.107731', '84', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1031, '2021-11-29 19:16:18.111658', '58', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1032, '2021-11-29 19:16:18.115173', '42', 103, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1033, '2021-11-29 19:16:18.118459', '612', 101, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1034, '2021-11-29 19:16:18.121935', '667', 100, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1035, '2021-11-29 19:16:18.125425', '74', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1036, '2021-11-29 19:16:18.129469', '10', 102, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1037, '2021-11-29 19:16:18.133105', '16', 103, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1038, '2021-11-29 19:16:18.137119', '86', 103, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1039, '2021-11-29 19:16:18.142024', '54', 101, 202);


create sequence if not exists hibernate_sequence;
alter sequence hibernate_sequence restart 1000;
