create table if not exists device
(
    id   bigint not null
        primary key,
    name varchar(255)
);

alter table device
    owner to mjs;

create table if not exists variable
(
    id          bigint not null
        primary key,
    key         integer,
    unit        varchar(255),
    unique_name  varchar(255)
        constraint uk_ftn21ehrtcynr284x718cmrl2
            unique,
    substance   varchar(255)
);

alter table variable
    owner to mjs;

create table if not exists device_variable
(
    id          bigint not null
        primary key,
    device_id   bigint
        constraint fkchfsyndssinciq890yxg80ach
            references device,
    variable_id bigint
        constraint fk80dwtu71kohyc6l7o0jfovvt9
            references variable
);

alter table device_variable
    owner to mjs;

create table if not exists measurement
(
    id          bigint not null
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

create table if not exists device_meta_data
(
    id        bigint not null
        primary key,
    key       varchar(255),
    value     varchar(255),
    device_id bigint
        constraint fkg2uphsdrgp27r35n5owltudns
            references device
);

alter table device_meta_data
    owner to mjs;

create table if not exists variable_meta_data
(
    id          bigint not null
        primary key,
    key         varchar(255),
    value       varchar(255),
    variable_id bigint
        constraint fk1bvj5us6ncped18jxwvue8xcr
            references variable
);

alter table variable_meta_data
    owner to mjs;

create sequence hibernate_sequence;

alter sequence hibernate_sequence owner to mjs;

alter sequence hibernate_sequence restart 1200;



INSERT INTO public.device (id, name) VALUES (100, '47');
INSERT INTO public.device (id, name) VALUES (101, '546');
INSERT INTO public.device (id, name) VALUES (102, '111');
INSERT INTO public.device (id, name) VALUES (103, '364');


INSERT INTO public.variable (id, unique_name, key, substance, unit) VALUES (200, 'CO2', 1, 'CO2', 'ppm');
INSERT INTO public.variable (id, unique_name, key, substance, unit) VALUES (201, 'temperature', 2, 'temperature', '??C');
INSERT INTO public.variable (id, unique_name, key, substance, unit) VALUES (202, 'relative humidity', 3, 'relative humidity', '%RH');
INSERT INTO public.variable (id, unique_name, key, substance, unit) VALUES (203, 'PM10', 4, 'PM10', '??g/m3');
INSERT INTO public.variable (id, unique_name, key, substance, unit) VALUES (204, 'PM2.5', 5, 'PM2.5', '??g/m3');



INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (300, 100, 200);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (301, 101, 200);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (302, 102, 200);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (303, 103, 200);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (304, 100, 201);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (305, 101, 201);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (306, 102, 201);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (307, 103, 201);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (308, 100, 202);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (309, 101, 202);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (310, 102, 202);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (311, 103, 202);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (312, 100, 203);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (313, 101, 203);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (314, 102, 203);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (315, 103, 203);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (316, 100, 204);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (317, 101, 204);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (318, 102, 204);
INSERT INTO public.device_variable (id, device_id, variable_id) VALUES (319, 103, 204);



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

