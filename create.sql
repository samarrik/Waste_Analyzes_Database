--Autors: Ivan Samarskyi
--      : Jiri Hunka ( remove_all() function )
--      : https://dbs.fit.cvut.cz/

--Check if there is a REMOVE function and DROP it
DROP FUNCTION IF EXISTS remove_all();

--create a function which DROPs everything
CREATE or replace FUNCTION remove_all() RETURNS void AS $$
DECLARE
    rec RECORD;
    cmd text;
BEGIN
    cmd := '';

    FOR rec IN SELECT
            'DROP SEQUENCE ' || quote_ident(n.nspname) || '.'
                || quote_ident(c.relname) || ' CASCADE;' AS name
        FROM
            pg_catalog.pg_class AS c
        LEFT JOIN
            pg_catalog.pg_namespace AS n
        ON
            n.oid = c.relnamespace
        WHERE
            relkind = 'S' AND
            n.nspname NOT IN ('pg_catalog', 'pg_toast') AND
            pg_catalog.pg_table_is_visible(c.oid)
    LOOP
        cmd := cmd || rec.name;
    END LOOP;

    FOR rec IN SELECT
            'DROP TABLE ' || quote_ident(n.nspname) || '.'
                || quote_ident(c.relname) || ' CASCADE;' AS name
        FROM
            pg_catalog.pg_class AS c
        LEFT JOIN
            pg_catalog.pg_namespace AS n
        ON
            n.oid = c.relnamespace WHERE relkind = 'r' AND
            n.nspname NOT IN ('pg_catalog', 'pg_toast') AND
            pg_catalog.pg_table_is_visible(c.oid)
    LOOP
        cmd := cmd || rec.name;
    END LOOP;

    EXECUTE cmd;
    RETURN;
END;
$$ LANGUAGE plpgsql;

--call our function
select remove_all();

CREATE TABLE address (
    id_address SERIAL NOT NULL,
    city VARCHAR(256) NOT NULL,
    country VARCHAR(256) NOT NULL,
    street VARCHAR(256) NOT NULL,
    street_num INTEGER NOT NULL
);
ALTER TABLE address ADD CONSTRAINT pk_address PRIMARY KEY (id_address);

CREATE TABLE agreement (
    id_agreement SERIAL NOT NULL,
    id_person INTEGER NOT NULL,
    id_sorting_cp INTEGER NOT NULL,
    date_start DATE NOT NULL,
    --logic constraint date of the start should be earlier than the date of the end
    date_till DATE CHECK (date_start < date_till)
);
ALTER TABLE agreement ADD CONSTRAINT pk_agreement PRIMARY KEY (id_agreement);

CREATE TABLE analysis (
    id_analysis SERIAL NOT NULL,
    id_company INTEGER NOT NULL,
    date DATE NOT NULL,
    note VARCHAR(1000)
);
ALTER TABLE analysis ADD CONSTRAINT pk_analysis PRIMARY KEY (id_analysis);
ALTER TABLE analysis ADD CONSTRAINT uc_analysis_date UNIQUE (date);

CREATE TABLE client_company (
    id_company SERIAL NOT NULL,
    id_address INTEGER NOT NULL,
    name VARCHAR(256),
    field_of_activity VARCHAR(500)
);
ALTER TABLE client_company ADD CONSTRAINT pk_client_company PRIMARY KEY (id_company);

CREATE TABLE employee (
    id_agreement INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    birthday DATE,
    email VARCHAR(256),
    phone VARCHAR(11)
);
ALTER TABLE employee ADD CONSTRAINT pk_employee PRIMARY KEY (id_agreement);

CREATE TABLE participation (
    id_analysis INTEGER NOT NULL,
    id_agreement INTEGER NOT NULL
);
ALTER TABLE participation ADD CONSTRAINT pk_participation PRIMARY KEY (id_analysis, id_agreement);

CREATE TABLE person (
    id_person SERIAL NOT NULL,
    name VARCHAR(256) NOT NULL,
    surname VARCHAR(256) NOT NULL,
    age INTEGER CHECK (age < 150 AND age > 0),
    gender VARCHAR(256)
);
ALTER TABLE person ADD CONSTRAINT pk_person PRIMARY KEY (id_person);

CREATE TABLE record (
    id_record SERIAL NOT NULL,
    id_analysis INTEGER NOT NULL,
    id_agreement INTEGER NOT NULL,
    type VARCHAR(256) NOT NULL,
    weight INTEGER NOT NULL CHECK (weight > 0),
    tax_czk INTEGER CHECK (tax_czk > 0)
);
ALTER TABLE record ADD CONSTRAINT pk_record PRIMARY KEY (id_record);

CREATE TABLE sorting_company (
    id_sorting_cp SERIAL NOT NULL,
    name VARCHAR(256) NOT NULL
);
ALTER TABLE sorting_company ADD CONSTRAINT pk_sorting_company PRIMARY KEY (id_sorting_cp);

CREATE TABLE volunteer (
    id_agreement INTEGER NOT NULL,
    purpose VARCHAR(1000) NOT NULL
);
ALTER TABLE volunteer ADD CONSTRAINT pk_volunteer PRIMARY KEY (id_agreement);

ALTER TABLE agreement ADD CONSTRAINT fk_agreement_person FOREIGN KEY (id_person) REFERENCES person (id_person) ON DELETE CASCADE;
ALTER TABLE agreement ADD CONSTRAINT fk_agreement_sorting_company FOREIGN KEY (id_sorting_cp) REFERENCES sorting_company (id_sorting_cp) ON DELETE CASCADE;
ALTER TABLE volunteer ADD CONSTRAINT fk_volunteer_agreement FOREIGN KEY (id_agreement) REFERENCES agreement (id_agreement) ON DELETE CASCADE;
ALTER TABLE employee ADD CONSTRAINT fk_employee_agreement FOREIGN KEY (id_agreement) REFERENCES agreement (id_agreement) ON DELETE CASCADE;
ALTER TABLE analysis ADD CONSTRAINT fk_analysis_client_company FOREIGN KEY (id_company) REFERENCES client_company (id_company) ON DELETE CASCADE;
ALTER TABLE client_company ADD CONSTRAINT fk_client_company_address FOREIGN KEY (id_address) REFERENCES address (id_address) ON DELETE CASCADE;
ALTER TABLE participation ADD CONSTRAINT fk_participation_analysis FOREIGN KEY (id_analysis) REFERENCES analysis (id_analysis) ON DELETE CASCADE;
ALTER TABLE participation ADD CONSTRAINT fk_participation_agreement FOREIGN KEY (id_agreement) REFERENCES agreement (id_agreement) ON DELETE CASCADE;
ALTER TABLE record ADD CONSTRAINT fk_record_analysis FOREIGN KEY (id_analysis) REFERENCES analysis (id_analysis) ON DELETE CASCADE;
ALTER TABLE record ADD CONSTRAINT fk_record_employee FOREIGN KEY (id_agreement) REFERENCES employee (id_agreement) ON DELETE CASCADE;
