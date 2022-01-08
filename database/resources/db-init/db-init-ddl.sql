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
    reuse_name varchar(255)
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

