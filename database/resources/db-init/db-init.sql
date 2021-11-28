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
INSERT INTO public.location (id, name) VALUES (2, 'bergen');



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
INSERT INTO public.variable (id, name, unit) VALUES (201, 'temperatuur', 'C');
INSERT INTO public.variable (id, name, unit) VALUES (202, 'luchtvochtigheid', '%');


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
INSERT INTO public.device (id, name, device_type_id, location_id) VALUES (101, 'zeelt', 10, 1);
INSERT INTO public.device (id, name, device_type_id, location_id) VALUES (101, 'zeelt', 11, 2);
