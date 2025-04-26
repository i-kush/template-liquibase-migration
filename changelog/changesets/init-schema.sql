create extension if not exists "uuid-ossp";

create table if not exists test (
    id uuid not null,
    constraint pk_test_id primary key (id)
);