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

INSERT INTO public.device_type (id, name) VALUES (10, 'MJS_DT-001');
INSERT INTO public.device_type (id, name) VALUES (11, 'MJS_DT-002');


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

INSERT INTO public.device (id, name, device_type_id, location_id) VALUES (100, '47', 10, 1);
INSERT INTO public.device (id, name, device_type_id, location_id) VALUES (101, '546', 11, 1);
INSERT INTO public.device (id, name, device_type_id, location_id) VALUES (102, '111', 10, 2);
INSERT INTO public.device (id, name, device_type_id, location_id) VALUES (103, '364', 11, 2);


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
INSERT INTO public.variable (id, name, unit) VALUES (201, 'temperature', '°C');
INSERT INTO public.variable (id, name, unit) VALUES (202, 'relative humidity', '%RH');
INSERT INTO public.variable (id, name, unit) VALUES (203, 'PM10', 'µg/m3');
INSERT INTO public.variable (id, name, unit) VALUES (204, 'PM2.5', 'µg/m3');


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

INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1000, '2021-12-12 11:01:51.986065', '885', 100, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1001, '2021-12-12 11:01:51.986065', '16', 100, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1002, '2021-12-12 11:01:51.986065', '58', 100, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1003, '2021-12-12 11:01:51.986065', '32', 100, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1004, '2021-12-12 11:01:51.986065', '12', 100, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1005, '2021-12-12 11:01:51.986065', '928', 101, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1006, '2021-12-12 11:01:51.986065', '13', 101, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1007, '2021-12-12 11:01:51.986065', '73', 101, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1008, '2021-12-12 11:01:51.986065', '19', 101, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1009, '2021-12-12 11:01:51.986065', '10', 101, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1010, '2021-12-12 11:01:51.986065', '856', 102, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1011, '2021-12-12 11:01:51.986065', '14', 102, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1012, '2021-12-12 11:01:51.986065', '68', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1013, '2021-12-12 11:01:51.986065', '36', 102, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1014, '2021-12-12 11:01:51.986065', '14', 102, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1015, '2021-12-12 11:01:51.986065', '737', 103, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1016, '2021-12-12 11:01:51.986065', '13', 103, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1017, '2021-12-12 11:01:51.986065', '56', 103, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1018, '2021-12-12 11:01:51.986065', '16', 103, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1019, '2021-12-12 11:01:51.986065', '16', 103, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1020, '2021-12-12 11:16:58.986065', '851', 100, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1021, '2021-12-12 11:16:58.986065', '20', 100, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1022, '2021-12-12 11:16:58.986065', '44', 100, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1023, '2021-12-12 11:16:58.986065', '37', 100, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1024, '2021-12-12 11:16:58.986065', '16', 100, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1025, '2021-12-12 11:16:58.986065', '916', 101, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1026, '2021-12-12 11:16:58.986065', '19', 101, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1027, '2021-12-12 11:16:58.986065', '66', 101, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1028, '2021-12-12 11:16:58.986065', '39', 101, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1029, '2021-12-12 11:16:58.986065', '17', 101, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1030, '2021-12-12 11:16:58.986065', '496', 102, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1031, '2021-12-12 11:16:58.986065', '24', 102, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1032, '2021-12-12 11:16:58.986065', '64', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1033, '2021-12-12 11:16:58.986065', '39', 102, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1034, '2021-12-12 11:16:58.986065', '12', 102, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1035, '2021-12-12 11:16:58.986065', '435', 103, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1036, '2021-12-12 11:16:58.986065', '25', 103, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1037, '2021-12-12 11:16:58.986065', '36', 103, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1038, '2021-12-12 11:16:58.986065', '28', 103, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1039, '2021-12-12 11:16:58.986065', '10', 103, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1040, '2021-12-12 11:32:05.986065', '448', 100, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1041, '2021-12-12 11:32:05.986065', '19', 100, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1042, '2021-12-12 11:32:05.986065', '34', 100, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1043, '2021-12-12 11:32:05.986065', '15', 100, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1044, '2021-12-12 11:32:05.986065', '9', 100, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1045, '2021-12-12 11:32:05.986065', '639', 101, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1046, '2021-12-12 11:32:05.986065', '13', 101, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1047, '2021-12-12 11:32:05.986065', '53', 101, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1048, '2021-12-12 11:32:05.986065', '16', 101, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1049, '2021-12-12 11:32:05.986065', '7', 101, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1050, '2021-12-12 11:32:05.986065', '922', 102, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1051, '2021-12-12 11:32:05.986065', '24', 102, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1052, '2021-12-12 11:32:05.986065', '45', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1053, '2021-12-12 11:32:05.986065', '14', 102, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1054, '2021-12-12 11:32:05.986065', '11', 102, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1055, '2021-12-12 11:32:05.986065', '501', 103, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1056, '2021-12-12 11:32:05.986065', '21', 103, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1057, '2021-12-12 11:32:05.986065', '32', 103, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1058, '2021-12-12 11:32:05.986065', '39', 103, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1059, '2021-12-12 11:32:05.986065', '12', 103, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1060, '2021-12-12 11:47:12.986065', '579', 100, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1061, '2021-12-12 11:47:12.986065', '24', 100, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1062, '2021-12-12 11:47:12.986065', '38', 100, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1063, '2021-12-12 11:47:12.986065', '22', 100, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1064, '2021-12-12 11:47:12.986065', '8', 100, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1065, '2021-12-12 11:47:12.986065', '682', 101, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1066, '2021-12-12 11:47:12.986065', '22', 101, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1067, '2021-12-12 11:47:12.986065', '37', 101, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1068, '2021-12-12 11:47:12.986065', '32', 101, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1069, '2021-12-12 11:47:12.986065', '14', 101, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1070, '2021-12-12 11:47:12.986065', '861', 102, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1071, '2021-12-12 11:47:12.986065', '22', 102, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1072, '2021-12-12 11:47:12.986065', '65', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1073, '2021-12-12 11:47:12.986065', '38', 102, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1074, '2021-12-12 11:47:12.986065', '15', 102, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1075, '2021-12-12 11:47:12.986065', '504', 103, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1076, '2021-12-12 11:47:12.986065', '25', 103, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1077, '2021-12-12 11:47:12.986065', '52', 103, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1078, '2021-12-12 11:47:12.986065', '31', 103, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1079, '2021-12-12 11:47:12.986065', '18', 103, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1080, '2021-12-12 12:02:19.986065', '494', 100, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1081, '2021-12-12 12:02:19.986065', '13', 100, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1082, '2021-12-12 12:02:19.986065', '48', 100, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1083, '2021-12-12 12:02:19.986065', '28', 100, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1084, '2021-12-12 12:02:19.986065', '14', 100, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1085, '2021-12-12 12:02:19.986065', '778', 101, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1086, '2021-12-12 12:02:19.986065', '17', 101, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1087, '2021-12-12 12:02:19.986065', '73', 101, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1088, '2021-12-12 12:02:19.986065', '33', 101, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1089, '2021-12-12 12:02:19.986065', '7', 101, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1090, '2021-12-12 12:02:19.986065', '568', 102, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1091, '2021-12-12 12:02:19.986065', '15', 102, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1092, '2021-12-12 12:02:19.986065', '81', 102, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1093, '2021-12-12 12:02:19.986065', '20', 102, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1094, '2021-12-12 12:02:19.986065', '13', 102, 204);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1095, '2021-12-12 12:02:19.986065', '401', 103, 200);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1096, '2021-12-12 12:02:19.986065', '18', 103, 201);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1097, '2021-12-12 12:02:19.986065', '56', 103, 202);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1098, '2021-12-12 12:02:19.986065', '28', 103, 203);
INSERT INTO public.measurement (id, date_time, value, device_id, variable_id) VALUES (1099, '2021-12-12 12:02:19.986065', '8', 103, 204);


create sequence if not exists hibernate_sequence;
alter sequence hibernate_sequence restart 1000;

