--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: rus; Type: COLLATION; Schema: public; Owner: nkagent
--

CREATE COLLATION rus (lc_collate = 'ru_RU.UTF-8', lc_ctype = 'ru_RU.UTF-8');


ALTER COLLATION public.rus OWNER TO nkagent;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: access; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE access (
    code character varying(14),
    permit_id integer,
    role_id integer
);


ALTER TABLE public.access OWNER TO nkagent;

--
-- Name: agency; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE agency (
    id_agency bigint NOT NULL,
    note text COLLATE public.rus,
    city_id integer,
    node_id bigint
);


ALTER TABLE public.agency OWNER TO nkagent;

--
-- Name: agency_id_agency_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE agency_id_agency_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agency_id_agency_seq OWNER TO nkagent;

--
-- Name: agency_id_agency_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE agency_id_agency_seq OWNED BY agency.id_agency;


--
-- Name: apartment; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE apartment (
    id_apartment bigint NOT NULL,
    type bigint,
    agent integer,
    street integer,
    house text,
    liter text,
    storey smallint,
    numstorey smallint,
    price integer,
    area1 double precision,
    area2 double precision,
    area3 double precision,
    op smallint,
    project integer,
    toilet integer,
    balcony smallint,
    note text,
    node_id bigint
);


ALTER TABLE public.apartment OWNER TO nkagent;

--
-- Name: apartment_id_apartment_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE apartment_id_apartment_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apartment_id_apartment_seq OWNER TO nkagent;

--
-- Name: apartment_id_apartment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE apartment_id_apartment_seq OWNED BY apartment.id_apartment;


--
-- Name: article; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE article (
    id_article bigint NOT NULL,
    description character varying(2000) COLLATE public.rus,
    content text COLLATE public.rus,
    priority bigint,
    node_id bigint
);


ALTER TABLE public.article OWNER TO nkagent;

--
-- Name: article_id_article_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE article_id_article_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_id_article_seq OWNER TO nkagent;

--
-- Name: article_id_article_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE article_id_article_seq OWNED BY article.id_article;


--
-- Name: article_reject; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE article_reject (
    node_id bigint,
    message text,
    date_message bigint
);


ALTER TABLE public.article_reject OWNER TO nkagent;

--
-- Name: blockandsection; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE blockandsection (
    id_blockandsection integer NOT NULL,
    block_id bigint,
    section_id bigint
);


ALTER TABLE public.blockandsection OWNER TO nkagent;

--
-- Name: blockandsection_id_blockandsection_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE blockandsection_id_blockandsection_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blockandsection_id_blockandsection_seq OWNER TO nkagent;

--
-- Name: blockandsection_id_blockandsection_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE blockandsection_id_blockandsection_seq OWNED BY blockandsection.id_blockandsection;


--
-- Name: category_land; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE category_land (
    id_category_land integer NOT NULL,
    title text,
    priority integer
);


ALTER TABLE public.category_land OWNER TO nkagent;

--
-- Name: category_land_id_category_land_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE category_land_id_category_land_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_land_id_category_land_seq OWNER TO nkagent;

--
-- Name: category_land_id_category_land_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE category_land_id_category_land_seq OWNED BY category_land.id_category_land;


--
-- Name: city; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE city (
    id_city integer NOT NULL,
    title text COLLATE public.rus,
    alias text,
    region_id integer,
    districts_id integer,
    select_default smallint
);


ALTER TABLE public.city OWNER TO nkagent;

--
-- Name: city_id_city_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE city_id_city_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_city_seq OWNER TO nkagent;

--
-- Name: city_id_city_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE city_id_city_seq OWNED BY city.id_city;


--
-- Name: commercial; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE commercial (
    id_commercial bigint NOT NULL,
    agent integer,
    type bigint,
    street integer,
    price integer,
    area_house double precision,
    note text,
    node_id bigint
);


ALTER TABLE public.commercial OWNER TO nkagent;

--
-- Name: commercial_id_commercial_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE commercial_id_commercial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commercial_id_commercial_seq OWNER TO nkagent;

--
-- Name: commercial_id_commercial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE commercial_id_commercial_seq OWNED BY commercial.id_commercial;


--
-- Name: cottages; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE cottages (
    id_cottages bigint NOT NULL,
    agent integer,
    type bigint,
    street integer,
    storey smallint,
    price integer,
    area_house double precision,
    area_land double precision,
    material smallint,
    note text,
    node_id bigint,
    category_land smallint,
    kdn text
);


ALTER TABLE public.cottages OWNER TO nkagent;

--
-- Name: cottages_id_cottages_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE cottages_id_cottages_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cottages_id_cottages_seq OWNER TO nkagent;

--
-- Name: cottages_id_cottages_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE cottages_id_cottages_seq OWNED BY cottages.id_cottages;


--
-- Name: country; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE country (
    id integer NOT NULL,
    title text COLLATE public.rus,
    alias text,
    metropolis integer
);


ALTER TABLE public.country OWNER TO nkagent;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO nkagent;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE country_id_seq OWNED BY country.id;


--
-- Name: district; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE district (
    id_district integer NOT NULL,
    district text COLLATE public.rus,
    city_id integer
);


ALTER TABLE public.district OWNER TO nkagent;

--
-- Name: district_id_district_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE district_id_district_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.district_id_district_seq OWNER TO nkagent;

--
-- Name: district_id_district_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE district_id_district_seq OWNED BY district.id_district;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE districts (
    id_districts integer NOT NULL,
    districts text COLLATE public.rus,
    region_id integer
);


ALTER TABLE public.districts OWNER TO nkagent;

--
-- Name: districts_id_districts_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE districts_id_districts_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.districts_id_districts_seq OWNER TO nkagent;

--
-- Name: districts_id_districts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE districts_id_districts_seq OWNED BY districts.id_districts;


--
-- Name: labelandtemplate; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE labelandtemplate (
    id_labelandtemplate integer NOT NULL,
    node_id bigint,
    permit_id integer
);


ALTER TABLE public.labelandtemplate OWNER TO nkagent;

--
-- Name: labelandtemplate_id_labelandtemplate_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE labelandtemplate_id_labelandtemplate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labelandtemplate_id_labelandtemplate_seq OWNER TO nkagent;

--
-- Name: labelandtemplate_id_labelandtemplate_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE labelandtemplate_id_labelandtemplate_seq OWNED BY labelandtemplate.id_labelandtemplate;


--
-- Name: layerandblock; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE layerandblock (
    id_layerandblock integer NOT NULL,
    layer_id bigint,
    block_id bigint
);


ALTER TABLE public.layerandblock OWNER TO nkagent;

--
-- Name: layerandblock_id_layerandblock_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE layerandblock_id_layerandblock_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.layerandblock_id_layerandblock_seq OWNER TO nkagent;

--
-- Name: layerandblock_id_layerandblock_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE layerandblock_id_layerandblock_seq OWNED BY layerandblock.id_layerandblock;


--
-- Name: login; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE login (
    email text,
    init_date bigint,
    num_input smallint
);


ALTER TABLE public.login OWNER TO nkagent;

--
-- Name: material; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE material (
    id_material integer NOT NULL,
    title text,
    priority integer
);


ALTER TABLE public.material OWNER TO nkagent;

--
-- Name: material_id_material_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE material_id_material_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.material_id_material_seq OWNER TO nkagent;

--
-- Name: material_id_material_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE material_id_material_seq OWNED BY material.id_material;


--
-- Name: metro; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE metro (
    id_metro integer NOT NULL,
    metro text COLLATE public.rus,
    city_id integer
);


ALTER TABLE public.metro OWNER TO nkagent;

--
-- Name: metro_id_metro_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE metro_id_metro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metro_id_metro_seq OWNER TO nkagent;

--
-- Name: metro_id_metro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE metro_id_metro_seq OWNED BY metro.id_metro;


--
-- Name: node; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE node (
    id bigint NOT NULL,
    title character varying(1000) COLLATE public.rus,
    alias character varying(1000),
    date_create bigint,
    date_edit bigint,
    author integer,
    author_edit integer,
    status smallint,
    main smallint,
    template character varying(60),
    section bigint,
    line bigint
);


ALTER TABLE public.node OWNER TO nkagent;

--
-- Name: node_id_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.node_id_seq OWNER TO nkagent;

--
-- Name: node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE node_id_seq OWNED BY node.id;


--
-- Name: parser; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE parser (
    id integer NOT NULL,
    street text,
    house text,
    liter text,
    storey text,
    project text,
    price text,
    area text,
    toilet text,
    balcony text,
    op text,
    note text,
    tel text,
    section text
);


ALTER TABLE public.parser OWNER TO nkagent;

--
-- Name: parser_commercial; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE parser_commercial (
    id integer NOT NULL,
    note text,
    price text,
    tel text,
    section text
);


ALTER TABLE public.parser_commercial OWNER TO nkagent;

--
-- Name: parser_commercial_id_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE parser_commercial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parser_commercial_id_seq OWNER TO nkagent;

--
-- Name: parser_commercial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE parser_commercial_id_seq OWNED BY parser_commercial.id;


--
-- Name: parser_cottages; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE parser_cottages (
    id integer NOT NULL,
    note text,
    price text,
    tel text,
    section text
);


ALTER TABLE public.parser_cottages OWNER TO nkagent;

--
-- Name: parser_cottages_id_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE parser_cottages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parser_cottages_id_seq OWNER TO nkagent;

--
-- Name: parser_cottages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE parser_cottages_id_seq OWNED BY parser_cottages.id;


--
-- Name: parser_id_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE parser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parser_id_seq OWNER TO nkagent;

--
-- Name: parser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE parser_id_seq OWNED BY parser.id;


--
-- Name: permit; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE permit (
    id_permit integer NOT NULL,
    name character varying(200),
    priority integer,
    temp character varying(200),
    temp_sort smallint DEFAULT 0,
    temp_section_sort smallint DEFAULT 0,
    url_temp character varying(200),
    browse integer DEFAULT 0,
    make integer DEFAULT 0,
    update integer DEFAULT 0,
    delete integer DEFAULT 0,
    publication integer DEFAULT 0
);


ALTER TABLE public.permit OWNER TO nkagent;

--
-- Name: permit_id_permit_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE permit_id_permit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permit_id_permit_seq OWNER TO nkagent;

--
-- Name: permit_id_permit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE permit_id_permit_seq OWNED BY permit.id_permit;


--
-- Name: project; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE project (
    id_project integer NOT NULL,
    title text,
    priority integer
);


ALTER TABLE public.project OWNER TO nkagent;

--
-- Name: project_id_project_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE project_id_project_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_project_seq OWNER TO nkagent;

--
-- Name: project_id_project_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE project_id_project_seq OWNED BY project.id_project;


--
-- Name: region; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE region (
    id_region integer NOT NULL,
    title text COLLATE public.rus,
    alias text,
    regional_city integer,
    country_id integer
);


ALTER TABLE public.region OWNER TO nkagent;

--
-- Name: region_id_region_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE region_id_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_region_seq OWNER TO nkagent;

--
-- Name: region_id_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE region_id_region_seq OWNED BY region.id_region;


--
-- Name: role; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE role (
    id_role integer NOT NULL,
    name_role character varying(60),
    users smallint,
    payment_price smallint
);


ALTER TABLE public.role OWNER TO nkagent;

--
-- Name: role_id_role_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE role_id_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_role_seq OWNER TO nkagent;

--
-- Name: role_id_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE role_id_role_seq OWNED BY role.id_role;


--
-- Name: sectionandtemplate; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE sectionandtemplate (
    id_sectionandtemplate integer NOT NULL,
    section_id bigint,
    template_name text,
    one_page smallint,
    id_one_page bigint
);


ALTER TABLE public.sectionandtemplate OWNER TO nkagent;

--
-- Name: sectionandtemplate_id_sectionandtemplate_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE sectionandtemplate_id_sectionandtemplate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sectionandtemplate_id_sectionandtemplate_seq OWNER TO nkagent;

--
-- Name: sectionandtemplate_id_sectionandtemplate_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE sectionandtemplate_id_sectionandtemplate_seq OWNED BY sectionandtemplate.id_sectionandtemplate;


--
-- Name: session; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO nkagent;

--
-- Name: sql; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE sql (
    id_sql integer NOT NULL,
    command character varying(30),
    error character varying(200),
    query text,
    query_lower text,
    date bigint,
    notebook smallint,
    tags character varying(60),
    description character varying(1000) COLLATE public.rus,
    priority integer
);


ALTER TABLE public.sql OWNER TO nkagent;

--
-- Name: sql_id_sql_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE sql_id_sql_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_id_sql_seq OWNER TO nkagent;

--
-- Name: sql_id_sql_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE sql_id_sql_seq OWNED BY sql.id_sql;


--
-- Name: sqltable; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE sqltable (
    str text,
    query text
);


ALTER TABLE public.sqltable OWNER TO nkagent;

--
-- Name: street; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE street (
    id_street integer NOT NULL,
    street text COLLATE public.rus,
    city_id integer
);


ALTER TABLE public.street OWNER TO nkagent;

--
-- Name: street_id_street_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE street_id_street_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.street_id_street_seq OWNER TO nkagent;

--
-- Name: street_id_street_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE street_id_street_seq OWNED BY street.id_street;


--
-- Name: temporarily_users; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE temporarily_users (
    email text,
    passw text,
    now_date bigint,
    url_hash text
);


ALTER TABLE public.temporarily_users OWNER TO nkagent;

--
-- Name: temporarily_users_userdata; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE temporarily_users_userdata (
    email text,
    now_date bigint,
    url_hash text,
    id_user integer,
    fio text,
    tel text,
    agency integer,
    note text
);


ALTER TABLE public.temporarily_users_userdata OWNER TO nkagent;

--
-- Name: toilet; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE toilet (
    id_toilet integer NOT NULL,
    title text,
    priority integer
);


ALTER TABLE public.toilet OWNER TO nkagent;

--
-- Name: toilet_id_toilet_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE toilet_id_toilet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.toilet_id_toilet_seq OWNER TO nkagent;

--
-- Name: toilet_id_toilet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE toilet_id_toilet_seq OWNED BY toilet.id_toilet;


--
-- Name: userdata; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE userdata (
    id_userdata integer NOT NULL,
    fio text COLLATE public.rus,
    tel text,
    agency integer,
    user_id integer,
    note text,
    moderator bigint,
    code_price text DEFAULT '111111111111111'::text,
    date_start bigint,
    date_entry bigint,
    date_final bigint,
    date_payment_price bigint,
    code_price_cottages text DEFAULT '11111111111'::text,
    code_price_commercial text DEFAULT '11111111'::text
);


ALTER TABLE public.userdata OWNER TO nkagent;

--
-- Name: userdata_id_userdata_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE userdata_id_userdata_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userdata_id_userdata_seq OWNER TO nkagent;

--
-- Name: userdata_id_userdata_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE userdata_id_userdata_seq OWNED BY userdata.id_userdata;


--
-- Name: users; Type: TABLE; Schema: public; Owner: nkagent; Tablespace: 
--

CREATE TABLE users (
    id_user integer NOT NULL,
    date_registration bigint,
    role_id integer,
    email text,
    pass text,
    hash_url text,
    date_hash_url bigint,
    default_city integer,
    default_districts integer
);


ALTER TABLE public.users OWNER TO nkagent;

--
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: nkagent
--

CREATE SEQUENCE users_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_user_seq OWNER TO nkagent;

--
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nkagent
--

ALTER SEQUENCE users_id_user_seq OWNED BY users.id_user;


--
-- Name: id_agency; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY agency ALTER COLUMN id_agency SET DEFAULT nextval('agency_id_agency_seq'::regclass);


--
-- Name: id_apartment; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY apartment ALTER COLUMN id_apartment SET DEFAULT nextval('apartment_id_apartment_seq'::regclass);


--
-- Name: id_article; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY article ALTER COLUMN id_article SET DEFAULT nextval('article_id_article_seq'::regclass);


--
-- Name: id_blockandsection; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY blockandsection ALTER COLUMN id_blockandsection SET DEFAULT nextval('blockandsection_id_blockandsection_seq'::regclass);


--
-- Name: id_category_land; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY category_land ALTER COLUMN id_category_land SET DEFAULT nextval('category_land_id_category_land_seq'::regclass);


--
-- Name: id_city; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY city ALTER COLUMN id_city SET DEFAULT nextval('city_id_city_seq'::regclass);


--
-- Name: id_commercial; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY commercial ALTER COLUMN id_commercial SET DEFAULT nextval('commercial_id_commercial_seq'::regclass);


--
-- Name: id_cottages; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY cottages ALTER COLUMN id_cottages SET DEFAULT nextval('cottages_id_cottages_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY country ALTER COLUMN id SET DEFAULT nextval('country_id_seq'::regclass);


--
-- Name: id_district; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY district ALTER COLUMN id_district SET DEFAULT nextval('district_id_district_seq'::regclass);


--
-- Name: id_districts; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY districts ALTER COLUMN id_districts SET DEFAULT nextval('districts_id_districts_seq'::regclass);


--
-- Name: id_labelandtemplate; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY labelandtemplate ALTER COLUMN id_labelandtemplate SET DEFAULT nextval('labelandtemplate_id_labelandtemplate_seq'::regclass);


--
-- Name: id_layerandblock; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY layerandblock ALTER COLUMN id_layerandblock SET DEFAULT nextval('layerandblock_id_layerandblock_seq'::regclass);


--
-- Name: id_material; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY material ALTER COLUMN id_material SET DEFAULT nextval('material_id_material_seq'::regclass);


--
-- Name: id_metro; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY metro ALTER COLUMN id_metro SET DEFAULT nextval('metro_id_metro_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY node ALTER COLUMN id SET DEFAULT nextval('node_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY parser ALTER COLUMN id SET DEFAULT nextval('parser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY parser_commercial ALTER COLUMN id SET DEFAULT nextval('parser_commercial_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY parser_cottages ALTER COLUMN id SET DEFAULT nextval('parser_cottages_id_seq'::regclass);


--
-- Name: id_permit; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY permit ALTER COLUMN id_permit SET DEFAULT nextval('permit_id_permit_seq'::regclass);


--
-- Name: id_project; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY project ALTER COLUMN id_project SET DEFAULT nextval('project_id_project_seq'::regclass);


--
-- Name: id_region; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY region ALTER COLUMN id_region SET DEFAULT nextval('region_id_region_seq'::regclass);


--
-- Name: id_role; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY role ALTER COLUMN id_role SET DEFAULT nextval('role_id_role_seq'::regclass);


--
-- Name: id_sectionandtemplate; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY sectionandtemplate ALTER COLUMN id_sectionandtemplate SET DEFAULT nextval('sectionandtemplate_id_sectionandtemplate_seq'::regclass);


--
-- Name: id_sql; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY sql ALTER COLUMN id_sql SET DEFAULT nextval('sql_id_sql_seq'::regclass);


--
-- Name: id_street; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY street ALTER COLUMN id_street SET DEFAULT nextval('street_id_street_seq'::regclass);


--
-- Name: id_toilet; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY toilet ALTER COLUMN id_toilet SET DEFAULT nextval('toilet_id_toilet_seq'::regclass);


--
-- Name: id_userdata; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY userdata ALTER COLUMN id_userdata SET DEFAULT nextval('userdata_id_userdata_seq'::regclass);


--
-- Name: id_user; Type: DEFAULT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY users ALTER COLUMN id_user SET DEFAULT nextval('users_id_user_seq'::regclass);


--
-- Data for Name: access; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY access (code, permit_id, role_id) FROM stdin;
01100	1	5
00000	12	5
00000	16	5
00000	15	5
00000	14	5
00100	23	5
00100	19	5
00100	21	5
01100	1	1
11111	18	1
11111	15	1
11111	20	1
00100	19	1
11111	17	1
00100	21	1
00100	23	1
11111	16	1
11111	22	1
11110	14	1
11111	13	1
11111	12	1
01100	1	2
00000	14	2
00000	13	2
00000	12	2
00000	15	2
00000	16	2
00000	19	2
00000	21	2
00000	23	2
00000	17	2
00000	20	2
00000	22	2
11110	18	2
01110	17	5
01110	20	5
01110	18	5
01110	22	5
00000	13	5
01100	1	6
00000	12	6
00000	13	6
00000	14	6
00000	15	6
00000	16	6
00100	19	6
00100	21	6
00100	23	6
01110	17	6
01110	20	6
01110	22	6
01110	18	6
\.


--
-- Data for Name: agency; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY agency (id_agency, note, city_id, node_id) FROM stdin;
1	\N	116	4
2	\N	116	5
3	<p>ХИМИКОВ 25</p>	116	6
4	<p>ХИМИКОВ-25</p>	116	7
5	<p>ШИННИКОВ 11</p>	116	8
6	<p>СТУДЕНЧЕСКАЯ 35</p>	116	9
7	<p>Cтуденческая 10</p>	116	10
8	<p>МИРА 58</p>	116	11
9	\N	116	12
10	<p>СТРОИТЕЛЕЙ 18</p>	116	13
11	<p>Тукая 1</p>	116	14
12	<p>&nbsp;ХИМИКОВ 60</p>	116	15
13	<p>СТРОИТЕЛЕЙ 18</p>	116	16
14	<p>30 ЛЕТ ПОБЕДЫ 1</p>	116	17
15	<p>Ахтубинская 6а</p>	116	18
16	\N	116	19
17	\N	116	20
19	<p>Студенческая 3</p>	116	22
20	<p>ТУКАЯ 32</p>	116	23
21	<p>ХИМИКОВ 52</p>	116	24
22	<p>ШИННИКОВ 41</p>	116	25
23	<p>СТРОИТЕЛЕЙ 13</p>	116	26
24	<p>Химиков 114</p>	116	27
25	<p>Химиков 10</p>	116	28
26	<p>СКВЕР ЛЕМАЕВА 2</p>	116	29
27	<p>Корабельная 42</p>	116	30
28	<p>СТРОИТЕЛЕЙ 13</p>	116	31
29	<p>МИРА 58</p>	116	32
30	<p>Химиков 114</p>	116	33
31	\N	116	34
32	<p>ХИМИКОВ 57</p>	116	35
33	<p>ШИННИКОВ 31 А</p>	116	36
34	<p>МИРА 50</p>	116	37
36	<p>СТРОИТЕЛЕЙ 18</p>	116	39
37	<p>&nbsp;СТРОИТЕЛЕЙ 18</p>	116	40
38	\N	116	41
39	<p>ТУКАЯ 1</p>	116	42
40	<p>СТРОИТЕЛЕЙ 18</p>	116	43
41	<p>СТРОИТЕЛЕЙ 29 А</p>	116	44
42	<p>СТРОИТЕЛЕЙ 29 А</p>	116	45
43	<p>ХИМИКОВ 114</p>	116	46
44	<p>ХИМИКОВ 15</p>	116	47
45	<p>ЮНОСТИ 15</p>	116	48
46	<p>ШИННИКОВ 1 А</p>	116	49
47	\N	116	50
48	<p>МИРА 61</p>	116	51
49	<p>СТРОИТЕЛЕЙ 20</p>	116	52
50	\N	116	53
51	\N	118	54
52	\N	118	55
53	\N	116	75
18	\N	116	21
35	\N	116	38
56	<p>Юности 15</p>	118	117
57	\N	116	167
58	\N	116	192
60	\N	116	1739
\.


--
-- Name: agency_id_agency_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('agency_id_agency_seq', 60, true);


--
-- Data for Name: apartment; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY apartment (id_apartment, type, agent, street, house, liter, storey, numstorey, price, area1, area2, area3, op, project, toilet, balcony, note, node_id) FROM stdin;
1606	56	475	6	3	\N	7	9	300000	12	\N	\N	\N	13	2	0	окно, потолок, 1 соб	1792
1607	56	271	6	3	\N	9	9	570000	33	\N	\N	\N	13	10	0	хороший ремонт	1793
1609	56	320	6	4	\N	5	9	285000	18	\N	\N	\N	13	10	0	мебель, можно по МСК, ч/пр., торг	1795
1610	56	481	6	4	\N	5	9	290000	18	\N	\N	0	13	12	0	хорошее, ч/п, пустая	1796
1611	56	271	6	6	\N	5	9	315000	13	\N	\N	\N	13	10	0	отличный ремонт, с/у на 2 комнаты	1798
1612	56	475	6	7	\N	5	9	300000	23	\N	\N	\N	13	2	0	обычное	1800
1613	56	475	6	7	\N	5	9	450000	21	\N	\N	\N	13	2	0	обычное	1807
1614	56	320	6	7	\N	7	9	230000	14	\N	\N	\N	13	2	0	обычная, торг	1808
1615	56	474	6	7	\N	7	9	550000	22.1999999999999993	\N	\N	\N	13	10	0	2комн.,хор.,пл.окна,нов.линол.,меб.,ч/п,пустая	1809
1616	56	475	6	7	\N	8	9	540000	26	\N	\N	\N	13	2	1	б.2м\\з, окна,двери,линолеум,пустая	1810
1617	56	287	6	10	\N	2	9	320000	18	\N	\N	0	13	10	0	санузел евро на две семьи, торг	1811
1618	56	475	6	10	\N	3	10	410000	18	\N	\N	\N	13	10	0	с\\у на 2 семьи в кафеле,ванна,дверь входная	1812
1619	56	296	6	10	\N	5	9	340000	17.6999999999999993	\N	\N	0	13	10	0	хороший ремонт, ч/пр, можно по мат кап	1813
1620	56	474	6	10	\N	8	9	350000	13	\N	\N	0	13	10	0	хор.,дв.поменяна,пл.ок.,ч/п,пус.,можно с МСК	1814
1621	56	397	6	7	\N	4	9	300000	22	\N	\N	0	13	2	0	Хор.ремонт.Окна пласт. Ост. Кух.гарнитур.	1815
1622	56	436	7	9	\N	2	9	280000	13	\N	\N	0	13	11	0	Ремонт, все остается!	1816
1623	56	533	7	9	\N	4	9	270000	13	\N	\N	\N	13	2	0	торг, окно пластик, ч/пр, сост.хорошее	1817
1624	56	287	7	9	\N	6	9	320000	18	\N	\N	1	13	2	0	торг	1818
1625	56	275	7	9	\N	7	9	300000	18	\N	\N	0	13	2	0	проведена вода в комнату, пл.окно, нат.потолок	1819
1626	56	436	7	9	\N	7	9	275000	19	\N	\N	0	13	11	0	Обычная, торг!	1820
1627	56	351	7	9	\N	7	9	180000	13	\N	\N	\N	13	2	0	отличный этаж чистая	1821
1628	56	271	7	11	\N	5	5	270000	12.5999999999999996	\N	\N	\N	6	2	0	спальня в 4к квартире	1822
1629	56	282	7	13	\N	4	9	240000	14	\N	\N	\N	13	2	0	ремонт, чистая продажа, пустая, торг	1823
1630	56	269	7	13	\N	7	9	475000	18.6999999999999993	\N	\N	1	13	10	0	отличная, кухон гарнитур, шкаф, диван, холодильник	1824
1631	56	271	7	13	\N	8	9	270000	14	\N	\N	1	13	2	0	хорошая	1825
1632	56	315	7	13	\N	9	9	200000	12	\N	\N	\N	13	2	0	сост.обычное	1826
1633	56	317	7	18	\N	8	9	380000	18	\N	\N	\N	13	2	0	хорошее состояние, сан узел на 2-их	1827
1634	56	523	7	13	\N	3	9	350000	18	\N	\N	0	13	10	0	пласт окно, сан узел на 2 комн, за наличку, торг.	1830
1635	56	484	7	21\\10	\N	2	9	325000	18	\N	\N	0	13	10	0	комната в 2-хкомнатной м/с, 1-но	1832
1636	56	282	7	21\\10	\N	3	9	500000	22	\N	\N	1	13	3	0	отличная, торг	1833
1637	56	271	7	21\\10	\N	3	9	580000	15	\N	\N	\N	13	2	0	пл.окна, гардиан, Ч/ПР	1834
1638	56	391	7	21\\10	\N	7	9	200000	13	\N	\N	\N	13	12	0	пустая, ч.пр.	1835
1639	56	481	7	21\\10	\N	8	9	300000	11	\N	\N	0	13	10	0	среднее, ч/п	1836
1640	56	499	7	21\\10	\N	8	9	350000	17	\N	\N	0	13	10	0	пластик.окно, входн.гард., свой душ	1838
1641	56	486	7	21\\10	\N	9	9	250000	11	\N	\N	0	13	10	0	\N	1840
1642	56	475	13	10	\N	1	9	320000	10	\N	\N	\N	13	3	0	комната в 2-х, состояние отл,сан.узел кафель	1842
1643	56	481	13	14	\N	8	9	450000	12	\N	\N	0	6	10	1	трапеция, спальня в 3-х ,хор., пласт.окно,фил.дверь,м/с	1844
1644	56	469	13	18	\N	2	5	260000	14	\N	\N	\N	13	2	0	Отличное после ремонта	1846
1645	56	272	13	18	\N	2	5	280000	14	\N	\N	0	13	2	0	пласт окно, ч/пр	1847
1646	56	282	13	18	\N	3	5	280000	18	\N	\N	\N	13	2	0	косметический ремонт, чистая продажа, пустая, торг	1850
1647	56	475	13	18	\N	4	5	330000	18	\N	\N	0	13	2	0	обычное	1851
1648	56	424	13	10	\N	9	9	530000	17	\N	\N	0	6	4	1	4м/трап, зал в трехкомн,  хорошая, опеки нет	1853
1649	56	529	13	18	\N	5	5	210000	13	\N	\N	\N	13	2	0	ч/пр, пустая	1856
1650	56	481	20	3	\N	4	9	320000	18	\N	\N	\N	13	10	0	хорошее	1859
1651	56	435	20	7	\N	3	9	220000	12	\N	\N	\N	13	10	0	\N	1861
1652	56	529	20	7	\N	5	9	200000	13.4000000000000004	\N	\N	\N	13	10	0	пустая	1862
1653	56	282	20	7	\N	8	9	230000	12	\N	\N	1	13	2	0	ч/пр., 1 собственник	1866
1654	56	281	20	7	\N	9	9	300000	18	\N	\N	1	13	2	0	сост хорошее, чистая, аккуратная	1867
1655	56	313	20	13	\N	4	9	350000	16	\N	\N	1	13	2	0	пл.окна, состояние хорошее, торг	1868
1656	56	434	20	13	\N	7	9	290000	18	\N	\N	0	13	10	0	Чистый ремонт,вода	1869
1657	56	271	20	13	\N	8	9	280000	16	\N	\N	\N	13	2	0	обычная	1871
1761	56	530	17	5	А	4	9	600000	22	\N	\N	\N	13	3	0	ч/пр, с/у, кухня	2029
1658	56	269	20	13	\N	9	9	230000	11	\N	\N	0	13	12	0	отличная, ремонт, можно по мат кап	1872
1659	56	368	20	13	\N	9	9	280000	11	\N	\N	\N	13	2	0	ремонт, мебель, торг, можно по МК	1877
1660	56	431	20	36	\N	4	9	450000	18	\N	\N	0	13	10	0	отличный ремонт,нат.потолки	1878
1661	56	272	20	36	\N	5	9	200000	13	\N	\N	\N	13	10	0	обычная	1879
1662	56	340	20	36	\N	7	9	320000	18	\N	\N	0	13	10	0	пл.окно,	1880
1663	56	492	20	36	\N	9	9	300000	18	\N	\N	0	13	10	0	ремонт, пустая	1881
1664	56	475	20	38	\N	2	5	370000	18	\N	\N	0	13	2	0	хорошее состояние	1882
1665	56	475	20	38	\N	5	5	320000	19	\N	\N	0	13	2	0	окно пласт,дверь,линолеум поменяны	1883
1666	56	508	20	40	\N	5	5	350000	18	\N	\N	1	\N	12	0	Отл. Сост.:пл.ок.,пот.,стены-выров.,пол-бетон(линол.)	1884
1667	56	434	20	40	\N	3	5	300000	18	\N	\N	0	13	10	0	Пл.окно, новые обои,  вх дверь Гардиан,вода за стенкой	1885
1668	56	281	20	40	\N	5	5	215000	13	\N	\N	0	13	2	0	сост хорошее, чистая, аккуратная	1886
1669	56	491	20	36	\N	4	9	330000	18	\N	\N	1	13	2	0	ч\\пр, торг	1887
1670	56	478	20	36	\N	5	9	180000	0	\N	\N	1	13	2	0	ч\\пр, торг, органы опеки готовы	1889
1671	56	328	20	36	\N	7	9	220000	13	\N	\N	1	13	2	0	пл.окно,дверь,торг	1890
1672	56	328	20	36	\N	7	9	280000	18	\N	\N	1	13	2	0	пл.окно,натяжной потолок,дверь	1891
1673	56	397	20	38	\N	3	5	200000	14	\N	\N	0	13	2	0	Косм.ремонт.Оконо пласт. Ч\\п.	1892
1674	56	272	20	7	\N	6	9	220000	14.5999999999999996	\N	\N	1	13	2	0	обычная, торг	1894
1675	56	387	10	32	\N	9	9	300000	12	\N	\N	0	6	4	0	чистаяпродажа	1895
1676	56	475	1234	6	Б	5	5	350000	13.4000000000000004	\N	\N	\N	13	2	0	Обычное состояние,полуванна, туалет свой	1897
1677	56	481	1234	6	Б	5	5	450000	18	\N	\N	\N	13	3	0	обычное, пласт.окно	1898
1678	56	435	1234	8	А	5	5	725000	23	\N	\N	\N	13	3	0	Отличная, все в комнате есть! Кух.гар. с\\у свои	1899
1679	56	271	1234	45	\N	2	5	300000	14	\N	\N	0	13	2	0	хорошая, Ч/ПР	1900
1680	56	271	1234	45	\N	3	5	400000	20	\N	\N	0	13	2	0	пласт.окно, гардиан, хорошее состояние	1901
1681	56	469	1234	45	\N	3	5	350000	18	\N	\N	\N	13	2	0	Торг, состояние хорошеее	1903
1682	56	308	17	3	\N	2	5	450000	22	\N	\N	0	13	3	0	пласт.окно,вода,мебель,ремонт,ч/п,торг	1905
1683	56	491	17	9	\N	3	5	360000	20	\N	\N	0	13	1	0	отличный ремонт в комнате и на этаже	1906
1684	56	475	17	9	\N	4	5	380000	22	\N	\N	0	13	2	0	окно пласт,	1908
1685	56	470	17	9	\N	5	5	350000	20	\N	\N	\N	13	2	0	Вода в комнате , кух.гарнитур	1910
1686	56	470	17	9	\N	5	5	200000	14	\N	\N	\N	13	2	0	Хорош. Состот. Пл.окно ч\\пр	1911
1687	56	507	17	9	\N	5	5	250000	14	\N	\N	0	13	2	0	Пластиковое окно, гардиан линолеум	1915
1688	56	351	17	13	\N	5	9	200000	14	\N	\N	\N	13	10	0	обчная, вода, Гардиан, сануз на 2 семьи	1916
1689	56	281	17	27	А	5	5	250000	12	\N	\N	0	13	2	0	отличная	1917
1690	56	281	17	31	\N	4	5	200000	12	\N	\N	\N	13	2	0	обычная	1918
1691	56	475	17	35	\N	2	5	450000	18	\N	\N	\N	13	2	0	окно пластиковое, хор.сост	1919
1692	56	499	17	35	\N	2	5	450000	17.6000000000000014	\N	\N	0	13	10	0	в ком.вода, стир.маш, хор. рем.,пл.ок.	1920
1693	56	272	17	35	\N	5	5	300000	18	\N	\N	1	13	2	0	пласт.окно, желез.дверь, вода в комнате	1921
1694	56	396	17	13	\N	5	5	180000	14	\N	\N	\N	13	2	0	ч\\пр	1922
1695	56	350	17	27	А	2	5	200000	12	\N	\N	\N	13	2	0	ч/пр,торг	1923
1696	56	529	17	31	\N	3	5	250000	14	\N	\N	\N	13	2	0	\N	1924
1697	56	328	17	9	\N	2	5	250000	14	\N	\N	1	13	2	0	пл.окн,дверь,ремонт,пустая	1925
1698	56	281	17	9	\N	3	5	360000	24	\N	\N	0	13	2	0	пласт.окна, дверь поменена, вода и плита в комнате,остается шкаф купе	1927
1699	56	487	17	9	\N	5	5	550000	30	\N	\N	0	13	2	0	пл.окна,натяж.потолок,линолиум,хор.обои	1929
1700	56	271	9	12	Б	3	5	650000	28	\N	\N	1	6	2	0	хор.сост., нужна 2к	1931
1701	56	475	9	16	Б	3	9	550000	18	\N	\N	0	13	3	0	Окно,линолеум,кух.гарнитур с плитой,шкаф-купе	1933
1702	56	271	9	20	В	1	5	500000	18	\N	\N	\N	6	2	0	в 4к	1934
1703	56	271	9	20	В	1	5	415000	11	\N	\N	0	6	2	0	в 4к	1935
1704	56	396	9	16	Б	5	9	350000	12	\N	\N	0	13	2	0	сан/уел на двоих, ч/пр	1936
1705	56	424	9	66	Б	3	5	300000	18	\N	\N	1	13	2	0	, не проживает никто	1937
1706	56	271	6	3	\N	9	9	570000	33	\N	\N	\N	13	2	\N	хороший ремонт	1938
1707	56	351	6	6	\N	8	9	620000	22	\N	\N	\N	13	2	0	хороший ремонт все свое душкабина кухня	1939
1709	56	474	6	7	\N	7	9	550000	22	\N	\N	\N	13	4	0	хор.,пл.окна,нов.линолеум,мебель, ч/п,пустая	1941
1711	56	491	6	12\\19	\N	2	9	800000	36	\N	\N	0	13	3	0	отличнй ремонт, ч/пр, санузел кафель	1943
1713	56	271	3	20	\N	7	9	1200000	35.5	\N	\N	\N	13	3	1	обычная, балкон с кухни	1945
1714	56	271	7	7	\N	1	9	630000	22	\N	\N	\N	13	3	0	хороший ремонт, изолированная	1946
1716	56	402	7	7	\N	8	9	650000	28	\N	\N	\N	13	3	1	3мб\\з. состояние хорошее	1948
1717	56	351	7	15	\N	5	9	900000	36	\N	\N	\N	13	2	0	отлична заезжай и живи все новое	1949
1718	56	291	7	45	\N	5	9	1240000	28	\N	\N	\N	13	3	1	3м балкон ремонт, кондиционер есть фото, 1 собственник	1950
1719	56	266	7	21\\10	\N	5	9	720000	36	\N	\N	1	13	2	0	хорошая, 1 собственник	1951
1720	56	500	7	43	\N	5	10	1600000	40	20	10	0	13	4	1	пл\\ок, межк\\дв,ванна\\\\пласт,кух\\гарн,шк\\купе, заст пл.рамой	1988
1723	56	481	12	7	\N	5	9	950000	29	\N	\N	\N	13	3	1	отличное, мебель	1991
1724	56	272	12	7	\N	8	9	820000	28.1999999999999993	\N	\N	0	13	3	1	нат потол, пласт окна, кух гарнитур,	1992
1725	56	370	20	3	\N	2	9	590000	30	\N	\N	\N	13	8	0	ремонт, душевая кабина, вода в комнате, кух.гарнит.	1993
1726	56	436	13	18	\N	4	5	725000	31.5	\N	\N	0	13	3	0	космет.ремонт, пл. окна, ч\\пр	1994
1727	56	291	20	7	\N	6	9	360000	18	\N	\N	\N	13	10	0	санузел на 2 семьи, ремонт	1995
1728	56	533	20	25	\N	2	9	800000	37	\N	\N	1	13	3	0	свежий ремонт, кафель	1996
1729	56	530	14	7	\N	3	9	1050000	30	\N	\N	\N	13	3	1	окна пластик торг	1997
1730	56	472	14	7	\N	6	9	1500000	36	\N	\N	\N	13	3	\N	супер ремонт	1998
1731	56	272	14	7	\N	9	9	900000	27	\N	\N	\N	13	3	1	кух гарнитур, ч/пр, пустая	1999
1732	56	272	14	38	\N	6	9	1200000	39	\N	\N	1	13	3	1	кух гарнитур, ч/пр, пустая	2000
1733	56	271	14	76	\N	1	10	610000	15	\N	\N	0	6	3	1	хорошее состояние	2001
1734	56	507	1234	4	\N	7	9	800000	30	\N	\N	\N	13	3	1	Хор.состояние, чистая продажа, пл. окна, душ. каб.	2002
1735	56	272	1234	4	\N	1	9	800000	29	\N	\N	1	13	3	1	обычная	2003
1736	56	435	1234	4	\N	3	9	930000	29	\N	\N	\N	13	3	1	Ремонт, пл.окна, душевая кабина, кух.гарнитур	2004
1737	56	271	1234	4	\N	7	9	630000	22	\N	\N	0	13	3	0	пл.окна, мебель и техника, обычное состояние	2005
1738	56	292	1234	4	\N	8	9	750000	28	\N	\N	0	13	3	1	кафель, двери, хорошая, торг	2006
1739	56	315	1234	4	\N	9	9	750000	28	\N	\N	0	6	3	1	кондиционер	2007
1740	56	291	1234	6	Б	2	5	700000	20	\N	\N	\N	13	3	0	ремонт, с\\у в комнате	2008
1741	56	271	1234	6	Б	4	5	1020000	35	\N	\N	\N	13	3	0	с ремонтом	2009
1742	56	481	1234	6	Б	4	5	850000	34	\N	\N	\N	13	4	0	2-х, отличное	2010
1743	56	481	1234	6	Б	5	5	550000	24	\N	\N	\N	13	3	0	обычное, пласт.окно	2011
1744	56	271	1234	6	\N	5	9	1150000	30	\N	\N	\N	13	3	1	отличный ремонт, мебель, нужна 3к	2012
1745	56	485	1234	8	А	2	5	580000	18	\N	\N	\N	13	3	0	хорошая	2013
1746	56	491	1234	8	А	3	5	800000	28	\N	\N	\N	13	3	0	перепланирована в 2х, ремонт	2014
1747	56	429	1234	8	А	4	5	450000	14	\N	\N	0	13	3	0	Плас.окно,своя душ.кабинка. Отлож до мая	2015
1748	56	435	1234	8	А	5	5	730000	23	\N	\N	0	13	3	0	пл.окно,кух.гарн., свои с\\у и душ.кабина,ОТЛИЧНАЯ	2016
1749	56	489	1234	8	Б	5	5	390000	13	\N	\N	0	13	3	0	пл. окна,  свой душевая кабинка и с\\у, ремонт,чпр	2017
1750	56	566	1234	8	\N	2	9	690000	23	\N	\N	0	13	3	0	Состояние отличное	2018
1752	56	486	1234	8	\N	5	9	890000	0	\N	\N	0	\N	3	1	ремонт, кухон.гарнитур	2020
1753	56	526	1234	10	\N	8	9	850000	29	\N	\N	1	\N	3	1	с ремонтом, балкон пластик, торг	2021
1754	56	333	1234	43	\N	1	9	900000	30	\N	\N	1	\N	3	1	окна пласт, сост.хорошее	2022
1755	56	313	1234	43	\N	1	9	850000	29	\N	\N	\N	13	3	1	ремонт, торг	2023
1756	56	487	1234	6	Б	5	5	480000	19	\N	\N	\N	13	3	0	пл.окно,нат.потолок,хор.обои,ванна 1,5м,можно по мск	2024
1757	56	403	1234	8	А	4	5	550000	18	\N	\N	\N	13	3	0	ипотека Сбербанк	2025
1758	56	316	1234	8	б	5	5	650000	23.3999999999999986	\N	\N	\N	13	3	0	2 ком-ты отл.ремонт,с\\у кафель,кух.гар.хол-.стир маш.	2026
1759	56	396	1234	8	А	2	5	600000	18.3000000000000007	\N	\N	0	13	3	0	хорошая, ч/пр	2027
1760	56	308	1234	8	А	3	5	530000	18	\N	\N	\N	13	3	0	состояние отличное, ч\\п, торг	2028
1762	56	282	17	5	А	4	9	610000	22	\N	\N	0	13	3	0	обычная,пустая,торг	2030
1764	56	474	17	9	\N	2	5	800000	38.5	19.1999999999999993	14.5999999999999996	1	13	3	0	хорошее, душ.кабина, кладовая, ч/п	2032
1765	56	364	17	11	А	6	9	780000	30	\N	\N	\N	13	3	1	обычная	2033
1766	56	475	17	17	\N	9	9	850000	35	\N	\N	\N	13	3	0	линолеум,с/у пластик,окна,двери	2034
1767	56	475	17	17	\N	9	9	750000	35	\N	\N	\N	13	3	0	с\\у кафель,окна,двери	2035
1768	56	484	17	25	\N	1	5	780000	34.3999999999999986	17.6000000000000014	\N	0	13	3	0	обычное, ч/п, 1 собственник, пустая (ключи)	2036
1769	56	424	17	25	\N	4	5	890000	30	\N	\N	\N	13	3	0	суперремонт	2037
1770	56	351	17	61	\N	3	9	1150000	36	\N	\N	\N	6	3	1	ремонт хороший все поменяно встроен мебель	2038
1771	56	271	17	63	\N	3	9	1150000	40	\N	\N	0	6	4	1	обычная, нужен дом в Чистополе	2039
1772	56	328	17	61	\N	8	9	950000	30	\N	\N	0	6	3	1	хор.состояние,торг,6м/б, 1 собственник	2040
1773	56	493	17	61	\N	9	9	950000	36	\N	\N	0	6	3	1	без ремонта, пустая, торг	2041
1774	56	296	9	16	Б	2	9	740000	33	\N	\N	0	13	3	0	торг, ч/пр, обычная	2042
1775	56	475	9	16	Б	3	9	550000	18	\N	\N	0	13	3	0	Окно,линолеум,кух.гарнитур с плитой,шкаф-купе	2043
1776	56	342	9	16	Б	4	9	950000	34	\N	\N	1	13	3	0	Отличный ремонт, кух.гарнитур и встр. Шкаф-купе, с/у в кафеле	2044
1777	56	271	9	16	Г	1	9	550000	22	\N	\N	0	13	3	0	пл.окна, линолеум, обычная	2045
1779	56	436	9	16	Г	3	9	830000	34	\N	\N	\N	13	3	0	кух. гар.,меб, чистая, большая кухня, торг	2047
1780	56	475	9	16	Г	3	9	850000	34	\N	\N	0	13	3	0	окна,двери,кух.гарнитур,мебель,1 собственник	2048
1781	56	340	9	16	Г	4	9	790000	34	15	12	0	13	3	0	ч/пр,	2049
1782	56	523	9	16	Б	4	9	950000	34	\N	\N	\N	13	3	0	Хор, сост, сан узел кафель, вст кухня, ч/пр, пустая	2050
1783	56	351	30	3	\N	2	9	1500000	0	\N	\N	\N	13	3	1	отлична заезжай и живи все новое	2051
1784	56	501	30	5	\N	9	10	1380000	39	\N	\N	1	6	4	1	торг, окна, двери поменяны, мебель	2052
1785	56	487	7	21\\10	\N	7	9	650000	32	\N	\N	0	\N	10	1	две ком-ты,кор-р-кухня8,6м,пл.окно,хор. рем,меб	2053
1787	56	434	20	3	\N	3	9	495000	30	\N	\N	0	13	10	0	Отличная, можно подв.воду.	2055
1789	56	287	6	15	\N	7	10	1480000	33	\N	\N	0	6	3	0	хороший ремонт, торг	2057
1790	56	573	6	17	\N	3	10	1380000	40	\N	\N	0	6	3	1	строит.ремонт, кух.гарнитур в подарок	2058
1791	56	349	6	19	\N	6	9	1380000	29	\N	\N	\N	6	3	1	полный супер ремонт	2059
1792	56	493	6	19	\N	1	10	1300000	30	\N	\N	1	6	3	1	строитл.ремонт, можо под офис	2060
1793	56	484	2	4	\N	4	5	780000	34	\N	\N	0	13	3	1	требует ремонта, ч/п, 1 собственник, пустая	2061
1794	56	475	2	8	Б	4	5	950000	30	\N	\N	0	\N	3	1	разнарядка,окна,двери,мебель	2062
1795	56	434	4	5	\N	1	5	920000	30	\N	\N	0	6	3	0	Чистый ремонт,новый ленолеум,пл.окна	2063
1796	56	391	2	21	\N	3	5	1000000	31	\N	\N	\N	6	3	1	обычная, ч.пр.	2064
1797	56	436	4	7	А	2	5	1160000	29	\N	\N	0	6	3	1	Ч\\пр, хороший ремонт	2065
1798	56	281	4	7	Б	4	5	1070000	28	\N	\N	0	6	3	1	обычное сост, ок.пласт, с\\у каф	2066
1799	56	287	4	9	\N	5	5	980000	29	\N	\N	\N	6	3	1	ремонт, торг	2067
1800	56	481	4	13	\N	5	5	850000	29	\N	\N	\N	6	3	1	обычное	2068
1801	56	351	4	18	\N	1	9	1150000	28	\N	\N	\N	\N	3	1	начатый ремонт. Требует продлжения	2069
1802	56	503	4	22	А	7	9	1200000	34	\N	\N	1	13	3	1	обычная, аккурат., Ч.ПР, 1 собств.	2070
1803	56	271	4	24	\N	3	5	1100000	30	\N	\N	\N	6	3	0	пл.окна, гардиан, косм.ремонт, док-ты готовы	2071
1804	56	291	4	24	\N	5	5	870000	30	\N	\N	\N	\N	3	1	окна пластик, простая	2072
1805	56	369	4	26	\N	3	5	1260000	29	\N	\N	\N	\N	3	1	отличный ремонт, кухонный гарнитур, ч/п	2073
1806	56	349	4	13	\N	5	5	1150000	29	\N	\N	\N	\N	3	1	ремонт,торг	2074
1807	56	315	4	1	А	5	5	1280000	29	\N	\N	0	6	3	1	отл.ремонт, кух.гарнитур и шкаф купе	2075
1808	56	479	7	45	\N	9	9	1050000	0	\N	\N	1	13	3	\N	ремонт, 2-х	2076
1809	56	317	13	2	А	1	5	950000	29	\N	\N	\N	13	3	1	ремонт	2077
1810	56	531	13	2	А	1	5	950000	29	\N	\N	\N	\N	3	1	с хорошим ремонтом, ч/пр	2078
1811	56	316	13	6	\N	5	9	1000000	36	\N	\N	\N	6	3	1	обычное состояние	2079
1812	56	434	13	10	\N	4	9	1240000	35	\N	\N	0	6	3	1	Евроремонт+мебель	2080
1813	56	529	13	28	\N	3	5	1000000	32	\N	\N	\N	13	3	1	пустая	2081
1814	56	268	13	36	\N	6	12	1250000	37	\N	\N	0	13	4	1	полный ремонт, торг, или обмен 2к	2082
1815	56	391	13	38	\N	1	5	1000000	33	\N	\N	\N	13	3	1	отличный ремонт, всё новое, надо 2-х в этом р-не	2083
1816	56	431	12	1	А	4	5	850000	30	\N	\N	0	6	4	1	косметический ремонт	2084
1817	56	265	12	2	\N	4	5	1000000	31	\N	\N	0	6	3	1	пл.окна, двери,кухня,кафель, 1 собственник	2085
1818	56	317	12	4	\N	1	5	950000	29	\N	\N	\N	6	3	0	хороший ремонт	2086
1819	56	340	12	5	Б	3	5	930000	29	\N	\N	0	6	3	1	ч/пр, пустая	2087
1820	56	483	12	9	\N	2	5	1020000	30	\N	\N	\N	6	3	1	душ. Кабина ,кафель, нат .потолок,чистый ремонт	2088
1821	56	397	12	9	\N	5	5	790000	29	\N	\N	0	6	3	1	Обычная. Косм.ремонт. Ч/п. 1 собственник	2089
1822	56	391	12	15	\N	5	9	1350000	33	\N	\N	\N	13	3	1	отличный ремонт, встроенная техника, надо 3-х	2090
1823	56	432	12	16	А	4	5	1150000	30	\N	\N	0	6	3	1	Хорошая, торг, остается вся мебель	2091
1824	56	282	12	27	\N	1	5	1250000	40	\N	\N	0	6	4	0	отличный ремонт, +пристрой	2092
1825	56	474	12	41	\N	3	5	1030000	29	\N	\N	0	6	3	1	хор.,пласт.окна,двери поменяны,ч/п,1 собственник	2093
1826	56	573	12	46	\N	1	9	1250000	35	\N	\N	0	6	3	1	Ремонт, кух. Гарнитур, хороший погреб ТОРГ	2094
1827	56	501	12	7	\N	7	9	750000	22	\N	\N	0	13	3	0	обычная, торг	2095
1828	56	500	12	27	\N	5	5	950000	30	\N	\N	0	6	3	1	пл\\ок, м\\дв, линолеум,кафель	2096
1829	56	491	31	18	\N	1	5	800000	32	\N	\N	\N	6	3	0	плас.окна, обычное. ч/пр	2097
1830	56	436	20	20	\N	3	5	950000	30	\N	\N	0	6	3	1	обычная	2098
1831	56	435	20	21	Б	5	5	800000	33	\N	\N	0	\N	3	1	\N	2099
1832	56	268	20	37	\N	5	10	980000	29	\N	\N	0	\N	3	0	новая встр.кухня, шкаф-купе	2100
1833	56	431	20	37	\N	8	9	890000	37	\N	\N	0	13	4	0	косметический ремонт	2101
1834	56	349	20	39	\N	10	10	900000	36	\N	\N	\N	13	3	0	ремонт	2102
1835	56	402	20	39	\N	9	10	990000	36	\N	\N	\N	13	3	0	Отличный ремонт	2103
1836	56	351	20	41	\N	6	10	800000	28	\N	\N	\N	6	3	1	кух. Гарнитур, сан узел плитка, пластик	2104
1837	56	316	20	45	\N	8	12	1850000	70	\N	\N	\N	13	4	1	кухня s= 20, за 1 кв.м., 25т	2105
1838	56	496	20	11	А	1	5	1300000	36	\N	\N	0	6	3	1	отл ремонт, все пом, мебель, ч/пр,	2106
1839	56	370	11	1	А	2	9	1080000	36	\N	\N	\N	\N	3	1	ипотека СБ 190т.р, 1 пл.окно	2107
1840	56	469	11	23	\N	2	9	1800000	40	\N	\N	\N	\N	4	1	Отличное	2108
1841	56	281	11	23	\N	8	10	1350000	39	\N	\N	0	6	4	1	состояние обычное	2109
1842	56	265	10	1	\N	5	5	900000	30	\N	\N	0	6	3	1	пл.окна, нат.пот.,двери,кухня,1собств.,надо 3к св.р-он	2110
1843	56	391	10	1	\N	5	5	820000	29	\N	\N	\N	6	3	1	с ремонтом, ч.пр.	2111
1844	56	369	10	2	А	4	5	880000	29	\N	\N	\N	6	3	1	ипотека Акбарс- 400 т.р, нужна 3-х там же	2112
1845	56	396	10	2	А	5	5	950000	30	\N	\N	0	6	3	1	отличная, мебель,	2123
1846	56	488	10	2	\N	3	5	830000	29	\N	\N	\N	6	3	1	\N	2124
1847	56	287	10	4	А	1	9	980000	35	\N	\N	\N	\N	3	1	ремонт, торг	2125
1848	56	315	10	6	\N	5	5	900000	29	\N	\N	\N	\N	3	1	ч\\п, опека готова	2126
1849	56	469	14	48	\N	9	10	1480000	40	\N	\N	\N	\N	4	1	состояние хорошее	2127
1850	56	484	14	72	\N	4	9	1550000	35	\N	\N	0	\N	3	1	мебель, ч/п, пустая	2128
1851	56	271	14	76	\N	1	10	610000	15	\N	\N	0	6	3	1	хорошее состояние	2129
1852	56	282	14	76	\N	5	9	1610000	40	\N	\N	0	\N	3	1	хорошая, ч/пр.	2130
1853	56	533	14	95	А	2	10	1480000	33	\N	\N	1	\N	3	1	ремонт+мебель встроенная	2131
1854	56	431	14	95	А	1	10	675000	17	\N	\N	0	6	3	1	окна пласт, входная дверь гардиан НЕЖИЛОЕ	2132
1855	56	387	26	13	\N	1	5	900000	32	\N	\N	0	13	3	0	пласт. окна, чистая продажа	2133
1856	56	477	26	17	А	2	5	1150000	0	\N	\N	\N	\N	3	1	евро	2134
1857	56	291	26	17	\N	6	9	1200000	36	\N	\N	\N	\N	3	1	ремонт, чистая продажа	2135
1858	56	483	1234	3	Б	3	5	970000	30	\N	\N	\N	6	3	1	обычная, чистая, один собственник	2136
1859	56	387	1234	26	\N	1	5	950000	32	\N	\N	0	13	3	0	косметический ремонт	2137
1860	56	469	1234	28	\N	1	5	980000	31	\N	\N	\N	\N	3	0	состояние хорошее	2138
1861	56	486	1234	28	\N	1	5	850000	30	\N	\N	\N	\N	3	0	\N	2139
1862	56	272	1234	38	\N	1	5	1250000	31	\N	\N	0	13	3	1	без ремонта	2140
1863	56	371	1234	49	\N	4	10	1600000	40	\N	\N	\N	13	3	1	в ванной евроремонт	2141
1864	56	291	1234	28	\N	5	5	970000	29	\N	\N	\N	\N	3	0	окна пластик, входная дверь, кондиционер	2142
1865	56	469	1234	30	\N	11	14	1450000	40	\N	\N	\N	13	4	1	Ремонт	2143
1968	56	491	1234	46	\N	9	9	2500000	0	\N	\N	\N	13	4	1	\N	2309
1866	56	402	1234	38	\N	5	5	1500000	33	\N	\N	\N	13	3	1	Полностью евро ремонт	2144
1867	56	523	17	16	\N	1	10	1850000	40.2999999999999972	\N	\N	0	\N	4	1	разнорядка, ипотека СББ	2145
1868	56	351	17	36	\N	7	9	1300000	40	\N	\N	\N	6	4	1	новый дом, пл.окна, кух гар-р	2146
1869	56	271	17	36	\N	8	10	1230000	33	\N	\N	\N	6	3	1	хорошее состояние, нужна 3к	2147
1870	56	481	15	13	\N	6	9	1650000	39	\N	\N	\N	6	4	1	отличное, все поменяно	2148
1871	56	397	15	34	\N	6	9	1200000	34	\N	\N	0	6	3	1	Чистая, аккуратная. 1 Собственник. Ч/п	2149
1872	56	349	15	75	\N	9	9	1350000	33	\N	\N	\N	6	3	1	ремонт	2150
1873	56	487	18	14	\N	5	5	870000	30	\N	\N	0	\N	3	1	гардиан,чистая,аккуратная	2151
1874	56	484	29	3	\N	1	5	830000	30	\N	\N	0	\N	3	0	пласт.окна, сан.узел - пластик, 1 собственник	2152
1875	56	477	29	19	\N	2	9	0	35	\N	\N	\N	\N	3	1	пласт.окна, двери поменяны	2153
1876	56	292	9	1	\N	10	10	2200000	70	\N	\N	0	13	3	0	шикарный ремонт, встр.кухня, шкаф-купе, 1 собственник	2154
1877	56	424	9	2	\N	9	12	1340000	37	\N	\N	0	13	3	1	среднее сост	2155
1878	56	533	9	12	б	5	5	800000	30	\N	\N	\N	6	3	1	торг, пластик окна, обычная	2156
1879	56	316	9	14	а	5	5	920000	29	\N	\N	\N	6	3	1	обычное состояние	2157
1880	56	296	1233	16	Б	2	9	740000	33	\N	\N	0	13	3	0	торг, ч/пр, обычная	2158
1881	56	396	9	22	\N	4	12	1120000	37	\N	\N	1	13	3	1	отличная, Евро	2159
1882	56	489	9	22	\N	4	9	1140000	35	\N	\N	0	6	3	0	евро	2160
1883	56	434	9	44	\N	5	5	870000	31	\N	\N	0	13	3	1	Пл.окна,чистый ремонт.Ипотека	2161
1884	56	317	9	50	\N	4	5	1100000	33	\N	\N	\N	13	3	1	ремонт	2162
1885	56	409	9	58	\N	2	5	1000000	30	\N	\N	\N	\N	3	0	ремонт+кух.гарнитур	2163
1886	56	271	9	86	\N	3	12	1580000	46	\N	\N	0	13	3	1	строительный ремонт, Ч/Пр	2164
1887	56	489	9	90	\N	9	12	1620000	47	\N	\N	1	\N	4	1	евро,вариант подобран,опеку сделали	2165
1888	56	431	9	90	\N	9	12	1650000	46	\N	\N	1	13	4	1	пл.окна, хороший ремонт	2166
1889	56	434	9	100	\N	1	5	1100000	39	\N	\N	0	6	4	0	Пл.окна,стены и пот.выровнены,с/у плитка,тамбур 10кв	2167
1890	56	281	9	108	\N	4	5	900000	29	\N	\N	0	6	3	1	состояние обычное, б\\з	2168
1891	56	370	9	57	\N	8	9	1450000	38.7000000000000028	\N	\N	\N	6	4	1	пл.окна, двери поменяны, кух.гарнитур.	2169
1892	56	436	24	5	А	2	5	1050000	30	\N	\N	0	6	3	1	Супер ремонт! Есть все! Сказка!	2170
1893	56	351	25	3	\N	7	9	1650000	45	\N	\N	\N	13	4	1	отл, всё поменяно, встр. Мебель, в коридоре как гостиная	2171
1894	56	272	25	4	\N	1	9	1350000	40	\N	\N	0	\N	3	0	\N	2172
1895	56	484	1233	11	\N	8	10	1490000	35	\N	\N	0	\N	3	1	хор.ремонт, 1 собственник, 2-х	2173
1896	56	281	1233	23	\N	10	10	1550000	33	\N	\N	0	6	3	1	ремонт, кроме са.узла, ост.кухня, шкаф.купе в зале	2174
1897	56	281	1233	27	\N	1	10	1500000	35	\N	\N	0	6	3	1	с ремонтом, с\\у  кафель, остается кухня	2175
1898	56	368	1233	38	\N	4	10	1680000	40	\N	\N	\N	\N	4	1	ч/п	2176
1899	56	368	1233	38	\N	8	10	1500000	36	\N	\N	\N	\N	4	1	ч/п	2177
1900	56	479	1233	44	\N	1	9	925000	30	\N	\N	0	6	3	0	ремонт, 1-но	2178
1901	56	281	1233	46	\N	1	9	1350000	31	\N	\N	0	6	3	1	отл.ремонт, ост.кухня	2179
1902	56	282	1233	55	\N	2	5	1020000	30	\N	\N	0	6	3	1	без ремонта, пустая, ч/пр.	2180
1903	56	432	1233	11	\N	10	10	1400000	33	\N	\N	0	6	3	1	Хорош.состояние,	2181
1904	56	478	1233	27	\N	7	10	1500000	33	18	7	0	6	4	1	строительный ремонт	2182
1905	56	328	1233	53	\N	1	10	1280000	33	\N	\N	0	6	4	1	отл.сост,торг,шкаф+кух.гарнитур=1к 40кв	2246
1906	56	328	1233	61	\N	6	9	1350000	36	\N	\N	0	6	4	1	хор.состояние,шкаф-купе,1 собственник	2247
1907	56	528	23	4	\N	4	5	1000000	32	18	6	\N	\N	3	1	ч\\п,пустая	2248
1908	56	265	28	2	\N	9	10	1500000	40	\N	\N	0	6	3	1	пл.окна, двери,кафель, кухня,шкаф-купе	2249
1909	56	387	21	2	\N	1	9	3200000	112	\N	\N	0	\N	4	1	пласт.окна, санузел - кафель, ремонт, ч/пр	2250
1910	56	484	2	12	\N	4	5	2250000	112	\N	\N	0	13	8	1	5-ти, хорошее, пласт.окна, ч/п	2251
1911	56	342	20	27	\N	8	10	5000000	178	\N	\N	0	13	8	1	евроремонт, идеальное состояние	2252
1912	56	434	14	64	\N	2	9	3600000	122	\N	\N	0	6	8	1	Отличный ремонт	2253
1913	56	484	14	32	\N	4	9	6500000	170	\N	\N	0	6	4	1	5-ти, евро, итальянская мебель, ч/п	2254
1914	56	333	15	6	\N	7	9	4000000	120	\N	\N	0	\N	4	1	торг, с ремонтом, переделана в 4х, узак	2255
1915	56	470	15	6	\N	3	9	5000000	0	\N	\N	\N	\N	8	1	Евро дизайн мебель	2256
1917	56	479	15	69	\N	5	5	3500000	129	\N	\N	\N	6	4	1	5-ти, ремонт	2258
2495	56	469	36	16	\N	1	3	1450000	0	\N	\N	\N	\N	\N	1	\N	3184
1918	56	429	9	53	\N	6	10	7350000	250	\N	\N	0	13	8	1	Дорог.евро рем., сауна,конд.,охр.сигн.	2259
1919	56	429	9	53	\N	7	10	7500000	213	\N	\N	0	13	8	1	Отличный ремонт,дорогая мебель	2260
1920	56	474	9	21	\N	2	10	8000000	305.100000000000023	\N	\N	0	13	9	1	5-ти из 3-х+4-х,перепл,рем.,меб.,тех.,сауна,гард.,трен.	2261
1921	56	387	9	1	Б	2	6	3000000	160	97	\N	0	10	4	1	отличное сост, под ЕВРО	2262
1922	56	328	25	11	\N	6	9	4300000	164	90	26	0	6	8	1	торг,хор.сост,кухня=26кв,сауна	2263
1923	56	287	30	1	\N	2	10	3650000	120	\N	\N	0	\N	8	1	ремонт, торг	2264
1924	56	439	30	2	\N	10	10	2600000	120	\N	\N	0	6	8	1	Отличная квартира. Торг	2265
1926	56	429	1233	3	\N	4	7	10000000	135	\N	\N	0	13	9	1	Встр.кух, шкаф-купе, пустая	2267
1927	56	431	28	2	\N	2	9	2800000	120	\N	\N	0	6	8	1	хороший ремонт, мебель остается	2268
1928	56	523	9	38	\N	6	9	5500000	167	\N	\N	0	13	8	1	Хорошее состояние, лифт в квартиру,торг	2269
1929	56	431	9	38	\N	7	12	5200000	190	\N	\N	0	13	8	1	Евроремонт,мебель,техника	2270
1930	56	340	9	53	\N	6	11	8500000	150	\N	\N	1	13	8	1	торг	2271
1931	56	475	9	56	\N	3	9	3600000	120	\N	\N	0	13	4	1	кирпичный дом,хорошая планировка	2272
1932	56	431	9	78	В	5	5	1380000	72	\N	\N	0	13	4	1	косметический ремонт	2273
1933	56	508	9	90	\N	6	9	3750000	81	\N	\N	0	6	4	1	отл.сос.Все пом.:окн,двери,линол,с\\у-совр.рем.Ипот1,5	2274
1934	56	484	9	94	\N	1	9	2270000	80	52	\N	0	6	4	1	не проходная, ремонт, пласт.окна, 2-х	2275
1935	56	340	9	94	\N	5	9	2500000	77	49	8.69999999999999929	0	6	4	1	не проходная или обмен на 2+доплата,	2276
1936	56	491	9	38	\N	3	12	4500000	153	\N	\N	0	13	4	1	отличная	2277
1937	56	328	9	72Г	\N	5	5	1800000	75	\N	\N	0	6	4	1	обычное состояние,хорошее расположение,торг	2278
1938	56	399	9	72	В	5	5	2200000	76	\N	\N	\N	\N	4	1	Косметический ремонт. Ост. вся новая мебель.чист.продажа	2279
1939	56	424	9	95	\N	7	9	2600000	82	\N	\N	0	\N	4	1	хорошее сост	2280
1940	56	328	24	7	\N	7	9	2200000	73	\N	\N	0	13	4	1	торг,хороший ремонт, кух.гарнитур+шкаф-купе	2281
1941	56	431	25	17	\N	8	10	3500000	119	\N	\N	0	6	8	1	Евроремонт	2282
1942	56	483	30	10	\N	6	9	3700000	120	\N	\N	\N	\N	4	1	сауна,ремонт,мебель	2283
1943	56	349	30	11	\N	1	10	2800000	120	\N	\N	\N	\N	4	1	торг, ч/пр	2284
1944	56	271	1233	3	\N	2	8	8000000	164	\N	\N	\N	10	8	1	отличный ремонт, мебель	2285
1945	56	266	1233	3	\N	2	6	12000000	174	\N	\N	0	\N	4	1	дизайнерский ремонт, ч/пр., 1 собственник	2286
1946	56	439	1233	3	\N	2	8	4950000	181	\N	\N	0	13	8	1	Перепланировка, черновая	2287
1947	56	340	1233	3	\N	5	8	10000000	235	\N	\N	0	\N	8	1	супер, + клад.+парковка, зимний сад, сауна….	2288
1948	56	439	1233	3	\N	6	8	10000000	186	\N	\N	0	13	9	1	Встр.кух, шкаф-купе, сауна, пустая	2289
1949	56	271	1233	50	\N	2	9	3500000	120	\N	\N	\N	6	8	1	новые качеств.пл.окна, новая плитка в с/у, 5к	2290
1950	56	268	1233	53	\N	8	10	2800000	82	\N	\N	0	\N	4	1	разнарядка, хорошая	2291
1951	56	272	1233	71	\N	4	5	2350000	74	\N	\N	0	\N	4	1	состояние хорошие	2292
1952	56	434	1233	44	\N	9	9	2700000	83	\N	\N	0	6	4	1	с/у плитка,везде современный ремонт+мебель	2293
1953	56	349	28	2	\N	4	10	3100000	116	\N	\N	\N	6	4	1	ремонт,перепланировка из 5ти,супер ремонт	2294
1954	56	342	28	2	\N	2	9	2500000	81	\N	\N	0	6	4	1	Отличное состояние, разнорядка,	2295
1955	56	271	19	36	\N	3	5	2300000	79	\N	\N	1	6	4	1	хороший ремонт, мебель, нужна 2к	2296
1956	56	544	21	2	\N	1	9	3000000	111	\N	\N	0	13	3	1	Отл.еврорем. Остается вся встр.мебель. 1 собственник	2297
1957	56	573	11	5	\N	4	5	1650000	72	\N	\N	0	6	4	1	сост обыч ТОРГ	2298
1958	56	531	10	3	\N	5	5	1850000	74	\N	\N	\N	6	4	1	отл.ремонт, все поменено, ч/пр, торг	2299
1959	56	340	14	6	\N	6	9	2750000	76	\N	\N	1	\N	4	1	пл.окна, перепл. Не узаконена,не проходная	2300
1960	56	391	14	14	\N	6	9	3500000	82	\N	\N	1	\N	4	1	с ремонтом, с/уз-кафель, надо 2-х Мира нечет.сторона	2301
1961	56	492	14	43	\N	3	9	2600000	86	\N	\N	0	6	4	1	хорошая,ч/пр, срочно	2302
1962	56	285	14	43	\N	9	9	2500000	83	\N	\N	0	\N	4	1	обычная, пустая	2303
1963	56	492	14	57	\N	12	12	3800000	0	\N	\N	0	6	4	1	\N	2304
1964	56	435	14	73	\N	6	9	3120000	74	\N	\N	0	13	4	1	Чистая, аккуратная с ремонтом	2305
1965	56	364	27	10	\N	5	5	2150000	74	\N	\N	\N	6	4	1	пл.окна, с/узел кафель, торг	2306
1966	56	484	26	3	\N	2	13	3500000	0	\N	\N	\N	13	4	1	ремонт, евроокна, 2-х	2307
1967	56	266	1234	30	\N	10	12	2900000	84	\N	\N	0	13	4	1	ремонт	2308
1969	56	403	17	10	\N	6	10	3900000	120	\N	\N	\N	6	4	1	отличн.ремонт	2310
1970	56	308	15	50	\N	2	9	3300000	120	\N	\N	\N	6	4	1	два сан.узла (кафель),кух.S=20, кух.гар.,шкаф купе,торг	2311
1971	56	351	15	30	\N	5	7	3200000	118	\N	\N	\N	6	4	1	хорошая пл окна, кафель	2312
1972	56	340	15	61	\N	2	9	3600000	110	\N	\N	0	6	4	1	4=2+1	2313
1973	56	268	15	75	\N	7	9	2800000	95	\N	\N	0	6	4	1	обычная	2314
1974	56	493	15	77	\N	1	9	3150000	110	\N	\N	0	\N	4	\N	хороший ремонт, возможен обмен на 2-х или 3-х	2315
1975	56	374	15	77	\N	9	9	3150000	110	\N	\N	\N	\N	4	\N	или обмен на 2-х, торг	2316
1976	56	431	15	79	\N	2	9	3200000	120	\N	\N	0	6	4	1	пласт окна, межкомн.двери новые,с\\у кафель	2317
1977	56	505	15	75	\N	3	9	3100000	110	\N	\N	\N	6	4	1	ремонт	2318
1978	56	342	15	61	\N	9	10	3700000	111	\N	\N	0	\N	4	1	Отличное состояние, Итальянский кух. Гарнитур, зал 25кв.м.	2319
1979	56	482	18	12	\N	1	5	2400000	105	\N	13	\N	13	4	1	разнорядка, отличное	2320
1980	56	483	9	12	\N	5	10	2950000	86	\N	\N	\N	6	4	1	ремонт,кух.гарнитур,техника,все идеально	2321
1981	56	281	9	17	\N	1	9	2650000	108	\N	\N	\N	6	4	1	большая кухня 20 кв.м., больш.ванна, пл.окна, с\\у кафель, трубы меняны	2322
1982	56	268	9	17	\N	3	10	3200000	120	\N	\N	0	6	4	1	отличная	2323
1983	56	397	9	20	В	5	5	2150000	74	\N	\N	0	6	3	1	Отл.рем.Ост.кухня. В ванне - сауна. Шкафы-купе. Торг	2324
1984	56	271	9	23	\N	2	6	8000000	187	\N	\N	\N	10	4	1	дизайнерский евроремонт	2325
1985	56	294	9	25	\N	10	10	3200000	119	\N	\N	0	6	4	1	евроремонт, камин, ч/пр., торг	2326
1986	56	271	2	12	\N	5	5	3700000	110	\N	\N	0	13	4	1	евроремонт, перепланировка из 5к	2327
1987	56	272	3	9	\N	6	9	2800000	86	\N	\N	1	6	4	1	пласт окна, межком двери, проходная	2328
1988	56	367	7	11	\N	4	5	1650000	73.7999999999999972	9.90000000000000036	\N	\N	6	4	1	кухня-9,9, перепланировка зарегистрирована	2329
1989	56	271	7	13	\N	1	9	1500000	91	\N	\N	\N	13	4	0	хороший ремонт, Ч/ПР, можно под офис	2330
1990	56	271	13	32	\N	2	5	2250000	80	\N	\N	\N	13	4	1	отличный ремонт	2331
1991	56	291	12	3	б	2	5	2100000	0	\N	\N	\N	6	4	1	ремонт, ч\\п	2332
1992	56	268	12	20	\N	6	9	2400000	73	\N	\N	0	\N	4	1	без ремонта, ч/пр., торг	2333
1993	56	268	12	22	А	3	5	2300000	74	\N	\N	0	\N	4	1	частично ремонт, торг	2334
1994	56	391	12	37	\N	3	5	2300000	74	\N	\N	\N	6	4	1	пласт.окна, с-уз.-кафель, ч.пр., пустая	2335
1995	56	271	31	3	а	4	5	2400000	75	\N	\N	\N	6	4	1	с ремонтом	2336
1996	56	523	20	1	\N	2	12	3200000	155	\N	\N	\N	13	4	1	Обычное состояние, пласт окна,	2337
1997	56	488	20	1	\N	4	10	3000000	165	\N	\N	\N	13	8	1	теплая, уютная	2338
1998	56	477	20	1	\N	4	10	3900000	180	\N	\N	0	13	4	1	евро, ч/п	2339
1999	56	429	20	1	\N	6	9	3900000	167	\N	\N	0	13	4	1	отличный ремонт, срочная продажа	2340
2000	56	403	20	1	\N	8	12	3000000	0	\N	\N	\N	13	8	1	Супер ремонт	2341
2001	56	529	20	1	\N	8	12	2000000	162	\N	\N	\N	13	4	1	черновая	2342
2002	56	482	20	24	\N	9	9	2450000	72	\N	\N	0	13	4	1	перепланирована в 3-х,евро,кух.гарн.,ч/п	2343
2003	56	282	20	27	\N	3	10	3900000	157	\N	\N	0	13	4	1	отличная, ч/пр., два санузла	2344
2004	56	271	20	27	\N	7	9	5750000	168	\N	\N	0	13	4	1	евро, мебель, техника, Ч/ПР	2345
2005	56	351	20	27	\N	8	9	4000000	167	\N	\N	\N	13	4	1	отличная, элитная	2346
2006	56	533	20	27	\N	9	10	4800000	160	\N	\N	\N	13	4	1	евро, мебель	2347
2007	56	340	20	29	\N	10	10	3130000	118	69	26	1	6	8	1	ч/пр, торг, или обмен на 2-х	2348
2008	56	399	20	29	\N	4	10	3000000	120	\N	\N	\N	6	8	1	Отличная. Стены выровнены, натяжн. Потолки. Ост.част.меб.	2349
2009	56	529	20	29	\N	4	9	3000000	120	30	\N	\N	6	4	1	пустая, срочно или обмен на квартиру 2к	2350
2010	56	342	20	29	\N	8	10	3200000	116	\N	\N	1	6	4	1	отл. ремонт, остается гарн., прихож	2351
2011	56	403	20	31	\N	9	10	2600000	78	\N	\N	\N	6	4	1	отл.ремонт	2352
2012	56	328	11	1	\N	2	5	1900000	74	\N	\N	0	6	4	1	хороший ремонт, торг	2353
2013	56	482	11	5	\N	2	5	2000000	72	\N	\N	\N	6	4	1	пласт.окна, двери поменяны, 1-но или 2-х	2354
2014	56	475	11	13	\N	3	5	1900000	72	\N	\N	0	6	4	1	обычное	2355
2015	56	424	11	27	\N	2	9	2600000	87	\N	\N	0	6	4	1	хорошее сост	2356
2016	56	296	9	68	\N	12	14	2550000	74	\N	\N	\N	13	4	1	хороший ремонт, частично мебель, ч/пр	2357
2017	56	371	24	3	\N	3	12	2000000	0	\N	\N	\N	13	4	1	хороший ремонт, мебель и техника остается	2358
2018	56	472	24	5	А	2	5	1400000	60	\N	\N	0	6	4	1	ремонт, кондиционер	2359
2019	56	269	24	5	А	4	5	1550000	60	\N	\N	0	\N	4	1	пл окна, фил двери, кафель	2360
2020	56	369	24	5	А	4	5	1550000	60	\N	\N	\N	\N	4	0	ремонт, ч/п	2361
2021	56	282	24	5	А	4	5	1780000	60.5	\N	\N	0	\N	4	1	хор.ремонт, ч/пр., торг	2362
2022	56	340	24	7	\N	2	9	1540000	59	\N	\N	0	\N	4	1	без ремонта, комнаты разд.	2363
2023	56	499	24	5 А	\N	5	5	1350000	60	\N	\N	1	6	4	1	пласт.окна, больш.кладов, сост. сред	2364
2024	56	508	24	5	А	1	5	1400000	60	\N	\N	1	6	4	1	торг, обыч, или на 2-ух р-н Тат гимн (Гаг)	2365
2025	56	431	25	17	\N	8	10	3500000	119	\N	\N	0	6	8	1	евроремонт	2366
2026	56	372	25	6\\1	\N	8	9	3500000	96	\N	\N	\N	\N	4	1	\N	2367
2027	56	271	1233	3	\N	2	8	8000000	164	\N	\N	\N	10	8	1	отличный ремонт, мебель	2368
2028	56	439	1233	3	\N	4	7	6300000	160	\N	\N	0	13	4	1	Перепланировка, черновая	2369
2029	56	294	1233	3	\N	6	8	0	112	\N	\N	0	\N	4	1	камин, евро, мебель	2370
2030	56	281	1233	56	\N	4	9	2500000	65	\N	\N	0	6	4	1	пл.ок, ванна пластик, торг	2371
2031	56	491	1233	57	\N	1	9	2800000	93	\N	\N	0	6	4	1	отличная, кухня, ч/пр	2372
2032	56	351	1233	79	\N	4	9	2100000	65	\N	\N	\N	\N	4	1	разнорядка, ремонт обычный	2373
2033	56	350	1233	3	\N	7	9	8500000	110	\N	\N	\N	\N	4	1	ЕВРО, ч/пр,	2374
2034	56	333	1233	3.	\N	4	8	8000000	123	\N	\N	0	\N	4	1	с ремонтом, с мебелью, ч/пр	2375
2035	56	488	23	4	\N	1	5	1900000	55	\N	\N	\N	6	4	1	хорошее, пласт.окна	2376
2036	56	272	28	2	\N	2	9	2100000	65	\N	\N	1	6	4	1	пласт. окна, межком двери,ламинат,	2377
2037	56	308	28	2	\N	7	9	2400000	66	\N	\N	\N	6	4	1	ремонт+кух.гар.,шкаф купе, торг	2378
2038	56	475	19	21	В	4	5	1580000	60	\N	\N	0	6	4	0	Обычное	2379
2039	56	271	19	36	\N	3	5	2300000	79	\N	\N	1	6	4	1	хороший ремонт, мебель, нужна 2к	2380
2040	56	409	19	19	\N	1	5	2150000	60	\N	\N	\N	\N	4	1	торг,ипотека ВТБ,есть погреб	2381
2041	56	432	19	21	В	4	5	1600000	58.3999999999999986	\N	\N	0	6	4	0	в 2-х комнатах хор.ремонт, без балкона	2382
2042	56	308	1233	21	А	7	9	6500000	140	\N	\N	\N	13	4	1	кухня S=21, зал S=41,  кух.гар., шкаф купе (3ш),ч\\п, торг	2383
2043	56	351	6	16	\N	1	9	2800000	90	\N	\N	\N	6	4	1	отличная новый дом ремонт	2384
2044	56	271	2	6	Б	3	5	1650000	60	\N	\N	\N	6	4	1	обычная, гардиан, нужна 2к	2385
2045	56	271	2	6	\N	5	5	2900000	113	\N	\N	0	13	4	1	очень хороший ремонт, Ч/ПР, торг	2386
2046	56	265	18	12	\N	5	5	1900000	60	\N	\N	0	\N	3	1	кирп.дом, евроремонт, техника, мебель, пустая, торг	2387
2047	56	478	29	31	\N	5	5	1750000	60	\N	\N	0	\N	4	1	состояние хорошее	2388
2048	56	508	29	24	\N	3	5	1750000	59	\N	7	1	13	4	1	обычная, чистая,аккур.	2389
2049	56	340	9	1	Б	6	6	2690000	70	\N	\N	0	\N	4	1	перепл. Узаконена, ч/пр, кух.гарн.встр. Техника, ремон	2390
2050	56	491	9	7	\N	8	9	3600000	124	\N	\N	0	13	4	1	ремонт	2391
2051	56	364	9	15	\N	7	10	2500000	65.7000000000000028	41.1000000000000014	9	\N	6	4	1	однорядка, ремонт	2392
2052	56	402	9	17	\N	8	9	2150000	66	\N	\N	\N	6	4	1	\N	2393
2053	56	436	9	20	\N	4	9	2150000	65	\N	\N	0	6	4	1	Отличная, с\\у-кафель, в ванне тепл.пол, ок.	2394
2054	56	487	9	20	\N	4	9	2300000	65	\N	\N	0	6	4	1	пл.окна филен.двери,с/узел кафель шкафы-купе,кух.гарн	2395
2055	56	287	9	21	\N	8	10	5000000	178.400000000000006	\N	\N	0	13	4	1	евро, дизайн, ч/пр., 1 собственник	2396
2056	56	369	9	24	\N	4	9	2450000	65.5	\N	\N	\N	6	4	1	\N	2397
2057	56	501	9	25	\N	3	9	2150000	66	\N	\N	0	6	4	1	торг, без ремонта	2398
2058	56	431	9	36	\N	5	5	1990000	60	\N	\N	\N	6	4	1	Отличный ремонт.	2399
2059	56	529	9	45	а	4	10	5000000	83	\N	\N	\N	\N	4	1	евроремонт, мебель	2400
2060	56	483	9	46	А	1	5	1600000	56	\N	\N	0	13	4	0	нат.пот.,пл. окна	2401
2061	56	429	9	53	\N	6	12	3900000	130	\N	\N	0	13	3	1	перепланировка, бол. кухня, предчистовая	2402
2062	56	271	9	60	\N	5	5	1700000	60	\N	\N	\N	13	4	1	гардиан, обычное состояние	2403
2063	56	371	9	66	\N	3	14	2500000	74	\N	\N	\N	13	4	1	пустая, ч/п	2404
2064	56	430	9	66	\N	3	14	2700000	74	\N	\N	0	13	4	1	Пустая. Чистая продажа	2405
2065	56	405	9	70	в	3	5	2050000	0	\N	\N	\N	\N	4	0	отличный ремонт	2406
2066	56	481	9	76	А	1	5	1650000	60	\N	\N	\N	6	4	1	обычное	2407
2067	56	340	9	82	Б	1	5	1750000	59	\N	\N	0	\N	4	0	с ремонтом	2408
2068	56	340	9	94	\N	6	9	2450000	65	\N	\N	1	\N	4	1	пл.ок.,	2409
2069	56	287	9	94	\N	9	9	2350000	66	\N	\N	0	\N	4	1	хор.ремонт, водонагреватель,шкаф- купе	2410
2070	56	340	9	102	\N	8	9	2150000	0	\N	\N	0	\N	4	1	частично ремонт	2411
2071	56	488	9	106	\N	2	9	2900000	100	\N	\N	0	\N	4	1	тамбур, ч/п	2412
2072	56	364	9	106	\N	4	9	3300000	91	58	\N	\N	6	4	1	хорошее состояние, кух.гарнитур, шкаф-купе, х.торг	2413
2073	56	399	9	15	\N	1	10	2300000	66	\N	\N	\N	6	4	1	Сост.хорош. Есть погреб,чист.прод.	2414
2074	56	409	9	7	\N	10	10	3900000	128	\N	\N	\N	13	4	1	евро	2415
2075	56	269	9	1	Б	2	6	2500000	67	\N	\N	0	10	4	1	отличная, ремонт, ч/пр, фото	2416
2076	56	316	26	13	\N	5	5	1800000	59	\N	\N	\N	13	4	1	обычная, ч\\п	2417
2077	56	478	26	21	\N	5	5	1300000	59	\N	\N	0	6	4	0	сосояние обычное, торг	2418
2078	56	269	26	23	\N	12	12	1450000	65	\N	\N	0	\N	4	1	ч/пр, торг, пластиковые окна	2419
2079	56	387	26	23	\N	8	12	1800000	60	\N	\N	0	\N	4	1	отличное состояние, ремонт, всё поменяно, 2х	2420
2080	56	370	1234	13	В	2	5	1990000	54.2999999999999972	\N	\N	\N	\N	4	1	ремонт, ч/п.	2421
2081	56	269	1234	15	\N	5	5	1490000	56	\N	\N	0	\N	4	1	пл окна, обычная, ч/пр	2422
2082	56	481	1234	22	А	5	5	1450000	55	\N	\N	\N	13	4	1	обычное	2423
2083	56	477	1234	22	\N	1	5	1670000	0	\N	\N	\N	\N	4	0	\N	2424
2084	56	355	1234	32	\N	2	9	2200000	0	\N	\N	0	13	4	1	хорошая, торг	2425
2085	56	469	1234	44	\N	9	10	2350000	66.7000000000000028	\N	\N	\N	\N	4	1	состояние хорошее	2426
2086	56	350	1234	13	\N	5	5	1650000	60	\N	\N	\N	\N	4	1	состояние хорошее,торг	2427
2087	56	281	1234	28	\N	5	5	2000000	55	\N	\N	0	13	3	1	разнорядка, ремонт, ост.кухня, с\\у каф, пл.ок, хорошая, торг	2428
2088	56	281	1234	32	\N	6	10	2500000	65	\N	\N	0	13	4	1	пл.ок, с\\у  разд каф, вх.дв.нов, кухня ост, разнорядка	2429
2089	56	403	17	8	б	8	10	2550000	66	\N	\N	\N	\N	4	1	ремонт торг	2430
2090	56	387	17	8	\N	5	9	2480000	65	45	8	0	\N	4	1	ремонт, сост. хорошее, ч/пр	2431
2091	56	308	17	10	б	9	10	2600000	76	\N	\N	\N	6	4	1	состояние средние, арка	2432
2092	56	281	17	10	\N	4	7	2700000	66	\N	\N	1	6	4	1	с реморнтом, отличная, с\\у каф	2433
2093	56	371	17	14	\N	1	10	2300000	68	\N	\N	\N	\N	4	1	торг	2434
2094	56	292	17	32	Б	7	10	2700000	70	\N	\N	0	\N	4	1	хор.ремонт, встр.кухня	2435
2095	56	308	15	20	\N	1	7	2500000	68	\N	\N	\N	6	4	1	угловая, погреб,среднее состояние	2436
2096	56	313	15	30	\N	7	7	2400000	65	\N	\N	\N	6	4	1	пл.окна, натяжной потолок,кух.гар.,торг,ч\\п	2437
2097	56	282	15	59	\N	1	9	3200000	102	\N	\N	0	\N	4	1	кухня 22 кв.м, непроходная, 1 собственник, торг	2438
2098	56	474	15	59	\N	3	9	5000000	100	\N	\N	0	6	3	1	дорогой ремонт, дор.мебель, техника, ч/п	2439
2099	56	481	15	65	\N	6	9	2650000	68	\N	\N	\N	6	4	1	угловая, пласт.окна, двери поменяны	2440
2100	56	272	15	71	\N	9	10	3250000	74	\N	\N	\N	\N	3	1	кух гар, пласт окна, двери, арка, ч/пр, пустая	2441
2101	56	350	15	53	\N	5	9	4000000	103	\N	\N	\N	\N	4	1	ЕВро.ч/пр	2442
2102	56	501	15	59	\N	9	9	3200000	86	\N	\N	0	6	4	1	торг, хор.ремонт, мебель	2443
2103	56	477	18	8	\N	5	5	1500000	59	\N	\N	\N	\N	4	0	б/ремонта	2444
2104	56	424	20	45	10/10  кирп    да	10	10	3500000	93	\N	\N	\N	\N	4	1	Хорошая	2445
2105	56	424	20	45	\N	5	10	3700000	93	\N	\N	\N	\N	4	1	ремонт	2446
2106	56	529	11	1	\N	5	5	1270000	60	\N	\N	\N	\N	4	0	состояние обычное,	2447
2107	56	505	10	1	\N	4	5	1500000	60	\N	\N	\N	6	4	0	угловая ремонт	2448
2108	56	474	10	2	Б	5	5	1400000	60	\N	\N	0	6	4	0	угловая, ремонт, большая кладовая, 4-х	2449
2109	56	499	10	2	\N	4	5	1500000	60	\N	\N	0	6	4	0	сост.хор.,встр.меб, пл.окна,с\\у каф,торг	2450
2110	56	533	10	4	А	4	9	2000000	65	\N	\N	\N	\N	4	1	с хорошим ремонтом, торг	2451
2111	56	351	10	17	\N	1	9	2100000	60	\N	\N	\N	6	4	1	хор.сост, кухня 10кв.м, ремонт хороший	2452
2112	56	492	10	17	\N	7	9	2950000	75	\N	\N	0	6	4	1	евро, мебель, ч/пр	2453
2113	56	485	10	55	\N	6	9	3250000	85	\N	\N	\N	\N	4	1	обычная, окна пластик	2454
2114	56	488	14	3	\N	3	9	2600000	68.2999999999999972	\N	\N	0	6	4	1	арка,узак.перепл.,хор.,пл.ок.,вст.меб.,конд.,ч/п	2455
2115	56	294	14	5	\N	6	9	2350000	65	\N	\N	0	\N	4	1	окна и двери поменяны, ремонт	2456
2116	56	497	14	14	\N	7	9	2550000	66	\N	\N	0	6	4	1	торг,част рем,долг ФССП 175т р.	2457
2117	56	374	14	17	\N	9	9	2500000	0	\N	\N	\N	\N	4	1	\N	2458
2118	56	272	14	28	\N	1	9	2300000	65	\N	\N	\N	\N	4	1	можно под офис	2459
2119	56	340	14	44	\N	4	5	2150000	60.2999999999999972	\N	\N	0	\N	4	1	пл.ок,	2460
2120	56	435	14	52	\N	4	9	3000000	76	\N	\N	\N	6	3	1	переделана из 4-х, ремонт	2461
2121	56	532	14	61	\N	3	9	2500000	65	\N	\N	\N	\N	4	1	ОБыЧНАЯ, Ч/ПР, встроенная мебель	2462
2122	56	351	14	81	\N	9	9	2350000	65	\N	\N	\N	\N	4	1	разнорядка, ремонт хороший, чп, пустая	2463
2123	56	351	14	107	\N	9	10	2400000	65	\N	\N	\N	\N	4	1	строит хороший ремонт, 10 жилой, ипотека	2464
2125	56	271	14	109	\N	10	10	2800000	73	\N	\N	\N	6	4	1	хороший строительный ремонт	2466
2126	56	271	14	109	\N	6	10	2620000	67	\N	\N	0	6	4	1	хороший строительный ремонт, ч/пр	2467
2127	56	491	27	30	\N	2	9	2050000	65	\N	\N	\N	\N	4	1	\N	2468
2128	56	308	27	30	\N	2	9	2600000	66	\N	\N	1	6	4	1	пл.окна, гардин,с/у кафель,мебель, торг,ч/п.	2469
2129	56	308	27	30	\N	9	9	2900000	70	\N	\N	\N	6	4	1	арка, кух.гар.,шкаф купе,два болкона\\зо,ч\\п,фото,торг.	2470
2130	56	397	27	30	\N	9	9	2300000	68	\N	\N	1	6	4	1	Хор. рем. Все помен.С\\у рем Ч/п.  8-917-902-74-44 Надежда Визит	2471
2131	56	475	26	5	\N	12	12	3000000	95	\N	\N	0	13	4	1	окна,двери,пустая, 1 собств	2472
2132	56	371	26	5	\N	12	13	0	94	\N	12	\N	\N	4	1	ч/п	2473
2133	56	479	26	13	\N	5	5	1700000	0	\N	\N	\N	13	4	1	требует ремонта, пласт.окна, ч/п	2474
2134	56	370	13	14	\N	1	9	2480000	63	\N	\N	\N	\N	4	1	ремонт, ч/п	2475
2135	56	272	13	38	\N	5	5	1400000	59	\N	\N	1	\N	4	1	сост обычное, ч/пр, торг	2476
2136	56	424	13	10	\N	9	9	1950000	65	\N	\N	\N	\N	4	1	ремонт частично	2477
2137	56	387	13	38	\N	3	5	1700000	59	\N	\N	0	\N	4	1	пласт.окна, дверь "Гардиан", себе 1-но+2х	2478
2138	56	351	12	5	А	2	5	1950000	60	\N	\N	\N	\N	4	1	пл.окна, гардиан, чп, отличная	2479
2139	56	533	12	9	\N	5	5	1620000	59	\N	\N	\N	\N	4	1	ч/пр, частично ремонт,	2480
2140	56	469	12	16	а	2	5	1600000	60	\N	\N	\N	\N	4	0	обычное	2481
2141	56	474	12	35	\N	2	5	1630000	60	\N	\N	0	6	4	0	угловая,обычн.,с/у-рем.,клад.,2-х там же	2482
2142	56	402	12	35	\N	4	5	1630000	60	\N	\N	\N	\N	4	1	Обычное	2483
2143	56	265	12	45	\N	1	5	1500000	58	\N	\N	0	\N	4	\N	разнарядка, БНЧ, пл.окно, гардиан, пустая, ч/пр.,1собств.	2484
2144	56	526	12	45	\N	3	5	1650000	68	\N	\N	\N	\N	4	0	с ремонтом, кроме ванной, ч/пр, пустая, тамбур-кладовка	2485
2145	56	269	12	46	\N	8	9	2000000	65	\N	\N	0	6	4	1	пл. ок, фил. двери, кафель, кухня, спальня	2486
2146	56	351	12	52	\N	5	9	2400000	75	\N	\N	\N	\N	4	1	отличная, заезжай и живи, встр. Мебель	2487
2147	56	478	12	5	\N	5	5	1730000	59	\N	\N	1	6	3	1	состояние хорошее, сан. узел отлич. ремонт	2488
2148	56	349	8	10	\N	6	10	2420000	65	\N	\N	\N	\N	4	1	строительный ремонт,ипотека 600	2489
2149	56	369	8	14	\N	5	10	2850000	74	\N	\N	\N	\N	4	1	строительный ремонт, кух.гарнитур	2490
2150	56	291	8	16	\N	7	9	2600000	78	\N	\N	\N	\N	4	1	иптека 1000, обшит, застеклен	2491
2151	56	491	8	18	\N	2	9	2500000	66	\N	\N	\N	6	4	1	ч/пр, состояние хорошее, ипотека, торг	2492
2152	56	492	31	3	\N	5	5	1700000	59	\N	\N	0	6	4	1	отличная	2493
2153	56	308	31	11	\N	1	5	2300000	60	\N	\N	\N	6	3	\N	евро+мебель,есть фото,ч/п	2494
2154	56	351	31	11	\N	4	5	1700000	60	\N	\N	\N	6	4	1	пл.окна, Гардиан, кух.гар-р	2495
2155	56	529	31	18	\N	4	5	1650000	58	\N	\N	\N	\N	4	0	обычная, угловая с тамбуром	2496
2156	56	308	31	11	\N	5	5	1400000	60	\N	\N	\N	6	4	0	состояние средние, угловая, ч\\п.	2497
2157	56	403	20	15	а	5	5	1600000	58	\N	\N	\N	\N	3	1	хорошее	2498
2158	56	477	20	1	\N	5	12	2200000	106	\N	\N	0	13	4	1	обычное,ч/п,возможен обмен на 1-но	2499
2159	56	482	20	24	\N	9	9	2350000	72	\N	\N	0	13	4	1	перепланирована из 4-х,евро,кух.гарн.,ч/п	2579
2160	56	532	20	27	\N	6	9	2850000	115	\N	\N	\N	6	4	1	частично ремонт, ч/пр	2580
2161	56	529	20	29	\N	4	9	3000000	120	\N	\N	\N	\N	4	1	пустая, срочно или обмен на 2к квартиру	2581
2162	56	533	20	29	\N	5	9	2285000	65	\N	\N	\N	\N	4	1	обычная, обмен на 1к	2582
2163	56	436	20	24	\N	4	9	2400000	69	\N	\N	0	13	4	1	Пл.окна, гардиан, 3х из 4х, узаконена	2583
2164	56	351	19	26	\N	5	5	1500000	43	\N	\N	\N	\N	4	1	супер, заезжай и живи, всё помен, современ,встр. Мебель	2584
2165	56	481	19	26	\N	5	5	1420000	44	\N	\N	\N	\N	4	1	пласт.окна	2585
2166	56	281	19	21	А	1	5	1500000	44	\N	\N	0	6	3	0	разнорядка, нов. Ремонт, пл.ок, полы залиты, нат.пот, с\\у кафнов.проводка	2586
2167	56	294	2	6	Б	1	5	1380000	56	\N	\N	0	\N	4	0	обычная	2587
2168	56	529	2	10	\N	5	5	1450000	56	\N	\N	\N	\N	4	1	\N	2588
2169	56	364	3	3	\N	5	7	2900000	70	44	8	\N	\N	4	1	ремонт, ч/п	2589
2170	56	472	3	29	\N	2	9	2700000	67	\N	9	\N	6	4	1	угловая, отличное	2590
2171	56	399	3	9	\N	10	10	2130000	64.9000000000000057	\N	\N	\N	6	4	1	Сост.хорошее. Ост кух.гарн. Торг.	2591
2172	56	481	4	5	А	5	5	1850000	59	\N	\N	\N	6	4	1	косметич.ремонт,пласт.окна,межкомн.двери	2592
2174	56	373	4	6	\N	3	5	1900000	60	\N	\N	\N	\N	4	0	ремонт	2594
2175	56	291	4	9	\N	4	5	1550000	60	\N	\N	\N	\N	4	0	окна, двери поменяны, частично ремонт	2595
2176	56	391	4	14	\N	9	9	2330000	65	\N	\N	\N	\N	4	1	разнорядка, с ремонтом, надо 1-но	2596
2177	56	269	4	17	\N	6	9	2150000	65	\N	\N	1	\N	4	1	пл окна, фил двери, кафель	2597
2178	56	529	4	22	\N	0	0	2700000	74	\N	\N	\N	\N	4	1	\N	2598
2179	56	281	4	26	\N	5	5	1900000	59	\N	\N	0	6	4	1	пл.ок, нов.двери, ремонт, ванна кафель, торг	2599
2180	56	396	4	5	\N	1	5	2350000	60	\N	\N	1	6	4	1	2-х + доплата Евро	2600
2181	56	491	4	16	\N	2	9	2450000	65	\N	\N	\N	6	4	1	состояние хорошие	2601
2182	56	486	7	2	\N	9	9	1800000	0	\N	\N	\N	6	4	1	угловая, ремонт	2602
2183	56	373	7	12	\N	3	6	5000000	0	\N	\N	\N	13	4	1	полный ремонт, ламинат, 4 шк-купе, кух.гарнитур	2603
2184	56	477	7	12	\N	5	6	4300000	130	\N	\N	\N	13	4	1	евро, мебель	2604
2185	56	477	7	12	\N	5	6	4700000	141	\N	\N	\N	13	4	1	ремонт	2605
2186	56	271	7	13	\N	1	9	1400000	80	\N	\N	\N	13	4	1	\N	2606
2187	56	523	7	17	\N	2	5	1590000	60	\N	\N	0	\N	4	1	Обычное, пласт. Окна, встр кухня, один собственник, торг	2607
2188	56	477	7	23	\N	6	9	3600000	77	\N	\N	0	13	4	1	евро, ч/п	2608
2189	56	271	7	25	А	1	5	1950000	60	40	8	\N	6	4	1	отличный ремонт, кух.гарн.	2609
2190	56	281	7	8\\14	\N	1	9	2000000	65	\N	\N	0	6	4	1	окна пласт,вх. Дверь новая, состояние обычное	2610
2191	56	529	7	2	\N	8	9	1600000	66	\N	\N	\N	6	4	1	пустая, без ремонта	2611
2192	56	436	7	11	\N	3	5	1400000	43	\N	\N	0	6	4	0	Торг, пласт. Окна, входная дверь…	2612
2193	56	403	13	4	\N	12	12	1650000	60	\N	\N	\N	\N	4	1	перепланировка, обычная	2613
2194	56	391	7	9	\N	8	9	1225000	49	\N	\N	\N	\N	3	1	разнорядка, с ремонтом, ч.пр.	2614
2195	56	351	7	11	\N	5	5	1150000	0	\N	\N	\N	6	4	1	обычная аккуратная живут	2615
2196	56	291	7	13	А	1	5	1230000	44	\N	\N	\N	\N	4	0	окна пластик, ванна плитка, теплая	2616
2197	56	391	7	13	А	3	5	1300000	45	\N	\N	\N	\N	4	0	обычная, ч.пр.	2617
2198	56	491	7	13	А	5	5	1250000	44	\N	\N	0	6	4	1	обычная, однорядка, ч/пр	2618
2199	56	364	7	15	\N	5	9	1100000	50	\N	\N	\N	\N	4	1	пустая, торг, разнорядка	2619
2200	56	351	7	43	\N	2	9	2500000	58	\N	\N	\N	\N	4	1	оличная, разнорядка, заезжай и живи, ЧП	2620
2201	56	479	7	45	\N	2	9	1550000	0	\N	\N	1	\N	4	1	хорошее, 3-х	2621
2202	56	351	7	51	\N	8	9	1970000	0	\N	\N	\N	\N	4	1	хороший ремонт все поменяно кух гар отличный	2622
2203	56	477	7	8\\14	\N	5	9	1850000	48	28	8	0	6	4	1	обычное, ч/п	2623
2204	56	271	13	4	\N	10	12	1550000	44	\N	\N	\N	13	4	1	пл.окна	2624
2205	56	492	13	10	\N	6	9	1750000	48	\N	\N	0	6	4	1	\N	2625
2206	56	268	13	30	\N	5	5	1300000	49.1000000000000014	\N	\N	0	\N	4	1	ч/пр, 1 собственник	2626
2207	56	403	13	38	\N	5	5	1500000	50	\N	\N	\N	\N	4	1	Хорошое состояние	2627
2208	56	391	13	32	\N	5	5	1300000	47	\N	\N	\N	\N	4	1	разнорядка, кирпич ,обычная, надо 3-х	2628
2209	56	399	13	4	\N	10	12	2120000	56	\N	\N	\N	13	4	1	Хороший ремонт. Разнорядка. Ост.кух.гарн., част.мебель.	2629
2210	56	317	13	38	\N	4	5	1600000	49	\N	\N	\N	13	4	1	хорошая	2630
2211	56	351	12	2	А	5	5	1400000	44	\N	\N	\N	6	4	1	однрядка, отличная евро, пустая, чп, ключи	2631
2212	56	281	12	2	\N	2	5	1450000	46	\N	\N	0	6	4	1	разнорядка, пл.ок, с\\у кафель, кухня увеличина, ремонт, остается кухня	2632
2213	56	370	12	2	\N	3	5	1450000	44	\N	\N	\N	6	4	1	ремонт, кух.гарнитур, торг.	2633
2214	56	489	12	5	А	5	5	1450000	43	\N	\N	1	6	4	1	качественный ремонт, с мебелью	2634
2215	56	281	12	5	Б	4	5	1500000	45	\N	\N	0	6	4	1	с ремонтом, с\\у каф, разнорядка, пл.ок, остается кухня	2635
2216	56	351	12	5	\N	1	5	1250000	44	\N	\N	\N	6	4	1	ремонт хороший, бетон пол , заезжай и живи	2636
2217	56	391	12	5	\N	2	5	1550000	45	\N	\N	\N	6	4	1	однорядка, с ремонтом, ч.пр., пустая. 200 т.р. Ипотека	2637
2218	56	496	12	9	\N	1	5	1200000	44	\N	\N	1	6	4	0	окна пл., двери пом., сос.хорошее	2638
2219	56	391	12	16	А	5	5	1550000	45	\N	\N	\N	6	4	1	разнорядка, отличный ремонт, встроенная мебель	2639
2220	56	290	12	16	\N	3	5	1400000	43	\N	\N	\N	6	4	1	обычная	2640
2221	56	472	12	27	\N	1	5	1600000	0	\N	\N	\N	6	4	1	разнорядка, полный ремонт, мебель, 4-х 84 с.	2641
2222	56	475	12	27	\N	4	5	1350000	45	\N	\N	\N	6	4	1	однорядка,окна пласт,обычное состояние	2642
2223	56	474	12	27	\N	5	5	1200000	44	27	6	0	6	4	1	подг.к ремонту(пл.ок.,вх.дв.пом.),ч/п,пуст.(ключи)	2643
2224	56	281	12	31	\N	1	5	1650000	45	\N	\N	0	6	4	1	разнорядка, пл.ок, с\\у кафель, остается кухня, погреб	2644
2225	56	269	12	41	А	8	9	1750000	50.7000000000000028	\N	\N	1	6	4	1	торг, частично ремонт, ввариант подобран	2645
2226	56	424	12	1	\N	11	12	1570000	47	\N	\N	1	6	4	1	все поменяно, комнаты смежные	2646
2227	56	342	12	2	А	4	5	1200000	46	\N	\N	0	6	4	0	ремонт, разнорядка	2647
2228	56	469	12	41	\N	3	5	1480000	46	\N	\N	\N	6	4	1	\N	2648
2229	56	492	8	6	\N	8	10	2050000	54	\N	\N	1	6	4	1	пустая, ч/пр	2649
2230	56	271	8	4	\N	9	10	2150000	58	32	9	\N	6	4	1	новый дом, хор.стр.ремонт, разнарядка	2650
2231	56	529	8	16	\N	1	10	2200000	54	\N	\N	\N	13	4	1	с ремонтом	2651
2232	56	403	8	16	\N	10	10	1800000	48	\N	\N	\N	6	4	1	Обычное (ипотека 600)	2652
2233	56	474	8	16	\N	5	10	2000000	54	\N	\N	0	6	4	1	стр.рем.,пл.ок.,ч/п,1соб.,ипот.(500 ПАО"НШЗ")	2653
2234	56	269	8	20	\N	3	10	2000000	53	\N	\N	0	6	4	1	ипотечная, строительный ремонт, торг	2654
2235	56	503	31	2\\18	\N	2	9	1520000	50	\N	\N	0	6	4	1	пл.окно, вх.дверь, без рем.Ч.ПР.	2655
2236	56	469	20	14	Б	5	5	1500000	44	\N	\N	\N	6	4	1	Супер ремонт	2656
2237	56	477	20	1	\N	5	12	2200000	106	\N	\N	0	13	4	1	обычное, ч/п	2657
2238	56	475	20	13	\N	1	9	1550000	50	\N	\N	0	13	3	0	окна,двери,потолки,кухня S=10	2658
2239	56	435	20	14	\N	1	5	1350000	44	\N	\N	0	13	4	0	Пластиковые окна, отл.состояние	2659
2240	56	397	20	19	\N	7	9	900000	34	\N	\N	1	13	3	0	Хороший ремонт. В ванне ремонт.  Опека.	2660
2241	56	371	20	20	А	4	5	1350000	45	\N	\N	\N	\N	4	1	не проходная, ч/п	2661
2242	56	488	20	25	\N	5	9	970000	35	\N	\N	\N	13	3	1	хорошее, ч/п, пустая	2662
2243	56	496	20	25	\N	7	9	1050000	35	\N	\N	1	13	3	0	торг., с\\у рем., нат.потол., вход.гар.	2663
2244	56	431	20	30	\N	1	5	1300000	44	\N	\N	0	6	4	0	Хороший ремонт. Торг	2664
2245	56	340	20	31	\N	8	10	2150000	48	27	8	0	\N	4	1	пл.ок, дв.поменяны, с/у плитка, кух.гарн., шк-купе	2665
2246	56	397	20	38	\N	1	5	1180000	56	\N	\N	1	13	3	0	Отличный ремонт.	2666
2247	56	272	20	41	\N	1	9	1650000	50	\N	\N	0	\N	4	1	плас окна,меж дв, нат пот,кух гар, торг	2667
2248	56	484	20	45	\N	10	10	3180000	76	\N	17	0	13	4	1	отличное, мебель, водонагреватель, ч/п	2668
2249	56	500	20	45	\N	10	10	3200000	76	40	17	0	13	3	1	ЭЛИТНА, мноур\\потолок,2ванные,встр\\меб,парк\\место	2669
2250	56	500	11	1	А	7	9	1830000	68	\N	\N	0	6	4	1	ремонт, пл\\ок, м\\дв, линол, кафель, к\\гарн,кладовка	2670
2251	56	351	11	5	\N	1	5	1200000	43	\N	\N	\N	6	4	\N	разнорядка все поменяно аккуратная с мебелью	2671
2252	56	333	11	45	\N	7	9	1900000	49	\N	\N	0	6	4	1	сост.норм, ч/пр	2672
2253	56	294	10	13	\N	1	10	2350000	48.1000000000000014	\N	\N	0	6	4	1	строительный ремонт, ч/пр.	2673
2254	56	501	10	14	\N	7	9	1750000	48	\N	\N	0	6	4	1	пл.окна, ламинат, двери пом.,	2674
2255	56	316	10	17	\N	8	9	1720000	48	\N	\N	\N	6	4	1	состояние обычное, фото	2675
2256	56	368	10	23	\N	3	10	2530000	61	\N	\N	\N	6	4	1	ч/п	2676
2257	56	526	10	32	\N	8	9	1830000	48	\N	\N	\N	6	3	1	с ремонтом, кроме ванной, окна, двери заменены СРОЧНО	2677
2258	56	397	10	2	Б	1	5	1250000	46	\N	\N	0	6	4	0	Хороший ремонт. Все поменяно. 1 собственник. Ч/п	2678
2259	56	387	14	5	\N	4	9	2080000	48	28	8	0	\N	4	1	пласт.окна, кафель, себе 3-х и ли 4-х	2679
2260	56	391	14	5	\N	4	9	2000000	48	\N	\N	\N	\N	4	1	ремонт. Надо 3-х: Мира 3,5,17, Шинников 31	2680
2261	56	373	14	6	\N	1	9	1600000	42	\N	\N	\N	6	4	1	окна, двери поменяны	2681
2262	56	500	14	14	\N	6	9	2400000	67.7000000000000028	\N	\N	0	\N	4	1	частичн.ремонт, 2 пл\\ок, 1 нат\\пот, м\\дв,кафель	2682
2263	56	436	14	28	\N	8	9	1950000	43	\N	\N	0	6	4	1	Обычная	2683
2264	56	497	14	70	\N	1	10	2550000	65	\N	\N	0	6	4	1	окна, двери, с\\у каф, торг	2684
2265	56	291	14	74	\N	4	9	2200000	53	\N	\N	\N	6	4	1	окна, двери поменяны	2685
2266	56	434	14	105	\N	1	9	2100000	53	\N	\N	1	6	4	0	Пл.окна,натяжные потолки	2686
2267	56	507	14	77	\N	3	10	2100000	47	\N	\N	\N	6	4	1	Отл. Сост ипотека 1300000 Сбербанк	2687
2268	56	505	14	61	\N	4	9	2150000	48	\N	\N	\N	6	4	1	ремонт	2688
2269	56	292	27	18	\N	1	5	1850000	45	\N	\N	0	6	4	1	разнарядка, отлич.погреб, отл.ремонт, кухня, купе, торг	2689
2270	56	269	27	30	\N	1	9	1850000	48	\N	\N	1	\N	4	1	торг, пл окна, фил двери, ремонт	2690
2271	56	271	27	30	\N	6	9	2130000	48	\N	\N	\N	6	4	1	с ремонтом, кух.гарн.	2691
2272	56	368	27	34	\N	1	9	1800000	52	\N	\N	\N	\N	4	1	\N	2692
2273	56	387	26	3	\N	12	12	2600000	78	\N	\N	0	13	4	1	ч/пр	2693
2274	56	271	26	5	\N	5	9	2600000	79	42	12	\N	13	4	1	обычная	2694
2275	56	487	26	17	А	1	5	1050000	44	\N	\N	0	6	4	0	разнорядка,без ремонта	2695
2276	56	487	26	17	А	5	5	1400000	45.6000000000000014	\N	\N	0	6	3	1	гардиан,пл.окно,с/уз кафель,перепланировка	2696
2277	56	328	26	21	\N	2	5	1200000	44	\N	\N	0	6	4	1	обычная, 1 собственник,ч/пр	2697
2278	56	349	26	3	\N	11	12	2350000	78	\N	\N	\N	13	4	1	ч/пр, пл.окна,двери поменены	2698
2279	56	489	1234	1	А	5	5	1200000	46	\N	\N	1	6	4	1	качественный ремонт, с мебелью	2699
2280	56	296	1234	5	\N	4	4	1350000	44	\N	\N	\N	\N	3	\N	ЕВРО, ч/пр	2700
2281	56	481	1234	6	Б	4	5	850000	34	\N	\N	\N	13	3	0	отличное	2735
2282	56	369	1234	7	\N	2	5	1250000	41	\N	\N	\N	\N	3	1	ремонт, кухонный гарнитур, торг	2736
2283	56	269	1234	7	\N	3	5	1250000	42	\N	\N	0	\N	3	0	обычная, ч/пр, ключи	2737
2284	56	508	1234	11	В	4	5	1370000	43	26	7	1	13	3	1	отл.сост. Все помен. Док.гот. Торг уместен	2738
2285	56	500	1234	13	Б	3	5	1350000	43.2000000000000028	\N	\N	0	\N	3	1	вх\\дв и трубы поменяны,обычн,косм.рем,ч\\пр,1собств	2739
2286	56	526	1234	13	Б	4	5	1150000	44	\N	\N	\N	\N	3	1	обычная, пустая, ч/пр, без торга	2740
2287	56	351	1234	20	А	5	5	1220000	43	\N	\N	\N	6	3	1	окна двери поменяны линолеум ЧП пустая	2741
2288	56	530	1234	21	\N	1	5	1100000	44	\N	\N	\N	\N	3	0	вх.дверь новая, кафель, ремонт частично, ипотека 400 тр	2742
2289	56	351	1234	32	\N	4	9	1900000	52	\N	\N	\N	\N	4	1	ремонт хороший, тамбур	2743
2290	56	271	1234	33	А	5	5	1300000	42	\N	\N	1	13	4	1	комнаты раздельные, обычная, чистая	2744
2291	56	501	1234	22	\N	5	5	1150000	44	\N	\N	0	13	3	0	окна пластиковые, чистенькая	2745
2292	56	478	1234	52	\N	1	9	1920000	48	\N	\N	1	6	4	1	отличный ремонт	2746
2293	56	435	1234	11	Б	5	5	1100000	46	\N	\N	0	6	3	1	Обычная	2747
2294	56	435	1234	11	В	5	5	1250000	44	\N	\N	0	6	3	1	Пл.окна,комнаты проходные ,однорядка	2748
2295	56	434	1234	13	В	5	5	1400000	45	\N	\N	0	6	3	1	Отличная + Подарок Кух. Гарнитур	2749
2296	56	491	1234	46	\N	7	9	1750000	0	\N	\N	\N	13	4	1	обычная, торг	2750
2297	56	404	17	8	Б	6	9	1650000	48.7999999999999972	\N	\N	\N	6	4	1	ремонт частично	2751
2298	56	340	17	10	\N	4	9	1970000	50	\N	\N	1	6	4	1	пл.окна, кафель,дв.гард.	2752
2299	56	529	17	12.	\N	6	9	2300000	0	\N	\N	\N	6	4	1	торг	2753
2300	56	282	17	16	\N	1	9	1750000	51	\N	\N	0	6	4	1	обычная, торг	2754
2301	56	482	17	16	\N	1	9	1720000	54	\N	\N	\N	6	4	1	ипотечная (долг 850)	2755
2302	56	364	17	16	\N	3	10	2050000	52	\N	\N	\N	6	4	1	частичный ремонт, кух.гарнитур, шкаф-купе	2756
2303	56	265	17	17	\N	4	9	1300000	42	\N	\N	0	\N	4	0	встр.кухня, мебель, ремонт, пустая, ч/пр.	2757
2304	56	481	17	47	\N	9	10	2100000	0	\N	\N	\N	6	4	1	хорошее	2758
2305	56	396	17	8	Б	6	10	2250000	52	\N	\N	0	6	4	1	ч/пр, 1 собственник, ремонт отличный	2759
2306	56	272	15	11	\N	9	10	2480000	56.7999999999999972	35.2999999999999972	10	\N	6	4	1	сост отлич, с мебелью	2760
2307	56	529	15	53	\N	7	9	3200000	74	13	\N	\N	6	4	1	торг	2761
2308	56	529	15	73	\N	10	10	2400000	57	\N	\N	1	6	4	1	СОСТОЯНИЕ ХОРОШЕЕ	2762
2309	56	350	15	9	\N	2	9	2250000	54	\N	\N	\N	\N	4	1	ремонт	2763
2310	56	489	18	11	\N	2	5	1300000	46	\N	\N	0	\N	3	1	без ремонта,пл. окна,дверь гардин	2764
2311	56	275	29	6	\N	1	5	1200000	45	\N	\N	\N	\N	3	1	обычное состояние, проходная	2765
2312	56	351	29	8	\N	5	5	1200000	0	\N	\N	\N	6	3	1	окна двери поменяны, ремонт свежий	2766
2313	56	405	29	10	\N	4	5	1290000	44	\N	\N	\N	6	3	1	Обычная 200 т.р ипотека	2767
2314	56	526	29	11	\N	3	5	1420000	44	\N	\N	\N	\N	3	1	с ремонтом, переплан, 2 широких балкона, изолиров.	2768
2315	56	486	29	12	\N	1	5	1350000	0	\N	\N	\N	\N	3	1	хорошее	2769
2316	56	469	29	17	\N	1	5	1550000	44	\N	\N	\N	\N	3	1	\N	2770
2317	56	403	29	17	\N	4	5	1250000	0	\N	\N	\N	\N	3	1	хорош. Ремонт в 1 ком	2771
2318	56	477	29	20	\N	5	5	1190000	43	\N	\N	\N	13	3	0	ремонт	2772
2319	56	391	29	40	\N	5	5	1700000	43.5	\N	\N	\N	\N	3	1	разнорядка, отличный ремонт, сан.узел-кафель	2773
2320	56	403	29	12	\N	5	5	1450000	43	\N	\N	\N	\N	3	1	хор рем	2774
2321	56	272	53	21	\N	5	9	2700000	59	14	\N	1	\N	4	1	кух гарнитур, 2 шкафа, ипотека	2775
2322	56	475	9	1	Б	6	6	2700000	70	\N	\N	0	10	4	1	разнарядка,ремонт,кух.гарнитур,шкафы-купе	2776
2323	56	281	9	1	Б	9	9	2500000	80	\N	\N	0	10	4	1	с ремонтом, с\\у пл, больш.кухня, ост.кухня и кондициоер	2777
2324	56	271	9	1	\N	3	10	3400000	80	\N	\N	\N	13	3	1	отличный ремонт, мебель	2778
2325	56	505	9	4	\N	11	12	1600000	49	\N	\N	\N	13	4	1	состояние обычное	2779
2326	56	508	9	6	А	5	5	1420000	44	27	7	0	6	4	1	отл.сост. Все помен. Док.гот. Торг уместен	2780
2327	56	489	9	8	А	4	5	1650000	44	\N	\N	0	6	4	1	качественный ремонт, с мебелью	2781
2328	56	505	9	8	А	4	5	1520000	44	\N	\N	\N	6	4	1	отличное состояние	2782
2329	56	485	9	8	\N	9	9	1850000	48	\N	\N	\N	6	4	1	с хорошим ремонтом	2783
2330	56	272	9	22	\N	8	12	1700000	48.2999999999999972	30.3999999999999986	8.40000000000000036	1	6	4	1	плас окна,меж дв, нат пот,кух гар,шкаф	2784
2331	56	387	9	24	\N	5	9	1660000	48	28	8	\N	6	4	1	пласт.окна, кафель, обшит балкон	2785
2332	56	351	9	24	\N	9	9	1480000	0	\N	\N	\N	6	4	1	аккуратная, взрослый собственник	2786
2333	56	281	9	36	А	5	5	1280000	44	\N	\N	0	6	3	1	ремонт, с\\у совм хор.каф, нат.потол.в зале. Пласт.ок, нов.вх.дверь, ост.кухгя	2787
2334	56	530	9	44	\N	2	5	1450000	43	\N	\N	\N	\N	3	1	хорошее сост., ч/пр, торг	2788
2335	56	486	9	54	\N	3	5	1700000	41	\N	\N	1	\N	3	1	комнаты раздельные, чистое, ипотечная (700)	2789
2336	56	544	9	56	\N	1	9	2200000	67	\N	\N	0	13	4	1	Отличный ремонт. Кухня-студия. 1 собственник	2790
2337	56	351	9	58	\N	2	5	1250000	44	\N	\N	\N	\N	3	0	отличная все и ремонт и встроен мебель	2791
2338	56	366	9	72	Б	2	5	1320000	44.7000000000000028	\N	\N	\N	6	4	1	торг, пустая, ключи	2792
2339	56	351	9	72	Д	3	5	1330000	45	\N	\N	\N	6	4	1	хор. Ремонт, окна двери поменяны, чп, непр. Пустая	2793
2340	56	367	9	78	В	5	5	1300000	44	\N	\N	\N	6	4	1	не проходная, част.ремонт, ванная отличная	2794
2341	56	340	9	82	Б	5	5	1350000	44	26	6	0	\N	4	1	ч/пр, пл.окна, разнорядка	2795
2342	56	291	9	95	\N	1	9	1900000	48	\N	\N	\N	6	4	1	окна, двери поменяны	2796
2343	56	481	9	100	\N	1	5	1600000	44	\N	\N	\N	6	4	1	хорошее	2797
2344	56	499	9	110	\N	3	9	1600000	51	\N	\N	0	6	4	1	сост.сред., вх.дверь гардиан, торец	2798
2345	56	328	9	104	\N	2	5	1700000	44	\N	\N	0	6	4	1	хор.ремонт,кух.гарнитур,балкон обшит	2799
2346	56	391	9	16	Б	4	9	1220000	48	\N	\N	\N	\N	3	1	с отличным ремонтом, надо 1-но	2800
2347	56	529	9	70	Г	1	5	1000000	46	\N	\N	\N	6	4	0	б\\б, разнорядка, убитая	2801
2348	56	351	9	70	Г	5	5	1250000	0	\N	\N	\N	6	4	1	отличная, разнорядка	2802
2349	56	431	9	5	\N	2	9	2550000	70	\N	\N	0	13	4	1	Отличный ремонт	2803
2350	56	434	9	6	\N	11	12	1630000	49	\N	\N	0	13	4	1	Хороший ремонт. Торг	2804
2351	56	483	9	8	\N	4	9	1850000	48	\N	\N	0	6	4	1	евро ремонт,мебель	2805
2352	56	282	24	5	А	1	5	1100000	46	\N	\N	0	\N	4	1	обычная, торг	2806
2353	56	482	24	5	А	4	5	1380000	44	\N	\N	\N	\N	4	1	пласт.окна, двери поменяны, хор.линолеум	2807
2354	56	529	24	1\\25	\N	10	10	1000000	39	\N	\N	\N	\N	4	1	без ремонта	2808
2355	56	272	24	1\\25	\N	5	12	1100000	40	\N	\N	1	\N	4	1	сост. хор, пласт. окна, нат.потолок	2809
2356	56	271	30	10	\N	8	9	2100000	53	\N	\N	\N	6	4	1	хороший ремонт	2810
2357	56	271	1233	3	А	7	9	2450000	58	32	10	\N	6	4	1	строительный ремонт	2811
2358	56	434	1233	3	Б	2	9	2850000	62	\N	\N	1	6	4	1	Полный ЕВРОРЕМОНТ	2812
2359	56	492	1233	13	А	3	9	2500000	57	\N	\N	0	13	4	1	ремонт	2813
2360	56	368	1233	38	\N	6	10	2390000	57.2999999999999972	\N	\N	\N	\N	4	1	ч/п	2814
2361	56	368	1233	38	\N	6	10	2580000	64	\N	\N	\N	\N	4	1	ч/п	2815
2362	56	281	1233	44	\N	8	9	1850000	48	\N	\N	0	6	4	1	обычное состояние, ок.плакст	2816
2363	56	424	1233	47	\N	8	9	2100000	48	\N	\N	0	6	4	1	все поменяно, отличная, один собст, торг	2817
2364	56	355	1233	81	\N	4	5	1650000	44	\N	\N	0	6	4	1	ч\\пр, хорошая, мебель,	2818
2365	56	409	1233	1	\N	1	9	1990000	48	\N	\N	\N	\N	4	1	ремонт,торг	2819
2366	56	409	1233	79	\N	7	9	1680000	54	\N	\N	\N	\N	4	1	обычная	2820
2367	56	505	1233	75	\N	9	9	1750000	48	\N	\N	\N	6	4	1	ремонт	2821
2368	56	271	23	3	А	1	5	1350000	42	\N	\N	0	13	3	0	пласт.окна, нат.пот., зал+кухня	2822
2369	56	530	23	11	\N	5	5	1100000	44	\N	\N	\N	\N	4	1	с ремонтом	2823
2370	56	435	19	1	\N	5	5	1180000	44	\N	\N	\N	6	3	1	Ван. рем, проходная, в кухне пл. окна	2824
2371	56	481	19	9	А	5	5	1400000	44	\N	\N	\N	\N	3	1	отличное	2825
2372	56	317	19	9	\N	3	5	1200000	45	\N	\N	\N	13	3	1	обычная, проходная, ипотека	2826
2373	56	291	19	10	\N	5	5	1500000	44	\N	\N	\N	\N	3	1	не проходная полный ремонт	2827
2374	56	485	19	9	В	5	9	1250000	35	\N	\N	\N	\N	3	1	окна пластик, двери, ремонт	2828
2375	56	431	19	19	\N	1	5	1230000	30	\N	\N	1	13	3	1	отличный ремонт, техника остается	2829
2376	56	271	19	19	\N	5	5	930000	30	\N	\N	0	\N	3	1	пл.окна, обычное состояние	2830
2377	56	266	19	36	\N	1	5	1050000	35	\N	\N	0	\N	3	1	косм.ремонт, ипотека 600 т.р., ч/пр.	2831
2378	56	491	19	36	А	1	5	950000	0	\N	\N	\N	\N	3	1	пл. окна, кух. гарнитур	2832
2379	56	351	6	6	\N	2	9	1600000	54	\N	\N	\N	\N	4	1	отличный новый ремонт, встроен мебель	2833
2380	56	424	6	9	\N	5	9	1500000	62	\N	\N	0	13	4	0	обычная	2834
2381	56	342	6	16	\N	12	12	3200000	67	\N	\N	0	\N	4	1	Евроремонт, эксклюзив	2835
2382	56	342	6	19	\N	4	9	2050000	59	\N	\N	0	\N	3	1	строительный ремонт, чистая продажа	2836
2383	56	526	2	4	\N	2	5	1500000	44	\N	\N	\N	\N	4	0	с хорошим ремонтом, встр.мебель	2837
2384	56	366	2	17	\N	4	9	1600000	0	\N	\N	\N	\N	4	1	все поменяно, кухонный гарнитур	2838
2385	56	492	2	17	\N	4	9	1700000	46	\N	\N	0	6	4	1	отличная, все новое	2839
2386	56	351	2	21	\N	5	5	1200000	43	\N	\N	\N	\N	4	1	однорядка не проходная,чистенькая	2840
2387	56	478	2	9	\N	1	5	1470000	43	\N	\N	\N	6	3	0	хороший ремонт	2841
2388	56	308	3	28	\N	1	9	2100000	52	\N	\N	\N	6	4	1	состояние отличное, торг, фото	2842
2389	56	281	3	23	\N	8	10	2600000	56	\N	\N	0	6	4	1	ремонт, с\\у кафель, отл.состояние, 2 балкона, нат.пот, ламинат, теп.пол	2843
2390	56	349	3	3	\N	1	9	2350000	48	\N	\N	\N	6	4	1	супер ремонт,погреб оформлен	2844
2391	56	492	4	6	\N	5	5	1500000	44	\N	\N	0	6	4	1	отличная, надо 1к	2845
2392	56	271	4	13	\N	1	5	1350000	45	\N	\N	\N	6	4	0	пласт.окна, обычное состояние	2846
2393	56	281	4	17	\N	3	9	1850000	48	\N	\N	0	6	4	1	ремонт, с\\у кафель, отл.состояние	2847
2394	56	369	4	17	\N	6	9	1850000	0	\N	\N	\N	\N	4	1	ремонт, кухонный гарнитур, шкаф-купе, торг	2848
2395	56	351	4	17	\N	9	9	1500000	0	\N	\N	\N	\N	4	1	аккуратн, пустая, чп, док-ты готовы, ключи сразу	2849
2396	56	505	7	2	\N	1	9	1800000	54	\N	\N	\N	6	4	1	ремонт	2850
2397	56	481	7	7	\N	9	9	1300000	48	\N	\N	\N	13	3	1	пласт.окна, двери поменяны	2851
2398	56	544	1233	21	\N	1	9	4500000	137	\N	\N	0	13	4	1	Отл. Еврорем. Остается вся совр.мебель и техника. 1 собст.	2860
2399	56	544	9	12	\N	9	10	2500000	81.2999999999999972	\N	\N	\N	6	4	1	Отличная, остаеться мебель	2861
2400	56	575	17	10	\N	4	9	2400000	66	\N	\N	\N	6	4	1	ч/пр, состояние хорошее, торг	2862
2401	56	574	20	36	\N	6	9	200000	13	\N	\N	1	\N	4	0	ч\\пр	2863
2402	56	574	20	15	А	1	5	1000000	35	\N	\N	\N	\N	3	1	\N	2864
2403	56	574	1234	22	А	5	5	950000	0	\N	\N	\N	\N	4	1	\N	2865
2404	56	574	3	29	\N	7	10	2800000	66	\N	\N	\N	\N	3	1	хороший ремонт	2866
2405	56	574	15	22	\N	3	9	2800000	66	\N	\N	\N	\N	3	1	хороший ремонт	2867
2406	56	387	46	1	\N	2	5	750000	32	\N	\N	0	6	3	1	пласт.окно, входная "Гардиан", ч/пр	3095
2407	56	364	55		\N	7	9	1000000	12	\N	\N	\N	\N	2	\N	с ремонтом, торг	3096
2408	56	352	1297		\N	0	0	2000000	34	\N	\N	\N	\N	\N	\N	отл/рем,дешево	3097
2409	56	371	66		\N	2	3	2200000	43	\N	14	\N	\N	\N	0	ремонт, кух.гарнитур, шкаф-купе	3098
2410	56	365	68	26	\N	3	5	1900000	36.3999999999999986	20.3999999999999986	\N	\N	\N	\N	1	ч/п, Авиастроительный район	3099
2411	56	391	69	40	\N	6	13	4250000	40	\N	\N	\N	\N	4	\N	ремонт, мебель	3100
2412	56	268	84	28	\N	5	5	2600000	47	\N	\N	0	\N	\N	\N	\N	3101
2413	56	391	97	15/48	\N	4	4	4200000	117	\N	\N	\N	13	4	1	кирпич. 3 окна в зале	3102
2414	56	271	86		\N	2	5	1200000	42	\N	\N	\N	\N	\N	\N	Давыдова 32	3103
2415	56	431	57	55	\N	4	5	500000	21	\N	\N	1	13	4	0	комната в 3-х комн	3104
2416	56	387	56	1\\17	\N	5	9	600000	18	\N	\N	\N	\N	\N	\N	состояние хорошее	3105
2417	56	271	58	32	\N	2	3	1500000	0	\N	\N	\N	\N	\N	\N	\N	3106
2418	56	470	45	15	\N	1	2	550000	0	\N	\N	\N	\N	\N	0	обычное	3107
2419	56	282	47	7	\N	2	2	650000	30	\N	\N	\N	\N	\N	0	евроремонт	3108
2420	56	272	47	7	\N	1	2	600000	30.3999999999999986	\N	\N	0	\N	4	0	плас окна, шкаф-купе, или обмен на м/с	3109
2421	56	481	46	5	\N	3	5	700000	36	\N	\N	0	6	3	1	среднее, ч/п	3110
2422	56	403	46	3	\N	5	5	650000	0	\N	\N	\N	\N	\N	1	обычное	3111
2423	56	498	46	1	\N	5	5	1100000	44	\N	\N	\N	\N	3	1	кух.гар., шкаф-купе, все пом., сос. Отл	3112
2424	56	370	47	10	\N	2	2	1200000	46	\N	\N	\N	\N	\N	1	ремонт(фото есть), торг	3113
2425	56	269	47	14	\N	2	2	1050000	0	\N	\N	\N	\N	\N	1	ремонт, пл окна, фил двери, современ кафель, ч/пр	3114
2426	56	271	45		\N	1	2	1250000	45	\N	\N	\N	\N	\N	1	част.ремонт	3115
2427	56	489	45		9	2	2	950000	42	\N	\N	0	\N	3	\N	ремонт,пл.окна, обмен на город 1-2х	3116
2428	56	350	46	5	\N	2	5	1200000	57	\N	\N	\N	\N	4	1	\N	3117
2429	56	434	45	1	\N	1	2	750000	44	\N	\N	0	13	4	1	хор.ремонт, земля 1сот.	3118
2430	56	429	46	3	\N	3	5	1150000	60	\N	\N	0	13	4	1	пл. окна, дв.фил, обмен на город	3119
2431	56	439	46	4	\N	2	2	1230000	59	\N	\N	0	13	4	1	отлич.ремонт, мебель	3120
2432	56	405	46	5	\N	3	5	1050000	58	\N	\N	\N	\N	4	1	Тогр. Чистый,аккуратный ремонт.	3121
2433	56	391	46	3	\N	4	5	1100000	60	\N	\N	\N	\N	4	1	разнорядка, СРОЧНО, ч.пр.	3122
2434	56	532	46	5	\N	1	5	950000	60	\N	\N	\N	\N	\N	0	окна пластик, ч/пр	3123
2435	56	397	46	4	\N	2	2	1150000	59	\N	\N	1	\N	4	1	Хорошее сост. Все помен.+ Земля 1 сот.	3124
2436	56	292	46	3	\N	4	5	1100000	57	\N	\N	0	\N	4	1	хорошая, ч/пр., торг, обмен 1к Н-камск	3125
2437	56	265	46	6	\N	1	2	1000000	40	\N	\N	0	\N	4	0	пл.окна, дв., кафель, ремонт,ч/пр., 1собств.,	3126
2438	56	530	1266	1	\N	1	5	900000	43	\N	\N	\N	\N	4	\N	не проход.,с/у разд.,торг, обмен на город	3127
2439	56	486	45		\N	1	2	1100000	0	\N	\N	\N	\N	\N	1	очень хорошее, свой участок с баней	3128
2440	56	475	42	1\\19	А	7	9	700000	30	\N	\N	\N	\N	\N	0	обычное, пустая	3129
2441	56	475	42	1\\38	А	2	3	780000	31	\N	\N	\N	\N	\N	0	окна пласт	3130
2442	56	508	42	1\\09	\N	4	5	650000	30	\N	\N	0	\N	3	1	окна пл,дверь пом., ост. Обычн.,торг,1соб	3131
2443	56	478	41	2\\12	\N	1	5	900000	38	\N	12	\N	\N	\N	1	кухня 12 кв.м.	3132
2444	56	484	42	2\\13	\N	5	5	650000	30	\N	\N	0	6	\N	1	пласт.окна,вход.дверь поменяна,ч/п,1собственник	3133
2445	56	523	41	1/19 В	\N	8	9	750000	36	\N	\N	0	\N	4	0	пласт окна,ч/пр, обычная	3134
2446	56	272	42	1\\16	\N	4	5	1500000	58	\N	\N	0	\N	\N	1	кух гарнитур, пласт окна, нат потолки,	3135
2447	56	271	42	1/16	\N	4	5	1400000	73	\N	\N	\N	6	3	1	кухня+зал, пл.окна, ремонт	3136
2448	56	308	41	2\\40	\N	2	5	1500000	71	\N	\N	\N	\N	4	1	средние	3137
2449	56	365	41	2\\11	\N	1	9	1350000	66	\N	\N	\N	\N	4	1	торг, пл.окна	3138
2450	56	287	41	2\\33	\N	7	9	1300000	66	\N	\N	\N	\N	4	1	\N	3139
2451	56	268	41	2\\11	\N	5	9	1500000	65	\N	\N	0	\N	4	1	ремонт	3140
2452	56	292	41	2\\41	\N	4	5	1200000	60	\N	\N	0	\N	3	1	отличная, 1 собственник, торг	3141
2453	56	292	41	2\\06	\N	9	9	1150000	66	\N	\N	0	\N	4	1	отличная, ч/пр.	3142
2454	56	292	42	1\\17	\N	1	5	1150000	56	\N	\N	\N	\N	4	0	шикарный евроремонт	3143
2455	56	292	41	2\\06	\N	9	9	1150000	66	\N	\N	\N	\N	4	1	отличная, ч/пр.	3144
2456	56	271	42	1/09	\N	3	5	1200000	60	\N	\N	\N	6	4	1	обычное состояние	3145
2457	56	271	41	2\\10	\N	1	9	1400000	66	\N	\N	\N	\N	4	\N	хорошее состояние	3146
2458	56	340	41	2\\12	\N	4	5	1400000	59	\N	\N	0	\N	4	1	\N	3147
2459	56	493	41	2\\02	А	1	9	1250000	64.7000000000000028	\N	\N	0	6	4	1	хорошая, двери, окна, обмен на 1к Н-ск	3148
2460	56	484	42	1\\16	\N	5	5	1380000	60	\N	\N	1	6	4	1	отлич.ремонт, 2-х там же	3149
2461	56	481	42	1\\03	\N	3	5	950000	44	\N	\N	0	6	\N	1	хорошее, разнарядка, ч/п, пустая	3150
2462	56	481	42	1\\18	А	5	5	750000	41	\N	\N	0	\N	3	0	отличное, мебель, 1 собственник, квартира НК	3151
2463	56	482	42	1\\20	\N	8	9	1300000	48	\N	\N	\N	\N	\N	1	ремонт	3152
2464	56	482	41	2\\40	\N	5	5	1000000	54	\N	\N	0	6	4	1	отличное, ч/п, 1 собственник	3153
2465	56	500	42	1/38А	\N	2	5	830000	44	\N	\N	0	\N	3	1	отл.ремонт, пл/ок,м/дв, линол, кафель,водонагр.	3154
2466	56	387	41	2\\16	\N	3	9	2000000	0	\N	\N	\N	\N	4	1	отличное сост, евро, мебель, ч/пр	3155
2467	56	387	41	2\\40	\N	4	5	1500000	0	\N	\N	\N	\N	3	1	\N	3156
2468	56	500	42	1\\38	А	2	5	830000	44	\N	\N	0	\N	3	1	пл.ок,м/дв, кафель, водонагреватель, отличный ремонт	3157
2469	56	508	41	2\\33	\N	2	9	1200000	47.3999999999999986	\N	\N	0	\N	4	1	сост.хорошее, 1собст.	3158
2470	56	508	42	1\\16	\N	5	5	890000	44	\N	\N	0	\N	4	1	Отл.сост. Или обмен на 1 или 2-х с допл. Док.гот.	3159
2471	56	396	41	2\\32	А	7	9	750000	40	\N	\N	\N	\N	4	0	пл.окна,отличная, гардиан дверь.	3160
2472	56	424	42	1\\19	А	5	9	670000	39	\N	\N	\N	\N	4	0	среднее состояние, ч/п	3161
2473	56	269	42	1/05Б	\N	3	5	950000	44	\N	\N	\N	6	\N	1	ремонт, пл окна, фил двери, современ кафель, ч/пр	3162
2474	56	269	41	2/11	\N	6	9	1250000	51	\N	\N	\N	\N	\N	1	отличная, ремонт, не проходная, все рядом	3163
2475	56	439	42	1\\04	\N	5	5	950000	44	\N	\N	0	\N	4	1	Двери поменяны, балкон обшит. Торг	3164
2476	56	436	42	1\\20	\N	7	9	950000	48	\N	\N	0	\N	4	1	обычный ремонт, гардиан	3165
2477	56	436	41	2\\30	\N	5	5	600000	41	\N	\N	0	\N	4	0	Обычная	3166
2478	56	351	42	1\\20	\N	1	9	800000	42	\N	\N	\N	\N	\N	1	БНЧ Обычка пустая, хорошее сост, разнорядка	3167
2479	56	292	41	2\\33	\N	8	9	1150000	48	\N	\N	0	\N	4	1	хороший ремонт, ч/пр.	3168
2480	56	489	41	2\\30	\N	4	9	650000	42	\N	\N	0	\N	\N	0	\N	3169
2481	56	268	42	1\\09	\N	5	5	1090000	43.5	\N	\N	0	\N	\N	1	хорошая	3170
2482	56	397	42	1\\36	\N	3	3	600000	44	\N	\N	\N	\N	4	0	Отличная, все поменяно.	3171
2483	56	281	42	1\\17	\N	1	5	1000000	44	\N	\N	\N	\N	3	1	отл.ремонт, пл.ок, нат.потолки, есть погреб	3172
2484	56	387	41	2/32	А	5	9	1600000	0	\N	\N	\N	\N	4	1	отличное сост., Евроремонт, 3-х Нижнекамск	3173
2485	56	475	42	1\\03	\N	1	5	900000	45	\N	\N	\N	\N	\N	0	окна пласт, двери, ч\\пр	3174
2486	56	491	42	1\\01	\N	4	5	800000	44	\N	\N	0	6	4	1	торг, новые двери входная и межкомн.	3175
2487	56	328	42	1/01	\N	3	5	850000	44	\N	\N	0	6	4	1	пл.окна,линолиум,кух.гар,ремонт,торг	3176
2488	56	391	204	7	А	1	2	500000	41	\N	\N	\N	\N	4	1	пласт.окна, ремонт, ч.пр., пустая	3177
2489	56	429	1269		\N	2	2	690000	42	\N	\N	\N	13	4	0	космет.ремонт,с\\у раздельно	3178
2490	56	365	204	7	\N	2	2	600000	50	\N	\N	\N	\N	\N	1	есть земельный участок	3179
2491	56	271	1269		\N	2	2	350000	50	\N	\N	\N	\N	3	1	без ремонта	3180
2492	56	375	204	1	\N	2	2	500000	52	\N	\N	\N	\N	\N	0	2 пл.окна, торг, зем.уч, можно по МК.	3181
2493	56	272	36	7	\N	1	2	950000	31	\N	\N	0	\N	3	0	сост нормальное, пласт окна,	3182
2494	56	475	36	4	\N	5	5	700000	30	\N	\N	\N	\N	\N	1	требует ремонта	3183
2496	56	436	36	3	\N	3	5	1250000	44	\N	\N	\N	13	4	1	хороший ремонт	3185
2497	56	475	36	4	\N	3	5	1300000	48	\N	\N	\N	\N	4	1	без ремонта	3186
2498	56	271	36	3	\N	2	5	1800000	61	\N	\N	1	13	4	1	состояние обычное	3187
2499	56	405	36	13	\N	2	2	1900000	57	\N	\N	\N	\N	4	1	Отл. Сост.  Возможен обмен на 3-х	3188
2500	56	403	36	17	\N	1	2	1400000	62	\N	\N	\N	\N	3	1	обычная, ТОРГ	3189
2501	56	391	35	21	\N	1	5	1350000	60	\N	\N	\N	\N	3	0	разнорядка, надо 1-но в г. Нижнекамск	3190
2502	56	271	44	4	\N	2	3	570000	45	\N	\N	\N	\N	4	1	Интернациональная, 4, косм.ремонт	3191
2503	56	282	1284		\N	1	2	550000	60	\N	\N	0	\N	\N	0	\N	3192
2504	56	501	1284		\N	3	3	800000	60	\N	\N	0	6	4	1	состояние хорошее, торг	3193
2505	56	285	44	2	\N	1	3	1000000	74	\N	\N	\N	\N	4	1	пл.окна, двери, с/у ремонт, св.отопление	3194
2506	56	492	77	24	А	10	16	4600000	48	\N	\N	0	\N	3	1	ч/пр, элит.дом, супер евро	3195
2507	56	436	95	1	\N	1	2	1000000	41.2999999999999972	\N	\N	0	13	3	0	Супер Евроремонт, теплые полы,	3196
2508	56	475	1270	1	\N	1	2	1300000	60	\N	\N	\N	\N	4	0	окна пласт,дверь вх, ч\\пр	3197
2509	56	481	1212	36	\N	2	2	1250000	48	\N	\N	1	13	4	1	хорошее, 3-х Нижнекамск	3198
2510	56	431	78	34	\N	2	5	600000	32	\N	\N	0	13	4	1	ремонт частично,вх.дверь Гардиан	3199
2511	56	349	196		\N	2	2	1000000	50	\N	\N	\N	\N	4	1	ч/пр	3200
2512	56	271	1298		\N	1	2	1050000	57	\N	\N	\N	\N	4	0	хороший ремонт	3201
2513	56	282	1296		\N	2	2	400000	48	\N	\N	0	\N	4	1	земля 4 сотки	3202
2514	56	469	54	49	\N	9	12	1870000	0	\N	\N	\N	\N	\N	1	обычное конденционер	3203
2515	56	533	88	13	\N	2	5	1350000	44	\N	\N	\N	\N	3	1	требует ремонта	3204
2517	56	470	92	62	\N	2	2	1050000	0	\N	\N	\N	\N	3	1	Отл.рем. Двери окны помен. Зем.уч 3 сот	3206
2518	56	478	92	51	\N	2	2	980000	44	\N	\N	\N	\N	3	1	ч/пр	3207
2519	56	470	92	62	\N	2	2	1000000	47	\N	\N	\N	\N	3	1	Отл. Рем. Окны двери помен. Зем.уч 3 сот	3208
2520	56	409	1214		\N	2	5	1150000	61	\N	\N	\N	\N	4	1	ул.Ахмадеева,д.17,ремонт	3209
2521	56	498	1285	35	\N	2	2	1450000	48	\N	\N	\N	\N	4	1	пл.окна, зем.уч., сарай, гараж	3210
2522	56	439	46	5	\N	3	5	750000	44	\N	\N	0	13	3	1	Хорошее состояние	3211
2523	56	530	46	1	\N	1	5	900000	43	\N	\N	\N	\N	3	0	Афанасово, норма, не проходная, торг	3212
2524	56	391	36	4	\N	1	5	1350000	45	\N	\N	\N	\N	4	0	разнорядка, с ремонтом	3213
2525	56	526	1299	14	\N	9	10	4000000	108	\N	\N	\N	\N	8	1	2-уровневая с ремонтом	3214
2526	56	271	49		\N	2	2	580000	40	\N	\N	\N	\N	\N	\N	пл.окна, обычная	3215
2527	56	489	251	5	\N	2	3	670000	68	\N	\N	1	\N	\N	1	без ремонта,на 1-х Нижнекамске	3216
2528	56	431	251		\N	1	2	790000	60	\N	\N	0	13	4	\N	хор,ремонт,с\\у раздельно + зем участок	3217
2529	56	533	1290	4	\N	2	2	1350000	67	\N	\N	\N	\N	3	1	пластик окна, сост.обычное, индив.отопление	3218
2530	56	366	1213		\N	3	3	0	114	\N	\N	\N	\N	4	1	ремонт	3219
2531	56	529	94	24	\N	2	2	1100000	42	\N	\N	\N	\N	3	1	пустая.ч/пр, остается мебель	3220
2532	56	492	2961	3	\N	7	10	3750000	57	\N	\N	0	\N	4	1	\N	3221
2533	56	477	2960	316	\N	8	9	2200000	50.8999999999999986	28	\N	\N	6	4	1	\N	3222
2534	56	486	2962	1	\N	3	5	700000	35	\N	\N	0	6	3	1	обычное, м/с Нижнекамск	3223
2535	56	436	2963		\N	9	10	3000000	60	\N	\N	0	\N	3	1	Супер ремонт, 1-я линия, окна на море, душ. каб.	3224
1608	56	405	6	4	\N	3	9	250000	13	\N	\N	0	13	10	0	Обычное состояние	1794
2536	56	347	2	6	\N	3	5	1300000	30	\N	\N	\N	\N	\N	1	\N	3371
2537	56	569	7	23	\N	2	10	1660000	41	20	10	0	13	4	1	новострой, дом сдан-2\\6\\10 эт , чит\\отд, нат\\потолки,	3372
2538	56	400	13	38	\N	3	5	920000	0	\N	\N	\N	\N	\N	1	ч\\пр, пл\\ок, торг	3373
2539	56	412	13	36	\N	5	12	1250000	36	\N	9	\N	13	3	1	\N	3374
2540	56	348	12	2	А	5	5	0	29	\N	\N	0	6	3	1	отл\\рем\\мебель	3375
2541	56	400	12	7	а	0	0	830000	0	\N	\N	\N	\N	\N	0	торг	3376
2542	56	455	20	20	\N	4	5	1080000	29	\N	\N	\N	\N	3	1	пл\\ок, хор\\рем, ч\\пр, торг	3377
2543	56	455	26	11	\N	6	12	990000	35	\N	\N	\N	\N	3	1	пл\\ок, ч\\пр, фото	3378
2544	56	390	17	51	\N	1	9	1000000	28.5	\N	\N	0	6	3	1	хорошая, надо 2-х	3379
2545	56	569	15	13	\N	7	9	1400000	35	\N	\N	0	6	\N	1	новая , чистовая отд.	3380
2546	56	346	15	42	\N	3	9	1280000	34	\N	\N	1	\N	\N	1	пл\\ок, кух\\гарн, шк\\купе	3381
2547	56	400	29	1	\N	2	5	900000	29	\N	\N	0	\N	3	1	ч\\пр, сост\\хор	3382
2548	56	348	9	76	Д	1	5	830000	29	\N	\N	0	\N	3	0	\N	3383
2549	56	346	9	20	А	5	5	1000000	35	\N	\N	1	\N	3	1	обычная	3384
2550	56	485	25	3	\N	9	10	1750000	45	\N	\N	\N	\N	\N	1	\N	3385
2551	56	390	19	10	\N	5	5	930000	29	\N	\N	0	\N	3	1	сост\\отл, торг, ипотека 700	3386
2552	56	561	4	24	А	5	5	1000000	29	\N	\N	0	6	3	1	торг, сост\\сред, пл\\ок,	3387
2553	56	506	7	19	А	2	5	1050000	29	\N	\N	0	6	3	1	хорошее	3388
2554	56	514	2	6	В	5	5	900000	29	\N	\N	\N	6	3	1	студия, хороший ремонт, с/у пластик ч/п	3389
2555	56	325	4	24	\N	5	5	1040000	29	\N	\N	0	6	3	1	хорошая	3390
2556	56	289	7	23	\N	2	10	1600000	40	\N	\N	\N	13	3	1	\N	3391
2557	56	273	7	19	А	2	5	1000000	30	\N	\N	0	13	3	1	обыч сост,торг	3392
2558	56	506	13	32	\N	5	5	1120000	33	19	\N	0	13	3	1	хорошее сострояние,ипотека 250 ТФБ,	3393
2559	56	516	13	28	\N	5	5	950000	33	\N	\N	\N	\N	3	1	окна пластиковые, дверь гардиан, ч/п	3394
2560	56	289	13	6	\N	3	9	1330000	37	20	8	\N	6	3	1	\N	3395
2561	56	273	13	30	\N	2	5	990000	33.5	\N	\N	0	13	3	1	обычная срочно	3396
2562	56	273	13	4	\N	11	12	1280000	36	\N	\N	0	13	3	1	отл рем, есть фото	3397
2563	56	264	12	16	А	4	5	1100000	29	\N	\N	0	6	3	1	отличная, новая мебель	3398
2564	56	420	20	11	А	5	5	1050000	35.5	\N	\N	1	6	3	1	вход на балкон с кухни, сост\\хор, надо 2-х 1-2 эт свой р-он	3399
2565	56	289	20	37	\N	2	9	820000	29	16	7	\N	6	3	0	\N	3400
2566	56	273	10	7	\N	5	5	880000	29	\N	\N	0	6	3	1	обычная	3401
2567	56	288	1234	46	\N	9	9	1300000	36	\N	\N	0	13	3	0	хорошее	3402
2568	56	515	1234	24	\N	4	5	960000	30	\N	\N	\N	\N	\N	1	ч\\пр, пл\\ок, с\\уз пластик	3403
2569	56	289	17	61	\N	8	9	0	36	\N	\N	\N	6	4	1	обмен	3404
2570	56	289	29	30	\N	5	5	980000	29	\N	\N	\N	6	3	1	\N	3405
2571	56	288	9	1	\N	4	9	1900000	66	\N	18	1	13	3	0	ремонт	3406
2572	56	426	9	86	\N	3	5	1850000	46	\N	\N	0	6	4	1	торг, обычная	3407
2573	56	264	9	36	\N	3	5	1050000	30	\N	\N	0	\N	3	1	ремонт очень хороший	3408
2574	56	264	9	76	Г	4	5	850000	29	\N	\N	0	\N	3	1	без ремонта	3409
2575	56	411	9	81/24	\N	10	10	1250000	33.2000000000000028	\N	\N	\N	\N	\N	1	торг, пл.окна, надо 1+доплата	3410
2576	56	514	9	1	\N	8	10	1600000	46	\N	\N	0	\N	3	0	ч\\пр, 1 собст, хороший ремонт	3411
2577	56	289	9	1	\N	4	10	1800000	56	\N	\N	1	13	3	0	\N	3412
2578	56	325	9	6	А	5	5	1300000	29	\N	\N	0	6	3	1	кух\\гарнт, кондиц.,мебель, отл\\рем, перепл, с\\уз кафель	3413
2579	56	509	9	22	\N	11	12	980000	0	\N	\N	0	\N	3	0	с ремонтом	3414
2580	56	509	9	8	а	4	5	1100000	0	\N	\N	0	6	3	1	\N	3415
2581	56	509	9	9	\N	1	9	1450000	0	\N	\N	0	\N	3	1	ремонт	3416
2582	56	514	25	4	Б	1	10	1400000	36	\N	\N	0	\N	\N	0	хор\\рем, с\\уз кафель, ч\\пр, торг	3417
2583	56	295	30	5	\N	5	10	1390000	33	\N	\N	0	6	3	1	1 собст, пл\\ок, нат\\потолок, кух\\гарн	3418
2584	56	264	23	3	А	4	5	1200000	29	\N	\N	1	13	3	1	ОП готовы, отл\\рем, мебель	3419
2585	56	509	19	9	\N	4	5	950000	0	\N	\N	0	\N	\N	0	с ремонтом	3420
2586	56	407	13	34	\N	1	5	990000	33	\N	\N	0	13	3	1	ч\\пр, торг	3421
2587	56	407	9	22	\N	6	12	900000	35	\N	\N	0	6	3	0	1 собст	3422
2588	56	410	9	76	Б	2	5	1000000	29	\N	\N	0	6	3	1	пл. окна, аккураная, пустая	3423
2589	56	410	1233	53	\N	1	10	1500000	33	\N	\N	0	6	3	1	пл. окна, мебель остаётся, ч/пр	3424
2590	56	414	25	11	\N	6	9	5000000	0	\N	\N	\N	6	8	1	евро	3425
2591	56	414	14	81	\N	0	0	4500000	0	\N	\N	\N	\N	8	1	евро+мебель  (3-х+2-х)	3426
2592	56	350	15	69	\N	2	9	3200000	95	\N	\N	\N	\N	4	1	\N	3427
2593	56	394	1234	3	\N	6	9	2100000	72	\N	\N	0	\N	3	1	1 соб, ипотека, нат.потолок, кух\\гарн, шк\\купе	3428
2594	56	569	20	29	\N	9	9	3200000	120	\N	\N	0	6	4	1	хор\\рем,ч\\пр, перепл 5-4 , торг	3429
2595	56	348	15	75	\N	3	9	3050000	111	\N	\N	0	6	4	1	\N	3430
2596	56	279	15	75	\N	3	9	3020000	111	\N	\N	1	\N	4	1	отлич.ремонт,обмен на 2-х + дол	3431
2597	56	480	14	66\\2	\N	3	9	3600000	120	\N	\N	0	\N	8	1	ремонт, кух.гар, спальн.гарнитур, хор.торг	3432
2598	56	286	1233	3	\N	6	7	14500000	280	\N	\N	\N	\N	9	1	мебель, парковка, 2 места	3433
2599	56	494	9	53	\N	10	11	7000000	260	\N	\N	0	13	4	1	двух-уровневая , частично ремонт, ч/пр	3434
2600	56	264	15	75	\N	3	9	3250000	111	\N	\N	0	6	4	1	отлич.ремонт	3435
2601	56	451	1233	54	\N	8	10	3500000	120	\N	\N	0	6	8	1	ч\\пр, торг	3436
2602	56	451	20	31	\N	2	9	3000000	120	\N	\N	1	6	8	1	частичный ремонт	3437
2603	56	273	15	69	\N	5	5	3370000	120	\N	\N	0	6	4	1	част ремонт, ч\\пр	3438
2604	56	414	20	1	\N	10	12	2000000	160	\N	\N	\N	13	4	1	черновая	3439
2605	56	273	30	10	\N	2	10	3150000	120	\N	\N	1	6	4	1	частично ремонт.	3440
2606	56	363	15	14	\N	2	9	3100000	124	\N	\N	\N	\N	4	1	торг, обычное состояние	3441
2607	56	363	15	14	\N	7	9	3100000	124	\N	\N	\N	6	4	1	торг, обычное состояние	3442
2608	56	339	15	75	\N	3	9	3050000	111	\N	\N	\N	6	4	1	\N	3443
2609	56	427	15	14	\N	1	9	3500000	120	\N	\N	1	6	8	1	треб\\рем, торг уместен	3444
2610	56	427	23	8	\N	10	12	5000000	187	\N	\N	0	\N	8	1	торг	3445
2611	56	425	28	2	\N	1	9	3300000	120	\N	\N	1	6	8	1	отличное	3446
2612	56	421	20	29	\N	1	12	4100000	120	\N	\N	0	6	4	1	не жилое, евроремонт, отд. вход, документы готовы	3447
2613	56	421	15	75	\N	3	10	3100000	111	\N	\N	0	\N	4	1	хороший ремонт, ч/п	3448
2614	56	421	9	7	\N	1	10	2850000	180	\N	\N	0	\N	4	1	разнорядка 3 стор, можно вывести в не жилое	3449
2615	56	357	9	38	\N	10	10	6000000	160	80	35	0	13	8	1	супер евро ремонт + мебель	3450
2616	56	414	25	11	\N	6	9	5000000	0	\N	\N	\N	6	8	1	евро	3451
2617	56	414	14	83	\N	0	0	4500000	0	\N	\N	\N	\N	8	1	евро+мебель	3452
2618	56	509	15	71	\N	1	9	2700000	0	\N	\N	\N	\N	4	1	\N	3453
2620	56	509	20	27	\N	3	9	4800000	0	\N	\N	0	\N	4	1	хор.ремонт, кух.гарнитур, люстры, шторы, шкафы-купе.	3455
2621	56	509	9	94	\N	1	9	2500000	0	\N	\N	\N	\N	4	1	\N	3456
2622	56	509	9	100	\N	1	5	2100000	0	\N	\N	\N	\N	4	1	\N	3457
2623	56	410	25	13	\N	7	9	4500000	111	\N	\N	1	6	4	1	хорошее состояние, нужны 2 (двух комнатные)	3458
2624	56	410	20	1	\N	7	10	4300000	210	\N	\N	0	13	3	1	хорошее состояние, ч\\пр	3459
2625	56	521	15	61	\N	7	9	3500000	110	\N	\N	0	\N	4	1	ремонт, кух.гарн., кондиционер, купе, отличная,арка	3460
2626	56	339	20	1	\N	7	12	2990000	146	\N	\N	\N	13	4	1	евро мебель	3461
2627	56	339	1233	9	\N	4	5	2580000	74	\N	\N	\N	\N	\N	1	обыкновенное хор. Состояние	3462
2628	56	520	25	19	\N	1	9	2700000	110	\N	\N	1	\N	4	1	не проходная, аккуратная	3463
2629	56	363	14	23	\N	1	9	2400000	89	\N	\N	\N	\N	4	1	окна поменяны	3464
2630	56	338	20	27	\N	7	9	5000000	160	\N	\N	\N	13	4	1	супер евро+мебель,	3465
2631	56	360	20	27	\N	7	9	6580000	167	\N	\N	\N	13	4	1	торг, отличная, паркет, с мебелью	3466
2632	56	301	20	27	\N	8	9	4500000	167	\N	\N	\N	13	4	1	ремонт, торг	3467
2633	56	301	1233	44	\N	9	9	2350000	86	\N	\N	0	6	4	1	проходная, тещ\\язык	3468
2634	56	263	1233	69	\N	1	9	2480000	71	\N	10	1	13	4	1	сан\\уз ремонт	3469
2635	56	422	26	5	\N	6	12	3200000	105	\N	\N	0	13	4	1	торг,состояние обычное	3470
2636	56	427	12	8	\N	5	5	1750000	753	\N	\N	0	6	4	1	ч\\пр, все поменяно	3471
2637	56	427	26	3	\N	2	13	3500000	105	\N	\N	0	13	4	1	кладовая на 1-м этаже, ч\\пр	3472
2638	56	427	9	72	В	5	5	2050000	76	\N	\N	0	6	4	1	все поменяно, ч\\пр	3473
2639	56	450	1233	44	\N	0	0	2800000	86	\N	\N	0	6	4	1	сост\\хор	3474
2640	56	293	20	27	\N	7	9	4500000	0	\N	\N	\N	13	8	1	отличное	3475
2641	56	278	12	38	\N	3	9	2550000	76	\N	\N	0	13	4	1	ремонт   торг	3476
2642	56	471	9	38	\N	7	10	7500000	176	\N	\N	0	13	4	1	Евро, все помененно, отличная	3477
2643	56	471	9	38	\N	5	10	6150000	180	\N	\N	0	13	4	1	\N	3478
2644	56	471	9	53	\N	11	11	7500000	0	\N	\N	0	13	4	1	Евро, все помененно, отличная	3479
2645	56	571	9	3	\N	4	9	9500000	124	\N	\N	0	\N	4	1	с ремонтом и мебелью	3480
2646	56	571	1233	3	\N	6	9	15000000	252	\N	\N	0	\N	4	1	все сделано, отл\\рнм, с мебелью	3481
2647	56	571	9	3	\N	5	9	7300000	170	\N	\N	0	\N	4	1	черновая отделка	3482
2648	56	390	1233	44	\N	6	9	2800000	78	\N	\N	0	\N	4	1	не проходная,  ч\\пр, сот\\хор, торг	3483
2649	56	347	19	36	\N	4	5	2600000	76	\N	\N	\N	6	4	1	полный ремонт +мебель	3484
2650	56	330	28	4	\N	2	9	2950000	120	\N	\N	0	6	4	1	ч\\пр, хор\\рем, новый кух\\гарн,	3485
2651	56	298	9	52	\N	6	9	4300000	120	\N	\N	\N	6	4	1	перепл из 5-ти, хор\\рем, 1 соб, ч\\пр, торг	3486
2652	56	506	15	75	\N	5	9	2850000	96	64	9	1	6	4	1	больш\\ кладовка, пл\\окна , с\\уз кафель,част\\рем, вар размена	3487
2653	56	506	1233	44	\N	9	9	2300000	86	\N	\N	0	6	4	1	торг, ремонт, вариант обмена на дом рядом с Н-ом	3488
2654	56	420	27	20	\N	3	9	2550000	43	\N	\N	0	13	4	1	сан\\уз кафель новый, пл\\ок,	3489
2655	56	276	15	75	\N	2	9	3050000	111	\N	\N	0	6	4	1	хорошая. или обмен на 2-х.	3490
2656	56	423	9	25	\N	10	10	3050000	118	\N	\N	0	6	3	1	хорошее сост., паркет, камин, столовая большая	3491
2657	56	270	13	30	\N	3	5	2500000	80	\N	\N	0	\N	4	1	отличная	3492
2658	56	270	9	57	\N	1	9	2600000	87	\N	\N	0	6	4	1	Без ремонта	3493
2659	56	480	9	56	\N	5	9	4200000	120	\N	\N	\N	\N	4	1	ремонт,полы паркет дубовый, кух.гарниур,торг	3494
2660	56	286	26	3	\N	2	12	3500000	103	\N	\N	0	13	4	1	обм. На 2-х свой р-н	3495
2661	56	286	9	25	\N	8	10	0	78	\N	\N	1	6	4	1	обмен на 2 однокомнатные	3496
2662	56	273	15	55	\N	5	9	3700000	120	\N	\N	1	6	4	1	хорошее сост, торг	3497
2663	56	264	12	34	\N	9	9	2500000	78	\N	\N	0	13	4	1	ремонт, мебель	3498
2664	56	264	12	52	\N	7	9	2650000	71	\N	\N	0	\N	4	1	хороший ремонт	3499
2665	56	494	9	38	\N	6	12	5300000	189	\N	\N	0	13	8	1	ремонт, мебель, ч/пр	3500
2666	56	279	1233	44	\N	9	9	2800000	84	\N	\N	0	\N	4	1	сост.отличное	3501
2667	56	411	1233	7	\N	1	10	3000000	179	\N	\N	\N	13	\N	1	черновая, ч/пр, ТОРГ	3502
2668	56	515	15	77	\N	9	9	3190000	110	\N	\N	0	6	4	1	лифт до этожа, сост\\хор, гардеробная, не проходная	3503
2669	56	289	1233	72	Б	5	5	1450000	60	\N	\N	\N	6	4	1	комн изолир	3504
2670	56	325	20	27	\N	7	10	4500000	185	\N	\N	\N	13	8	1	ч\\пр, отличная	3505
2671	56	509	24	5	а	5	5	1750000	0	\N	\N	0	\N	8	1	или обмен в этом же районе на 2-х, с 2-4 этажи	3506
2672	56	278	12	37	\N	3	5	2100000	74	\N	\N	0	6	4	1	торцевая, пл\\ок, с\\уз кафель	3507
2673	56	278	15	64	\N	5	6	3150000	84	\N	\N	0	10	4	1	ромашкой, душ.кабина, ч\\пр., торг	3508
2674	56	278	14	64	\N	2	9	3300000	82	\N	\N	0	6	4	1	не проходная, ремонт, торг	3509
2675	56	334	25	6	\N	1	10	2900000	101	\N	14	\N	\N	4	0	ипотека ГЖФ 1500,торг	3510
2676	56	427	28	4	\N	1	9	2350000	87	\N	\N	0	6	4	1	ч\\пр, 1 собст, хор\\рем, гардеробная	3511
2677	56	427	29	2	\N	4	4	1750000	60	\N	\N	0	\N	4	1	космет\\рем	3512
2678	56	427	9	52	\N	2	5	1820000	59	\N	\N	0	\N	4	1	сост\\хор	3513
2679	56	278	9	1	Б	5	6	2380000	82.4000000000000057	\N	\N	0	10	4	0	отличная, торг	3514
2680	56	278	20	21	А	1	5	1890000	54	\N	\N	0	6	4	1	торг, ипотека 650	3515
2681	56	267	20	40	\N	3	5	1390000	65	\N	\N	\N	\N	4	1	пл.окна,среднее состояние	3516
2682	56	422	3	3	\N	9	9	2320000	65	\N	\N	0	6	4	1	сост\\хор, пл\\ок, фл\\дв, разнорядка	3517
2683	56	422	3	29	\N	8	9	2800000	72	\N	\N	0	6	4	1	торг, част\\рем, 1 соб,	3518
2684	56	421	1233	67	\N	4	9	3900000	111	\N	\N	0	\N	4	1	кирп.дом, отлич.ремонт, окна на 3 стороны	3519
2685	56	421	21	2	\N	4	9	3400000	86	\N	\N	0	\N	4	1	хороший ремонт, два балкона	3520
2686	56	421	1234	25	\N	1	5	1900000	60	\N	\N	0	6	3	0	хор.ремонт	3521
2687	56	357	26	21.	\N	4	5	1450000	59	\N	\N	0	6	4	1	сост\\среднее	3522
2688	56	453	1233	53	\N	9	9	2300000	65	\N	\N	\N	6	4	1	фото	3523
2689	56	453	27	16	А	5	9	3100000	86	\N	\N	\N	6	4	1	фото, большая кухня	3524
2690	56	382	23	3	\N	4	5	1950000	55	\N	\N	1	6	4	1	торг, мебель , сост. отличное, есть фото	3525
2691	56	385	7	4	\N	5	9	2500000	71	\N	\N	0	6	4	1	1 собст, перепл.узаконена, торг, пл\\ок, все поменено	3526
2692	56	334	8	10	\N	10	10	2300000	66	\N	\N	\N	\N	4	1	хор\\рем, торг	3527
2693	56	334	9	9	Б	6	10	4000000	120	\N	18	\N	13	4	1	есть вахта, торг	3528
2694	56	450	20	3	\N	1	9	1430000	68	\N	\N	1	\N	4	0	норм.Сост. пл.окна, двери поменяны,встр. Кухня, шкаф	3529
2695	56	450	9	1	А	6	6	2550000	65	\N	\N	0	10	4	1	хорошее состояние, ч\\п.	3530
2696	56	450	1233	19	\N	3	9	2800000	0	\N	\N	0	\N	4	1	хорошее состояние, ч\\п. ,торг,с\\уз кафель	3531
2697	56	394	14	81	\N	7	9	2400000	68	\N	\N	0	\N	4	1	встр\\мебель, угловая, евро, ремонт	3532
2698	56	416	9	25	\N	2	10	2380000	64	\N	\N	\N	6	4	1	разнор, с\\уз новый кафель, хор\\рем,	3533
2699	56	283	12	36	\N	8	9	2300000	59	\N	\N	\N	13	4	1	Хорошее состояние	3534
2700	56	283	3	11	\N	9	10	2500000	65	\N	\N	1	6	4	1	част\\рем	3535
2701	56	334	23	9	\N	5	5	0	56	\N	\N	0	\N	3	0	кух\\гарн, с\\уз ремонт, не проходная	3536
2702	56	412	12	5	Б	3	5	1950000	74	\N	\N	0	\N	4	1	част. Рем, обмен на 2-х + допл	3537
2703	56	571	20	27	\N	7	9	5700000	174	\N	\N	0	13	8	1	\N	3538
2704	56	569	20	29	\N	9	9	3200000	120	\N	\N	0	6	4	1	хор\\рем,ч\\пр, перепл 5-4	3539
2705	56	360	31	11	\N	5	5	1490000	60	\N	\N	\N	6	4	1	хорошее состояние	3540
2706	56	360	20	27	\N	1	10	4300000	132	\N	\N	\N	13	4	\N	можно под офис	3541
2707	56	360	18	4	\N	4	5	1480000	59	\N	\N	0	6	4	0	хорошее состояние, пл\\ок, фл\\дв, мебель	3542
2708	56	332	15	61	\N	9	9	3200000	100	\N	\N	\N	6	4	1	ремонт кафель фото	3543
2709	56	332	24	7	\N	2	9	2100000	65	\N	\N	\N	13	4	1	ТОРГ,новый ремонт и мебель	3544
2710	56	332	28	4	\N	4	9	3000000	87	\N	\N	\N	6	4	1	ремонт кафель кух,гарн., фото	3545
2711	56	414	20	1	\N	10	12	1800000	140	\N	\N	0	13	4	1	черновая	3546
2712	56	334	28	2	\N	4	10	3500000	120	\N	\N	\N	6	4	1	отличная+мебель, торг	3547
2713	56	471	9	9	\N	3	9	3050000	80	\N	\N	0	6	4	1	Евро, все помененно, отличная	3548
2714	56	427	12	16	\N	2	5	1800000	59	\N	\N	0	6	4	1	космет\\рем	3549
2715	56	427	14	109	\N	10	10	2800000	75	\N	\N	0	6	4	1	ч\\пр, обычная	3550
2716	56	425	15	53	\N	8	9	3100000	84	\N	\N	\N	\N	4	1	отличная	3551
2717	56	263	1234	28	\N	1	5	1800000	61	\N	\N	0	\N	4	0	\N	3552
2718	56	410	27	14	\N	5	5	1150000	29	\N	\N	0	6	3	1	ремонт,мебель Ипотека (500 Акбарс)	3553
2719	56	520	9	82	Б	5	5	980000	30	\N	\N	0	6	3	1	ремонт в ванной, кух.гарнитур, хор.сост.	3554
2720	56	494	53	11	\N	3	10	1450000	40	\N	\N	\N	6	3	1	ипотека 1100 гжф	3555
2721	56	359	1234	13	в	3	5	1090000	29	\N	\N	\N	\N	3	1	сост\\хор, встр\\мебель, 1 собст	3556
2722	56	363	20	1	\N	12	12	1200000	72	\N	\N	\N	13	4	1	торг, черновая	3557
2723	56	301	28	4	\N	1	9	2350000	90	\N	\N	\N	6	4	1	перепланировка	3558
2724	56	338	4	7	Б	5	5	1400000	59	\N	\N	1	6	4	1	торг, пл\\ок, обычная	3559
2725	56	338	17	18	\N	9	10	2500000	65	\N	\N	0	6	4	1	част\\рем, ипотека 950 АК Барс , торг	3560
2726	56	301	4	24	\N	3	5	1700000	60	\N	\N	0	\N	4	0	чистенькая без гуо, или обмен на 1 кв	3561
2727	56	301	13	8	\N	9	9	1850000	0	\N	\N	\N	\N	4	1	проходная	3562
2728	56	301	12	37	\N	5	5	1950000	59	\N	\N	\N	6	4	1	хороший ремонт	3563
2729	56	301	8	16	\N	1	9	2300000	0	\N	\N	\N	6	4	1	ипотека 1000	3564
2730	56	301	14	83	\N	4	9	2800000	71	\N	\N	\N	\N	4	1	арка,	3565
2731	56	301	1234	50	\N	2	9	2250000	60	\N	\N	\N	6	4	1	обычная	3566
2732	56	301	15	59	\N	9	9	3500000	103	\N	\N	0	\N	4	1	кухня 20кв, ремонт	3567
2733	56	301	29	38	\N	3	5	1800000	0	\N	\N	\N	\N	4	0	\N	3568
2734	56	301	9	12	А	5	5	1700000	60	\N	\N	0	\N	4	1	хорошие состояние кухня 9м	3569
2735	56	509	9	110	\N	6	9	2300000	63	\N	\N	0	\N	4	1	\N	3570
2736	56	276	25	7	\N	1	9	2500000	65	\N	\N	0	6	4	1	отличная, ч\\пр	3571
2737	56	426	23	3	\N	2	5	1800000	56	\N	\N	0	\N	4	0	состояние хорошее.	3572
2738	56	426	23	3	\N	5	5	1800000	56	\N	\N	\N	\N	4	1	отличная	3573
2739	56	451	19	1	\N	2	5	2000000	80	\N	\N	0	13	8	1	из 2+2 , перепланировка, сост\\отл,торг,	3574
2740	56	407	14	109	\N	5	10	2450000	68	\N	\N	0	6	4	1	ипотека  1700, сост\\хор, торг	3575
2741	56	407	29	16	\N	7	9	1950000	57	\N	\N	0	13	4	1	950 тр ипотека , ремонт , торг	3576
2742	56	407	28	4	\N	1	9	2400000	80	\N	\N	0	6	4	1	1 собт, пл\\ок, фл\\дв	3577
2743	56	410	20	45	\N	10	10	5000000	95	\N	\N	0	13	3	1	отличная, дизайнерский ремонт, мебель	3578
2744	56	410	1234	52	\N	9	9	2400000	66	\N	\N	1	6	4	1	хорошее состояние, пл. окна,	3579
2745	56	410	29	14	\N	1	5	1380000	56	\N	\N	0	6	3	\N	хорошая, аккуратная, обмен на 2-х	3580
2746	56	410	20	27	\N	8	12	3500000	93	\N	\N	\N	13	4	1	ч пр, 2 балкона, ремонт, кухня остаётся	3581
2747	56	410	4	18	\N	5	5	1950000	60	\N	\N	0	6	4	0	отличная, мебель, конд, кух\\гарн	3582
2748	56	520	13	6	\N	5	9	2150000	61.5	\N	\N	1	6	4	1	все сделано, отличная, пл.окна, кухня	3583
2749	56	520	12	17	\N	9	9	2300000	62	\N	\N	0	13	4	1	пл.окна, хор.сост, ч\\п	3584
2750	56	521	1234	51	\N	1	9	4200000	90	\N	\N	0	13	4	1	отличная,полы с подогревом,	3585
2751	56	521	21	4	\N	2	10	3200000	83	\N	\N	0	6	4	1	рем\\част	3586
2752	56	494	3	3	\N	7	7	2450000	66	\N	\N	0	6	4	1	хорошая, вст\\кух,	3587
2753	56	494	20	27	\N	8	12	3850000	110	\N	\N	0	13	4	1	ч\\пр, ремонт,	3588
2754	56	363	20	1	\N	12	12	1650000	140	84.5	\N	\N	13	8	1	торг, черновая	3589
2755	56	359	24	5	А	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	3590
2756	56	359	31	8	\N	7	9	2190000	58	\N	\N	\N	\N	\N	1	хорошее, встр\\мебель, торг	3591
2757	56	363	20	43	\N	4	9	1150000	39	\N	\N	\N	6	3	0	хор\\рем, кух.студия,	3592
2758	56	363	20	43	\N	1	9	800000	28	\N	\N	\N	6	3	0	торг, хорошее состояние, мебель	3593
2759	56	363	26	23	\N	6	9	1200000	45	\N	\N	0	6	4	1	отличная, свеж.ремонт, торг	3594
2760	56	357	24	1\\25	\N	3	12	900000	36	\N	\N	0	6	3	1	ч\\пр, хор\\рем, пл\\ок	3595
2761	56	360	7	2	\N	1	9	950000	30	\N	\N	\N	6	4	1	обычное состояние	3596
2762	56	332	20	35	\N	5	10	850000	36	\N	\N	\N	6	4	0	ТОРГ, простая, фото	3597
2763	56	264	3	31	\N	6	9	2800000	71	\N	\N	\N	\N	4	1	пеперл. Узаконена, 1 собст	3598
2764	56	451	4	24	\N	4	5	1550000	59	\N	7	1	6	4	0	угловая,	3599
2765	56	516	4	14	\N	8	9	2400000	65	\N	\N	1	\N	\N	1	хорошая, торг	3600
2766	56	273	4	26	\N	5	5	1790000	60	\N	\N	0	13	4	0	частичный ремонт	3601
2767	56	273	7	23	\N	3	9	3500000	79	\N	\N	0	6	4	1	отличный ремонт	3602
2768	56	264	12	28	\N	7	9	2050000	58	\N	\N	0	13	4	1	торг, косм\\рем,	3603
2769	56	270	12	52	\N	9	10	2200000	62	\N	\N	0	13	4	1	Ремонт	3604
2770	56	289	12	46	\N	1	10	2000000	66	37	12	\N	6	4	1	\N	3605
2771	56	515	12	5	\N	4	5	2080000	59	\N	\N	0	6	4	1	разнорядка, отл\\рем, перепл узаконена, ч\\пр, 1 собст 2 б б\\з+обш	3606
2772	56	276	31	3	А	1	5	1800000	59	\N	\N	0	6	4	1	все поменяно	3607
2773	56	509	31	3	\N	2	5	2500000	0	\N	\N	0	6	4	0	нет ремонта в двух спальнях	3608
2774	56	426	10	6	\N	4	5	1600000	59	\N	\N	0	6	4	1	состояние хорошее.,ч\\пр	3609
2775	56	273	10	6	\N	5	5	1500000	56	\N	\N	0	13	4	1	обычное состояние	3610
2776	56	332	14	6	\N	6	9	1400000	40	\N	\N	\N	6	3	1	ТОРГ, простая, без ремонта, Отложено до 15.09.2017г.	3611
2777	56	411	14	58	\N	1	9	2500000	65.5999999999999943	\N	\N	\N	\N	4	1	Состояние среднее, однорядка, под офис	3612
2778	56	514	14	48	\N	10	10	3400000	78	\N	\N	\N	\N	4	1	из 4-х - 3, супер евро, мебель, техника, торг	3613
2779	56	264	1234	3	\N	7	9	2700000	60	\N	\N	0	6	3	1	евро ремонт, мебель,	3614
2780	56	264	1234	3	\N	5	9	2700000	60	\N	\N	0	6	3	1	евро ремонт, мебель,	3615
2781	56	532	1234	68	\N	7	9	2600000	66	\N	\N	0	\N	4	1	обычная, торг	3616
2782	56	270	15	61	\N	9	10	3100000	102	\N	\N	0	6	4	1	Отличная	3617
2783	56	273	18	13	\N	4	5	1880000	56	\N	\N	0	13	4	1	обычное состояние	3618
2784	56	286	9	23	\N	4	6	2500000	74	\N	\N	0	\N	4	1	\N	3619
2785	56	279	9	64	\N	2	9	2050000	66	\N	\N	\N	13	4	1	треб.ремонт	3620
2786	56	509	9	100	\N	4	5	2350000	0	\N	\N	0	6	4	1	с ремонтом	3621
2787	56	457	1233	66	\N	9	9	4000000	94	\N	\N	0	13	4	1	ипотека, вахта, торг	3622
2788	56	361	9	36	\N	4	5	1550000	52	\N	\N	\N	\N	4	1	\N	3623
2789	56	361	3	9	\N	9	10	2200000	65	\N	\N	0	\N	\N	0	\N	3624
2790	56	332	3	31	\N	9	9	2600000	72	\N	\N	0	6	4	1	торг, с\\уз кафель, кух\\гарн,	3625
2791	56	339	2	9	\N	5	5	1400000	60	\N	\N	\N	\N	4	0	одно окно пластик, остальное обычное	3626
2792	56	339	9	104	\N	3	5	2000000	59	\N	\N	0	6	4	1	обычная	3627
2793	56	386	9	108	\N	5	5	1750000	59	\N	\N	0	6	4	1	1 собст	3628
2794	56	386	14	23	\N	4	9	3200000	95	\N	20	0	\N	4	1	из 4-х в 3-х , не узаконена хорошая, кух. Увелич, изолир.ком	3629
2795	56	394	29	14	\N	5	5	1200000	44	\N	\N	0	\N	3	1	1 собст, хор\\рем, нат\\потолок, пл\\ок	3630
2796	56	394	27	12	\N	8	9	1900000	42	\N	\N	0	13	4	1	1 собст, хор\\рем, нат\\потолок, пл\\ок	3631
2797	56	392	1234	19	\N	1	5	1330000	44	\N	\N	1	6	3	0	не проходная, пл\\ок, чистенькая	3632
2798	56	392	11	43	\N	4	9	1800000	47	\N	\N	\N	\N	4	1	хор\\сост	3633
2799	56	350	2	7	\N	4	9	1600000	45	\N	\N	\N	\N	4	1	ремонт	3634
2800	56	350	17	10б	\N	7	9	0	54	\N	\N	\N	\N	4	1	обычная,ч/пр	3635
2801	56	557	21	6	\N	8	9	2500000	63	\N	\N	0	6	2	1	кух\\гарн, встр\\тех, 2 шк\\купе, видио наблюд, фото   2 б б\\з+обш	3636
2802	56	571	12	1	А	1	5	1250000	59	\N	\N	0	6	4	0	треб.рем	3637
2803	56	390	3	3	\N	1	9	2200000	67.2999999999999972	\N	10	0	6	4	1	торцевая, пл\\окна качест, с\\уз кафель, торг	3638
2804	56	346	13	38	\N	2	5	1500000	58.2000000000000028	\N	8	0	\N	4	1	без ремонта	3639
2805	56	348	31	11	\N	5	5	1500000	60	\N	\N	0	\N	4	0	угловая	3640
2806	56	347	20	20	\N	5	5	1900000	57	\N	\N	0	\N	4	1	полный ремонт, ком\\не прох, отл\\рем	3641
2807	56	390	10	3	\N	5	5	1280000	59	\N	\N	1	6	4	0	угловая, обычная,	3642
2808	56	347	10	31	\N	1	9	2150000	65	\N	\N	\N	6	4	1	обычная	3643
2809	56	347	14	52	\N	4	9	2980000	76	\N	\N	\N	6	4	1	из 4-х -3х,	3644
2810	56	571	1234	32	\N	8	9	2700000	67	\N	\N	0	\N	4	1	перепл. Узаконена, хор\\ремонт, встр\\мебель	3645
2811	56	348	1234	27	\N	1	5	1550000	59	\N	\N	0	\N	4	0	аккуратная, пл\\ок	3646
2812	56	471	9	53	\N	7	11	6150000	150	\N	\N	0	13	4	1	евро	3647
2813	56	471	9	53	\N	11	11	7500000	150	\N	\N	0	13	4	1	полное евро	3648
2814	56	347	9	14	\N	8	9	2180000	65	\N	\N	0	6	4	1	\N	3649
2815	56	571	573	3	\N	6	9	8000000	113	\N	\N	0	6	4	1	МЕБЕЛЬ, ЕВРО ТЕХНИКА	3650
2816	56	571	1233	3	\N	5	9	7300000	170	\N	\N	0	\N	4	1	черновая отделка	3651
2817	56	471	1233	3	\N	5	7	8300000	130	\N	\N	0	13	4	1	супер, все есть	3652
2818	56	347	1233	67	\N	5	9	4250000	110	\N	\N	\N	\N	4	1	\N	3653
2819	56	561	9	32	\N	1	9	1750000	59	\N	\N	0	13	4	0	сост\\хор, пл\\ок	3654
2820	56	506	9	68	\N	10	14	2999000	74	\N	\N	0	13	4	1	хор\\рем, все поменяли, торг уместен	3655
2821	56	420	23	3	\N	5	5	1450000	59	\N	\N	0	\N	4	1	без рем, проходная	3656
2822	56	279	3	3	\N	3	9	2900000	71	\N	\N	0	6	4	1	арка, евро, ч\\пр	3657
2823	56	279	3	3	\N	8	9	2200000	65	\N	\N	0	6	4	1	\N	3658
2824	56	480	10	13	А	1	9	2600000	67	\N	\N	\N	6	4	1	ремонт,с/у кафель, кух гарнитур	3659
2825	56	301	9	1	А	6	6	2500000	69	\N	\N	0	10	4	1	ремонт, ч\\пр	3660
2826	56	301	28	4	\N	9	9	2200000	0	\N	\N	\N	6	4	1	торг, ч\\пр	3661
2827	56	301	7	14	\N	5	9	1800000	48	\N	\N	\N	\N	4	1	ч\\пр	3662
2828	56	293	6	20	\N	10	10	2000000	52	\N	\N	1	6	4	1	хорошая, стр\\рем	3663
2829	56	293	3	9	\N	9	10	2050000	48	\N	\N	0	6	4	1	2 собст, ремонт,	3664
2830	56	293	13	38	\N	4	5	1590000	50	\N	12	0	\N	4	1	\N	3665
2831	56	427	12	16	\N	3	5	1550000	44	\N	\N	0	6	4	1	разнорядка, удобная переплн,торг	3666
2832	56	301	9	64	\N	2	9	2550000	69	\N	\N	\N	\N	4	1	ремонт ч/пр	3667
2833	56	274	15	11	\N	3	9	2350000	60	\N	\N	0	\N	4	1	ч\\пр,хорошее	3668
2834	56	295	2	5	\N	2	5	1270000	44	\N	\N	0	\N	3	0	ч\\пр, обычная, пл\\ок, разнорядка, кладовка в подвале	3669
2835	56	295	8	6	\N	8	9	2050000	57	\N	\N	\N	\N	4	1	стр\\рем, московс.пр-т	3670
2836	56	276	10	13	А	1	10	1800000	42	\N	\N	\N	6	4	1	торг, ч\\пр, с рем., есть подвал большой с табуром, мебель	3671
2837	56	276	8	10	\N	6	10	2200000	54	\N	\N	\N	6	4	1	ч\\пр, хорошая	3672
2838	56	279	2	19	\N	4	5	1350000	44	\N	\N	\N	6	4	1	сост.хорошее, окна и двери поменяны	3673
2839	56	286	18	11	\N	5	5	1350000	44	\N	\N	0	13	3	1	частич\\рем, ч\\пр	3674
2840	56	270	12	2	\N	2	5	1350000	44	\N	\N	0	\N	4	1	пл\\ок, чистая, ч\\пр, торг	3675
2841	56	480	9	20	\N	7	9	1800000	52	\N	\N	0	6	4	1	пл.окна,м/ж двери,Гардиан,натяж потторг	3676
2842	56	480	9	9	В	3	9	1950000	62	\N	\N	0	\N	3	1	пл.окна,переплан,ипотека 630т.р	3677
2843	56	480	11	5	\N	5	5	1500000	44	\N	\N	0	\N	4	1	капитальный ремонт,ипотека900т.р.	3678
2844	56	516	9	23	\N	2	5	2200000	75	\N	\N	0	\N	4	1	хорошая , все поменяно , с/у кафель. Чп	3679
2845	56	516	14	23	\N	5	9	2000000	48	\N	\N	0	6	4	1	торг, нормальное состояние	3680
2846	56	514	17	51	\N	10	10	1520000	51	\N	\N	\N	\N	4	1	чистая ,аккуратная (ипотека 1100)	3681
2847	56	514	1234	13	В	3	5	1150000	44	\N	\N	\N	\N	4	1	обычная, чп	3682
2848	56	514	17	27	А	1	5	900000	42	\N	\N	0	\N	3	0	пл\\ок, простая	3683
2849	56	515	9	5	\N	6	10	2400000	70	\N	\N	0	13	3	1	отл\\сост, пл\\ок, фл\\дв, кухня студия, мебель	3684
2850	56	289	6	18	\N	10	10	1950000	50	28	8	1	6	4	1	\N	3685
2851	56	289	7	43	\N	4	10	2730000	56	37	9	\N	6	4	1	\N	3686
2852	56	289	31	18	А	1	9	1700000	50	28	8	\N	6	4	1	\N	3687
2853	56	289	10	2	А	5	5	1550000	44	27	7	\N	6	4	1	\N	3688
2854	56	289	23	6	\N	5	5	1400000	46	26	6	1	6	4	1	Хор ремонт	3689
2855	56	289	19	3	А	4	4	1150000	42	25	6	0	13	3	1	торг, чистая продажа	3690
2856	56	325	15	59	\N	2	9	2700000	63	\N	\N	0	6	4	1	хорошее	3691
2857	56	325	25	7	\N	7	7	2250000	52	\N	\N	0	6	4	1	сост\\хор,	3692
2858	56	325	9	18	А	1	5	1700000	44	\N	\N	0	6	4	0	отличная	3693
2859	56	325	24	5	\N	3	5	1200000	46	\N	\N	0	13	4	\N	обычная	3694
2860	56	509	10	2	А	3	5	1600000	46	\N	\N	0	\N	4	1	с хорошим ремонтом	3695
2861	56	509	10	1	\N	4	5	1250000	44	\N	\N	0	\N	4	1	однорядка, остается кух.гарнитур хороший	3696
2862	56	509	14	76	\N	6	9	2600000	0	\N	\N	\N	\N	4	1	с ремонтом	3697
2863	56	509	1234	13	в	2	5	1250000	0	\N	\N	0	\N	4	1	\N	3698
2864	56	427	1234	28	\N	5	5	1120000	44	\N	\N	0	6	3	1	ч\\пр, пустая	3699
2865	56	263	17	17	\N	4	9	1100000	43	\N	\N	1	13	4	0	хорошая, ч\\пр, аккуратная	3700
2866	56	427	15	65	\N	1	9	2000000	53	\N	\N	0	6	4	1	ч\\пр	3701
2867	56	425	1234	11	Б	5	5	1250000	44	\N	\N	1	6	3	1	хор\\сост	3702
2868	56	278	1233	44	\N	2	9	1900000	48	\N	\N	\N	6	4	1	кух\\гарн.	3703
2869	56	267	10	2 Б	\N	2	5	1290000	44	\N	\N	\N	\N	3	1	пл.окна,без ремонта,ч пр	3704
2870	56	422	1234	11	Б	5	5	1300000	44	\N	\N	0	6	3	1	отличное	3705
2871	56	422	10	13	\N	7	9	1800000	49	\N	\N	0	6	4	1	обычная, торг	3706
2872	56	422	20	41	\N	6	9	2000000	50	\N	\N	\N	\N	4	1	свеж отл ремонт, отл кух гарнт, шк\\купе, сигнал	3707
2873	56	357	7	2	\N	7	9	1450000	48	\N	\N	0	6	4	1	ч\\пр,торг	3708
2874	56	453	14	23	\N	5	9	2000000	48	\N	\N	\N	6	4	1	фото	3709
2875	56	414	9	7	\N	3	9	2950000	100	\N	\N	\N	\N	4	1	\N	3710
2876	56	414	20	1	\N	10	12	1800000	100	\N	\N	0	\N	4	1	черновая	3711
2877	56	414	9	88	\N	7	9	2350000	48	\N	\N	0	13	4	1	евроремонт, ипотека СБ 1400	3712
2878	56	385	1234	17	\N	5	5	1200000	45	\N	\N	0	6	3	1	однорядка, торг, обычная	3713
2879	56	415	20	1	\N	8	12	1900000	100	\N	\N	0	\N	4	1	разнор, отл\\рем, кладовка	3714
2880	56	416	2	19	\N	2	5	1520000	44	\N	\N	0	\N	3	0	хор\\рем, балкон  будет 2018 г, пл\\окна	3715
2881	56	416	20	15	\N	1	5	0	43	\N	\N	0	13	4	1	свежий кост, ремонт, новые двери,	3716
2882	56	416	10	2	А	3	5	1220000	44	\N	\N	0	6	4	1	пл\\ок,двери новые,	3717
2883	56	416	26	15	\N	10	12	1115000	38	\N	\N	\N	\N	3	1	сред\\рем. Пл\\ок	3718
2884	56	416	9	20	\N	5	9	2070000	48	\N	\N	0	6	4	1	хорошее, с\\уз кафель, тамбур	3719
2885	56	416	21	4	\N	7	9	2980000	86	\N	\N	\N	\N	4	1	разн., пл\\ок, Гард, хор\\рем.мебель	3720
2886	56	394	12	3	\N	5	5	1420000	46	\N	\N	0	6	4	1	1 собст, отл\\рем, нат\\потолок, пл\\ок	3721
2887	56	494	10	2	А	2	5	1280000	44.7999999999999972	\N	\N	0	6	4	1	торг, пустая, ч\\пр	3722
2888	56	361	4	26	\N	1	5	1300000	44	\N	\N	\N	6	3	0	среднее состояние	3723
2889	56	361	29	10	\N	1	5	1480000	45	\N	\N	\N	\N	\N	1	отл\\рем,	3724
2890	56	361	29	40	\N	5	5	1300000	45	\N	\N	\N	\N	4	1	торцевая, ипотечная, торг	3725
2891	56	361	19	9	А	5	5	1450000	44.5	\N	\N	\N	\N	4	1	сост\\среднее	3726
2892	56	359	9	46	\N	4	5	1350000	45	\N	\N	\N	\N	4	1	сост\\хор, однорядка, кух\\гарн,ипотека ВТБ, фото,	3727
2893	56	362	10	4	\N	5	5	1150000	44	\N	\N	0	\N	4	1	торг, пл\\ок, Гардиан	3728
2894	56	362	13	2	\N	1	12	0	0	\N	\N	\N	\N	4	1	\N	3729
2895	56	332	17	49	\N	9	10	1950000	58	\N	\N	1	6	4	1	ТОРГ! новая, кон-р, кух\\гарн., шк.купе,пл\\ок., в\\дв.	3730
2896	56	332	10	1	\N	3	5	1050000	44	\N	\N	0	6	4	1	треб\\рем, торг	3731
2897	56	363	12	9	\N	5	5	1300000	46	\N	\N	\N	6	4	1	непроходная, пластиковые окна	3732
2898	56	339	7	16	\N	7	9	1750000	48	\N	\N	\N	\N	4	1	ремонт	3733
2899	56	339	1234	11	В	4	5	1550000	44	\N	\N	\N	\N	4	1	отличный ремонт, мебель вся	3734
2900	56	339	10	41	\N	4	9	2200000	48	\N	\N	0	\N	4	1	отличная	3735
2901	56	353	7	13	а	3	5	1580000	44	\N	\N	1	\N	4	1	разнорядка, хороший ремонт: пл.окна, ф/д,  линолеум,	3736
2902	56	353	7	14	\N	2	9	1750000	48	\N	\N	0	\N	4	1	хороший ремонт: пл.окна, ф/д,  линолеум	3737
2903	56	353	20	20	\N	4	5	1350000	45	\N	\N	1	\N	4	1	разнорядка, пл.окна, обычная вариант подобран	3738
2904	56	353	2	6	б	5	5	1500000	44	\N	\N	1	\N	4	1	разнорядка, хороший ремонт:  ф/д,  линолеум, встр.мебель	3739
2905	56	353	1234	54	\N	9	9	2000000	48	\N	\N	0	\N	4	1	хороший ремонт: пл.окна, ф/д,  линолеум. Торг	3740
2906	56	338	26	3	\N	4	12	2300000	80	\N	\N	\N	\N	4	1	ремонт	3741
2907	56	301	12	29	\N	1	5	1450000	44	\N	\N	\N	\N	4	1	обычная	3742
2908	56	301	14	95	\N	1	9	1950000	48	\N	\N	0	\N	3	1	стр\\рем	3743
2909	56	301	29	6	\N	1	5	1300000	0	\N	\N	\N	\N	4	0	ремонт	3744
2910	56	301	24	5	А	1	5	1250000	46	\N	\N	0	\N	4	0	хорошие сост. Пластик. Кафель	3745
2911	56	301	25	11	\N	9	9	2600000	50	\N	\N	0	\N	4	1	хорошие состояние вариант подбран	3746
2912	56	301	1233	64	\N	9	9	1900000	63	\N	\N	0	\N	4	1	ремон кухгарнитур в подарок	3747
2913	56	301	12	16	\N	3	5	1400000	44	\N	\N	0	\N	4	1	\N	3748
2914	56	301	12	16	\N	1	5	1270000	44	\N	\N	0	\N	4	1	\N	3749
2915	56	301	29	12	\N	5	5	1500000	42	\N	\N	\N	\N	4	1	ремонт, ипотека 900,	3750
2916	56	509	15	59	\N	2	9	2600000	0	\N	\N	0	\N	4	1	\N	3751
2917	56	509	29	10	\N	5	5	1250000	0	\N	\N	0	\N	4	1	\N	3752
2918	56	509	9	6	а	1	5	1300000	0	\N	\N	1	\N	4	0	\N	3753
2919	56	273	3	22	\N	3	9	1480000	42	\N	\N	0	13	3	1	Пл ок, косм рем, ипотека	3754
2920	56	273	4	22	\N	3	9	1740000	48	\N	\N	0	13	4	1	обычная	3755
2921	56	273	4	22	\N	3	9	1800000	46	\N	\N	0	13	4	1	без ремонта	3756
2922	56	273	8	18	\N	6	10	2200000	54	\N	\N	0	6	4	1	отличный ремонт	3757
2923	56	273	8	18	\N	6	10	2200000	54	\N	\N	0	6	4	1	ремонт	3758
2924	56	273	10	2	\N	3	5	1370000	45	\N	\N	0	6	4	1	пл окна, вх дверь, ч\\пр	3759
2925	56	273	10	2	\N	3	5	1250000	44	\N	\N	0	6	4	1	пл окна, хор состояние	3760
2926	56	273	29	36	\N	1	5	1580000	44	\N	\N	0	13	4	1	хорошее состояние	3761
2927	56	273	9	24	\N	6	9	1770000	48	\N	\N	0	6	4	1	пл ок, вх дв, ванна кафель, торг	3762
2928	56	273	9	100	\N	5	5	1240000	44	\N	\N	0	6	4	1	хорошее состояние, ипотечная	3763
2929	56	273	9	15	\N	1	10	1680000	44	\N	\N	0	6	4	1	пл ок, вх дв, ванна кафель, торг	3764
2930	56	273	9	15	\N	1	10	1650000	44	\N	\N	0	6	4	1	ремонт	3765
2931	56	273	9	15	\N	4	9	1980000	54	\N	\N	0	6	4	1	обычная	3766
2932	56	273	23	3	\N	2	5	1100000	44	\N	\N	0	6	3	0	пл окна, вх и м\\к двери, пустая	3767
2933	56	273	28	2	\N	1	9	1450000	44	\N	\N	0	6	4	1	обычная	3768
2934	56	273	28	2	\N	1	9	1440000	44	\N	\N	0	6	4	1	пл окна, обычная	3769
2935	56	273	19	3	б	1	4	1290000	43	\N	\N	0	6	3	0	обычная	3770
2936	56	273	1233	61	\N	5	9	2170000	48	\N	\N	0	6	4	1	обычная	3771
2937	56	273	7	51	\N	4	9	1900000	48	\N	\N	0	\N	4	1	обычная	3772
2938	56	524	17	14	\N	10	10	1900000	48	\N	\N	1	6	4	1	отличное	3773
2939	56	410	6	17	\N	10	10	2100000	60	\N	\N	0	6	3	1	\N	3774
2940	56	410	19	19	\N	1	5	1250000	43	\N	\N	1	6	3	1	пл. окна, аккуратная	3775
2941	56	520	12	5	б	1	5	1450000	45	\N	\N	0	6	4	0	пл.окна, ремонт в ванной, супер, ч/п	3776
2942	56	520	1234	13	А	5	5	1450000	44	\N	\N	0	13	3	1	Заезжай и живи,полный ремонт, торг	3777
2943	56	520	9	30	б	3	5	1650000	44	\N	\N	0	13	3	1	не проход, отл\\рем, евро,	3778
2944	56	520	1233	67	\N	8	9	2600000	64	\N	\N	0	13	4	1	хорошее сост,ч\\п, сан.узел ремонт	3779
2945	56	293	14	5	\N	4	9	2100000	48	\N	\N	\N	\N	4	1	ремонт	3780
2946	56	394	4	26	\N	1	5	1500000	0	\N	\N	\N	\N	4	1	\N	3781
2947	56	382	13	10	\N	8	9	1180000	34	\N	\N	0	6	3	1	торг, хорошее состояние, мебель	3782
2948	56	409	6	15	\N	6	9	1350000	33	\N	\N	\N	\N	4	1	кух.гарнитур,шкаф-купе,торг	3783
2949	56	569	7	23	\N	5	10	2400000	61	34	12.5	0	13	4	1	новострой, дом сдан, чит\\отд, нат\\потолки	3784
2950	56	485	7	2	\N	3	9	1500000	48	\N	\N	0	\N	4	1	обычная, пл\\ок	3785
2951	56	346	12	3	\N	5	5	1280000	44	\N	\N	1	\N	4	1	разнор, пл\\ок, кафель	3786
2952	56	571	8	10	\N	1	10	2000000	48	\N	\N	0	\N	4	1	\N	3787
2953	56	347	10	17	\N	1	9	1650000	42	\N	\N	\N	\N	4	1	разнорядка, ремонт, погреб, тамбур	3788
2954	56	346	1234	38	\N	2	5	2050000	48.3999999999999986	\N	\N	0	\N	4	1	ремонт	3789
2955	56	455	15	9	\N	2	9	2050000	54	\N	\N	\N	\N	4	1	обычная, ипотека 300тр, фото	3790
2956	56	347	15	30	\N	2	9	1980000	53	\N	\N	\N	\N	4	0	\N	3791
2957	56	347	9	17	\N	1	9	1700000	42	\N	\N	\N	\N	4	1	разнорядка, ремонт, погреб, тамбур	3792
2958	56	347	24	5	А	4	5	1350000	44	\N	\N	0	6	4	1	однорядка, вар.подобран	3793
2959	56	485	25	7	\N	7	7	2300000	52	\N	\N	\N	\N	4	1	\N	3794
2960	56	347	1233	53	\N	2	9	1850000	53	\N	\N	\N	\N	4	0	хороший ремонт	3795
2961	56	400	23	9	\N	2	5	1400000	43	\N	\N	\N	\N	4	1	хорошая, чистая	3796
2962	56	347	28	2	\N	3	9	1850000	53	\N	\N	0	6	4	1	пустая, хор\\рем,	3797
2963	56	455	19	9	\N	1	9	1480000	43	\N	\N	\N	\N	4	1	ремонт, кух\\гарн	3798
2964	56	330	2	13	\N	4	5	1600000	42	\N	\N	0	6	4	1	кух\\гарн, ремонт, торг	3799
2965	56	561	15	13	\N	3	9	2400000	57	\N	\N	0	6	4	1	пл\\окна,	3800
2966	56	570	24	5	А	2	5	1330000	44	\N	\N	0	\N	4	1	с ремонтом	3801
2967	56	298	4	15	\N	1	5	1420000	48	\N	\N	0	6	4	0	чистая продажа 1 собст, торг	3802
2968	56	506	11	9	\N	4	5	1530000	44	\N	\N	\N	6	4	1	ТОРГ	3803
2969	56	426	10	1	\N	4	5	1200000	48	\N	\N	0	6	4	1	встроеная кухня, ч/пр. 1 собствн.	3804
2970	56	506	29	22	\N	4	5	1200000	44	\N	\N	0	13	3	1	обычная, гардиан	3805
2971	56	506	9	22	\N	12	12	1350000	49	\N	\N	0	6	4	1	\N	3806
2972	56	274	1234	23	\N	5	5	1350000	44	\N	\N	0	\N	3	\N	хорошее, С\\УЗ КАФЕЛЬ, фото	3807
2973	56	420	9	4	\N	6	9	1880000	49.2999999999999972	\N	\N	0	13	3	1	1 собст, отл\\рем, мебель, НАСЛЕДСТВО в 01.2018	3808
2974	56	264	1233	79	\N	8	9	1720000	52	\N	\N	\N	\N	4	1	торг,хороший ремонт	3809
2975	56	420	15	59	\N	5	9	2750000	70	\N	\N	0	6	4	1	1 собст, мебель, торг	3810
2976	56	264	560	7	\N	3	9	3300000	100	\N	\N	\N	\N	4	1	хор.ремонт, вся мебель встроенная остается	3811
2977	56	339	4	15	\N	4	5	1050000	29	\N	\N	\N	6	3	1	или + доплата на 2 в этих районах	3812
2978	56	339	20	14	\N	5	5	890000	31	\N	\N	\N	13	3	1	Чистая продажа	3813
2979	56	386	9	45	А	0	0	1800000	47	\N	\N	\N	13	\N	1	Разнорядка.Элит.новостройка.	3814
2980	56	386	23	3	а	5	5	1270000	29	\N	\N	0	13	3	1	хор\\рем, мебель,	3815
2981	56	301	13	28	\N	1	5	970000	32	\N	\N	0	13	3	1	обычная	3816
2982	56	301	26	13	а	5	5	850000	29	\N	\N	0	\N	3	1	обычная	3817
2983	56	301	9	20	А	5	5	1000000	36	\N	\N	\N	\N	3	1	\N	3818
2984	56	427	10	3	\N	2	5	950000	29	\N	\N	0	\N	3	1	ч\\пр, сост\\хор	3819
2985	56	263	1234	3	б	4	5	950000	30	\N	\N	\N	6	3	1	ипотека 180 тыс, фото	3820
2986	56	427	18	14	\N	5	5	830000	32	\N	\N	0	\N	3	1	ч\\пр, обычная	3821
2987	56	427	9	90	\N	7	9	1620000	47	\N	\N	0	\N	3	1	сост\\отл, мебель	3822
2988	56	425	9	22	\N	10	12	1100000	36	\N	\N	0	6	3	0	ч\\пр, торг	3823
2989	56	425	28	2	\N	7	9	1200000	33	\N	\N	\N	\N	\N	1	ч\\пр, торг	3824
2990	56	278	2	6	А	5	5	890000	29	\N	\N	0	6	3	1	1 соб, ч\\пр, торг	3825
2991	56	278	14	52	\N	8	9	1650000	39	\N	\N	0	6	3	1	ч\\пр, отл\\рем, мебель, кондц, вст\\техника	3826
2992	56	278	9	9	В	2	9	1900000	64	\N	\N	0	13	4	1	торг	3827
2993	56	278	1233	13	А	2	10	1380000	34	\N	\N	\N	\N	3	1	\N	3828
2994	56	278	23	9	\N	2	5	930000	30	\N	\N	\N	\N	3	0	торг, пл\\ок, , ч\\пр	3829
2995	56	278	23	3	\N	1	5	950000	31	\N	\N	\N	\N	\N	0	торг, отл\\рем, ч\\пр	3830
2996	56	278	9	112	\N	3	5	1200000	30	\N	\N	0	6	4	1	отличная, упакованая	3831
2997	56	267	46	3	\N	5	5	470000	30	\N	\N	0	\N	3	1	обычная,пустая,ч пр	3832
2998	56	421	12	4	\N	1	5	900000	30	\N	\N	0	\N	3	0	пласт.окна, новый линолиум, нат.потолок	3833
2999	56	453	12	15	А	3	5	1200000	29	\N	\N	\N	6	3	1	есть фото	3834
3000	56	450	11	1	А	9	9	920000	40	\N	\N	\N	\N	3	\N	торг.норм.сост.	3835
3001	56	450	9	104	\N	1	5	980000	30	\N	\N	\N	\N	3	0	норм. Сост. ч\\п, торг	3836
3002	56	394	17	10	\N	7	9	1450000	0	\N	\N	\N	\N	4	1	\N	3837
3003	56	392	9	100	\N	3	5	1000000	29	\N	\N	\N	6	3	1	\N	3838
3004	56	416	9	12	Б	4	5	1120000	28	\N	\N	0	6	3	1	сост\\хор, не рядом с  аркой	3839
3005	56	416	2	10	\N	2	5	910000	29	\N	\N	0	6	3	1	хорошее,	3840
3006	56	382	1234	11	Б	3	5	980000	31	\N	\N	0	6	3	1	хор\\торг, с\\узел делают ремонт	3841
3007	56	423	2	8	\N	1	12	1450000	48	\N	\N	0	\N	4	0	\N	3842
\.


--
-- Name: apartment_id_apartment_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('apartment_id_apartment_seq', 3007, true);


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY article (id_article, description, content, priority, node_id) FROM stdin;
\.


--
-- Name: article_id_article_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('article_id_article_seq', 1, false);


--
-- Data for Name: article_reject; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY article_reject (node_id, message, date_message) FROM stdin;
\.


--
-- Data for Name: blockandsection; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY blockandsection (id_blockandsection, block_id, section_id) FROM stdin;
\.


--
-- Name: blockandsection_id_blockandsection_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('blockandsection_id_blockandsection_seq', 19, true);


--
-- Data for Name: category_land; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY category_land (id_category_land, title, priority) FROM stdin;
2	Поселений(ИЖС)	100
3	Сельхозназначения(СНТ, ДНП)	90
4	Промназначения	80
\.


--
-- Name: category_land_id_category_land_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('category_land_id_category_land_seq', 4, true);


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY city (id_city, title, alias, region_id, districts_id, select_default) FROM stdin;
112	Москва	moskva	91	\N	\N
117	Набережные Челны	naberegnie-chelni	95	\N	\N
118	Казань	kazan	95	\N	\N
173	Большие Аты с.	bolshie-ati-s	95	1	\N
174	Володарский п.	volodarskiy-p	95	1	\N
120	Камские Поляны	kamskie-polyani	95	1	\N
175	Елантово с.	elantovo-s	95	1	\N
125	Арск	arsk	95	4	\N
176	Камский п.	kamskiy-p	95	1	\N
127	Азнакаево	aznakaevo	95	7	\N
129	Чистополь	chistopol	95	9	\N
133	Мамадыш	mamadish	95	13	\N
177	Клятле д.	klyatle-d	95	1	\N
178	Макаровка д.	makarovka-d	95	1	\N
179	Николаевка д.	nikolaevka-d	95	1	\N
137	Шереметьевка с.	sheremetevka-selo	95	1	\N
119	Красный Ключ п.	krasniy-klyuch	95	1	\N
134	Строителей п.	posstroiteley	95	1	\N
180	Первомайский п.	pervomayskiy-p	95	1	\N
136	Шингальчи с.	dershingalchi	95	1	\N
139	Нижнее Афанасово с.	nignee-afanasovo	95	1	\N
122	Большое Афанасово с.	bolshoe-afanasovo	95	1	\N
140	Прости с.	prosti-s	95	1	\N
131	Верхняя Уратьма с.	verhnyaya-uratma	95	1	\N
141	Нижняя Уратьма с.	nignyaya-uratma-s	95	1	\N
130	Верхние челны с.	verhnie-chelni	95	1	\N
124	Иштеряково с	ishteryakovo-s	95	3	\N
121	Каенлы с.	kaenli-s	95	1	\N
135	Сухарево с.	suharevo-s	95	1	\N
123	Трудовой п.	trudovoy	95	1	\N
142	Дмитриевка д.	dmitrievka-d	95	1	\N
143	Алань д.	alan-d	95	1	\N
144	Ильинка д.	ilinka-d	95	1	\N
181	Свердловец п.	sverdlovets-p	95	1	\N
146	Елабуга	elabuga	95	15	\N
145	Поспелово c.	spospelovo	95	15	\N
147	Байгулово с.	baygulovo	95	1	\N
148	Борок с.	borok	95	1	\N
149	Мензелинск	menzelinsk	95	17	\N
150	Нариман д.	nariman-d	95	1	\N
151	Соколка с.	sokolka	95	13	\N
152	Тетвель с.	tetvel-s	95	1	\N
153	Смыловка с.	smilovka-s	95	1	\N
154	Менделеевск	mendeleevsk	95	19	\N
156	Сарманово	sarmanovoa	95	22	\N
157	Джалиль пгт	dgalil-pgt	95	22	\N
158	Зеленодольск	zelenodolsk	95	23	\N
159	Секинесь с.	sekines	95	13	\N
160	Благодатная д.	blagodatnaya-d	95	1	\N
161	Нефтебаза  п.	neftebaza--p	95	3	\N
162	Кзыл Яр д.	kzil-yar-d	95	1	\N
116	Нижнекамск	nignekamsk	95	1	1
165	Сарсаз-Бли с.	sarsaz-bli-s	95	1	\N
166	Нижнее Бишево с.	nignee-bishevo-s	95	27	\N
167	Октябрь с.	oktyabr-s	95	28	\N
209	Старое Пальчиково с.	staroe-palchikovo-s	95	27	\N
168	Новое Минькино д.	novoe-minkino-d	95	1	\N
169	Березовая Грива д.	berezovaya-griva-d	95	1	\N
170	Байданкино д.	baydankino-d	95	1	\N
171	Балчыклы с.	balchikli-s	95	1	\N
182	Соболеково д.	sobolekovo-d	95	1	\N
183	Туба с.	tuba-s	95	1	\N
184	Болгар с.	bolgar-s	95	1	\N
185	Верхний Ключ	verhniy-klyuch	95	1	\N
186	Выгороженный Ключ д.	vigorogenniy-klyuch-d	95	1	\N
187	Кармалы с.	karmali-s	95	1	\N
188	Красная Кадка с.	krasnaya-kadka-s	95	1	\N
189	Кулмакса с.	kulmaksa-s	95	1	\N
190	Малые Ерыклы д.	malie-erikli-d	95	1	\N
191	Нижние Челны с.	nignie-chelni	95	1	\N
192	Поповка п.	popovka-p	95	1	\N
193	Самоновка п.	samonovka-p	95	1	\N
194	Сименеево д.	simeneevo-d	95	1	\N
195	Средние Челны д.	srednie-chelni-d	95	1	\N
196	Тавель с.	tavel-s	95	1	\N
197	Троицкий п.	troitskiy	95	1	\N
198	Уська д.	uska-d	95	1	\N
199	Большая Сосновка д.	bolshaya-sosnovka-d	95	1	\N
200	Городище с.	gorodishche-s	95	1	\N
201	Кашаево д.	kashaevo-d	95	1	\N
203	Красный Бор д.	krasniy-bor-d	95	1	\N
202	Ключ Труда п.	klyuch-truda	95	1	\N
204	Майская Горка д.	mayskaya-gorka-d	95	1	\N
205	Оша с.	osha-s	95	1	\N
206	Старошешминск с.	starosheshminsk-s	95	1	\N
207	Ташлык с.	tashlik-s	95	1	\N
208	Шакшино с.	shakshino-s	95	1	\N
210	Заинск	zainsk	95	27	\N
211	Сахаровка д.	saharovka-d	95	2	\N
216	Морты с.	morti-d	95	15	\N
217	Бакташ д.	baktash-d	95	33	\N
213	Акбуре д.	akbure-d	95	33	\N
212	Арбузов-Баран c.	arbuzov-baran-c	95	2	\N
155	Черемшан с.	cheremshan-s	95	21	\N
128	 Актюбинский пгт	aktyubinskiy-pgt	95	7	\N
215	Масловка с.	maslovka-d	95	32	\N
138	Пробуждение п.	probugdenie-p	95	1	\N
220	 Аксарино с.	aksarino-s	95	27	\N
221	Керекес с.	kerekes-s	95	27	\N
226	Новый п.	noviy-p	95	13	\N
225	Камский Леспромхоз п.	kamskiy-lespromhoz	95	13	\N
229	Старое Утяшкино д.	staroe-utyashkino-d	95	33	\N
232	Новошешминск с.	novosheshminsk-s	95	33	\N
234	36 мкр.	36-mkr	95	1	\N
235	Большая Шельня с.	bolshaya-shelnya-s	95	3	\N
236	Светлое Озеро с.	svetloe-ozero-s	95	27	\N
219	Верхние Лузы с.	verhnie-luzi-s	95	27	\N
231	Верхняя Сунь с. 	verhnyaya-sun-s	95	13	\N
238	Яна-Буляк д.	yana-bulyak-d	95	3	\N
241	 Старозаинск с.	starozainsk-s	95	27	\N
242	 Ижевка  с.	igevka	95	19	\N
243	Салмачи пгт	salmachi-pgt	95	37	\N
244	Высокая Гора с.	visokaya-gora-s	95	36	\N
245	Борковский Кордон д.	borkovskiy-kordon-d	95	1	\N
246	Смыловка д.	smilovka-d	95	1	\N
239	Биклянь с.	biklyan-s	95	3	\N
240	Старые Ерыклы д.	erikli-d	95	3	\N
248	Верхние Пинячи с.	verhnie-pinyachi-s	95	27	\N
249	СНТ-Нижнекамск	snt-nignekamsk	95	1	2
253	Авлаш д.	avlash-d	95	3	\N
254	Ачи д.	achi-d	95	1	\N
222	Кзыл-Юл  п. 	kzil-yul--d	95	3	\N
223	Котловка с.	kotlovka-d	95	15	\N
228	Кулаево с.	kulaevo-d	95	34	\N
227	Наратлы-Кичу с.	naratli-kichu-s	95	17	\N
250	Миннибаево с.	minnebaevo-s	95	38	\N
233	Рыбная Слобода пгт	ribnaya-sloboda-pgt	95	32	\N
255	Берсут с	bersut-s	95	13	\N
256	Уфа	ufa	105	\N	\N
257	Абашево с.	abashevo-s	106	40	\N
258	Красная Поляна	krasnaya-polyana	107	41	\N
259	Туапсе	tuapse	108	42	\N
262	 Старый Закамский п.	stariy-zakamskiy-p	95	13	\N
263	Круглое поле  п.	krugloe-pole--p	95	3	\N
264	Речное с.	rechnoe-s	95	2	\N
265	Калиновка д.	kalinovka-d	95	3	\N
267	Бутурлиновка г.	buturlinskiy	109	44	\N
268	Сентяк с.	sentyak-s	95	15	\N
269	Кутлу-Букаш  с.	kutlu-bukash--s	95	32	\N
270	Майдан с.	maydan-s	95	45	\N
271	Русский Ошняк с.	russkiy-oshnyak-s	95	32	\N
272	Агрыз г.	agriz-g	95	46	\N
273	Алексеевск	alekseevsk	95	2	\N
274	Большой Толкиш с.	bolshoy-tolkish-s	95	9	\N
275	Каймары с.	kaymari-s	95	36	\N
276	Севастополь	sevastopol	110	47	\N
277	Лаишево г.	laishevo-g	95	43	\N
278	Нижний Новгород г.	nigniy-novgorod-g	111	49	\N
279	Старое Мазиково д. 	staroe-mazikovo-d	112	50	\N
266	Державино с.	dergavino-s	95	43	\N
247	Татарское Утяшкино  с.	tatarskoe-utyashkino	95	33	\N
230	Татарский Елтан с.	tatarskiy-eltan-s	95	9	\N
280	 Слобода Волчья д.	sloboda-volchya-d	95	33	\N
\.


--
-- Name: city_id_city_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('city_id_city_seq', 280, true);


--
-- Data for Name: commercial; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY commercial (id_commercial, agent, type, street, price, area_house, note, node_id) FROM stdin;
1	342	56	9	300000	36	Гараж по пр.Химиков 38. 9*4   подземный	1768
2	391	56	15	470000	18	Гараж "Престиж" на Сююмбике 74 на 3-м этаже, S=18	1769
3	271	56	17	700000	36	Гараж ЭВМ-сервис 6х6м, высотоа 3м, отопление, стеллажи, см.яма, свет	1771
4	492	56	17	300000	18	Гараж ЭВМ-Сервис капитальный, S=18	1772
5	472	56	11	2900000	0	Земля по ул. Лесная: под автостоянку, 10 сот., возможен обмен на недвижимость или авто	1774
7	271	56	15	680000	74	Гараж Престиж-2 Сююмбике/Менделеева 1-ый этаж, два гаража по 37кв.м., цена за 1	1776
39	271	56	17	1500000	50	ПСН Студенческая 31, офисное помещение 50 кв.м.	1855
40	271	56	1243	1200000	248	ПСН рядом с рынком 248кв.м. можно под кафе, +цоколь 248кв.м.	1857
6	491	56	27	250000	\N	Гараж на Мурадьяна 30, подземный, яма смотровая, погреб, оборудованный	1775
8	528	56	1243	70000	18	Гараж "шинник 55" 3х6, погреб, см.яма, ледник	1777
9	271	56	512	50000	27	Гараж 11 кооп. 4,5х6м, погреб 3х3м сухой, свет, стеллажи	1778
10	271	56	1233	3000000	48	ПСН Шинников 27, 48кв.м., отдельный вход, отличный ремонт	1780
11	271	56	1233	4150000	39	ПСН Шинников 38 85кв.м. своя входная группа	1781
12	271	56	1233	3730000	70	ПСН Шинников 50 70кв.м. отдельный вход	1782
13	271	57	28	112500	6250	ПСН Южная 6 250кв.м., два отдельных входа, хороший ремонт, АРЕНДА	1783
14	342	56	9	10000000	400	Торгово-офисное помещение 400кв.м. начало Химиков с ремонтом	1785
15	282	56	1243	300000	33	Торговый павильон на рынке 33 кв.м	1786
16	282	56	1243	250000	18	Торговый павильон на рынке 18 кв.м	1787
17	340	57	1243	350000	0	Сдам в аренду ресторан, 4 зала, танцпол,	1789
18	271	56	28	9000000	6250	ПСН Южная 6 250кв.м., два отдельных входа, хороший ремонт, ПРОДАЖА	1790
19	268	56	13	350000	25	Гараж по ул. Вокзальная 23 (за Абшероном), 25 кв.м, погреб, см.яма, стеллажи	1791
20	271	56	532	140000	18	Гараж 7 гаражей 3х6м подряд в районе базы Фактория	1797
21	487	56	512	60000	18	Гараж ГК-11 район "ГЭТ",3х6,смотровая яма, погреб	1799
22	342	56	28	15000000	170	Автостоянка на ул.Южная, земля 2Га, забетонирована, здание 2этажа 170кв.м.	1801
24	271	56	11	45000	10	Погреб на Лесной 10кв.м., свет, стеллажи	1803
25	271	56	11	20000	7	Погреб на Лесной 7кв.м., свет, стеллажи	1804
26	500	56	10	20000	0	погреб подземн на Менделеева сухой, оборудован	1805
27	342	56	1234	15000000	420	Магазин п.Строителей 2х.эт. Магазин S=420;	1806
28	529	56	500	100000	0	Гараж ГСК-2 в р-не трампарка	1828
29	271	56	507	530000	70	Гараж ГСК Волга Химиков 41А Ледовый дворец 70 кв.м., высота 3,5м, подвал, фото	1829
30	526	56	24	170000	18	Гараж на Чабьинской 3х6 наверху , см.яма, погреб сухой, полки, обшивка двери	1831
31	271	56	556	400000	140	Магазин на территории НКЦ 140 кв.м.	1837
32	271	56	1243	1100000	0	Готовый бизнес парикмахерская 2/5 доли	1839
33	391	56	1243	25000000	0	Действующее пельменное производство в Нижнекамском районе	1841
34	526	56	1243	4100000	121	Офисное помещение с входной группой, 121 кв.м, полный ремонт, торг	1845
35	271	56	1243	1200000	238	ПСН Кооператив 36, 238кв.м.	1848
36	271	56	1234	12000000	304	ПСН Строителей 20а 304кв.м. отдельный вход фото	1849
37	271	56	1243	10000000	580	ПСН Объект незавершенного строительства 580кв.м., 27с, в четре города	1852
38	271	56	17	7800000	0	ПСН Студенческая 3, 13кв.м., под офис, 600р/кв.м.	1854
41	484	56	30	4100000	120	ПСН Чулман 4: 5-тикомн., S=120, 2 б/з, + 2 погреба, хорошее, пласт.окна	1858
42	271	56	9	2250000	150	ПСН Химиков 1А цоколь черновой 150кв.м. фото	1860
43	271	56	20	4500000	111	ПСН Корабельная 1 отдельный вход 111кв.м. фото	1863
44	271	56	1233	3110000	66	ПСН Шинников 23 66кв.м. отдельное крыльцо, черновая отделка	1864
45	271	56	7	1500000	0	ПСН Вахитова 13 91 кв.м., хороший ремонт, можно под хостел или офис	1865
46	342	56	9	0	145	Нежилое помещение на Химиков 38 черновая S=145;	1870
47	351	56	1243	0	400	Кафе рынок, отдельное здание , 2 действующих этажа, S=400, ремонт, Торг	1873
48	351	56	1233	1950000	43	Офисное помещение Шинников 13а, свой вход, с ремонтом, 43 кв.м	1874
49	391	56	1243	16000000	0	Нижнекамский район: действующее кафе. Торг	1875
50	342	56	9	36000000	750	Административное офисное здание 2эт S=750 на пр.Химиков;	1888
51	429	56	9	400000	42	Гараж (очень большой) за кадетской школой  7Х6 + подвал такой же	1896
52	271	56	13	120000	18	Гараж Автомобилист 16 3х6, погреб, стеллажи, свет, документы готовы	1902
53	396	56	529	45000	25	Гараж за автовокзалом, ГСК 25, 20кв, 6*3, погреб	1904
54	271	56	13	60000	18	Гараж Автомобилист 21 3х6 погреб сухой, стеллажи, полы бетон, свет	1907
55	271	56	565	120000	36	Гараж конс.завод 6х6, стеллажи, полы бетон, свет	1909
56	484	56	1243	4500000	0	Действующий бизнес - бильярд, кальянная с ПСН (в собственности)	1912
57	271	56	1243	1000000	0	Готовый бизнес Цех по производству кованных изделий	1913
58	271	56	15	10000000	265	Здание Сююмбике 12 2хэт.+цоколь 265кв.м.	1914
59	342	56	1243	0	2000	Базы 1500кв.м; офис 100кв.м Резервуарный парк S=2000м3	1926
60	271	56	565	100000	18	Гараж за автовокзалом 3*6 погреб, стеллажи, полы бетон, счетчик, свет, в собственности	1928
61	436	56	561	440000	0	Гараж капитальный, Престиж 2, 4 этаж, полы деревянные, ч\\пр.	1930
62	402	56	559	0	18	Гараж Соболекокова, 3X6, ПОГРЕБ ЯМА	1932
63	366	56	1266	4300000	200	Нежилое помещение Б.Афанасово, 200 кв.м, высота 4 м, отопление, 24 сотки, летний домик, баня, свет, газ.	1952
64	271	56	45	750000	120	Гараж с/к Юбилейный 120кв.м., погреб	1953
65	271	56	1296	5000000	0	ПСН Кам.Поляны 794кв.м. фото на Авито	1954
66	271	56	1286	2400000	323	ПСН Прости 323кв.м. одноэтажное здание, все коммуникации	1955
67	271	56	7	2900000	91	ПСН Вахитова 13 80кв.м. и 91кв.м., вместе или по-отдельности (1400+1500)	1956
68	488	56	6	10000000	336	ПСН 30 лет Победы 8В (рядом со стадионом "Нефтехимик"): S=336, ремонт, 1 собственник	1957
69	271	56	20	5300000	121	ПСН  Корабельная 29 отдельный вход 121кв.м. фото	1958
70	566	56	1243	34000000	2032	Произ.база 4250 м2, блок кирпичный 2032м2, водопровод, электроснабжение,вентиляция, отопление, фото есть. ТОРГ	1959
71	271	56	1275	6300000	200	Произ. база пос. Строитлей 200кв.м. отличный ремонт, складские, производственные, авито	1960
72	271	56	1275	63000000	5650	Произ. база район консервного завода 5650кв.м. фото	1961
73	342	56	1400	36000000	1200	Производственно-офисное помещение на Ахтубинской 1200кв.м.	1962
74	271	56	12	1990000	83	ПСН  Гагарина 28 83кв.м. цоколь, отдельный вход фото	1963
75	507	56	1271	1800000	850	ПСН Шереметьевка, S=850 кв. м. коммун. есть. 16:30:090704:28	1964
76	271	56	1282	2500000	500	Здание Мамадыш 500кв.м. 10с	1965
77	391	56	1243	3000000	0	Нижнекамский район: магазин. Торг	1966
78	342	56	9	10000000	167	Офисные пом. по Химиков 1Б S=167;	1967
79	342	56	1279	3500000	65	Магазин 300кв.м. с квартирой 65кв.м. в д.Нижняя Уратьма	1968
80	507	56	515	160000	18	ГСК 24  Автомобилист, 3х6 свет, не приватизирован, яма сухая, смотровая яма	1969
81	342	56	20	3700000	65	Нежилое на Корабельная 27 с арендаторами, 65+цоколь 45, ремонт, входная группа	1970
82	435	56	1243	8100000	0	Помещение - недострой под кафе	1971
83	391	56	1243	2800000	0	Парикмахерская. Готовый бизнес.	1972
84	271	56	559	20000	18	Гараж Соболеково 3*6 погреб, полы бетон, в собственности	1973
85	271	56	559	50000	18	Гараж Соболеково 3*6 погреб, см.яма, стеллажи, вытяжка, приточка, счетчик, свет, членская книжка	1974
86	483	56	1243	30000	0	Гараж за кирпич. Завод. Не обшит, 6*3,с погребом,охраняемый	1975
87	500	56	552	130000	18	Гараж ГК ТЕХУГЛЕРОД на Менделеева, подземный ,3х6,,погреб,смотр\\яма,	1976
23	508	56	11	15000	\N	Погреб  на Лесной  торцевой, холодный	1802
88	271	56	552	150000	18	Гараж Техуглерод надземный 18кв.м., бетонные полы, сухой погреб	1977
89	271	56	1400	10000000	0	Помещение под магазин в гаражах по Ахтубинской, первая линия, аренда	1978
90	271	56	1400	280000	27	Гараж Электросети 4,5х8, погреб, стеллажи, см.яма, свет, счетчик	1979
91	271	56	527	80000	18	Гараж кооператив 19 3х6 погреб сухой, стеллажи, полы бетон, свет, счетчик, южная сторона	1980
92	271	56	502	180000	18	Гараж кооператив 26 (за Электросетями) 3х6м, см.яма, погреб сухой, счетчик, свет,полы бетон	1981
93	436	56	45	750000	120	Гараж капитальный, подземный, Юбилейный, 120 кв.м., под автосервис, очень проходное месторасположение!!!	1982
94	271	56	10	130000	18	Гараж Фасция Менделеева 1, 3х6м, сухой погреб, мастерская, крыша не протекает, фото	1983
95	431	56	1408	6500000	0	БАЗА ОТДЫХА ДЕЙСТВУЮЩАЯ, НОВ. МИНЬКИНО СО СВОИМ СОБСТВ. ОЗЕРОМ, БАНЕЙ, ЛЕТНИМ ДОМИКОМ,	1984
96	271	56	1289	5800000	220	Готовый бизнес: коттедж 220кв.м. на берегу Пионерского озера, лес, все есть!	1985
97	472	56	1300	3100000	170	База отдыха Лукоморье: дом S=170 + 2 гостевых дома, 1 га, свое озеро	1986
98	488	56	549	5500000	900	База (складское помещение) Нижнекамск, Чистопольская: S=900, 60 сот., есть плиты	1987
99	470	56	1400	170000	26	Ахтубинская 8 г, 6.5х4, погре, смотровая яма, хороший	2852
100	352	56	527	50000	0	Гараж 19 кооператив все есть	2853
101	271	56	504	230000	0	Гараж 25кв.м. за электросетью, погреб сухой	2854
102	350	56	561	350000	0	Гараж Престиж возле роддома	2855
103	271	56	1293	12000000	0	ПСН Наб.Челны 270кв.м. отдельностоящее фото	2856
104	469	56	1613	1500000	0	ПСН Заинский р-н, п. S=300	2857
105	469	56	1613	2000000	0	Магазин  S=300 отопление АГВ, в Заинском районе	2858
106	271	56	1613	70000	0	Гараж 35 кооператив 6*9м коробка, не оборудован, первая линия	2859
107	271	56	3016	180000	0	Произ. база  Нижний Новгород 5000кв.м. фото	3368
108	391	56	3017	7500000	457	База отдыха "Старая Мельница" в Марий эл. S=457. Торг	3369
109	391	56	3017	7500000	457	База отдыха "Старая Мельница" в Марий эл. S=457. Торг	3370
\.


--
-- Name: commercial_id_commercial_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('commercial_id_commercial_seq', 109, true);


--
-- Data for Name: cottages; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY cottages (id_cottages, agent, type, street, storey, price, area_house, area_land, material, note, node_id, category_land, kdn) FROM stdin;
80	265	56	176	\N	900000	50	15	2	Дом Афанасово Нижнее, ул. Центральная, Дом из бруса 7*7,5, баня сруб 3*5, 15 сот, тепл. 6м, вода подвед., свет	2117	\N	\N
79	508	56	102	\N	380000	19	\N	1	Дом Б.Афанасово,Красная,пол-кирпича, пл.-19квм,12,5 с,сад,надв. Постройки,все в собственности	2116	\N	\N
77	523	56	162	\N	1650000	160	15	\N	Дом  Б. Афанасово, СНТ, Мичуринец, 160 кв.м,, черновой, участок 15 соток	2114	\N	\N
78	355	56	167	\N	950000	\N	16	\N	Дом Б.Афанасово, ул Тенистая , д.44, баня, гараж, 16 соток, насаждения, торг	2115	\N	\N
76	333	56	1269	2	3600000	390	35	1	Коттедж В.Уратьма 2х эт. Кир. Коттедж, 390 кв.м., 35 сот., гараж, баня сруб, теплица, с/у в доме, отопление	2113	\N	\N
81	507	56	1269	1	220000	\N	30	3	Дом В.Уратьма, 1эт, бревенчатый дом, баня, свет+.вода+газ+, 30 сот. Док+	2118	\N	\N
82	268	56	1269	\N	800000	80	15	0	Дом Верхняя Уратьма,80 кв.м, 15 соток	2119	\N	\N
83	391	56	1269	\N	500000	36	42	3	Дом Верх.Уратьма, 42 сот., S бревенчатого дома=36; газовое отпление, ГУО есть	2120	\N	\N
84	287	56	1266	2	900000	250	25	6	Коттедж Б. Афанасово 2-хэтажн.блок 250 кв.м, 25 соток, недострой, рядом речка	2121	\N	\N
85	271	56	96	2	10000000	250	\N	1	Коттедж Б. Афанасово, ул. Центральная, 2хэт.кирп., 125кв.м.+125кв.м.+чердак+подвал,	2122	2	\N
86	391	56	1300	\N	1200000	38	\N	0	Дом  Дмитриевка. Дом сруб-осина. S=38. Торг.	2183	\N	\N
87	271	56	1300	\N	1300000	\N	22	0	Дом Дмитриевка в самой деревне, обшит блокхаусом, свет круглый год, 22с	2184	\N	\N
88	269	56	1291	2	900000	100	10	1	Дом Н.Афанасово, черновой, 2эт кирпич, 100 кв.м, земля 10 соток, рядом с церквью, колодец	2185	\N	\N
89	488	56	1291	2	1300000	184	30	0	Дом Нижнее Афанасово (тупиковая улица на 2 дома): 2-хэтажный + цоколь, S=184, земля 30 сот.	2186	\N	\N
90	491	56	1286	\N	1300000	60	18	3	Дом Прости, дерев.дом S=60, все коммуникации, ч/пр, земля 18 соток	2187	\N	\N
93	342	56	1274	\N	300000	60	\N	3	Дом  Соколки Мамадышского района, 60кв.м., бревенчатый	2190	\N	\N
91	492	56	1274	\N	400000	\N	\N	0	Дом Соколки, дом, газ, можно по мат.капитал.	2188	\N	\N
92	271	56	1274	\N	550000	30	\N	0	Дом Соколки 30кв.м., хоз.постройки, сруб бани, свет и вода в доме, газ до дома	2189	\N	\N
94	483	56	358	\N	1200000	60	6	0	Дом Чистополь,ул.Ломоносова,6 соток,60кв.м. дом,гараж,кирпичный сарай,баня	2191	\N	\N
95	271	56	1254	\N	1500000	80	3	1	Дом Чистополь 80кв.м. кирпич, вода, све, газ, канализация централизовано, баняи ванна в доме, 3с земли	2192	\N	\N
96	492	56	1254	\N	1400000	\N	6	0	Дом Чистополь, ул.Центральная, 6 соток, газ, удобства в доме, ч/пр или обмен на Нижнекамск	2193	\N	\N
97	526	56	1271	\N	450000	15	18	3	Дом  Шереметьевке, домик 3х5, бревенчатый, земли 18 сотки, коммуникации есть, не заведены	2194	\N	\N
98	342	56	1271	\N	550000	100	60	3	Дом Шереметево из сруба недострой под крышей S=100+60 сот.зем.	2195	\N	\N
99	275	56	1271	\N	600000	58	10	1	Дом Шереметьевка недострой 58кв.м. кирпич+блок, 10с	2196	\N	\N
100	271	56	1271	\N	450000	\N	\N	0	Дом Шереметьевка пятистенок печное отопление, баня сруб, газ подведен	2197	\N	\N
101	370	56	1271	1	850000	52.2999999999999972	20	0	Дом Шереметьевка, 1-ноэтажный из бревна, 52,3 кв.м, баня, газ, вода во дворе, 20 соток.	2198	\N	\N
102	271	56	1271	\N	850000	\N	15	0	Дом Шереметьевка пятистенок 1960г, баня, погреб, свет, газ, вода в доме, 15с, в собственности	2199	\N	\N
103	271	56	1271	\N	1500000	100	18	0	Дом Шереметьевка, коробка под крышей 10х10м, 18 соток, все коммуникации	2200	\N	\N
104	351	56	1271	2	1700000	\N	\N	0	Дом Шереметьево дом 2х эаж с коммуникациями иудобствами	2201	\N	\N
105	491	56	1286	2	450000	\N	\N	6	Дом Прости, дом блочный,2х этажный, баня, вода в доме.	2202	\N	\N
106	431	56	184	\N	990000	50	\N	0	Дом Прости, ул.Луговая, 50 кв.м, ухоженный сад, отопление	2203	\N	\N
107	488	56	1286	\N	1400000	\N	20	0	Дом Прости: 20 сот., баня в доме, сарай, все насаждения	2204	\N	\N
108	387	56	1286	\N	3000000	150	30	0	Коттедж  Прости, 150 кв.м., погреб, гараж, хоз.постройки, всё есть, 30 с земли, все насаждения	2205	\N	\N
109	391	56	115	2	9880000	288	16	1	Коттедж Афанасово, ул.Покровская. 2-х эт.кирп.дом. S=288; 16 соток. Торг	2206	\N	\N
110	349	56	1266	\N	3500000	\N	\N	0	Коттедж Б.Афанасово ул.Садовая	2207	\N	\N
111	488	56	96	2	7900000	\N	\N	1	Коттедж Б.Афанасов, Центральная 19: 2-хэтажный кирпичный + капитальный цоколь, баня, сарай, летние домики	2208	\N	\N
112	271	56	1266	\N	4300000	280	10	1	Коттедж Б.Афанасово, дом кирп. 280кв.м. без внутренней отделки, 10 соток земли, фото	2209	\N	\N
113	271	56	1211	2	4900000	154	17	1	Коттедж Б.Афанасово,ул. Дачная, дом 2хэт кирп. 154кв.м., все коммуникации, гараж, банный комплекс, 17 с, фото	2210	\N	\N
114	266	56	1211	\N	5300000	180	20	0	Коттедж Б.Афанасово, ул. Дачная,  180 кв.м евро, земля 20 соток, гараж, баня.	2211	\N	\N
115	507	56	1266	\N	4500000	250	15	0	Коттедж Б.Афанасово S250,баня,бассейн,15сот,	2212	\N	\N
116	484	56	96	2	7000000	230	25	1	Коттедж Б.Афанасово, Центральная: 2-хэтажный + цоколь кирпичный, S=230, евро, 25 сот., гараж на 2 авто, погреб	2213	\N	\N
117	271	56	102	\N	2600000	72	20	0	Коттедж Б.Афанасово, ул. Красная, дом 72кв.м., 20 соток, все коммуникации, можно обмен на квартиру в НК, фото	2214	\N	\N
118	271	56	104	\N	3500000	100	25	0	Коттедж Б.Афанасово, ул. Пролетарская, дом 100кв.м., все коммуникации, 25 соток, фото	2215	\N	\N
119	403	56	548	\N	4500000	\N	\N	0	Коттедж 36-мкр Субай, торг, обычный	2216	\N	\N
120	474	56	111	2	6700000	581.200000000000045	12	0	Коттедж 36мкр-н,Афанасовская20: 2-хэтаж.+цоколь,S=581,2,евро,меб.,люстры,бра,жалюзи,шторы,12сот.,все насажд.(плодоносят)	2217	\N	\N
121	424	56	1266	2	4900000	250	15	3	Коттедж Большое Афанасово Дом 2этажный, сруб, новый!! 250 кв.м, баня, бассейн, участок 15 соток	2218	\N	\N
122	429	56	111	2	7600000	500	\N	0	Коттедж 36-й мкр-н 2х эт,  S=500 кв.м,(ул.Афанасовская) с ремонтом, со всеми удобствами,	2219	\N	\N
123	269	56	111	2	4800000	290	12	1	Коттедж 36 мкр.,290 кв.м..2эт кирпич,  земля 12 соток, первая линия,  есть фото, торг	2220	\N	\N
124	271	56	111	2	8500000	440	\N	1	Коттедж 36мкр 2хэт.кирп.440кв.м.	2221	\N	\N
125	294	56	1271	1	5000000	118	40	1	Коттедж  Шереметьевка 1эт.кирпичный 118 кв.м, 40 соток, баня, летняя кухня, болерная, теплица, сарай, 2 погреба	2222	\N	\N
126	271	56	114	\N	2500000	60	\N	0	Коттедж  Шереметьевка Западная 60кв.м.,	2223	\N	\N
127	271	56	1271	\N	6500000	202	25	0	Коттедж  Шереметьевка 202кв.м., 25с, настоящее родовое поместье	2224	\N	\N
128	365	56	1271	1	3150000	70	20	3	Коттедж  Шереметьевка, 1-ноэтажный из бревна, 70 кв.м, с/узел в доме, баня, гараж, хоз.постройки, 20 соток.	2225	\N	\N
129	271	56	1271	\N	2500000	\N	\N	0	Коттедж  Шереметьевка, новый дом, все коммуникации проведены, предчистовая отделка	2226	\N	\N
130	508	56	114	1	2100000	71	14	1	Коттедж  Шереметьево, Западная,1-но эт, .кирп.S-71квм, 14 сот,газ.отопл.,вода в доме, надв.постр,плод.сад	2227	\N	\N
132	500	56	1414	2	160000	\N	6	0	Дача Березовая грива, 2эт дом, вода в доме, баня,6 сот,  половина газон, насаждения есть	2229	\N	\N
133	499	56	548	\N	650000	12	\N	\N	Земля 36 мкр, Субай 12 соток под ИЖС	2230	2	\N
134	498	56	1266	\N	220000	\N	15	0	Земля с.Б.Афанасово, 15 сот., свет до участка, обин собственник, торг	2231	\N	\N
135	269	56	1289	2	3990000	\N	15	0	Дача Пробудиловка, 15 соток, 2эт дом, баня отдельно, отличная, свой берег озера, в собственности, торг	2232	\N	\N
136	269	56	1289	\N	400000	\N	6	0	Дача Пробудиловка, 6 соток,дачный обычный дом, баня, в собственности	2233	\N	\N
137	269	56	155	\N	1500000	42	10	0	Дача Кошчылык, Красный Ключ, Набережная, 42 кв.м. дом, баня, свет круглогодично, 10 соток	2234	\N	\N
138	269	56	1415	2	1650000	\N	\N	0	Дача Шишкин Хутор, м.121,Супер 2х этажная ДАЧА по 121 маршруту, СНТ Шинник, построена в 2015 году, все новое, очень много вложено, пластиковые окна, есть балкон, своя скважина, отличная баня, просторная кухня, новый кухонный гарнитур, газ.плита, в доме горячая вода, туалет в доме, теплый пол (отопление), новый забор из профнастила. Участок ухожен, теплица, летняя кухня(4х6),с дровянником и барбекю, хоз.помещение(курятник), есть заезд для двух машин, надувной бассейн 12тонн.ЭЛЕКТРИЧЕСТВО КРУГЛЫЙ ГОД.До озера 60 метров, до Камы 10 мин.Продается в связи с переездом в другой город.	2235	\N	\N
131	523	56	569	\N	1600000	\N	8	\N	\N	2228	\N	\N
139	499	56	548	\N	1020000	\N	24	\N	Земля 36 мкр, субай 24 соток под ИЖС	2236	2	\N
140	528	56	1266	\N	800000	\N	14	0	Земля Афанасово, 14 соток, гараж, баня	2237	\N	\N
141	499	56	1300	\N	150000	\N	4	1	Дача Дмитриевка , рядом озера, 4 сотки все насаждения , дом кирпичный , торг	2238	\N	\N
142	507	56	1300	2	380000	\N	4	0	Дача р-он Дмитривки 121 маршрут,4сот,баня,2этдомик	2239	\N	\N
481	271	56	1479	\N	0	\N	16	0	Земля Туба, ул. Чапаева, свет, газ, 16 соток	3087	\N	\N
143	523	56	103	\N	1500000	\N	\N	0	Б. Афанасово, ул. Учительская, 2 участка с домом и хозпостройками,	2240	\N	\N
144	523	56	1271	\N	300000	\N	15	0	Земля Шереметьевка 15 соток, в собственности	2241	\N	\N
145	351	56	1414	\N	1000000	75	\N	3	Дом Березовой гриве бревно, новый не введен в эксплуатацию пло 75 кв.м	2242	\N	\N
146	526	56	1421	\N	1700000	\N	20	0	Дом Байданкино с мансардой, гараж,  жилой, 20 соток земли	2243	\N	\N
147	499	56	1426	\N	550000	36	40	3	Дом Балчиклы,  дерев,36кв.м , 40 сот земля , газов .отопл, баня + хоз  постр , все насажден	2244	\N	\N
149	507	56	1270	\N	450000	\N	39	3	Дом  Клятли, Шингальчинское пос., бревенчатый дом, 39 сот., коммун+	2500	\N	\N
150	424	56	1511	\N	1800000	\N	15	3	Дом  Красная Кадка, сруб, обшит сайдингом,  15 соток, баня,  опеки нет	2501	\N	\N
151	391	56	1511	\N	1850000	\N	16	3	Дом  Красная Кадка. Недостр.дом из сруба. Баня. 16 соток. Торг	2502	\N	\N
152	436	56	1216	\N	555000	\N	34	3	Дом  Мамадышский р-н, с. Секинесь, ул. Бол. Красная 50, 34 сот., бревенчатый дом, бревенчатая баня, Торг!	2503	\N	\N
153	507	56	1572	\N	350000	\N	53	3	Дом  Оша р-н Н.Уратьма, бревенчатый, погреб, фундамент, стройматериалы, 53 сот.колодец коммун+	2504	\N	\N
155	265	56	1439	\N	800000	50	20	0	Дом Большие Аты Нижнек.район, дом зимний 50 кв.м с газовым отоплением, 20 соток, газ, вода, свет, торг	2506	\N	\N
156	271	56	861	\N	1800000	76	35	1	Дом Борок ул. Центральная кирп.76кв.м., 35с	2507	\N	\N
157	507	56	1267	2	1300000	\N	40	3	Дом Борок, 1 эт бревенчатый,40 сот коммун+ баня кирп. Гараж 2х эт недостроенный, центр	2508	\N	\N
159	271	56	1268	\N	1500000	66	25	0	Дом В.Челны дом 66 кв.м., 25 соток, баня, сарай, все коммуникации, нужна 2к НК, фото	2510	\N	\N
160	387	56	1268	\N	1450000	65	25	\N	Дом Верхние Челны, 65 кв.м., земля 25 соток	2511	\N	\N
161	313	56	1268	\N	480000	\N	33	3	Дом Верхние Челны, деревянный, газпроведен, баня, хоз постройки, земля 33 сот., торг.	2512	\N	\N
162	271	56	580	\N	1700000	110	5	0	Дом Дуслык снт 110кв.м., 5с	2513	\N	\N
163	271	56	580	\N	1300000	60	8	0	Дом Дуслык снт зимний вариант 60кв.м., канализация, отопление, свет, вода в доме, совр.ремонт, 8с, баня	2514	\N	\N
164	271	56	1452	\N	900000	100	27	1	Дом Елантово кирп. 100кв.м., отопление, свет, газ есть, канализации нет, 27с	2515	\N	\N
165	271	56	1452	\N	1800000	65	\N	1	Дом Елантово кирп. 65кв.м.	2516	\N	\N
166	529	56	1452	\N	1300000	\N	25	0	Дом Елантово, 25 соток земли, 100м от берег, все коммуникации.	2517	\N	\N
167	483	56	1253	\N	1430000	\N	\N	1	Дом Заинский р-н,с.Ниж.Бишево, кирпичный,баня пристроена,газ,вода,хоз. Постройки	2518	\N	\N
168	470	56	883	\N	800000	\N	\N	0	Дом и земьля г. Мензелинск, ул. Комсомольская . ! Эт,  вода , свет, газ. Есть баня. Сарай	2519	\N	\N
169	271	56	1280	\N	1000000	50	20	0	Дом Красный Яр, дом пятистенок 50кв.м., баня, 20с	2520	\N	\N
170	477	56	1284	1	1850000	144	13	1	Дом Каенлы: 1-ноэтажный кирпичный, S=12х12, незавершенный строительством, с/у в доме, 13 сот., баня 4,5х12	2521	\N	\N
171	526	56	1421	2	21000000	\N	18	1	Дом кирпичный 2-эт Байданкино, 18 соток, баня, кирпич.сарай, забор новый, ухоженный участок	2522	\N	\N
172	271	56	106	\N	1500000	55	6	0	Дом Красный Ключ, ул. Нагорная, дом пятистенок 55 кв.м., 6 соток, фото	2523	\N	\N
173	285	56	1572	\N	200000	\N	35	3	Дом Оша бревенчатый дом, 35 соток	2524	\N	\N
174	271	56	1572	\N	680000	100	200	2	Дом Оша брус 100кв.м.новый летнего типа (без отопления), 20с	2525	\N	\N
175	271	56	1572	\N	350000	\N	42	0	Дом Оша пятистенок, газ подведен, 42с	2526	\N	\N
176	508	56	92	\N	1200000	54	5	1	Дом п.Строителей,Романт,1э.кирп. S-54,з.-5сот.,баня,сарай.Сост.обыч.или обмен на Вятские Поляны. Торг.Ч.П.	2527	\N	\N
177	351	56	107	\N	5500000	\N	\N	0	Коттедж п.Строителей не требует вложений супер ул. Центральная, за универсамом хорошая улица	2528	\N	\N
178	507	56	1275	\N	4000000	\N	15	1	Коттедж п.Строителей, блок+кирпич, гараж, черновая, отопление+, свет+, канализация ценрт. Док+15 сот	2529	\N	\N
154	492	56	1426	\N	650000	\N	45	3	Дом Балчиклы, дерев, газ, свет, колодец, 45 соток	2505	\N	\N
148	316	56	1426	1	1890000	73	13	\N	Дом  Балчыклы, дом одноэтажный, 73кв.м., баня, гараж, надворные постройки, земля 13 сот.,все удобства дома	2245	\N	\N
482	507	56	1480	\N	200000	\N	\N	0	Земля ТУБА 10сот,док+,25км от  Нижнекамска	3088	\N	\N
483	271	56	1274	\N	350000	\N	17	0	Земля Соколки 17с	3089	\N	\N
484	271	56	1274	\N	450000	\N	8	0	Земля Соколки 8с	3090	\N	\N
179	271	56	1275	1	3800000	80	15	1	Коттедж пос.Строителей 1эт.кирп. 80кв.м.+цоколь, 15с земли, баня, забор профнастил	2530	\N	\N
180	507	56	107	3	6000000	136	9	0	Коттедж пос. Строителей Центральная, 3х эт. Все есть.9 сот, 136кв.м., 1 эт гараж, котельная,есть фото.	2531	\N	\N
181	431	56	92	\N	2500000	100	\N	1	Коттедж пос.Строителей, ул.Романтиков, 100 кв.м, кирпичный, баня, насаждения, хоз.блок	2532	\N	\N
182	526	56	604	\N	10000000	170	22	0	Коттедж ИЛЬИНКЕ, ул. Озерная (правая сторона, 170 кв.дом жилой, баня, гараж с хоз.блоками, 22 сотки	2533	\N	\N
183	477	56	50	1	4700000	\N	\N	1	Коттедж Каенлы: 1-ноэтажный кирпичный, евро, возможен обмен на 2-х или 5-ти в г. Нижнекамске	2534	\N	\N
184	507	56	234	1	2250000	\N	15	2	Коттедж Кам.Поляны,пос,Новосёл, 1эт,брус,15сот, ремонт,вода,свет,газ,коммун.пл.дома90кв.	2535	\N	\N
185	271	56	1296	1	2400000	90	15	2	Коттедж Камские Поляны брус 1эт. 90кв.м., газ. Свет, вода, септик, 15с	2536	\N	\N
186	391	56	1462	1	2950000	100	33	1	Коттедж Клятле. 1-но эт.кирп.дом. Баня. Гараж. S=100; 33 сот.	2537	\N	\N
187	271	56	1462	2	3000000	\N	20	1	Коттедж Клятли 2хэт.кирп, 20с, 2 гаража, 2теплицы, баня	2538	\N	\N
188	275	56	1462	\N	2050000	91	24	1	Коттедж Клятли 91кв.м., сруб+кирпич+сайдинг, коммуникации в доме, баня, гараж, 24с	2539	\N	\N
189	269	56	1295	2	6500000	307	14	1	Коттедж Кр. Ключ, 2 эт кирпич 307 кв.м., баня отдельно 22 кв.м., гараж, 14 сот в собственности, газ, свет, вода	2540	\N	\N
190	271	56	101	\N	15000000	635	15	0	Коттедж Красный Ключ ул. Тихая, коттедж 635кв.м., все коммуникации, 15 соток земли, можно под гостиницу, фото	2541	\N	\N
191	271	56	1295	\N	28000000	\N	\N	0	Коттедж Красный Ключ элитный	2542	\N	\N
192	475	56	1289	2	2790000	140	12	1	Коттедж Красный ключ,Пробудиловка,2-х эт кирп.дом,S=140+цокольный этаж,баня,гараж кирп,уч.12сот	2543	\N	\N
193	271	56	1289	\N	2270000	45	12	3	Коттедж Пробуждение 45кв.м. бревенчатый, 12 соток, гараж, баня	2544	\N	\N
194	459	56	1563	1	2500000	60	28	0	Коттедж Ключ труда, Ташлык,1эт дом 60кв,28 сот земли, хоз.блоки 10*20	2545	\N	\N
195	439	56	173	\N	5300000	336	10	0	Коттедж Субай 336 кв.м., участок 10 сот., сауна в доме, теплый гараж, баня	2546	\N	\N
196	488	56	496	2	20000000	225	70	1	Коттедж Нижнекамск, Береговая: 2-хэтажный кирпичный, S=225, 70 сот.	2547	\N	\N
197	429	56	1408	2	7500000	200	30	0	Коттедж Минькино, 2-х эт., 200 к.м., 30 сот., баня, гараж, сад, евроремонт. + 3 гектара земли	2548	\N	\N
198	271	56	1408	\N	2500000	139	20	0	Коттедж Минькино, дом 139 кв.м., 20 соток, все коммуникации, баня, фото	2549	\N	\N
199	271	56	1408	\N	3200000	224	25	0	Коттедж Минькино, дом 224 кв.м., 25 соток, фото	2550	\N	\N
200	328	56	1402	\N	4700000	116	15	0	Коттедж Новое Минькино,ул.Луговая, дом 116кв,земля 15сот,баня,насаждения,хор.ремонт,торг	2551	\N	\N
201	488	56	1244	1	3000000	73	23	0	Коттедж Сарсаз Бли: 1-ноэтажный, 2011 года постройки, S=73, 23 сот., баня, гараж, сарай, 2 погреба	2552	\N	\N
202	498	56	1244	1	2650000	\N	38	\N	Коттедж Сарсаз-Бли ,1-но этаж, земля 38 соток, все коммуник., все насаж., 1 собственник	2553	\N	\N
203	424	56	1270	1	4700000	225	30	0	Коттедж Шингальчи 1 этажный, 225кв.м, баня,  подземный гараж-склад, 30 соток земли, торг есть	2554	\N	\N
204	475	56	1270	1	6000000	160	\N	1	Коттедж Шингальчи, 1-но эт кирп, S=160 +цоколь. под всем домом, 4 года назад построен, в отл\\сост, 1 собст	2555	\N	\N
205	387	56	1292	\N	2700000	113	\N	0	Коттедж Нариман, Шереметьевский с/с, 113 кв.м., баня, э/энергия	2556	\N	\N
206	271	56	111	\N	0	\N	\N	0	Коттедж коробка 36мкр коттеджный поселок, коммуникации подведены, в продаже пять домов	2557	\N	\N
207	271	56	1292	\N	0	356	21	0	Коттедж Наримановка 356кв.м. 21с	2558	\N	\N
208	526	56	1292	2	3200000	\N	30	0	Коттедж Наримановка,30 соток,дом 2-х,баня отдельно,экология,лес,пруды, трасса 150 м	2559	\N	\N
209	436	56	973	\N	1900000	150	10	0	Коттедж Мензелинск, Хусаинова 10, Трех уровневый дом + подвал во весь дом (10х15), 10 сот.	2560	\N	\N
210	308	56	1286	1	3200000	110	25	1	Коттедж Прости, дом кирпич одноэтажный, 110 кв.м., баня, два гаража, сад, земля 25 сот.,все удобства дома	2561	\N	\N
211	475	56	1286	2	2200000	70	17	3	Коттедж Прости,дом брев,S=70,окна,двери,с\\у кафель,2-й дом S=36,все коммуникации подведены,уч.17,хоз.постройки	2562	\N	\N
323	271	56	1426	2	2800000	100	15	0	Коттедж Балчиклы 2хэт. 100кв.м., гараж, баня,, 15с	2929	\N	\N
212	492	56	1567	2	3000000	180	15	0	Коттедж Кр.Бор, 2х этажный, S=180, все удобства, 15 соток, ч/пр	2563	\N	\N
213	387	56	1275	\N	3700000	150	30	0	Коттедж Строителей , 150 кв.м., погреб, гараж, хоз.постройки, всё есть, 30 с земли, все насаждения	2564	\N	\N
214	271	56	1611	\N	3800000	\N	\N	0	Коттедж Старое Пальчиково	2565	\N	\N
215	434	56	1611	2	4900000	\N	\N	0	Коттедж Старое Пальчиково (40 км), 2 эт+цоколь+мансарда, кирп, сауна на дровах, газ, вода, охрана, теплица, отличный	2566	\N	\N
216	271	56	1611	\N	3800000	312	32	0	Коттедж Старое Пальчиково 312 кв.м., 32с	2567	\N	\N
217	275	56	1611	\N	150000	\N	20	0	Земля Старое Пальчиково Заинский район 20с, газ и свет по улице	2568	\N	\N
218	492	56	1292	\N	1500000	\N	6	1	Дом Нариман,  кирпич. дом ,все удобства,6 соток	2569	\N	\N
219	275	56	1292	\N	0	150	\N	0	Дом Наримановка 150кв.м.+подвал на весь дом, 2001года постройки	2570	\N	\N
220	271	56	1292	\N	1900000	62.2000000000000028	9	1	Дом Наримановка кирп.62,2кв.м., 9 соток, бани и гаража нет, свет, газ, вода , сарай	2571	\N	\N
221	290	56	1292	\N	400000	\N	28	0	Д. Нариман земельный участок, 28с, свет,вода, газ подведены, рядом озеро, фото	2572	\N	\N
222	271	56	49	\N	3000000	120	47	3	Коттедж  Трудовой сруб 10х12, 47с	2573	\N	\N
223	271	56	1287	\N	2300000	200	20	0	Коттедж Трудовой 10х20 кирп, 20с	2574	\N	\N
224	271	56	1287	\N	1280000	73	10	6	Дом Трудовой 73кв.м. одноэт керамзито-бетонный, баня , забор профнастил, 10 соток	2575	\N	\N
225	271	56	1287	\N	500000	91	20	0	Дом Трудовой недострой 91кв.м., 20с	2576	\N	\N
226	271	56	49	\N	200000	\N	20	6	Земля Трудовой 20с, коробка из керамзитных блоков	2577	\N	\N
227	271	56	49	\N	200000	91	20	6	Земля Трудовой 20с, фундамент 91кв.м., блоки, плиты перекрытия	2578	\N	\N
228	271	56	1267	\N	150000	\N	12	\N	Земля Борок 12с кад.№16:30:021201:2133	2701	\N	16:30:021201:2133
229	424	56	1267	2	2320000	\N	15	6	Коттедж Борок , блочный, 2 этажа, 15 соток, хоз.постройки, баня, гараж, колодец	2702	\N	\N
230	342	56	1267	2	3850000	150	15	0	Коттедж Борок, 2 этажа, площ.150кв.м.+15земля, все есть, отл.состояние	2703	\N	\N
231	481	56	1267	\N	4000000	120	\N	1	Коттедж Борок: блочно-кирпичный, S=120, коммуникации, все хоз.постройки, все насаждения	2704	\N	\N
232	266	56	1267	\N	200000	\N	12	\N	Земля Борок (многодетным) 12 соток кадастр.номер 16:30:021501:367	2705	\N	16:30:021501:367
158	436	56	863	\N	950000	27	17	\N	Дом Борок, ул. Оськино, дом 27 кв.м., земля 17 сот,. Все в собственности, зимний вариант	2509	\N	\N
233	507	56	1267	\N	0	\N	12	0	Земля  Борок, новые участки, дальше кладбища, 12 сот.	2706	\N	\N
234	391	56	1267	\N	150000	\N	12	0	Земля 12 соток. С. Борок. (многодет.семье)	2707	\N	\N
235	269	56	861	\N	650000	\N	16	0	Земля Борок, в самой деревне 16 соток, ул. Центральная,  свет, газ, вода, ровный, не многодетным, торг	2708	\N	\N
236	350	56	1267	\N	350000	\N	15	0	Земля, с. Борок, 15 соток	2709	\N	\N
237	350	56	1267	\N	350000	\N	\N	0	Земля Борок, 15 сот	2710	\N	\N
238	523	56	1267	\N	550000	\N	55	\N	Земля Борок, 55 соток, ИЖС, в собственности	2711	2	\N
239	523	56	1267	\N	200000	\N	17	\N	Земля Борок, 17 соток, ИЖС, в собственности, ул.Звездная, (не многодетных)	2712	2	\N
240	351	56	858	\N	400000	\N	17	0	Борок зем.участок, на  ул. рядом с Молодежной, 17 соток, асфальт.дорога	2713	\N	\N
241	429	56	1267	\N	230000	\N	12	0	Земля с.Борок, 12 соток, свет подведен к участку	2714	\N	\N
242	271	56	1267	\N	200000	\N	15.5	0	Земля Борок 15,5с	2715	\N	\N
243	271	56	1267	\N	350000	\N	10	\N	Земля  Борок 10 соток кад.№ 16:30:021303:155	2716	\N	16:30:021303:155
244	271	56	1267	\N	220000	\N	\N	0	Земля Борок, 12 соток, для многодетных семей	2717	\N	\N
245	275	56	1267	\N	300000	\N	15	0	Земля Саулык за с. Борок, 15соток	2718	\N	\N
246	271	56	1267	\N	300000	\N	10	0	Земля Борок, 10с	2719	\N	\N
247	320	56	1267	\N	200000	\N	\N	0	Земля Борок (многодетным) 12 соток	2720	\N	\N
248	320	56	1267	\N	400000	\N	15	0	Земля Борок за церковью 15 соток, газ, свет, торг	2721	\N	\N
249	271	56	1414	\N	5000000	\N	\N	0	Коттедж Березовая Грива Сказочный терем! Банный комплекс, бассей и пр.	2722	\N	\N
250	488	56	1414	\N	10000000	200	13	0	Коттедж Березовая Грива: S=200, 13 сот., баня, гараж, на берегу	2723	\N	\N
251	271	56	1414	\N	350000	\N	10	0	Земля Березовая Грива 10 соток	2724	\N	\N
252	271	56	1414	\N	850000	\N	15	0	Земля Березовая Грива 15 соток, строительные блоки	2725	\N	\N
444	523	56	1254	\N	5000000	\N	\N	0	Земля на Чистопольской, промназначения,  4,2	3050	\N	\N
253	271	56	1414	\N	20000	\N	26	0	Земля Березовая Грива рядом с озером и дубовой рощей 13с+13с вместе или по отдельности	2726	\N	\N
254	271	56	1414	\N	350000	\N	12	0	Земля Садовод-НК Березовая грива 12 с	2727	\N	\N
255	271	56	1414	\N	500000	\N	10	0	Земля Березовая Грива 10соток 100м от деревни	2728	\N	\N
256	271	56	1612	\N	180000	\N	12	0	Земля Березовая Грива СНТ Садовод-НК, 12 соток, в собственности, вокруг сосновый бор	2729	\N	\N
257	469	56	1414	\N	850000	\N	15	0	Земьля Березовая грива, 15 соток	2730	\N	\N
258	469	56	1414	\N	500000	\N	8	0	Земьля Березовая грива 8 соток	2731	\N	\N
259	351	56	1414	\N	1000000	\N	\N	3	Березовая грива бревенчатый , незаве	2732	\N	\N
260	387	56	1414	\N	900000	\N	9	3	Дача Берёзовая грива, сруб - новый бревенчатый дом, баня отдельно, 9 соток земли, озеро близко	2733	\N	\N
261	507	56	1414	\N	210000	\N	10	0	Земля Березовая грива 10 сот газ+ 10 метров, свет+, вода+	2734	\N	\N
262	432	56	1243	\N	700000	\N	\N	0	Дом  Алексеевский р-н . с.Сахаровка, 20 сот.земли, дом 1эт. 38 кв.м	2868	\N	\N
263	434	56	1243	\N	650000	\N	\N	3	Дом 1 эт 32 кв.м.дом деревянный,есть баня,газ,вода(своя скважина),сад(все насаждения)	2869	\N	\N
264	271	56	1618	\N	1500000	\N	\N	2	Дом Масловка Рыбос-ской район баня 6х4брус+пристрой 8х4, фундамент 8х10, свет, газ, вода, забор профнастил, 8с	2870	\N	\N
265	350	56	1617	\N	500000	\N	\N	0	Дом Аксубаевский р-н,Ак буре, дом в хорошем состояние	2871	\N	\N
266	271	56	1616	\N	850000	\N	\N	0	Дом Арбузов Баран Алексеевский район 82кв.м. кирп, 12с, баня, гараж, сарай, теплица, беседка	2872	\N	\N
267	405	56	1619	1	750000	53	31	3	Дом Елабужский р-н,сМОРТЫ, 31сот.земли,53кв.м./бревно,газ,электричество,вода в доме.+Баня.	2873	\N	\N
268	271	56	1620	\N	1750000	\N	\N	0	Дом Бакташ Новошешминский район	2874	\N	\N
269	391	56	1485	1	1500000	61.3999999999999986	9.5	1	Дом Болгары, кирпичный дом на две семьи, S=61,4; три комнаты, 9,5 соток, газ и свет проведены, баня из блоков	2875	\N	\N
271	342	56	1622	\N	850000	50	\N	0	Дом Заинский район, с.Верхние Лузи, 50кв.м., баня	2877	\N	\N
272	342	56	1622	\N	400000	50	\N	0	Дом Заинский район, с.Верхние Лузи, 50кв.м., бревенчатый, баня	2878	\N	\N
273	397	56	1622	2	800000	\N	\N	0	Дом Заинский р-н.д.Керекес. Дом 2-х эт. Баня. Водоем. Все коммуникации.	2879	\N	\N
274	342	56	1623	\N	1400000	140	\N	0	Дом Заинский р-он д. Аксарино S=140+зем. Черновая	2880	\N	\N
275	486	56	1625	\N	8500000	62	12	3	Дом Кзыл Юл: 1-ноэтажный бревенчатый, S=62, 12 сот., новая баня	2881	\N	\N
276	469	56	1626	\N	1900000	155	12	7	Дом Котловка, S-155, 12 соток земли, газ, свет на улице, вода канализация готова , СИП панел.	2882	\N	\N
277	351	56	1517	\N	800000	\N	20	3	Дом Кулмакса, дом жилой все коммуникации бревно ухоженный , газ и вода есть,земля 20 соток. Экологический	2883	\N	\N
278	271	56	1517	\N	1100000	100	11	1	Дом Кулмаксы 100кв.м. кирп+блок, баня, сарай, гараж, 11с	2884	\N	\N
279	402	56	1517	\N	900000	93	11	1	Дом Кулмаксы, Кирпичный S-93, земьля 11 сот, гарж, баня, вода,газ, отопление	2885	\N	\N
280	507	56	1517	1	400000	\N	40	3	Дом Макаровка 1 эт. Бревно  40 сот коммен + отопл. Печное гараж забор старый жить можно	2886	\N	\N
281	271	56	1465	\N	400000	\N	\N	0	Дом Макаровка пятистенок, 30с, гараж, забор	2887	\N	\N
282	436	56	86	\N	1620000	125	6	1	Дом Мамадыш, Давыдова 125, дом на две семьи,6 соток, газ, погреб	2888	\N	\N
283	487	56	1628	1	1500000	90	\N	3	Дом Мамадышский р-н п.Новый 1-этаж дом S=90, из нового сруба,обшит сайдингом, с баней,свет,вода,газ	2889	\N	\N
284	396	56	1627	\N	1050000	70	6	0	Дом Мамадышский р-он п. Камс. Леспромхоз, 70кв.м, все комм-ции,баня,летний домик,хоз. Постройки, участок 6 соток	2890	\N	\N
285	282	56	1629	\N	750000	\N	28	0	Дом Мензелинский район, с. Наратлы Кичу, рядом с Куземетьево, баня, сарай, 28 соток	2891	\N	\N
286	282	56	1633	\N	300000	64	18	3	Дом Мамадышский район, д. Верхний Сюнь, бревенчатый дом 64 кв.м, баня, 18 соток, газ, вода	2892	\N	\N
287	504	56	1279	1	1670000	83	15	1	Дом Нижн Уратьма, 1 эт, кирп, 83 кв м,  ванна, туал дома, баня, гараж, хозпостр,  з/уч 15 с,обм на 2-х, торг	2893	\N	\N
288	478	56	1662	\N	1500000	100	12	0	Дом Ношешминск, дом S= 100 кв.м, 12 соток	2894	\N	\N
289	397	56	1630	\N	800000	\N	21	0	Дом Пестречинский р-н, д.Кулаево , 1-но эт, дерев., 35 км от Казани. 21 сот.	2895	\N	\N
290	507	56	1459	1	1000000	40	8	1	Дом пос. Камский пол дома кирпичный, 1эт., 40 кв.м., 8 сот. Под евро коммуникации+, баня, гараж погреб, сарай, мебель док+	2896	\N	\N
291	475	56	1286	1	950000	36	10	3	Дом Прости,дом бревен,S=36,окна,двери,с\\у кафель,септик,ч\\пр,участок 10сот,фото на авито	2897	\N	\N
292	474	56	1286	1	1600000	63	16	3	Дом Прости: 1-ноэтажный бревенчатый, S=63, 3 комнаты + кухня, с/у в доме, 16 сот., баня 4х6, гараж с мансардой, лет.кухня, курятник	2898	\N	\N
293	492	56	1733	1	550000	60	30	0	Дом Рыбная Слобода, деревянный пятистенок, S=60, газ, свет, 30 соток, ч/пр	2899	\N	\N
294	434	56	1530	1	400000	31	20	0	Дом Самоновка,ул. Гагарина,20 сот,дом 31 кв.м,баня,своя скважина(питевая)	2900	\N	\N
295	366	56	1278	\N	1800000	80	17	0	Дом Сарманово, 80 кв.м, все удобства, баня, 17 соток.	2901	\N	\N
296	366	56	1278	\N	2100000	86	16	0	Дом Сарманово, 86 кв.м, гараж, баня, 16 соток.	2902	\N	\N
297	483	56	1244	2	500000	\N	20	0	Дом Сарсаз-Бли, 2-х эт.дом, проведен газ, 20 сот.,  баня, гараж, погреб, все насаждения,,	2903	\N	\N
298	271	56	1631	\N	2000000	100	17	1	Дом Старое Утяшкино Новошешминский район дом сруб обшит кирпичем 100 кв.м., свет, газ, вода, баня, сарай, 17с	2904	\N	\N
299	498	56	1597	1	1650000	90	25	1	Дом Старошешминск, 1 эт, кирпич , 90 кв м , все коммуник, земля 25 сот, или обмен на 2-к город	2905	\N	\N
300	396	56	1597	\N	2000000	70	\N	0	Дом Старошешминск, 70кв.м, все коммуникации, 2000т	2906	\N	\N
301	271	56	1632	1	800000	83.5999999999999943	40	0	Дом Тат.Елтань Чистопольский район коттедж на 2 семьи 83,6кв.м. 4 комнаты, с/у в доме, отопление, баня, 40с	2907	\N	\N
302	424	56	1605	\N	620000	79	16	0	Дом Ташлык 79кв.м,  участок 16 соток, требуется ремонт, газ, вода, элек.-все ест.	2908	\N	\N
303	435	56	1480	2	1650000	\N	20	1	Дом Туба, 2-х.эт. дом, кирп.с цоколем, с постройками, баня,  большой гараж, + 20 соток земли, торг	2909	\N	\N
304	439	56	1459	1	2200000	74	13	1	Коттедж  1 эт.пос.Камский 74 кв.м., утеплен, веранда, баня, гараж, забор из профнастила + участок 13 сот. Торг	2910	\N	\N
305	566	56	1295	2	5500000	80	\N	0	Коттедж  2эт 80 кв м, сруб р-н Красного Ключа, отдельно банный комплекс с летней кухней, 200 метров от реки Кама. Торг	2911	\N	\N
306	340	56	1813	2	4800000	\N	\N	1	Коттедж  36 мкр,2хэт,кирп,гараж внутри, подвал, мансарда, черновой, окна, крыша	2912	\N	\N
307	342	56	1813	\N	1450000	150	10	1	Коттедж  36мкр S=100+50мансарда+10сот.зем. Частичная отделка,крыша черепица,газ,вода,баня в доме.	2913	\N	\N
308	271	56	109	10	2800000	\N	80	7	Коттедж  Б.Афанасово ул. Магистральная, дом 80кв.м. новый из сэндвич-панелей, баня, гараж, 10 соток, фото	2914	\N	\N
309	271	56	1426	\N	2300000	84	16	0	Коттедж  Балчиклы 84кв.м., хороший ремонт, все удобства в доме, 16с земли, нужна 2к в НК	2915	\N	\N
310	285	56	1886	\N	4000000	122	10	0	Коттедж  Большая Шильна 11*11, земля 10 соток	2916	\N	\N
311	275	56	1990	\N	3700000	60	\N	0	Коттедж  Боровецкий лес (Челны) 60кв.м., все удобства, можно обмен на 1к в Челнах	2917	\N	\N
312	271	56	1300	\N	3800000	\N	10	0	Коттедж  Дмитриевка берег озера, домик пятистенок.ю баня, 10с, хоз.постройки, 10с	2918	\N	\N
313	431	56	2013	\N	2550000	\N	\N	0	Коттедж  Заинск, с.Светлое Озеро,	2919	\N	\N
314	432	56	1231	\N	3999000	\N	\N	0	Коттедж  Кзыл Яр, ул. Садовая, 36Б, баня, гараж, теплицы, беседка, в отличном сосотоянии	2920	\N	\N
315	320	56	1563	\N	2500000	100	42	3	Коттедж  Ключ труда новый сруб 100 кв.м, евро, коммуникации, баня, 42 сотки	2921	\N	\N
316	271	56	1282	\N	2350000	100	10	0	Коттедж  Мамадыш 100кв.м. кирп., 10с, теплица, гараж, баня, сарай	2922	\N	\N
317	294	56	1279	\N	3050000	110	30	1	Коттедж  Нижняя Уратьма кирп. 110 кв.м, 30соток, баня, гараж,сараи, кладовки, ч/пр., пустая	2923	\N	\N
318	396	56	1408	1	7000000	\N	\N	0	Коттедж  Новое Минькино, 1-этаж, сруб, баня, гараж, супер	2924	\N	\N
319	529	56	1605	1	4000000	75	15	0	Коттедж  Ташлык, 1 эт. 75 кв.м, все есть, 15 соток	2925	\N	\N
321	271	56	2055	\N	13000000	280	20	0	Коттедж 280кв.м., 20 с,  около дамбы, недалеко от б/о Дубки на берегу озера, р. Кама ч/з дорогу, фото на	2927	\N	\N
322	432	56	1295	2	3800000	300	9	0	Коттедж 2-х эт 300 м2, Тукаев.р-н, дер.Яна Буляк 30км от Челн, насаждения, баня, гараж, хоз.постройки, 90 сот.земли	2928	\N	\N
324	349	56	1426	2	3000000	240	15	0	Коттедж Биклянь,2-х этаж., кирп, 240 кв.м, земля 15 сот, Супер! Все есть! Дешево!	2930	\N	\N
325	424	56	1485	1	2200000	75	7	1	Коттедж Болгар, 1 стена спаренная, пл.75 кв.м, баня, теплицы, гараж, 7 соток земли	2931	\N	\N
326	320	56	1485	1	1500000	80	8	0	Коттедж Болгары, кирп.1этажный 80 кв.м, 4 комнаты, ремонт, св.санузел, 8 соток, нов.баня, хозпостройки	2932	\N	\N
327	504	56	195	\N	2950000	103	30	1	Коттедж В Челны Молодежная, 103 кв м, отл ремонт, кирп, 30с з/уч, гараж, баня, все коммун	2933	\N	\N
328	349	56	1268	2	3700000	\N	32	0	Коттедж Верх.Челны, 2-х этажный, земля 32 сот	2934	\N	\N
329	271	56	1300	\N	2950000	\N	\N	0	Коттедж Дмитриевка	2935	\N	\N
330	271	56	1300	2	4400000	150	\N	1	Коттедж Дмитриевка дом 2хэт.кирп. 150кв.м., все коммуникации, баня, беседка, настоящий загородный дом! Фото	2936	\N	\N
331	271	56	1298	\N	5000000	\N	\N	0	Коттедж Ерыклы 10,5х10,5	2937	\N	\N
332	429	56	2060	\N	2250000	\N	15	0	Коттедж Заинский район, с. Старозаинск, ул. Кухарево, все постройки, 15 соток	2938	\N	\N
333	342	56	2059	\N	2600000	\N	\N	0	Коттедж Ижевка Менделеевского р-на, на берегу КАМЫ, ипотека, чп,	2939	\N	\N
334	271	56	1255	2	12000000	180	12	1	Коттедж Ильинка,современный из сруба 180 кв.м. 2хэт, все коммуникации, 12 с, гараж, баня, большая беседка, фото	2940	\N	\N
335	492	56	1297	2	7950000	200	20	1	Коттедж Казань, 2х этажный, S=200, 20 соток, под евро	2941	\N	\N
336	492	56	2062	2	5900000	\N	6	0	Коттедж Казань, д.Салмачи, 2х этажный, ремонт, 6 соток, ч/пр	2942	\N	\N
337	432	56	2063	2	4350000	75	\N	0	Коттедж Высокая Гора,2-х эт.дом 7,5х10, утеплен,газ.кот, центр.водоот.	2943	\N	\N
338	507	56	2064	\N	6700000	290	10	1	Коттедж Борковский кордон Б/О Лесная Всё супер. 10 сот. S-290, кирп. Озеро.	2944	\N	\N
339	342	56	2064	\N	7000000	215	10	0	Коттедж Борковский Кордон (Дубравушка) S=215+10сот.зем. С мебелью+техника	2945	\N	\N
340	366	56	1278	\N	4300000	140	13	0	Коттедж Сарманово, 140 кв.м, ремонт, баня, 13 соток, ч/п.	2946	\N	\N
341	500	56	2065	2	3200000	\N	20	0	Коттедж Смыловка ул.Школьная.2эт.дом вода, с/у в доме, 20 сот,баня отопление,2 гаража, сарай блочн., газон беседка все ухоженое	2947	\N	\N
342	308	56	1597	\N	4000000	\N	\N	1	Коттедж Страрошишминске .кирпич, одноэтажгый отл.состояние,баня,хоз.постройки,коммуникации в доме,2 гаража	2948	\N	\N
343	271	56	2058	\N	4600000	150	10	1	Коттедж Старые Ерыклы 150кв.м.кирп., баня 5х3, 10с земли	2949	\N	\N
344	349	56	1234	2	8500000	\N	\N	0	Коттедж Табеева пр.Строителей 122, 2эт дом,готовый к проживанию	2950	\N	\N
345	507	56	2085	1	2000000	100	17	3	Коттедж Тат.Утяшкино Новош.р_н,  1эт бревно обл. кирп. , жлой 100 кв.м. 17 сот. Баня гараж, сарай	2951	\N	\N
346	271	56	1605	2	5500000	210	20	2	Коттедж Ташлык 210кв.м. 2хэт. Брус, все коммуникации новый, баня и др. , 20с.	2952	\N	\N
347	342	56	1271	2	5000000	260	23	0	Коттедж Шереметево 2х.эт. возле речки отл. рем. S=260+23сот.зем+мебель	2953	\N	\N
348	483	56	1254	\N	3600000	\N	\N	1	Коттедж Чистополь.в центре Дом газ,отопление,свет,вода,шикарный ремонт ,гараж,кирпичный сарай,баня	2954	\N	\N
349	271	56	1271	2	4500000	180	20	0	Коттедж Шереметьевка дом 2хэт. новый 180кв.м. участок 20с, все коммуникации, фото	2955	\N	\N
350	271	56	122	\N	2300000	146	10	0	Коттедж Шереметьевка Садовая, 146кв.м., 10с.	2956	\N	\N
351	342	56	1271	2	5700000	\N	\N	0	Коттедж Шереметьевка, 2х этажный, супер ремонт, все есть	2957	\N	\N
352	484	56	1271	1	5000000	\N	30	1	Коттедж Шереметьевка: 1-ноэтажный кирпичный, сост.отличное, 30 сот., бассейн, зим.сад, отапливаемая теплица, крольчатник	2958	\N	\N
353	272	56	1271	\N	2300000	51	22	0	Коттедж Шереметьево 51 кв.м, 22 соток земли, баня 3*4, сарай, гараж, теплица, свет,газ,вода, забор профнастил.	2959	\N	\N
354	523	56	1270	\N	3300000	91.2000000000000028	12	1	Коттедж Шингальчи, 91,2 кв.м, баня, гараж, участок, 12 соток,  торг	2960	\N	\N
355	436	56	35	\N	5000000	\N	10	0	Обьект на Кр. ключе, ул. Советская, 10 сот, гараж, баня (сруб), сауна, бассейн, газ, све, вода, канализация	2961	\N	\N
356	281	56	2131	\N	750000	\N	31	0	Земля Заинск.район, Верхние Пенячи, 31 сот., желез.вагон.,баня, погреб,колонка с водой,свет, теплица, насаждения,огорожена	2962	\N	\N
357	370	56	606	\N	450000	\N	5	0	Дача за Ильинкой-2 улица,  СНТ Строитель, около оз.Юртово, дом с баней, 5 соток, документы готовы.	2963	\N	\N
358	434	56	2063	\N	680000	\N	8	0	Земля,Высокая гора.8 соток.Документы готовы	2964	\N	\N
359	387	56	1569	\N	350000	\N	15	0	Земля д. Майская горка, 15 соток, хорошее место, электричество	2965	\N	\N
360	387	56	1273	\N	300000	\N	30	0	Земля в Сухарево 30 соток	2966	\N	\N
361	507	56	1279	\N	1300000	\N	15	0	Земля Н.уратьма 15сот	2967	\N	\N
362	366	56	2222	2	280000	\N	\N	0	Дача 121 маршрут, 2-хэтажный дом, баня, теплица, забор из профнастила, насаждения.	2968	\N	\N
363	271	56	2242	2	2200000	108	\N	0	Коттедж Рублевка 2хэт. недострой 9х12м сруб+пристрой, баня рабочая, амбар, колодец, жел\\ворота, обм. на квартиру	2969	\N	\N
364	333	56	2244	1	150000	\N	12	0	Дача понтонный мост, 1 массив, 1эт дом, 2 участка по 6 сот, насаждения, озеро, остановка рядом	2970	\N	\N
365	373	56	2245	2	0	\N	8	0	Дача СНТ "Чайка", дом 2-хэт, отдельно стоящая баня, беседка, все насаждения, свет, вода, 8 соток, рядом р.Кама.	2971	\N	\N
366	372	56	102	\N	300000	\N	8	0	Земля Б.Афанасово, ул. Красная, дачный домик, 8 соток.	2972	\N	\N
367	374	56	580	2	590000	\N	10	0	Огород "Дуслык-1"(понтонный мост), в собственности, 2-хэтажный дом, баня, 10 соток, у озера.	2973	\N	\N
368	372	56	2246	\N	850000	\N	31	0	Земля Смыловка, ЛПХ, улица Заводская, 31 сотка, коммуникации рядом.	2974	\N	\N
369	370	56	2247	\N	450000	\N	9	0	с.Миннибаево, Альметьевский р, ул.М.Даутовой, 9 соток.	2975	\N	\N
370	396	56	1567	\N	650000	60	\N	0	Красный бор, дом большой, 60кв.м., баня, теплица, отличный	2976	\N	\N
372	396	56	2251	\N	150000	\N	\N	0	Дача 121 а, дом, баня, колонка	2978	\N	\N
373	424	56	2250	\N	850000	\N	12	0	Дача 106 Д , 12 соток, 10 мин до города, ухожен, дом 2хэтажный, все есть	2979	\N	\N
374	424	56	580	\N	450000	30	7	5	Дача "Дуслык", 7 соток,  дом из блоков6.5х6, баня, теплица, металлический хозблок5х4	2980	\N	\N
375	424	56	2250	\N	900000	\N	12	0	Дача 106Д, 2эт дом, баня, гараж,рядом 2 озера, незатапл, 12соток ухожен,	2981	\N	\N
376	424	56	1291	\N	220000	\N	15	0	Земля Афанасово 15  соток, улица застраивается	2982	\N	\N
377	424	56	1291	\N	230000	\N	15	0	Земля Афанасово, 15 соток	2983	\N	\N
378	424	56	1270	\N	450000	\N	13	0	Земля Шингальчи 13 соток	2984	\N	\N
379	424	56	1270	\N	820000	\N	26	0	Земля Шингальчи 26 соток	2985	\N	\N
380	397	56	2222	2	400000	\N	\N	0	Дача 121 маршр. 2-х эт.дом. Баня	2986	\N	\N
381	397	56	2250	\N	250000	\N	\N	0	Дача 106 д, 2-х эт.дом, озеро в конце улицы. Гараж.	2987	\N	\N
382	399	56	1567	2	270000	25	9	0	Дача СТ Красный Бор, дом 2-х эт. 25кв.м. земля 9 соток	2988	\N	\N
383	266	56	1267	\N	40000	\N	15	0	Земля Борки 15 соток, цена каждого по	2989	\N	\N
384	266	56	2245	\N	250000	\N	12	0	Земля Чайка (многодетным) 12 соток кадастр.номер	2990	\N	\N
371	396	56	1289	\N	700000	\N	\N	0	Дача пробудиловка, бани нет	2977	\N	\N
385	285	56	2252	\N	200000	\N	12	0	Земля Чайка 12 соток, свет проведен	2991	\N	\N
386	285	56	1426	\N	350000	\N	12	0	Земля Балчиклы 12 соток, забор, все насаждения	2992	\N	\N
387	287	56	2252	\N	150000	\N	8	0	Земля Чайка 8 соток (угловая)	2993	\N	\N
388	271	56	2252	\N	120000	\N	13	0	Земля Чайка о/л, 13 соток, многодетным семьям, рядом строятся	2994	\N	\N
389	271	56	2252	\N	150000	\N	11.5	0	Земля Чайка о/л, 11,5 соток, многодетным семьям, 16:30:011602:310	2995	\N	\N
390	271	56	2252	\N	270000	\N	12	0	Земля Чайка б/о, 12с, стеновые панели	2996	\N	\N
391	487	56	2252	\N	160000	\N	12	0	Земля у "Чайки" 12 соток	2997	\N	\N
392	487	56	2252	\N	120000	\N	12	0	Земля у "Чайки" 12 соток	2998	\N	\N
393	533	56	2252	\N	180	\N	12	0	Земля в Чайке многодетным, 12 соток	2999	\N	\N
394	507	56	2252	\N	150000	\N	12	0	Земля Чайка 12сот	3000	\N	\N
395	498	56	2252	\N	120	\N	12	0	Земля Пионер лагерь "Чайка"  з\\уч.12 состок, без  строений по мат.капиталу , торг	3001	\N	\N
396	507	56	2253	\N	1200000	\N	30	0	Земля  Авлаш 30сот	3002	\N	\N
397	507	56	1605	\N	1300000	\N	\N	0	Земля Ташлык 3 гект.	3003	\N	\N
398	507	56	2254	\N	285000	\N	16	0	Земля Ачи 16сот	3004	\N	\N
399	507	56	1563	\N	380000	\N	25	0	Земля Ключ Труда 25сот,баня,гараж,свет,вода,газ	3005	\N	\N
400	507	56	1279	\N	250000	\N	15	0	Земля Н.уратьма 15сот	3006	\N	\N
401	271	56	2222	2	1700000	\N	36	0	Дача на берегу отличного  озера 121 маршрут, 2-х эт бревен. новый, 5,5х6,5м, парковка, береговая линия 50м	3007	\N	\N
402	396	56	1300	2	1550000	130	5	0	Дача район Дмитриевки, отличный 2-х этажный дом, 130кв.м., 5 с.земли, банный комплес, отличный, вода, с/узел	3008	\N	\N
403	271	56	580	2	1700000	90	7	0	Дача Дуслык дом 2хэт 90кв.м. кирп., новая отличная современная баня, 7с, свет круглый год	3009	\N	\N
404	268	56	583	2	250000	\N	\N	0	Дача СО Нефтехимик 2-хэтажный, 7 массив, баня, насаждения, вода	3010	\N	\N
405	287	56	1439	\N	200000	\N	15	0	Земля Большие Аты 15 соток, ИЖС	3011	\N	\N
406	271	56	1567	\N	190000	\N	4	0	Дача Красный бор дом, баня, 4 сотки	3012	\N	\N
407	271	56	156	\N	1500000	\N	\N	0	Дача Птицевод, Прообудиловка, свой укрепл. берег озера, дом, баня, гараж, теплица, и др.	3013	\N	\N
408	271	56	583	\N	230000	\N	4	0	Дача Нефтехимик, дом, баня, теплица, скважина, 4сотки, свет, вода, насаждения,	3014	\N	\N
409	271	56	156	\N	1100000	\N	\N	0	Дача Птицевод, свое озеро, дом, баня, курятник, беседка, 2теплицы, и др.	3015	\N	\N
410	271	56	156	\N	1550000	\N	8	0	Дача Птицевод, современный дачный дом, баня,  8 соток	3016	\N	\N
411	271	56	584	\N	300000	\N	4	0	Дача Спутник, дом, баня 3х7м, 4сотки	3017	\N	\N
412	266	56	577	\N	200000	\N	15	0	Земля снт Саулык 2 участка по 15 соток, цена каждого по	3018	\N	\N
413	271	56	580	\N	250000	16	5	0	Дача Дуслык домик 4х4 блоки, баня, скважина, 5 соток, свет, вода	3019	\N	\N
414	271	56	578	\N	260000	\N	\N	0	Дача Шинник, дом, гараж 4х7, по границе ручей, свет круглый год	3020	\N	\N
415	271	56	1300	\N	600000	\N	10	0	Земля Шинник берег озера, свет круглый год, 10 соток, фото	3021	\N	\N
416	271	56	578	\N	860000	\N	43	0	Земля СНТ Шинник карьер свое озеро, в собственности 8с+9с+12с+14с вместе или по отдельности- 20т.р. сотка	3022	\N	\N
417	271	56	1289	\N	2770000	45	12	0	Дача Пробудиловка 45кв.м. бревенчатый, 12 соток, гараж, баня	3023	\N	\N
418	271	56	156	\N	900000	\N	6	0	Дача Птицевод 6 соток, забор профнастил, дом, теплица, баня, насаждения, свет круглый  год, док-ты оформлены	3024	\N	\N
419	271	56	156	\N	300000	\N	4	0	Земля  Птицевод, свет, вода, 4 сотки	3025	\N	\N
420	271	56	1567	2	0	\N	4	0	Дача Красный бор дом 2хэт обшит вагонкой, баня при доме, вода. 4 сотки,	3026	\N	\N
421	271	56	1511	\N	530000	\N	15	0	Земля  Красная Кадка пос. РТС, 15 соток	3027	\N	\N
422	271	56	2283	\N	700000	\N	30	0	Земля  Н. Челны , ул. Вахитова, 30 соток, гараж6х12м, фундамент с бурками 9,5х12,5 и 3х6	3028	\N	\N
423	271	56	583	\N	850000	\N	4	0	Дача Нефтехимик, дом, баня, теплица, скважина, 4сотки, свет, вода, насаждения, пирс, на острове	3029	\N	\N
424	271	56	1493	\N	900000	\N	30	0	Земля Выгорожный Ключ, 30 соток, гараж 4х6, баня, забор, свет, газ, фото на Авито	3030	\N	\N
425	271	56	1491	\N	350000	\N	22	0	Земля Выгорожный Ключ 22 сотки Садовая д.4	3031	\N	\N
426	271	56	100	\N	1600000	\N	16	0	Земля Красный Ключ ул.Набережная, 16 соток	3032	\N	\N
427	271	56	1479	\N	200000	\N	16	0	Земля Туба, ул. Чапаева, свет, газ, 16 соток	3033	\N	\N
428	271	56	1271	\N	180000	\N	15	0	Земля Шереметьево 15 соток	3034	\N	\N
429	271	56	1271	\N	4000000	\N	\N	0	Земля Шереметьевка 6га	3035	\N	\N
430	271	56	1271	\N	0	\N	\N	0	Земля Шереметьевка 10 га СХН	3036	\N	\N
431	271	56	1271	\N	1000000	\N	\N	0	Земля Шереметьевка 5,8га схн	3037	\N	\N
432	526	56	131	\N	450000	20	20	3	Земля Шереметьевка, ул. Советская, 20 соток, бревенчатый домик 4х5	3038	\N	\N
433	351	56	1271	\N	1500000	\N	\N	4	Шеремтьевка дом жилой блоки	3039	\N	\N
434	353	56	297	\N	1200000	\N	12	0	Земля, г. Чистополь,  ул. Вахитова 9, земля 12 сот., коммун.проведены	3040	\N	\N
435	391	56	2222	2	1000000	\N	9	0	Дача на берегу озера 121 маршрут. 2-х эт. Дом. 9 соток. Торг.	3041	\N	\N
436	391	56	2222	1	100000	\N	4	0	Сад-огород, 121 маршрут, предпоследняя остановка, 4 сотки, 1-но эт.дом. В собственности	3042	\N	\N
437	349	56	2251	2	700000	50	5	0	Дача 121А 5сот 2эт дом 50кв,у озера	3043	\N	\N
438	498	56	2250	\N	100	\N	\N	0	Дача, 1 массив, конечная ост 106 Д, домик, все насаждения, выход на озеро, торг	3044	\N	\N
439	391	56	1296	\N	1500000	\N	12	0	Земля 12 соток. Кам.Поляны. Фундамент 8,5*9,5. Баня 6*5,5.  Канализация действует. Гараж 6*12. Газ, свет, вода.	3045	\N	\N
440	349	56	1511	\N	200000	\N	25	0	Земля, Красная кадка 25 сот	3046	\N	\N
441	349	56	1300	2	1000000	\N	\N	0	Дача Дмитриевка 2эт,у озера все есть	3047	\N	\N
442	528	56	1297	\N	32000000	\N	\N	0	Земля  Казань, под строительство многоквар. Жил. дома, со встроен. нежилыми помещениями и парковкой	3048	\N	\N
443	529	56	2062	\N	4050000	\N	13.5	0	Земля Салмачи под Казанью, коммуникации, ИЖС, 13,5 соток, 300 тыс. за сотку	3049	\N	\N
445	523	56	1569	\N	150000	\N	15	0	Земля Майская Горка, 15 соток ИЖС в собственности,  большой выбор!	3051	\N	\N
446	523	56	2065	\N	230000	\N	10	0	Земля Смыловка 2 участка по 16 соток,  ул. Крестьянская	3052	\N	\N
447	269	56	1414	2	250000	\N	\N	0	Дача в Березовой Гриве, 2эт, баня отдельно, новая теплица, насаждения, торг	3053	\N	\N
448	269	56	1414	\N	440000	\N	15	0	Земля в Березовке, баня новая, 15 соток, торг, свет, рядом живут круглый год	3054	\N	\N
449	271	56	576	\N	100000	\N	4	0	Дача Ветеран перекресток 121А и 106, 4 сотки, дачный домик, свет и вода есть, всего 7 участков	3055	\N	\N
450	271	56	576	\N	175000	\N	8	0	Земля Ветеран-3, 8 с, 106Д, вода поливочная, колонка, свет круглый год, дом 2хэт, баня, соседи живут и зимой	3056	\N	\N
451	271	56	580	\N	70000	\N	\N	0	Земля Дуслык-2 6с, забор, свет, вода	3057	\N	\N
452	271	56	576	\N	100000	\N	4	6	Дача Ветеран-4, дом из блоков (без внутренней отделки), 4с, рядом с дорогой, можно под бизнес	3058	\N	\N
453	271	56	580	\N	1300000	60	8	0	Дача Дуслык снт зимний дом 60кв.м., канализация, отопление, свет, вода в доме, совр.ремонт, 8с, баня	3059	\N	\N
454	271	56	578	\N	650000	\N	11	0	Земля Шинник снт 11соток земли, свет круглый год	3060	\N	\N
455	271	56	578	\N	100000	\N	8	0	Земля Шинник снт 8с вода, свет, насаждения	3061	\N	\N
456	271	56	578	\N	650000	\N	11.6999999999999993	0	Дача Шинник баня, дом, 11,7с	3062	\N	\N
457	271	56	580	\N	1500000	\N	6	0	Земля Дуслык 597кв.м.в собственности	3063	\N	\N
458	271	56	580	\N	600000	\N	9	0	Дача Дуслык дом, баня, 9с, рядом Кама	3064	\N	\N
459	271	56	583	\N	180000	\N	9	0	Земля Нефтехимик 9с, забор профнастил, колодец	3065	\N	\N
460	271	56	581	\N	500000	\N	4	0	Земля с/о Нижнекамскнефтехим 401кв.м. в собственности	3066	\N	\N
461	271	56	583	\N	300000	\N	4.40000000000000036	0	Земля с/о Нижнекамскнефтехим 439кв.м. в собственности	3067	\N	\N
462	271	56	580	\N	1700000	110	5	0	Дача Дуслык снт дом 110кв.м., 5с	3068	\N	\N
463	271	56	580	\N	900000	\N	12	0	Дача Дуслык дом, баня, теплица, скважина, насаждения, свет, вода, 12с	3069	\N	\N
464	271	56	583	\N	200000	\N	5	0	Дача Нефтехимик, 5с, домик, забор профнастил, теплица поликарбонат, колонква, свет, вода	3070	\N	\N
465	340	56	584	\N	700000	\N	4	0	Дача  СНТ  СПУТНИК, 4с. Земли, Дом обшит, вода проведена в дом, баню, туалет. На кухне гор. Вода, теплица, насос….	3071	\N	\N
466	431	56	1300	2	2300000	\N	\N	0	Дача Дмитриевка, на берегу озера, 2 эт.дом, баня, теплица, насаждения, берег укреплен	3072	\N	\N
467	431	56	1300	2	3600000	\N	\N	0	Дача-Коттедж, Дмитриевка, 2 эт дом на берегу, баня, сад, теплица, отопление круглый год, евро	3073	\N	\N
468	566	56	577	\N	1500000	\N	15	0	Зем.участок СНТ Саулык 15 сот., гараж, постройки, элек-во проведено.	3074	\N	\N
469	577	56	1300	2	6500000	110	6	0	Дача Дметреевке, 2 эт. Дом бревенчатый 110 кв.м, 6 соток земли  9 км от города	3075	\N	\N
470	487	56	1300	2	1150000	\N	5	4	Дача СНТ Дуслык,по дамбе,рядом с Дубками, 2-этаж.дом из блоков, баня, две теплицы, гараж под лодку,5с.земли	3076	\N	\N
471	484	56	1300	1	115000	\N	\N	0	Дача Дмитриевка (СНТ "Кама"): 1-ноэтажный дом, свет, вода, погреб, в собственности	3077	\N	\N
472	481	56	1300	\N	250	\N	\N	0	Дача Дмитриевка (маршрут 106Д, конечная): 6 сот. ,нов.баня, 2 теплицы, забетон.въезд на 2 авто, до озера 50 м, все насаждения	3078	\N	\N
473	316	56	1300	\N	1850000	48	6	0	Дача Дмитриека дом 6х8 и баня 4х5,2х этажные.  6.6соток,на берегу озера,  фото	3079	\N	\N
474	487	56	1300	\N	850000	\N	4	0	Дача Дмитриевка,на берегу озера дом дачный,баня,гараж,свет круглый год, 4с.земли	3080	\N	\N
475	526	56	575	\N	270000	\N	8.5	0	Земля Дмитриевка, ул. Лесная, без построек, 8,5 соток, вторая линия от озера	3081	\N	\N
476	526	56	1300	\N	3000000	\N	\N	0	Дача р-н Дмитриевки на озере, дом зимний жилой, гараж, баня, беседка, пирс, скважина питьевая, канализ.	3082	\N	\N
477	387	56	1300	2	250000	\N	\N	0	Дача 121 маршрут Дом 2-эт, баня отдельно, теплица, все насаждения, в собственности, документы готовы!	3083	\N	\N
478	387	56	1300	\N	70000	\N	4	0	Дача 106 "Д",4 сотки земли, домик, состояние среднее, место хорошее, озеро близко, все насаждения.	3084	\N	\N
479	487	56	1300	2	250000	\N	4	0	Дача Дмитриевка,2-эт.дом,баня внутри,свет,вода,приват,4с.	3085	\N	\N
480	481	56	1300	1	150	\N	4	1	Дача 121-ый маршрут, конечная остановка, 3-ий массив, 3-я улица: 4 сот., 1-ноэтажный кирпичный дом, колонка	3086	\N	\N
485	271	56	1274	\N	300000	\N	8.5	0	Земля Соколки 8,5с, обзор на Каму	3091	\N	\N
486	409	56	1274	\N	800000	\N	17	0	Земля Соколки,новый Закамский ул.Тукая, 17сот, 800т.р.торг,фундамент под дом есть	3092	\N	\N
487	529	56	1297	\N	0	\N	8	0	Земля Авиастроительный район Казань, 7-8 соток, 80-140 р/сотка	3093	\N	\N
488	523	56	156	\N	1270000	\N	5.70000000000000018	0	Дача, Птицевод, берег Пионерского, дом новый 50 кв.м, круглогодичное проживание,  5,7 сотки земли	3094	\N	\N
489	271	56	2242	\N	500000	\N	7	0	Дача Прогресс 2хэт дом, баня, гараж, большая новая беседка из сруба, 7с, вода, свет	3225	\N	\N
490	271	56	2242	\N	450000	\N	10	0	Дача Энергетик, 10с, дом, баня, мангальная, беседка, мастерская и пр., рядом с Камой	3226	\N	\N
491	271	56	2242	\N	1500000	25	9	0	Дача Индустрия на полуострове, на берегу озера, 9 соток, отличный дом 2хэт. 5х5 и баня3х6, теплица, СУПЕР!	3227	\N	\N
492	271	56	2242	\N	400000	\N	6	0	Дача Кама снт дом, баня, сарай, туалет, колонка, забор профнастил, 6с	3228	\N	\N
493	271	56	2242	\N	600000	\N	6	0	Дача Дорожник снт 6с дом и пр.	3229	\N	\N
494	275	56	2242	\N	120000	\N	\N	0	Дача Майдан дом, баня, скважина, 5с в собственности	3230	\N	\N
495	271	56	2242	\N	450000	\N	8	0	Дача Кама снт, дом, баня, 8с, свет, вода, 2 теплицы, хозблок	3231	\N	\N
496	483	56	2242	\N	500000	\N	\N	0	Дача 4 сот, Баня, 2-х эт.дом кирп., у озера, недалеко от Майдана	3232	\N	\N
497	340	56	2242	\N	750000	\N	\N	0	Дача, СНТ Дорожник, на берегу Оз. Долгое 106 Д, 6с. Земли,2-х эт домик, банька, в собствен.	3233	\N	\N
498	435	56	2242	\N	250000	\N	4	0	Дача за понтонным мостом, 2-х эт. дом, баня отдельно, 4 соток	3234	\N	\N
499	436	56	2242	\N	4000000	\N	\N	0	Дача, СНТ КАМА, 2зт зимний дом, на берегу, в собствен., баня, септик,насаждения	3235	\N	\N
500	469	56	2242	\N	830000	\N	5	0	Дача СТ Кама 2 эт. Дом земьля 5 соток	3236	\N	\N
501	469	56	2242	\N	350000	\N	4	0	Огород Шишкин Хутор, баня, домик 2 эт, земля 4 сот, свет, вода	3237	\N	\N
502	492	56	2242	\N	550000	\N	8	0	Дача Карьер, дачный домик, 8 соток, свет, дорога круглый год	3238	\N	\N
503	508	56	2222	\N	500000	\N	\N	0	Дача,Марш. 121, 4 сот., 2-х эт.дом, отд.стоящая баня, все насаждения есть,место для 1-ой маш., не приватиз. Торг	3239	\N	\N
504	481	56	2242	\N	40	\N	\N	1	Дача Шишкин Хутор: 1-ноэтажный кирпичный дом 3 х 3, 4 сот.	3240	\N	\N
505	526	56	2242	\N	30	\N	4	0	Дачный участок за "Лукоморьем", 4 сотки, домишко, рядом озеро, ДЕШЕВО	3241	\N	\N
506	523	56	2243	\N	2300000	180	\N	0	Дача, Рублевка, дом 180 кв.м, незавершенка, сруб,	3242	\N	\N
507	431	56	1289	\N	350000	\N	\N	0	Дача, д. Пробуждение, 2-х эт. дом, баня, насаждения, теплица, вода, газ	3243	\N	\N
508	271	56	19	\N	1000000	\N	19	0	Земля Нижнекамск в черте города по ул. Юности недалеко от СитиМолла 189кв.м.	3244	\N	\N
509	271	56	1243	\N	10000000	\N	\N	0	Земля в черте города, есть разрешение на строительство, построен цоколь	3245	\N	\N
510	271	56	102	\N	300000	\N	7	0	Земля Афанасово Большое, ул. Красная, газ, свет, 7 соток	3246	\N	\N
511	271	56	162	\N	0	\N	30	0	Земля Афанасово Большое ул. Центральная с/о Мичуринец 30с	3247	\N	\N
512	271	56	165	\N	270000	\N	\N	0	Земля Афанасово, ул. Нижнекамская	3248	\N	\N
513	271	56	162	\N	170000	\N	10	0	Земля СНТ Мичуринец, Большое Афанасово, 10 соток	3249	\N	\N
514	271	56	45	\N	350000	\N	\N	5	Земля Большое Афанасово 12с ул. Юбилейная, гараж металлический	3250	\N	\N
515	271	56	1266	\N	4000000	\N	\N	0	Земля Афанасово 1га	3251	\N	\N
516	271	56	1525	\N	600000	\N	31	0	Земля Нижние Челны 31с, фундамент 9,5х11,5, гараж недострой	3252	\N	\N
517	487	56	1525	\N	500000	\N	18	0	Земля Нижнее Афанасово ул.Пролетарская 18 соток,есть домик из сруба 3,5х5,вода подведена к участку,свет,сарай с погребом	3253	\N	\N
518	507	56	1525	\N	150000	\N	10	0	Земля  Нижнее Афонасово, Центральная 64А, забор, 10 сот вода+, свет+, ИЖС	3254	\N	\N
519	528	56	2242	\N	1000000	\N	18	0	Дача СТ Строитель, 18 соток, баня, дом, насаждения, пруд	3255	\N	\N
520	500	56	2242	2	800000	\N	8	0	Дача между о.Долгое и Камой, дом2 эт,8 сот, баня, свое небольш.озеро, все насаждения. Теплица,ухоженн.	3256	\N	\N
521	529	56	2242	\N	0	\N	\N	0	Участки под коммерч.постройки, 9-12 соток,  по 60-110р\\сотка	3257	\N	\N
523	523	56	2242	\N	250000	\N	15	0	Земля СНТ Саулык  15 соток, . В собственности, Присваевается почтовый адрес, для прописки.	3259	\N	\N
524	523	56	2222	\N	370000	\N	4	0	Дача, СТ  Теплоэнергострой,, 4 сотки, баня в доме, 121маршрут	3260	\N	\N
525	342	56	2242	\N	1000000	\N	\N	0	Земли  районе БСИ по 0,5, 1 и тд ГА  1млн. За гектар	3261	\N	\N
526	507	56	2222	\N	1700000	\N	4	0	Дача берег озера, 121 маршрут выход к озеру, 2х эт бревенчатый дом, баня отдельно на берегу,4сот, стоянка 6 машин, док+	3262	\N	\N
527	391	56	2242	\N	130000	\N	\N	0	Дача. Корабельная Роща. 2-х эт. Дом. Баня.	3263	\N	\N
528	391	56	2242	\N	250000	\N	15	0	Земля . Сад. Общество "Мечурин", 15 соток. Земля в собственности. СРОЧНО	3264	\N	\N
529	272	56	2242	2	5000000	\N	5	0	Дача Карьер, Дом 2-х этажный, с/у в доме, беседка, свет круглогодично, на берегу озера, 5 соток земли,	3265	\N	\N
530	328	56	2243	2	1800000	\N	10	0	Дача, Рублевка,10сот,дом сруб 2этажный,баня сруб,свое озеро,теплица,заезд на 2 машины	3266	\N	\N
531	272	56	2242	\N	350000	\N	\N	0	Дача Шишкин Хутор, дом, баня сруб, теплица, все насаждения,	3267	\N	\N
532	499	56	2242	2	350000	\N	4	0	Дача Шишкин Хутор , 2-х этаж. кирп, 4 сотки земля все насаждения, баня , теплица, торг	3268	\N	\N
533	349	56	2244	\N	135000	\N	6	0	Дача Понтонный мост 6сот дом,насаждения, 2 мин до озера	3269	\N	\N
534	402	56	2242	\N	450000	\N	\N	0	, на берегу ст. Камы, ул. Береговая	3270	\N	\N
535	487	56	2242	\N	620000	\N	\N	4	Дача СО Строитель-4 домиз блоков с мансардой, баня(сруб)3,5х3,5 с предбаником 3х6,теплица 3х8,озеро 200м	3271	\N	\N
536	402	56	1567	\N	700000	\N	7	0	Дача Красный Бор, домик 7 х 8, земьля 7 соток	3272	\N	\N
537	492	56	1567	\N	400000	\N	4	0	Дача Кр. Бор, 4сотки, баня, гараж, свет круг.год, в деревне	3273	\N	\N
538	492	56	1567	\N	150000	\N	\N	0	Дача Кр.Бор, в деревне	3274	\N	\N
539	492	56	1567	\N	150000	\N	5	0	Земля Кр.Бор, зем.участок 5 сотки	3275	\N	\N
540	484	56	1567	\N	290000	\N	8	0	Дача Кр.Бор:обставлен.дом с холод.,свет,вода в доме,крыша+забор-сайдинг,8сот.,заезд д/авто,зона отдыха,в собственности	3276	\N	\N
541	271	56	1567	\N	400000	\N	8	0	Дача Красный бор в деревне, дом2хэт, баня, забор профнастил, погреб, 8с, газ по улице	3277	\N	\N
542	271	56	2965	\N	180000	\N	12	0	Земля Чайка многодетным 12с №199	3278	\N	\N
543	271	56	1034	\N	180000	\N	15	0	Земля Смыловка 15 соток, ул. Крестьянская, вода, газ проведут	3279	\N	\N
544	351	56	1276	\N	1100000	\N	\N	0	Смыловка.дача, дом и баня сруб, 2016 год постройки, отличная улица в деревне	3280	\N	\N
545	271	56	2967	\N	1300000	100	31	0	Земля Строителей пос. ул. Якты, 31 сотка, фундамент 10х10 и 6х6, баня недострой	3281	\N	\N
546	271	56	1275	\N	0	\N	\N	0	Земля пос. Строителей/Афанасово 2га и два участка по 75с под стоянку, ТЦ, склады, произв-во	3282	\N	\N
547	523	56	107	\N	1600000	\N	20	0	Земля пос. Строителей, ул. Центральная, 20 соток, фундамент,	3283	\N	\N
548	342	56	2968	\N	1000000	\N	22	0	Земля  П.Строителей. Садовая S22сот.зем. Фундаменд, баня.	3284	\N	\N
549	491	56	1597	\N	220000	\N	18	0	Земля Старошешминск, 18соток, ч/пр	3285	\N	\N
550	290	56	1547	\N	650000	\N	30	0	д.Уська земельный участок, 30 с, свет вода, газ по улице	3286	\N	\N
551	486	56	1625	\N	150000	\N	10	0	Земля Кзыл Юл: 10 сот.	3287	\N	\N
552	484	56	1529	\N	250000	\N	15	0	Земля Поповка (рядом с с. Шереметьевка): 15 сот., целина	3288	\N	\N
553	472	56	1255	\N	600000	\N	\N	0	Земля Ильинка: 10 сот., по улице газ	3289	\N	\N
554	526	56	609	\N	700000	130	\N	0	Дача Ильинки СНТ "Чайка", 6 соток, дом бревенч. 130 кв.м, баня отдельно, хозблок,	3290	\N	\N
555	566	56	1255	\N	500000	\N	8	0	Зем. Уч. Ильинка 8 соток, газ, свет, вода, в собственности	3291	\N	\N
556	566	56	1255	\N	550000	\N	\N	4	Зем уч Ильинка 6соток, домик блок., баня с комн. отдыха, беседка, теплица. Отл.сост, озеро 50 метров от домика.	3292	\N	\N
557	429	56	1255	2	2200000	\N	15	1	Дача Ильинка 5 мин от Майдана, 2-х эт дом кирп, сан узлы в доме, баня с манс, беседка, скважина, 15сот	3293	\N	\N
558	271	56	2969	\N	250000	\N	13	0	Земля Старый Закамский 13 соток 150м до Камы	3294	\N	\N
559	271	56	2969	\N	900000	\N	33	0	Земля Старый Закамский 33 сотки	3295	\N	\N
560	271	56	2969	\N	750000	\N	30	0	Земля Старый Закамск 30с, в собственности	3296	\N	\N
561	528	56	2971	\N	450000	\N	8	0	СНТ Химик, массив 7, дом, все поменено, 8 соток, заборы,	3297	\N	\N
562	528	56	2971	\N	300000	\N	\N	0	СНТ Химик, массив 7, дом, баня,	3298	\N	\N
563	526	56	156	\N	450000	\N	7.5	0	Дача СНТ "Птицевод" ОТЛИЧНОЕ МЕСТО, дом+баня старые, 7,5 соток в собственности	3299	\N	\N
564	342	56	2972	2	800000	77	\N	0	Дача СТ Строитель  77кв.м. 2этажа, отдельно баня, на дороге в Дмитриевку, круглогодичное проживание	3300	\N	\N
565	271	56	2243	\N	500000	\N	18	0	Земля Рублевка снт Связист 18с, пруд, забор профнастил, свет	3301	\N	\N
566	271	56	2972	\N	670000	\N	7	0	Дача Строитель рядом с Дмитриевкой, о.Долгое через дорогу, 7с земли, дом, баня, курятник, хозблок, забор	3302	\N	\N
567	436	56	2970	\N	600000	\N	6	0	Зем. Участок , СНТ КАМА,  6  соток, берег свой, о. Долгое, огорожен, приватизирован.	3303	\N	\N
568	436	56	2970	\N	1000000	\N	15	0	Зем. Участок , СНТ КАМА,  15  соток, берег свой, о. Долгое, огорожен, приватизирован, Торг!	3304	\N	\N
569	436	56	156	2	2500000	\N	6.70000000000000018	0	Дача, СНТ Птицевод, 6,7 сот. В собствен., зимн.дом, 2х эт. Баня, гостевой дом, теплица, дровенник	3305	\N	\N
570	507	56	2973	2	800000	120	30	0	Дача Н.Челны ул.Красноармейская,30сот,вода,свет,газ,баня2эт,пл.120кв.м,дом фунд.11х12	3306	\N	\N
571	507	56	49	\N	200000	\N	15	0	Земля Трудовой 15сот,док+	3307	\N	\N
572	507	56	1813	\N	450000	\N	15	0	Земля 36 м/н15 сот коммуникации +	3308	\N	\N
573	507	56	2057	\N	150000	\N	7.5	0	Земля Новая Биклянь, 7,5 сот,	3309	\N	\N
574	507	56	1293	\N	80000	\N	\N	0	3 участка Закамье 8 сот 16 сот 19 сот 10 тыс за сотку свет+	3310	\N	\N
575	492	56	1267	\N	350000	\N	15	0	Земля Борки, 15 соток	3311	\N	\N
576	492	56	1267	\N	250000	\N	9	0	Земля Борки, 9 соток	3312	\N	\N
577	481	56	2974	2	80	\N	10	1	Дача Шишкин Хутор: 2-хэтажный кирпичный дом 3 х 3, 4 сот.	3313	\N	\N
578	488	56	2245	\N	300000	20	10	1	Дача СНТ Чайка (с. Ильинка): кирпичный дом S=20, 10 сот.	3314	\N	\N
579	436	56	2971	\N	400000	\N	4.29999999999999982	0	Зем. Участок, СНТ Химик, 3 массив, 4.3 сотки, берег свой, приватизирован, заезд бетонка, можно под базу отдыха!!!	3315	\N	\N
580	526	56	2245	\N	2000000	150	12	1	Дача  Ильинки СНТ "Чайка", берег озера, дом кирпич 150 кв.м, баня, 12 соток земли,	3316	\N	\N
581	271	56	111	\N	350000	\N	13	0	Земля 36мкр., ул. Афанасовская, 13с	3317	\N	\N
582	402	56	1211	\N	450	\N	20	0	Земельный участок 20 сот, Б.Афанасова, ул. Дачная	3318	\N	\N
583	472	56	11	\N	2900000	\N	10	0	Земля по ул. Лесная: под автостоянку, 10 сот., возможен обмен на недвижимость или авто	3319	\N	\N
584	342	56	1279	\N	200000	\N	15	0	Земля  Нижняя Уратьма, 15 соток, дорога и электрич  подведены, новый район	3320	\N	\N
585	431	56	1279	\N	500000	\N	35	0	Зем.участок 35 сот, дом недострой,гараж с.Нижняя Уратьма	3321	\N	\N
586	431	56	1255	\N	475000	\N	9	0	Земельный участок 9 сот, Ильинка, вода, свет круглый год, обнесен забором, в собственности	3322	\N	\N
587	566	56	549	\N	4300000	\N	4000	0	Зем.участок 4000 кв.м., от афанасовского кольца 500м по ул. Чистопольской. В собственности.	3323	\N	\N
588	436	56	1243	\N	900000	\N	9	0	Зем. Участок, 9 соток, Берег свой, Приватизирован, огорожен, Торг!	3324	\N	\N
589	431	56	1295	2	2700000	\N	\N	0	Дача на берегу Кр.Ключ,2 эт дом,2 эт баня,насаждения,санузел,теплица,беседка,мангал,колодец.зимн. вариантСУПЕР	3325	\N	\N
590	526	56	1289	\N	3000000	\N	\N	0	Дача Пробудиловка на озере 6 соток, зимний жилой вариант	3326	\N	\N
591	275	56	2975	\N	440000	\N	14	\N	Земля Круглое Поле 14с, ИЖС, асф.дорога, газ, свет, вода	3327	2	\N
592	271	56	1284	\N	2000000	\N	200	0	Земля Каенлы всего 10га (2участка по 5га), можно по частям	3328	\N	\N
593	271	56	50	\N	149000	\N	15	0	Земля Каенлы 15с	3329	\N	\N
594	275	56	1597	\N	120000	\N	19	0	Земля Старошешминск 19с	3330	\N	\N
595	271	56	1597	\N	260000	\N	22	0	Земля Старошешминск 22с	3331	\N	\N
596	526	56	1626	\N	500000	\N	20	\N	Земля в с. Котловке (Елабужский р-н) на берегу Камы, 20 соток, место СУПЕР  ИЖС	3332	2	\N
597	487	56	2242	\N	45000	\N	5	0	Земельный участок с/о СУ-75,5с, .теплица из поликарбоната 3х8	3333	\N	\N
598	526	56	2242	\N	30000	\N	\N	0	Участок земли рядом с озером, проезд через "Лукоморье"4 сотки, хорошее место, фундамент	3334	\N	\N
599	523	56	549	\N	5000000	\N	400	\N	Земля, промназначения, 4 га, под автопарк, Чистопольская,	3335	4	\N
600	271	56	548	\N	450000	\N	15	0	Земля Субай 36мкр 15с, дачный домик, объем для воды, насаждения, свет	3336	\N	\N
601	355	56	1273	\N	100000	\N	15	0	Земля Сухарево, 15 соток, в центре, ч\\пр, доки готовы, торг, 28\\03\\2015	3337	\N	\N
602	271	56	1421	\N	300000	\N	15	0	Земля Байданкино 15с	3338	\N	\N
603	271	56	1813	\N	700000	\N	11	0	Земля 36мкр коттеджный поселок 11с, в продаже шесть участков	3339	\N	\N
604	271	56	1813	\N	0	\N	\N	0	Земля 36мкр коттеджный поселок с "домами-коробками" коммуникации подведены, есть пять участков	3340	\N	\N
606	271	56	2245	\N	230000	\N	4	0	Земля СНТ Чайка 4с , 100м до озера, недалеко Майдан, асфальтированная дорога, свет круглый год	3342	\N	\N
607	271	56	2245	\N	90000	\N	\N	0	Земля снт Чайка-2 свет вода, хозпостройка, резервуар для воды, по улице озеро, недалеко Фактория	3343	\N	\N
608	271	56	26	\N	1700000	\N	\N	0	Земля в черте города 388кв.м. по ул. Спортивная, под кафе	3344	\N	\N
609	271	56	1275	\N	80000	\N	4	0	Земля Строитель снт 4с, документы зарегистрированы, дачный домик, свет, вода	3345	\N	\N
610	271	57	1275	\N	25000	\N	\N	0	Земля СДАМ за автовокзалом под базу	3346	\N	\N
611	271	56	2976	\N	65000000	\N	500	\N	Земля Казань ул. Космонавтов, первая линия, 0,5га под строительство жилых домов	3347	2	\N
612	271	56	1567	\N	550000	\N	32	0	Земля Красный бор 32с, газ, свет	3348	\N	\N
613	271	56	2974	\N	130000	\N	4	0	Земля Нефтехимик снт Шишкин хутор 3х5 фундамент, насаждения, свет, вода, 4с	3349	\N	\N
614	271	56	2989	\N	350000	\N	15	\N	Земля Алексеевский район с.Речное, ИЖС, есть два участка по 15с, вместе 700тр, один 350тр	3350	2	\N
615	271	56	2989	\N	170000	\N	10	0	Земля Калиновка 10с, газ, свет,	3351	\N	\N
616	271	56	2992	\N	75000000	\N	10000	0	Земля Лаишевский район у пос. Державино 100га	3352	\N	\N
617	282	56	1662	\N	600000	60	21	1	Дом Новошешминский район, кирп.дом 60 кв.м, санузел дома, хор.сост., баня, сарай, 21 сотка	3353	\N	\N
618	275	56	3005	\N	350000	\N	30	0	Дом Воронежская область Бутурлиновка, 30 соток, дом пятистенок треб.ремонта, газ, вода, свет в доме	3354	\N	\N
619	271	56	3006	\N	950000	\N	51	0	Земля Сентяк Елабужский р-н, 51с, асфальт, сет, газ, вода централизировано	3355	\N	\N
620	271	56	3007	\N	400000	\N	19	0	Земля Кутлубукаш Рыбнослободской р-н,  19соток, два гаража, сарай, ворота, забор, све, газ, 7км от трассы	3356	\N	\N
621	271	56	3008	\N	30	\N	\N	0	Земля Верхнеуслонский район совхоз Приволжский 40га 30тр/сотка	3357	\N	\N
622	271	56	3009	\N	1900000	\N	\N	0	Земля Русский Ошняк Рыбно-слободской район 11 га СХН	3358	\N	\N
623	271	56	3010	\N	500000	\N	\N	0	Земля Агрызский район 23га схн лес с одной стороны, Кама 1.5км	3359	\N	\N
624	271	56	3010	\N	300000	\N	11	0	Земля Алексеевск 11с, свет, газ	3360	\N	\N
625	271	56	3012	\N	0	\N	\N	0	Земля Большой Толкиш Чистопольский район три участка 3,3 га, 64га, 10 га	3361	\N	\N
626	434	56	2063	\N	480000	\N	8	0	Зем.участок,Высокая Гора г.Казань. 8 соток .Вода,свет.	3362	\N	\N
627	529	56	3013	\N	0	\N	\N	0	Земля Каймары, у озера, 7-8 соток, 80-140 т.р/сотка	3363	\N	\N
628	483	56	1260	\N	400000	\N	25	0	Земля Муслюмовский р-н, с.Октябрь (ЛПХ), 25сот., получено рарешение на строительство,на живописном месте	3364	\N	\N
629	436	56	3014	\N	4200000	\N	\N	0	Зем. Участок на берегу моря!!! Г. Севастополь, бухта, 2х10 соток, вода, электр., газ, канализация рядом.	3365	\N	\N
630	271	56	2242	\N	400000	\N	4	0	Дача Лукоморье дом, баня, 4с, теплица поликарбонат, забор профнастил, бетонные дорожки, свет, вода	3366	\N	\N
631	528	56	2242	\N	0	\N	\N	0	Земля Лаишевский р-н, престижное место, вид на каму, за сотку	3367	\N	\N
632	471	56	1266	\N	1600000	48	15	0	Дом Б. Афанасово, дом: 48кв.м., баня:3х5 сруб, 15 сот.земли,асфальт, все новое, собственность.	3843	\N	\N
633	347	56	1266	\N	6000000	205	\N	0	Коттедж Б.Афанасово, 205 кв.м,  все есть	3844	\N	\N
634	346	56	102	1	2500000	\N	15	0	Коттедж Б.Афанасово, Красная, Блочный, 1-но эт, 15 с, все насаждения, баня отдельно, жилой, свой пруд	3845	\N	\N
635	385	56	103	\N	350000	\N	18	0	Земля Б. Афанасово участок,18с, ул.Учительская, электричество подведено. Торг СРОЧНО	3846	\N	\N
636	457	56	1266	\N	350000	\N	13	0	Земля  Б. Афанасово, 13 соток	3847	\N	\N
637	278	56	164	\N	840000	\N	14	0	Земля Б.Афанасово, ул .Ленина,14 с , баня,хороший участок	3848	\N	\N
638	357	56	1266	\N	500000	\N	10	0	Земля  Б.Афанасово, 10 соток, , газ, свет, вода	3849	\N	\N
639	407	56	2242	2	1500000	\N	8	0	Дача по 121 м-т, 2-х жт, , отличный, все есть, все насаждения,  8 соток., 2 участка, хороший торг, СРОЧНО	3850	\N	\N
640	386	56	1813	\N	600000	\N	10	0	Земля в 36 мкрн.(в центре)-6 участков по 10 сот	3851	\N	\N
641	457	56	1300	\N	400000	\N	10	0	Земля 10 соток район Дмитривки за Долгим озером	3852	\N	\N
642	427	56	1300	\N	250000	\N	6	0	Дача Дмитриевка, кирп.дом, 6 с земли, вода, свет, все насаждения	3853	\N	\N
643	410	56	1300	\N	5000000	\N	\N	0	Дача Дмитриевка	3854	\N	\N
644	286	56	1300	2	4200000	130	10	2	Дача Дмитриевка, озеро Долгое, 2-х эт. Кирп. , 130 кв.м, 10 с земли, брус, баня, зим.вариант	3855	\N	\N
645	286	56	1300	2	900000	\N	6	0	Дача Дмитриевка, озеро Светлое, 6 с земли, 2-х эт домик, баня в доме, свой берег	3856	\N	\N
646	338	56	1426	\N	550000	\N	15	0	Земля Балчиклы, баня, гараж, мансарда, 15 соток	3857	\N	\N
647	338	56	1267	\N	250000	\N	12	0	Земля Борок 12 соток,	3858	\N	\N
648	338	56	1421	\N	500000	\N	\N	0	Земля Байданкино, земля 25 соток	3859	\N	\N
649	471	56	1439	\N	1900000	77	13	0	Дом Б.Аты, сруб 7*11,13 с земли , гараж кирп 6*6, рядом церковь	3860	\N	\N
650	348	56	850	\N	1000000	186	20	0	Дом Байгулово ул Апакова 186 кв м 20 сот за огородом речка	3861	\N	\N
651	471	56	1462	\N	235000	\N	25	0	Дом Клятли 25 с, гараж 5+22, емкость, баня	3862	\N	\N
652	390	56	1485	2	6000000	202	36	0	Коттедж Болгар( Ниж.р-он), 2-х эт, кирп, 202 кв.м,36 с земли, все насаждения, ч\\пр или обмен на Казань	3863	\N	\N
653	471	56	1255	\N	2600000	64	12	0	Коттедж Ильинка, дом: 64 кв.м.,баня 3х5, новые, собственность,септик,тепл полы, вода, 12 сот.земли.	3864	\N	\N
654	392	56	2062	\N	390000	\N	6	0	Коттедж Салмачи  ( Пригород Казани) Газоблок+метал.сайтинг, коммуникации все, 6 с земли,возмож  обмен на ав\\машину	3865	\N	\N
655	569	56	1271	2	3900000	254	12.5	0	Коттедж Шереметьевка, 2-х эт , кирп , 254 кв.м, недостроенный, 12,5 с земли, Фото на АВИТО.	3866	\N	\N
656	330	56	1597	\N	570000	\N	\N	3	Дом  Старошешминск , газ вода или обмен на 1-но в Камских Полянах, деревянный	3867	\N	\N
657	330	56	1271	1	3870000	\N	24	0	Коттедж Шереметьевка, 1-но эт, кирп, 24 с земли, ШИКАРНЫЙ	3868	\N	\N
658	330	56	1271	1	3800000	\N	26	0	Коттедж  Шереметьево 1-но эт, кирп, , 26 сот земли, ОТЛИЧНЫЙ,все зарегистрировано, торг	3869	\N	\N
659	330	56	234	\N	1850000	\N	\N	2	Дом Кам.Поляны-Новосел из Бруса под ключ 100	3870	\N	\N
660	330	56	234	\N	0	\N	\N	0	Дома, земли в Новосел-Кам.Поляны  8502300	3871	\N	\N
661	330	56	1274	\N	900000	\N	\N	0	Дом Соколки, Мамадыш. Р-он, 5 -ти стенник, деревянный, отопление, газ, вода, свет, все насаждения, баня	3872	\N	\N
662	561	56	1511	2	2500000	\N	30	1	Коттедж Кр.Кадка., 2-х эт, дерев+кирп, баня, 30 с земли, все насаждения	3873	\N	\N
663	570	56	2244	2	5000000	110	13	0	Коттедж  на берегу озера П.мост, 2-х эт., зимний, 110кв.м., 13с. Земли, гараж, дом для гостей,	3874	\N	\N
664	570	56	2242	\N	5500000	\N	15	0	Коттедж-дача  Индустрия, на озере Кривель на понтонном, все разрешения есть, все есть в доме, 15 с земли	3875	\N	\N
665	298	56	1279	1	1000000	\N	25	3	Дом Н.Уратьма, 1-но эт, дерев, 25 с земли, баня, газ, вода, свет	3876	\N	\N
666	506	56	1597	1	750000	\N	30	0	Дом Старошешминск, 1-но эт, благоустроенный, 30 с земли, СВЕТ. ГАЗ, ВОДА	3877	\N	\N
667	480	56	1597	\N	400000	\N	25	3	Дом Старошешминск, сруб, хоз постройки, свет,газ,вода, зем.уч 25 сот	3878	\N	\N
668	506	56	50	1	3100000	\N	30	1	Коттедж  Каенлы, 1-но эт, кирп, 30 с земли, все есть, ухоженный, евро	3879	\N	\N
669	273	56	2242	\N	160000	\N	4	0	Дача 106 мар.дом садовый,участок 4 сотки.есть теплица,насаждения,забор профнастил	3880	\N	\N
670	455	56	2242	2	180000	\N	\N	0	Дача  105 м-т, 2-х эт домик, баня, теплица, все насаждения , фото	3881	\N	\N
671	569	56	2250	1	65000	\N	4	1	Дача 106 Д конечная, 1-но эт кирп дом, 4 с земли, вода, свет, все насаждения	3882	\N	\N
672	274	56	2251	\N	370000	\N	9	0	Дача по 121 А ( две дачи рядом по 4 с, 2 домика, баня,  теплица, все насаждения, рядом озеро,)  около 9 соток торг хороший	3883	\N	\N
673	284	56	2242	\N	160000	\N	4	0	Дача 106 маршрут, 4 сотки, забор-профнастил, теплица, бани нет	3884	\N	\N
674	332	56	2222	2	350000	\N	8	0	Дача 121 маршрут. Кирп., 2-х. эт., 8 сот. , теплица, насаждения, есть фото, ТОРГ	3885	\N	\N
675	457	56	2974	\N	400000	\N	9	0	Дача 106 маршрут Шишкин хутор 9 соток	3886	\N	\N
676	506	56	1286	\N	850000	\N	\N	0	Дом Прости	3887	\N	\N
677	506	56	100	\N	5000000	\N	20	0	Коттедж Красный Ключ, ул. Набережная, все есть , 20 с , сад,	3888	\N	\N
678	480	56	1295	2	4200000	\N	\N	1	Коттедж Кр.Ключ Дом2хэт утеплен,кирпич,мансарда, баня, беседка, хоз.постройки, 2 теплицы,насаждения,торг	3889	\N	\N
679	274	56	2254	\N	400000	\N	16.5	0	Дом + Земля с. АЧИ 16,5 с+ старый дом( не жилой) , место хорошее, рядом берег, церковь ТОРГ ХОРОШИЙ	3890	\N	\N
680	274	56	1280	\N	420000	\N	40	0	Дом   Кызыл ЯР , Старый но крепкий дом, свет, газ, асфальт до дома, 40 соток	3891	\N	\N
681	288	56	174	1	2650000	120	16	1	Коттедж  Ниж.Афанасово, ул.Пролетарская,1 -эт, кирп, баня отличная-отдельно, санузел дома, туалет есть и на улице,гараж+сараи в дл.около 10м 2х эт.,охранная собака,16 с земли, хоз\\постройки	3892	\N	\N
\.


--
-- Name: cottages_id_cottages_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('cottages_id_cottages_seq', 681, true);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY country (id, title, alias, metropolis) FROM stdin;
16	Россия	rossiya	112
\.


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('country_id_seq', 22, true);


--
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY district (id_district, district, city_id) FROM stdin;
30	Комсомольский	117
31	Центральный	117
33	Вахитовский	118
34	Кировский	118
35	Московский	118
36	Ново-Савиновский	118
37	Приволжский	118
38	Советский	118
39	Автозаводский	117
40	пос.Строителей	116
41	36 мкр.	116
32	Авиастроительный	118
\.


--
-- Name: district_id_district_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('district_id_district_seq', 41, true);


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY districts (id_districts, districts, region_id) FROM stdin;
1	Нижнекамский р-н	95
2	Алексеевский р-н	95
3	Тукаевский р-н	95
4	Арский р-н	95
7	 Азнакаевский р-н	95
9	Чистопольский р-н	95
13	Мамадышский р-н	95
15	Елабужский р-н	95
17	Мензелинский р-н	95
21	Черемшанский р-н	95
22	Сармановский р-н	95
27	Заинский р-н	95
28	Муслюмовский р-н	95
19	Менделеевский р-н	95
23	Зеленодольский р-н	95
31	Аксубаевский р-н	95
33	Новошешминский р-н	95
34	Пестречинский р-н	95
36	Высокогорский р-н	95
37	Приволжский р-н	95
38	Альметьевский р-н	95
32	Рыбно-Слободский р-н	95
39	Абзелиловский р-н	105
40	Чебоксарский р-н,	106
42	Туапсинский р-н	108
43	 Лаишевский р-н	95
44	Бутурлиновский р-н	109
45	Верхнеуслонский р-н	95
46	Агрызский р-н	95
47	Севостопольский р-н	110
49	Нижегородский р-н	111
50	Моркинский район	112
41	Вятскополянский р-н	107
\.


--
-- Name: districts_id_districts_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('districts_id_districts_seq', 50, true);


--
-- Data for Name: labelandtemplate; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY labelandtemplate (id_labelandtemplate, node_id, permit_id) FROM stdin;
1	56	17
2	57	17
3	58	17
4	59	17
5	56	20
6	57	20
7	58	20
8	59	20
9	56	22
10	57	22
11	58	22
12	59	22
\.


--
-- Name: labelandtemplate_id_labelandtemplate_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('labelandtemplate_id_labelandtemplate_seq', 12, true);


--
-- Data for Name: layerandblock; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY layerandblock (id_layerandblock, layer_id, block_id) FROM stdin;
\.


--
-- Name: layerandblock_id_layerandblock_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('layerandblock_id_layerandblock_seq', 6, true);


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY login (email, init_date, num_input) FROM stdin;
nk_rimma@mail.ru	1517683338239	3
r_707@mail.ru	1517306512346	2
tanzilia.80@mail.ru	1517476363200	2
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY material (id_material, title, priority) FROM stdin;
1	Кирпич	100
2	Брус	90
3	Бревно	80
4	Газоблоки	70
5	Металл	60
6	Пеноблоки	50
7	Сендвич-панели	40
8	Ж/б панели	30
9	Экспериментальные материалы	20
\.


--
-- Name: material_id_material_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('material_id_material_seq', 9, true);


--
-- Data for Name: metro; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY metro (id_metro, metro, city_id) FROM stdin;
35	Аметьево	118
36	Горки	118
37	Козья Слобода	118
38	Кремлёвская	118
39	Площадь Тукая	118
40	Проспект Победы	118
41	Северный вокзал	118
42	Суконная слобода	118
43	Яшьлек	118
34	Авиастроительная	118
\.


--
-- Name: metro_id_metro_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('metro_id_metro_seq', 43, true);


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY node (id, title, alias, date_create, date_edit, author, author_edit, status, main, template, section, line) FROM stdin;
1764	Гостиница	gostinitsa	1517490392730	\N	1	\N	1	0	section	\N	1764
4	Авангард	avangard	1515746205432	\N	1	\N	\N	\N	agency	\N	\N
5	Вавилон	vavilon	1515746555339	\N	1	\N	\N	\N	agency	\N	\N
6	Ваш выбор	vash-vibor	1515746600593	\N	1	\N	\N	\N	agency	\N	\N
7	Ваш дом	vash-dom	1515746624097	\N	1	\N	\N	\N	agency	\N	\N
8	Ваш Дом Ш-11	vash-dom-sh-11	1515746650834	\N	1	\N	\N	\N	agency	\N	\N
9	Ваш риэлтор	vash-rieltor	1515746673787	\N	1	\N	\N	\N	agency	\N	\N
10	Визит	vizit	1515746690663	\N	1	\N	\N	\N	agency	\N	\N
11	Виктория	viktoriya	1515746714266	\N	1	\N	\N	\N	agency	\N	\N
12	Гагарина 4	gagarina-4	1515746731919	\N	1	\N	\N	\N	agency	\N	\N
13	Гамбриниус	gambrinius	1515746749491	\N	1	\N	\N	\N	agency	\N	\N
14	Гранд	grand	1515746761951	\N	1	\N	\N	\N	agency	\N	\N
15	Доверие	doverie	1515746777559	\N	1	\N	\N	\N	agency	\N	\N
16	Домовой	domovoy	1515746793332	\N	1	\N	\N	\N	agency	\N	\N
17	Единство	edinstvo	1515746808060	\N	1	\N	\N	\N	agency	\N	\N
18	Жилье сервис	gile-servis	1515746830644	\N	1	\N	\N	\N	agency	\N	\N
19	Золотой ключик	zolotoy-klyuchik	1515746853346	\N	1	\N	\N	\N	agency	\N	\N
20	ИАРТ Ипотека	iart-ipoteka	1515746925917	\N	1	\N	\N	\N	agency	\N	\N
22	Кама Градъ	kama-grad	1515747019845	\N	1	\N	\N	\N	agency	\N	\N
23	Кармэн	karmen	1515747036094	\N	1	\N	\N	\N	agency	\N	\N
24	Квартал	kvartal	1515747049518	\N	1	\N	\N	\N	agency	\N	\N
25	Квартира НК	kvartira-nk	1515747065645	\N	1	\N	\N	\N	agency	\N	\N
26	Квартирный прогресс	kvartirniy-progress	1515747080292	\N	1	\N	\N	\N	agency	\N	\N
27	Комфорт	komfort	1515747093279	\N	1	\N	\N	\N	agency	\N	\N
28	Лидер Союз	lider-soyuz	1515747107402	\N	1	\N	\N	\N	agency	\N	\N
29	Люкс	lyuks	1515747119614	\N	1	\N	\N	\N	agency	\N	\N
30	Мегаполис	megapolis	1515747133941	\N	1	\N	\N	\N	agency	\N	\N
31	Мир Жилья	mir-gilya	1515747148704	\N	1	\N	\N	\N	agency	\N	\N
32	Мира 58	mira-58	1515747162788	\N	1	\N	\N	\N	agency	\N	\N
33	МЦН	mtsn	1515747175363	\N	1	\N	\N	\N	agency	\N	\N
34	Новоселье	novosele	1515747196080	\N	1	\N	\N	\N	agency	\N	\N
35	Олимп-НК	olimp-nk	1515747221315	\N	1	\N	\N	\N	agency	\N	\N
36	ООО Гарант сервис	ooo-garant-servis	1515747233564	\N	1	\N	\N	\N	agency	\N	\N
37	ООО Центр недвижимости	ooo-tsentr-nedvigimosti	1515747246467	\N	1	\N	\N	\N	agency	\N	\N
39	Руслан	ruslan	1515747272967	\N	1	\N	\N	\N	agency	\N	\N
40	Семь Городов	sem-gorodov	1515747287596	\N	1	\N	\N	\N	agency	\N	\N
41	Сююмбике 61	syuyumbike-61	1515747294969	\N	1	\N	\N	\N	agency	\N	\N
42	Талисман	talisman	1515747309320	\N	1	\N	\N	\N	agency	\N	\N
43	Татарстан	tatarstan18	1515747345957	\N	1	\N	\N	\N	agency	\N	\N
44	Теремок	teremok	1515747362723	\N	1	\N	\N	\N	agency	\N	\N
45	Фаворит	favorit	1515747375297	\N	1	\N	\N	\N	agency	\N	\N
46	Химиков 114	himikov-114	1515747390757	\N	1	\N	\N	\N	agency	\N	\N
47	Химиков 15	himikov-15	1515747403289	\N	1	\N	\N	\N	agency	\N	\N
48	Центр Продаж Квартир	tsentr-prodag-kvartir	1515747420538	\N	1	\N	\N	\N	agency	\N	\N
49	Шинников 1 А	shinnikov-1-a	1515747446803	\N	1	\N	\N	\N	agency	\N	\N
50	Эверест	everest	1515747461867	\N	1	\N	\N	\N	agency	\N	\N
51	Эдель	edel	1515747478050	\N	1	\N	\N	\N	agency	\N	\N
52	Эксперт	ekspert	1515747492762	\N	1	\N	\N	\N	agency	\N	\N
53	Юности 1	yunosti-1	1515747501197	\N	1	\N	\N	\N	agency	\N	\N
54	Альянс	alyans	1515747830879	\N	1	\N	\N	\N	agency	\N	\N
55	Империя-Казань	imperiya-kazan	1515747862393	\N	1	\N	\N	\N	agency	\N	\N
1765	Гараж	garag	1517490435247	\N	1	\N	1	0	section	\N	1765
57	Сдам	sdam	1515750722653	\N	1	\N	1	1	label	\N	90
56	Продам	prodam	1515750692132	1515750740589	1	1	1	1	label	\N	100
58	Куплю	kuplyu	1515750774946	\N	1	\N	1	1	label	\N	80
59	Сниму	snimu	1515750796940	\N	1	\N	1	1	label	\N	70
38	Проспект НК	prospekt-nk	1515747258663	1516124345770	1	1	\N	\N	agency	\N	\N
64	4-комнатные	4-komnatnie	1515751895884	1516526952081	1	1	1	0	section	\N	75
65	5-комнат и более	5-komnat-i-bolee	1515751910660	1516526968706	1	1	1	0	section	\N	74
1836	Комнаты, 11 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1836	1517505098038	\N	1	\N	0	0	apartment	60	\N
66	Контакты	contacts	1515752507401	\N	1	\N	1	0	section	\N	66
67	О нас	about	1515752522902	\N	1	\N	1	0	section	\N	67
68	Новости	novosti	1515752544710	\N	1	\N	1	0	section	\N	68
1935	Комнаты, 11 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	1935	1517507823594	\N	1	\N	0	0	apartment	60	\N
61	1-комнатные	1-komnatnie	1515751853635	1516526872430	1	1	1	0	section	\N	78
1936	Комнаты, 12 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1936	1517507843425	\N	1	\N	0	0	apartment	60	\N
62	2-комнатные	2-komnatnie	1515751876403	1516526887566	1	1	1	0	section	\N	77
63	3-комнатные	3-komnatnie	1515751886118	1516526905653	1	1	1	0	section	\N	76
1937	Комнаты, 18 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	1937	1517507869164	\N	1	\N	0	0	apartment	60	\N
2201	Дом	2201	1517569020328	\N	1	\N	0	0	cottages	1595	\N
75	Мой Дом	moy-dom	1516015996214	\N	288	\N	\N	\N	agency	\N	113
2202	Дом	2202	1517569086317	\N	1	\N	0	0	cottages	1595	\N
21	Инвест Гарант	investgarant	1515747000235	1516021288267	1	288	\N	\N	agency	\N	\N
60	Комнаты	komnati	1515751843235	1516087847303	1	1	1	0	section	\N	85
1837	Торговое помещение, 140 м<sup><small>2</small></sup>	1837	1517505100670	\N	1	\N	0	0	commercial	1784	\N
1839	ПСН	1839	1517505140669	\N	1	\N	0	0	commercial	1779	\N
80	Изолированные малосемейки	izolirovannie-malosemeyki	1516087798126	\N	1	\N	1	0	section	\N	80
1841	Помещение общественного питания	1841	1517505174668	\N	1	\N	0	0	commercial	1788	\N
1938	Изолированные малосемейки, 33 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1938	1517508453514	\N	1	\N	0	0	apartment	80	\N
1939	Изолированные малосемейки, 22 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1939	1517508477586	\N	1	\N	0	0	apartment	80	\N
2058	1-комнатные, 40 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	2058	1517518972599	\N	1	\N	0	0	apartment	61	\N
2203	Дом 50 м<sup><small>2</small></sup>	2203	1517569105315	\N	1	\N	0	0	cottages	1595	\N
2204	Дом на участке 20 сот. 	2204	1517569131317	\N	1	\N	0	0	cottages	1595	\N
2329	4-комнатные, 73.8 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2329	1517581982460	\N	1	\N	0	0	apartment	64	\N
2330	4-комнатные, 91 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2330	1517582008675	\N	1	\N	0	0	apartment	64	\N
2331	4-комнатные, 80 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2331	1517582017998	\N	1	\N	0	0	apartment	64	\N
2332	4-комнатные,  м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2332	1517582034263	\N	1	\N	0	0	apartment	64	\N
2333	4-комнатные, 73 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2333	1517582047588	\N	1	\N	0	0	apartment	64	\N
2334	4-комнатные, 74 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2334	1517582057430	\N	1	\N	0	0	apartment	64	\N
2335	4-комнатные, 74 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2335	1517582079320	\N	1	\N	0	0	apartment	64	\N
2336	4-комнатные, 75 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2336	1517582087608	\N	1	\N	0	0	apartment	64	\N
2337	4-комнатные, 155 м<sup><small>2</small></sup>, 2/12 - этаж/этажей	2337	1517582102748	\N	1	\N	0	0	apartment	64	\N
2338	4-комнатные, 165 м<sup><small>2</small></sup>, 4/10 - этаж/этажей	2338	1517582120436	\N	1	\N	0	0	apartment	64	\N
2339	4-комнатные, 180 м<sup><small>2</small></sup>, 4/10 - этаж/этажей	2339	1517582141926	\N	1	\N	0	0	apartment	64	\N
2340	4-комнатные, 167 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2340	1517582153808	\N	1	\N	0	0	apartment	64	\N
2341	4-комнатные,  м<sup><small>2</small></sup>, 8/12 - этаж/этажей	2341	1517582170528	\N	1	\N	0	0	apartment	64	\N
2454	3-комнатные, 85 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2454	1517586688542	\N	1	\N	0	0	apartment	63	\N
2455	3-комнатные, 68.3 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2455	1517586713503	\N	1	\N	0	0	apartment	63	\N
2456	3-комнатные, 65 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2456	1517586738418	\N	1	\N	0	0	apartment	63	\N
2457	3-комнатные, 66 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2457	1517586755371	\N	1	\N	0	0	apartment	63	\N
2458	3-комнатные,  м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2458	1517586776275	\N	1	\N	0	0	apartment	63	\N
2459	3-комнатные, 65 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2459	1517586796821	\N	1	\N	0	0	apartment	63	\N
2460	3-комнатные, 60.3 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2460	1517586811409	\N	1	\N	0	0	apartment	63	\N
2461	3-комнатные, 76 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2461	1517586825114	\N	1	\N	0	0	apartment	63	\N
2462	3-комнатные, 65 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2462	1517586853550	\N	1	\N	0	0	apartment	63	\N
2463	3-комнатные, 65 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2463	1517586885388	\N	1	\N	0	0	apartment	63	\N
2464	3-комнатные, 65 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2464	1517586911456	\N	1	\N	0	0	apartment	63	\N
2543	Коттедж 140 м<sup><small>2</small></sup> на участке 12 сот. 	2543	1517592978149	\N	1	\N	0	0	cottages	1596	\N
2544	Коттедж 45 м<sup><small>2</small></sup> на участке 12 сот. 	2544	1517593008182	\N	1	\N	0	0	cottages	1596	\N
2715	Земля на участке 15.5 сот. 	2715	1517609260859	\N	1	\N	0	0	cottages	1743	\N
117	Империя	imperiy	1516127359803	\N	1	\N	\N	\N	agency	\N	\N
2937	Коттедж	2937	1517674532671	\N	1	\N	0	0	cottages	1596	\N
2716	Земля на участке 10 сот. 	2716	1517609284554	\N	1	\N	0	0	cottages	1743	\N
2875	Дом 61.4 м<sup><small>2</small></sup> на участке 9.5 сот. 	2875	1517660317364	\N	1	\N	0	0	cottages	1595	\N
3000	Земля на участке 12 сот. 	3000	1517684399413	\N	1	\N	0	0	cottages	1743	\N
3001	Земля на участке 12 сот. 	3001	1517684431825	\N	1	\N	0	0	cottages	1743	\N
3094	Дача на участке 5.7 сот. 	3094	1517726323843	\N	1	\N	0	0	cottages	1750	\N
3224	2-комнатные, 60 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	3224	1517760925894	\N	1	\N	0	0	apartment	62	\N
3303	Земля на участке 6 сот. 	3303	1517854164400	\N	1	\N	0	0	cottages	1743	\N
1838	Комнаты, 17 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1838	1517505135798	\N	1	\N	0	0	apartment	60	\N
1840	Комнаты, 11 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1840	1517505157401	\N	1	\N	0	0	apartment	60	\N
1941	Изолированные малосемейки, 22 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1941	1517508542594	\N	1	\N	0	0	apartment	80	\N
1943	Изолированные малосемейки, 36 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	1943	1517508585517	\N	1	\N	0	0	apartment	80	\N
1945	Изолированные малосемейки, 35.5 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1945	1517508628934	\N	1	\N	0	0	apartment	80	\N
1946	Изолированные малосемейки, 22 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	1946	1517508655132	\N	1	\N	0	0	apartment	80	\N
2059	1-комнатные, 29 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2059	1517519122508	\N	1	\N	0	0	apartment	61	\N
2060	1-комнатные, 30 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2060	1517519142968	\N	1	\N	0	0	apartment	61	\N
2061	1-комнатные, 34 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2061	1517519175176	\N	1	\N	0	0	apartment	61	\N
2062	1-комнатные, 30 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2062	1517519196237	\N	1	\N	0	0	apartment	61	\N
2063	1-комнатные, 30 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2063	1517519212885	\N	1	\N	0	0	apartment	61	\N
2205	Коттедж 150 м<sup><small>2</small></sup> на участке 30 сот. 	2205	1517569189334	\N	1	\N	0	0	cottages	1596	\N
2206	Коттедж 288 м<sup><small>2</small></sup> на участке 16 сот. 	2206	1517569240319	\N	1	\N	0	0	cottages	1596	\N
2342	4-комнатные, 162 м<sup><small>2</small></sup>, 8/12 - этаж/этажей	2342	1517582192204	\N	1	\N	0	0	apartment	64	\N
2343	4-комнатные, 72 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2343	1517582213379	\N	1	\N	0	0	apartment	64	\N
2344	4-комнатные, 157 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	2344	1517582232330	\N	1	\N	0	0	apartment	64	\N
2345	4-комнатные, 168 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2345	1517582243872	\N	1	\N	0	0	apartment	64	\N
2346	4-комнатные, 167 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2346	1517582261682	\N	1	\N	0	0	apartment	64	\N
2347	4-комнатные, 160 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2347	1517582290258	\N	1	\N	0	0	apartment	64	\N
2348	4-комнатные, 118 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2348	1517582339470	\N	1	\N	0	0	apartment	64	\N
2349	4-комнатные, 120 м<sup><small>2</small></sup>, 4/10 - этаж/этажей	2349	1517582369931	\N	1	\N	0	0	apartment	64	\N
2350	4-комнатные, 120 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2350	1517582398999	\N	1	\N	0	0	apartment	64	\N
2351	4-комнатные, 116 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2351	1517582419888	\N	1	\N	0	0	apartment	64	\N
2466	3-комнатные, 73 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2466	1517586946180	\N	1	\N	0	0	apartment	63	\N
2467	3-комнатные, 67 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	2467	1517586966522	\N	1	\N	0	0	apartment	63	\N
2468	3-комнатные, 65 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2468	1517586985544	\N	1	\N	0	0	apartment	63	\N
2469	3-комнатные, 66 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2469	1517587000986	\N	1	\N	0	0	apartment	63	\N
2470	3-комнатные, 70 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2470	1517587016187	\N	1	\N	0	0	apartment	63	\N
2471	3-комнатные, 68 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2471	1517587026968	\N	1	\N	0	0	apartment	63	\N
2472	3-комнатные, 95 м<sup><small>2</small></sup>, 12/12 - этаж/этажей	2472	1517587036836	\N	1	\N	0	0	apartment	63	\N
2545	Коттедж 60 м<sup><small>2</small></sup> на участке 28 сот. 	2545	1517593108152	\N	1	\N	0	0	cottages	1596	\N
2717	Земля	2717	1517609458336	\N	1	\N	0	0	cottages	1743	\N
2718	Земля на участке 15 сот. 	2718	1517609485691	\N	1	\N	0	0	cottages	1743	\N
2719	Земля на участке 10 сот. 	2719	1517609504633	\N	1	\N	0	0	cottages	1743	\N
2720	Земля	2720	1517609542627	\N	1	\N	0	0	cottages	1743	\N
2721	Земля на участке 15 сот. 	2721	1517609567409	\N	1	\N	0	0	cottages	1743	\N
2722	Коттедж	2722	1517609678619	\N	1	\N	0	0	cottages	1596	\N
167	ООО Арслан	arslan	1516133343875	\N	1	\N	\N	\N	agency	\N	\N
2938	Коттедж на участке 15 сот. 	2938	1517674773217	\N	1	\N	0	0	cottages	1596	\N
3002	Земля на участке 30 сот. 	3002	1517684648931	\N	1	\N	0	0	cottages	1743	\N
3095	1-комнатные, 32 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3095	1517751022423	\N	1	\N	0	0	apartment	61	\N
3225	Дача на участке 7 сот. 	3225	1517829033743	\N	1	\N	0	0	cottages	1750	\N
3226	Дача на участке 10 сот. 	3226	1517829055841	\N	1	\N	0	0	cottages	1750	\N
3304	Земля на участке 15 сот. 	3304	1517854188743	\N	1	\N	0	0	cottages	1743	\N
1768	Гараж, 36 м<sup><small>2</small></sup>	1768	1517500507779	\N	1	\N	0	0	commercial	1765	\N
1842	Комнаты, 10 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	1842	1517505193096	\N	1	\N	0	0	apartment	60	\N
1948	Изолированные малосемейки, 28 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1948	1517508724078	\N	1	\N	0	0	apartment	80	\N
2064	1-комнатные, 31 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2064	1517519254672	\N	1	\N	0	0	apartment	61	\N
2065	1-комнатные, 29 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2065	1517519275396	\N	1	\N	0	0	apartment	61	\N
2066	1-комнатные, 28 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2066	1517519285635	\N	1	\N	0	0	apartment	61	\N
2067	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2067	1517519302509	\N	1	\N	0	0	apartment	61	\N
2068	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2068	1517519322003	\N	1	\N	0	0	apartment	61	\N
2069	1-комнатные, 28 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2069	1517519342549	\N	1	\N	0	0	apartment	61	\N
2070	1-комнатные, 34 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2070	1517519358468	\N	1	\N	0	0	apartment	61	\N
2071	1-комнатные, 30 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2071	1517519371213	\N	1	\N	0	0	apartment	61	\N
2072	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2072	1517519384383	\N	1	\N	0	0	apartment	61	\N
2073	1-комнатные, 29 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2073	1517519422361	\N	1	\N	0	0	apartment	61	\N
2074	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2074	1517519455170	\N	1	\N	0	0	apartment	61	\N
2075	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2075	1517519469788	\N	1	\N	0	0	apartment	61	\N
2076	1-комнатные,  м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2076	1517519502479	\N	1	\N	0	0	apartment	61	\N
2207	Коттедж	2207	1517569333256	\N	1	\N	0	0	cottages	1596	\N
2208	Коттедж	2208	1517569370244	\N	1	\N	0	0	cottages	1596	\N
2352	4-комнатные, 78 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2352	1517582484220	\N	1	\N	0	0	apartment	64	\N
2353	4-комнатные, 74 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2353	1517582494792	\N	1	\N	0	0	apartment	64	\N
192	Молод.строит.	molodstrot	1516134965524	\N	1	\N	\N	\N	agency	\N	\N
2354	4-комнатные, 72 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2354	1517582513843	\N	1	\N	0	0	apartment	64	\N
2355	4-комнатные, 72 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2355	1517582528479	\N	1	\N	0	0	apartment	64	\N
2356	4-комнатные, 87 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2356	1517582547466	\N	1	\N	0	0	apartment	64	\N
2473	3-комнатные, 94 м<sup><small>2</small></sup>, 12/13 - этаж/этажей	2473	1517587076236	\N	1	\N	0	0	apartment	63	\N
2546	Коттедж 336 м<sup><small>2</small></sup> на участке 10 сот. 	2546	1517593180140	\N	1	\N	0	0	cottages	1596	\N
2547	Коттедж 225 м<sup><small>2</small></sup> на участке 70 сот. 	2547	1517593230136	\N	1	\N	0	0	cottages	1596	\N
2723	Коттедж 200 м<sup><small>2</small></sup> на участке 13 сот. 	2723	1517609720418	\N	1	\N	0	0	cottages	1596	\N
2724	Земля на участке 10 сот. 	2724	1517609760319	\N	1	\N	0	0	cottages	1743	\N
2725	Земля на участке 15 сот. 	2725	1517609780206	\N	1	\N	0	0	cottages	1743	\N
2726	Земля на участке 26 сот. 	2726	1517609810641	\N	1	\N	0	0	cottages	1743	\N
2727	Земля на участке 12 сот. 	2727	1517609846712	\N	1	\N	0	0	cottages	1743	\N
2728	Земля на участке 10 сот. 	2728	1517609870205	\N	1	\N	0	0	cottages	1743	\N
2877	Дом 50 м<sup><small>2</small></sup>	2877	1517660636683	\N	1	\N	0	0	cottages	1595	\N
2878	Дом 50 м<sup><small>2</small></sup>	2878	1517660657988	\N	1	\N	0	0	cottages	1595	\N
2939	Коттедж	2939	1517674917466	\N	1	\N	0	0	cottages	1596	\N
3003	Земля	3003	1517684702980	\N	1	\N	0	0	cottages	1743	\N
3096	Комнаты, 12 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3096	1517753810947	\N	1	\N	0	0	apartment	60	\N
3227	Дача 25 м<sup><small>2</small></sup> на участке 9 сот. 	3227	1517829090282	\N	1	\N	0	0	cottages	1750	\N
3228	Дача на участке 6 сот. 	3228	1517829133908	\N	1	\N	0	0	cottages	1750	\N
3229	Дача на участке 6 сот. 	3229	1517829158979	\N	1	\N	0	0	cottages	1750	\N
3230	Дача	3230	1517829174968	\N	1	\N	0	0	cottages	1750	\N
3231	Дача на участке 8 сот. 	3231	1517829216554	\N	1	\N	0	0	cottages	1750	\N
3305	Дача на участке 6.7 сот. 	3305	1517854255603	\N	1	\N	0	0	cottages	1750	\N
3339	Земля на участке 11 сот. 	3339	1517857063621	\N	1	\N	0	0	cottages	1743	\N
3340	Земля	3340	1517857086952	\N	1	\N	0	0	cottages	1743	\N
3342	Земля на участке 4 сот. 	3342	1517857147619	\N	1	\N	0	0	cottages	1743	\N
3343	Земля	3343	1517857169539	\N	1	\N	0	0	cottages	1743	\N
3344	Земля	3344	1517857207837	\N	1	\N	0	0	cottages	1743	\N
3345	Земля на участке 4 сот. 	3345	1517857247130	\N	1	\N	0	0	cottages	1743	\N
3850	Дача на участке 8 сот. 	3850	1518056541430	\N	1	\N	0	0	cottages	1750	\N
1769	Гараж, 18 м<sup><small>2</small></sup>	1769	1517500592758	\N	1	\N	0	0	commercial	1765	\N
1843	Офисное помещение	ofisnoe-pomeshchenie	1517505209736	\N	1	\N	1	0	section	\N	1843
1949	Изолированные малосемейки, 36 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1949	1517508790993	\N	1	\N	0	0	apartment	80	\N
2077	1-комнатные, 29 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2077	1517519558659	\N	1	\N	0	0	apartment	61	\N
2078	1-комнатные, 29 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2078	1517519581651	\N	1	\N	0	0	apartment	61	\N
2209	Коттедж 280 м<sup><small>2</small></sup> на участке 10 сот. 	2209	1517569432253	\N	1	\N	0	0	cottages	1596	\N
2357	3-комнатные, 74 м<sup><small>2</small></sup>, 12/14 - этаж/этажей	2357	1517582597210	\N	1	\N	0	0	apartment	63	\N
2358	3-комнатные,  м<sup><small>2</small></sup>, 3/12 - этаж/этажей	2358	1517582616609	\N	1	\N	0	0	apartment	63	\N
2359	3-комнатные, 60 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2359	1517582629882	\N	1	\N	0	0	apartment	63	\N
2360	3-комнатные, 60 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2360	1517582646119	\N	1	\N	0	0	apartment	63	\N
2361	3-комнатные, 60 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2361	1517582659737	\N	1	\N	0	0	apartment	63	\N
2362	3-комнатные, 60.5 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2362	1517582671616	\N	1	\N	0	0	apartment	63	\N
2363	3-комнатные, 59 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2363	1517582682390	\N	1	\N	0	0	apartment	63	\N
2364	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2364	1517582693662	\N	1	\N	0	0	apartment	63	\N
2365	3-комнатные, 60 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2365	1517582708998	\N	1	\N	0	0	apartment	63	\N
2366	3-комнатные, 119 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2366	1517582726821	\N	1	\N	0	0	apartment	63	\N
2367	3-комнатные, 96 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2367	1517582751815	\N	1	\N	0	0	apartment	63	\N
2368	3-комнатные, 164 м<sup><small>2</small></sup>, 2/8 - этаж/этажей	2368	1517582773147	\N	1	\N	0	0	apartment	63	\N
2369	3-комнатные, 160 м<sup><small>2</small></sup>, 4/7 - этаж/этажей	2369	1517582803418	\N	1	\N	0	0	apartment	63	\N
2370	3-комнатные, 112 м<sup><small>2</small></sup>, 6/8 - этаж/этажей	2370	1517582826343	\N	1	\N	0	0	apartment	63	\N
2371	3-комнатные, 65 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2371	1517582841113	\N	1	\N	0	0	apartment	63	\N
2372	3-комнатные, 93 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2372	1517582868761	\N	1	\N	0	0	apartment	63	\N
2373	3-комнатные, 65 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2373	1517582891373	\N	1	\N	0	0	apartment	63	\N
2474	3-комнатные,  м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2474	1517587119553	\N	1	\N	0	0	apartment	63	\N
2475	3-комнатные, 63 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2475	1517587159814	\N	1	\N	0	0	apartment	63	\N
2476	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2476	1517587172614	\N	1	\N	0	0	apartment	63	\N
2477	3-комнатные, 65 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2477	1517587191686	\N	1	\N	0	0	apartment	63	\N
2478	3-комнатные, 59 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2478	1517587201997	\N	1	\N	0	0	apartment	63	\N
2479	3-комнатные, 60 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2479	1517587216284	\N	1	\N	0	0	apartment	63	\N
2480	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2480	1517587225103	\N	1	\N	0	0	apartment	63	\N
2481	3-комнатные, 60 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2481	1517587236280	\N	1	\N	0	0	apartment	63	\N
2482	3-комнатные, 60 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2482	1517587256175	\N	1	\N	0	0	apartment	63	\N
2483	3-комнатные, 60 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2483	1517587277199	\N	1	\N	0	0	apartment	63	\N
2484	3-комнатные, 58 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2484	1517587287432	\N	1	\N	0	0	apartment	63	\N
2485	3-комнатные, 68 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2485	1517587295489	\N	1	\N	0	0	apartment	63	\N
2486	3-комнатные, 65 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2486	1517587304698	\N	1	\N	0	0	apartment	63	\N
2487	3-комнатные, 75 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2487	1517587322047	\N	1	\N	0	0	apartment	63	\N
2488	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2488	1517587333337	\N	1	\N	0	0	apartment	63	\N
2548	Коттедж 200 м<sup><small>2</small></sup> на участке 30 сот. 	2548	1517593360155	\N	1	\N	0	0	cottages	1596	\N
2549	Коттедж 139 м<sup><small>2</small></sup> на участке 20 сот. 	2549	1517593386143	\N	1	\N	0	0	cottages	1596	\N
2550	Коттедж 224 м<sup><small>2</small></sup> на участке 25 сот. 	2550	1517593419144	\N	1	\N	0	0	cottages	1596	\N
2729	Земля на участке 12 сот. 	2729	1517609957324	\N	1	\N	0	0	cottages	1743	\N
2730	Дом на участке 15 сот. 	2730	1517610009593	\N	1	\N	0	0	cottages	1595	\N
2731	Дом на участке 8 сот. 	2731	1517610039040	\N	1	\N	0	0	cottages	1595	\N
2732	Дом	2732	1517610081734	\N	1	\N	0	0	cottages	1595	\N
2879	Дом	2879	1517661104887	\N	1	\N	0	0	cottages	1595	\N
1770	Погреб	pogreb	1517500828447	\N	1	\N	1	0	section	\N	1770
1844	Комнаты, 12 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1844	1517505256541	\N	1	\N	0	0	apartment	60	\N
1846	Комнаты, 14 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	1846	1517505282827	\N	1	\N	0	0	apartment	60	\N
1847	Комнаты, 14 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	1847	1517505305884	\N	1	\N	0	0	apartment	60	\N
1950	Изолированные малосемейки, 28 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1950	1517508853117	\N	1	\N	0	0	apartment	80	\N
1951	Изолированные малосемейки, 36 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1951	1517508881482	\N	1	\N	0	0	apartment	80	\N
2079	1-комнатные, 36 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2079	1517519668920	\N	1	\N	0	0	apartment	61	\N
2080	1-комнатные, 35 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2080	1517519686872	\N	1	\N	0	0	apartment	61	\N
2081	1-комнатные, 32 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2081	1517519711554	\N	1	\N	0	0	apartment	61	\N
2082	1-комнатные, 37 м<sup><small>2</small></sup>, 6/12 - этаж/этажей	2082	1517519733123	\N	1	\N	0	0	apartment	61	\N
2083	1-комнатные, 33 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2083	1517519760287	\N	1	\N	0	0	apartment	61	\N
2084	1-комнатные, 30 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2084	1517519774536	\N	1	\N	0	0	apartment	61	\N
2085	1-комнатные, 31 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2085	1517519794643	\N	1	\N	0	0	apartment	61	\N
2086	1-комнатные, 29 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2086	1517519842468	\N	1	\N	0	0	apartment	61	\N
2210	Коттедж 154 м<sup><small>2</small></sup> на участке 17 сот. 	2210	1517569478256	\N	1	\N	0	0	cottages	1596	\N
2374	3-комнатные, 110 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2374	1517582949496	\N	1	\N	0	0	apartment	63	\N
2375	3-комнатные, 123 м<sup><small>2</small></sup>, 4/8 - этаж/этажей	2375	1517582970604	\N	1	\N	0	0	apartment	63	\N
2489	3-комнатные, 65 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	2489	1517587396160	\N	1	\N	0	0	apartment	63	\N
2490	3-комнатные, 74 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	2490	1517587408346	\N	1	\N	0	0	apartment	63	\N
2491	3-комнатные, 78 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2491	1517587418792	\N	1	\N	0	0	apartment	63	\N
2492	3-комнатные, 66 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2492	1517587431867	\N	1	\N	0	0	apartment	63	\N
2551	Коттедж 116 м<sup><small>2</small></sup> на участке 15 сот. 	2551	1517593466160	\N	1	\N	0	0	cottages	1596	\N
2733	Дача на участке 9 сот. 	2733	1517610123483	\N	1	\N	0	0	cottages	1750	\N
2880	Дом 140 м<sup><small>2</small></sup>	2880	1517661411323	\N	1	\N	0	0	cottages	1595	\N
2940	Коттедж 180 м<sup><small>2</small></sup> на участке 12 сот. 	2940	1517675248149	\N	1	\N	0	0	cottages	1596	\N
3004	Земля на участке 16 сот. 	3004	1517684860328	\N	1	\N	0	0	cottages	1743	\N
3005	Земля на участке 25 сот. 	3005	1517684914278	\N	1	\N	0	0	cottages	1743	\N
3006	Земля на участке 15 сот. 	3006	1517684958767	\N	1	\N	0	0	cottages	1743	\N
3007	Дача на участке 36 сот. 	3007	1517685071051	\N	1	\N	0	0	cottages	1750	\N
3097	1-комнатные, 34 м<sup><small>2</small></sup>, 0/0 - этаж/этажей	3097	1517753966033	\N	1	\N	0	0	apartment	61	\N
3232	Дача	3232	1517829278779	\N	1	\N	0	0	cottages	1750	\N
3233	Дача	3233	1517829300792	\N	1	\N	0	0	cottages	1750	\N
3234	Дача на участке 4 сот. 	3234	1517829337381	\N	1	\N	0	0	cottages	1750	\N
3235	Дача	3235	1517829392496	\N	1	\N	0	0	cottages	1750	\N
3236	Дача на участке 5 сот. 	3236	1517829415237	\N	1	\N	0	0	cottages	1750	\N
3237	Земля на участке 4 сот. 	3237	1517829444556	\N	1	\N	0	0	cottages	1743	\N
3238	Дача на участке 8 сот. 	3238	1517829477229	\N	1	\N	0	0	cottages	1750	\N
3306	Дача 120 м<sup><small>2</small></sup> на участке 30 сот. 	3306	1517854465742	\N	1	\N	0	0	cottages	1750	\N
3346	Земля	3346	1517857371925	\N	1	\N	0	0	cottages	1743	\N
3370	Гостиница, 457 м<sup><small>2</small></sup>	3370	1517899382911	\N	1	\N	0	0	commercial	1764	\N
3486	4-комнатные, 120 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3486	1518000792743	\N	1	\N	0	0	apartment	64	\N
3487	4-комнатные, 96 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3487	1518000803310	\N	1	\N	0	0	apartment	64	\N
3488	4-комнатные, 86 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3488	1518000819106	\N	1	\N	0	0	apartment	64	\N
3489	4-комнатные, 43 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3489	1518000828468	\N	1	\N	0	0	apartment	64	\N
3490	4-комнатные, 111 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3490	1518000840182	\N	1	\N	0	0	apartment	64	\N
3491	4-комнатные, 118 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3491	1518000865504	\N	1	\N	0	0	apartment	64	\N
3492	4-комнатные, 80 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3492	1518000880814	\N	1	\N	0	0	apartment	64	\N
3493	4-комнатные, 87 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3493	1518000899095	\N	1	\N	0	0	apartment	64	\N
3872	Дом	3872	1518057790891	\N	1	\N	0	0	cottages	1595	\N
1771	Гараж, 36 м<sup><small>2</small></sup>	1771	1517500940684	\N	1	\N	0	0	commercial	1765	\N
1772	Гараж, 18 м<sup><small>2</small></sup>	1772	1517500963949	\N	1	\N	0	0	commercial	1765	\N
1845	Офисное помещение, 121 м<sup><small>2</small></sup>	1845	1517505260907	\N	1	\N	0	0	commercial	1843	\N
1952	ПСН, 200 м<sup><small>2</small></sup>	1952	1517508982661	\N	1	\N	0	0	commercial	1779	\N
2087	1-комнатные, 29 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2087	1517520027064	\N	1	\N	0	0	apartment	61	\N
2088	1-комнатные, 30 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2088	1517520046771	\N	1	\N	0	0	apartment	61	\N
2089	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2089	1517520063146	\N	1	\N	0	0	apartment	61	\N
2211	Коттедж 180 м<sup><small>2</small></sup> на участке 20 сот. 	2211	1517569520257	\N	1	\N	0	0	cottages	1596	\N
2376	3-комнатные, 55 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2376	1517584921351	\N	1	\N	0	0	apartment	63	\N
2377	3-комнатные, 65 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2377	1517584938077	\N	1	\N	0	0	apartment	63	\N
2378	3-комнатные, 66 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2378	1517584949069	\N	1	\N	0	0	apartment	63	\N
2379	3-комнатные, 60 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2379	1517584957816	\N	1	\N	0	0	apartment	63	\N
2380	3-комнатные, 79 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2380	1517584972705	\N	1	\N	0	0	apartment	63	\N
2381	3-комнатные, 60 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2381	1517585005713	\N	1	\N	0	0	apartment	63	\N
2382	3-комнатные, 58.4 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2382	1517585020081	\N	1	\N	0	0	apartment	63	\N
2383	4-комнатные, 140 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2383	1517585035979	\N	1	\N	0	0	apartment	64	\N
2384	4-комнатные, 90 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2384	1517585052601	\N	1	\N	0	0	apartment	64	\N
2385	4-комнатные, 60 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2385	1517585062184	\N	1	\N	0	0	apartment	64	\N
2386	4-комнатные, 113 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2386	1517585072553	\N	1	\N	0	0	apartment	64	\N
2387	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2387	1517585093430	\N	1	\N	0	0	apartment	63	\N
2388	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2388	1517585110186	\N	1	\N	0	0	apartment	63	\N
2389	3-комнатные, 59 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2389	1517585121991	\N	1	\N	0	0	apartment	63	\N
2390	3-комнатные, 70 м<sup><small>2</small></sup>, 6/6 - этаж/этажей	2390	1517585137439	\N	1	\N	0	0	apartment	63	\N
2391	3-комнатные, 124 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2391	1517585167177	\N	1	\N	0	0	apartment	63	\N
2493	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2493	1517588357225	\N	1	\N	0	0	apartment	63	\N
2494	3-комнатные, 60 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2494	1517588379701	\N	1	\N	0	0	apartment	63	\N
2495	3-комнатные, 60 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2495	1517588402154	\N	1	\N	0	0	apartment	63	\N
2496	3-комнатные, 58 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2496	1517588423811	\N	1	\N	0	0	apartment	63	\N
2497	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2497	1517588431138	\N	1	\N	0	0	apartment	63	\N
2498	3-комнатные, 58 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2498	1517588461801	\N	1	\N	0	0	apartment	63	\N
2499	3-комнатные, 106 м<sup><small>2</small></sup>, 5/12 - этаж/этажей	2499	1517588484329	\N	1	\N	0	0	apartment	63	\N
2552	Коттедж 73 м<sup><small>2</small></sup> на участке 23 сот. 	2552	1517593524158	\N	1	\N	0	0	cottages	1596	\N
3009	Дача 90 м<sup><small>2</small></sup> на участке 7 сот. 	3009	1517685378350	\N	1	\N	0	0	cottages	1750	\N
2553	Коттедж на участке 38 сот. 	2553	1517593559145	\N	1	\N	0	0	cottages	1596	\N
2734	Земля на участке 10 сот. 	2734	1517610315225	\N	1	\N	0	0	cottages	1743	\N
2881	Дом 62 м<sup><small>2</small></sup> на участке 12 сот. 	2881	1517661934442	\N	1	\N	0	0	cottages	1595	\N
2941	Коттедж 200 м<sup><small>2</small></sup> на участке 20 сот. 	2941	1517675303280	\N	1	\N	0	0	cottages	1596	\N
3008	Дача 130 м<sup><small>2</small></sup> на участке 5 сот. 	3008	1517685346784	\N	1	\N	0	0	cottages	1750	\N
3010	Дача	3010	1517685413076	\N	1	\N	0	0	cottages	1750	\N
3011	Земля на участке 15 сот. 	3011	1517685456728	\N	1	\N	0	0	cottages	1743	\N
3012	Дача на участке 4 сот. 	3012	1517685483028	\N	1	\N	0	0	cottages	1750	\N
3098	1-комнатные, 43 м<sup><small>2</small></sup>, 2/3 - этаж/этажей	3098	1517754041186	\N	1	\N	0	0	apartment	61	\N
3239	Дача	3239	1517829543443	\N	1	\N	0	0	cottages	1750	\N
3240	Дача	3240	1517829591496	\N	1	\N	0	0	cottages	1750	\N
3241	Дом на участке 4 сот. 	3241	1517829627903	\N	1	\N	0	0	cottages	1595	\N
3307	Земля на участке 15 сот. 	3307	1517854530693	\N	1	\N	0	0	cottages	1743	\N
3347	Земля на участке 500 сот. 	3347	1517857517496	\N	1	\N	0	0	cottages	1743	\N
3887	Дом	3887	1518075129181	\N	1	\N	0	0	cottages	1595	\N
1773	Автостоянка	avtostoyanka	1517501122705	\N	1	\N	1	0	section	\N	1773
1848	ПСН, 238 м<sup><small>2</small></sup>	1848	1517505325672	\N	1	\N	0	0	commercial	1779	\N
1849	ПСН, 304 м<sup><small>2</small></sup>	1849	1517505353671	\N	1	\N	0	0	commercial	1779	\N
1852	ПСН, 580 м<sup><small>2</small></sup>	1852	1517505378684	\N	1	\N	0	0	commercial	1779	\N
1953	Гараж, 120 м<sup><small>2</small></sup>	1953	1517509042650	\N	1	\N	0	0	commercial	1765	\N
1954	ПСН	1954	1517509089651	\N	1	\N	0	0	commercial	1779	\N
1955	ПСН, 323 м<sup><small>2</small></sup>	1955	1517509123648	\N	1	\N	0	0	commercial	1779	\N
1956	ПСН, 91 м<sup><small>2</small></sup>	1956	1517509201996	\N	1	\N	0	0	commercial	1779	\N
1957	ПСН, 336 м<sup><small>2</small></sup>	1957	1517509229126	\N	1	\N	0	0	commercial	1779	\N
1958	ПСН, 121 м<sup><small>2</small></sup>	1958	1517509244672	\N	1	\N	0	0	commercial	1779	\N
1959	Производственное помещение, 2032 м<sup><small>2</small></sup>	1959	1517509278650	\N	1	\N	0	0	commercial	1876	\N
1960	Гостиница, 200 м<sup><small>2</small></sup>	1960	1517509323899	\N	1	\N	0	0	commercial	1764	\N
1961	Производственное помещение, 5650 м<sup><small>2</small></sup>	1961	1517509351652	\N	1	\N	0	0	commercial	1876	\N
2090	1-комнатные, 33 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2090	1517520080345	\N	1	\N	0	0	apartment	61	\N
2091	1-комнатные, 30 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2091	1517520093461	\N	1	\N	0	0	apartment	61	\N
2092	1-комнатные, 40 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2092	1517520126718	\N	1	\N	0	0	apartment	61	\N
2093	1-комнатные, 29 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2093	1517520147810	\N	1	\N	0	0	apartment	61	\N
2094	1-комнатные, 35 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2094	1517520163341	\N	1	\N	0	0	apartment	61	\N
2095	1-комнатные, 22 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2095	1517520173912	\N	1	\N	0	0	apartment	61	\N
2096	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2096	1517520187904	\N	1	\N	0	0	apartment	61	\N
2097	1-комнатные, 32 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2097	1517520208699	\N	1	\N	0	0	apartment	61	\N
2098	1-комнатные, 30 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2098	1517520220877	\N	1	\N	0	0	apartment	61	\N
2099	1-комнатные, 33 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2099	1517520243600	\N	1	\N	0	0	apartment	61	\N
2100	1-комнатные, 29 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	2100	1517520258537	\N	1	\N	0	0	apartment	61	\N
2101	1-комнатные, 37 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2101	1517520271424	\N	1	\N	0	0	apartment	61	\N
2212	Коттедж 250 м<sup><small>2</small></sup> на участке 15 сот. 	2212	1517569577282	\N	1	\N	0	0	cottages	1596	\N
2213	Коттедж 230 м<sup><small>2</small></sup> на участке 25 сот. 	2213	1517569612246	\N	1	\N	0	0	cottages	1596	\N
2214	Коттедж 72 м<sup><small>2</small></sup> на участке 20 сот. 	2214	1517569648247	\N	1	\N	0	0	cottages	1596	\N
2215	Коттедж 100 м<sup><small>2</small></sup> на участке 25 сот. 	2215	1517569683247	\N	1	\N	0	0	cottages	1596	\N
2216	Коттедж	2216	1517569736250	\N	1	\N	0	0	cottages	1596	\N
2392	3-комнатные, 65.7 м<sup><small>2</small></sup>, 7/10 - этаж/этажей	2392	1517585216107	\N	1	\N	0	0	apartment	63	\N
2500	Дом на участке 39 сот. 	2500	1517589191169	\N	1	\N	0	0	cottages	1595	\N
2554	Коттедж 225 м<sup><small>2</small></sup> на участке 30 сот. 	2554	1517593744151	\N	1	\N	0	0	cottages	1596	\N
2735	2-комнатные, 34 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2735	1517640191466	\N	1	\N	0	0	apartment	62	\N
2736	2-комнатные, 41 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2736	1517640217268	\N	1	\N	0	0	apartment	62	\N
2737	2-комнатные, 42 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2737	1517640235418	\N	1	\N	0	0	apartment	62	\N
2738	2-комнатные, 43 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2738	1517640252069	\N	1	\N	0	0	apartment	62	\N
2739	2-комнатные, 43.2 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2739	1517640274508	\N	1	\N	0	0	apartment	62	\N
2740	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2740	1517640295362	\N	1	\N	0	0	apartment	62	\N
2741	2-комнатные, 43 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2741	1517640320118	\N	1	\N	0	0	apartment	62	\N
2882	Дом 155 м<sup><small>2</small></sup> на участке 12 сот. 	2882	1517662818775	\N	1	\N	0	0	cottages	1595	\N
2942	Коттедж на участке 6 сот. 	2942	1517675735075	\N	1	\N	0	0	cottages	1596	\N
3013	Дача	3013	1517685567551	\N	1	\N	0	0	cottages	1750	\N
3014	Дача на участке 4 сот. 	3014	1517685606193	\N	1	\N	0	0	cottages	1750	\N
3015	Дача	3015	1517685633672	\N	1	\N	0	0	cottages	1750	\N
3016	Дача на участке 8 сот. 	3016	1517685650203	\N	1	\N	0	0	cottages	1750	\N
3099	1-комнатные, 36.4 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3099	1517754092692	\N	1	\N	0	0	apartment	61	\N
3100	1-комнатные, 40 м<sup><small>2</small></sup>, 6/13 - этаж/этажей	3100	1517754115137	\N	1	\N	0	0	apartment	61	\N
3242	Дача 180 м<sup><small>2</small></sup>	3242	1517829752150	\N	1	\N	0	0	cottages	1750	\N
1774	Автостоянка	1774	1517501158733	\N	1	\N	0	0	commercial	1773	\N
1850	Комнаты, 18 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	1850	1517505359959	\N	1	\N	0	0	apartment	60	\N
1775	Гараж	1775	1517501179926	\N	1	\N	0	0	commercial	1765	\N
1851	Комнаты, 18 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	1851	1517505375936	\N	1	\N	0	0	apartment	60	\N
1962	Производственное помещение, 1200 м<sup><small>2</small></sup>	1962	1517509544656	\N	1	\N	0	0	commercial	1876	\N
1963	ПСН, 83 м<sup><small>2</small></sup>	1963	1517509571868	\N	1	\N	0	0	commercial	1779	\N
2102	1-комнатные, 36 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2102	1517520322592	\N	1	\N	0	0	apartment	61	\N
2103	1-комнатные, 36 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2103	1517520345131	\N	1	\N	0	0	apartment	61	\N
2104	1-комнатные, 28 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	2104	1517520360845	\N	1	\N	0	0	apartment	61	\N
2105	1-комнатные, 70 м<sup><small>2</small></sup>, 8/12 - этаж/этажей	2105	1517520386136	\N	1	\N	0	0	apartment	61	\N
2217	Коттедж 581.2 м<sup><small>2</small></sup> на участке 12 сот. 	2217	1517569866275	\N	1	\N	0	0	cottages	1596	\N
2393	3-комнатные, 66 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2393	1517585250297	\N	1	\N	0	0	apartment	63	\N
2394	3-комнатные, 65 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2394	1517585275939	\N	1	\N	0	0	apartment	63	\N
2501	Дом на участке 15 сот. 	2501	1517589285161	\N	1	\N	0	0	cottages	1595	\N
2555	Коттедж 160 м<sup><small>2</small></sup>	2555	1517593792148	\N	1	\N	0	0	cottages	1596	\N
2742	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2742	1517640445003	\N	1	\N	0	0	apartment	62	\N
2743	2-комнатные, 52 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2743	1517640475414	\N	1	\N	0	0	apartment	62	\N
2744	2-комнатные, 42 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2744	1517640489456	\N	1	\N	0	0	apartment	62	\N
2745	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2745	1517640509977	\N	1	\N	0	0	apartment	62	\N
2746	2-комнатные, 48 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2746	1517640528501	\N	1	\N	0	0	apartment	62	\N
2747	2-комнатные, 46 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2747	1517640545449	\N	1	\N	0	0	apartment	62	\N
2748	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2748	1517640561978	\N	1	\N	0	0	apartment	62	\N
2749	2-комнатные, 45 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2749	1517640579206	\N	1	\N	0	0	apartment	62	\N
2750	2-комнатные,  м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2750	1517640594940	\N	1	\N	0	0	apartment	62	\N
2751	2-комнатные, 48.8 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2751	1517640616182	\N	1	\N	0	0	apartment	62	\N
2752	2-комнатные, 50 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2752	1517640631512	\N	1	\N	0	0	apartment	62	\N
2753	2-комнатные,  м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2753	1517640651128	\N	1	\N	0	0	apartment	62	\N
2754	2-комнатные, 51 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2754	1517640663380	\N	1	\N	0	0	apartment	62	\N
2755	2-комнатные, 54 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2755	1517640679274	\N	1	\N	0	0	apartment	62	\N
2756	2-комнатные, 52 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	2756	1517640693817	\N	1	\N	0	0	apartment	62	\N
2757	2-комнатные, 42 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2757	1517640717069	\N	1	\N	0	0	apartment	62	\N
2758	2-комнатные,  м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2758	1517640741814	\N	1	\N	0	0	apartment	62	\N
2759	2-комнатные, 52 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	2759	1517640749999	\N	1	\N	0	0	apartment	62	\N
2883	Дом на участке 20 сот. 	2883	1517664019688	\N	1	\N	0	0	cottages	1595	\N
2943	Коттедж 75 м<sup><small>2</small></sup>	2943	1517675845448	\N	1	\N	0	0	cottages	1596	\N
3017	Дача на участке 4 сот. 	3017	1517685700288	\N	1	\N	0	0	cottages	1750	\N
3018	Земля на участке 15 сот. 	3018	1517685730314	\N	1	\N	0	0	cottages	1743	\N
3019	Дача 16 м<sup><small>2</small></sup> на участке 5 сот. 	3019	1517685753376	\N	1	\N	0	0	cottages	1750	\N
3020	Дача	3020	1517685776201	\N	1	\N	0	0	cottages	1750	\N
3021	Земля на участке 10 сот. 	3021	1517685843841	\N	1	\N	0	0	cottages	1743	\N
3101	2-комнатные, 47 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3101	1517754390959	\N	1	\N	0	0	apartment	62	\N
3243	Дача	3243	1517829896275	\N	1	\N	0	0	cottages	1750	\N
3308	Земля на участке 15 сот. 	3308	1517854605622	\N	1	\N	0	0	cottages	1743	\N
3348	Земля на участке 32 сот. 	3348	1517857605582	\N	1	\N	0	0	cottages	1743	\N
3371	1-комнатные, 30 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3371	1517998277816	\N	1	\N	0	0	apartment	61	\N
3494	4-комнатные, 120 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3494	1518000913785	\N	1	\N	0	0	apartment	64	\N
3495	4-комнатные, 103 м<sup><small>2</small></sup>, 2/12 - этаж/этажей	3495	1518000938723	\N	1	\N	0	0	apartment	64	\N
3496	4-комнатные, 78 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	3496	1518000964958	\N	1	\N	0	0	apartment	64	\N
1776	Гараж, 74 м<sup><small>2</small></sup>	1776	1517501316686	\N	1	\N	0	0	commercial	1765	\N
1853	Комнаты, 17 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1853	1517505420244	\N	1	\N	0	0	apartment	60	\N
1856	Комнаты, 13 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1856	1517505466880	\N	1	\N	0	0	apartment	60	\N
1964	ПСН, 850 м<sup><small>2</small></sup>	1964	1517509655677	\N	1	\N	0	0	commercial	1779	\N
2106	1-комнатные, 36 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2106	1517520512156	\N	1	\N	0	0	apartment	61	\N
2107	1-комнатные, 36 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2107	1517520534967	\N	1	\N	0	0	apartment	61	\N
2108	1-комнатные, 40 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2108	1517520557475	\N	1	\N	0	0	apartment	61	\N
2109	1-комнатные, 39 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2109	1517520570507	\N	1	\N	0	0	apartment	61	\N
2110	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2110	1517520595000	\N	1	\N	0	0	apartment	61	\N
2111	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2111	1517520615408	\N	1	\N	0	0	apartment	61	\N
2112	1-комнатные, 29 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2112	1517520633401	\N	1	\N	0	0	apartment	61	\N
2218	Коттедж 250 м<sup><small>2</small></sup> на участке 15 сот. 	2218	1517569926264	\N	1	\N	0	0	cottages	1596	\N
2219	Коттедж 500 м<sup><small>2</small></sup>	2219	1517569963251	\N	1	\N	0	0	cottages	1596	\N
2220	Коттедж 290 м<sup><small>2</small></sup> на участке 12 сот. 	2220	1517570013269	\N	1	\N	0	0	cottages	1596	\N
2221	Коттедж 440 м<sup><small>2</small></sup>	2221	1517570056252	\N	1	\N	0	0	cottages	1596	\N
2222	Коттедж 118 м<sup><small>2</small></sup> на участке 40 сот. 	2222	1517570131255	\N	1	\N	0	0	cottages	1596	\N
2223	Коттедж 60 м<sup><small>2</small></sup>	2223	1517570146257	\N	1	\N	0	0	cottages	1596	\N
2395	3-комнатные, 65 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2395	1517585338792	\N	1	\N	0	0	apartment	63	\N
2502	Дом на участке 16 сот. 	2502	1517589342166	\N	1	\N	0	0	cottages	1595	\N
2556	Коттедж 113 м<sup><small>2</small></sup>	2556	1517593923148	\N	1	\N	0	0	cottages	1596	\N
2760	2-комнатные, 56.8 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2760	1517640787397	\N	1	\N	0	0	apartment	62	\N
2761	2-комнатные, 74 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2761	1517640818525	\N	1	\N	0	0	apartment	62	\N
2762	2-комнатные, 57 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2762	1517640833246	\N	1	\N	0	0	apartment	62	\N
2884	Дом 100 м<sup><small>2</small></sup> на участке 11 сот. 	2884	1517664056597	\N	1	\N	0	0	cottages	1595	\N
2885	Дом 93 м<sup><small>2</small></sup> на участке 11 сот. 	2885	1517664079647	\N	1	\N	0	0	cottages	1595	\N
2944	Коттедж 290 м<sup><small>2</small></sup> на участке 10 сот. 	2944	1517676200808	\N	1	\N	0	0	cottages	1596	\N
2945	Коттедж 215 м<sup><small>2</small></sup> на участке 10 сот. 	2945	1517676234235	\N	1	\N	0	0	cottages	1596	\N
2946	Коттедж 140 м<sup><small>2</small></sup> на участке 13 сот. 	2946	1517676282354	\N	1	\N	0	0	cottages	1596	\N
3022	Земля на участке 43 сот. 	3022	1517685948485	\N	1	\N	0	0	cottages	1743	\N
3023	Дача 45 м<sup><small>2</small></sup> на участке 12 сот. 	3023	1517686000186	\N	1	\N	0	0	cottages	1750	\N
3024	Дача на участке 6 сот. 	3024	1517686017499	\N	1	\N	0	0	cottages	1750	\N
3025	Земля на участке 4 сот. 	3025	1517686039983	\N	1	\N	0	0	cottages	1743	\N
3102	3-комнатные, 117 м<sup><small>2</small></sup>, 4/4 - этаж/этажей	3102	1517754673232	\N	1	\N	0	0	apartment	63	\N
3103	2-комнатные, 42 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3103	1517754736483	\N	1	\N	0	0	apartment	62	\N
3104	Комнаты, 21 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3104	1517754821528	\N	1	\N	0	0	apartment	60	\N
3105	Комнаты, 18 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3105	1517754848065	\N	1	\N	0	0	apartment	60	\N
3106	1-комнатные,  м<sup><small>2</small></sup>, 2/3 - этаж/этажей	3106	1517754900077	\N	1	\N	0	0	apartment	61	\N
3244	Земля на участке 19 сот. 	3244	1517842596990	\N	1	\N	0	0	cottages	1743	\N
3245	Земля	3245	1517842615781	\N	1	\N	0	0	cottages	1743	\N
3246	Земля на участке 7 сот. 	3246	1517842650320	\N	1	\N	0	0	cottages	1743	\N
3247	Земля на участке 30 сот. 	3247	1517842687473	\N	1	\N	0	0	cottages	1743	\N
3248	Земля	3248	1517842706837	\N	1	\N	0	0	cottages	1743	\N
3249	Земля на участке 10 сот. 	3249	1517842732438	\N	1	\N	0	0	cottages	1743	\N
3250	Земля	3250	1517842761067	\N	1	\N	0	0	cottages	1743	\N
3251	Земля	3251	1517842783721	\N	1	\N	0	0	cottages	1743	\N
3309	Земля на участке 7.5 сот. 	3309	1517854761612	\N	1	\N	0	0	cottages	1743	\N
3349	Земля на участке 4 сот. 	3349	1517857687510	\N	1	\N	0	0	cottages	1743	\N
3372	1-комнатные, 41 м<sup><small>2</small></sup>, 2/10 - этаж/этажей	3372	1517998323677	\N	1	\N	0	0	apartment	61	\N
3497	4-комнатные, 120 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3497	1518000974952	\N	1	\N	0	0	apartment	64	\N
3851	Земля на участке 10 сот. 	3851	1518056621891	\N	1	\N	0	0	cottages	1743	\N
1854	ПСН	1854	1517505430678	\N	1	\N	0	0	commercial	1779	\N
1777	Гараж, 18 м<sup><small>2</small></sup>	1777	1517501563904	\N	1	\N	0	0	commercial	1765	\N
1855	Офисное помещение, 50 м<sup><small>2</small></sup>	1855	1517505448668	\N	1	\N	0	0	commercial	1843	\N
1857	ПСН, 248 м<sup><small>2</small></sup>	1857	1517505474674	\N	1	\N	0	0	commercial	1779	\N
1965	ПСН, 500 м<sup><small>2</small></sup>	1965	1517509702658	\N	1	\N	0	0	commercial	1779	\N
1966	Торговое помещение	1966	1517509746904	\N	1	\N	0	0	commercial	1784	\N
1967	Офисное помещение, 167 м<sup><small>2</small></sup>	1967	1517509787659	\N	1	\N	0	0	commercial	1843	\N
2113	Коттедж 390 м<sup><small>2</small></sup> на участке 35 сот. 	2113	1517549982431	\N	1	\N	0	0	cottages	1596	\N
2224	Коттедж 202 м<sup><small>2</small></sup> на участке 25 сот. 	2224	1517570273320	\N	1	\N	0	0	cottages	1596	\N
2225	Коттедж 70 м<sup><small>2</small></sup> на участке 20 сот. 	2225	1517570299256	\N	1	\N	0	0	cottages	1596	\N
2226	Коттедж	2226	1517570338258	\N	1	\N	0	0	cottages	1596	\N
2227	Коттедж 71 м<sup><small>2</small></sup> на участке 14 сот. 	2227	1517570373255	\N	1	\N	0	0	cottages	1596	\N
2396	3-комнатные, 178.4 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2396	1517585372705	\N	1	\N	0	0	apartment	63	\N
2397	3-комнатные, 65.5 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2397	1517585403292	\N	1	\N	0	0	apartment	63	\N
2398	3-комнатные, 66 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2398	1517585448394	\N	1	\N	0	0	apartment	63	\N
2399	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2399	1517585467686	\N	1	\N	0	0	apartment	63	\N
2503	Дом на участке 34 сот. 	2503	1517589433173	\N	1	\N	0	0	cottages	1595	\N
2557	Коттедж	2557	1517595029091	\N	1	\N	0	0	cottages	1596	\N
2763	2-комнатные, 54 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2763	1517640866741	\N	1	\N	0	0	apartment	62	\N
2764	2-комнатные, 46 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2764	1517640887801	\N	1	\N	0	0	apartment	62	\N
2765	2-комнатные, 45 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2765	1517640907316	\N	1	\N	0	0	apartment	62	\N
2766	2-комнатные,  м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2766	1517640923791	\N	1	\N	0	0	apartment	62	\N
2767	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2767	1517640938371	\N	1	\N	0	0	apartment	62	\N
2768	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2768	1517640969067	\N	1	\N	0	0	apartment	62	\N
2769	2-комнатные,  м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2769	1517640993705	\N	1	\N	0	0	apartment	62	\N
2770	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2770	1517641005612	\N	1	\N	0	0	apartment	62	\N
2771	2-комнатные,  м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2771	1517641018803	\N	1	\N	0	0	apartment	62	\N
2772	2-комнатные, 43 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2772	1517641055158	\N	1	\N	0	0	apartment	62	\N
2773	2-комнатные, 43.5 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2773	1517641073040	\N	1	\N	0	0	apartment	62	\N
2774	2-комнатные, 43 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2774	1517641086902	\N	1	\N	0	0	apartment	62	\N
2886	Дом на участке 40 сот. 	2886	1517664163629	\N	1	\N	0	0	cottages	1595	\N
2947	Коттедж на участке 20 сот. 	2947	1517676504062	\N	1	\N	0	0	cottages	1596	\N
3026	Дача на участке 4 сот. 	3026	1517686089886	\N	1	\N	0	0	cottages	1750	\N
3107	1-комнатные,  м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3107	1517755080890	\N	1	\N	0	0	apartment	61	\N
3108	1-комнатные, 30 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3108	1517755093808	\N	1	\N	0	0	apartment	61	\N
3109	1-комнатные, 30.4 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3109	1517755117904	\N	1	\N	0	0	apartment	61	\N
3110	1-комнатные, 36 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3110	1517755131207	\N	1	\N	0	0	apartment	61	\N
3111	1-комнатные,  м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3111	1517755152157	\N	1	\N	0	0	apartment	61	\N
3112	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3112	1517755178691	\N	1	\N	0	0	apartment	62	\N
3113	2-комнатные, 46 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3113	1517755198551	\N	1	\N	0	0	apartment	62	\N
3114	2-комнатные,  м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3114	1517755212678	\N	1	\N	0	0	apartment	62	\N
3115	2-комнатные, 45 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3115	1517755221450	\N	1	\N	0	0	apartment	62	\N
3116	2-комнатные, 42 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3116	1517755249201	\N	1	\N	0	0	apartment	62	\N
3252	Земля на участке 31 сот. 	3252	1517842917981	\N	1	\N	0	0	cottages	1743	\N
3310	Земля	3310	1517854856829	\N	1	\N	0	0	cottages	1743	\N
3350	Земля на участке 15 сот. 	3350	1517858151702	\N	1	\N	0	0	cottages	1743	\N
3373	1-комнатные,  м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3373	1517998386094	\N	1	\N	0	0	apartment	61	\N
3374	1-комнатные, 36 м<sup><small>2</small></sup>, 5/12 - этаж/этажей	3374	1517998404893	\N	1	\N	0	0	apartment	61	\N
3498	4-комнатные, 78 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3498	1518000991555	\N	1	\N	0	0	apartment	64	\N
1778	Гараж, 27 м<sup><small>2</small></sup>	1778	1517502290716	\N	1	\N	0	0	commercial	1765	\N
1858	ПСН, 120 м<sup><small>2</small></sup>	1858	1517505491673	\N	1	\N	0	0	commercial	1779	\N
1860	ПСН, 150 м<sup><small>2</small></sup>	1860	1517505512670	\N	1	\N	0	0	commercial	1779	\N
1968	Торговое помещение, 65 м<sup><small>2</small></sup>	1968	1517509888671	\N	1	\N	0	0	commercial	1784	\N
2114	Дом 160 м<sup><small>2</small></sup> на участке 15 сот. 	2114	1517550252436	\N	1	\N	0	0	cottages	1595	\N
2504	Дом на участке 53 сот. 	2504	1517589543171	\N	1	\N	0	0	cottages	1595	\N
2228	Участок 8 сот. 	2228	1517571369288	\N	1	\N	0	0	cottages	1743	\N
2400	3-комнатные, 83 м<sup><small>2</small></sup>, 4/10 - этаж/этажей	2400	1517585501664	\N	1	\N	0	0	apartment	63	\N
2401	3-комнатные, 56 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2401	1517585519960	\N	1	\N	0	0	apartment	63	\N
2402	3-комнатные, 130 м<sup><small>2</small></sup>, 6/12 - этаж/этажей	2402	1517585541285	\N	1	\N	0	0	apartment	63	\N
2403	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2403	1517585558716	\N	1	\N	0	0	apartment	63	\N
2404	3-комнатные, 74 м<sup><small>2</small></sup>, 3/14 - этаж/этажей	2404	1517585581907	\N	1	\N	0	0	apartment	63	\N
2405	3-комнатные, 74 м<sup><small>2</small></sup>, 3/14 - этаж/этажей	2405	1517585598361	\N	1	\N	0	0	apartment	63	\N
2406	3-комнатные,  м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2406	1517585617371	\N	1	\N	0	0	apartment	63	\N
2558	Коттедж 356 м<sup><small>2</small></sup> на участке 21 сот. 	2558	1517595110091	\N	1	\N	0	0	cottages	1596	\N
2559	Коттедж на участке 30 сот. 	2559	1517595144085	\N	1	\N	0	0	cottages	1596	\N
2560	Коттедж 150 м<sup><small>2</small></sup> на участке 10 сот. 	2560	1517595205087	\N	1	\N	0	0	cottages	1596	\N
2775	2-комнатные, 59 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2775	1517641149657	\N	1	\N	0	0	apartment	62	\N
2887	Дом	2887	1517664252310	\N	1	\N	0	0	cottages	1595	\N
2948	Коттедж	2948	1517676575454	\N	1	\N	0	0	cottages	1596	\N
3027	Земля на участке 15 сот. 	3027	1517686166189	\N	1	\N	0	0	cottages	1743	\N
3117	2-комнатные, 57 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3117	1517755329156	\N	1	\N	0	0	apartment	62	\N
3118	3-комнатные, 44 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3118	1517755363510	\N	1	\N	0	0	apartment	63	\N
3119	3-комнатные, 60 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3119	1517755380549	\N	1	\N	0	0	apartment	63	\N
3120	3-комнатные, 59 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3120	1517755390228	\N	1	\N	0	0	apartment	63	\N
3121	3-комнатные, 58 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3121	1517755410659	\N	1	\N	0	0	apartment	63	\N
3122	3-комнатные, 60 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3122	1517755428356	\N	1	\N	0	0	apartment	63	\N
3123	3-комнатные, 60 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3123	1517755455415	\N	1	\N	0	0	apartment	63	\N
3124	3-комнатные, 59 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3124	1517755491195	\N	1	\N	0	0	apartment	63	\N
3125	3-комнатные, 57 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3125	1517755508139	\N	1	\N	0	0	apartment	63	\N
3126	2-комнатные, 40 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3126	1517755559518	\N	1	\N	0	0	apartment	62	\N
3127	2-комнатные, 43 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3127	1517755595494	\N	1	\N	0	0	apartment	62	\N
3128	2-комнатные,  м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3128	1517755621420	\N	1	\N	0	0	apartment	62	\N
3129	1-комнатные, 30 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3129	1517755658701	\N	1	\N	0	0	apartment	61	\N
3130	1-комнатные, 31 м<sup><small>2</small></sup>, 2/3 - этаж/этажей	3130	1517755674701	\N	1	\N	0	0	apartment	61	\N
3131	1-комнатные, 30 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3131	1517755691790	\N	1	\N	0	0	apartment	61	\N
3253	Земля на участке 18 сот. 	3253	1517843020553	\N	1	\N	0	0	cottages	1743	\N
3311	Земля на участке 15 сот. 	3311	1517854942741	\N	1	\N	0	0	cottages	1743	\N
3312	Земля на участке 9 сот. 	3312	1517854968719	\N	1	\N	0	0	cottages	1743	\N
3351	Земля на участке 10 сот. 	3351	1517858408779	\N	1	\N	0	0	cottages	1743	\N
3375	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3375	1517998425156	\N	1	\N	0	0	apartment	61	\N
3376	1-комнатные,  м<sup><small>2</small></sup>, 0/0 - этаж/этажей	3376	1517998450344	\N	1	\N	0	0	apartment	61	\N
3377	1-комнатные, 29 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3377	1517998474049	\N	1	\N	0	0	apartment	61	\N
3378	1-комнатные, 35 м<sup><small>2</small></sup>, 6/12 - этаж/этажей	3378	1517998487820	\N	1	\N	0	0	apartment	61	\N
3379	1-комнатные, 28.5 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3379	1517998504473	\N	1	\N	0	0	apartment	61	\N
3380	1-комнатные, 35 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3380	1517998514851	\N	1	\N	0	0	apartment	61	\N
3381	1-комнатные, 34 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3381	1517998526073	\N	1	\N	0	0	apartment	61	\N
3889	Коттедж	3889	1518075249141	\N	1	\N	0	0	cottages	1596	\N
1779	ПСН	psn	1517502414979	\N	1	\N	1	0	section	\N	1779
1859	Комнаты, 18 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	1859	1517505495797	\N	1	\N	0	0	apartment	60	\N
1861	Комнаты, 12 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	1861	1517505519012	\N	1	\N	0	0	apartment	60	\N
1862	Комнаты, 13.4 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1862	1517505537717	\N	1	\N	0	0	apartment	60	\N
1969	Гараж, 18 м<sup><small>2</small></sup>	1969	1517509984672	\N	1	\N	0	0	commercial	1765	\N
2115	Дом на участке 16 сот. 	2115	1517550298681	\N	1	\N	0	0	cottages	1595	\N
2229	Дом на участке 6 сот. 	2229	1517571460275	\N	1	\N	0	0	cottages	1595	\N
2407	3-комнатные, 60 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2407	1517585652599	\N	1	\N	0	0	apartment	63	\N
2408	3-комнатные, 59 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2408	1517585669938	\N	1	\N	0	0	apartment	63	\N
2409	3-комнатные, 65 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2409	1517585685225	\N	1	\N	0	0	apartment	63	\N
2410	3-комнатные, 66 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2410	1517585703858	\N	1	\N	0	0	apartment	63	\N
2411	3-комнатные,  м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2411	1517585726027	\N	1	\N	0	0	apartment	63	\N
2412	3-комнатные, 100 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2412	1517585749723	\N	1	\N	0	0	apartment	63	\N
2413	3-комнатные, 91 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2413	1517585768747	\N	1	\N	0	0	apartment	63	\N
2414	3-комнатные, 66 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2414	1517585792187	\N	1	\N	0	0	apartment	63	\N
2415	3-комнатные, 128 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2415	1517585824195	\N	1	\N	0	0	apartment	63	\N
2416	3-комнатные, 67 м<sup><small>2</small></sup>, 2/6 - этаж/этажей	2416	1517585849771	\N	1	\N	0	0	apartment	63	\N
2417	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2417	1517585872940	\N	1	\N	0	0	apartment	63	\N
2418	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2418	1517585888807	\N	1	\N	0	0	apartment	63	\N
2419	3-комнатные, 65 м<sup><small>2</small></sup>, 12/12 - этаж/этажей	2419	1517585900445	\N	1	\N	0	0	apartment	63	\N
2420	3-комнатные, 60 м<sup><small>2</small></sup>, 8/12 - этаж/этажей	2420	1517585913228	\N	1	\N	0	0	apartment	63	\N
2421	3-комнатные, 54.3 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2421	1517585936735	\N	1	\N	0	0	apartment	63	\N
2422	3-комнатные, 56 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2422	1517585950992	\N	1	\N	0	0	apartment	63	\N
2423	3-комнатные, 55 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2423	1517585971942	\N	1	\N	0	0	apartment	63	\N
2424	3-комнатные,  м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2424	1517585991512	\N	1	\N	0	0	apartment	63	\N
2425	3-комнатные,  м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2425	1517586006012	\N	1	\N	0	0	apartment	63	\N
2426	3-комнатные, 66.7 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2426	1517586034685	\N	1	\N	0	0	apartment	63	\N
2427	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2427	1517586083409	\N	1	\N	0	0	apartment	63	\N
2428	3-комнатные, 55 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2428	1517586103869	\N	1	\N	0	0	apartment	63	\N
2429	3-комнатные, 65 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	2429	1517586127069	\N	1	\N	0	0	apartment	63	\N
2430	3-комнатные, 66 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2430	1517586143134	\N	1	\N	0	0	apartment	63	\N
2431	3-комнатные, 65 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2431	1517586156274	\N	1	\N	0	0	apartment	63	\N
2432	3-комнатные, 76 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2432	1517586166515	\N	1	\N	0	0	apartment	63	\N
2433	3-комнатные, 66 м<sup><small>2</small></sup>, 4/7 - этаж/этажей	2433	1517586179326	\N	1	\N	0	0	apartment	63	\N
3028	Земля на участке 30 сот. 	3028	1517686591939	\N	1	\N	0	0	cottages	1743	\N
2561	Земля 110 м<sup><small>2</small></sup> на участке 25 сот. 	2561	1517595273099	\N	1	\N	0	0	cottages	1743	\N
2776	2-комнатные, 70 м<sup><small>2</small></sup>, 6/6 - этаж/этажей	2776	1517641194445	\N	1	\N	0	0	apartment	62	\N
2888	Дом 125 м<sup><small>2</small></sup> на участке 6 сот. 	2888	1517664424852	\N	1	\N	0	0	cottages	1595	\N
2505	Дом на участке 45 сот. 	2505	1517589666159	\N	1	\N	0	0	cottages	1595	\N
2949	Коттедж 150 м<sup><small>2</small></sup> на участке 10 сот. 	2949	1517676732255	\N	1	\N	0	0	cottages	1596	\N
3029	Дача на участке 4 сот. 	3029	1517686638598	\N	1	\N	0	0	cottages	1750	\N
3132	1-комнатные, 38 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3132	1517755735828	\N	1	\N	0	0	apartment	61	\N
3133	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3133	1517755753467	\N	1	\N	0	0	apartment	61	\N
3134	1-комнатные, 36 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3134	1517755776708	\N	1	\N	0	0	apartment	61	\N
3135	3-комнатные, 58 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3135	1517755818523	\N	1	\N	0	0	apartment	63	\N
3254	Земля на участке 10 сот. 	3254	1517843097390	\N	1	\N	0	0	cottages	1743	\N
1780	ПСН, 48 м<sup><small>2</small></sup>	1780	1517502471722	\N	1	\N	0	0	commercial	1779	\N
1863	ПСН, 111 м<sup><small>2</small></sup>	1863	1517505568671	\N	1	\N	0	0	commercial	1779	\N
1970	ПСН, 65 м<sup><small>2</small></sup>	1970	1517510046928	\N	1	\N	0	0	commercial	1779	\N
1971	ПСН	1971	1517510087910	\N	1	\N	0	0	commercial	1779	\N
1972	ПСН	1972	1517510102896	\N	1	\N	0	0	commercial	1779	\N
1973	Гараж, 18 м<sup><small>2</small></sup>	1973	1517510145668	\N	1	\N	0	0	commercial	1765	\N
1974	Гараж, 18 м<sup><small>2</small></sup>	1974	1517510176666	\N	1	\N	0	0	commercial	1765	\N
2116	Дом 19 м<sup><small>2</small></sup>	2116	1517550344431	\N	1	\N	0	0	cottages	1595	\N
2230	Участок	2230	1517571568289	\N	1	\N	0	0	cottages	1743	\N
2434	3-комнатные, 68 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2434	1517586242368	\N	1	\N	0	0	apartment	63	\N
2435	3-комнатные, 70 м<sup><small>2</small></sup>, 7/10 - этаж/этажей	2435	1517586270914	\N	1	\N	0	0	apartment	63	\N
2436	3-комнатные, 68 м<sup><small>2</small></sup>, 1/7 - этаж/этажей	2436	1517586286601	\N	1	\N	0	0	apartment	63	\N
2506	Дом 50 м<sup><small>2</small></sup> на участке 20 сот. 	2506	1517589774176	\N	1	\N	0	0	cottages	1595	\N
2507	Дом 76 м<sup><small>2</small></sup> на участке 35 сот. 	2507	1517589823161	\N	1	\N	0	0	cottages	1595	\N
2562	Коттедж 70 м<sup><small>2</small></sup> на участке 17 сот. 	2562	1517595330099	\N	1	\N	0	0	cottages	1596	\N
2777	2-комнатные, 80 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2777	1517641276471	\N	1	\N	0	0	apartment	62	\N
2778	2-комнатные, 80 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	2778	1517641290957	\N	1	\N	0	0	apartment	62	\N
2779	2-комнатные, 49 м<sup><small>2</small></sup>, 11/12 - этаж/этажей	2779	1517641326402	\N	1	\N	0	0	apartment	62	\N
2780	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2780	1517641342814	\N	1	\N	0	0	apartment	62	\N
2781	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2781	1517641389068	\N	1	\N	0	0	apartment	62	\N
2782	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2782	1517641406684	\N	1	\N	0	0	apartment	62	\N
2783	2-комнатные, 48 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2783	1517641428969	\N	1	\N	0	0	apartment	62	\N
2889	Дом 90 м<sup><small>2</small></sup>	2889	1517664499896	\N	1	\N	0	0	cottages	1595	\N
2890	Дом 70 м<sup><small>2</small></sup> на участке 6 сот. 	2890	1517664553784	\N	1	\N	0	0	cottages	1595	\N
2891	Дом на участке 28 сот. 	2891	1517664595049	\N	1	\N	0	0	cottages	1595	\N
2950	Коттедж	2950	1517676808102	\N	1	\N	0	0	cottages	1596	\N
3030	Земля на участке 30 сот. 	3030	1517686817851	\N	1	\N	0	0	cottages	1743	\N
3031	Земля на участке 22 сот. 	3031	1517686843636	\N	1	\N	0	0	cottages	1743	\N
3032	Земля на участке 16 сот. 	3032	1517686884080	\N	1	\N	0	0	cottages	1743	\N
3033	Земля на участке 16 сот. 	3033	1517686925640	\N	1	\N	0	0	cottages	1743	\N
3034	Земля на участке 15 сот. 	3034	1517686953614	\N	1	\N	0	0	cottages	1743	\N
3035	Земля	3035	1517686973542	\N	1	\N	0	0	cottages	1743	\N
3036	Земля	3036	1517687005757	\N	1	\N	0	0	cottages	1743	\N
3037	Земля	3037	1517687027961	\N	1	\N	0	0	cottages	1743	\N
3038	Земля 20 м<sup><small>2</small></sup> на участке 20 сот. 	3038	1517687107768	\N	1	\N	0	0	cottages	1743	\N
3039	Дом	3039	1517687133971	\N	1	\N	0	0	cottages	1595	\N
3136	4-комнатные, 73 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3136	1517755840869	\N	1	\N	0	0	apartment	64	\N
3137	4-комнатные, 71 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3137	1517755856170	\N	1	\N	0	0	apartment	64	\N
3138	3-комнатные, 66 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3138	1517755883616	\N	1	\N	0	0	apartment	63	\N
3139	3-комнатные, 66 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3139	1517755902764	\N	1	\N	0	0	apartment	63	\N
3140	3-комнатные, 65 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3140	1517755930103	\N	1	\N	0	0	apartment	63	\N
3141	3-комнатные, 60 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3141	1517755946114	\N	1	\N	0	0	apartment	63	\N
3142	3-комнатные, 66 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3142	1517755959734	\N	1	\N	0	0	apartment	63	\N
3143	3-комнатные, 56 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3143	1517755973692	\N	1	\N	0	0	apartment	63	\N
3144	3-комнатные, 66 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3144	1517755988728	\N	1	\N	0	0	apartment	63	\N
3145	3-комнатные, 60 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3145	1517756007709	\N	1	\N	0	0	apartment	63	\N
3146	3-комнатные, 66 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3146	1517756027802	\N	1	\N	0	0	apartment	63	\N
3147	3-комнатные, 59 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3147	1517756045357	\N	1	\N	0	0	apartment	63	\N
3148	3-комнатные, 64.7 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3148	1517756061164	\N	1	\N	0	0	apartment	63	\N
3149	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3149	1517756082468	\N	1	\N	0	0	apartment	63	\N
1781	ПСН, 39 м<sup><small>2</small></sup>	1781	1517502548718	\N	1	\N	0	0	commercial	1779	\N
1782	ПСН, 70 м<sup><small>2</small></sup>	1782	1517502573712	\N	1	\N	0	0	commercial	1779	\N
1864	ПСН, 66 м<sup><small>2</small></sup>	1864	1517505606687	\N	1	\N	0	0	commercial	1779	\N
1975	Гараж	1975	1517510271670	\N	1	\N	0	0	commercial	1765	\N
2117	Дом 50 м<sup><small>2</small></sup> на участке 15 сот. 	2117	1517550432434	\N	1	\N	0	0	cottages	1595	\N
2231	Участок 15 сот. 	2231	1517571742281	\N	1	\N	0	0	cottages	1743	\N
2437	3-комнатные, 65 м<sup><small>2</small></sup>, 7/7 - этаж/этажей	2437	1517586331015	\N	1	\N	0	0	apartment	63	\N
2438	3-комнатные, 102 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2438	1517586345169	\N	1	\N	0	0	apartment	63	\N
2439	3-комнатные, 100 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2439	1517586358104	\N	1	\N	0	0	apartment	63	\N
2440	3-комнатные, 68 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2440	1517586377788	\N	1	\N	0	0	apartment	63	\N
2441	3-комнатные, 74 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2441	1517586387372	\N	1	\N	0	0	apartment	63	\N
2442	3-комнатные, 103 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2442	1517586430542	\N	1	\N	0	0	apartment	63	\N
2443	3-комнатные, 86 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2443	1517586471833	\N	1	\N	0	0	apartment	63	\N
2444	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2444	1517586498289	\N	1	\N	0	0	apartment	63	\N
2445	3-комнатные, 93 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2445	1517586551340	\N	1	\N	0	0	apartment	63	\N
2446	3-комнатные, 93 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	2446	1517586567350	\N	1	\N	0	0	apartment	63	\N
2447	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2447	1517586581756	\N	1	\N	0	0	apartment	63	\N
2448	3-комнатные, 60 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2448	1517586591293	\N	1	\N	0	0	apartment	63	\N
2449	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2449	1517586608038	\N	1	\N	0	0	apartment	63	\N
2450	3-комнатные, 60 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2450	1517586619700	\N	1	\N	0	0	apartment	63	\N
2451	3-комнатные, 65 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2451	1517586631064	\N	1	\N	0	0	apartment	63	\N
2452	3-комнатные, 60 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2452	1517586651664	\N	1	\N	0	0	apartment	63	\N
2453	3-комнатные, 75 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2453	1517586671037	\N	1	\N	0	0	apartment	63	\N
2508	Дом на участке 40 сот. 	2508	1517589896181	\N	1	\N	0	0	cottages	1595	\N
2563	Коттедж 180 м<sup><small>2</small></sup> на участке 15 сот. 	2563	1517595415115	\N	1	\N	0	0	cottages	1596	\N
2784	2-комнатные, 48.3 м<sup><small>2</small></sup>, 8/12 - этаж/этажей	2784	1517641488824	\N	1	\N	0	0	apartment	62	\N
2785	2-комнатные, 48 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2785	1517641508081	\N	1	\N	0	0	apartment	62	\N
2786	2-комнатные,  м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2786	1517641530590	\N	1	\N	0	0	apartment	62	\N
2787	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2787	1517641568118	\N	1	\N	0	0	apartment	62	\N
2788	2-комнатные, 43 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2788	1517641584977	\N	1	\N	0	0	apartment	62	\N
2892	Дом 64 м<sup><small>2</small></sup> на участке 18 сот. 	2892	1517664780095	\N	1	\N	0	0	cottages	1595	\N
2951	Коттедж 100 м<sup><small>2</small></sup> на участке 17 сот. 	2951	1517677019796	\N	1	\N	0	0	cottages	1596	\N
2952	Коттедж 210 м<sup><small>2</small></sup> на участке 20 сот. 	2952	1517677057663	\N	1	\N	0	0	cottages	1596	\N
2953	Коттедж 260 м<sup><small>2</small></sup> на участке 23 сот. 	2953	1517677104465	\N	1	\N	0	0	cottages	1596	\N
2954	Коттедж	2954	1517677127782	\N	1	\N	0	0	cottages	1596	\N
2955	Коттедж 180 м<sup><small>2</small></sup> на участке 20 сот. 	2955	1517677169688	\N	1	\N	0	0	cottages	1596	\N
2956	Коттедж 146 м<sup><small>2</small></sup> на участке 10 сот. 	2956	1517677190817	\N	1	\N	0	0	cottages	1596	\N
2957	Коттедж	2957	1517677207411	\N	1	\N	0	0	cottages	1596	\N
2958	Коттедж на участке 30 сот. 	2958	1517677227767	\N	1	\N	0	0	cottages	1596	\N
2959	Коттедж 51 м<sup><small>2</small></sup> на участке 22 сот. 	2959	1517677256730	\N	1	\N	0	0	cottages	1596	\N
2960	Коттедж 91.2 м<sup><small>2</small></sup> на участке 12 сот. 	2960	1517677290250	\N	1	\N	0	0	cottages	1596	\N
3040	Земля на участке 12 сот. 	3040	1517687266311	\N	1	\N	0	0	cottages	1743	\N
3041	Дача на участке 9 сот. 	3041	1517687367759	\N	1	\N	0	0	cottages	1750	\N
3042	Дом на участке 4 сот. 	3042	1517687394163	\N	1	\N	0	0	cottages	1595	\N
3150	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3150	1517756125644	\N	1	\N	0	0	apartment	62	\N
3151	2-комнатные, 41 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3151	1517756138291	\N	1	\N	0	0	apartment	62	\N
3152	2-комнатные, 48 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3152	1517756157270	\N	1	\N	0	0	apartment	62	\N
1783	ПСН, 6250 м<sup><small>2</small></sup>	1783	1517502648705	\N	1	\N	0	0	commercial	1779	\N
1865	ПСН	1865	1517505657686	\N	1	\N	0	0	commercial	1779	\N
1976	Гараж, 18 м<sup><small>2</small></sup>	1976	1517510316684	\N	1	\N	0	0	commercial	1765	\N
2118	Дом на участке 30 сот. 	2118	1517551284385	\N	1	\N	0	0	cottages	1595	\N
2232	Дом на участке 15 сот. 	2232	1517572321301	\N	1	\N	0	0	cottages	1595	\N
2564	Коттедж 150 м<sup><small>2</small></sup> на участке 30 сот. 	2564	1517595505114	\N	1	\N	0	0	cottages	1596	\N
2509	Дом 27 м<sup><small>2</small></sup> на участке 17 сот. 	2509	1517589940182	\N	1	\N	0	0	cottages	1595	\N
2789	2-комнатные, 41 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2789	1517641626392	\N	1	\N	0	0	apartment	62	\N
2790	2-комнатные, 67 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2790	1517641644489	\N	1	\N	0	0	apartment	62	\N
2791	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2791	1517641672814	\N	1	\N	0	0	apartment	62	\N
2792	2-комнатные, 44.7 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2792	1517641698331	\N	1	\N	0	0	apartment	62	\N
2793	2-комнатные, 45 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2793	1517641720286	\N	1	\N	0	0	apartment	62	\N
2794	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2794	1517641747330	\N	1	\N	0	0	apartment	62	\N
2795	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2795	1517641765120	\N	1	\N	0	0	apartment	62	\N
2796	2-комнатные, 48 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2796	1517641788310	\N	1	\N	0	0	apartment	62	\N
2893	Дом 83 м<sup><small>2</small></sup> на участке 15 сот. 	2893	1517664846766	\N	1	\N	0	0	cottages	1595	\N
2961	Коттедж на участке 10 сот. 	2961	1517677335054	\N	1	\N	0	0	cottages	1596	\N
3043	Дача 50 м<sup><small>2</small></sup> на участке 5 сот. 	3043	1517687439993	\N	1	\N	0	0	cottages	1750	\N
3044	Дача	3044	1517687470330	\N	1	\N	0	0	cottages	1750	\N
3045	Земля на участке 12 сот. 	3045	1517687546727	\N	1	\N	0	0	cottages	1743	\N
3046	Земля на участке 25 сот. 	3046	1517687596589	\N	1	\N	0	0	cottages	1743	\N
3153	2-комнатные, 54 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3153	1517756180813	\N	1	\N	0	0	apartment	62	\N
3255	Дача на участке 18 сот. 	3255	1517843163261	\N	1	\N	0	0	cottages	1750	\N
3256	Дача на участке 8 сот. 	3256	1517843197782	\N	1	\N	0	0	cottages	1750	\N
3313	Дача на участке 10 сот. 	3313	1517855088303	\N	1	\N	0	0	cottages	1750	\N
3352	Земля на участке 10000 сот. 	3352	1517860464408	\N	1	\N	0	0	cottages	1743	\N
3382	1-комнатные, 29 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3382	1517998537158	\N	1	\N	0	0	apartment	61	\N
3383	1-комнатные, 29 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3383	1517998556790	\N	1	\N	0	0	apartment	61	\N
3384	1-комнатные, 35 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3384	1517998575498	\N	1	\N	0	0	apartment	61	\N
3385	1-комнатные, 45 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	3385	1517998586130	\N	1	\N	0	0	apartment	61	\N
3386	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3386	1517998598334	\N	1	\N	0	0	apartment	61	\N
3387	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3387	1517998609279	\N	1	\N	0	0	apartment	61	\N
3388	1-комнатные, 29 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3388	1517998622129	\N	1	\N	0	0	apartment	61	\N
3389	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3389	1517998643374	\N	1	\N	0	0	apartment	61	\N
3390	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3390	1517998654547	\N	1	\N	0	0	apartment	61	\N
3391	1-комнатные, 40 м<sup><small>2</small></sup>, 2/10 - этаж/этажей	3391	1517998669199	\N	1	\N	0	0	apartment	61	\N
3392	1-комнатные, 30 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3392	1517998692585	\N	1	\N	0	0	apartment	61	\N
3393	1-комнатные, 33 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3393	1517998702424	\N	1	\N	0	0	apartment	61	\N
3394	1-комнатные, 33 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3394	1517998713131	\N	1	\N	0	0	apartment	61	\N
3395	1-комнатные, 37 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3395	1517998726959	\N	1	\N	0	0	apartment	61	\N
3396	1-комнатные, 33.5 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3396	1517998735012	\N	1	\N	0	0	apartment	61	\N
3397	1-комнатные, 36 м<sup><small>2</small></sup>, 11/12 - этаж/этажей	3397	1517998759690	\N	1	\N	0	0	apartment	61	\N
3398	1-комнатные, 29 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3398	1517998769272	\N	1	\N	0	0	apartment	61	\N
3399	1-комнатные, 35.5 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3399	1517998776338	\N	1	\N	0	0	apartment	61	\N
3400	1-комнатные, 29 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3400	1517998783166	\N	1	\N	0	0	apartment	61	\N
3401	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3401	1517998791061	\N	1	\N	0	0	apartment	61	\N
3402	1-комнатные, 36 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3402	1517998804505	\N	1	\N	0	0	apartment	61	\N
1784	Торговое помещение	torgovoe-pomeshchenie	1517502837748	\N	1	\N	1	0	section	\N	1784
1866	Комнаты, 12 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1866	1517505900278	\N	1	\N	0	0	apartment	60	\N
1867	Комнаты, 18 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1867	1517505913697	\N	1	\N	0	0	apartment	60	\N
1977	Гараж, 18 м<sup><small>2</small></sup>	1977	1517510549914	\N	1	\N	0	0	commercial	1765	\N
1978	Торговое помещение	1978	1517510591708	\N	1	\N	0	0	commercial	1784	\N
2119	Дом 80 м<sup><small>2</small></sup> на участке 15 сот. 	2119	1517551327374	\N	1	\N	0	0	cottages	1595	\N
2233	Дачи на участке 6 сот. 	2233	1517572390303	\N	1	\N	0	0	cottages	1750	\N
2510	Дом 66 м<sup><small>2</small></sup> на участке 25 сот. 	2510	1517590000184	\N	1	\N	0	0	cottages	1595	\N
3499	4-комнатные, 71 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3499	1518001009840	\N	1	\N	0	0	apartment	64	\N
2511	Дом 65 м<sup><small>2</small></sup> на участке 25 сот. 	2511	1517590035167	\N	1	\N	0	0	cottages	1595	\N
2565	Коттедж	2565	1517595723097	\N	1	\N	0	0	cottages	1596	\N
2566	Коттедж	2566	1517595747103	\N	1	\N	0	0	cottages	1596	\N
2567	Коттедж 312 м<sup><small>2</small></sup> на участке 32 сот. 	2567	1517595771095	\N	1	\N	0	0	cottages	1596	\N
2797	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2797	1517641825575	\N	1	\N	0	0	apartment	62	\N
2798	2-комнатные, 51 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2798	1517641843861	\N	1	\N	0	0	apartment	62	\N
2799	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2799	1517641861307	\N	1	\N	0	0	apartment	62	\N
2894	Дом 100 м<sup><small>2</small></sup> на участке 12 сот. 	2894	1517665300359	\N	1	\N	0	0	cottages	1595	\N
2895	Дом на участке 21 сот. 	2895	1517665342460	\N	1	\N	0	0	cottages	1595	\N
2962	Земля на участке 31 сот. 	2962	1517677460818	\N	1	\N	0	0	cottages	1743	\N
3047	Дача	3047	1517687662500	\N	1	\N	0	0	cottages	1750	\N
3154	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3154	1517756221211	\N	1	\N	0	0	apartment	62	\N
3257	Дом	3257	1517843246009	\N	1	\N	0	0	cottages	1595	\N
3314	Дача 20 м<sup><small>2</small></sup> на участке 10 сот. 	3314	1517855126904	\N	1	\N	0	0	cottages	1750	\N
3353	Дом 60 м<sup><small>2</small></sup> на участке 21 сот. 	3353	1517892534035	\N	1	\N	0	0	cottages	1595	\N
3403	1-комнатные, 30 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3403	1517998835900	\N	1	\N	0	0	apartment	61	\N
3404	1-комнатные, 36 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3404	1517998852682	\N	1	\N	0	0	apartment	61	\N
3405	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3405	1517998862605	\N	1	\N	0	0	apartment	61	\N
3500	4-комнатные, 189 м<sup><small>2</small></sup>, 6/12 - этаж/этажей	3500	1518001028338	\N	1	\N	0	0	apartment	64	\N
3501	4-комнатные, 84 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3501	1518001044648	\N	1	\N	0	0	apartment	64	\N
3502	4-комнатные, 179 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3502	1518001067076	\N	1	\N	0	0	apartment	64	\N
3503	4-комнатные, 110 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3503	1518001079359	\N	1	\N	0	0	apartment	64	\N
3504	4-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3504	1518001095368	\N	1	\N	0	0	apartment	64	\N
3530	3-комнатные, 65 м<sup><small>2</small></sup>, 6/6 - этаж/этажей	3530	1518002186830	\N	1	\N	0	0	apartment	63	\N
3531	3-комнатные,  м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3531	1518002216682	\N	1	\N	0	0	apartment	63	\N
3532	3-комнатные, 68 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3532	1518002238008	\N	1	\N	0	0	apartment	63	\N
3533	3-комнатные, 64 м<sup><small>2</small></sup>, 2/10 - этаж/этажей	3533	1518002267869	\N	1	\N	0	0	apartment	63	\N
3534	3-комнатные, 59 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3534	1518002288647	\N	1	\N	0	0	apartment	63	\N
3535	3-комнатные, 65 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	3535	1518002312313	\N	1	\N	0	0	apartment	63	\N
3555	1-комнатные, 40 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	3555	1518002697405	\N	1	\N	0	0	apartment	61	\N
3557	1-комнатные, 72 м<sup><small>2</small></sup>, 12/12 - этаж/этажей	3557	1518002819090	\N	1	\N	0	0	apartment	61	\N
3558	3-комнатные, 90 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3558	1518002935057	\N	1	\N	0	0	apartment	63	\N
3559	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3559	1518002947513	\N	1	\N	0	0	apartment	63	\N
3560	3-комнатные, 65 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	3560	1518002961726	\N	1	\N	0	0	apartment	63	\N
3561	3-комнатные, 60 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3561	1518002972224	\N	1	\N	0	0	apartment	63	\N
3562	3-комнатные,  м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3562	1518002989885	\N	1	\N	0	0	apartment	63	\N
3563	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3563	1518003010313	\N	1	\N	0	0	apartment	63	\N
1785	Гостиница, 400 м<sup><small>2</small></sup>	1785	1517502907709	\N	1	\N	0	0	commercial	1764	\N
1868	Комнаты, 16 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	1868	1517506007158	\N	1	\N	0	0	apartment	60	\N
1869	Комнаты, 18 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1869	1517506021920	\N	1	\N	0	0	apartment	60	\N
1871	Комнаты, 16 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1871	1517506033394	\N	1	\N	0	0	apartment	60	\N
1872	Комнаты, 11 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1872	1517506057089	\N	1	\N	0	0	apartment	60	\N
1979	Гараж, 27 м<sup><small>2</small></sup>	1979	1517510684929	\N	1	\N	0	0	commercial	1765	\N
2120	Дом 36 м<sup><small>2</small></sup> на участке 42 сот. 	2120	1517551528367	\N	1	\N	0	0	cottages	1595	\N
2234	Дачи 42 м<sup><small>2</small></sup> на участке 10 сот. 	2234	1517572475303	\N	1	\N	0	0	cottages	1750	\N
2512	Дом на участке 33 сот. 	2512	1517590230187	\N	1	\N	0	0	cottages	1595	\N
2568	Земля на участке 20 сот. 	2568	1517595875115	\N	1	\N	0	0	cottages	1743	\N
2569	Дом на участке 6 сот. 	2569	1517595967102	\N	1	\N	0	0	cottages	1595	\N
2800	2-комнатные, 48 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2800	1517641897356	\N	1	\N	0	0	apartment	62	\N
2801	2-комнатные, 46 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2801	1517641925739	\N	1	\N	0	0	apartment	62	\N
2896	Дом 40 м<sup><small>2</small></sup> на участке 8 сот. 	2896	1517665706746	\N	1	\N	0	0	cottages	1595	\N
2897	Дом 36 м<sup><small>2</small></sup> на участке 10 сот. 	2897	1517665747680	\N	1	\N	0	0	cottages	1595	\N
2963	Дача на участке 5 сот. 	2963	1517678242799	\N	1	\N	0	0	cottages	1750	\N
3048	Земля	3048	1517687816383	\N	1	\N	0	0	cottages	1743	\N
3155	2-комнатные,  м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3155	1517756257591	\N	1	\N	0	0	apartment	62	\N
3156	2-комнатные,  м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3156	1517756276317	\N	1	\N	0	0	apartment	62	\N
3157	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3157	1517756305484	\N	1	\N	0	0	apartment	62	\N
3158	2-комнатные, 47.4 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3158	1517756320147	\N	1	\N	0	0	apartment	62	\N
3159	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3159	1517756334991	\N	1	\N	0	0	apartment	62	\N
3160	2-комнатные, 40 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3160	1517756349534	\N	1	\N	0	0	apartment	62	\N
3161	2-комнатные, 39 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3161	1517756381093	\N	1	\N	0	0	apartment	62	\N
3162	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3162	1517756397086	\N	1	\N	0	0	apartment	62	\N
3163	2-комнатные, 51 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3163	1517756410984	\N	1	\N	0	0	apartment	62	\N
3164	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3164	1517756448448	\N	1	\N	0	0	apartment	62	\N
3165	2-комнатные, 48 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3165	1517756465560	\N	1	\N	0	0	apartment	62	\N
3166	2-комнатные, 41 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3166	1517756497947	\N	1	\N	0	0	apartment	62	\N
3167	2-комнатные, 42 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3167	1517756512414	\N	1	\N	0	0	apartment	62	\N
3168	2-комнатные, 48 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3168	1517756527580	\N	1	\N	0	0	apartment	62	\N
3169	2-комнатные, 42 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3169	1517756561691	\N	1	\N	0	0	apartment	62	\N
3170	2-комнатные, 43.5 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3170	1517756586013	\N	1	\N	0	0	apartment	62	\N
3171	2-комнатные, 44 м<sup><small>2</small></sup>, 3/3 - этаж/этажей	3171	1517756600724	\N	1	\N	0	0	apartment	62	\N
3172	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3172	1517756620285	\N	1	\N	0	0	apartment	62	\N
3259	Земля на участке 15 сот. 	3259	1517843282762	\N	1	\N	0	0	cottages	1743	\N
3260	Дача на участке 4 сот. 	3260	1517843342444	\N	1	\N	0	0	cottages	1750	\N
3261	Дом	3261	1517843366108	\N	1	\N	0	0	cottages	1595	\N
3262	Дача на участке 4 сот. 	3262	1517843407266	\N	1	\N	0	0	cottages	1750	\N
3263	Дача	3263	1517843430231	\N	1	\N	0	0	cottages	1750	\N
3264	Земля на участке 15 сот. 	3264	1517843452780	\N	1	\N	0	0	cottages	1743	\N
3265	Дача на участке 5 сот. 	3265	1517843483539	\N	1	\N	0	0	cottages	1750	\N
3266	Дача на участке 10 сот. 	3266	1517843511861	\N	1	\N	0	0	cottages	1750	\N
3267	Дача	3267	1517843531950	\N	1	\N	0	0	cottages	1750	\N
3268	Дача на участке 4 сот. 	3268	1517843562055	\N	1	\N	0	0	cottages	1750	\N
3269	Дача на участке 6 сот. 	3269	1517843596092	\N	1	\N	0	0	cottages	1750	\N
3270	Дом	3270	1517843630286	\N	1	\N	0	0	cottages	1595	\N
3271	Дача	3271	1517843672854	\N	1	\N	0	0	cottages	1750	\N
3315	Дом на участке 4.3 сот. 	3315	1517855169729	\N	1	\N	0	0	cottages	1595	\N
3354	Дом на участке 30 сот. 	3354	1517892612246	\N	1	\N	0	0	cottages	1595	\N
3852	Земля на участке 10 сот. 	3852	1518056678765	\N	1	\N	0	0	cottages	1743	\N
1786	Торговое помещение, 33 м<sup><small>2</small></sup>	1786	1517503040731	\N	1	\N	0	0	commercial	1784	\N
1787	Гостиница, 18 м<sup><small>2</small></sup>	1787	1517503058712	\N	1	\N	0	0	commercial	1764	\N
1870	Гостиница, 145 м<sup><small>2</small></sup>	1870	1517506022685	\N	1	\N	0	0	commercial	1764	\N
1980	Гараж, 18 м<sup><small>2</small></sup>	1980	1517510728688	\N	1	\N	0	0	commercial	1765	\N
1981	Гараж, 18 м<sup><small>2</small></sup>	1981	1517510767675	\N	1	\N	0	0	commercial	1765	\N
1982	Гараж, 120 м<sup><small>2</small></sup>	1982	1517510823920	\N	1	\N	0	0	commercial	1765	\N
2121	Коттедж 250 м<sup><small>2</small></sup> на участке 25 сот. 	2121	1517551850384	\N	1	\N	0	0	cottages	1596	\N
2235	Дачи	2235	1517572741308	\N	1	\N	0	0	cottages	1750	\N
2513	Дом 110 м<sup><small>2</small></sup> на участке 5 сот. 	2513	1517590448183	\N	1	\N	0	0	cottages	1595	\N
2570	Дом 150 м<sup><small>2</small></sup>	2570	1517596007114	\N	1	\N	0	0	cottages	1595	\N
2802	2-комнатные,  м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2802	1517641962310	\N	1	\N	0	0	apartment	62	\N
2803	2-комнатные, 70 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2803	1517641984588	\N	1	\N	0	0	apartment	62	\N
2804	2-комнатные, 49 м<sup><small>2</small></sup>, 11/12 - этаж/этажей	2804	1517642001035	\N	1	\N	0	0	apartment	62	\N
2805	2-комнатные, 48 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2805	1517642025617	\N	1	\N	0	0	apartment	62	\N
2806	2-комнатные, 46 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2806	1517642040537	\N	1	\N	0	0	apartment	62	\N
2807	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2807	1517642063864	\N	1	\N	0	0	apartment	62	\N
2808	2-комнатные, 39 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2808	1517642077609	\N	1	\N	0	0	apartment	62	\N
2809	2-комнатные, 40 м<sup><small>2</small></sup>, 5/12 - этаж/этажей	2809	1517642092369	\N	1	\N	0	0	apartment	62	\N
2810	2-комнатные, 53 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2810	1517642102228	\N	1	\N	0	0	apartment	62	\N
2811	2-комнатные, 58 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2811	1517642120604	\N	1	\N	0	0	apartment	62	\N
2812	2-комнатные, 62 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2812	1517642138810	\N	1	\N	0	0	apartment	62	\N
2813	2-комнатные, 57 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2813	1517642157334	\N	1	\N	0	0	apartment	62	\N
2814	2-комнатные, 57.3 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	2814	1517642178502	\N	1	\N	0	0	apartment	62	\N
2815	2-комнатные, 64 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	2815	1517642196126	\N	1	\N	0	0	apartment	62	\N
2816	2-комнатные, 48 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2816	1517642214681	\N	1	\N	0	0	apartment	62	\N
2817	2-комнатные, 48 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2817	1517642230759	\N	1	\N	0	0	apartment	62	\N
2818	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2818	1517642253214	\N	1	\N	0	0	apartment	62	\N
2898	Дом 63 м<sup><small>2</small></sup> на участке 16 сот. 	2898	1517665784244	\N	1	\N	0	0	cottages	1595	\N
2964	Земля на участке 8 сот. 	2964	1517680177731	\N	1	\N	0	0	cottages	1743	\N
3049	Земля на участке 13.5 сот. 	3049	1517687936716	\N	1	\N	0	0	cottages	1743	\N
3050	Земля	3050	1517687971920	\N	1	\N	0	0	cottages	1743	\N
3051	Земля на участке 15 сот. 	3051	1517688008995	\N	1	\N	0	0	cottages	1743	\N
3052	Земля на участке 10 сот. 	3052	1517688057228	\N	1	\N	0	0	cottages	1743	\N
3173	2-комнатные,  м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3173	1517756663222	\N	1	\N	0	0	apartment	62	\N
3174	2-комнатные, 45 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3174	1517756678609	\N	1	\N	0	0	apartment	62	\N
3175	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3175	1517756698402	\N	1	\N	0	0	apartment	62	\N
3176	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3176	1517756724392	\N	1	\N	0	0	apartment	62	\N
3177	1-комнатные, 41 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3177	1517756781163	\N	1	\N	0	0	apartment	61	\N
3178	2-комнатные, 42 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3178	1517756799750	\N	1	\N	0	0	apartment	62	\N
3179	2-комнатные, 50 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3179	1517756811362	\N	1	\N	0	0	apartment	62	\N
3180	2-комнатные, 50 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3180	1517756834833	\N	1	\N	0	0	apartment	62	\N
3181	3-комнатные, 52 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3181	1517756875504	\N	1	\N	0	0	apartment	63	\N
3182	1-комнатные, 31 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3182	1517756922677	\N	1	\N	0	0	apartment	61	\N
3183	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3183	1517756941712	\N	1	\N	0	0	apartment	61	\N
3184	2-комнатные,  м<sup><small>2</small></sup>, 1/3 - этаж/этажей	3184	1517756962774	\N	1	\N	0	0	apartment	62	\N
3185	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3185	1517756981071	\N	1	\N	0	0	apartment	62	\N
3186	2-комнатные, 48 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3186	1517756999604	\N	1	\N	0	0	apartment	62	\N
1788	Помещение общественного питания	pomeshchenie-obshchestvennogo-pitaniya	1517503206757	\N	1	\N	1	0	section	\N	1788
1873	Помещение общественного питания, 400 м<sup><small>2</small></sup>	1873	1517506073686	\N	1	\N	0	0	commercial	1788	\N
1983	Гараж, 18 м<sup><small>2</small></sup>	1983	1517510956699	\N	1	\N	0	0	commercial	1765	\N
2122	Коттедж 250 м<sup><small>2</small></sup>	2122	1517551905403	\N	1	\N	0	0	cottages	1596	\N
2236	Земля на участке 24 сот. 	2236	1517576108285	\N	1	\N	0	0	cottages	1743	\N
2514	Дом 60 м<sup><small>2</small></sup> на участке 8 сот. 	2514	1517590495182	\N	1	\N	0	0	cottages	1595	\N
2571	Дом 62.2 м<sup><small>2</small></sup> на участке 9 сот. 	2571	1517596046113	\N	1	\N	0	0	cottages	1595	\N
2572	Земля на участке 28 сот. 	2572	1517596153114	\N	1	\N	0	0	cottages	1743	\N
2573	Коттедж 120 м<sup><small>2</small></sup> на участке 47 сот. 	2573	1517596222104	\N	1	\N	0	0	cottages	1596	\N
2574	Коттедж 200 м<sup><small>2</small></sup> на участке 20 сот. 	2574	1517596271106	\N	1	\N	0	0	cottages	1596	\N
2819	2-комнатные, 48 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2819	1517642303254	\N	1	\N	0	0	apartment	62	\N
2820	2-комнатные, 54 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2820	1517642326909	\N	1	\N	0	0	apartment	62	\N
2821	2-комнатные, 48 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2821	1517642342254	\N	1	\N	0	0	apartment	62	\N
2822	2-комнатные, 42 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2822	1517642359265	\N	1	\N	0	0	apartment	62	\N
2823	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2823	1517642374345	\N	1	\N	0	0	apartment	62	\N
2824	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2824	1517642386098	\N	1	\N	0	0	apartment	62	\N
2825	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2825	1517642422807	\N	1	\N	0	0	apartment	62	\N
2826	2-комнатные, 45 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2826	1517642451101	\N	1	\N	0	0	apartment	62	\N
2827	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2827	1517642465408	\N	1	\N	0	0	apartment	62	\N
2828	1-комнатные, 35 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2828	1517642525618	\N	1	\N	0	0	apartment	61	\N
2829	1-комнатные, 30 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2829	1517642541388	\N	1	\N	0	0	apartment	61	\N
2830	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2830	1517642556913	\N	1	\N	0	0	apartment	61	\N
2831	1-комнатные, 35 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2831	1517642578041	\N	1	\N	0	0	apartment	61	\N
2832	1-комнатные,  м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2832	1517642628677	\N	1	\N	0	0	apartment	61	\N
2833	2-комнатные, 54 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2833	1517642661764	\N	1	\N	0	0	apartment	62	\N
2834	2-комнатные, 62 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2834	1517642675806	\N	1	\N	0	0	apartment	62	\N
2835	2-комнатные, 67 м<sup><small>2</small></sup>, 12/12 - этаж/этажей	2835	1517642707522	\N	1	\N	0	0	apartment	62	\N
2836	2-комнатные, 59 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2836	1517642719296	\N	1	\N	0	0	apartment	62	\N
2837	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2837	1517642737465	\N	1	\N	0	0	apartment	62	\N
2838	2-комнатные,  м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2838	1517642753174	\N	1	\N	0	0	apartment	62	\N
2839	2-комнатные, 46 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2839	1517642765692	\N	1	\N	0	0	apartment	62	\N
2840	2-комнатные, 43 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2840	1517642780871	\N	1	\N	0	0	apartment	62	\N
2841	2-комнатные, 43 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2841	1517642801431	\N	1	\N	0	0	apartment	62	\N
2842	2-комнатные, 52 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2842	1517642820473	\N	1	\N	0	0	apartment	62	\N
2843	2-комнатные, 56 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2843	1517642835923	\N	1	\N	0	0	apartment	62	\N
2899	Дом 60 м<sup><small>2</small></sup> на участке 30 сот. 	2899	1517665966441	\N	1	\N	0	0	cottages	1595	\N
2900	Дом 31 м<sup><small>2</small></sup> на участке 20 сот. 	2900	1517666016458	\N	1	\N	0	0	cottages	1595	\N
2901	Дом 80 м<sup><small>2</small></sup> на участке 17 сот. 	2901	1517666061480	\N	1	\N	0	0	cottages	1595	\N
2965	Земля на участке 15 сот. 	2965	1517680260027	\N	1	\N	0	0	cottages	1743	\N
3053	Дача	3053	1517722706613	\N	1	\N	0	0	cottages	1750	\N
3054	Земля на участке 15 сот. 	3054	1517722737247	\N	1	\N	0	0	cottages	1743	\N
3187	3-комнатные, 61 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3187	1517757027546	\N	1	\N	0	0	apartment	63	\N
3188	3-комнатные, 57 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3188	1517757048658	\N	1	\N	0	0	apartment	63	\N
3189	3-комнатные, 62 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3189	1517757079877	\N	1	\N	0	0	apartment	63	\N
3190	3-комнатные, 60 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3190	1517757103322	\N	1	\N	0	0	apartment	63	\N
3272	Дача на участке 7 сот. 	3272	1517843714574	\N	1	\N	0	0	cottages	1750	\N
1789	Гостиница	1789	1517503251714	\N	1	\N	0	0	commercial	1764	\N
1790	ПСН, 6250 м<sup><small>2</small></sup>	1790	1517503285718	\N	1	\N	0	0	commercial	1779	\N
1874	Офисное помещение, 43 м<sup><small>2</small></sup>	1874	1517506153686	\N	1	\N	0	0	commercial	1843	\N
1984	ПСН	1984	1517511297923	\N	1	\N	0	0	commercial	1779	\N
2123	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2123	1517554237256	\N	1	\N	0	0	apartment	61	\N
2124	1-комнатные, 29 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2124	1517554274429	\N	1	\N	0	0	apartment	61	\N
2125	1-комнатные, 35 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2125	1517554302551	\N	1	\N	0	0	apartment	61	\N
2126	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2126	1517554345238	\N	1	\N	0	0	apartment	61	\N
2127	1-комнатные, 40 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2127	1517554368162	\N	1	\N	0	0	apartment	61	\N
2128	1-комнатные, 35 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2128	1517554432880	\N	1	\N	0	0	apartment	61	\N
2129	1-комнатные, 15 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2129	1517554465033	\N	1	\N	0	0	apartment	61	\N
2130	1-комнатные, 40 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2130	1517554486815	\N	1	\N	0	0	apartment	61	\N
2131	1-комнатные, 33 м<sup><small>2</small></sup>, 2/10 - этаж/этажей	2131	1517554512666	\N	1	\N	0	0	apartment	61	\N
2132	1-комнатные, 17 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2132	1517554535175	\N	1	\N	0	0	apartment	61	\N
2133	1-комнатные, 32 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2133	1517554546099	\N	1	\N	0	0	apartment	61	\N
2134	1-комнатные,  м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2134	1517554569278	\N	1	\N	0	0	apartment	61	\N
2237	Земля на участке 14 сот. 	2237	1517576273368	\N	1	\N	0	0	cottages	1743	\N
2515	Дом 100 м<sup><small>2</small></sup> на участке 27 сот. 	2515	1517590588176	\N	1	\N	0	0	cottages	1595	\N
2516	Дом 65 м<sup><small>2</small></sup>	2516	1517590624177	\N	1	\N	0	0	cottages	1595	\N
2575	Дом 73 м<sup><small>2</small></sup> на участке 10 сот. 	2575	1517596331124	\N	1	\N	0	0	cottages	1595	\N
2576	Дом 91 м<sup><small>2</small></sup> на участке 20 сот. 	2576	1517596367104	\N	1	\N	0	0	cottages	1595	\N
2577	Земля на участке 20 сот. 	2577	1517596407107	\N	1	\N	0	0	cottages	1743	\N
2844	2-комнатные, 48 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2844	1517642878089	\N	1	\N	0	0	apartment	62	\N
2845	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2845	1517642893901	\N	1	\N	0	0	apartment	62	\N
2846	2-комнатные, 45 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2846	1517642905187	\N	1	\N	0	0	apartment	62	\N
2847	2-комнатные, 48 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2847	1517642916450	\N	1	\N	0	0	apartment	62	\N
2848	2-комнатные,  м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2848	1517642927689	\N	1	\N	0	0	apartment	62	\N
2849	2-комнатные,  м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2849	1517642942412	\N	1	\N	0	0	apartment	62	\N
2850	2-комнатные, 54 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2850	1517642960492	\N	1	\N	0	0	apartment	62	\N
2851	2-комнатные, 48 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2851	1517642990977	\N	1	\N	0	0	apartment	62	\N
2902	Дом 86 м<sup><small>2</small></sup> на участке 16 сот. 	2902	1517666083925	\N	1	\N	0	0	cottages	1595	\N
2903	Дом на участке 20 сот. 	2903	1517666117803	\N	1	\N	0	0	cottages	1595	\N
2904	Дом 100 м<sup><small>2</small></sup> на участке 17 сот. 	2904	1517666160243	\N	1	\N	0	0	cottages	1595	\N
3057	Земля	3057	1517723554232	\N	1	\N	0	0	cottages	1743	\N
2905	Дом 90 м<sup><small>2</small></sup> на участке 25 сот. 	2905	1517666200011	\N	1	\N	0	0	cottages	1595	\N
2966	Земля на участке 30 сот. 	2966	1517680324703	\N	1	\N	0	0	cottages	1743	\N
3055	Дача на участке 4 сот. 	3055	1517723487603	\N	1	\N	0	0	cottages	1750	\N
3056	Земля на участке 8 сот. 	3056	1517723516514	\N	1	\N	0	0	cottages	1743	\N
3058	Дача на участке 4 сот. 	3058	1517723611222	\N	1	\N	0	0	cottages	1750	\N
3059	Дача 60 м<sup><small>2</small></sup> на участке 8 сот. 	3059	1517723643124	\N	1	\N	0	0	cottages	1750	\N
3060	Земля на участке 11 сот. 	3060	1517723671361	\N	1	\N	0	0	cottages	1743	\N
3061	Земля на участке 8 сот. 	3061	1517723687578	\N	1	\N	0	0	cottages	1743	\N
3062	Дача на участке 11.7 сот. 	3062	1517723705263	\N	1	\N	0	0	cottages	1750	\N
3063	Земля на участке 6 сот. 	3063	1517723739903	\N	1	\N	0	0	cottages	1743	\N
3191	2-комнатные, 45 м<sup><small>2</small></sup>, 2/3 - этаж/этажей	3191	1517757159130	\N	1	\N	0	0	apartment	62	\N
3192	3-комнатные, 60 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3192	1517757193460	\N	1	\N	0	0	apartment	63	\N
3193	3-комнатные, 60 м<sup><small>2</small></sup>, 3/3 - этаж/этажей	3193	1517757260010	\N	1	\N	0	0	apartment	63	\N
3194	4-комнатные, 74 м<sup><small>2</small></sup>, 1/3 - этаж/этажей	3194	1517757283227	\N	1	\N	0	0	apartment	64	\N
3273	Дача на участке 4 сот. 	3273	1517843741262	\N	1	\N	0	0	cottages	1750	\N
3274	Дача	3274	1517843753490	\N	1	\N	0	0	cottages	1750	\N
1791	Гараж, 25 м<sup><small>2</small></sup>	1791	1517503350721	\N	1	\N	0	0	commercial	1765	\N
1875	Гостиница	1875	1517506200684	\N	1	\N	0	0	commercial	1764	\N
1985	Гостиница, 220 м<sup><small>2</small></sup>	1985	1517511418715	\N	1	\N	0	0	commercial	1764	\N
2135	1-комнатные, 36 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2135	1517554581944	\N	1	\N	0	0	apartment	61	\N
2136	1-комнатные, 30 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2136	1517554607110	\N	1	\N	0	0	apartment	61	\N
2137	1-комнатные, 32 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2137	1517554624092	\N	1	\N	0	0	apartment	61	\N
2138	1-комнатные, 31 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2138	1517554647056	\N	1	\N	0	0	apartment	61	\N
2139	1-комнатные, 30 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2139	1517554683423	\N	1	\N	0	0	apartment	61	\N
2140	1-комнатные, 31 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2140	1517554710051	\N	1	\N	0	0	apartment	61	\N
2141	1-комнатные, 40 м<sup><small>2</small></sup>, 4/10 - этаж/этажей	2141	1517554732697	\N	1	\N	0	0	apartment	61	\N
2142	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2142	1517554790622	\N	1	\N	0	0	apartment	61	\N
2143	1-комнатные, 40 м<sup><small>2</small></sup>, 11/14 - этаж/этажей	2143	1517554826821	\N	1	\N	0	0	apartment	61	\N
2144	1-комнатные, 33 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2144	1517554851486	\N	1	\N	0	0	apartment	61	\N
2145	1-комнатные, 40.3 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2145	1517554869624	\N	1	\N	0	0	apartment	61	\N
2146	1-комнатные, 40 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2146	1517554890629	\N	1	\N	0	0	apartment	61	\N
2147	1-комнатные, 33 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2147	1517554901829	\N	1	\N	0	0	apartment	61	\N
2148	1-комнатные, 39 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2148	1517554923752	\N	1	\N	0	0	apartment	61	\N
2149	1-комнатные, 34 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2149	1517554934206	\N	1	\N	0	0	apartment	61	\N
2150	1-комнатные, 33 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2150	1517554978784	\N	1	\N	0	0	apartment	61	\N
2238	Дача на участке 4 сот. 	2238	1517576479206	\N	1	\N	0	0	cottages	1750	\N
2517	Дом на участке 25 сот. 	2517	1517590673189	\N	1	\N	0	0	cottages	1595	\N
2578	Земля 91 м<sup><small>2</small></sup> на участке 20 сот. 	2578	1517596497343	\N	1	\N	0	0	cottages	1743	\N
2852	Гараж, 26 м<sup><small>2</small></sup>	2852	1517643205925	\N	1	\N	0	0	commercial	1765	\N
2906	Дом 70 м<sup><small>2</small></sup>	2906	1517666390192	\N	1	\N	0	0	cottages	1595	\N
2967	Земля на участке 15 сот. 	2967	1517680475087	\N	1	\N	0	0	cottages	1743	\N
3064	Дача на участке 9 сот. 	3064	1517723796666	\N	1	\N	0	0	cottages	1750	\N
3065	Земля на участке 9 сот. 	3065	1517723826041	\N	1	\N	0	0	cottages	1743	\N
3066	Земля на участке 4 сот. 	3066	1517723865773	\N	1	\N	0	0	cottages	1743	\N
3067	Земля на участке 4.4 сот. 	3067	1517723895339	\N	1	\N	0	0	cottages	1743	\N
3068	Дача 110 м<sup><small>2</small></sup> на участке 5 сот. 	3068	1517723930044	\N	1	\N	0	0	cottages	1750	\N
3069	Дача на участке 12 сот. 	3069	1517723964003	\N	1	\N	0	0	cottages	1750	\N
3070	Дача на участке 5 сот. 	3070	1517723997070	\N	1	\N	0	0	cottages	1750	\N
3195	1-комнатные, 48 м<sup><small>2</small></sup>, 10/16 - этаж/этажей	3195	1517757392822	\N	1	\N	0	0	apartment	61	\N
3275	Земля на участке 5 сот. 	3275	1517843768785	\N	1	\N	0	0	cottages	1743	\N
3276	Дача на участке 8 сот. 	3276	1517843813977	\N	1	\N	0	0	cottages	1750	\N
3277	Дача на участке 8 сот. 	3277	1517843873623	\N	1	\N	0	0	cottages	1750	\N
3316	Дача 150 м<sup><small>2</small></sup> на участке 12 сот. 	3316	1517855224156	\N	1	\N	0	0	cottages	1750	\N
3355	Земля на участке 51 сот. 	3355	1517892787585	\N	1	\N	0	0	cottages	1743	\N
3406	1-комнатные, 66 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3406	1517998936377	\N	1	\N	0	0	apartment	61	\N
3407	1-комнатные, 46 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3407	1517998962907	\N	1	\N	0	0	apartment	61	\N
3408	1-комнатные, 30 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3408	1517998991466	\N	1	\N	0	0	apartment	61	\N
3409	1-комнатные, 29 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3409	1517999016752	\N	1	\N	0	0	apartment	61	\N
3410	1-комнатные, 33.2 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3410	1517999040309	\N	1	\N	0	0	apartment	61	\N
3411	1-комнатные, 46 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	3411	1517999065546	\N	1	\N	0	0	apartment	61	\N
3412	1-комнатные, 56 м<sup><small>2</small></sup>, 4/10 - этаж/этажей	3412	1517999084126	\N	1	\N	0	0	apartment	61	\N
3413	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3413	1517999108351	\N	1	\N	0	0	apartment	61	\N
3414	1-комнатные,  м<sup><small>2</small></sup>, 11/12 - этаж/этажей	3414	1517999125932	\N	1	\N	0	0	apartment	61	\N
3415	1-комнатные,  м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3415	1517999157468	\N	1	\N	0	0	apartment	61	\N
1792	Комнаты, 12 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1792	1517503502041	\N	1	\N	0	0	apartment	60	\N
1793	Комнаты, 33 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1793	1517503531322	\N	1	\N	0	0	apartment	60	\N
3278	Земля на участке 12 сот. 	3278	1517844143805	\N	1	\N	0	0	cottages	1743	\N
1876	Производственное помещение	proizvodstvennoe-pomeshchenie	1517506255957	\N	1	\N	1	0	section	\N	1876
1986	Гостиница, 170 м<sup><small>2</small></sup>	1986	1517511918628	\N	1	\N	0	0	commercial	1764	\N
1987	Складское помещение, 900 м<sup><small>2</small></sup>	1987	1517511966742	\N	1	\N	0	0	commercial	1893	\N
2151	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2151	1517555019693	\N	1	\N	0	0	apartment	61	\N
2152	1-комнатные, 30 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2152	1517555039062	\N	1	\N	0	0	apartment	61	\N
2153	1-комнатные, 35 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2153	1517555061934	\N	1	\N	0	0	apartment	61	\N
2239	Дача на участке 4 сот. 	2239	1517576556209	\N	1	\N	0	0	cottages	1750	\N
2240	Дом	2240	1517576635583	\N	1	\N	0	0	cottages	1595	\N
2241	Земля на участке 15 сот. 	2241	1517576674203	\N	1	\N	0	0	cottages	1743	\N
2242	Дом 75 м<sup><small>2</small></sup>	2242	1517576735199	\N	1	\N	0	0	cottages	1595	\N
2518	Дом	2518	1517590815182	\N	1	\N	0	0	cottages	1595	\N
2579	3-комнатные, 72 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2579	1517596541373	\N	1	\N	0	0	apartment	63	\N
2580	3-комнатные, 115 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2580	1517596566565	\N	1	\N	0	0	apartment	63	\N
2581	3-комнатные, 120 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2581	1517596576588	\N	1	\N	0	0	apartment	63	\N
2582	3-комнатные, 65 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2582	1517596594919	\N	1	\N	0	0	apartment	63	\N
2583	3-комнатные, 69 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2583	1517596606684	\N	1	\N	0	0	apartment	63	\N
2584	2-комнатные, 43 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2584	1517596642689	\N	1	\N	0	0	apartment	62	\N
2585	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2585	1517596659958	\N	1	\N	0	0	apartment	62	\N
2586	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2586	1517596670945	\N	1	\N	0	0	apartment	62	\N
2587	3-комнатные, 56 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2587	1517596682779	\N	1	\N	0	0	apartment	63	\N
2588	3-комнатные, 56 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2588	1517596694136	\N	1	\N	0	0	apartment	63	\N
2589	3-комнатные, 70 м<sup><small>2</small></sup>, 5/7 - этаж/этажей	2589	1517596742157	\N	1	\N	0	0	apartment	63	\N
2590	3-комнатные, 67 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2590	1517596772264	\N	1	\N	0	0	apartment	63	\N
2591	3-комнатные, 64.9 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2591	1517596791378	\N	1	\N	0	0	apartment	63	\N
2592	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2592	1517596817355	\N	1	\N	0	0	apartment	63	\N
2594	3-комнатные, 60 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2594	1517596842452	\N	1	\N	0	0	apartment	63	\N
2595	3-комнатные, 60 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2595	1517596859486	\N	1	\N	0	0	apartment	63	\N
2853	Гараж	2853	1517643404213	\N	1	\N	0	0	commercial	1765	\N
2907	Коттедж 83.6 м<sup><small>2</small></sup> на участке 40 сот. 	2907	1517666445597	\N	1	\N	0	0	cottages	1596	\N
2968	Дача	2968	1517681224757	\N	1	\N	0	0	cottages	1750	\N
3071	Дача на участке 4 сот. 	3071	1517724057366	\N	1	\N	0	0	cottages	1750	\N
3072	Дача	3072	1517724091578	\N	1	\N	0	0	cottages	1750	\N
3073	Дача	3073	1517724134345	\N	1	\N	0	0	cottages	1750	\N
3196	2-комнатные, 41.3 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3196	1517757498866	\N	1	\N	0	0	apartment	62	\N
3197	3-комнатные, 60 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3197	1517757533662	\N	1	\N	0	0	apartment	63	\N
3198	3-комнатные, 48 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3198	1517757576862	\N	1	\N	0	0	apartment	63	\N
1794	Комнаты, 13 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	1794	1517503561139	1517841031212	1	1	0	0	apartment	60	\N
3317	Земля на участке 13 сот. 	3317	1517855316040	\N	1	\N	0	0	cottages	1743	\N
3318	Земля на участке 20 сот. 	3318	1517855349813	\N	1	\N	0	0	cottages	1743	\N
3356	Земля на участке 19 сот. 	3356	1517893289547	\N	1	\N	0	0	cottages	1743	\N
3357	Земля	3357	1517893314814	\N	1	\N	0	0	cottages	1743	\N
3416	1-комнатные,  м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3416	1517999199735	\N	1	\N	0	0	apartment	61	\N
3417	1-комнатные, 36 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3417	1517999208444	\N	1	\N	0	0	apartment	61	\N
3418	1-комнатные, 33 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	3418	1517999219126	\N	1	\N	0	0	apartment	61	\N
3419	1-комнатные, 29 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3419	1517999240761	\N	1	\N	0	0	apartment	61	\N
1795	Комнаты, 18 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1795	1517503612418	\N	1	\N	0	0	apartment	60	\N
1796	Комнаты, 18 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1796	1517503648538	\N	1	\N	0	0	apartment	60	\N
1798	Комнаты, 13 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1798	1517503673671	\N	1	\N	0	0	apartment	60	\N
1877	Комнаты, 11 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1877	1517506278220	\N	1	\N	0	0	apartment	60	\N
1878	Комнаты, 18 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	1878	1517506292477	\N	1	\N	0	0	apartment	60	\N
1988	Изолированные малосемейки, 40 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	1988	1517516516877	\N	1	\N	0	0	apartment	80	\N
2154	1-комнатные, 70 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2154	1517555097236	\N	1	\N	0	0	apartment	61	\N
2155	1-комнатные, 37 м<sup><small>2</small></sup>, 9/12 - этаж/этажей	2155	1517555118241	\N	1	\N	0	0	apartment	61	\N
2156	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2156	1517555147789	\N	1	\N	0	0	apartment	61	\N
2157	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2157	1517555167531	\N	1	\N	0	0	apartment	61	\N
2158	1-комнатные, 33 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2158	1517555193884	\N	1	\N	0	0	apartment	61	\N
2159	1-комнатные, 37 м<sup><small>2</small></sup>, 4/12 - этаж/этажей	2159	1517555238158	\N	1	\N	0	0	apartment	61	\N
2160	1-комнатные, 35 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2160	1517555296606	\N	1	\N	0	0	apartment	61	\N
2161	1-комнатные, 31 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2161	1517555314331	\N	1	\N	0	0	apartment	61	\N
2162	1-комнатные, 33 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2162	1517555344176	\N	1	\N	0	0	apartment	61	\N
2243	Дом на участке 20 сот. 	2243	1517576937205	\N	1	\N	0	0	cottages	1595	\N
2519	Дом	2519	1517590889103	\N	1	\N	0	0	cottages	1595	\N
2596	3-комнатные, 65 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2596	1517596898246	\N	1	\N	0	0	apartment	63	\N
2597	3-комнатные, 65 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2597	1517596911282	\N	1	\N	0	0	apartment	63	\N
2598	3-комнатные, 74 м<sup><small>2</small></sup>, 0/0 - этаж/этажей	2598	1517596939402	\N	1	\N	0	0	apartment	63	\N
2599	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2599	1517596951388	\N	1	\N	0	0	apartment	63	\N
2600	3-комнатные, 60 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2600	1517596976416	\N	1	\N	0	0	apartment	63	\N
2601	3-комнатные, 65 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2601	1517596992707	\N	1	\N	0	0	apartment	63	\N
2602	3-комнатные,  м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2602	1517597018956	\N	1	\N	0	0	apartment	63	\N
2603	3-комнатные,  м<sup><small>2</small></sup>, 3/6 - этаж/этажей	2603	1517597045109	\N	1	\N	0	0	apartment	63	\N
2604	3-комнатные, 130 м<sup><small>2</small></sup>, 5/6 - этаж/этажей	2604	1517597069345	\N	1	\N	0	0	apartment	63	\N
2605	3-комнатные, 141 м<sup><small>2</small></sup>, 5/6 - этаж/этажей	2605	1517597091631	\N	1	\N	0	0	apartment	63	\N
2606	3-комнатные, 80 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2606	1517597112670	\N	1	\N	0	0	apartment	63	\N
2854	Погреб	2854	1517643442338	\N	1	\N	0	0	commercial	1770	\N
2908	Дом 79 м<sup><small>2</small></sup> на участке 16 сот. 	2908	1517666645239	\N	1	\N	0	0	cottages	1595	\N
2969	Коттедж 108 м<sup><small>2</small></sup>	2969	1517681824207	\N	1	\N	0	0	cottages	1596	\N
3074	Земля на участке 15 сот. 	3074	1517724195983	\N	1	\N	0	0	cottages	1743	\N
3199	1-комнатные, 32 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3199	1517757715890	\N	1	\N	0	0	apartment	61	\N
3279	Земля на участке 15 сот. 	3279	1517844419064	\N	1	\N	0	0	cottages	1743	\N
3280	Дача	3280	1517844496009	\N	1	\N	0	0	cottages	1750	\N
3319	Земля на участке 10 сот. 	3319	1517855417280	\N	1	\N	0	0	cottages	1743	\N
3358	Земля	3358	1517893520660	\N	1	\N	0	0	cottages	1743	\N
3420	1-комнатные,  м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3420	1517999248800	\N	1	\N	0	0	apartment	61	\N
3421	1-комнатные, 33 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3421	1517999258788	\N	1	\N	0	0	apartment	61	\N
3422	1-комнатные, 35 м<sup><small>2</small></sup>, 6/12 - этаж/этажей	3422	1517999277662	\N	1	\N	0	0	apartment	61	\N
3423	1-комнатные, 29 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3423	1517999291398	\N	1	\N	0	0	apartment	61	\N
3424	1-комнатные, 33 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3424	1517999316198	\N	1	\N	0	0	apartment	61	\N
3425	4-комнатные,  м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3425	1517999343264	\N	1	\N	0	0	apartment	64	\N
3426	4-комнатные,  м<sup><small>2</small></sup>, 0/0 - этаж/этажей	3426	1517999390753	\N	1	\N	0	0	apartment	64	\N
3427	4-комнатные, 95 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3427	1517999418014	\N	1	\N	0	0	apartment	64	\N
1797	Гараж, 18 м<sup><small>2</small></sup>	1797	1517503666961	\N	1	\N	0	0	commercial	1765	\N
1799	Гараж, 18 м<sup><small>2</small></sup>	1799	1517503702728	\N	1	\N	0	0	commercial	1765	\N
1879	Комнаты, 13 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1879	1517506344129	\N	1	\N	0	0	apartment	60	\N
1880	Комнаты, 18 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1880	1517506360628	\N	1	\N	0	0	apartment	60	\N
1881	Комнаты, 18 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1881	1517506376270	\N	1	\N	0	0	apartment	60	\N
1882	Комнаты, 18 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	1882	1517506426501	\N	1	\N	0	0	apartment	60	\N
1883	Комнаты, 19 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1883	1517506441785	\N	1	\N	0	0	apartment	60	\N
1884	Комнаты, 18 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1884	1517506459217	\N	1	\N	0	0	apartment	60	\N
1885	Комнаты, 18 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	1885	1517506479170	\N	1	\N	0	0	apartment	60	\N
1886	Комнаты, 13 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1886	1517506490101	\N	1	\N	0	0	apartment	60	\N
1887	Комнаты, 18 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	1887	1517506506760	\N	1	\N	0	0	apartment	60	\N
1889	Комнаты,  м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1889	1517506535850	\N	1	\N	0	0	apartment	60	\N
1991	Изолированные малосемейки, 29 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1991	1517516609344	\N	1	\N	0	0	apartment	80	\N
1992	Изолированные малосемейки, 28.2 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1992	1517516628803	\N	1	\N	0	0	apartment	80	\N
1993	Изолированные малосемейки, 30 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	1993	1517516649987	\N	1	\N	0	0	apartment	80	\N
1994	Изолированные малосемейки, 31.5 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	1994	1517516663399	\N	1	\N	0	0	apartment	80	\N
1995	Изолированные малосемейки, 18 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	1995	1517516687739	\N	1	\N	0	0	apartment	80	\N
1996	Изолированные малосемейки, 37 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	1996	1517516710655	\N	1	\N	0	0	apartment	80	\N
1997	Изолированные малосемейки, 30 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	1997	1517516732235	\N	1	\N	0	0	apartment	80	\N
1998	Изолированные малосемейки, 36 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	1998	1517516758447	\N	1	\N	0	0	apartment	80	\N
1999	Изолированные малосемейки, 27 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1999	1517516783316	\N	1	\N	0	0	apartment	80	\N
2000	Изолированные малосемейки, 39 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2000	1517516806958	\N	1	\N	0	0	apartment	80	\N
2163	1-комнатные, 30 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2163	1517555390501	\N	1	\N	0	0	apartment	61	\N
2164	1-комнатные, 46 м<sup><small>2</small></sup>, 3/12 - этаж/этажей	2164	1517555404251	\N	1	\N	0	0	apartment	61	\N
2244	Земля 36 м<sup><small>2</small></sup> на участке 40 сот. 	2244	1517577132211	\N	1	\N	0	0	cottages	1743	\N
2520	Дом 50 м<sup><small>2</small></sup> на участке 20 сот. 	2520	1517590979114	\N	1	\N	0	0	cottages	1595	\N
2607	3-комнатные, 60 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2607	1517597335323	\N	1	\N	0	0	apartment	63	\N
2608	3-комнатные, 77 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2608	1517597369725	\N	1	\N	0	0	apartment	63	\N
2609	3-комнатные, 60 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2609	1517597388506	\N	1	\N	0	0	apartment	63	\N
2610	3-комнатные, 65 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2610	1517597405057	\N	1	\N	0	0	apartment	63	\N
2611	3-комнатные, 66 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2611	1517597426180	\N	1	\N	0	0	apartment	63	\N
2612	3-комнатные, 43 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2612	1517597441860	\N	1	\N	0	0	apartment	63	\N
2613	3-комнатные, 60 м<sup><small>2</small></sup>, 12/12 - этаж/этажей	2613	1517597455580	\N	1	\N	0	0	apartment	63	\N
2614	2-комнатные, 49 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2614	1517597502067	\N	1	\N	0	0	apartment	62	\N
2615	2-комнатные,  м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2615	1517597523886	\N	1	\N	0	0	apartment	62	\N
2616	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2616	1517597537378	\N	1	\N	0	0	apartment	62	\N
2617	2-комнатные, 45 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2617	1517597575170	\N	1	\N	0	0	apartment	62	\N
2618	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2618	1517597592439	\N	1	\N	0	0	apartment	62	\N
2619	2-комнатные, 50 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2619	1517597607563	\N	1	\N	0	0	apartment	62	\N
2620	2-комнатные, 58 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2620	1517597631110	\N	1	\N	0	0	apartment	62	\N
2621	2-комнатные,  м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2621	1517597650183	\N	1	\N	0	0	apartment	62	\N
2622	2-комнатные,  м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2622	1517597683782	\N	1	\N	0	0	apartment	62	\N
1800	Комнаты, 23 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1800	1517503723837	\N	1	\N	0	0	apartment	60	\N
1888	Офисное помещение, 750 м<sup><small>2</small></sup>	1888	1517506509932	\N	1	\N	0	0	commercial	1843	\N
2001	Изолированные малосемейки, 15 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2001	1517516958168	\N	1	\N	0	0	apartment	80	\N
2165	1-комнатные, 47 м<sup><small>2</small></sup>, 9/12 - этаж/этажей	2165	1517555433189	\N	1	\N	0	0	apartment	61	\N
2166	1-комнатные, 46 м<sup><small>2</small></sup>, 9/12 - этаж/этажей	2166	1517555457933	\N	1	\N	0	0	apartment	61	\N
2521	Дом 144 м<sup><small>2</small></sup> на участке 13 сот. 	2521	1517591136128	\N	1	\N	0	0	cottages	1595	\N
2623	2-комнатные, 48 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2623	1517597706309	\N	1	\N	0	0	apartment	62	\N
2624	2-комнатные, 44 м<sup><small>2</small></sup>, 10/12 - этаж/этажей	2624	1517597720296	\N	1	\N	0	0	apartment	62	\N
2625	2-комнатные, 48 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2625	1517597730783	\N	1	\N	0	0	apartment	62	\N
2626	2-комнатные, 49.1 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2626	1517597751457	\N	1	\N	0	0	apartment	62	\N
2627	2-комнатные, 50 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2627	1517597765156	\N	1	\N	0	0	apartment	62	\N
2628	2-комнатные, 47 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2628	1517597779957	\N	1	\N	0	0	apartment	62	\N
2629	2-комнатные, 56 м<sup><small>2</small></sup>, 10/12 - этаж/этажей	2629	1517597801007	\N	1	\N	0	0	apartment	62	\N
2630	2-комнатные, 49 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2630	1517597829357	\N	1	\N	0	0	apartment	62	\N
2631	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2631	1517597844501	\N	1	\N	0	0	apartment	62	\N
2632	2-комнатные, 46 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2632	1517597855273	\N	1	\N	0	0	apartment	62	\N
2633	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2633	1517597872715	\N	1	\N	0	0	apartment	62	\N
2634	2-комнатные, 43 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2634	1517597888225	\N	1	\N	0	0	apartment	62	\N
2635	2-комнатные, 45 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2635	1517597898727	\N	1	\N	0	0	apartment	62	\N
2636	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2636	1517597915379	\N	1	\N	0	0	apartment	62	\N
2637	2-комнатные, 45 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2637	1517597945836	\N	1	\N	0	0	apartment	62	\N
2638	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2638	1517597959676	\N	1	\N	0	0	apartment	62	\N
2639	2-комнатные, 45 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2639	1517597974562	\N	1	\N	0	0	apartment	62	\N
2640	2-комнатные, 43 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2640	1517597989305	\N	1	\N	0	0	apartment	62	\N
2641	2-комнатные,  м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2641	1517598004874	\N	1	\N	0	0	apartment	62	\N
2642	2-комнатные, 45 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2642	1517598021451	\N	1	\N	0	0	apartment	62	\N
2643	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2643	1517598044454	\N	1	\N	0	0	apartment	62	\N
2644	2-комнатные, 45 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2644	1517598055118	\N	1	\N	0	0	apartment	62	\N
2645	2-комнатные, 50.7 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2645	1517598068153	\N	1	\N	0	0	apartment	62	\N
2646	2-комнатные, 47 м<sup><small>2</small></sup>, 11/12 - этаж/этажей	2646	1517598078920	\N	1	\N	0	0	apartment	62	\N
2647	2-комнатные, 46 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2647	1517598094042	\N	1	\N	0	0	apartment	62	\N
2648	2-комнатные, 46 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2648	1517598108575	\N	1	\N	0	0	apartment	62	\N
2649	2-комнатные, 54 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2649	1517598118629	\N	1	\N	0	0	apartment	62	\N
2650	2-комнатные, 58 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2650	1517598129620	\N	1	\N	0	0	apartment	62	\N
2651	2-комнатные, 54 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2651	1517598150726	\N	1	\N	0	0	apartment	62	\N
2652	2-комнатные, 48 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2652	1517598172556	\N	1	\N	0	0	apartment	62	\N
2653	2-комнатные, 54 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	2653	1517598192865	\N	1	\N	0	0	apartment	62	\N
2654	2-комнатные, 53 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	2654	1517598204662	\N	1	\N	0	0	apartment	62	\N
2655	2-комнатные, 50 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2655	1517598228452	\N	1	\N	0	0	apartment	62	\N
2656	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2656	1517598247690	\N	1	\N	0	0	apartment	62	\N
2657	2-комнатные, 106 м<sup><small>2</small></sup>, 5/12 - этаж/этажей	2657	1517598263805	\N	1	\N	0	0	apartment	62	\N
2658	2-комнатные, 50 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2658	1517598284504	\N	1	\N	0	0	apartment	62	\N
2855	Гараж	2855	1517643565448	\N	1	\N	0	0	commercial	1765	\N
2245	Дом 73 м<sup><small>2</small></sup> на участке 13 сот. 	2245	1517577228224	\N	1	\N	0	0	cottages	1595	\N
1801	Автостоянка, 170 м<sup><small>2</small></sup>	1801	1517503786734	\N	1	\N	0	0	commercial	1773	\N
1803	Погреб, 10 м<sup><small>2</small></sup>	1803	1517503834741	\N	1	\N	0	0	commercial	1770	\N
1804	Погреб, 7 м<sup><small>2</small></sup>	1804	1517503855743	\N	1	\N	0	0	commercial	1770	\N
1805	Погреб	1805	1517503874972	\N	1	\N	0	0	commercial	1770	\N
1806	Торговое помещение, 420 м<sup><small>2</small></sup>	1806	1517503919729	\N	1	\N	0	0	commercial	1784	\N
1890	Комнаты, 13 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1890	1517506608677	\N	1	\N	0	0	apartment	60	\N
2167	1-комнатные, 39 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2167	1517555534387	\N	1	\N	0	0	apartment	61	\N
1802	Погреб	1802	1517503813722	\N	1	\N	0	0	commercial	1770	\N
2002	Изолированные малосемейки, 30 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2002	1517517168758	\N	1	\N	0	0	apartment	80	\N
2168	1-комнатные, 29 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2168	1517555561048	\N	1	\N	0	0	apartment	61	\N
2246	1-комнатные, 33 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2246	1517577554696	\N	1	\N	0	0	apartment	61	\N
2522	Дом на участке 18 сот. 	2522	1517591234172	\N	1	\N	0	0	cottages	1595	\N
2659	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2659	1517598294868	\N	1	\N	0	0	apartment	62	\N
2660	2-комнатные, 34 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2660	1517598306477	\N	1	\N	0	0	apartment	62	\N
2661	2-комнатные, 45 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2661	1517598319539	\N	1	\N	0	0	apartment	62	\N
2662	2-комнатные, 35 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2662	1517598338675	\N	1	\N	0	0	apartment	62	\N
2663	2-комнатные, 35 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2663	1517598349241	\N	1	\N	0	0	apartment	62	\N
2664	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2664	1517598359261	\N	1	\N	0	0	apartment	62	\N
2665	2-комнатные, 48 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2665	1517598378231	\N	1	\N	0	0	apartment	62	\N
2666	2-комнатные, 56 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2666	1517598388145	\N	1	\N	0	0	apartment	62	\N
2667	2-комнатные, 50 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2667	1517598400659	\N	1	\N	0	0	apartment	62	\N
2668	2-комнатные, 76 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2668	1517598423130	\N	1	\N	0	0	apartment	62	\N
2669	2-комнатные, 76 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2669	1517598446290	\N	1	\N	0	0	apartment	62	\N
2856	ПСН	2856	1517643667778	\N	1	\N	0	0	commercial	1779	\N
2909	Дом на участке 20 сот. 	2909	1517666709430	\N	1	\N	0	0	cottages	1595	\N
2910	Коттедж 74 м<sup><small>2</small></sup> на участке 13 сот. 	2910	1517666772660	\N	1	\N	0	0	cottages	1596	\N
2911	Коттедж 80 м<sup><small>2</small></sup>	2911	1517666823373	\N	1	\N	0	0	cottages	1596	\N
2970	Дача на участке 12 сот. 	2970	1517681994930	\N	1	\N	0	0	cottages	1750	\N
3075	Дача 110 м<sup><small>2</small></sup> на участке 6 сот. 	3075	1517724746503	\N	1	\N	0	0	cottages	1750	\N
3200	2-комнатные, 50 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3200	1517757778212	\N	1	\N	0	0	apartment	62	\N
3201	2-комнатные, 57 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3201	1517757811622	\N	1	\N	0	0	apartment	62	\N
3281	Земля 100 м<sup><small>2</small></sup> на участке 31 сот. 	3281	1517844621332	\N	1	\N	0	0	cottages	1743	\N
3282	Земля	3282	1517844664001	\N	1	\N	0	0	cottages	1743	\N
3283	Земля на участке 20 сот. 	3283	1517844726500	\N	1	\N	0	0	cottages	1743	\N
3320	Земля на участке 15 сот. 	3320	1517855464076	\N	1	\N	0	0	cottages	1743	\N
3321	Дом на участке 35 сот. 	3321	1517855486960	\N	1	\N	0	0	cottages	1595	\N
3359	Земля	3359	1517893735679	\N	1	\N	0	0	cottages	1743	\N
3428	4-комнатные, 72 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3428	1517999435421	\N	1	\N	0	0	apartment	64	\N
3429	5-комнат и более, 120 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3429	1517999444549	\N	1	\N	0	0	apartment	65	\N
3430	5-комнат и более, 111 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3430	1517999459541	\N	1	\N	0	0	apartment	65	\N
3431	5-комнат и более, 111 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3431	1517999468508	\N	1	\N	0	0	apartment	65	\N
3432	5-комнат и более, 120 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3432	1517999494780	\N	1	\N	0	0	apartment	65	\N
3505	4-комнатные, 185 м<sup><small>2</small></sup>, 7/10 - этаж/этажей	3505	1518001663619	\N	1	\N	0	0	apartment	64	\N
3506	4-комнатные,  м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3506	1518001700155	\N	1	\N	0	0	apartment	64	\N
3507	4-комнатные, 74 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3507	1518001714554	\N	1	\N	0	0	apartment	64	\N
3508	4-комнатные, 84 м<sup><small>2</small></sup>, 5/6 - этаж/этажей	3508	1518001734962	\N	1	\N	0	0	apartment	64	\N
3509	4-комнатные, 82 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3509	1518001752660	\N	1	\N	0	0	apartment	64	\N
3510	4-комнатные, 101 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3510	1518001768860	\N	1	\N	0	0	apartment	64	\N
1807	Комнаты, 21 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1807	1517503955504	\N	1	\N	0	0	apartment	60	\N
1808	Комнаты, 14 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1808	1517503976609	\N	1	\N	0	0	apartment	60	\N
1809	Комнаты, 22.2 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1809	1517503999134	\N	1	\N	0	0	apartment	60	\N
1891	Комнаты, 18 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1891	1517506635896	\N	1	\N	0	0	apartment	60	\N
1892	Комнаты, 14 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	1892	1517506653381	\N	1	\N	0	0	apartment	60	\N
2003	Изолированные малосемейки, 29 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2003	1517517197595	\N	1	\N	0	0	apartment	80	\N
2004	Изолированные малосемейки, 29 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2004	1517517223759	\N	1	\N	0	0	apartment	80	\N
2005	Изолированные малосемейки, 22 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2005	1517517242164	\N	1	\N	0	0	apartment	80	\N
2006	Изолированные малосемейки, 28 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2006	1517517262345	\N	1	\N	0	0	apartment	80	\N
2007	Изолированные малосемейки, 28 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2007	1517517282417	\N	1	\N	0	0	apartment	80	\N
2008	Изолированные малосемейки, 20 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2008	1517517312409	\N	1	\N	0	0	apartment	80	\N
2009	Изолированные малосемейки, 35 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2009	1517517356341	\N	1	\N	0	0	apartment	80	\N
2010	Изолированные малосемейки, 34 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2010	1517517386329	\N	1	\N	0	0	apartment	80	\N
2011	Изолированные малосемейки, 24 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2011	1517517408194	\N	1	\N	0	0	apartment	80	\N
2012	Изолированные малосемейки, 30 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2012	1517517429031	\N	1	\N	0	0	apartment	80	\N
2013	Изолированные малосемейки, 18 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2013	1517517452897	\N	1	\N	0	0	apartment	80	\N
2169	1-комнатные, 38.7 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2169	1517555595740	\N	1	\N	0	0	apartment	61	\N
2170	1-комнатные, 30 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2170	1517555609826	\N	1	\N	0	0	apartment	61	\N
2171	1-комнатные, 45 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2171	1517555627002	\N	1	\N	0	0	apartment	61	\N
2172	1-комнатные, 40 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2172	1517555642037	\N	1	\N	0	0	apartment	61	\N
2173	1-комнатные, 35 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2173	1517555671008	\N	1	\N	0	0	apartment	61	\N
2174	1-комнатные, 33 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2174	1517555689672	\N	1	\N	0	0	apartment	61	\N
2175	1-комнатные, 35 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2175	1517555708708	\N	1	\N	0	0	apartment	61	\N
2176	1-комнатные, 40 м<sup><small>2</small></sup>, 4/10 - этаж/этажей	2176	1517555739295	\N	1	\N	0	0	apartment	61	\N
2177	1-комнатные, 36 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2177	1517555760410	\N	1	\N	0	0	apartment	61	\N
2247	1-комнатные, 36 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2247	1517577610643	\N	1	\N	0	0	apartment	61	\N
2523	Дом 55 м<sup><small>2</small></sup> на участке 6 сот. 	2523	1517591393125	\N	1	\N	0	0	cottages	1595	\N
2524	Дом на участке 35 сот. 	2524	1517591460118	\N	1	\N	0	0	cottages	1595	\N
2525	Дом 100 м<sup><small>2</small></sup> на участке 200 сот. 	2525	1517591488116	\N	1	\N	0	0	cottages	1595	\N
2526	Дом на участке 42 сот. 	2526	1517591520114	\N	1	\N	0	0	cottages	1595	\N
2670	2-комнатные, 68 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2670	1517598454666	\N	1	\N	0	0	apartment	62	\N
2671	2-комнатные, 43 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2671	1517598473226	\N	1	\N	0	0	apartment	62	\N
2672	2-комнатные, 49 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2672	1517598486764	\N	1	\N	0	0	apartment	62	\N
2673	2-комнатные, 48.1 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2673	1517598503352	\N	1	\N	0	0	apartment	62	\N
2674	2-комнатные, 48 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2674	1517598517771	\N	1	\N	0	0	apartment	62	\N
2675	2-комнатные, 48 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2675	1517598528438	\N	1	\N	0	0	apartment	62	\N
2676	2-комнатные, 61 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	2676	1517598546592	\N	1	\N	0	0	apartment	62	\N
2677	2-комнатные, 48 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2677	1517598565869	\N	1	\N	0	0	apartment	62	\N
2678	2-комнатные, 46 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2678	1517598581768	\N	1	\N	0	0	apartment	62	\N
2679	2-комнатные, 48 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2679	1517598603424	\N	1	\N	0	0	apartment	62	\N
2680	2-комнатные, 48 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2680	1517598626040	\N	1	\N	0	0	apartment	62	\N
2681	2-комнатные, 42 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2681	1517598648058	\N	1	\N	0	0	apartment	62	\N
2857	ПСН	2857	1517644989716	\N	1	\N	0	0	commercial	1779	\N
2912	Коттедж	2912	1517667157381	\N	1	\N	0	0	cottages	1596	\N
1810	Комнаты, 26 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1810	1517504056061	\N	1	\N	0	0	apartment	60	\N
1893	Складское помещение	skladskoe-pomeshchenie	1517506669807	\N	1	\N	1	0	section	\N	1893
2014	Изолированные малосемейки, 28 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2014	1517517486526	\N	1	\N	0	0	apartment	80	\N
2015	Изолированные малосемейки, 14 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2015	1517517517776	\N	1	\N	0	0	apartment	80	\N
2016	Изолированные малосемейки, 23 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2016	1517517553266	\N	1	\N	0	0	apartment	80	\N
2017	Изолированные малосемейки, 13 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2017	1517517573936	\N	1	\N	0	0	apartment	80	\N
2018	Изолированные малосемейки, 23 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2018	1517517600260	\N	1	\N	0	0	apartment	80	\N
2178	1-комнатные, 30 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2178	1517555800452	\N	1	\N	0	0	apartment	61	\N
2179	1-комнатные, 31 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2179	1517555824089	\N	1	\N	0	0	apartment	61	\N
2180	1-комнатные, 30 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2180	1517555848615	\N	1	\N	0	0	apartment	61	\N
2181	1-комнатные, 33 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2181	1517555870953	\N	1	\N	0	0	apartment	61	\N
2182	1-комнатные, 33 м<sup><small>2</small></sup>, 7/10 - этаж/этажей	2182	1517555903988	\N	1	\N	0	0	apartment	61	\N
2248	1-комнатные, 32 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2248	1517577659607	\N	1	\N	0	0	apartment	61	\N
2249	1-комнатные, 40 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2249	1517577684908	\N	1	\N	0	0	apartment	61	\N
2250	4-комнатные, 112 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2250	1517577710728	\N	1	\N	0	0	apartment	64	\N
2251	4-комнатные, 112 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2251	1517577757514	\N	1	\N	0	0	apartment	64	\N
2252	4-комнатные, 178 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2252	1517577807809	\N	1	\N	0	0	apartment	64	\N
2253	4-комнатные, 122 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2253	1517577831221	\N	1	\N	0	0	apartment	64	\N
2254	4-комнатные, 170 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2254	1517577858435	\N	1	\N	0	0	apartment	64	\N
2255	4-комнатные, 120 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2255	1517577873787	\N	1	\N	0	0	apartment	64	\N
2256	4-комнатные,  м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2256	1517577890256	\N	1	\N	0	0	apartment	64	\N
2527	Дом 54 м<sup><small>2</small></sup> на участке 5 сот. 	2527	1517591599126	\N	1	\N	0	0	cottages	1595	\N
2528	Коттедж	2528	1517591678124	\N	1	\N	0	0	cottages	1596	\N
2682	2-комнатные, 67.7 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2682	1517598704648	\N	1	\N	0	0	apartment	62	\N
2683	2-комнатные, 43 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2683	1517598719613	\N	1	\N	0	0	apartment	62	\N
2684	2-комнатные, 65 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2684	1517598733295	\N	1	\N	0	0	apartment	62	\N
2685	2-комнатные, 53 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2685	1517598756006	\N	1	\N	0	0	apartment	62	\N
2686	2-комнатные, 53 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2686	1517598773479	\N	1	\N	0	0	apartment	62	\N
2858	Торговое помещение	2858	1517645022581	\N	1	\N	0	0	commercial	1784	\N
2913	Коттедж 150 м<sup><small>2</small></sup> на участке 10 сот. 	2913	1517667200538	\N	1	\N	0	0	cottages	1596	\N
2914	Коттедж на участке 80 сот. 	2914	1517667249774	\N	1	\N	0	0	cottages	1596	\N
2915	Коттедж 84 м<sup><small>2</small></sup> на участке 16 сот. 	2915	1517667285623	\N	1	\N	0	0	cottages	1596	\N
2971	Дача на участке 8 сот. 	2971	1517682077251	\N	1	\N	0	0	cottages	1750	\N
3076	Дача на участке 5 сот. 	3076	1517724797198	\N	1	\N	0	0	cottages	1750	\N
3202	2-комнатные, 48 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3202	1517757980763	\N	1	\N	0	0	apartment	62	\N
3203	2-комнатные,  м<sup><small>2</small></sup>, 9/12 - этаж/этажей	3203	1517758026094	\N	1	\N	0	0	apartment	62	\N
3204	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3204	1517758048317	\N	1	\N	0	0	apartment	62	\N
3284	Земля на участке 22 сот. 	3284	1517844981661	\N	1	\N	0	0	cottages	1743	\N
3285	Земля на участке 18 сот. 	3285	1517845013392	\N	1	\N	0	0	cottages	1743	\N
3322	Земля на участке 9 сот. 	3322	1517855561069	\N	1	\N	0	0	cottages	1743	\N
3360	Земля на участке 11 сот. 	3360	1517894091317	\N	1	\N	0	0	cottages	1743	\N
3433	5-комнат и более, 280 м<sup><small>2</small></sup>, 6/7 - этаж/этажей	3433	1517999535506	\N	1	\N	0	0	apartment	65	\N
3434	5-комнат и более, 260 м<sup><small>2</small></sup>, 10/11 - этаж/этажей	3434	1517999560254	\N	1	\N	0	0	apartment	65	\N
3435	5-комнат и более, 111 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3435	1517999583247	\N	1	\N	0	0	apartment	65	\N
1811	Комнаты, 18 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	1811	1517504102892	\N	1	\N	0	0	apartment	60	\N
1812	Комнаты, 18 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	1812	1517504131184	\N	1	\N	0	0	apartment	60	\N
1813	Комнаты, 17.7 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1813	1517504155458	\N	1	\N	0	0	apartment	60	\N
1814	Комнаты, 13 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1814	1517504173023	\N	1	\N	0	0	apartment	60	\N
1815	Комнаты, 22 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	1815	1517504191372	\N	1	\N	0	0	apartment	60	\N
1816	Комнаты, 13 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	1816	1517504223295	\N	1	\N	0	0	apartment	60	\N
1817	Комнаты, 13 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	1817	1517504276058	\N	1	\N	0	0	apartment	60	\N
1818	Комнаты, 18 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	1818	1517504303344	\N	1	\N	0	0	apartment	60	\N
1819	Комнаты, 18 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1819	1517504319087	\N	1	\N	0	0	apartment	60	\N
1820	Комнаты, 19 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1820	1517504341404	\N	1	\N	0	0	apartment	60	\N
1821	Комнаты, 13 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1821	1517504370382	\N	1	\N	0	0	apartment	60	\N
1894	Комнаты, 14.6 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	1894	1517506719797	\N	1	\N	0	0	apartment	60	\N
1895	Комнаты, 12 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1895	1517506753419	\N	1	\N	0	0	apartment	60	\N
1897	Комнаты, 13.4 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1897	1517506785439	\N	1	\N	0	0	apartment	60	\N
2183	Дом 38 м<sup><small>2</small></sup>	2183	1517566927355	\N	1	\N	0	0	cottages	1595	\N
2184	Дом на участке 22 сот. 	2184	1517566969284	\N	1	\N	0	0	cottages	1595	\N
2185	Дом 100 м<sup><small>2</small></sup> на участке 10 сот. 	2185	1517567039285	\N	1	\N	0	0	cottages	1595	\N
2186	Дом 184 м<sup><small>2</small></sup> на участке 30 сот. 	2186	1517567087306	\N	1	\N	0	0	cottages	1595	\N
2258	4-комнатные, 129 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2258	1517577941648	\N	1	\N	0	0	apartment	64	\N
2259	4-комнатные, 250 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	2259	1517577964878	\N	1	\N	0	0	apartment	64	\N
2260	4-комнатные, 213 м<sup><small>2</small></sup>, 7/10 - этаж/этажей	2260	1517577986994	\N	1	\N	0	0	apartment	64	\N
2529	Коттедж на участке 15 сот. 	2529	1517591748127	\N	1	\N	0	0	cottages	1596	\N
2687	2-комнатные, 47 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	2687	1517598852140	\N	1	\N	0	0	apartment	62	\N
2688	2-комнатные, 48 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2688	1517598867684	\N	1	\N	0	0	apartment	62	\N
2689	2-комнатные, 45 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2689	1517598883720	\N	1	\N	0	0	apartment	62	\N
2690	2-комнатные, 48 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2690	1517598895061	\N	1	\N	0	0	apartment	62	\N
2691	2-комнатные, 48 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2691	1517598903240	\N	1	\N	0	0	apartment	62	\N
2692	2-комнатные, 52 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2692	1517598928637	\N	1	\N	0	0	apartment	62	\N
2693	2-комнатные, 78 м<sup><small>2</small></sup>, 12/12 - этаж/этажей	2693	1517598954903	\N	1	\N	0	0	apartment	62	\N
2694	2-комнатные, 79 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2694	1517598963249	\N	1	\N	0	0	apartment	62	\N
2695	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2695	1517598974471	\N	1	\N	0	0	apartment	62	\N
2696	2-комнатные, 45.6 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2696	1517598987633	\N	1	\N	0	0	apartment	62	\N
2697	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2697	1517599000685	\N	1	\N	0	0	apartment	62	\N
2698	2-комнатные, 78 м<sup><small>2</small></sup>, 11/12 - этаж/этажей	2698	1517599046058	\N	1	\N	0	0	apartment	62	\N
2859	Гараж	2859	1517645150981	\N	1	\N	0	0	commercial	1765	\N
2916	Коттедж 122 м<sup><small>2</small></sup> на участке 10 сот. 	2916	1517668361284	\N	1	\N	0	0	cottages	1596	\N
2972	Земля на участке 8 сот. 	2972	1517682306433	\N	1	\N	0	0	cottages	1743	\N
3077	Дача	3077	1517724865751	\N	1	\N	0	0	cottages	1750	\N
3206	2-комнатные,  м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3206	1517758149186	\N	1	\N	0	0	apartment	62	\N
3207	2-комнатные, 44 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3207	1517758172586	\N	1	\N	0	0	apartment	62	\N
3286	Дом на участке 30 сот. 	3286	1517845213190	\N	1	\N	0	0	cottages	1595	\N
3323	Земля на участке 4000 сот. 	3323	1517855634924	\N	1	\N	0	0	cottages	1743	\N
3324	Земля на участке 9 сот. 	3324	1517855673774	\N	1	\N	0	0	cottages	1743	\N
3325	Дача	3325	1517855714812	\N	1	\N	0	0	cottages	1750	\N
3361	Земля	3361	1517894376931	\N	1	\N	0	0	cottages	1743	\N
3436	5-комнат и более, 120 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	3436	1517999610047	\N	1	\N	0	0	apartment	65	\N
1822	Комнаты, 12.6 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1822	1517504399923	\N	1	\N	0	0	apartment	60	\N
1823	Комнаты, 14 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	1823	1517504430531	\N	1	\N	0	0	apartment	60	\N
1824	Комнаты, 18.7 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1824	1517504456741	\N	1	\N	0	0	apartment	60	\N
1825	Комнаты, 14 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1825	1517504482202	\N	1	\N	0	0	apartment	60	\N
1826	Комнаты, 12 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	1826	1517504537657	\N	1	\N	0	0	apartment	60	\N
1896	Гараж, 42 м<sup><small>2</small></sup>	1896	1517506778817	\N	1	\N	0	0	commercial	1765	\N
2020	Изолированные малосемейки,  м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2020	1517517685715	\N	1	\N	0	0	apartment	80	\N
2021	Изолированные малосемейки, 29 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2021	1517517713695	\N	1	\N	0	0	apartment	80	\N
2022	Изолированные малосемейки, 30 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2022	1517517733077	\N	1	\N	0	0	apartment	80	\N
2023	Изолированные малосемейки, 29 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2023	1517517751107	\N	1	\N	0	0	apartment	80	\N
2024	Изолированные малосемейки, 19 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2024	1517517776746	\N	1	\N	0	0	apartment	80	\N
2025	Изолированные малосемейки, 18 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2025	1517517800452	\N	1	\N	0	0	apartment	80	\N
2026	Изолированные малосемейки, 23.4 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2026	1517517822616	\N	1	\N	0	0	apartment	80	\N
2027	Изолированные малосемейки, 18.3 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2027	1517517852864	\N	1	\N	0	0	apartment	80	\N
2028	Изолированные малосемейки, 18 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2028	1517517868334	\N	1	\N	0	0	apartment	80	\N
2029	Изолированные малосемейки, 22 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2029	1517517895540	\N	1	\N	0	0	apartment	80	\N
2030	Изолированные малосемейки, 22 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2030	1517517921995	\N	1	\N	0	0	apartment	80	\N
2187	Дом 60 м<sup><small>2</small></sup> на участке 18 сот. 	2187	1517567217314	\N	1	\N	0	0	cottages	1595	\N
2188	Дом	2188	1517567240298	\N	1	\N	0	0	cottages	1595	\N
2189	Дом 30 м<sup><small>2</small></sup>	2189	1517567280531	\N	1	\N	0	0	cottages	1595	\N
2261	4-комнатные, 305.1 м<sup><small>2</small></sup>, 2/10 - этаж/этажей	2261	1517578030275	\N	1	\N	0	0	apartment	64	\N
2262	4-комнатные, 160 м<sup><small>2</small></sup>, 2/6 - этаж/этажей	2262	1517578053866	\N	1	\N	0	0	apartment	64	\N
2263	4-комнатные, 164 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2263	1517578073499	\N	1	\N	0	0	apartment	64	\N
2264	4-комнатные, 120 м<sup><small>2</small></sup>, 2/10 - этаж/этажей	2264	1517578092702	\N	1	\N	0	0	apartment	64	\N
2265	4-комнатные, 120 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2265	1517578112365	\N	1	\N	0	0	apartment	64	\N
2267	4-комнатные, 135 м<sup><small>2</small></sup>, 4/7 - этаж/этажей	2267	1517578171017	\N	1	\N	0	0	apartment	64	\N
2268	4-комнатные, 120 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2268	1517578190680	\N	1	\N	0	0	apartment	64	\N
2269	4-комнатные, 167 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2269	1517578222557	\N	1	\N	0	0	apartment	64	\N
2270	4-комнатные, 190 м<sup><small>2</small></sup>, 7/12 - этаж/этажей	2270	1517578243731	\N	1	\N	0	0	apartment	64	\N
2530	Коттедж 80 м<sup><small>2</small></sup> на участке 15 сот. 	2530	1517591792150	\N	1	\N	0	0	cottages	1596	\N
2699	2-комнатные, 46 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2699	1517599082326	\N	1	\N	0	0	apartment	62	\N
2700	2-комнатные, 44 м<sup><small>2</small></sup>, 4/4 - этаж/этажей	2700	1517599101529	\N	1	\N	0	0	apartment	62	\N
2860	4-комнатные, 137 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2860	1517655775872	\N	1	\N	0	0	apartment	64	\N
2917	Коттедж 60 м<sup><small>2</small></sup>	2917	1517669832018	\N	1	\N	0	0	cottages	1596	\N
2918	Коттедж на участке 10 сот. 	2918	1517669877649	\N	1	\N	0	0	cottages	1596	\N
2973	Дом на участке 10 сот. 	2973	1517682379483	\N	1	\N	0	0	cottages	1595	\N
3078	Дача	3078	1517724936350	\N	1	\N	0	0	cottages	1750	\N
3208	2-комнатные, 47 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3208	1517758366322	\N	1	\N	0	0	apartment	62	\N
3287	Земля на участке 10 сот. 	3287	1517845291102	\N	1	\N	0	0	cottages	1743	\N
3288	Земля на участке 15 сот. 	3288	1517845345011	\N	1	\N	0	0	cottages	1743	\N
3289	Земля	3289	1517845381046	\N	1	\N	0	0	cottages	1743	\N
3326	Дача	3326	1517855790202	\N	1	\N	0	0	cottages	1750	\N
3362	Дом на участке 8 сот. 	3362	1517894540902	\N	1	\N	0	0	cottages	1595	\N
3843	Дом 48 м<sup><small>2</small></sup> на участке 15 сот. 	3843	1518056228929	\N	1	\N	0	0	cottages	1595	\N
3844	Коттедж 205 м<sup><small>2</small></sup>	3844	1518056262299	\N	1	\N	0	0	cottages	1596	\N
1827	Комнаты, 18 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	1827	1517504605314	\N	1	\N	0	0	apartment	60	\N
1898	Комнаты, 18 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1898	1517506848069	\N	1	\N	0	0	apartment	60	\N
2032	Изолированные малосемейки, 38.5 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	2032	1517517988767	\N	1	\N	0	0	apartment	80	\N
2033	Изолированные малосемейки, 30 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2033	1517518011309	\N	1	\N	0	0	apartment	80	\N
2034	Изолированные малосемейки, 35 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2034	1517518031075	\N	1	\N	0	0	apartment	80	\N
2035	Изолированные малосемейки, 35 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2035	1517518054390	\N	1	\N	0	0	apartment	80	\N
2190	Дом 60 м<sup><small>2</small></sup>	2190	1517567683294	\N	1	\N	0	0	cottages	1595	\N
2271	4-комнатные, 150 м<sup><small>2</small></sup>, 6/11 - этаж/этажей	2271	1517578277139	\N	1	\N	0	0	apartment	64	\N
2272	4-комнатные, 120 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2272	1517578318439	\N	1	\N	0	0	apartment	64	\N
2273	4-комнатные, 72 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2273	1517578331163	\N	1	\N	0	0	apartment	64	\N
2274	4-комнатные, 81 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2274	1517578346045	\N	1	\N	0	0	apartment	64	\N
2531	Коттедж 136 м<sup><small>2</small></sup> на участке 9 сот. 	2531	1517591841152	\N	1	\N	0	0	cottages	1596	\N
2532	Коттедж 100 м<sup><small>2</small></sup>	2532	1517591868118	\N	1	\N	0	0	cottages	1596	\N
2701	Земля на участке 12 сот. 	2701	1517608058057	\N	1	\N	0	0	cottages	1743	\N
2861	4-комнатные, 81.3 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2861	1517655819543	\N	1	\N	0	0	apartment	64	\N
2919	Коттедж	2919	1517670006714	\N	1	\N	0	0	cottages	1596	\N
2920	Коттедж	2920	1517670048166	\N	1	\N	0	0	cottages	1596	\N
2921	Коттедж 100 м<sup><small>2</small></sup> на участке 42 сот. 	2921	1517670094327	\N	1	\N	0	0	cottages	1596	\N
2922	Коттедж 100 м<sup><small>2</small></sup> на участке 10 сот. 	2922	1517670139644	\N	1	\N	0	0	cottages	1596	\N
2923	Коттедж 110 м<sup><small>2</small></sup> на участке 30 сот. 	2923	1517670180403	\N	1	\N	0	0	cottages	1596	\N
2924	Коттедж	2924	1517670207429	\N	1	\N	0	0	cottages	1596	\N
2925	Коттедж 75 м<sup><small>2</small></sup> на участке 15 сот. 	2925	1517670238750	\N	1	\N	0	0	cottages	1596	\N
2974	Земля на участке 31 сот. 	2974	1517682509560	\N	1	\N	0	0	cottages	1743	\N
3079	Дача 48 м<sup><small>2</small></sup> на участке 6 сот. 	3079	1517724987121	\N	1	\N	0	0	cottages	1750	\N
3080	Дача на участке 4 сот. 	3080	1517725010324	\N	1	\N	0	0	cottages	1750	\N
3209	2-комнатные, 61 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3209	1517758435286	\N	1	\N	0	0	apartment	62	\N
3290	Дача 130 м<sup><small>2</small></sup>	3290	1517845425849	\N	1	\N	0	0	cottages	1750	\N
3291	Дом на участке 8 сот. 	3291	1517845468135	\N	1	\N	0	0	cottages	1595	\N
3292	Дом	3292	1517845504138	\N	1	\N	0	0	cottages	1595	\N
3327	Земля на участке 14 сот. 	3327	1517856122091	\N	1	\N	0	0	cottages	1743	\N
3363	Земля	3363	1517894736896	\N	1	\N	0	0	cottages	1743	\N
3437	5-комнат и более, 120 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3437	1517999648309	\N	1	\N	0	0	apartment	65	\N
3438	5-комнат и более, 120 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3438	1517999665468	\N	1	\N	0	0	apartment	65	\N
3439	5-комнат и более, 160 м<sup><small>2</small></sup>, 10/12 - этаж/этажей	3439	1517999731601	\N	1	\N	0	0	apartment	65	\N
3440	5-комнат и более, 120 м<sup><small>2</small></sup>, 2/10 - этаж/этажей	3440	1517999742391	\N	1	\N	0	0	apartment	65	\N
3441	5-комнат и более, 124 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3441	1517999752703	\N	1	\N	0	0	apartment	65	\N
3442	5-комнат и более, 124 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3442	1517999769430	\N	1	\N	0	0	apartment	65	\N
3443	5-комнат и более, 111 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3443	1517999787608	\N	1	\N	0	0	apartment	65	\N
3444	5-комнат и более, 120 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3444	1517999802170	\N	1	\N	0	0	apartment	65	\N
3445	5-комнат и более, 187 м<sup><small>2</small></sup>, 10/12 - этаж/этажей	3445	1517999828206	\N	1	\N	0	0	apartment	65	\N
3446	5-комнат и более, 120 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3446	1517999841741	\N	1	\N	0	0	apartment	65	\N
3447	5-комнат и более, 120 м<sup><small>2</small></sup>, 1/12 - этаж/этажей	3447	1517999866120	\N	1	\N	0	0	apartment	65	\N
3448	5-комнат и более, 111 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	3448	1517999876347	\N	1	\N	0	0	apartment	65	\N
3449	5-комнат и более, 180 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3449	1517999908145	\N	1	\N	0	0	apartment	65	\N
3450	5-комнат и более, 160 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3450	1517999928939	\N	1	\N	0	0	apartment	65	\N
3451	5-комнат и более,  м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3451	1517999940269	\N	1	\N	0	0	apartment	65	\N
3846	Земля на участке 18 сот. 	3846	1518056382826	\N	1	\N	0	0	cottages	1743	\N
1828	Гараж	1828	1517504701680	\N	1	\N	0	0	commercial	1765	\N
1899	Комнаты, 23 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1899	1517506897054	\N	1	\N	0	0	apartment	60	\N
1900	Комнаты, 14 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	1900	1517506919086	\N	1	\N	0	0	apartment	60	\N
1901	Комнаты, 20 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	1901	1517506936561	\N	1	\N	0	0	apartment	60	\N
1903	Комнаты, 18 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	1903	1517506960456	\N	1	\N	0	0	apartment	60	\N
1905	Комнаты, 22 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	1905	1517506982687	\N	1	\N	0	0	apartment	60	\N
1906	Комнаты, 20 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	1906	1517506996050	\N	1	\N	0	0	apartment	60	\N
1908	Комнаты, 22 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	1908	1517507017216	\N	1	\N	0	0	apartment	60	\N
1910	Комнаты, 20 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1910	1517507040484	\N	1	\N	0	0	apartment	60	\N
1911	Комнаты, 14 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1911	1517507058744	\N	1	\N	0	0	apartment	60	\N
2036	Изолированные малосемейки, 34.4 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2036	1517518092310	\N	1	\N	0	0	apartment	80	\N
2037	Изолированные малосемейки, 30 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2037	1517518105138	\N	1	\N	0	0	apartment	80	\N
2038	Изолированные малосемейки, 36 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2038	1517518121104	\N	1	\N	0	0	apartment	80	\N
2039	Изолированные малосемейки, 40 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2039	1517518132131	\N	1	\N	0	0	apartment	80	\N
2040	Изолированные малосемейки, 30 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	2040	1517518143179	\N	1	\N	0	0	apartment	80	\N
2041	Изолированные малосемейки, 36 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2041	1517518156090	\N	1	\N	0	0	apartment	80	\N
2042	Изолированные малосемейки, 33 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2042	1517518176730	\N	1	\N	0	0	apartment	80	\N
2043	Изолированные малосемейки, 18 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2043	1517518200078	\N	1	\N	0	0	apartment	80	\N
2191	Дом 60 м<sup><small>2</small></sup> на участке 6 сот. 	2191	1517568282338	\N	1	\N	0	0	cottages	1595	\N
2275	4-комнатные, 80 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2275	1517578382190	\N	1	\N	0	0	apartment	64	\N
2276	4-комнатные, 77 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	2276	1517578427202	\N	1	\N	0	0	apartment	64	\N
2277	4-комнатные, 153 м<sup><small>2</small></sup>, 3/12 - этаж/этажей	2277	1517578443369	\N	1	\N	0	0	apartment	64	\N
2278	4-комнатные, 75 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2278	1517578473473	\N	1	\N	0	0	apartment	64	\N
2279	4-комнатные, 76 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2279	1517578493053	\N	1	\N	0	0	apartment	64	\N
2280	4-комнатные, 82 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2280	1517578510935	\N	1	\N	0	0	apartment	64	\N
2281	4-комнатные, 73 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2281	1517578523846	\N	1	\N	0	0	apartment	64	\N
2282	4-комнатные, 119 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2282	1517578538449	\N	1	\N	0	0	apartment	64	\N
2283	4-комнатные, 120 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2283	1517578557896	\N	1	\N	0	0	apartment	64	\N
2533	Коттедж 170 м<sup><small>2</small></sup> на участке 22 сот. 	2533	1517592374137	\N	1	\N	0	0	cottages	1596	\N
2702	Коттедж на участке 15 сот. 	2702	1517608216404	\N	1	\N	0	0	cottages	1596	\N
2862	3-комнатные, 66 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2862	1517656937668	\N	1	\N	0	0	apartment	63	\N
3452	5-комнат и более,  м<sup><small>2</small></sup>, 0/0 - этаж/этажей	3452	1517999987226	\N	1	\N	0	0	apartment	65	\N
2975	Дом на участке 9 сот. 	2975	1517682779393	\N	1	\N	0	0	cottages	1595	\N
2976	Дом 60 м<sup><small>2</small></sup>	2976	1517682825786	\N	1	\N	0	0	cottages	1595	\N
3081	Земля на участке 8.5 сот. 	3081	1517725061715	\N	1	\N	0	0	cottages	1743	\N
3210	2-комнатные, 48 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3210	1517758491833	\N	1	\N	0	0	apartment	62	\N
3211	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3211	1517758513065	\N	1	\N	0	0	apartment	62	\N
3212	2-комнатные, 43 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3212	1517758533181	\N	1	\N	0	0	apartment	62	\N
3213	2-комнатные, 45 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3213	1517758575487	\N	1	\N	0	0	apartment	62	\N
3293	Дача на участке 15 сот. 	3293	1517845540452	\N	1	\N	0	0	cottages	1750	\N
3328	Земля на участке 200 сот. 	3328	1517856363137	\N	1	\N	0	0	cottages	1743	\N
3329	Земля на участке 15 сот. 	3329	1517856376036	\N	1	\N	0	0	cottages	1743	\N
3330	Земля на участке 19 сот. 	3330	1517856434356	\N	1	\N	0	0	cottages	1743	\N
3331	Земля на участке 22 сот. 	3331	1517856464124	\N	1	\N	0	0	cottages	1743	\N
3364	Земля на участке 25 сот. 	3364	1517894910022	\N	1	\N	0	0	cottages	1743	\N
3847	Земля на участке 13 сот. 	3847	1518056405201	\N	1	\N	0	0	cottages	1743	\N
3853	Дача на участке 6 сот. 	3853	1518056705806	\N	1	\N	0	0	cottages	1750	\N
1829	Гараж, 70 м<sup><small>2</small></sup>	1829	1517504818818	\N	1	\N	0	0	commercial	1765	\N
1831	Гараж, 18 м<sup><small>2</small></sup>	1831	1517504882844	\N	1	\N	0	0	commercial	1765	\N
1902	Гараж, 18 м<sup><small>2</small></sup>	1902	1517506941691	\N	1	\N	0	0	commercial	1765	\N
1904	Гараж, 25 м<sup><small>2</small></sup>	1904	1517506977972	\N	1	\N	0	0	commercial	1765	\N
1907	Гараж, 18 м<sup><small>2</small></sup>	1907	1517507006697	\N	1	\N	0	0	commercial	1765	\N
1909	Гараж, 36 м<sup><small>2</small></sup>	1909	1517507038695	\N	1	\N	0	0	commercial	1765	\N
1912	ПСН	1912	1517507098700	\N	1	\N	0	0	commercial	1779	\N
1913	Производственное помещение	1913	1517507127700	\N	1	\N	0	0	commercial	1876	\N
1914	ПСН, 265 м<sup><small>2</small></sup>	1914	1517507153701	\N	1	\N	0	0	commercial	1779	\N
2044	Изолированные малосемейки, 34 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2044	1517518220259	\N	1	\N	0	0	apartment	80	\N
2045	Изолированные малосемейки, 22 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2045	1517518240090	\N	1	\N	0	0	apartment	80	\N
2047	Изолированные малосемейки, 34 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2047	1517518264607	\N	1	\N	0	0	apartment	80	\N
2048	Изолированные малосемейки, 34 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2048	1517518280052	\N	1	\N	0	0	apartment	80	\N
2049	Изолированные малосемейки, 34 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2049	1517518301322	\N	1	\N	0	0	apartment	80	\N
2050	Изолированные малосемейки, 34 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	2050	1517518319689	\N	1	\N	0	0	apartment	80	\N
2051	Изолированные малосемейки,  м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2051	1517518352010	\N	1	\N	0	0	apartment	80	\N
2052	Изолированные малосемейки, 39 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2052	1517518371951	\N	1	\N	0	0	apartment	80	\N
2053	Изолированные малосемейки, 32 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2053	1517518426001	\N	1	\N	0	0	apartment	80	\N
2192	Дом 80 м<sup><small>2</small></sup> на участке 3 сот. 	2192	1517568329314	\N	1	\N	0	0	cottages	1595	\N
2284	4-комнатные, 120 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	2284	1517580866231	\N	1	\N	0	0	apartment	64	\N
2534	Коттедж	2534	1517592436141	\N	1	\N	0	0	cottages	1596	\N
2703	Коттедж 150 м<sup><small>2</small></sup> на участке 15 сот. 	2703	1517608255816	\N	1	\N	0	0	cottages	1596	\N
2863	Комнаты, 13 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2863	1517657477990	\N	1	\N	0	0	apartment	60	\N
2864	1-комнатные, 35 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2864	1517657499727	\N	1	\N	0	0	apartment	61	\N
2865	1-комнатные,  м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2865	1517657551354	\N	1	\N	0	0	apartment	61	\N
2866	3-комнатные, 66 м<sup><small>2</small></sup>, 7/10 - этаж/этажей	2866	1517657565915	\N	1	\N	0	0	apartment	63	\N
2867	3-комнатные, 66 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2867	1517657581500	\N	1	\N	0	0	apartment	63	\N
2927	Коттедж 280 м<sup><small>2</small></sup> на участке 20 сот. 	2927	1517671701026	\N	1	\N	0	0	cottages	1596	\N
2977	Дача	2977	1517683002967	\N	1	\N	0	0	cottages	1750	\N
3082	Дача	3082	1517725111153	\N	1	\N	0	0	cottages	1750	\N
3083	Дача	3083	1517725292218	\N	1	\N	0	0	cottages	1750	\N
3084	Дача на участке 4 сот. 	3084	1517725331314	\N	1	\N	0	0	cottages	1750	\N
3085	Дача на участке 4 сот. 	3085	1517725368089	\N	1	\N	0	0	cottages	1750	\N
3086	Дача на участке 4 сот. 	3086	1517725396883	\N	1	\N	0	0	cottages	1750	\N
3214	4-комнатные, 108 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	3214	1517758649094	\N	1	\N	0	0	apartment	64	\N
3215	2-комнатные, 40 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3215	1517758683153	\N	1	\N	0	0	apartment	62	\N
3216	3-комнатные, 68 м<sup><small>2</small></sup>, 2/3 - этаж/этажей	3216	1517758701332	\N	1	\N	0	0	apartment	63	\N
3217	3-комнатные, 60 м<sup><small>2</small></sup>, 1/2 - этаж/этажей	3217	1517758713767	\N	1	\N	0	0	apartment	63	\N
3294	Земля на участке 13 сот. 	3294	1517845882484	\N	1	\N	0	0	cottages	1743	\N
3295	Земля на участке 33 сот. 	3295	1517845901469	\N	1	\N	0	0	cottages	1743	\N
3296	Земля на участке 30 сот. 	3296	1517845926847	\N	1	\N	0	0	cottages	1743	\N
3365	Дом	3365	1517896667879	\N	1	\N	0	0	cottages	1595	\N
3332	Земля на участке 20 сот. 	3332	1517856552240	\N	1	\N	0	0	cottages	1743	\N
3453	4-комнатные,  м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3453	1518000030178	\N	1	\N	0	0	apartment	64	\N
3455	4-комнатные,  м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3455	1518000071081	\N	1	\N	0	0	apartment	64	\N
3456	4-комнатные,  м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3456	1518000099116	\N	1	\N	0	0	apartment	64	\N
3848	Земля на участке 14 сот. 	3848	1518056436397	\N	1	\N	0	0	cottages	1743	\N
1830	Комнаты, 18 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	1830	1517504870766	\N	1	\N	0	0	apartment	60	\N
1915	Комнаты, 14 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1915	1517507337083	\N	1	\N	0	0	apartment	60	\N
1916	Комнаты, 14 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	1916	1517507370195	\N	1	\N	0	0	apartment	60	\N
1917	Комнаты, 12 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1917	1517507391114	\N	1	\N	0	0	apartment	60	\N
1918	Комнаты, 12 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	1918	1517507403980	\N	1	\N	0	0	apartment	60	\N
1919	Комнаты, 18 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	1919	1517507428973	\N	1	\N	0	0	apartment	60	\N
1920	Комнаты, 17.6 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	1920	1517507440560	\N	1	\N	0	0	apartment	60	\N
1921	Комнаты, 18 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1921	1517507461043	\N	1	\N	0	0	apartment	60	\N
1922	Комнаты, 14 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1922	1517507483989	\N	1	\N	0	0	apartment	60	\N
2055	Изолированные малосемейки, 30 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2055	1517518495609	\N	1	\N	0	0	apartment	80	\N
2193	Дом на участке 6 сот. 	2193	1517568370318	\N	1	\N	0	0	cottages	1595	\N
2285	4-комнатные, 164 м<sup><small>2</small></sup>, 2/8 - этаж/этажей	2285	1517580903080	\N	1	\N	0	0	apartment	64	\N
2286	4-комнатные, 174 м<sup><small>2</small></sup>, 2/6 - этаж/этажей	2286	1517580924803	\N	1	\N	0	0	apartment	64	\N
2287	4-комнатные, 181 м<sup><small>2</small></sup>, 2/8 - этаж/этажей	2287	1517580952296	\N	1	\N	0	0	apartment	64	\N
2288	4-комнатные, 235 м<sup><small>2</small></sup>, 5/8 - этаж/этажей	2288	1517580977134	\N	1	\N	0	0	apartment	64	\N
2535	Коттедж на участке 15 сот. 	2535	1517592552138	\N	1	\N	0	0	cottages	1596	\N
2536	Коттедж 90 м<sup><small>2</small></sup> на участке 15 сот. 	2536	1517592583130	\N	1	\N	0	0	cottages	1596	\N
2704	Коттедж 120 м<sup><small>2</small></sup>	2704	1517608294886	\N	1	\N	0	0	cottages	1596	\N
2705	Земля на участке 12 сот. 	2705	1517608344616	\N	1	\N	0	0	cottages	1743	\N
2868	Дом	2868	1517657839953	\N	1	\N	0	0	cottages	1595	\N
2869	Дом	2869	1517657886537	\N	1	\N	0	0	cottages	1595	\N
2928	Коттедж 300 м<sup><small>2</small></sup> на участке 9 сот. 	2928	1517671929587	\N	1	\N	0	0	cottages	1596	\N
2929	Коттедж 100 м<sup><small>2</small></sup> на участке 15 сот. 	2929	1517671978154	\N	1	\N	0	0	cottages	1596	\N
2978	Дача	2978	1517683534190	\N	1	\N	0	0	cottages	1750	\N
2979	Дача на участке 12 сот. 	2979	1517683558711	\N	1	\N	0	0	cottages	1750	\N
2980	Дача 30 м<sup><small>2</small></sup> на участке 7 сот. 	2980	1517683599212	\N	1	\N	0	0	cottages	1750	\N
2981	Дача на участке 12 сот. 	2981	1517683634501	\N	1	\N	0	0	cottages	1750	\N
2982	Земля на участке 15 сот. 	2982	1517683676830	\N	1	\N	0	0	cottages	1743	\N
2983	Земля на участке 15 сот. 	2983	1517683699301	\N	1	\N	0	0	cottages	1743	\N
2984	Земля на участке 13 сот. 	2984	1517683720672	\N	1	\N	0	0	cottages	1743	\N
2985	Земля на участке 26 сот. 	2985	1517683738085	\N	1	\N	0	0	cottages	1743	\N
3087	Земля на участке 16 сот. 	3087	1517725608490	\N	1	\N	0	0	cottages	1743	\N
3218	3-комнатные, 67 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3218	1517758802557	\N	1	\N	0	0	apartment	63	\N
3297	Дом на участке 8 сот. 	3297	1517853570146	\N	1	\N	0	0	cottages	1595	\N
3298	Дом	3298	1517853594357	\N	1	\N	0	0	cottages	1595	\N
3333	Земля на участке 5 сот. 	3333	1517856647615	\N	1	\N	0	0	cottages	1743	\N
3334	Земля	3334	1517856666144	\N	1	\N	0	0	cottages	1743	\N
3335	Земля на участке 400 сот. 	3335	1517856723408	\N	1	\N	0	0	cottages	1743	\N
3366	Дача на участке 4 сот. 	3366	1517896869290	\N	1	\N	0	0	cottages	1750	\N
3457	4-комнатные,  м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3457	1518000119513	\N	1	\N	0	0	apartment	64	\N
3458	4-комнатные, 111 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3458	1518000132621	\N	1	\N	0	0	apartment	64	\N
3459	4-комнатные, 210 м<sup><small>2</small></sup>, 7/10 - этаж/этажей	3459	1518000144505	\N	1	\N	0	0	apartment	64	\N
3460	4-комнатные, 110 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3460	1518000157785	\N	1	\N	0	0	apartment	64	\N
3461	4-комнатные, 146 м<sup><small>2</small></sup>, 7/12 - этаж/этажей	3461	1518000177487	\N	1	\N	0	0	apartment	64	\N
3462	4-комнатные, 74 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3462	1518000205118	\N	1	\N	0	0	apartment	64	\N
3463	4-комнатные, 110 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3463	1518000216480	\N	1	\N	0	0	apartment	64	\N
3511	3-комнатные, 87 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3511	1518001799579	\N	1	\N	0	0	apartment	63	\N
3512	3-комнатные, 60 м<sup><small>2</small></sup>, 4/4 - этаж/этажей	3512	1518001808153	\N	1	\N	0	0	apartment	63	\N
3849	Земля на участке 10 сот. 	3849	1518056465568	\N	1	\N	0	0	cottages	1743	\N
1832	Комнаты, 18 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	1832	1517504962550	\N	1	\N	0	0	apartment	60	\N
1833	Комнаты, 22 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	1833	1517504994403	\N	1	\N	0	0	apartment	60	\N
1834	Комнаты, 15 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	1834	1517505025835	\N	1	\N	0	0	apartment	60	\N
1835	Комнаты, 13 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	1835	1517505050476	\N	1	\N	0	0	apartment	60	\N
1923	Комнаты, 12 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	1923	1517507622417	\N	1	\N	0	0	apartment	60	\N
1924	Комнаты, 14 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	1924	1517507653434	\N	1	\N	0	0	apartment	60	\N
1925	Комнаты, 14 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	1925	1517507686494	\N	1	\N	0	0	apartment	60	\N
2057	1-комнатные, 33 м<sup><small>2</small></sup>, 7/10 - этаж/этажей	2057	1517518616123	\N	1	\N	0	0	apartment	61	\N
2194	Дом 15 м<sup><small>2</small></sup> на участке 18 сот. 	2194	1517568452316	\N	1	\N	0	0	cottages	1595	\N
2289	4-комнатные, 186 м<sup><small>2</small></sup>, 6/8 - этаж/этажей	2289	1517581012556	\N	1	\N	0	0	apartment	64	\N
2537	Коттедж 100 м<sup><small>2</small></sup> на участке 33 сот. 	2537	1517592658131	\N	1	\N	0	0	cottages	1596	\N
2706	Земля на участке 12 сот. 	2706	1517608600532	\N	1	\N	0	0	cottages	1743	\N
2707	Земля на участке 12 сот. 	2707	1517608635769	\N	1	\N	0	0	cottages	1743	\N
2708	Земля на участке 16 сот. 	2708	1517608680505	\N	1	\N	0	0	cottages	1743	\N
2870	Дом	2870	1517659222179	\N	1	\N	0	0	cottages	1595	\N
2930	Земля 240 м<sup><small>2</small></sup> на участке 15 сот. 	2930	1517672096868	\N	1	\N	0	0	cottages	1743	\N
2986	Дача	2986	1517683771407	\N	1	\N	0	0	cottages	1750	\N
2987	Дача	2987	1517683784816	\N	1	\N	0	0	cottages	1750	\N
3088	Земля	3088	1517725749904	\N	1	\N	0	0	cottages	1743	\N
3089	Земля на участке 17 сот. 	3089	1517725817740	\N	1	\N	0	0	cottages	1743	\N
3090	Земля на участке 8 сот. 	3090	1517725839134	\N	1	\N	0	0	cottages	1743	\N
3091	Земля на участке 8.5 сот. 	3091	1517725860957	\N	1	\N	0	0	cottages	1743	\N
3219	3-комнатные, 114 м<sup><small>2</small></sup>, 3/3 - этаж/этажей	3219	1517758858460	\N	1	\N	0	0	apartment	63	\N
3220	2-комнатные, 42 м<sup><small>2</small></sup>, 2/2 - этаж/этажей	3220	1517758896164	\N	1	\N	0	0	apartment	62	\N
3299	Дача на участке 7.5 сот. 	3299	1517853684975	\N	1	\N	0	0	cottages	1750	\N
3336	Земля на участке 15 сот. 	3336	1517856820495	\N	1	\N	0	0	cottages	1743	\N
3367	Земля	3367	1517897073522	\N	1	\N	0	0	cottages	1743	\N
3464	4-комнатные, 89 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3464	1518000295240	\N	1	\N	0	0	apartment	64	\N
3465	4-комнатные, 160 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3465	1518000315242	\N	1	\N	0	0	apartment	64	\N
3466	4-комнатные, 167 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3466	1518000329321	\N	1	\N	0	0	apartment	64	\N
3467	4-комнатные, 167 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3467	1518000345832	\N	1	\N	0	0	apartment	64	\N
3468	4-комнатные, 86 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3468	1518000362050	\N	1	\N	0	0	apartment	64	\N
1595	Дом	dom	1516997042501	\N	1	\N	1	0	section	\N	200
1596	Коттедж	kottedg	1516997079488	\N	1	\N	1	0	section	\N	195
1597	Таунхаус	taunhaus	1516997126434	\N	1	\N	1	0	section	\N	190
3469	4-комнатные, 71 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3469	1518000377998	\N	1	\N	0	0	apartment	64	\N
3470	4-комнатные, 105 м<sup><small>2</small></sup>, 6/12 - этаж/этажей	3470	1518000388566	\N	1	\N	0	0	apartment	64	\N
3471	4-комнатные, 753 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3471	1518000412686	\N	1	\N	0	0	apartment	64	\N
3472	4-комнатные, 105 м<sup><small>2</small></sup>, 2/13 - этаж/этажей	3472	1518000426734	\N	1	\N	0	0	apartment	64	\N
3473	4-комнатные, 76 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3473	1518000454195	\N	1	\N	0	0	apartment	64	\N
3513	3-комнатные, 59 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3513	1518001823655	\N	1	\N	0	0	apartment	63	\N
3514	3-комнатные, 82.4 м<sup><small>2</small></sup>, 5/6 - этаж/этажей	3514	1518001843718	\N	1	\N	0	0	apartment	63	\N
3515	3-комнатные, 54 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3515	1518001862823	\N	1	\N	0	0	apartment	63	\N
3536	3-комнатные, 56 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3536	1518002353272	\N	1	\N	0	0	apartment	63	\N
3537	4-комнатные, 74 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3537	1518002363236	\N	1	\N	0	0	apartment	64	\N
3538	4-комнатные, 174 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3538	1518002380629	\N	1	\N	0	0	apartment	64	\N
3539	4-комнатные, 120 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3539	1518002388003	\N	1	\N	0	0	apartment	64	\N
3540	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3540	1518002405619	\N	1	\N	0	0	apartment	63	\N
1926	Складское помещение, 2000 м<sup><small>2</small></sup>	1926	1517507688730	\N	1	\N	0	0	commercial	1893	\N
2195	Дом 100 м<sup><small>2</small></sup> на участке 60 сот. 	2195	1517568525324	\N	1	\N	0	0	cottages	1595	\N
2196	Дом 58 м<sup><small>2</small></sup> на участке 10 сот. 	2196	1517568552309	\N	1	\N	0	0	cottages	1595	\N
2290	4-комнатные, 120 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2290	1517581136149	\N	1	\N	0	0	apartment	64	\N
2291	4-комнатные, 82 м<sup><small>2</small></sup>, 8/10 - этаж/этажей	2291	1517581163143	\N	1	\N	0	0	apartment	64	\N
2292	4-комнатные, 74 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2292	1517581189802	\N	1	\N	0	0	apartment	64	\N
2293	4-комнатные, 83 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2293	1517581207963	\N	1	\N	0	0	apartment	64	\N
2538	Коттедж на участке 20 сот. 	2538	1517592710142	\N	1	\N	0	0	cottages	1596	\N
2539	Коттедж 91 м<sup><small>2</small></sup> на участке 24 сот. 	2539	1517592753900	\N	1	\N	0	0	cottages	1596	\N
2709	Земля на участке 15 сот. 	2709	1517608896664	\N	1	\N	0	0	cottages	1743	\N
2710	Земля	2710	1517608938117	\N	1	\N	0	0	cottages	1743	\N
3477	4-комнатные, 176 м<sup><small>2</small></sup>, 7/10 - этаж/этажей	3477	1518000617867	\N	1	\N	0	0	apartment	64	\N
2711	Земля на участке 55 сот. 	2711	1517608985395	\N	1	\N	0	0	cottages	1743	\N
2871	Дом	2871	1517659297002	\N	1	\N	0	0	cottages	1595	\N
2872	Дом	2872	1517659321502	\N	1	\N	0	0	cottages	1595	\N
2931	Коттедж 75 м<sup><small>2</small></sup> на участке 7 сот. 	2931	1517673670296	\N	1	\N	0	0	cottages	1596	\N
2988	Дача 25 м<sup><small>2</small></sup> на участке 9 сот. 	2988	1517683830369	\N	1	\N	0	0	cottages	1750	\N
2989	Земля на участке 15 сот. 	2989	1517683859282	\N	1	\N	0	0	cottages	1743	\N
2990	Земля на участке 12 сот. 	2990	1517683897830	\N	1	\N	0	0	cottages	1743	\N
3092	Земля на участке 17 сот. 	3092	1517725995979	\N	1	\N	0	0	cottages	1743	\N
3221	2-комнатные, 57 м<sup><small>2</small></sup>, 7/10 - этаж/этажей	3221	1517760107397	\N	1	\N	0	0	apartment	62	\N
3222	2-комнатные, 50.9 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3222	1517760150026	\N	1	\N	0	0	apartment	62	\N
3300	Дача 77 м<sup><small>2</small></sup>	3300	1517854024578	\N	1	\N	0	0	cottages	1750	\N
3337	Земля на участке 15 сот. 	3337	1517856892632	\N	1	\N	0	0	cottages	1743	\N
3368	Производственное помещение	3368	1517897682340	\N	1	\N	0	0	commercial	1876	\N
3474	4-комнатные, 86 м<sup><small>2</small></sup>, 0/0 - этаж/этажей	3474	1518000553964	\N	1	\N	0	0	apartment	64	\N
3475	4-комнатные,  м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3475	1518000579767	\N	1	\N	0	0	apartment	64	\N
3476	4-комнатные, 76 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3476	1518000592616	\N	1	\N	0	0	apartment	64	\N
3478	4-комнатные, 180 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	3478	1518000640666	\N	1	\N	0	0	apartment	64	\N
3479	4-комнатные,  м<sup><small>2</small></sup>, 11/11 - этаж/этажей	3479	1518000655232	\N	1	\N	0	0	apartment	64	\N
3480	4-комнатные, 124 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3480	1518000671190	\N	1	\N	0	0	apartment	64	\N
3516	3-комнатные, 65 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3516	1518001896212	\N	1	\N	0	0	apartment	63	\N
3517	3-комнатные, 65 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3517	1518001908289	\N	1	\N	0	0	apartment	63	\N
3518	3-комнатные, 72 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3518	1518001917842	\N	1	\N	0	0	apartment	63	\N
3519	3-комнатные, 111 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3519	1518001935979	\N	1	\N	0	0	apartment	63	\N
3520	3-комнатные, 86 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3520	1518001948977	\N	1	\N	0	0	apartment	63	\N
3521	3-комнатные, 60 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3521	1518001971552	\N	1	\N	0	0	apartment	63	\N
3522	3-комнатные, 59 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3522	1518001981278	\N	1	\N	0	0	apartment	63	\N
3523	3-комнатные, 65 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3523	1518001995172	\N	1	\N	0	0	apartment	63	\N
3524	3-комнатные, 86 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3524	1518002002663	\N	1	\N	0	0	apartment	63	\N
3525	3-комнатные, 55 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3525	1518002017542	\N	1	\N	0	0	apartment	63	\N
3541	3-комнатные, 132 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3541	1518002418329	\N	1	\N	0	0	apartment	63	\N
3542	3-комнатные, 59 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3542	1518002426894	\N	1	\N	0	0	apartment	63	\N
3543	3-комнатные, 100 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3543	1518002441186	\N	1	\N	0	0	apartment	63	\N
3544	3-комнатные, 65 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3544	1518002455706	\N	1	\N	0	0	apartment	63	\N
3545	3-комнатные, 87 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3545	1518002470971	\N	1	\N	0	0	apartment	63	\N
3546	4-комнатные, 140 м<sup><small>2</small></sup>, 10/12 - этаж/этажей	3546	1518002497011	\N	1	\N	0	0	apartment	64	\N
1927	Комнаты, 24 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	1927	1517507714563	\N	1	\N	0	0	apartment	60	\N
1929	Комнаты, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	1929	1517507736210	\N	1	\N	0	0	apartment	60	\N
1931	Комнаты, 28 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	1931	1517507763504	\N	1	\N	0	0	apartment	60	\N
1933	Комнаты, 18 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	1933	1517507783324	\N	1	\N	0	0	apartment	60	\N
1934	Комнаты, 18 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	1934	1517507802897	\N	1	\N	0	0	apartment	60	\N
2197	Дом	2197	1517568837315	\N	1	\N	0	0	cottages	1595	\N
2294	4-комнатные, 116 м<sup><small>2</small></sup>, 4/10 - этаж/этажей	2294	1517581245268	\N	1	\N	0	0	apartment	64	\N
2295	4-комнатные, 81 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2295	1517581281821	\N	1	\N	0	0	apartment	64	\N
2296	4-комнатные, 79 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	2296	1517581300642	\N	1	\N	0	0	apartment	64	\N
2297	4-комнатные, 111 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2297	1517581314374	\N	1	\N	0	0	apartment	64	\N
2298	4-комнатные, 72 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	2298	1517581333333	\N	1	\N	0	0	apartment	64	\N
2299	4-комнатные, 74 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2299	1517581358185	\N	1	\N	0	0	apartment	64	\N
2300	4-комнатные, 76 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2300	1517581376587	\N	1	\N	0	0	apartment	64	\N
2301	4-комнатные, 82 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2301	1517581402155	\N	1	\N	0	0	apartment	64	\N
2302	4-комнатные, 86 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2302	1517581419740	\N	1	\N	0	0	apartment	64	\N
2303	4-комнатные, 83 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2303	1517581444072	\N	1	\N	0	0	apartment	64	\N
2304	4-комнатные,  м<sup><small>2</small></sup>, 12/12 - этаж/этажей	2304	1517581462012	\N	1	\N	0	0	apartment	64	\N
2305	4-комнатные, 74 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2305	1517581475806	\N	1	\N	0	0	apartment	64	\N
2306	4-комнатные, 74 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2306	1517581496368	\N	1	\N	0	0	apartment	64	\N
2307	4-комнатные,  м<sup><small>2</small></sup>, 2/13 - этаж/этажей	2307	1517581517137	\N	1	\N	0	0	apartment	64	\N
2308	4-комнатные, 84 м<sup><small>2</small></sup>, 10/12 - этаж/этажей	2308	1517581540904	\N	1	\N	0	0	apartment	64	\N
2309	4-комнатные,  м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2309	1517581558827	\N	1	\N	0	0	apartment	64	\N
2310	4-комнатные, 120 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	2310	1517581577179	\N	1	\N	0	0	apartment	64	\N
2311	4-комнатные, 120 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2311	1517581586874	\N	1	\N	0	0	apartment	64	\N
2312	4-комнатные, 118 м<sup><small>2</small></sup>, 5/7 - этаж/этажей	2312	1517581597112	\N	1	\N	0	0	apartment	64	\N
2313	4-комнатные, 110 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2313	1517581610968	\N	1	\N	0	0	apartment	64	\N
2314	4-комнатные, 95 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	2314	1517581624653	\N	1	\N	0	0	apartment	64	\N
2315	4-комнатные, 110 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2315	1517581636239	\N	1	\N	0	0	apartment	64	\N
2316	4-комнатные, 110 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	2316	1517581650165	\N	1	\N	0	0	apartment	64	\N
2317	4-комнатные, 120 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	2317	1517581661512	\N	1	\N	0	0	apartment	64	\N
2318	4-комнатные, 110 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	2318	1517581674626	\N	1	\N	0	0	apartment	64	\N
2319	4-комнатные, 111 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	2319	1517581706823	\N	1	\N	0	0	apartment	64	\N
2320	4-комнатные, 105 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	2320	1517581718159	\N	1	\N	0	0	apartment	64	\N
2321	4-комнатные, 86 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	2321	1517581737665	\N	1	\N	0	0	apartment	64	\N
2540	Коттедж 307 м<sup><small>2</small></sup> на участке 14 сот. 	2540	1517592832164	\N	1	\N	0	0	cottages	1596	\N
2932	Коттедж 80 м<sup><small>2</small></sup> на участке 8 сот. 	2932	1517673713148	\N	1	\N	0	0	cottages	1596	\N
2712	Земля на участке 17 сот. 	2712	1517609080736	\N	1	\N	0	0	cottages	1743	\N
2873	Дом 53 м<sup><small>2</small></sup> на участке 31 сот. 	2873	1517659831448	\N	1	\N	0	0	cottages	1595	\N
2933	Коттедж 103 м<sup><small>2</small></sup> на участке 30 сот. 	2933	1517673787159	\N	1	\N	0	0	cottages	1596	\N
2934	Земля на участке 32 сот. 	2934	1517673836959	\N	1	\N	0	0	cottages	1743	\N
2935	Коттедж	2935	1517673869756	\N	1	\N	0	0	cottages	1596	\N
2991	Земля на участке 12 сот. 	2991	1517684030134	\N	1	\N	0	0	cottages	1743	\N
2992	Земля на участке 12 сот. 	2992	1517684058640	\N	1	\N	0	0	cottages	1743	\N
2993	Земля на участке 8 сот. 	2993	1517684088962	\N	1	\N	0	0	cottages	1743	\N
2994	Земля на участке 13 сот. 	2994	1517684120018	\N	1	\N	0	0	cottages	1743	\N
2995	Земля на участке 11.5 сот. 	2995	1517684145204	\N	1	\N	0	0	cottages	1743	\N
2996	Земля на участке 12 сот. 	2996	1517684192676	\N	1	\N	0	0	cottages	1743	\N
1928	Гараж, 18 м<sup><small>2</small></sup>	1928	1517507716988	\N	1	\N	0	0	commercial	1765	\N
1930	Гараж	1930	1517507745723	\N	1	\N	0	0	commercial	1765	\N
1932	Гараж, 18 м<sup><small>2</small></sup>	1932	1517507781733	\N	1	\N	0	0	commercial	1765	\N
2198	Дом 52.3 м<sup><small>2</small></sup> на участке 20 сот. 	2198	1517568926334	\N	1	\N	0	0	cottages	1595	\N
2199	Дом на участке 15 сот. 	2199	1517568958320	\N	1	\N	0	0	cottages	1595	\N
2200	Дом 100 м<sup><small>2</small></sup> на участке 18 сот. 	2200	1517568984313	\N	1	\N	0	0	cottages	1595	\N
1743	Земля	zemelnie-uchastki	1517304099039	1517575958293	1	1	1	0	section	\N	180
1750	Дача	dachi	1517307687761	1517575977056	1	1	1	0	section	\N	175
2322	4-комнатные, 108 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	2322	1517581804375	\N	1	\N	0	0	apartment	64	\N
2323	4-комнатные, 120 м<sup><small>2</small></sup>, 3/10 - этаж/этажей	2323	1517581823584	\N	1	\N	0	0	apartment	64	\N
2324	4-комнатные, 74 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2324	1517581845627	\N	1	\N	0	0	apartment	64	\N
2325	4-комнатные, 187 м<sup><small>2</small></sup>, 2/6 - этаж/этажей	2325	1517581866339	\N	1	\N	0	0	apartment	64	\N
2326	4-комнатные, 119 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	2326	1517581892157	\N	1	\N	0	0	apartment	64	\N
2327	4-комнатные, 110 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	2327	1517581922950	\N	1	\N	0	0	apartment	64	\N
2328	4-комнатные, 86 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	2328	1517581942101	\N	1	\N	0	0	apartment	64	\N
2541	Коттедж 635 м<sup><small>2</small></sup> на участке 15 сот. 	2541	1517592873160	\N	1	\N	0	0	cottages	1596	\N
2542	Коттедж	2542	1517592907134	\N	1	\N	0	0	cottages	1596	\N
2713	Земля на участке 17 сот. 	2713	1517609157887	\N	1	\N	0	0	cottages	1743	\N
2714	Земля на участке 12 сот. 	2714	1517609199812	\N	1	\N	0	0	cottages	1743	\N
2874	Дом	2874	1517660216444	\N	1	\N	0	0	cottages	1595	\N
2936	Коттедж 150 м<sup><small>2</small></sup>	2936	1517674310010	\N	1	\N	0	0	cottages	1596	\N
2997	Земля на участке 12 сот. 	2997	1517684256371	\N	1	\N	0	0	cottages	1743	\N
2998	Земля на участке 12 сот. 	2998	1517684281982	\N	1	\N	0	0	cottages	1743	\N
2999	Земля на участке 12 сот. 	2999	1517684347804	\N	1	\N	0	0	cottages	1743	\N
3093	Земля на участке 8 сот. 	3093	1517726181678	\N	1	\N	0	0	cottages	1743	\N
3223	1-комнатные, 35 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3223	1517760497149	\N	1	\N	0	0	apartment	61	\N
1739	АН Дом советов & партнеры	an-dom-sovetov	1517302094534	1517302257638	1	1	\N	\N	agency	\N	17
3301	Земля на участке 18 сот. 	3301	1517854090087	\N	1	\N	0	0	cottages	1743	\N
3302	Дача на участке 7 сот. 	3302	1517854124438	\N	1	\N	0	0	cottages	1750	\N
3338	Земля на участке 15 сот. 	3338	1517856959670	\N	1	\N	0	0	cottages	1743	\N
3369	Гостиница, 457 м<sup><small>2</small></sup>	3369	1517899378237	\N	1	\N	0	0	commercial	1764	\N
3481	4-комнатные, 252 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3481	1518000712375	\N	1	\N	0	0	apartment	64	\N
3482	4-комнатные, 170 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3482	1518000736547	\N	1	\N	0	0	apartment	64	\N
3483	4-комнатные, 78 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3483	1518000752672	\N	1	\N	0	0	apartment	64	\N
3484	4-комнатные, 76 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3484	1518000766287	\N	1	\N	0	0	apartment	64	\N
3485	4-комнатные, 120 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3485	1518000774011	\N	1	\N	0	0	apartment	64	\N
3526	3-комнатные, 71 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3526	1518002064060	\N	1	\N	0	0	apartment	63	\N
3527	3-комнатные, 66 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3527	1518002079594	\N	1	\N	0	0	apartment	63	\N
3528	3-комнатные, 120 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	3528	1518002105478	\N	1	\N	0	0	apartment	63	\N
3529	3-комнатные, 68 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3529	1518002151928	\N	1	\N	0	0	apartment	63	\N
3547	4-комнатные, 120 м<sup><small>2</small></sup>, 4/10 - этаж/этажей	3547	1518002513524	\N	1	\N	0	0	apartment	64	\N
3548	4-комнатные, 80 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3548	1518002544481	\N	1	\N	0	0	apartment	64	\N
3549	3-комнатные, 59 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3549	1518002555084	\N	1	\N	0	0	apartment	63	\N
3550	3-комнатные, 75 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3550	1518002571939	\N	1	\N	0	0	apartment	63	\N
3551	3-комнатные, 84 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3551	1518002589905	\N	1	\N	0	0	apartment	63	\N
3552	3-комнатные, 61 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3552	1518002614473	\N	1	\N	0	0	apartment	63	\N
3553	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3553	1518002642620	\N	1	\N	0	0	apartment	61	\N
3554	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3554	1518002658932	\N	1	\N	0	0	apartment	61	\N
3556	1-комнатные, 29 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3556	1518002782409	\N	1	\N	0	0	apartment	61	\N
3564	3-комнатные,  м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3564	1518003034891	\N	1	\N	0	0	apartment	63	\N
3565	3-комнатные, 71 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3565	1518003068074	\N	1	\N	0	0	apartment	63	\N
3566	3-комнатные, 60 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3566	1518003096147	\N	1	\N	0	0	apartment	63	\N
3567	3-комнатные, 103 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3567	1518003113214	\N	1	\N	0	0	apartment	63	\N
3568	3-комнатные,  м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3568	1518003126549	\N	1	\N	0	0	apartment	63	\N
3569	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3569	1518003141218	\N	1	\N	0	0	apartment	63	\N
3570	3-комнатные, 63 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3570	1518003165433	\N	1	\N	0	0	apartment	63	\N
3571	3-комнатные, 65 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3571	1518003178521	\N	1	\N	0	0	apartment	63	\N
3572	3-комнатные, 56. м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3572	1518003201004	\N	1	\N	0	0	apartment	63	\N
3573	3-комнатные, 56. м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3573	1518003227464	\N	1	\N	0	0	apartment	63	\N
3574	3-комнатные, 80 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3574	1518003252739	\N	1	\N	0	0	apartment	63	\N
3575	3-комнатные, 68 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	3575	1518003279750	\N	1	\N	0	0	apartment	63	\N
3576	3-комнатные, 57 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3576	1518004720248	\N	1	\N	0	0	apartment	63	\N
3577	3-комнатные, 80 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3577	1518004739805	\N	1	\N	0	0	apartment	63	\N
3578	3-комнатные, 95 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3578	1518004759273	\N	1	\N	0	0	apartment	63	\N
3579	3-комнатные, 66 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3579	1518006456705	\N	1	\N	0	0	apartment	63	\N
3580	3-комнатные, 56 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3580	1518006495315	\N	1	\N	0	0	apartment	63	\N
3581	3-комнатные, 93 м<sup><small>2</small></sup>, 8/12 - этаж/этажей	3581	1518006584852	\N	1	\N	0	0	apartment	63	\N
3582	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3582	1518007686975	\N	1	\N	0	0	apartment	63	\N
3583	3-комнатные, 61.5 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3583	1518007699184	\N	1	\N	0	0	apartment	63	\N
3584	3-комнатные, 62 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3584	1518007718767	\N	1	\N	0	0	apartment	63	\N
3585	3-комнатные, 90 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3585	1518007738079	\N	1	\N	0	0	apartment	63	\N
3586	3-комнатные, 83 м<sup><small>2</small></sup>, 2/10 - этаж/этажей	3586	1518007755416	\N	1	\N	0	0	apartment	63	\N
3587	3-комнатные, 66 м<sup><small>2</small></sup>, 7/7 - этаж/этажей	3587	1518007763848	\N	1	\N	0	0	apartment	63	\N
3588	3-комнатные, 110 м<sup><small>2</small></sup>, 8/12 - этаж/этажей	3588	1518007774124	\N	1	\N	0	0	apartment	63	\N
3589	3-комнатные, 140 м<sup><small>2</small></sup>, 12/12 - этаж/этажей	3589	1518007815267	\N	1	\N	0	0	apartment	63	\N
3590	3-комнатные,  м<sup><small>2</small></sup>, 0/0 - этаж/этажей	3590	1518007866979	\N	1	\N	0	0	apartment	63	\N
3591	3-комнатные, 58 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3591	1518008337880	\N	1	\N	0	0	apartment	63	\N
3592	1-комнатные, 39 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3592	1518008477397	\N	1	\N	0	0	apartment	61	\N
3593	1-комнатные, 28 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3593	1518008795807	\N	1	\N	0	0	apartment	61	\N
3594	1-комнатные, 45 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3594	1518008878478	\N	1	\N	0	0	apartment	61	\N
3595	1-комнатные, 36 м<sup><small>2</small></sup>, 3/12 - этаж/этажей	3595	1518008899522	\N	1	\N	0	0	apartment	61	\N
3596	1-комнатные, 30 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3596	1518008924939	\N	1	\N	0	0	apartment	61	\N
3597	1-комнатные, 36 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	3597	1518008946680	\N	1	\N	0	0	apartment	61	\N
3598	3-комнатные, 71 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3598	1518008973925	\N	1	\N	0	0	apartment	63	\N
3599	3-комнатные, 59 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3599	1518008988388	\N	1	\N	0	0	apartment	63	\N
3600	3-комнатные, 65 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3600	1518008998170	\N	1	\N	0	0	apartment	63	\N
3601	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3601	1518009007341	\N	1	\N	0	0	apartment	63	\N
3602	3-комнатные, 79 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3602	1518009019590	\N	1	\N	0	0	apartment	63	\N
3603	3-комнатные, 58 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3603	1518009029565	\N	1	\N	0	0	apartment	63	\N
3604	3-комнатные, 62 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	3604	1518009040259	\N	1	\N	0	0	apartment	63	\N
3605	3-комнатные, 66 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3605	1518009047843	\N	1	\N	0	0	apartment	63	\N
3606	3-комнатные, 59 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3606	1518009074092	\N	1	\N	0	0	apartment	63	\N
3854	Дача	3854	1518056749322	\N	1	\N	0	0	cottages	1750	\N
3607	3-комнатные, 59 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3607	1518009082954	\N	1	\N	0	0	apartment	63	\N
3608	3-комнатные,  м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3608	1518009100370	\N	1	\N	0	0	apartment	63	\N
3609	3-комнатные, 59 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3609	1518009110421	\N	1	\N	0	0	apartment	63	\N
3610	3-комнатные, 56 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3610	1518009122798	\N	1	\N	0	0	apartment	63	\N
3611	1-комнатные, 40 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3611	1518027461744	\N	1	\N	0	0	apartment	61	\N
3612	3-комнатные, 65.6 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3612	1518027495736	\N	1	\N	0	0	apartment	63	\N
3613	3-комнатные, 78 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3613	1518027541562	\N	1	\N	0	0	apartment	63	\N
3614	3-комнатные, 60 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3614	1518027568111	\N	1	\N	0	0	apartment	63	\N
3615	3-комнатные, 60 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3615	1518027593334	\N	1	\N	0	0	apartment	63	\N
3616	3-комнатные, 66 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3616	1518027641077	\N	1	\N	0	0	apartment	63	\N
3617	3-комнатные, 102 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	3617	1518027655943	\N	1	\N	0	0	apartment	63	\N
3618	3-комнатные, 56 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3618	1518027669342	\N	1	\N	0	0	apartment	63	\N
3619	3-комнатные, 74 м<sup><small>2</small></sup>, 4/6 - этаж/этажей	3619	1518027686926	\N	1	\N	0	0	apartment	63	\N
3620	3-комнатные, 66 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3620	1518027710005	\N	1	\N	0	0	apartment	63	\N
3621	3-комнатные,  м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3621	1518027737915	\N	1	\N	0	0	apartment	63	\N
3622	3-комнатные, 94 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3622	1518027791735	\N	1	\N	0	0	apartment	63	\N
3623	3-комнатные, 52 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3623	1518027821820	\N	1	\N	0	0	apartment	63	\N
3624	3-комнатные, 65 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	3624	1518027908744	\N	1	\N	0	0	apartment	63	\N
3625	3-комнатные, 72 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3625	1518027932821	\N	1	\N	0	0	apartment	63	\N
3626	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3626	1518027947744	\N	1	\N	0	0	apartment	63	\N
3627	3-комнатные, 59 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3627	1518027973447	\N	1	\N	0	0	apartment	63	\N
3628	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3628	1518028007391	\N	1	\N	0	0	apartment	63	\N
3629	3-комнатные, 95 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3629	1518028050687	\N	1	\N	0	0	apartment	63	\N
3630	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3630	1518028074508	\N	1	\N	0	0	apartment	62	\N
3631	2-комнатные, 42 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3631	1518028087390	\N	1	\N	0	0	apartment	62	\N
3632	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3632	1518028110426	\N	1	\N	0	0	apartment	62	\N
3633	2-комнатные, 47 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3633	1518028125204	\N	1	\N	0	0	apartment	62	\N
3634	2-комнатные, 45 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3634	1518028462947	\N	1	\N	0	0	apartment	62	\N
3635	2-комнатные, 54 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3635	1518028537667	\N	1	\N	0	0	apartment	62	\N
3636	2-комнатные, 63 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3636	1518028586783	\N	1	\N	0	0	apartment	62	\N
3637	3-комнатные, 59 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3637	1518028601317	\N	1	\N	0	0	apartment	63	\N
3638	3-комнатные, 67.3 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3638	1518028631675	\N	1	\N	0	0	apartment	63	\N
3639	3-комнатные, 58.2 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3639	1518028656042	\N	1	\N	0	0	apartment	63	\N
3640	3-комнатные, 60 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3640	1518028666017	\N	1	\N	0	0	apartment	63	\N
3641	3-комнатные, 57 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3641	1518028695717	\N	1	\N	0	0	apartment	63	\N
3642	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3642	1518028705316	\N	1	\N	0	0	apartment	63	\N
3643	3-комнатные, 65 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3643	1518028733065	\N	1	\N	0	0	apartment	63	\N
3644	3-комнатные, 76 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3644	1518028769465	\N	1	\N	0	0	apartment	63	\N
3645	3-комнатные, 67 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3645	1518028789353	\N	1	\N	0	0	apartment	63	\N
3646	3-комнатные, 59 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3646	1518028804527	\N	1	\N	0	0	apartment	63	\N
3647	3-комнатные, 150 м<sup><small>2</small></sup>, 7/11 - этаж/этажей	3647	1518028815817	\N	1	\N	0	0	apartment	63	\N
3648	3-комнатные, 150 м<sup><small>2</small></sup>, 11/11 - этаж/этажей	3648	1518028828653	\N	1	\N	0	0	apartment	63	\N
3649	3-комнатные, 65 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3649	1518028844140	\N	1	\N	0	0	apartment	63	\N
3867	Дом	3867	1518057557701	\N	1	\N	0	0	cottages	1595	\N
3650	3-комнатные, 113 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3650	1518028864362	\N	1	\N	0	0	apartment	63	\N
3651	3-комнатные, 170 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3651	1518028892386	\N	1	\N	0	0	apartment	63	\N
3652	3-комнатные, 130 м<sup><small>2</small></sup>, 5/7 - этаж/этажей	3652	1518028907560	\N	1	\N	0	0	apartment	63	\N
3653	3-комнатные, 110 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3653	1518028937361	\N	1	\N	0	0	apartment	63	\N
3654	3-комнатные, 59 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3654	1518028957721	\N	1	\N	0	0	apartment	63	\N
3655	3-комнатные, 74 м<sup><small>2</small></sup>, 10/14 - этаж/этажей	3655	1518028979299	\N	1	\N	0	0	apartment	63	\N
3656	3-комнатные, 59 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3656	1518029002143	\N	1	\N	0	0	apartment	63	\N
3657	3-комнатные, 71 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3657	1518029021926	\N	1	\N	0	0	apartment	63	\N
3658	3-комнатные, 65 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3658	1518029035287	\N	1	\N	0	0	apartment	63	\N
3659	3-комнатные, 67 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3659	1518029106978	\N	1	\N	0	0	apartment	63	\N
3660	3-комнатные, 69 м<sup><small>2</small></sup>, 6/6 - этаж/этажей	3660	1518029130944	\N	1	\N	0	0	apartment	63	\N
3661	3-комнатные,  м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3661	1518029147624	\N	1	\N	0	0	apartment	63	\N
3662	2-комнатные, 48 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3662	1518029172991	\N	1	\N	0	0	apartment	62	\N
3663	2-комнатные, 52 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3663	1518029185568	\N	1	\N	0	0	apartment	62	\N
3664	2-комнатные, 48 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	3664	1518029200298	\N	1	\N	0	0	apartment	62	\N
3665	2-комнатные, 50 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3665	1518029221933	\N	1	\N	0	0	apartment	62	\N
3666	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3666	1518029237263	\N	1	\N	0	0	apartment	62	\N
3667	3-комнатные, 69 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3667	1518029269340	\N	1	\N	0	0	apartment	63	\N
3668	2-комнатные, 60 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3668	1518029497295	\N	1	\N	0	0	apartment	62	\N
3669	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3669	1518029509846	\N	1	\N	0	0	apartment	62	\N
3670	2-комнатные, 57 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3670	1518029524022	\N	1	\N	0	0	apartment	62	\N
3671	2-комнатные, 42 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3671	1518029536918	\N	1	\N	0	0	apartment	62	\N
3672	2-комнатные, 54 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	3672	1518029548508	\N	1	\N	0	0	apartment	62	\N
3673	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3673	1518029569770	\N	1	\N	0	0	apartment	62	\N
3674	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3674	1518029581089	\N	1	\N	0	0	apartment	62	\N
3675	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3675	1518029599954	\N	1	\N	0	0	apartment	62	\N
3676	2-комнатные, 52 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3676	1518029648353	\N	1	\N	0	0	apartment	62	\N
3677	2-комнатные, 62 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3677	1518029664285	\N	1	\N	0	0	apartment	62	\N
3678	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3678	1518029676438	\N	1	\N	0	0	apartment	62	\N
3679	2-комнатные, 75 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3679	1518029698034	\N	1	\N	0	0	apartment	62	\N
3680	2-комнатные, 48 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3680	1518029726908	\N	1	\N	0	0	apartment	62	\N
3681	2-комнатные, 51 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3681	1518029771017	\N	1	\N	0	0	apartment	62	\N
3682	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3682	1518029801074	\N	1	\N	0	0	apartment	62	\N
3683	2-комнатные, 42 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3683	1518029813076	\N	1	\N	0	0	apartment	62	\N
3684	2-комнатные, 70 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	3684	1518029849274	\N	1	\N	0	0	apartment	62	\N
3685	2-комнатные, 50 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3685	1518029870664	\N	1	\N	0	0	apartment	62	\N
3686	2-комнатные, 56 м<sup><small>2</small></sup>, 4/10 - этаж/этажей	3686	1518029894141	\N	1	\N	0	0	apartment	62	\N
3687	2-комнатные, 50 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3687	1518029907055	\N	1	\N	0	0	apartment	62	\N
3688	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3688	1518029920027	\N	1	\N	0	0	apartment	62	\N
3689	2-комнатные, 46 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3689	1518029952102	\N	1	\N	0	0	apartment	62	\N
3690	2-комнатные, 42 м<sup><small>2</small></sup>, 4/4 - этаж/этажей	3690	1518029964401	\N	1	\N	0	0	apartment	62	\N
3691	2-комнатные, 63 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3691	1518029971706	\N	1	\N	0	0	apartment	62	\N
3692	2-комнатные, 52 м<sup><small>2</small></sup>, 7/7 - этаж/этажей	3692	1518029981272	\N	1	\N	0	0	apartment	62	\N
3693	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3693	1518030003671	\N	1	\N	0	0	apartment	62	\N
3694	2-комнатные, 46 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3694	1518030014884	\N	1	\N	0	0	apartment	62	\N
3695	2-комнатные, 46 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3695	1518030033717	\N	1	\N	0	0	apartment	62	\N
3696	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3696	1518030051480	\N	1	\N	0	0	apartment	62	\N
3697	2-комнатные,  м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3697	1518030107755	\N	1	\N	0	0	apartment	62	\N
3698	2-комнатные,  м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3698	1518030145332	\N	1	\N	0	0	apartment	62	\N
3699	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3699	1518030326990	\N	1	\N	0	0	apartment	62	\N
3700	2-комнатные, 43 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3700	1518030339551	\N	1	\N	0	0	apartment	62	\N
3701	2-комнатные, 53 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3701	1518030357314	\N	1	\N	0	0	apartment	62	\N
3702	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3702	1518030394829	\N	1	\N	0	0	apartment	62	\N
3703	2-комнатные, 48 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3703	1518030409775	\N	1	\N	0	0	apartment	62	\N
3704	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3704	1518030453247	\N	1	\N	0	0	apartment	62	\N
3705	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3705	1518030471731	\N	1	\N	0	0	apartment	62	\N
3706	2-комнатные, 49 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3706	1518030478537	\N	1	\N	0	0	apartment	62	\N
3707	2-комнатные, 50 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3707	1518030491685	\N	1	\N	0	0	apartment	62	\N
3708	2-комнатные, 48 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3708	1518030504305	\N	1	\N	0	0	apartment	62	\N
3709	2-комнатные, 48 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3709	1518030524615	\N	1	\N	0	0	apartment	62	\N
3710	2-комнатные, 100 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3710	1518030559017	\N	1	\N	0	0	apartment	62	\N
3711	2-комнатные, 100 м<sup><small>2</small></sup>, 10/12 - этаж/этажей	3711	1518030573125	\N	1	\N	0	0	apartment	62	\N
3712	2-комнатные, 48 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3712	1518030593488	\N	1	\N	0	0	apartment	62	\N
3713	2-комнатные, 45 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3713	1518030657753	\N	1	\N	0	0	apartment	62	\N
3714	2-комнатные, 100 м<sup><small>2</small></sup>, 8/12 - этаж/этажей	3714	1518030674774	\N	1	\N	0	0	apartment	62	\N
3715	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3715	1518030686327	\N	1	\N	0	0	apartment	62	\N
3716	2-комнатные, 43 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3716	1518030713023	\N	1	\N	0	0	apartment	62	\N
3717	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3717	1518030723051	\N	1	\N	0	0	apartment	62	\N
3718	2-комнатные, 38 м<sup><small>2</small></sup>, 10/12 - этаж/этажей	3718	1518030745600	\N	1	\N	0	0	apartment	62	\N
3719	2-комнатные, 48 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3719	1518030772947	\N	1	\N	0	0	apartment	62	\N
3720	2-комнатные, 86 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3720	1518030787726	\N	1	\N	0	0	apartment	62	\N
3721	2-комнатные, 46 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3721	1518030797838	\N	1	\N	0	0	apartment	62	\N
3722	2-комнатные, 44.8 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3722	1518030814000	\N	1	\N	0	0	apartment	62	\N
3723	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3723	1518030898979	\N	1	\N	0	0	apartment	62	\N
3724	2-комнатные, 45 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3724	1518030915920	\N	1	\N	0	0	apartment	62	\N
3725	2-комнатные, 45 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3725	1518030937969	\N	1	\N	0	0	apartment	62	\N
3726	2-комнатные, 44.5 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3726	1518030959014	\N	1	\N	0	0	apartment	62	\N
3727	2-комнатные, 45 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3727	1518031001803	\N	1	\N	0	0	apartment	62	\N
3728	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3728	1518031013903	\N	1	\N	0	0	apartment	62	\N
3729	2-комнатные,  м<sup><small>2</small></sup>, 1/12 - этаж/этажей	3729	1518031048387	\N	1	\N	0	0	apartment	62	\N
3730	2-комнатные, 58 м<sup><small>2</small></sup>, 9/10 - этаж/этажей	3730	1518031063126	\N	1	\N	0	0	apartment	62	\N
3731	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3731	1518031076108	\N	1	\N	0	0	apartment	62	\N
3732	2-комнатные, 46 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3732	1518031108710	\N	1	\N	0	0	apartment	62	\N
3733	2-комнатные, 48 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3733	1518031177554	\N	1	\N	0	0	apartment	62	\N
3734	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3734	1518031209394	\N	1	\N	0	0	apartment	62	\N
3735	2-комнатные, 48 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3735	1518031223318	\N	1	\N	0	0	apartment	62	\N
3870	Дом	3870	1518057704097	\N	1	\N	0	0	cottages	1595	\N
3736	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3736	1518031253028	\N	1	\N	0	0	apartment	62	\N
3737	2-комнатные, 48 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3737	1518031278939	\N	1	\N	0	0	apartment	62	\N
3738	2-комнатные, 45 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3738	1518031298204	\N	1	\N	0	0	apartment	62	\N
3739	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3739	1518031316410	\N	1	\N	0	0	apartment	62	\N
3740	2-комнатные, 48 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3740	1518031353456	\N	1	\N	0	0	apartment	62	\N
3741	2-комнатные, 80 м<sup><small>2</small></sup>, 4/12 - этаж/этажей	3741	1518031364626	\N	1	\N	0	0	apartment	62	\N
3742	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3742	1518031388198	\N	1	\N	0	0	apartment	62	\N
3743	2-комнатные, 48 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3743	1518031416765	\N	1	\N	0	0	apartment	62	\N
3744	2-комнатные,  м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3744	1518031436962	\N	1	\N	0	0	apartment	62	\N
3745	2-комнатные, 46 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3745	1518031458083	\N	1	\N	0	0	apartment	62	\N
3746	2-комнатные, 50 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3746	1518031470912	\N	1	\N	0	0	apartment	62	\N
3747	2-комнатные, 63 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3747	1518031509238	\N	1	\N	0	0	apartment	62	\N
3748	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3748	1518031540418	\N	1	\N	0	0	apartment	62	\N
3749	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3749	1518031551277	\N	1	\N	0	0	apartment	62	\N
3750	2-комнатные, 42 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3750	1518031566898	\N	1	\N	0	0	apartment	62	\N
3751	2-комнатные,  м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3751	1518031621417	\N	1	\N	0	0	apartment	62	\N
3752	2-комнатные,  м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3752	1518031655931	\N	1	\N	0	0	apartment	62	\N
3753	2-комнатные,  м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3753	1518031689416	\N	1	\N	0	0	apartment	62	\N
3754	2-комнатные, 42 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3754	1518031703008	\N	1	\N	0	0	apartment	62	\N
3755	2-комнатные, 48 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3755	1518031713319	\N	1	\N	0	0	apartment	62	\N
3756	2-комнатные, 46 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3756	1518031727276	\N	1	\N	0	0	apartment	62	\N
3757	2-комнатные, 54 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	3757	1518031737545	\N	1	\N	0	0	apartment	62	\N
3758	2-комнатные, 54 м<sup><small>2</small></sup>, 6/10 - этаж/этажей	3758	1518031747574	\N	1	\N	0	0	apartment	62	\N
3759	2-комнатные, 45 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3759	1518031758952	\N	1	\N	0	0	apartment	62	\N
3760	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3760	1518031771888	\N	1	\N	0	0	apartment	62	\N
3761	2-комнатные, 44 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3761	1518031784209	\N	1	\N	0	0	apartment	62	\N
3762	2-комнатные, 48 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3762	1518031803513	\N	1	\N	0	0	apartment	62	\N
3763	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3763	1518031820493	\N	1	\N	0	0	apartment	62	\N
3764	2-комнатные, 44 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3764	1518031837672	\N	1	\N	0	0	apartment	62	\N
3765	2-комнатные, 44 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3765	1518031859613	\N	1	\N	0	0	apartment	62	\N
3766	2-комнатные, 54 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3766	1518031879869	\N	1	\N	0	0	apartment	62	\N
3767	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3767	1518031902237	\N	1	\N	0	0	apartment	62	\N
3768	2-комнатные, 44 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3768	1518031915890	\N	1	\N	0	0	apartment	62	\N
3769	2-комнатные, 44 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3769	1518031928254	\N	1	\N	0	0	apartment	62	\N
3770	2-комнатные, 43 м<sup><small>2</small></sup>, 1/4 - этаж/этажей	3770	1518031937126	\N	1	\N	0	0	apartment	62	\N
3771	2-комнатные, 48 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3771	1518031965738	\N	1	\N	0	0	apartment	62	\N
3772	2-комнатные, 48 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3772	1518031980896	\N	1	\N	0	0	apartment	62	\N
3773	2-комнатные, 48 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3773	1518031995593	\N	1	\N	0	0	apartment	62	\N
3774	2-комнатные, 60 м<sup><small>2</small></sup>, 10/10 - этаж/этажей	3774	1518032005499	\N	1	\N	0	0	apartment	62	\N
3775	2-комнатные, 43 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3775	1518032020960	\N	1	\N	0	0	apartment	62	\N
3776	2-комнатные, 45 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3776	1518032032792	\N	1	\N	0	0	apartment	62	\N
3777	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3777	1518032049212	\N	1	\N	0	0	apartment	62	\N
3778	2-комнатные, 44 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3778	1518032072336	\N	1	\N	0	0	apartment	62	\N
3871	Дом	3871	1518057758497	\N	1	\N	0	0	cottages	1595	\N
3779	2-комнатные, 64 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3779	1518032091316	\N	1	\N	0	0	apartment	62	\N
3780	2-комнатные, 48 м<sup><small>2</small></sup>, 4/9 - этаж/этажей	3780	1518032126994	\N	1	\N	0	0	apartment	62	\N
3781	2-комнатные,  м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3781	1518032153070	\N	1	\N	0	0	apartment	62	\N
3782	1-комнатные, 34 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3782	1518032170853	\N	1	\N	0	0	apartment	61	\N
3783	1-комнатные, 33 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3783	1518032206890	\N	1	\N	0	0	apartment	61	\N
3784	2-комнатные, 61 м<sup><small>2</small></sup>, 5/10 - этаж/этажей	3784	1518032254019	\N	1	\N	0	0	apartment	62	\N
3785	2-комнатные, 48 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3785	1518032279245	\N	1	\N	0	0	apartment	62	\N
3786	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3786	1518032289404	\N	1	\N	0	0	apartment	62	\N
3787	2-комнатные, 48 м<sup><small>2</small></sup>, 1/10 - этаж/этажей	3787	1518032298056	\N	1	\N	0	0	apartment	62	\N
3788	2-комнатные, 42 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3788	1518032333094	\N	1	\N	0	0	apartment	62	\N
3789	2-комнатные, 48.4 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3789	1518032353306	\N	1	\N	0	0	apartment	62	\N
3790	2-комнатные, 54 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3790	1518032380430	\N	1	\N	0	0	apartment	62	\N
3791	2-комнатные, 53 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3791	1518032395513	\N	1	\N	0	0	apartment	62	\N
3792	2-комнатные, 42 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3792	1518032419932	\N	1	\N	0	0	apartment	62	\N
3793	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3793	1518032432320	\N	1	\N	0	0	apartment	62	\N
3794	2-комнатные, 52 м<sup><small>2</small></sup>, 7/7 - этаж/этажей	3794	1518032456217	\N	1	\N	0	0	apartment	62	\N
3795	2-комнатные, 53 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3795	1518032476830	\N	1	\N	0	0	apartment	62	\N
3796	2-комнатные, 43 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3796	1518032504783	\N	1	\N	0	0	apartment	62	\N
3797	2-комнатные, 53 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3797	1518032516566	\N	1	\N	0	0	apartment	62	\N
3798	2-комнатные, 43 м<sup><small>2</small></sup>, 1/9 - этаж/этажей	3798	1518032545023	\N	1	\N	0	0	apartment	62	\N
3799	2-комнатные, 42 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3799	1518032556863	\N	1	\N	0	0	apartment	62	\N
3800	2-комнатные, 57 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3800	1518032576337	\N	1	\N	0	0	apartment	62	\N
3801	2-комнатные, 44 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3801	1518032586348	\N	1	\N	0	0	apartment	62	\N
3802	2-комнатные, 48 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3802	1518032595262	\N	1	\N	0	0	apartment	62	\N
3803	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3803	1518032617188	\N	1	\N	0	0	apartment	62	\N
3804	2-комнатные, 48 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3804	1518032635698	\N	1	\N	0	0	apartment	62	\N
3805	2-комнатные, 44 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3805	1518032646587	\N	1	\N	0	0	apartment	62	\N
3806	2-комнатные, 49 м<sup><small>2</small></sup>, 12/12 - этаж/этажей	3806	1518032670161	\N	1	\N	0	0	apartment	62	\N
3807	2-комнатные, 44 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3807	1518032709939	\N	1	\N	0	0	apartment	62	\N
3808	2-комнатные, 49.3 м<sup><small>2</small></sup>, 6/9 - этаж/этажей	3808	1518032728578	\N	1	\N	0	0	apartment	62	\N
3809	2-комнатные, 52 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3809	1518032745437	\N	1	\N	0	0	apartment	62	\N
3810	2-комнатные, 70 м<sup><small>2</small></sup>, 5/9 - этаж/этажей	3810	1518032756153	\N	1	\N	0	0	apartment	62	\N
3811	2-комнатные, 100 м<sup><small>2</small></sup>, 3/9 - этаж/этажей	3811	1518032774201	\N	1	\N	0	0	apartment	62	\N
3812	1-комнатные, 29 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3812	1518032791129	\N	1	\N	0	0	apartment	61	\N
3813	1-комнатные, 31 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3813	1518032806224	\N	1	\N	0	0	apartment	61	\N
3814	1-комнатные, 47 м<sup><small>2</small></sup>, 0/0 - этаж/этажей	3814	1518034498231	\N	1	\N	0	0	apartment	61	\N
3815	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3815	1518034514821	\N	1	\N	0	0	apartment	61	\N
3816	1-комнатные, 32 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3816	1518034525518	\N	1	\N	0	0	apartment	61	\N
3817	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3817	1518034535596	\N	1	\N	0	0	apartment	61	\N
3818	1-комнатные, 36 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3818	1518034559472	\N	1	\N	0	0	apartment	61	\N
3819	1-комнатные, 29 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3819	1518034571864	\N	1	\N	0	0	apartment	61	\N
3820	1-комнатные, 30 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3820	1518034600306	\N	1	\N	0	0	apartment	61	\N
3821	1-комнатные, 32 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3821	1518034614608	\N	1	\N	0	0	apartment	61	\N
3822	1-комнатные, 47 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3822	1518034629196	\N	1	\N	0	0	apartment	61	\N
3823	1-комнатные, 36 м<sup><small>2</small></sup>, 10/12 - этаж/этажей	3823	1518034645516	\N	1	\N	0	0	apartment	61	\N
3824	1-комнатные, 33 м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3824	1518034653469	\N	1	\N	0	0	apartment	61	\N
3825	1-комнатные, 29 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3825	1518034663057	\N	1	\N	0	0	apartment	61	\N
3826	1-комнатные, 39 м<sup><small>2</small></sup>, 8/9 - этаж/этажей	3826	1518034681900	\N	1	\N	0	0	apartment	61	\N
3827	1-комнатные, 64 м<sup><small>2</small></sup>, 2/9 - этаж/этажей	3827	1518034702629	\N	1	\N	0	0	apartment	61	\N
3828	1-комнатные, 34 м<sup><small>2</small></sup>, 2/10 - этаж/этажей	3828	1518034720580	\N	1	\N	0	0	apartment	61	\N
3829	1-комнатные, 30 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3829	1518034747313	\N	1	\N	0	0	apartment	61	\N
3830	1-комнатные, 31 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3830	1518034760485	\N	1	\N	0	0	apartment	61	\N
3831	1-комнатные, 30 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3831	1518034775667	\N	1	\N	0	0	apartment	61	\N
3832	1-комнатные, 30 м<sup><small>2</small></sup>, 5/5 - этаж/этажей	3832	1518034839497	\N	1	\N	0	0	apartment	61	\N
3833	1-комнатные, 30 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3833	1518034866864	\N	1	\N	0	0	apartment	61	\N
3834	1-комнатные, 29 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3834	1518034877867	\N	1	\N	0	0	apartment	61	\N
3835	1-комнатные, 40 м<sup><small>2</small></sup>, 9/9 - этаж/этажей	3835	1518034922131	\N	1	\N	0	0	apartment	61	\N
3836	1-комнатные, 30 м<sup><small>2</small></sup>, 1/5 - этаж/этажей	3836	1518034993193	\N	1	\N	0	0	apartment	61	\N
3837	1-комнатные,  м<sup><small>2</small></sup>, 7/9 - этаж/этажей	3837	1518035008560	\N	1	\N	0	0	apartment	61	\N
3838	1-комнатные, 29 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3838	1518035033400	\N	1	\N	0	0	apartment	61	\N
3839	1-комнатные, 28 м<sup><small>2</small></sup>, 4/5 - этаж/этажей	3839	1518035056058	\N	1	\N	0	0	apartment	61	\N
3840	1-комнатные, 29 м<sup><small>2</small></sup>, 2/5 - этаж/этажей	3840	1518035072138	\N	1	\N	0	0	apartment	61	\N
3841	1-комнатные, 31 м<sup><small>2</small></sup>, 3/5 - этаж/этажей	3841	1518035093108	\N	1	\N	0	0	apartment	61	\N
3842	2-комнатные, 48 м<sup><small>2</small></sup>, 1/12 - этаж/этажей	3842	1518056102421	\N	1	\N	0	0	apartment	62	\N
3845	Коттедж на участке 15 сот. 	3845	1518056291677	\N	1	\N	0	0	cottages	1596	\N
3855	Дача 130 м<sup><small>2</small></sup> на участке 10 сот. 	3855	1518056833984	\N	1	\N	0	0	cottages	1750	\N
3856	Дача на участке 6 сот. 	3856	1518056861490	\N	1	\N	0	0	cottages	1750	\N
3857	Земля на участке 15 сот. 	3857	1518056926022	\N	1	\N	0	0	cottages	1743	\N
3858	Земля на участке 12 сот. 	3858	1518056950488	\N	1	\N	0	0	cottages	1743	\N
3859	Земля	3859	1518056978785	\N	1	\N	0	0	cottages	1743	\N
3860	Дом 77 м<sup><small>2</small></sup> на участке 13 сот. 	3860	1518057027395	\N	1	\N	0	0	cottages	1595	\N
3861	Дом 186 м<sup><small>2</small></sup> на участке 20 сот. 	3861	1518057092525	\N	1	\N	0	0	cottages	1595	\N
3862	Дом на участке 25 сот. 	3862	1518057139979	\N	1	\N	0	0	cottages	1595	\N
3863	Коттедж 202 м<sup><small>2</small></sup> на участке 36 сот. 	3863	1518057179628	\N	1	\N	0	0	cottages	1596	\N
3864	Коттедж 64 м<sup><small>2</small></sup> на участке 12 сот. 	3864	1518057218222	\N	1	\N	0	0	cottages	1596	\N
3865	Коттедж на участке 6 сот. 	3865	1518057270770	\N	1	\N	0	0	cottages	1596	\N
3866	Коттедж 254 м<sup><small>2</small></sup> на участке 12.5 сот. 	3866	1518057306939	\N	1	\N	0	0	cottages	1596	\N
3868	Коттедж на участке 24 сот. 	3868	1518057591091	\N	1	\N	0	0	cottages	1596	\N
3869	Коттедж на участке 26 сот. 	3869	1518057616966	\N	1	\N	0	0	cottages	1596	\N
3873	Коттедж на участке 30 сот. 	3873	1518057959462	\N	1	\N	0	0	cottages	1596	\N
3874	Коттедж 110 м<sup><small>2</small></sup> на участке 13 сот. 	3874	1518058011600	\N	1	\N	0	0	cottages	1596	\N
3875	Коттедж на участке 15 сот. 	3875	1518058067990	\N	1	\N	0	0	cottages	1596	\N
3876	Дом на участке 25 сот. 	3876	1518058105605	\N	1	\N	0	0	cottages	1595	\N
3877	Дом на участке 30 сот. 	3877	1518058159232	\N	1	\N	0	0	cottages	1595	\N
3878	Дом на участке 25 сот. 	3878	1518058215132	\N	1	\N	0	0	cottages	1595	\N
3879	Коттедж на участке 30 сот. 	3879	1518058257686	\N	1	\N	0	0	cottages	1596	\N
3880	Дача на участке 4 сот. 	3880	1518058364875	\N	1	\N	0	0	cottages	1750	\N
3881	Дача	3881	1518058435500	\N	1	\N	0	0	cottages	1750	\N
3882	Дача на участке 4 сот. 	3882	1518058478707	\N	1	\N	0	0	cottages	1750	\N
3883	Дача на участке 9 сот. 	3883	1518058548909	\N	1	\N	0	0	cottages	1750	\N
3884	Дача на участке 4 сот. 	3884	1518058606066	\N	1	\N	0	0	cottages	1750	\N
3885	Дача на участке 8 сот. 	3885	1518058652993	\N	1	\N	0	0	cottages	1750	\N
3886	Дача на участке 9 сот. 	3886	1518058678321	\N	1	\N	0	0	cottages	1750	\N
3888	Коттедж на участке 20 сот. 	3888	1518075163128	\N	1	\N	0	0	cottages	1596	\N
3890	Земля на участке 16.5 сот. 	3890	1518075309807	\N	1	\N	0	0	cottages	1743	\N
3891	Дом на участке 40 сот. 	3891	1518075342462	\N	1	\N	0	0	cottages	1595	\N
3892	Коттедж 120 м<sup><small>2</small></sup> на участке 16 сот. 	3892	1518075632249	\N	1	\N	0	0	cottages	1596	\N
\.


--
-- Name: node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('node_id_seq', 3892, true);


--
-- Data for Name: parser; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY parser (id, street, house, liter, storey, project, price, area, toilet, balcony, op, note, tel, section) FROM stdin;
4467	комнаты малосемейки	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	иногородние
4476	1-но комнатные	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	иногородние
4468	Казань, наримановка	\N	\N	\N	\N	710	12	\N	\N	\N	своя парковка, кап\\рем дома, сост\\хор.	8917-923-46-41 Гульназ Минегасимовна	КОМНАТЫ
4477	Соболековская	5	\N	2\\5	\N	600	31.2	\N	\N	\N	\N	89196315526 Рамия	1
4478	Б.Афан, Молодежная	6	\N	1\\2	\N	650	30	сов	б\\б	нет	хорошее, пл\\ок, Гардиан	8987-291-25-51 Рабига Равильевна АН Кармен	1
4479	Казань, Назарбаева	54	\N	6\\9	пан	1850	22	сов	б\\б	нет	ч\\пр	8917-935-04-40 Айрат ЦЕНТР ПРОДАЖИ КВАРТИР 	1
4480	Каенлы, Интернац	4	\N	2\\3	\N	420	30	\N	\N	\N	обычная, торг	8917-851-45-18 Алсу Зиятдинова	1
4481	Каз Павлюхина	4	\N	14\\19	мон	1850	43\\20\\10	сов	б\\з	\N	ЖК Симфония, 	8917-931-01-90, 48-90-22 Рамиль Бакиев АН Молод строит.	1
4482	Каз. Зур Урам 1 К	1	\N	7\\9	\N	2400	35	\N	3 м б\\з	\N	 пред чистовая, оформ. Собст, дом сдан	8917-931-01-90, 48-90-22 Рамиль Бакиев АН Молод строит.	1
4527	2-х комнатные	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	иногородние
4528	Б.Афан.Соболековская	1	\N	1\\5	\N	850	45	раз	\N	\N	очень хор.сост. Пл. окна. Кафель.двери…	8 917 916 64 59 Рафия. АН"Доверие"	2
4529	Кам.Поляны	1\\10	\N	8\\9	\N	1350	52	раз	\N	\N	СУПЕР !!!!ч\\п	8 917 916 64 59 Рафия. АН"Доверие"	2
4530	мамад.р-н, Ниж.Таканыш	\N	\N	2\\2	\N	400	42	\N	\N	\N	можно по МСК, есть зем.участок, есть все счетчики 	8919-693-83-24 Лариса АН КВАРТАЛ 	2
4531	Наб.Челны.Нов.город	13\\04	\N	4\\9	\N	2430	51	раз	3мобшит	\N	ремонт, чистая аккуратная	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	2
4532	Наб.Челны.Нов.город	40\\10	\N	2\\5	\N	2200	46	раз	6м	\N	хорошая ч\\пр	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	2
4533	Туапсе	\N	\N	9\\9	пан	3100	60	\N	б\\з	\N	\N	8-987-231-36-50 Св.К. АН Жилье-Сервис	2
4534	Кащань, Прив-р-н, Зорге	13	Б	8\\10	кирп	5500	65	раз	б\\з	нет	шикарный ремонт	8919-688-49-09,8905-311-20-70, Рез. Ахтям.Хим 114	2
4535	Кр.Ключ Центральная	8	\N	1\\2	\N	1500	40	\N	\N	\N	простая	48-77-33,8-919-633-73-88 Эдуард	2
4536	Кр.Кл.Центр.	3	\N	3\\5	кирп	1350	45	разд	3м., заст.	\N	ТОРГ, разнорядка, проходные, фото 	48-77-33,8-919-633-73-88 Эдуард	2
4537	Каз Павлюхина	5	\N	9\\18	мон	2350	63\\36\\11	раз	б\\з	\N	ЖК Симфония, 2 кв 2017 года	8917-931-01-90, 48-90-22 Рамиль Бакиев АН Молод строит.	2
4538	Каз Павлюхина	4	\N	5\\19	мон	2550	63\\38\\12	раз	б\\з	\N	ЖК Симфония, 1 кв 2017 года	8917-931-01-90, 48-90-22 Рамиль Бакиев АН Молод строит.	2
4539	Кам.Поляны	2\\30	\N	4\\5	\N	700	\N	\N	\N	\N	торг	8917-230-06-71 Гульфия Валеевна АН Кармен	2
4540	Кам.Поляны	1\\08	\N	1\\5	\N	900	\N	\N	б\\б	\N	торг	8917-230-06-71 Гульфия Валеевна АН Кармен	2
4541	Кап.Поляны	2\\12	\N	4\\5	\N	1000	44	раз	6 м б\\з	да	обычная	8917-271-0422 Анжела АН Кармен	2
4542	Кап.Поляны	1\\11	\N	3\\9	\N	1250	52	раз	б\\з	нет	отл\\рем, ч\\пр, 	8-917-264-33-07 Лена  Родионова ИАРТ	2
4543	Кам.Поляны	1\\13	\N	1\\9	\N	950	52	\N	3мб	\N	обычная ч\\п	89178726498 Ирина	2
4544	Кам.Поляны	2\\11	\N	6\\9	\N	1250	52	\N	3мб	\N	РЕМОНТ,МЕБЕЛЬ	89178726498 Ирина	2
4545	Кам.Поляны	1\\11	\N	6\\9	\N	1350    52	52	\N	3мб	\N	РЕМОНТ, ПЕРЕПЛАН., МЕБЕЛЬ!!!	89178726498 Ирина	2
4546	Кам.Поляны	2\\10	\N	2\\9	\N	1200	52	\N	3мб	\N	пл.окна обмен на 1-но 	89178726498 Ирина	2
4547	Кам.Поляны	1\\16	\N	2\\5	\N	860	43	\N	6мб	\N	обычная	89178726498 Ирина	2
4577	3-х комнатные	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	иногородние
4578	Шингальчи	\N	\N	2\\3	\N	1380	67	раз	2 б/з	\N	хор.сост., большая квартира,баня, гараж,	8 917 916 64 59 Рафия. АН"Доверие"	3
4579	Б. Афан.Центральная	3	\N	3\\5	\N	1500	60	раз	б/з	\N	хор.сост.,встр.мебель.	8 917 916 64 59 Рафия. АН"Доверие"	3
4580	Менделеевск, Трудовая	\N	\N	3\\5	пан	1650	59	раз	6 мб\\з	нет	хорошее, ч\\пр	8-919-624-36-99  8-917-917-24-24 Татьяна АН  КВАРТАЛ 	3
4581	Кр.Кл, Центральная	6	\N	2\\2	\N	1450	58	\N	\N	\N	обычная, торг	8-919-624-36-99  8-917-917-24-24 Татьяна АН  КВАРТАЛ 	3
4582	Б.АфанасовоМолодежная	12	\N	2\\2	\N	1150	44	раз	б\\з	нет	отличный ремонт, зем\\участок	8919-693-83-24 Лариса АН КВАРТАЛ 	3
4583	Кам.Поляны	1\\06	\N	4\\5	\N	1550	59	\N	\N	\N	хор\\рем, все поменяно	8919-693-83-24 Лариса АН КВАРТАЛ 	3
4584	Наб.Челны	58\\02	\N	10\\11	\N	3940	86,6\\\\14	\N	\N	нет	новостр, дом сдан, ремонт, ч\\пр, 	8-987-231-36-50 Св.К. АН Жилье-Сервис	3
4585	c.Черемшан	\N	\N	1\\2	кирп	2300	68	совм	лодж	\N	Газ.отопл.Обмен на Н-камск	8-987-231-36-50 Св.К. АН Жилье-Сервис	3
4586	Кам. Поляны	2\\33	\N	7\\9	пан	1450	65	раз	б\\з	нет	\N	8987-291-25-51 Рабига Равильевна АН Кармен	3
4587	Кам. Поляны	2\\06	\N	3\\9	пан	1650	65	раз	б\\з	нет	хор\\рем	8987-291-25-51 Рабига Равильевна АН Кармен	3
4588	Кам.Поляны	1\\08	\N	3\\5	\N	1250	58	\N	6мб	\N	УГЛОВАЯ, колясочный коридор.	89178726498 Ирина	3
4620	4-х комнатные	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	иногородние
4621	Кам.Поляны	2\\42	\N	2\\5	\N	1400	72	\N	два балкона	\N	\N	89178726498 Ирина	иногородние
4622	Кам.Поляны	2\\40	\N	3\\5	\N	1450	\N	\N	два балкона	\N	ремонт	89178726492 Ирина	иногородние
4623	Кам.Поляны	1\\17	\N	2\\5	\N	1430	72	\N	2 балкона/3	\N	торг СРОЧНО!!!	33-72-70, 8917-258-63-95 Иван Мой Дом 	иногородние
4624	Кам.Поляны	2\\42	\N	2\\5	\N	1500	72	\N	2 балкона/3	\N	требуется ремонт	33-72-70, 8917-258-63-95 Иван Мой Дом 	иногородние
4625	Кам.Поляны	2\\40	\N	3\\5	\N	1680	72	\N	2 балкона/3	\N	хороший ремонт	33-72-70, 8917-258-63-95 Иван Мой Дом 	иногородние
4626	Кам.Поляны	1\\16	\N	3\\5	\N	1520	72	\N	2 балкона 	\N	стандартная/ торг	33-72-70, 8917-258-63-95 Иван Мой Дом 	иногородние
4627	Н.Челны, Чулман	18	\N	7\\9	пан	3750	88	разд	2 по 6 м	нет	хор сост, ч\\пр	8-917-926-35-61 Руслан АН "РУСЛАН"	иногородние
4628	Зеленодольск	\N	\N	4\\	\N	5500	150	\N	\N	\N	центр, гараж в доме, ограж .террит,  квар.плата маленькая	8-987-231-36-50 Св.К. АН Жилье-Сервис	иногородние
4629	Кр.Кл Центр	2	\N	2\\5	\N	2500	74	\N	2 бб\\з+обш	\N	торг	8917-920-49-32 Райля АН КВАРТАЛ 	иногородние
4630	многокомнатные	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	иногородние
4589	Кам.Поляны	1\\20	\N	9\\9	\N	110	66	\N	3 мб	\N	СРОЧНО!!! 	89178726498 Ирина	3
4590	Кам.Поляны	1\\17	\N	2\\5	\N	1300	60	\N	6мб	\N	торг угловая	89178726498 Ирина	3
4469	Наб.Челны	1\\17	\N	9\\9	\N	730	18.7	\N	\N	\N	 новый хор\\рем,мебель все остается, соседи хорошие	8917-923-46-41 Гульназ Минегасимовна	КОМНАТЫ
4470	Кам.Поляны	2\\30	\N	4\\5	\N	650	41 кв м	\N	б\\б	\N	 с ремонтом	89178726498 Ирина	КОМНАТЫ
4471	Кам.Поляны	2\\32	\N	5\\9	\N	500	36 кв м	\N	изолир 2х	\N	обычная или обмен на 3х в пяти	89178726498 Ирина	КОМНАТЫ
4472	Кам.Поляны	2\\30б	\N	1\\5	\N	580	41 кв м	\N	пл.окна	\N	СРОЧНО!!!	89178726498 Ирина	КОМНАТЫ
4473	Кам.Поляны	1\\18	А	2\\5	\N	750	40 кв.м	\N	\N	\N	евроремонт	89178726498 Ирина	КОМНАТЫ
4474	Кам.Поляны	2\\30	\N	1\\5	\N	730	40 кв.м	\N	\N	\N	 все поменено, пл окна	33-72-70, 8917-258-63-95 Иван Мой Дом 	КОМНАТЫ
4475	Кам.Поляны	1\\18	\N	3\\5	\N	230	20	\N	\N	\N	комната	33-72-70, 8917-258-63-95 Иван Мой Дом 	КОМНАТЫ
4483	Каз.п-т Победы	131	\N	9\\18	\N	2650	38\\19\\9	сов	б\\з	\N	предчестовая, рапротив Мега и Икея, сдача  1 кв-л 2018	8917-931-01-90, 48-90-22 Рамиль Бакиев АН Молод строит.	1
4484	Чистополь, Урицкого	62	\N	3\\3	\N	1450	39.2	сов	б\\з	нет	улуд\\план, собст юр.лицо, предчистовая	8-917-264-33-07 Лена  Родионова ИАРТ	1
4485	Кр.Кл Центр.	3	\N	5\\5	\N	1350	31	\N	3м.заст.	\N	торг, простой ремонт.	48-77-33,8-919-633-73-88 Эдуард	1
4486	Кам.Поляны	1\\09	\N	5\\5	\N	510	30	\N	6мб	нет	пл.окно без ремонта	89178726498 Ирина	1
4487	Кам.Поляны	1\\08	\N	2\\5	\N	715	30	\N	6мб	нет	пл. окна, ремонт	89178726498 Ирина	1
4488	Кам.Поляны	2\\42	\N	1\\5	\N	750	30 кв м	\N	6мб	\N	\N	89178726498 Ирина	1
4489	Кам.Поляны	2\\12	\N	1\\5	\N	830	40 кв м	\N	3мб/3	\N	пл окна разнарядка	89178726498 Ирина	1
4490	Кам.Поляны	2\\13	\N	2\\5	\N	730	30	\N	6мбалкон	\N	среднее состояние	89178726498 Ирина	1
4491	Кам.Поляны	1\\19	\N	4\\9	\N	600	30 кв м	\N	\N	\N	\N	89178726498 Ирина	1
4492	Кам.Поляны	2\\32	А	5\\9	\N	750	42 кв.м	\N	б\\б	\N	\N	89178726498 Ирина	1
4493	Кам.Поляны	1\\18	\N	4\\5	\N	650	30	\N	6мб	\N	обычная	89178726498 Ирина	1
4494	Кам.Поляны	1\\19	Б	9\\9	\N	600	36	\N	б\\б	\N	с ремонтом	89178726498 Ирина	1
4495	Кам.Поляны	1\\17	\N	3\\5	\N	830	30	\N	6мб	\N	ЕВРОРЕМОНТ!!!	33-72-70, 8917-258-63-95 Иван Мой Дом 	1
4496	Кам.Поляны	1\\19	В	4\\9	\N	680	36	\N	Б\\Б	\N	РЕМОНТ, Ч\\ПР, 1 СОБСТ	33-72-70, 8917-258-63-95 Иван Мой Дом 	1
4497	Кам.Поляны	1\\36	\N	2\\3	\N	630	29	\N	\N	\N	проект с ремонтом 800	33-72-70, 8917-258-63-95 Иван Мой Дом 	1
4498	Кам.Поляны	2\\11	\N	4\\9	\N	670	36 квм	\N	\N	\N	без ремонта, ч/пр	33-72-70, 8917-258-63-95 Иван Мой Дом 	1
4499	Кам.Поляны	1\\18	\N	1\\5	\N	640	30	\N	\N	\N	ремонт торг	33-72-70, 8917-258-63-95 Иван Мой Дом 	1
4500	Кам.Поляны	2\\42	\N	1\\5	\N	750	30 кв м	\N	6мб	\N	торг.	33-72-70, 8917-258-63-95 Иван Мой Дом 	1
4501	Кам.Поляны	1\\04	\N	2\\5	\N	750	30 кв м	\N	6мб	\N	отл. ремонт, пл. окна	33-72-70, 8917-258-63-95 Иван Мой Дом 	1
4502	Кам.Поляны	1\\03	\N	2\\5	\N	570	30 кв м	\N	6мб	\N	ОБЫЧНАЯ	33-72-70, 8917-258-63-95 Иван Мой Дом 	1
4503	Б.Афан. Юбилейная	3	\N	1\\2	\N	500	29	сов	б\\б	нет	хорошее, ремонт	8917-278-36-65 Любовь  АН Ваш ДОМ	1
4504	Наб.Челны	25	\N	2\\9	\N	1650	36	сов	6 м б\\з	нет	после ремонта,1 собст, фото	8917-898-17-19 Диляра АН Талисман	1
4505	 Кам. Поляны 	1\\19	Б	3\\5	\N	700	29	сов	б\\б	нет	1 собст	8917-898-17-19 Диляра АН Талисман	1
4506	Наб.Челны ,Нов.город	04\\17	\N	5\\5	\N	1600	29	сов	3м обшит	\N	хорошие состояние, кух.гарнитур в подарок	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	1
4507	Наб.Челны ,Нов.город	44\\01	\N	4\\5	\N	1580	29	сов	6м обшит	\N	обычная все родное ч\\пр	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	1
4508	Наб.Челны ,ЗЯБ	19\\13	\N	5\\10	\N	1700	41	рзд	6м обшит	\N	новый дом, кухня 9 кв строительный ремонт	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	1
4509	Наб.Челны, Нов.город	62\\05	\N	5\\10	\N	1780	38	сов	\N	\N	хорошие состояние кух.гаринитур в подарок	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	1
4510	Кам.Поляны	2\\32	а	1\\8	\N	740	30	сов	б\\б	нет	отличная	8 987-267-00-77 Алик ОЛИМП-НК	1
4511	Владиковказ	\N	\N	3\\5	кирп	1500	36	\N	\N	\N	ч\\пр	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	1
4512	Кр.Кл, Центральная	\N	\N	1\\5	\N	1150	29	сов	б\\б	нет	хор\\рем+мебель,ч\\пр,  обмен на землю под строительство	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	1
4513	Казань, Амерхана	\N	\N	9\\9	\N	2000	30	сов	б\\б	нет	\N	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	1
4514	Б.Аф.Соболековская	5	\N	1\\5	пан	560	33	сов	нет	нет	косм ремонт, пл окна	8-917-926-35-61 Руслан АН "РУСЛАН"	1
4515	Казань ЖК "Острова"	\N	\N	8/10	\N	2950	44	\N	б/з	\N	новая	8-919-684-62-64 Евгений "ЕДИНСТВО"	1
4516	Казань, карбышева	58	\N	3\\10	пан	2900	40	раз	б\\з	нет	обычная	8919-688-49-09,8905-311-20-70, Рез. Ахтям.Хим 114	1
4517	Кам. Поляны	1\\19	Б	5\\9	кирп	630	36	сов	б\\з	нет	хороший ремонт	8-987-231-36-50 Св.К. АН Жилье-Сервис	1
4518	Кам. Поляны	1\\43	\N	4\\9	кирп	999	34	сов	б\\з	нет	хороший ремонт	8-987-231-36-50 Св.К. АН Жилье-Сервис	1
4519	Кам. Поляны	2\\41	\N	4\\5	кирп	680	34	сов	6 М Б\\З	нет	Ч\\ПР, ОБМЕН на м\\с в Нижнекамске	8-987-231-36-50 Св.К. АН Жилье-Сервис	1
4520	Б.Афанасово Молодежная	6	\N	2\\2	\N	600	30.7	раз	б\\б	нет	ч\\пр, комсет.ремонт	8919-693-83-24 Лариса АН КВАРТАЛ 	1
4521	Кап.Поляны	1\\43	\N	4\\9	\N	990	34	сов	б\\з	нет	отл\\сост, все поменяно	8919-693-83-24 Лариса АН КВАРТАЛ 	1
4522	Кр.Кл., Центральная	19.	\N	2\\2	кирп	720	33	раз	6 м б\\з	нет	ч\\пр, без ремонта	8917-884-84-84 Рустем  Ягудин АН Гарант-Сервис	1
4523	Кам. Поляны	2\\30	Б	2\\9	\N	850	42	\N	\N	\N	торг, отличное состояние	8-917-259-1111, Ярослав "ЭКСПЕРТ"	1
4524	Кам . Поляны	1\\36	\N	2\\3	\N	650	30	\N	б/б	\N	отличный рем.,с/у каф., потолки ,ч/пр 	8987-415-02-69 Галина Мегаполис	1
4525	Кам.Поляны	1\\16	\N	4\\5	пан	850	29	раз	6 м б\\з	нет	евроремонт, мебель	8917-920-49-32 Райля АН КВАРТАЛ 	1
4526	Наб.Челн, М.Джалиля 	52	\N	4,5/9	кирп	600	18	общ	\N	\N	ч/пр	48-01-07,89173983157 Вал.Алексан."Новос."	1
4548	Кам.Поляны	2\\12	\N	1\\5	\N	1100	44	\N	6мб	\N	обычная	89178726498 Ирина	2
4549	Кам.Поляны	1\\08	\N	4\\5	\N	880	44	\N	6мб	\N	обычная, уютная	89178726498 Ирина	2
4550	Кам.Поляны	1\\16	\N	2\\5	\N	870	44	\N	6м\\б	нет	ч\\пр	89178726498 Ирина	2
4551	Кам.Поляны	2\\04	\N	8\\9	\N	1170    52	52	\N	3мб	\N	пл.окна, центр	89178726498 Ирина	2
4552	Кам.Поляны	2\\11	\N	5\\9	\N	1045	52	\N	\N	\N	аккуратная, торг	33-72-70, 8917-258-63-95 Иван Мой Дом 	2
4553	Кам.Поляны	1\\17	\N	4\\5	\N	1050	52	\N	6мб	\N	, ч\\пр	33-72-70, 8917-258-63-95 Иван Мой Дом 	2
4554	Кам.Поляны	1\\13	\N	1\\9	\N	970	44	\N	Б\\З	\N	\N	33-72-70, 8917-258-63-95 Иван Мой Дом 	2
4555	Кам.Поляны	1\\17	\N	4\\5	\N	1130	44	\N	6мб	\N	отл. Ремонт	33-72-70, 8917-258-63-95 Иван Мой Дом 	2
4556	Кам.Поляны	2\\30	\N	1\\4\\5	\N	620	41	\N	Б\\Б	\N	торг СРОЧНО!!!	33-72-70, 8917-258-63-95 Иван Мой Дом 	2
4557	Кам.Поляны	1\\12	\N	3\\9	\N	1230	52	\N	3мб	\N	пл. окна, ремонт	33-72-70, 8917-258-63-95 Иван Мой Дом 	2
4558	Кам.Поляны	1\\06	\N	5\\5	\N	860	44	\N	6 м б\\з+общ	\N	ремонт хороший + мебель, торг	33-72-70, 8917-258-63-95 Иван Мой Дом 	2
4559	Кам.Поляны	2\\11	\N	1\\9	пан	1250	54	раз	3 м б\\з	нет	торг, ч\\пр, ремонт	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	2
4560	Верх.Уратьма	\N	\N	1\\2	кирп	\N	39.8	\N	\N	\N	разнор., Гард, котел, чернов.отд, ФОТО., 	8917-866-48-18 Галина Сергеевна АН ОЛИМП-НК	2
4561	Кам.Поляны	2\\32	\N	8/9	пан	400	39	раз	б\\б	\N	чистая продажа	48-01-07,89173983157 Вал.Алексан."Новос."	2
4562	Кам.Поляны	2\\30	\N	4\\5	бнч	590	42	раз	б/б	\N	чистая продажа	48-01-07,89173983157 Вал.Алексан."Новос."	2
4563	Б.Аф. Соболековская	5	\N	5\\5	\N	970	\N	\N	\N	\N	\N	8-919-631-55-26 Рамия 	2
4564	Б. Афан Юбилейная	9	\N	1\\2	кир	780	40	сов	нет	нет	обычная, обмен на 2х в НК	8-917-926-35-61 Руслан АН "РУСЛАН"	2
4565	Н.Челны, Железнодорожников	71	\N	3\\5	пан	2200	43	сов	3 м б\\з	нет	ремонт, ч\\пр	8-917-926-35-61 Руслан АН "РУСЛАН"	2
4566	Б.Афан Молодежная	18	\N	2\\2	кир	1190	42	раз	3 м б\\з	нет	хороший ремонт	8-917-926-35-61 Руслан АН "РУСЛАН"	2
4567	Наб.Челны, Зябь	\N	\N	4\\9	\N	2450	57	раз	6 м б\\з	да	отл\\рем	8917-898-17-19 Диляра АН Талисман	2
4568	 Кам. Поляны 	2\\30	\N	4\\5	\N	530	44	\N	\N	\N	\N	8917-898-17-19 Диляра АН Талисман	2
4569	Сухарево, Пролетарская	19	\N	1\\2	\N	550	42	сов	б\\б	\N	свой гараж у дома	8917-229-85-07 Земфира "ТАТАРСТАН"	2
4570	Верхние Челны	\N	\N	2\\2	\N	450	44	раз	6 метров зас	\N	ч\\п	8917-229-85-07 Земфира "ТАТАРСТАН"	2
4571	Казань ЖК "Острова"	\N	\N	3/10	\N	3500	62	\N	б/з	\N	новая	8-919-684-62-64 Евгений "ЕДИНСТВО"	2
4572	Б. Афанасово, Юбилейная	5	\N	5\\5	\N	880	43	\N	3 м/з	\N	торг, улица Соболековская, дом 5	8-917-259-1111, Ярослав "ЭКСПЕРТ"	2
4573	Кр.Кл.Центральн	16	\N	3\\3	\N	1550	52	\N	б\\з	\N	торг, обычная	8-917-259-1111, Ярослав "ЭКСПЕРТ"	2
4574	Кам.Поляны	1\\16	\N	3\\5	пан	1250	43.2	раз	6 м б\\з	нет	торг	8917-920-49-32 Райля АН КВАРТАЛ 	2
4575	Кам.Поляны	1\\13	\N	1\\9	пан	1250	55.2	рааз	б\\з	\N	част.ремонт, натяж.потолки	8917-920-49-32 Райля АН КВАРТАЛ 	2
4576	Кр.Ключ, Советская	20	\N	2\\2	\N	1300	\N	\N	\N	\N	хор\\сост	8-917-858-55-62 Елена АН "Альянс"	2
4591	Кам.Поляны	2\\11	\N	6\\9	\N	1300	65	\N	3мб	\N	пл.окна,  вид на Каму	89178726498 Ирина	3
4592	Кам.Поляны	2\\42	\N	1\\5	\N	1250	58	\N	2балкона	\N	обычная 	89178726498 Ирина	3
4593	Кам.Поляны	2\\06	\N	1\\9	\N	1500	65	\N	6мб.погреб	\N	пл.окна, ремонт	89178726498 Ирина	3
4594	Кам.Поляны	2\\06	\N	3\\9	\N	1650	66	\N	3мб	\N	ремонт, мебель	89178726498 Ирина	3
4595	Кам.Поляны	2\\04	\N	1\\9	\N	1250	65	\N	3мб	\N	пл.окна, ремонт	89178726498 Ирина	3
4596	Кам.Поляны	2\\41	\N	4\\5	\N	1250	58	\N	6мб	\N	пл.окна, ремонт	89178726498 Ирина	3
4597	Кам.Поляны	1\\17	\N	3\\5	\N	1350	60	\N	6мб	\N	торг	33-72-70, 8917-258-63-95 Иван Мой Дом 	3
4598	Кам.Поляны	1\\43	\N	9\\9	\N	1140	64	\N	3мб	\N	чистая, аккуратная	33-72-70, 8917-258-63-95 Иван Мой Дом 	3
4599	Кам.Поляны	1\\16	\N	2\\5	\N	1460	60	\N	\N	\N	\N	33-72-70, 8917-258-63-95 Иван Мой Дом 	3
4600	Кам.Поляны	2\\11	\N	3,9\\9	\N	1680	65	\N	3 мб	\N	\N	33-72-70, 8917-258-63-95 Иван Мой Дом 	3
4601	Кам.Поляны	2\\33	\N	4,5\\9	\N	1550	65	\N	3мб	\N	пл.окна, ремонт	33-72-70, 8917-258-63-95 Иван Мой Дом 	3
4602	Кам.Поляны	2\\05	\N	2\\9	\N	1680	65	\N	3мб	\N	ВСЕ СДЕЛАНО, ОТЛИЧНАЯ	33-72-70, 8917-258-63-95 Иван Мой Дом 	3
4603	Кам.Поляны	1\\17	\N	5\\5	пан	1050	59	раз	6 м б\\з	нет	хорошая	8917-268-07-07, 8962-567-06-48 , Вал. Алекс.	3
4604	Каенлы, Интернациональная	4	\N	3\\3	\N	550	60	разд	6м	\N	чистая .жить можно.есть огородик.ч.пр	8917-278-36-65 Любовь  АН Ваш ДОМ	3
4605	Б.Афан.Соболек	5	\N	2\\5	\N	1200	59	\N	б\\з	\N	Обмен на 1к в Нижнекамске	8 906-3333-323 Рамис  Олимп-НК	3
4606	Агидель, Башкирия	\N	\N	4\\9	\N	догов	65	\N	3 м б\\з	нет	Обмен на 1к в Нижнекамске	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	3
4607	Кам.Поляны	1\\06	\N	4\\5	\N	1350	\N	\N	\N	\N	\N	89196315526 Рамия	3
4608	Б.Афанасово, Соболек	3	\N	4\\5	\N	1150	57	\N	3 м б\\з	\N	обычная, пустая	8-917-926-35-61 Руслан АН "РУСЛАН"	3
4609	 Кам. Поляны 	2\\42	\N	5\\5	\N	1100	56	разд	б/з	\N	.хорошая..есть фото	8917-898-17-19 Диляра АН Талисман	3
4610	Б.Афанасово, Соболековская	3	\N	1\\5	\N	1250	59	разд	6 м б\\з	нет	1 соб, торг	8917-898-17-19 Диляра АН Талисман	3
4611	Б.Афан Юбилейная	11	\N	2/2	\N	1400	58	\N	\N	\N	пл.окна, хороший ремонт, остается се	8917-900-55-50 Юля "ТАТАРСТАН"	3
4612	Камские Поляны	1\\16	\N	2\\5	\N	1350	60	разд	6 метров	\N	пл.окна, нат.потолок, ремонт	8917-229-85-07 Земфира "ТАТАРСТАН"	3
4613	Казань ЖК "Острова"	\N	\N	6/10	\N	3600	68	\N	2б/з	\N	новая	8-919-684-62-64 Евгений "ЕДИНСТВО"	3
4614	Кам.Поляны	1\\11	\N	1\\9	пан	1490	62	раз	3 м б\\з	нет	торг, ч\\пр,	8917-920-49-32 Райля АН КВАРТАЛ 	3
4615	Кам.Поляны	2\\13	\N	5\\5	пан	1350	59	раз	б\\з\\обш.	нет	ч\\пр., обычная	8917-920-49-32 Райля АН КВАРТАЛ 	3
4616	Стерлитамак, Башкирия	\N	\N	2/9	\N	3150	70	каф	\N	нет	идеальный ремонт, ипотека сбербанк	8-919-636-66-45 Нурия Маликовна	3
4617	Казань, ЖК21 Век	\N	\N	8/8	\N	16600	143	каф	\N	нет	идеальный современный ремонт, ч/п	8-919-636-66-45 Нурия Маликовна	3
4618	Б.Афанасово, Соболек	1	\N	3\\5	\N	1350	58	\N	\N	\N	\N	8-919-640-58-54 Гульназ АН "Квартал"	3
4619	Кам.Поляны	2\\11	\N	9\\9	\N	1450	65	\N	\N	\N	\N	8-919-640-58-54 Гульназ АН "Квартал"	3
\.


--
-- Data for Name: parser_commercial; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY parser_commercial (id, note, price, tel, section) FROM stdin;
111	Гараж Химиков 16 подземный, 25,5 кв.м, видио наблюдение	185,000	\N	Гаражи-офисы-пр.базы-магазины
112	КОСМЕТОЛОГИЧЕСКИЙ САЛОН ШИННИКОВ 1, СВОЙ ВХОД, 66,7 КВ.М, 	5,000,000	\N	Гаражи-офисы-пр.базы-магазины
113	Погреб на Лесной 	13,000	\N	Гаражи-офисы-пр.базы-магазины
114	ПСН Вахитова д.23, 120 кв.м,  свой вход, Сдача 4 кв. 2017 года, ч\\отделка, торг	5,400,000	\N	Гаражи-офисы-пр.базы-магазины
115	ПСН Вахитова д.23, 89 кв.м,  свой вход, Сдача 4 кв. 2017 года, ч\\отделка, торг	4,000,000	\N	Гаражи-офисы-пр.базы-магазины
116	ПСН Сквер Лемаева 10, 300 кв.м, 2+х эт, кирп, эдание	15,000,000	\N	Гаражи-офисы-пр.базы-магазины
117	ПСН Чистополь, ул. Урицкого, 2 офиса ( 118 и 147 кв.м) черновая отд, пл\\ок, коммуникации, свет, отд.входы	2596/3234	\N	Гаражи-офисы-пр.базы-магазины
118	База в Кам.Полянах, 1000м-здание, 35с.земли, сауна, авто-сервис, мойка, свободные помещения	5,600,000	\N	Гаражи-офисы-пр.базы-магазины
119	Гараж Автомобилист 12 (за ж/д вокзалом)	65,000	\N	Гаражи-офисы-пр.базы-магазины
120	Гараж Автомобилист 25	58,000	\N	Гаражи-офисы-пр.базы-магазины
121	Готовый бизнес( Дом, база, магазин-продуктовый, )	3,800,000	\N	Гаражи-офисы-пр.базы-магазины
122	Гараж  за туб.диспансером 9х6х4.	500,000	\N	Гаражи-офисы-пр.базы-магазины
123	Гараж подземный  ТЦ Березка, полностью оборорудованный, 2 этажа	договорная	\N	Гаражи-офисы-пр.базы-магазины
124	Погреб Эластик подземный	16,000	\N	Гаражи-офисы-пр.базы-магазины
125	Гараж ГСК 21,  S=20 кв.м., требует вложений	20,000	\N	Гаражи-офисы-пр.базы-магазины
126	Погреб Лесная 8(овощехранилище 1, секция1), S=6,2 кв.м.	20,000	\N	Гаражи-офисы-пр.базы-магазины
127	ПСН Мира 58, 3-х комнатная квартира	2,500,000	\N	Гаражи-офисы-пр.базы-магазины
128	КАФЕ, действующий бизнес на центральном вещевом рынке, S=62 кв.м., вода, электричество, туалет.	1,200,000	\N	Гаражи-офисы-пр.базы-магазины
129	ПСН Корабельная 45, под офис (готовый бизнес) 	3,500,000	\N	Гаражи-офисы-пр.базы-магазины
130	Офис Строителей 51 S 95 , входная группа , 3 комн. Кухня	4,100,000	\N	Гаражи-офисы-пр.базы-магазины
131	Торговое помещение Шинников 25, два входа, есть возможность разделить помещение	4650000	\N	Гаражи-офисы-пр.базы-магазины
132	Готовый раскрученный бизнес- Кафе в пгт Камские Поляны. Есть фото	7480	\N	Гаражи-офисы-пр.базы-магазины
133	Помещение, нежилое. 340 кв м, ул. Корабельная д.13, (Тулпар)	8000	\N	Гаражи-офисы-пр.базы-магазины
134	ПСН 30 лет Победы 10, обычное состояние не жилое, пл. 9 кв.м 	500,000	\N	Гаражи-офисы-пр.базы-магазины
135	ПСН Мира 95 А, 17 кв. м	480,000	\N	Гаражи-офисы-пр.базы-магазины
136	Павильон в центре города Тихая Аллея 14 "Б", площадь 85 кв.м. под магазин, сауну, стоматологию	2,500,000	\N	Гаражи-офисы-пр.базы-магазины
137	Гараж подземный ,,Мустанг,, на Менделеева	50,000	\N	Гаражи-офисы-пр.базы-магазины
138	Гараж Соболеково, 	20,000	\N	Гаражи-офисы-пр.базы-магазины
139	Погреб на Лесной, 6кв.м	20,000	\N	Гаражи-офисы-пр.базы-магазины
140	Гараж ГК 17 кооп., у охраны, 3х6.	80,000	\N	Гаражи-офисы-пр.базы-магазины
141	Гараж  ГК Сантехник, 50кв.м.,+ комната отдыха.	250,000	\N	Гаражи-офисы-пр.базы-магазины
142	Офис Корабельная 14 нежилое помещ.  S=347,3 кв.м. Собств. Док. готовы. Можно сделать 2-3 отдельных входа	12,000,000	\N	Гаражи-офисы-пр.базы-магазины
143	Автосервис   АВТОБАН  ул.Субай 	11,000,000	\N	Гаражи-офисы-пр.базы-магазины
144	Нежилое-г.Нижнекамск,ул.Химиков,д.2, S=40 кв.м.Постоянные арендаторы.Торг	1,800,000	\N	Гаражи-офисы-пр.базы-магазины
145	База, БСИ-2, пр. помещен(1301,5кв.м)+зем.участок(3860 кв.м)-все в собственности.Торг	10,500,000	\N	Гаражи-офисы-пр.базы-магазины
146	База "Каратай",п.Кр. Ключ,зем.уч+помещ.с оборудованием(автосервис,меб пр-во).Все здания в стабил.аренде.Торг	\N	\N	Гаражи-офисы-пр.базы-магазины
147	ПСН Химиков 45 А, 210 кв.м, 55 тр  руб за кв. м, своя входная группа ,  в аренду 750 руб за 1 кв. м	договорная	\N	Гаражи-офисы-пр.базы-магазины
148	Погреб на Лесной, 9,4 кв.м 	15,000	\N	Гаражи-офисы-пр.базы-магазины
149	Готовый бизнес Химиков 45 А,  офисы с арендаторами , 680 кв.м, ТОРГ, 	 37 500 000. 	\N	Гаражи-офисы-пр.базы-магазины
150	Гараж Автомобилист №19,3*6, за базой Фактория	100,000	\N	Гаражи-офисы-пр.базы-магазины
151	ПСН под магазин, кафе, рядом с Шинным з-м, 548 кв.м, докум. Готовы	8 000 000 торг	\N	Гаражи-офисы-пр.базы-магазины
152	Гараж за старым военкоматом, 666 кв.м, 37 боксы гаражи, док. Готовы	3,100,000	\N	Гаражи-офисы-пр.базы-магазины
153	Гараж  Мустанг, ГСК Фасция , 18 кв.м, охраняемый, все есть, смотр\\яма	130,000	\N	Гаражи-офисы-пр.базы-магазины
154	Гараж Соболеково, свет, полки, приватизированные,док\\готовы	30,000	\N	Гаражи-офисы-пр.базы-магазины
155	Произ. База, Б.Афанасово, 1-я линия, 25 с земли, 130 кв.м , 	8,000,000	\N	Гаражи-офисы-пр.базы-магазины
\.


--
-- Name: parser_commercial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('parser_commercial_id_seq', 155, true);


--
-- Data for Name: parser_cottages; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY parser_cottages (id, note, price, tel, section) FROM stdin;
967	Коттедж Черыклы, 1- но эт, кирп, 140 кв.м, 30 с земли, жилой, полный ремонт, все есть	2,600,000	33-72-70, 8917-258-63-95 Иван Мой Дом 	Дома и коттеджи
978	Дом Ниж. Афанасово, 54 кв м, 26 соток земли, баня, свет, газ	950000	48-01-07,89173983157 Вал.Алексан."Новос."	Дома и коттеджи
979	Дом Тукаевск. Р-н, Биклянь, 1-но эт, дерев, 50 кв.м, 16 с земли, баня старая, сараи, колодец, 	750,000	8987-265-03-65 Римма Зуфаровна АН ОЛИМП-НК	Дома и коттеджи
960	Дом  Слобода Волчья  жилой дом	0	89178726498 ИРИНА	Дома и коттеджи
981	Дом Актан. Р-он, Кирово, 1-но эт, сруб, баня, 20 с земли, торг	320,000	8987-265-03-65 Римма Зуфаровна АН ОЛИМП-НК	Дома и коттеджи
982	Дом Алексее р-он, Баран, 15 с земли, с\\уз в доме (обмен на 2-х в  Нижнекамск+ доплата)	850	8987-265-03-65 Римма Зуфаровна АН ОЛИМП-НК	Дома и коттеджи
983	Дом Аксубаевский р=н дер.Ст.Тимошкино дер.дом 40кв.м.,баня земли 30соток можно по мат капиталу	280	8987-265-03-65 Римма Зуфаровна АН ОЛИМП-НК	Дома и коттеджи
984	Дом Березовая Грива,  новый 1-но эт, кирп,колодец, газ до соседей, баня, хоз\\постр, черновая отделка	2,000,000	8-987-421-86-89 Гулюса  АН ОЛИМП-НК	Дома и коттеджи
985	Дом Каенлы, газ, свет, колодец, 30 с земли, ч\\пр, 1 собст	500,000	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	Дома и коттеджи
986	Коттедж Кр.Кл. ул.Ключевая 2ух эт. 240кв.м. 	10,500,000	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	Дома и коттеджи
987	Тан Хауз на Гагарина 214кв.м. евро+ мебель+ техника	15,000,000	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	Дома и коттеджи
988	Коттедж Борок, 2-х эт , кирп, 220кв.м, отличный, 18 с земли, жилой, все есть, фото есть АВИТО	4,900,000	8-917-257-17-22 Евдокия Алексеев АН ОЛИМП-НК	Дома и коттеджи
991	Дом Болгары,Дом 100кв.м,3х комнатный,э/э,с/у,газ,вода в доме,баня,хоз постройки,возможен обмен на 1,2,3на город	1 500 000торг	8(917)-901-41-93,Альбина АН Проспект НК	Дома и коттеджи
992	Дом Черемшанский район, с.Нижние Каменки, бревенчатый76,9кв.м, зем у 33сот, баня,хоз постройки, газ,вода,э/э, торг	500 000 торг	8(917)-901-41-93,Альбина АН Проспект НК	Дома и коттеджи
993	Коттедж Мамадыш, ул.Луговая, S=92 кв.м., газ, вода, отопление, канализация, 6 соток, хоз.постройки, кухонный гарнитур, ФОТО	3,000,000	8917-298-03-70 Алла МЕГАПОЛИС	Дома и коттеджи
994	Дом Пробудиловка, 2-х эт, новый сруб, 120кв.м, баня большая отдельно, 13,5 с земли, теплица, колодец, все есть, жилой	2,750,000	89172952311 Татьяна Мегаполис 	Дома и коттеджи
995	Дом Пробудиловка, 2 дома, кирп, 2-х эт, 15 с земли, все насаждения, все есть	17,000,000	8917-935-04-40 Айрат ЦЕНТР ПРОДАЖИ КВАРТИР 	Дома и коттеджи
996	Коттедж Дмириевка, 2- эт, баня, все есть, 10 с земли, все насаждения	2,500,000	8917-935-04-40 Айрат ЦЕНТР ПРОДАЖИ КВАРТИР 	Дома и коттеджи
997	 дом в Старошешминске	1,200,000	8-919-631-55-26 Рамия 	Дома и коттеджи
998	Дом  Шереметьевка	500,000	8-919-631-55-26 Рамия 	Дома и коттеджи
999	Дом Б. Афанасово, все есть,  с земли	2,000,000	8-919-631-55-26 Рамия 	Дома и коттеджи
1000	Дом Биклянь	3,700,000	8-919-631-55-26 Рамия 	Дома и коттеджи
1001	Дом в Апастово	2,600,000	8-919-631-55-26 Рамия 	Дома и коттеджи
1002	Дом в Бикляни	3,700,000	8-919-631-55-26 Рамия 	Дома и коттеджи
1003	Дом в Шереметьевке	2,000,000	8-919-631-55-26 Рамия 	Дома и коттеджи
1004	Дом-коробка Рыбная Слобода 	2,000,000	8-919-631-55-26 Рамия 	Дома и коттеджи
1005	Дом Заинский район,  Федотово, Земля 1,2 га, дом незавершенный.	1,200,000	8-917-926-35-61 Руслан  ИП Шурпаев	Дома и коттеджи
1006	Дом Бол. Афанасово, ул.Агрономическая, 72 кв м, 13 сот,  черновой, есть коммуник, Фото. Срочно!	1,320,000	8-917-926-35-61 Руслан  ИП Шурпаев	Дома и коттеджи
1007	Дом село Отарка, Мамадышский район, 36 кв м, 21 сот, дом бревенч, с\\у в доме, баня, хоз постройки	350,000	8-917-926-35-61 Руслан  ИП Шурпаев	Дома и коттеджи
1008	Дом с. Елантово, 157 кв м, 30 соток, есть фото	1,500,000	8-917-926-35-61 Руслан  ИП Шурпаев	Дома и коттеджи
1009	Коттедж Шереметьевка, 200 кв м, СУПЕР, ВСЕ ЕСТЬ, ч\\пр СРОЧНО	6,480	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1010	Коттедж, ул. Субай. 560 кв м, 15 соток, отличный ремонт, есть фото	20,000	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1011	Дом г. Лаишево, ул. Ленина, 2-х эт, 71 кв м, 2 с\\у, ванная, Прекрасный вид на Каму, в 3 мин от пляжа	2500 торг	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1012	Дом-квартира, с. Шингальчи, дом 65 кв м, баня, хоз постройки, 18 соток, Хороший	2000	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1013	Дом.д.Благодатная.ул.Юности д 5.68 кв м.Обычный	1000	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1014	Коттедж с. Борок, 160 кв м, кирпичный, 2х эт, 30 соток,	2250	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1015	Дом Б.Аф.Магистральная 31,дом 91 кв м,12 сот,блоч облиц кирпич,водос и газоснаб центр,предчист рем	2500	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1016	Незаверш дом.Заинск.р-он Федотово.1,2 га.Ахметьево-Кадырово	1500	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1017	Дом.г Мамадыш.ул.Ленина 55.деревянный дом 37.3 ев м,участок 9 соток	1600	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1018	Дом.Б.Аф.Агрономическая 20.черновой-72 кв м,13 соток.	1250	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1020	Зем участок 36 мкр,участок 12.2 соток	450	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1021	Дача.Березовая Грива.дом 45 кв м,участок 9 соток.Есть баня,беседка.	400	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1022	Дом д Дмитриевка.ул.Лесная 9 А. 45 кв м без газа,участок 9 соток,есть хоз построики	450	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1023	Дом.Нижнекамск.ул.Якты 11.Нов бревн дом 100 кв м,участок 10 соток,есть баня.отличное сост	2600	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1024	Коттедж.с Шингальчи.ул.Солнечная 52.Нов дом 86 кв м,участок 12 соток,есть гараж и баня	3200	8-917-926-35-61 Руслан АН "РУСЛАН"	Дома и коттеджи
1025	Коттедж 36 мкр Субай, 340 кв.м , 2-х эт+цоколь, отличный, все есть, торг	8,500,000	8917-898-17-19 Диляра АН Талисман	Дома и коттеджи
1026	Дом Рыбная Слобода,64 кв.м,все в доме. Есть фото	1,400,000	8917-898-17-19 Диляра АН Талисман	Дома и коттеджи
1027	Дом Соколки, кирп финский, 72 кв.м, 15 с земли, баня, 	950,000	8917-898-17-19 Диляра АН Талисман	Дома и коттеджи
1028	Дом Кармалы, 45кв.м, 1-но эт, деревян., 20 с земли, баня, вода,насаждения	850,000	8917-898-17-19 Диляра АН Талисман	Дома и коттеджи
1029	Коттедж -Дача Дмтревка	5,000,000	8917-900-55-50 ЮЛЯ "ТАТАРСТАН"	Дома и коттеджи
1030	Дом Борки,из пенобетна, 82 кв.м, чистовая отделка (3 комнаты/гостиная), 10 соток	4,000,000	8917-900-55-50 ЮЛЯ "ТАТАРСТАН"	Дома и коттеджи
1031	Коттедж 2-х этажный  Борковский кордон, ул Лесная, дом 314 кв. м, 2 теплицы, баня с бассейном, 10 соток участок	6,700,000	8917-900-55-50 ЮЛЯ "ТАТАРСТАН"	Дома и коттеджи
1032	Коттедж 2-х эт. В 36 мкрн.,ул.Афанасовская, площадь 160 кв.м., 10 соток земли, теплица, сад, гараж,удобства	6,300,000	8917-269-03-21 АЛЬБИНА ТАТАРСТАН	Дома и коттеджи
1033	Коттедж 2-х эт. В 36 мкрн.,ул.Чулпан, площадь 150 кв.м., 14 соток земли, баня,теплица, сад, гараж,удобства	6,300,000	8917-269-03-21 АЛЬБИНА ТАТАРСТАН	Дома и коттеджи
1034	Дом п.Камский, (38 км от Ниж-ка), 40 кв.м, кирп, 8 соток, жилой, все есть, мебельи инвентарь по желанию	700,000	8-919-684-62-64 Евгений "ЕДИНСТВО"	Дома и коттеджи
1035	Дом Борки, дом, земля 15 соток, отопление печное, свет, вода, своя скважина, обмен на квартиру, торг	13,000,000	8-917-265-5565, Ильдар "ЭКСПЕРТ"	Дома и коттеджи
1036	Дом Балчиклы, 2-х эт, сруб+ обложен блоками, большой, свет, вода, газ, хоз.постр, 15 с земли	1,350,000	8-917-265-5565, Ильдар "ЭКСПЕРТ"	Дома и коттеджи
1037	Коттедж Б. Афанасово, дом кирпичный 2-х эт. S=250, 17 соток, баня S=18, гараж и сарай S=100, 2 теплицы, беседка, пруд	5,000,000	8-917-259-1111, Ярослав "ЭКСПЕРТ"	Дома и коттеджи
1038	Коттедж Б. Афанасово, коттедж 2-х этажный $=210, земля 12 соток, керамзитные блоки, декоративная штукатурка	4,500,000	8-917-259-1111, Ярослав "ЭКСПЕРТ"	Дома и коттеджи
1039	Дом п.Строителей, дом S=72 9×8, 1-но этажный, земля 7 соток, газ, вода, канализация, торг	1,150,000	8-960-064-2033, Динар  "ЭКСПЕРТ"	Дома и коттеджи
1040	Дом Старошешминск, дом 2 этажный S=120, земля 20 соток, газ, вода, канализация, берег Шешмы, торг	1,350,000	8-960-064-2033, Динар  "ЭКСПЕРТ"	Дома и коттеджи
1041	Коттедж в Берёзовке, сруб 2 эт, S=120, тёплые полы, баня сруб S=40, земля 30 соток, Газ, , всё в собственности, торг	6,800,000	8-960-064-2033, Динар  "ЭКСПЕРТ"	Дома и коттеджи
1042	Коттедж 36 мкр.,3-х этажный S=200, улица Чулпан, д. 3, земля 14 соток, сауна, гараж, бассейн, надв. постройки, торг	4,690,000	8-917-906-1111, Альберт "ЭКСПЕРТ"	Дома и коттеджи
1043	Коттедж д. Березовая Грива, 1-но эт, мансарда, баня, гараж, все кирпичное	8,000,000	48-77-33,8-919-633-73-88 Эдуард	Дома и коттеджи
1044	Коттедж Борок, 204 кв.м, 2-х эт, брус обшит кирп.	7 500 000 торг	48-77-33,8-919-633-73-88 Эдуард	Дома и коттеджи
1045	Коттедж Б.Афанасово, Ленина 2 а, дер., 1 этаж, 12х12, цоколь 6х12, пристрой-баня 6х5, гараж 14х4.5, +20 кв.м., комната отдыха, 15 соток земли	5 500 000 ТОРГ	48-77-33,8-919-633-73-88 Эдуард	Дома и коттеджи
1046	Коттедж-Дача Долгое озеро, собственность, 2 участка по 5 сот., свой берег, 3500 за два уч., можно по отдельности.	3,500,000	48-77-33,8-919-633-73-88 Эдуард	Дома и коттеджи
1047	Коттедж Ташлык, 2-х эт, кирп, 11*13 , газ, свет, вода, 22 с земли, все есть, рядом д\\сад, школа	5,700,000	48-77-33,8-919-633-73-88 Эдуард	Дома и коттеджи
1048	Коттедж  Шереметьевка  зимний   срочно 	2300000	8919-688-49-09,8905-311-20-70, Рез. Ахтям.Хим 114	Дома и коттеджи
1049	Коттедж Кызыл Яр, Сухаревское с.п. в народе Явыш  отл. коттедж со всеми постройками 	4,600,000	8919-688-49-09,8905-311-20-70, Рез. Ахтям.Хим 114	Дома и коттеджи
1050	Коттедж Шереметьевка отличный 	4500	8919-688-49-09,8905-311-20-70, Рез. Ахтям.Хим 114	Дома и коттеджи
1051	Коттедж 36 мкрн.,2-х эт,5-ти комн.жилой с гаражом.Гост. с камином,сауна с душ. каб. Экскл. отделка.	7,900,000	8-987-231-36-50 Св.К. АН Жилье-Сервис	Дома и коттеджи
1052	Дом Шереметьевка,кирп.80 кв.м,40 сот.земли.Электричество,вода,газ,АГВ.,с внутр.отделкой.под магазин	2,000,000	8-987-231-36-50 Св.К. АН Жилье-Сервис	Дома и коттеджи
1053	Дом Шереметьевка,кирп,10 сот.земли.Электричество,вода,газ,без отделки	1,100,000	8-987-231-36-50 Св.К. АН Жилье-Сервис	Дома и коттеджи
1054	Дом Шереметьевка,бревенч.10 сот.земли.Газ,вода,электр.	1,000,000	8-987-231-36-50 Св.К. АН Жилье-Сервис	Дома и коттеджи
1055	Коттедж Благодатная(80км от Н-камска,65км от Альм),S=122 м2+15сот земли.	2 400 000,Торг	8-987-231-36-50 Св.К. АН Жилье-Сервис	Дома и коттеджи
1056	Коттедж В 36-м мкрн.-объект незавершен. стр-ва(285кв.м)кирп.+зем.участок(13,5сот)	12,000,000	8-987-231-36-50 Св.К. АН Жилье-Сервис	Дома и коттеджи
1057	Дом Болгар зем.уч32 сот.,на берегу озера(удобно для оформ.ипотеки)	900,000	8-987-231-36-50 Св.К. АН Жилье-Сервис	Дома и коттеджи
1058	Коттедж  Субай	32,000,000	8-917-296-99-47 48-72-00 Ольга  АН ХИМИКОВ 114	Дома и коттеджи
1059	Коттедж Старошешминск дом S=100 м, земля 25 сот., гараж, баня	4,000,000	8-917-296-99-47 48-72-00 Ольга  АН ХИМИКОВ 114	Дома и коттеджи
1060	Коттедж п. Строителей, кирп.дом, 350 кв.м, жилой,отл\\сост, все есть	5,500,000	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	Дома и коттеджи
1061	Коттедж Каенлы, 2-х эт кирп.дом, 300 кв.м, 20 с земли, новый, предчистовая отд, 	3,000,000	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	Дома и коттеджи
1062	Коттедж Старое Пальчиковое, 350 кв.м, баня, сауна, басейн, жилой	3,800,000	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	Дома и коттеджи
1063	Коттедж Ст.Ерыклы, 1-но эт, 105 кв.м, 9 с земли, жилой, 	3,600,000	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	Дома и коттеджи
1064	Дом Туба, 1-но эт, кирп, 20 кв.м, 28 с земли, баня, сарай, 	750,000	8919-693-83-24 Лариса АН КВАРТАЛ 	Дома и коттеджи
1065	Дом Красная Кадка, все есть 	1,850,000	8919-693-83-24 Лариса АН КВАРТАЛ 	Дома и коттеджи
1066	Дом Мамад.Р-н, Отарка, 1-но эт, бревен., 10 с , все насаждения. Отопление, свет, газ, вода в доме	350,000	8919-693-83-24 Лариса АН КВАРТАЛ 	Дома и коттеджи
1067	Коттедж Тетвель, ул Садовая, 2-х эт, баня, гараж, 	2,200,000	8-919-624-36-99  8-917-917-24-24 Татьяна АН  КВАРТАЛ 	Дома и коттеджи
1068	Дом Б.Афанасово, ул. Красная, 60 кв.м, 10 с земли	2,250,000	8917-920-49-32 Райля АН КВАРТАЛ 	Дома и коттеджи
1069	Коттедж п Светловец, 75 кв.м, 1-но эт, блочный, газ, свет, 	2,100,000	8917-920-49-32 Райля АН КВАРТАЛ 	Дома и коттеджи
1070	Коттедж Кр.Кл , Советская, 14 с земли, 380 кв.м, 3-х эт, 	8,900,000	8917-920-49-32 Райля АН КВАРТАЛ 	Дома и коттеджи
1071	Дом Соколки, 14 тс землм, баня, вода , свет, газ , хоз.постройки	630,000	8917-920-49-32 Райля АН КВАРТАЛ 	Дома и коттеджи
1072	Дом Выгор.Ключ 2ух этажный летний 30с земли	650,000	8917-920-49-32 Райля АН КВАРТАЛ 	Дома и коттеджи
1073	Дом Байданкино 60кв.м. 28с земли	1,500,000	8917-920-49-32 Райля АН КВАРТАЛ 	Дома и коттеджи
1074	Коттедж  п.Строитей,кирпич. 100 кв.м,4 комнаты,2 колодца,8 соток,септик в доме	2,540,000	РУФИНА "ВАШ ДОМ"89178659025	Дома и коттеджи
1075	Дом Чистополь,дом кирпичный,баня,ван.комната,гараж,сарай,газ.отопление,водоснабжение,3 сотки земли	1,250,000	РУФИНА "ВАШ ДОМ"89178659025	Дома и коттеджи
1076	Дом  Борок 1-но эт, бревенчатый, 100 кв.м, 10 с земли, 	2 000 000торг	8-917-246-64-28 Харисова Валентина АН "Ваш риэлтор"	Дома и коттеджи
1077	Дом Наб.Челны Орловка, 1-но эт, кирп. Благоустроееный, 150 кв.м,	5,000,000	8-917-246-64-28 Харисова Валентина АН "Ваш риэлтор"	Дома и коттеджи
1078	Коттедж Каенлы ,2-х эт, кирп, 10 с земли, газ, свет, вода, 	4,000,000	8917-884-84-84 Рустем  Ягудин АН Гарант-Сервис	Дома и коттеджи
1079	Коттедж -дворянское поместье 1890 года, Шереметьевка, отл.сост, 288 кв.м, 25 с земли, гараж, банный комплекс	8 000 000торг	8917-912-50-52 Наташа АН Гранд	Дома и коттеджи
1080	Коттедж Шингальчи , 70 кв.м, 30 с земли, центр  села, баня -сруб отдолно, новая беседка + мангал, боль\\теплица	2 200 000 торг	8917-912-50-52 Наташа АН Гранд	Дома и коттеджи
1081	Коттедж Борок,2-х эт, 260 кв.м, 15 с земли, 	4 000 000торг	8917-912-50-52 Наташа АН Гранд	Дома и коттеджи
1082	Коттедж  Каенлы, 200 кв.м, 13 с земли, банный комплекс, без внутр\\отд, есть стр\\материалы	3 000 000 торг	8917-912-50-52 Наташа АН Гранд	Дома и коттеджи
1083	Коттедж Шингальчи,Супер!!! 127 кв.м.зал40 кв.м.,кухня35 кв.м. 2-спальни 12-15 кв,душ,туалет,баня,гараж,17сот.	5,000,000	8 917 916 64 59 Рафия. АН"Доверие"	Дома и коттеджи
1084	Коттедж Нижнее Афанасово, отличная планировка, 2 этажный кирпичный, баня, гараж,чистая продажа.	3,300,000	8 917 916 64 59 Рафия. АН"Доверие"	Дома и коттеджи
1085	Коттедж   Мензелинск, все есть СУПЕР!!!	3,300,000	8 917 916 64 59 Рафия. АН"Доверие"	Дома и коттеджи
1086	Коттедж Балчыклы, все есть	3,300,000	8 917 916 64 59 Рафия. АН"Доверие"	Дома и коттеджи
1087	Коттедж Кам. Поляны, ул. Новосел. Отличная, новый дом	2,200,000	8 917 916 64 59 Рафия. АН"Доверие"	Дома и коттеджи
1088	Коттедж Каенлы , 2-х эт, кирп,  новый, все есть, 20 с 	2,700,000	8 917 916 64 59 Рафия. АН"Доверие"	Дома и коттеджи
1089	Дом Чистополь.р-н Тат. Елтань, 75  кв.м, 25 с земли, сан\\уз в доме, газ.печь, водонагреватель, можно по МСК	550,000	8-919-640-58-54 Гульназ АН "Квартал"	Дома и коттеджи
1090	Дом Б.Афанасово. Пролетарская. Дом кирп s=68 земля 9 соток. Баня(кирпич) , гараж(блок) , хоз.блок(из блоков)	1,860,000	8-917-858-55-62 Елена АН "Альянс"	Дома и коттеджи
1091	Коттедж Субай,2- х эт, коробка, 240 кв.м	830,000	8-917-858-55-62 Елена АН "Альянс"	Дома и коттеджи
1092	Коттедж Борок, 2-х эт, кирп, 20 с земли, хоз.постройки, гараж, все есть, фото.	2,250,000	8-917-858-55-62 Елена АН "Альянс"	Дома и коттеджи
1094	Дача  на понтонном 4с по документам(  реально 8 с ) на берегу, 2-х эт дом, кирп, баня, гараж, теплица, все насаждения	800,000	8917-931-01-90, 48-90-22 Рамиль Бакиев АН Молод строит.	Земля и Дачи
1096	Дача Ильинка,ул.Озерная, 2-х этаж.дом, вода,электрич., баня, бойлер, емкости для воды,насаждения, ТОРГ	1,700,000	8917-929-50-42 Валерий Ульчинский  Мегаполис	Земля и Дачи
1097	Дача, СНТ Агрохимик, 2-этаж.дом,кирпич, озеро, баня, пристань, гараж, камин, разумный торг	1,200,000	8917-929-50-42 Валерий Ульчинский  Мегаполис	Земля и Дачи
1098	Земля  мамадыш (3 км от города), сельхозназначения, 5,17 га, рядом, свет газ , дорога, тарра Е 7	1,200,000	8917-929-50-42 Валерий Ульчинский  Мегаполис	Земля и Дачи
1099	Земля 15 сот., СНТ Саулык, электричество,газ, собственность, документы готовы.(выбор)	200,000	8917-929-50-42 Валерий Ульчинский  Мегаполис	Земля и Дачи
1100	Земля Березовая Грива 15 с , свет, газ	350,000	8917-929-50-42 Валерий Ульчинский  Мегаполис	Земля и Дачи
1101	Земля Березовая Грива 15 с , свет, газ	250,000	8917-929-50-42 Валерий Ульчинский  Мегаполис	Земля и Дачи
1102	Земля Борок, 12 с 	400,000	8987-291-25-51 Рабига Равильевна АН Кармен	Земля и Дачи
1103	Земля Казань,Кировский р-он, ул Табейкина, 13 соток, в собственности,  торг	12,000,000	8904-769-50-10,88555 48-59-09 Ирина Триумф	Земля и Дачи
1104	Земля МинькиноХутор, 14 соток, 	350 000 торг	8917-851-45-18 Алсу Зиятдинова	Земля и Дачи
1105	Земля СНТ Борок, 15 с свет, рядом газ	250,000	8917-929-50-42 Валерий Ульчинский  Мегаполис	Земля и Дачи
1106	Земля Субай, 14 с  165304070269, аренда на 20 лет, асфальт до участка	300,000	8917-279-91-77 Руслан  ИП Афанасьев	Земля и Дачи
1107	Земля Чайка12 с  №526 	180,000	8-917-251-05-30 Марианна Лидер Союз	Земля и Дачи
1108	Земля Шереметьевка 15 сот	300,000	8987-291-25-51 Рабига Равильевна АН Кармен	Земля и Дачи
1109	Коттедж- дача Пробудиловка, Кошчалык, 1-но эт, баня новая, 9 с земли	3,350,000	8-917-251-05-30 Марианна Лидер Союз	Земля и Дачи
1110	Коттедж-Дача , Садовод НК,  на берегу озера, 10 соток, 2-х эт дом, все есть, баня отдельно	2,000,000	8-917-251-05-30 Марианна Лидер Союз	Земля и Дачи
1111	Земля Н. Афанасово 15 сот	150,000	89172586395 ИВАН АН МОЙ ДОМ	Земля и Дачи
1112	Земля Старошешминск, 20 с земли	320,000	89172586395 ИВАН АН МОЙ ДОМ	Земля и Дачи
1113	Земля Чайка в собственности	130,000	89172586395 ИВАН АН МОЙ ДОМ	Земля и Дачи
1114	Земля Борок, 12 с , 3 линия, гараж на 2 машины, погреб, свет, 	500 000 торг	89172586395 ИВАН АН МОЙ ДОМ	Земля и Дачи
1115	Дача на берегу озера Пионерское, 6с. Змли, дом, баня.	1,450,000	8917-232-82-31 Катя Снопкова	Земля и Дачи
1116	Дом на берегу озера П.мост, 2-х эт., зимний, 110кв.м., 13с. Земли, гараж, дом для гостей, 	4,900,000	8917-232-82-31 Катя Снопкова	Земля и Дачи
1117	Дача 106 д, 2этажн.кирп.дом, баня, колонка, сарай, туалет, 5 соток, все насаждения, стоянка под машину (бетон)	280,000	8919-631-09-66 Лилия  ИП Пеструхина 	Земля и Дачи
1118	Земля пос Бэхетле-агро.ул Магистральная 20 соток,соседи живут. 3 км от города	250,000	8917-268-07-07, 8962-567-06-48 , Вал. Алекс.	Земля и Дачи
1119	Дача 1 массив , понт\\мост, 10 с земли в собственности(2 участка)	900,000	8917-268-07-07, 8962-567-06-48 , Вал. Алекс.	Земля и Дачи
1120	Дача 1 массив Нефтехимик, понтон.мост, 5 соток, 1-но эт кирп.дом, забор, все насаждения	450,000	8917-268-07-07, 8962-567-06-48 , Вал. Алекс.	Земля и Дачи
1121	Дача 1 массив Нефтехимик, понтон.мост, 5 соток, 2-х - эт кирп.дом, забор, все насаждения, скважена, сауна	1,100,000	8917-268-07-07, 8962-567-06-48 , Вал. Алекс.	Земля и Дачи
1122	Дача напротив Сеньтяка, 4сотки, домик 2-х эт,, водо, всет куглый год, стоянка на 2-е машины, строй материал	450 000  торг	8917-866-48-18 Галина Сергеевна АН ОЛИМП-НК	Земля и Дачи
1124	Земля Борок,12 с	350,000	8917-866-48-18 Галина Сергеевна АН ОЛИМП-НК	Земля и Дачи
1125	Земля Иштеряково старый старый дом, 36 с земли	400,000	8917-866-48-18 Галина Сергеевна АН ОЛИМП-НК	Земля и Дачи
1126	Земля с. АЧИ 16,5 соток+ старый дом, место хорошее, рядом берег, церковь	400,000	8917-866-48-18 Галина Сергеевна АН ОЛИМП-НК	Земля и Дачи
1127	Земля Чайка 12 соток, в центре поселка	280,000	8917-866-48-18 Галина Сергеевна АН ОЛИМП-НК	Земля и Дачи
1128	Дача ЧАЙКА-2,  2х эт. Дом, фунд. 6х8, 8 соток, озеро берег свой (вид на горы) беседка большая(проф.наст.) 	800,000	8 987 214 42 13; 8 917 919 84 60 Оля  "Доверие"	Земля и Дачи
1129	Дача Б.Грива, СНТ Нефтехимик, 2- х эт дом + баня, колонка, света нет, 10 с, все посажено,ухоженный огород, озеро рядом	230,000	8987-265-03-65 Римма Зуфаровна АН ОЛИМП-НК	Земля и Дачи
1130	Дача пос.Пробуждение 14 сот,2хэт дом,баня,хоз.постройки, насаждения	950торг	8(917) 901-41-93  Альбина АН Проспект НК	Земля и Дачи
1132	Земля Борок, 12 соток	420,000	8917-935-04-40 Айрат ЦЕНТР ПРОДАЖИ КВАРТИР 	Земля и Дачи
1133	Земля  Индустрия ,5 с, на Дамбе, 20 м  Кама	80,000	8 906-3333-323 Рамис  Олимп-НК	Земля и Дачи
1134	Земля С.Верхняя Уратьма 18 сот ТОРГ	70,000	8 906-3333-323 Рамис  Олимп-НК	Земля и Дачи
1135	Дача Берез.Грива 6с.земли, 2ух эт дом ухоженный,баня в доме,колонка,свет,вода,мотоблок,сенокосилка,насос	200,000	8987-273-66-58, 8987-288-94-08 Ольга АН ОЛИМП-НК	Земля и Дачи
1136	Земля Мамадышский р-н,5 га, в сторону Соколки, вдоль дороги, док.готовы	1,500,000	8987-273-66-58, 8987-288-94-08 Ольга АН ОЛИМП-НК	Земля и Дачи
1137	Дача Красный Бор 4с земли, 2ух эт.дом 47кв.м., внутри баня, обшит сайдингом, вода есть, свет круглый год	250,000	8987-273-66-58, 8987-288-94-08 Ольга АН ОЛИМП-НК	Земля и Дачи
1138	Дача Шишкин Хутор , 2-х эт.домик, 4 с земли, все насаждения, баня сруб, , фото	400,000	8987-273-66-58, 8987-288-94-08 Ольга АН ОЛИМП-НК	Земля и Дачи
1141	Земля Борок, 20 с , 	800,000	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	Земля и Дачи
1142	Дача Кр.бор 2ух эт.дом 60кв.м., 4с.земли, септик, сад ухожен, фото	270,000	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	Земля и Дачи
1143	Дача Дамба конечная 121 2ух эт.дом, 3 огорода от Камы, 4с земли	100,000	8917-868-22-30 Ольга Васильевна ОЛИМП -НК	Земля и Дачи
1144	Земли Чистопольский район	12 000 сотка	8917-276-93-84 Наташа АН Доверие	Земля и Дачи
1145	Земля Нижнек-рн, Саулык,ИЖС, 15 соток., свет, газ, проведены (3 участка по 300 тр)	300,000	8917-276-93-84 Наташа АН Доверие	Земля и Дачи
1146	Дача СПК "Нефтехимик" На берегу озера	400,000	48-01-07,89173983157 Вал.Алексан."Новос."	Земля и Дачи
1147	Дача СТ "Кама", (озеро Долгое), дом, баня	300 000торг	48-01-07,89173983157 Вал.Алексан."Новос."	Земля и Дачи
1148	Земля Берсут 65 соток                                                                                                                                по 50 000руб за сотку	\N	48-01-07,89173983157 Вал.Алексан."Новос."	Земля и Дачи
1149	Земля Мамадышский р-н п. Камский 23 сотки	650,000	48-01-07,89173983157 Вал.Алексан."Новос."	Земля и Дачи
1150	Земля  Афанасово	400,000	8-919-631-55-26 Рамия 	Земля и Дачи
1151	Земля Борок , 15 соток	350,000	8-919-631-55-26 Рамия 	Земля и Дачи
1152	Земля в Ново-закамье, 15 соток, после Березовой Гривы,	350,000	8-919-631-55-26 Рамия 	Земля и Дачи
1153	Земля Субай-Афанасово 2 участка по 12  соток, цена стоит за каждый участок 	650	89196315526 Рамия	Земля и Дачи
1154	Земля в Наримановке 20 соток	600	8=919-631-55-26 Рамия	Земля и Дачи
1155	Земельный участок Заинский р-он, Федотово, 1,2 га земли!!!!! Дом недостроен	1,200,000	8-917-926-35-61 Руслан АН "РУСЛАН"	Земля и Дачи
1156	Дача Красный Бор, дом, баня, хоз постр, летн кухня, 12 соток+12 соток пустые	620+120	8-917-926-35-61 Руслан АН "РУСЛАН"	Земля и Дачи
1157	Земельный участок Борок, 12 соток	280,000	8-917-926-35-61 Руслан АН "РУСЛАН"	Земля и Дачи
1159	Земельный участок 36 микр, 12 соток, для ИЖС	450	8-917-926-35-61 Руслан АН "РУСЛАН"	Земля и Дачи
1160	Земельный участок Ильинка, 8,8 сот, свет, бетонная дорога, забор профнастил	240,000	8-917-275-84-79 Алина АН "РУСЛАН"	Земля и Дачи
1161	Земельный участок Тукаевский район, 16 соток и 10 соток	догов	8-917-275-84-79 Алина АН "РУСЛАН"	Земля и Дачи
1131	Земля Уруссу, 20,4 га, (колхозные паи)	0	8-987-421-86-89 Гулюса  АН ОЛИМП-НК	Земля и Дачи
1162	Дача Березовая Грива 45 кв м кирп домик, 9 соток, баня, беседка, рядом озеро	400	8-917-926-35-61 Руслан АН "РУСЛАН"	Земля и Дачи
1164	Земля  Мамад. Р-он, Соколки, 18 с , 	300 000торг	8917-898-17-19 Диляра АН Талисман	Земля и Дачи
1165	Земля Заинский р-н, база отдыха Федотово, 1,2 га, 	1,450,000	8917-898-17-19 Диляра АН Талисман	Земля и Дачи
1166	Земля Болгар, 25 с 	250,000	8919-633-85-81 Регина АН Татарстан	Земля и Дачи
1168	Дача Прости, огород, дом, земля 20 соток, забор проф.настил, баня	520,000	8960-083-26-40 ФАРИДА "ТАТАРСТАН"	Земля и Дачи
1169	Земля на озере, первая береговая, 4,5 сотки	400,000	8917-269-03-21 Альбина "Татарстан"	Земля и Дачи
1170	Дача СНТ Медик, на берегу озера Долгое, 80 кв.м, баня, все удобства , торг	1,500,000	8-919-684-62-64 Евгений "ЕДИНСТВО"	Земля и Дачи
1171	Дача Корабелка, дом, Баня, 6 соток, фото, 	490,000	8-919-684-62-64 Евгений "ЕДИНСТВО"	Земля и Дачи
1172	Земля , площадь 39098, идеально под строит.комер недвижимости, стоянок, фото, ( риэлтор.премия)	4,500,000	8-917-906-1111, Альберт "ЭКСПЕРТ"	Земля и Дачи
1173	Дача в Берёзовка, домик сруб, 2-х эт,  зимний вариант, теплын полы,150 кв. м , отопление электрическое, 16 соток 	1,500,000	8-960-064-2033, Динар  "ЭКСПЕРТ"	Земля и Дачи
1174	Земля 15 соток, ИЖС Березовка	320,000	8-960-064-2033, Динар  "ЭКСПЕРТ"	Земля и Дачи
1175	Земля в Борках, 12 соток	200,000	8-917-265-5565, Ильдар "ЭКСПЕРТ"	Земля и Дачи
1176	Дача Корабельная Роща	450,000	8-917-230-1717, Алексей "ЭКСПЕРТ"	Земля и Дачи
1177	Земля под строительство на Долгом, Светлом	200,000	8-917-230-1717, Алексей "ЭКСПЕРТ"	Земля и Дачи
1178	Земля Б.Афанасово, 17 соток, ИЖС	200,000	8917-858-19-20 Оксана АН  "ИМПЕРИЯ"	Земля и Дачи
1179	земля в Афанасово, 16 соток	350,000	8-917-259-1111, Ярослав "ЭКСПЕРТ"	Земля и Дачи
1180	Земля в Поповке 30 соток	270,000	8-917-259-1111, Ярослав "ЭКСПЕРТ"	Земля и Дачи
1181	Земля в посёлке Строителей, 33 сотки в собственности, торг	3,000,000	8-917-259-1111, Ярослав "ЭКСПЕРТ"	Земля и Дачи
1182	Земля в Б. Афанасово 14 соток с фундаментом 12Х18, гараж 6 на 12, в собственности, торг	560,000	8-917-259-1111, Ярослав "ЭКСПЕРТ"	Земля и Дачи
1183	Земля, Беклянское лесничество, 17 соток, фундамент 10Х12	500,000	8-917-259-1111, Ярослав "ЭКСПЕРТ"	Земля и Дачи
1184	Земля п. Старозакамский  50 соток	по 1100т.р.	48-77-33,8-919-633-73-88 Эдуард	Земля и Дачи
1185	Земля по ул. Лесная между 2-мя АЗС, в собств., под стоянку, фундамент 7*11	3,500,000	48-77-33,8-919-633-73-88 Эдуард	Земля и Дачи
1186	Дача Долгое озеро, собственность, 2 участка по 5 сот., свой берег, 3500 за два уч., можно по отдельности.	3,500,000	48-77-33,8-919-633-73-88 Эдуард	Земля и Дачи
1188	Земля Большое Афанасово 20 соток 	900,000	8919-688-49-09,8905-311-20-70, Рез. Ахтям.Хим 114	Земля и Дачи
1189	Земля ЧАЙКА , 12 с	100,000	8919-688-49-09,8905-311-20-70, Рез. Ахтям.Хим 114	Земля и Дачи
1190	Земля ЕЛАБУЖ.Р-Н  (2,5 га + 2,5 га +2 га +2 га), вдоль трассы М7,Елабуга-Мамадыш. Док.готовы Собств. . Фото на Авито	350т.р. за га	8 919-648-72-72 ИП Гараев  Химиков 114	Земля и Дачи
1191	Дача Корабельная роща 6 соток	100  000	8 919-648-72-72 ИП Гараев  Химиков 114	Земля и Дачи
1194	Дача 106 д район ферма свой берег	500,000	8 919-648-72-72 ИП Гараев  Химиков 114	Земля и Дачи
1197	Земля Болгар, 23 с на берегу озера , элитное место 	900,000	8-987-231-36-50 Св.К. АН Жилье-Сервис	Земля и Дачи
1198	Земля  Мензелинский р\\он, 2 участка на берегу реки , по 10 с , рядом , торг	250\\250	8-987-231-36-50 Св.К. АН Жилье-Сервис	Земля и Дачи
1199	Дача Чайка 6с, возле Ильинки (Майдан) 2-х эт дом, терасса , элитный	1,590,000	8-987-231-36-50 Св.К. АН Жилье-Сервис	Земля и Дачи
1203	Земля Шереметьевка, 20 соток	250,000	8-917-296-99-47 48-72-00 Ольга  АН ХИМИКОВ 114	Земля и Дачи
1204	Земля Березовая Грива с новой недостроенной 2-х этажной баней 3*4, сруб 2016 г, свет, газ, вода,	160,000	8917-874-18-50 Альбина АН КВАРТАЛ 	Земля и Дачи
1206	Земля Н.Уратьма, 15 соток, ( по МСК), торг	120,000	8919-693-83-24 Лариса АН КВАРТАЛ 	Земля и Дачи
1207	 Дача Красный Бор, 2-х эт,  новая баня, 	250,000	8919-693-83-24 Лариса АН КВАРТАЛ 	Земля и Дачи
1208	Земля Мамадышский район 5 га. Вдоль трассы	1,400,000	8-919-624-36-99  8-917-917-24-24 Татьяна АН  КВАРТАЛ 	Земля и Дачи
1209	Земля СНТ КАМА по 121 А м-т, (2 участка по 8 соток) 	80 и 140 000	8-919-624-36-99  8-917-917-24-24 Татьяна АН  КВАРТАЛ 	Земля и Дачи
1210	Земля Байданкино, 14 соток, 	250,000	8917-920-49-32 Райля АН КВАРТАЛ 	Земля и Дачи
1211	Земля Борок, элитное место, 25 с , 	830,000	8917-920-49-32 Райля АН КВАРТАЛ 	Земля и Дачи
1212	Земля Борок 12 соток,электролиния,вода установлены,газовый выход есть	280,000	Руфина 89178659025	Земля и Дачи
1213	Земля Ильинка (где Сабантуй) 5 с , рядом озеро	200,000	8917-920-49-32 Райля АН КВАРТАЛ 	Земля и Дачи
1214	Земля Чайка, 12 с 	230,000	8917-920-49-32 Райля АН КВАРТАЛ 	Земля и Дачи
1216	Земля   Чайка 12 соток 	180,000	8-917-246-64-28 Харисова Валентина АН "Ваш риэлтор"	Земля и Дачи
1217	Земля   Сухорево, 2 участка по 10  соток 	50\\50	8-917-246-64-28 Харисова Валентина АН "Ваш риэлтор"	Земля и Дачи
1218	Земля  Сеньтяк 40 с , торг	800,000	8-917-246-64-28 Харисова Валентина АН "Ваш риэлтор"	Земля и Дачи
1219	Земля Лаишево,10 соток, ИЖС	500,000	8917-884-84-84 Рустем  Ягудин АН Гарант-Сервис	Земля и Дачи
1221	Земля Большие Аты, 15 соток. Ровное, хорошее место.	150,000	8 917 916 64 59 Рафия. АН"Доверие"	Земля и Дачи
1222	Дача  121 а, 13 Улица, 2 этажный блочный дом, насаждения, газонная трава. 4 соток	100,000	8 917 916 64 59 Рафия. АН"Доверие"	Земля и Дачи
1223	Дача   4 соток, берег озера, недалеко от Майдана	320,000	8 917 916 64 59 Рафия. АН"Доверие"	Земля и Дачи
1225	Дача 1 массив понтонный мост, 2-х эт, кирп, 5 соток, все насаждения, 18 улица	250,000	8 917 920 59 63 Людмила  Царева	Земля и Дачи
1226	Земля Б.Грива ,6 соток, дом 4*5 недостроенный, насаждений нет, 	80,000	8 917 920 59 63 Людмила  Царева	Земля и Дачи
\.


--
-- Name: parser_cottages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('parser_cottages_id_seq', 1226, true);


--
-- Name: parser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('parser_id_seq', 4630, true);


--
-- Data for Name: permit; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY permit (id_permit, name, priority, temp, temp_sort, temp_section_sort, url_temp, browse, make, update, delete, publication) FROM stdin;
12	Пользователи	90	users	0	0	/admin/template/users	1	10	100	1000	10000
16	Разделы	50	section	0	0	/admin/template/section	1	10	100	1000	10000
14	Настройки сайта	70	settings	0	0	/admin/template/settings	0	10	100	1000	10000
13	Агенства	80	agency	0	0	/admin/template/agency	1	10	100	1000	10000
17	Комнаты, квартиры	40	apartment	1	0	/admin/template/apartment	1	10	100	1000	10000
18	Статьи	30	article	1	0	/admin/template/article	1	10	100	1000	10000
15	Метки в шаблон	60	label	0	0	/admin/template/label	1	10	100	1000	10000
21	Прайс дома коттеджи	44	price-cottages	0	0	/admin/template/price-cottages	0	0	100	0	0
1	Личный кабинет пользователя	100	admin	0	0	/admin/template/admin	0	0	100	1000	0
22	Коммерческая недвижимость	34	commercial	1	0	/admin/template/commercial	1	10	100	1000	10000
23	Прайс коммерческая недвижимость	42	price-commercial	0	0	/admin/template/price-commercial	0	0	100	0	0
19	Прайс комнаты квартиры	45	price	0	0	/admin/template/price	0	0	100	0	0
20	Дома, коттеджи, дачи	35	cottages	1	0	/admin/template/cottages	1	10	100	1000	10000
\.


--
-- Name: permit_id_permit_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('permit_id_permit_seq', 23, true);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY project (id_project, title, priority) FROM stdin;
6	Панельный	90
8	Блочный	80
10	Монолитный	70
13	Кирпичный	100
14	Деревянный	60
\.


--
-- Name: project_id_project_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('project_id_project_seq', 14, true);


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY region (id_region, title, alias, regional_city, country_id) FROM stdin;
91	Московская обл.	moskovskaya-obl	\N	16
95	Татарстан	tatarstan	118	16
105	Башкортостан	bashkortostan	\N	16
106	Чувашская Республика	chuvashskaya-respublika	\N	16
107	Кировская обл.	kirovskaya-obl	\N	16
108	Краснодарский край	krasnodarskiy-kray	\N	16
109	Воронежская обл.	voronegskaya-obl	\N	16
110	 Южно-федеральный округ	yugno-federalniy-okrug	\N	16
111	Нижегородская обл.	nigegorodskaya-obl	\N	16
112	Марий Эл Республика 		\N	16
\.


--
-- Name: region_id_region_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('region_id_region_seq', 112, true);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY role (id_role, name_role, users, payment_price) FROM stdin;
1	Главный модератор	\N	\N
2	Гость сайта	1	\N
6	Риелтор - оплата	\N	1
5	Риелтор	\N	2
\.


--
-- Name: role_id_role_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('role_id_role_seq', 6, true);


--
-- Data for Name: sectionandtemplate; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY sectionandtemplate (id_sectionandtemplate, section_id, template_name, one_page, id_one_page) FROM stdin;
11	65	apartment	\N	\N
12	64	apartment	\N	\N
13	63	apartment	\N	\N
14	62	apartment	\N	\N
15	61	apartment	\N	\N
16	60	apartment	\N	\N
19	66	article	\N	\N
18	67	article	1	\N
17	68	article	1	\N
20	80	apartment	\N	\N
21	1595	cottages	\N	\N
22	1596	cottages	\N	\N
23	1597	cottages	\N	\N
24	1743	cottages	\N	\N
25	1750	cottages	\N	\N
26	1764	commercial	\N	\N
27	1765	commercial	\N	\N
28	1770	commercial	\N	\N
29	1773	commercial	\N	\N
30	1779	commercial	\N	\N
31	1784	commercial	\N	\N
32	1788	commercial	\N	\N
33	1843	commercial	\N	\N
34	1876	commercial	\N	\N
35	1893	commercial	\N	\N
\.


--
-- Name: sectionandtemplate_id_sectionandtemplate_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('sectionandtemplate_id_sectionandtemplate_seq', 35, true);


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY session (sid, sess, expire) FROM stdin;
BnRsR1VHWYS-lPXnX40Inr8t5zwK5WfB	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"T2QxyNsJuqok266_5p3yBPzq"}	2018-02-08 23:23:37
-H-3psZcFMqylCNnAwg2V_AYzZjD9Ouw	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"w7fMhtzQ9Jzntm89l9oTu7PD"}	2018-02-09 11:11:02
0Gmg8fD6rDt_zmpu6yyOi1ZrlWFB1vvq	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"oF8qQ7hfThyBvdJxH4wSFhbq"}	2018-02-09 15:15:10
bmlztm-AFAEgNEBnW0ZjIGQfagnddNf2	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"Xg2HlE7CxZ11hKKwcB9sOlZ0"}	2018-02-09 16:50:18
A1tKvDCncyPi04JROEFCyCwx9mbRlzKh	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"uid":"14abcd17@mail.ru","csrfSecret":"YouMm72WKHz_wTYYc_t4wDWz"}	2018-02-09 10:42:09
fscEHQ8CSs5ekl_mDVBt8Qkj_SyVf7yQ	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"B6RFTUHqYrpi7qczlpUIfO3S"}	2018-02-08 18:33:46
MYxNOGlzIHQ6SS5SMb46AUFv4TMk2f98	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"6bh8-wx2Xa4421b4-duozRN8"}	2018-02-08 18:33:46
g3AI3tCXcZ6gKxKWNXto5snmiJ57VP96	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"MmeMyNoq04oHNj-tzYRVDUKf"}	2018-02-08 18:33:47
mJ1TDPJsIQjv53gBVriLDZLGfbnN_zXH	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"uid":"14abcd17@mail.ru","csrfSecret":"BmhPBReU_izvYHI-t9boUDgM"}	2018-02-09 18:16:23
QxQo2R6mgu9PpcEFaNav4-nARVq4w2ex	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"kK5v1RHTfn6123Oz2S_GPci_"}	2018-02-09 06:38:33
ET7ldzh1KEIX7tUCcOFNiq05tyVYuM-p	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"ydSQv9Tz5OFsx0N_ETsTqyYe"}	2018-02-08 23:32:37
mtBrnPqyCxEmnQ9mV0RoI5xYjByhRsc4	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"K0Ykc5kiiQhCBLo3-AoMWii2"}	2018-02-09 09:41:20
7H6VdtPiLHoKGCY6NdCmV2Af3N2BrycJ	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"FLqr9JVZld2n7CJmzLTghG49"}	2018-02-09 11:12:04
mAPfzDJQ7bP_ktSSAbDY6xGQVrshpt_n	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"dymTQ9xG68nIUoRTdj4Qaw-A"}	2018-02-09 15:17:50
0E121cR-VYc3sRAjKkzPWPBQ4g3a37c3	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"PcIwhKCXgVL3hTtz8Uv097ny"}	2018-02-09 17:17:33
QCdtE_WJqXQxjVAm2BhyOXrtw9KPgTNy	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"cO6We6mKuKuve_UN66bksXQu"}	2018-02-08 18:43:07
q3Te4l13T3Fg6xvaAZuktDa3xKWqpwWy	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"clcd_dw37VnwXXo0Io2EVLq2"}	2018-02-09 11:45:01
VMJqqn3TOwgBqJIvfpMXoFaOPZwIdgEy	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"UHlNHa5QIBCA3-rfoRIm2DgP"}	2018-02-09 15:31:03
utRWE1P92u1M5UuEOjOeGvmB6IdAumFP	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"4kzManf6nIsCUDkkhYC8HxPj"}	2018-02-09 17:40:24
I-jz5OF9zwNfJEzh_g8VePTD1a7XSKBJ	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"h2Bykz4UaP2GNzj_l12UEj1i"}	2018-02-09 17:40:38
FJkvRnKbYb04Q3ezunmg3RM6UiDmss6m	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"pPdkqPniVwlfJecsUwwVCMdD"}	2018-02-09 17:40:47
ecERoF1uNts901CG2texZ42iWn8uwgiU	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"iIPBI5algGBlWBeMACe2VYOZ","uid":"14abcd17@mail.ru"}	2018-02-08 18:59:25
PgvXhLn98E2aLRoP0lXVJDjzlrHBrSBr	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"uid":"14abcd17@mail.ru","csrfSecret":"AI1IqN4cvBcaeqNN3y3nvniW"}	2018-02-08 23:25:58
tHcVT46Jq8dYpBGzHRnPOa8yIbhtwWZI	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"DTTnq-xIkW4XZjkZM-blmFg3"}	2018-02-08 23:32:37
F1dM2OxkX1Y2N-XbXrBYQBRj0uJciGtd	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"pjUsRhd82x1Y6d-ugXnJpTRq"}	2018-02-09 00:38:16
J1GNG2IupOyIuEolzAVO8A4x22yy1bAR	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"hVTx0sHcEx9dxa9-54UTvKXu"}	2018-02-09 15:49:49
fE4CBAh48JUb02AiBSBlYXIc6fK8eAji	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"G-FCDEwRieLscwDDSE8N3JFD"}	2018-02-08 19:11:07
No7o2lUE9nOOHiAt3rXv3WZnvDCa4da7	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"uid":"14abcd17@mail.ru","csrfSecret":"eY8O4O74z-eVoIRhbp5-1aAo"}	2018-02-09 18:22:06
hSWoM3CD8fZQRlCRfwPKJldu_P8xpKzZ	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"y4r92YBewdIbykc6y0tq3HcI"}	2018-02-09 16:01:09
-P0sZHGPL6h-ny6H-yDiul--_BqYf-Yn	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"e_LVXHXGAuUkZ6RSL1H3zYKu"}	2018-02-09 03:05:31
BCQRHhF1PUsdqqZUxxs39tzjef6xb7nu	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"mKlwj5p5bImHws_Ocf7IbX4U","uid":"14abcd17@mail.ru"}	2018-02-09 17:06:10
CamXm45q9th2R68oMcKJu5HnM-Ezme3t	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"uid":"14abcd17@mail.ru","csrfSecret":"28r39UX6DEOLo6J3VtP44jL2"}	2018-02-09 17:13:22
taOUfR-t-zOsBNqCCQd5mqN16NhIeX56	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"TQhC8B0AxT-knTbaZphM5-Fg"}	2018-02-09 16:44:26
jlxTUK6LPYhS6n4rEDWXzi4uxsRPV_x_	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"4g-_350g9mAA5J2J80zjTuai"}	2018-02-09 03:50:20
NE8OL5EUTzpqf6LcPa0AwwF86_5JT9me	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"BDJJgjA0vHZtUjzReUOlTgdF"}	2018-02-08 19:23:32
auGFe_2EvgM7zwAyMjA-5JBikdaOqelX	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"csrfSecret":"i6BA0BlOBM40OKXZZoQ3puPs"}	2018-02-08 19:23:32
\.


--
-- Data for Name: sql; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY sql (id_sql, command, error, query, query_lower, date, notebook, tags, description, priority) FROM stdin;
357	SELECT	\N	select * from city	select * from city	1492933970716	\N	\N	\N	\N
358	SELECT	\N	select * from street	select * from street	1492933998512	\N	\N	\N	\N
374	SELECT	\N	SELECT s.id_street AS id, s.street AS Улица, ci.title AS Город, r.title AS Область, c.title AS Страна FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.id_region = c.id) ORDER BY s.street	select s.id_street as id, s.street as улица, ci.title as город, r.title as область, c.title as страна from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.id_region = c.id) order by s.street	1492936145527	\N	\N	\N	\N
389	SELECT	\N	SELECT c.title AS Страна, r.title AS Область, districts AS РайонОкруг, ci.title AS Город, street AS Улица, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY  Страна, Область, ci.title = 'Нижнекамск', Город, Улица	select c.title as страна, r.title as область, districts as районокруг, ci.title as город, street as улица, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by  страна, область, ci.title = 'нижнекамск', город, улица	1492946907261	\N	\N	\N	\N
865	SELECT	\N	SELECT * FROM street where id_street = 82	select * from street where id_street = 82	1516880813470	\N	\N	\N	\N
409	SELECT	\N	SELECT id_street, c.title AS Страна, r.title AS Область, districts AS РайонОкруг, ci.title AS Город, street AS Улица, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY c.title, districts, ci.title, Улица	select id_street, c.title as страна, r.title as область, districts as районокруг, ci.title as город, street as улица, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by c.title, districts, ci.title, улица	1492964881437	\N	\N	\N	\N
891	ERROR	syntax error at or near "AS"	SELECT DISTINCT c.title, c.id_city, CASE WHEN districts_id IS NOT NULL THEN CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND c.title != 'Нижнекамск' AND a.agent = 392 ORDER BY c.title	select distinct c.title, c.id_city, case when districts_id is not null then case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and c.title != 'нижнекамск' and a.agent = 392 order by c.title	1517475533472	\N	\N	\N	\N
428	SELECT	\N	select * from apartment where node_id = 94	select * from apartment where node_id = 94	1493048524468	\N	\N	\N	\N
429	DELETE	\N	delete from node where id = 94	delete from node where id = 94	1493048552669	\N	\N	\N	\N
915	UPDATE	\N	UPDATE parser SET section = '1' WHERE id IN(3445, 3467,3468)	update parser set section = '1' where id in(3445, 3467,3468)	1517733481272	\N	\N	\N	\N
633	SELECT	\N	SELECT id_apartment AS "Идентификатор", (SELECT title FROM node WHERE id = type) AS "Тип объявления", st.street AS "Улица", house AS "Дом", liter AS "Литер", to_char(storey, '99') || '/' || to_char(numstorey, '99') AS "Этаж/Этажность", price AS Прайс FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)	select id_apartment as "идентификатор", (select title from node where id = type) as "тип объявления", st.street as "улица", house as "дом", liter as "литер", to_char(storey, '99') || '/' || to_char(numstorey, '99') as "этаж/этажность", price as прайс from apartment ap left join street st on(ap.street = st.id_street)	1493879987205	\N	\N	\N	\N
987	SELECT	\N	SELECT ci.districts_id FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN city ci ON(st.city_id = ci.id_city)	select ci.districts_id from apartment ap left join street st on(ap.street = st.id_street) left join city ci on(st.city_id = ci.id_city)	1518087196392	\N	\N	\N	\N
733	UPDATE	\N	update userdata set code_price = '100000000000000' where user_id = 1	update userdata set code_price = '100000000000000' where user_id = 1	1494739681459	\N	\N	\N	\N
762	SELECT	\N	SELECT table_name FROM information_schema.tables  where table_schema='public' ORDER BY table_name	select table_name from information_schema.tables  where table_schema='public' order by table_name	1501596444077	\N	\N	\N	\N
803	SELECT	\N	select * from users, userdata where id_user = user_id and tel = '+79172980370'	select * from users, userdata where id_user = user_id and tel = '+79172980370'	1513281511829	\N	\N	\N	\N
825	SELECT	\N	select * from users, userdata where id_user = user_id	select * from users, userdata where id_user = user_id	1515736296742	\N	\N	\N	\N
826	SELECT	\N	select * from users, userdata where id_user = user_id limit 3	select * from users, userdata where id_user = user_id limit 3	1515736319440	\N	\N	\N	\N
997	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM commercial ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) WHERE districts_id IS NOT NULL AND u.agency = 7	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from commercial ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) where districts_id is not null and u.agency = 7	1518087989438	\N	\N	\N	\N
1012	SELECT	\N	SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL	select distinct ci.districts_id, re.title, (select districts from districts where id_districts = ci.districts_id) from street st left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null	1518093126921	\N	\N	\N	\N
634	SELECT	\N	SELECT id_apartment AS Идентификатор, (SELECT title FROM node WHERE id = type) AS "Тип объявления", st.street AS Улица, house AS Дом, liter AS Литер, to_char(storey, '99') || '/' || to_char(numstorey, '99') AS "Этаж/Этажность", price AS Цена FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)	select id_apartment as идентификатор, (select title from node where id = type) as "тип объявления", st.street as улица, house as дом, liter as литер, to_char(storey, '99') || '/' || to_char(numstorey, '99') as "этаж/этажность", price as цена from apartment ap left join street st on(ap.street = st.id_street)	1493880045807	\N	\N	\N	\N
375	SELECT	\N	SELECT id_street, s.street AS Улица, ci.title AS Город, r.title AS Область, c.title AS Страна FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.id_region = c.id) ORDER BY s.street	select id_street, s.street as улица, ci.title as город, r.title as область, c.title as страна from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.id_region = c.id) order by s.street	1492936215151	\N	\N	\N	\N
376	SELECT	\N	SELECT id_street, street AS Улица, ci.title AS Город, r.title AS Область, c.title AS Страна FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.id_region = c.id) ORDER BY s.street	select id_street, street as улица, ci.title as город, r.title as область, c.title as страна from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.id_region = c.id) order by s.street	1492936241996	\N	\N	\N	\N
377	SELECT	\N	SELECT id_street, street AS Улица, ci.title AS Город, r.title AS Область, c.title AS Страна FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.id_region = c.id) ORDER BY street	select id_street, street as улица, ci.title as город, r.title as область, c.title as страна from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.id_region = c.id) order by street	1492936261542	\N	\N	\N	\N
840	SELECT	\N	select * from users, userdata where id_user = user_id and email = '14abcd17@mail.ru'	select * from users, userdata where id_user = user_id and email = '14abcd17@mail.ru'	1515738919108	\N	\N	\N	\N
866	SELECT	\N	select * from city where id_city = 132	select * from city where id_city = 132	1516880865469	\N	\N	\N	\N
393	SELECT	\N	SELECT c.title AS Страна, r.title AS Область, districts AS РайонОкруг, ci.title AS Город, street AS Улица, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY  Страна, Область, Город DESC, Улица	select c.title as страна, r.title as область, districts as районокруг, ci.title as город, street as улица, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by  страна, область, город desc, улица	1492947016899	\N	\N	\N	\N
410	SELECT	\N	SELECT id_street, c.title AS Страна, r.title AS Область, districts AS РайонОкруг, ci.title, street, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY c.title, districts, ci.title, street	select id_street, c.title as страна, r.title as область, districts as районокруг, ci.title, street, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by c.title, districts, ci.title, street	1492964938963	\N	\N	\N	\N
411	SELECT	\N	SELECT id_street, c.title AS Страна, r.title AS Область, districts AS РайонОкруг, ci.title, street, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY ci.title, street	select id_street, c.title as страна, r.title as область, districts as районокруг, ci.title, street, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by ci.title, street	1492964967657	\N	\N	\N	\N
892	CREATE	\N	CREATE TABLE IF NOT EXISTS parser_commercial(\r\n\tid SERIAL PRIMARY KEY,  \r\n\tnote text,\r\n\tprice text, \r\n\ttel text, \r\n\tsection text)	create table if not exists parser_commercial(\r\n\tid serial primary key,  \r\n\tnote text,\r\n\tprice text, \r\n\ttel text, \r\n\tsection text)	1517489121385	\N	\N	\N	\N
916	UPDATE	\N	UPDATE parser SET section = 'КОМНАТЫ' WHERE id IN(3441, 3442,3443)	update parser set section = 'комнаты' where id in(3441, 3442,3443)	1517733624311	\N	\N	\N	\N
706	SELECT	\N	SELECT type FROM apartment	select type from apartment	1494231211893	\N	\N	\N	\N
734	ALTER	\N	ALTER TABLE userdata ADD COLUMN csv_price text	alter table userdata add column csv_price text	1494833342502	\N	\N	\N	\N
1017	UPDATE	\N	UPDATE parser SET section = 'КОМНАТЫ' WHERE id > 4468 AND id < 4476	update parser set section = 'комнаты' where id > 4468 and id < 4476	1518102583620	\N	\N	\N	\N
827	ALTER	\N	ALTER TABLE userdata ADD COLUMN date_start bigint	alter table userdata add column date_start bigint	1515736611147	\N	\N	\N	\N
828	ALTER	\N	ALTER TABLE userdata ADD COLUMN date_entry bigint	alter table userdata add column date_entry bigint	1515736638807	\N	\N	\N	\N
829	ALTER	\N	ALTER TABLE userdata ADD COLUMN date_final bigint	alter table userdata add column date_final bigint	1515736656771	\N	\N	\N	\N
360	SELECT	\N	SELECT * FROM street LEFT JOIN city ON (city_id = id_city)	select * from street left join city on (city_id = id_city)	1492934629452	\N	\N	\N	\N
378	SELECT	\N	SELECT id_street, street AS Улица, ci.title AS Город, r.title AS Область, c.title AS Страна FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY street	select id_street, street as улица, ci.title as город, r.title as область, c.title as страна from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by street	1492936456540	\N	\N	\N	\N
394	DELETE	\N	delete from parser where id > 1457	delete from parser where id > 1457	1492948979537	\N	\N	\N	\N
412	SELECT	\N	SELECT id_street, c.title AS Страна, r.title, districts, ci.title, street, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY ci.title, street	select id_street, c.title as страна, r.title, districts, ci.title, street, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by ci.title, street	1492965007911	\N	\N	\N	\N
413	SELECT	\N	SELECT id_street, c.title, r.title, districts, ci.title, street, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY ci.title, street	select id_street, c.title, r.title, districts, ci.title, street, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by ci.title, street	1492965025188	\N	\N	\N	\N
431	DELETE	\N	DELETE FROM node USING apartment WHERE id = node_id AND template = 'apartment'	delete from node using apartment where id = node_id and template = 'apartment'	1493049019843	1	\N	\N	\N
841	SELECT	\N	select * from users, userdata where id_user = user_id and id_user = 288	select * from users, userdata where id_user = user_id and id_user = 288	1515739013069	\N	\N	\N	\N
842	SELECT	\N	select * from users, userdata where id_user = user_id and id_user = 1	select * from users, userdata where id_user = user_id and id_user = 1	1515739025990	\N	\N	\N	\N
867	DELETE	\N	delete from street where id_street = 132	delete from street where id_street = 132	1516881140916	\N	\N	\N	\N
683	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END|| CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN ', ' || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, ap.note AS Примечание, ud.tel, ud.fio, n3.title FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) LEFT JOIN users u ON(ap.agent = u.id_user) LEFT JOIN userdata ud ON(u.id_user = ud.user_id) LEFT JOIN node n3 ON(n3.id = ud.agency)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end|| case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then ', ' || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, ap.note as примечание, ud.tel, ud.fio, n3.title from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) left join users u on(ap.agent = u.id_user) left join userdata ud on(u.id_user = ud.user_id) left join node n3 on(n3.id = ud.agency)	1494060119946	\N	\N	\N	\N
707	SELECT	\N	SELECT DISTINCT type FROM apartment	select distinct type from apartment	1494231341599	\N	\N	\N	\N
735	SELECT	\N	select * from userdata where user_id = 1	select * from userdata where user_id = 1	1494841136513	\N	\N	\N	\N
736	SELECT	\N	select csv_price from userdata where user_id = 1	select csv_price from userdata where user_id = 1	1494841172577	\N	\N	\N	\N
893	CREATE	\N	CREATE TABLE IF NOT EXISTS commercial (\r\n\tid_commercial bigserial PRIMARY KEY,  \r\n\tagent integer,\r\n\ttype bigint,\r\n\tstreet integer,\r\n\tprice integer,\r\n\tarea_house float,\r\n\tnote text,\r\n\tnode_id bigint references node(id) ON DELETE CASCADE)	create table if not exists commercial (\r\n\tid_commercial bigserial primary key,  \r\n\tagent integer,\r\n\ttype bigint,\r\n\tstreet integer,\r\n\tprice integer,\r\n\tarea_house float,\r\n\tnote text,\r\n\tnode_id bigint references node(id) on delete cascade)	1517489171859	\N	\N	\N	\N
917	UPDATE	\N	UPDATE parser SET section = '2' WHERE id > 3469 AND id < 3535	update parser set section = '2' where id > 3469 and id < 3535	1517733762216	\N	\N	\N	\N
830	ALTER	\N	ALTER TABLE userdata ADD COLUMN date_payment_price bigint	alter table userdata add column date_payment_price bigint	1515736790780	\N	\N	\N	\N
943	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' AND agent = 282 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN cottages ON(id = node_id) WHERE template = 'cottages' AND agent = 282 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN commercial ON(id = node_id) WHERE template = 'commercial' AND agent = 282	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id) where template = 'apartment' and agent = 282 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join cottages on(id = node_id) where template = 'cottages' and agent = 282 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join commercial on(id = node_id) where template = 'commercial' and agent = 282	1517755745041	\N	\N	\N	\N
1018	UPDATE	\N	UPDATE parser SET section = 'КОМНАТЫ' WHERE id > 4467 AND id < 4476	update parser set section = 'комнаты' where id > 4467 and id < 4476	1518102635927	\N	\N	\N	\N
361	SELECT	\N	SELECT * FROM street LEFT JOIN city ON (city_id = id_city) ORDER BY street	select * from street left join city on (city_id = id_city) order by street	1492934776482	\N	\N	\N	\N
379	SELECT	\N	SELECT id_street, street AS Улица, ci.title AS Город, r.title AS Область, c.title AS Страна FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY Город, Улица	select id_street, street as улица, ci.title as город, r.title as область, c.title as страна from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by город, улица	1492936754427	\N	\N	\N	\N
395	SELECT	\N	select * from parser	select * from parser	1492949947822	\N	\N	\N	\N
414	SELECT	\N	SELECT id_street, districts, ci.title, street FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY ci.title, street	select id_street, districts, ci.title, street from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by ci.title, street	1492965132534	\N	\N	\N	\N
432	SELECT	\N	select * from apartment	select * from apartment	1493049072534	\N	\N	\N	\N
843	UPDATE	\N	UPDATE node SET date_edit = NULL	update node set date_edit = null	1515739131776	\N	\N	\N	\N
868	DELETE	\N	delete from street where city_id = 132	delete from street where city_id = 132	1516881201733	\N	\N	\N	\N
636	SELECT	\N	SELECT id_apartment AS "Идентификатор", (SELECT title FROM node WHERE id = type) AS "Тип объявления", st.street AS "Улица", house AS "Дом", liter AS "Литер", to_char(storey, '99') || '/' || to_char(numstorey, '99') AS "Этаж/Этажность", (SELECT title FROM project WHERE id_project = project) AS "Тип дома", price AS Прайс FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)	select id_apartment as "идентификатор", (select title from node where id = type) as "тип объявления", st.street as "улица", house as "дом", liter as "литер", to_char(storey, '99') || '/' || to_char(numstorey, '99') as "этаж/этажность", (select title from project where id_project = project) as "тип дома", price as прайс from apartment ap left join street st on(ap.street = st.id_street)	1493881134198	\N	\N	\N	\N
661	SELECT	\N	select * from street limit 5	select * from street limit 5	1493960385981	\N	\N	\N	\N
662	SELECT	\N	select * from city limit 5	select * from city limit 5	1493960409723	\N	\N	\N	\N
894	DELETE	\N	delete from apartment	delete from apartment	1517489217505	\N	\N	\N	\N
918	UPDATE	\N	UPDATE parser SET section = '3' WHERE id > 3535 AND id < 3572	update parser set section = '3' where id > 3535 and id < 3572	1517733867211	\N	\N	\N	\N
944	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id)  LEFT JOIN userdata ON(agent = id_userdata)  WHERE template = 'apartment' AND agent = 282	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id)  left join userdata on(agent = id_userdata)  where template = 'apartment' and agent = 282	1517760676717	\N	\N	\N	\N
962	SELECT	\N	SELECT DISTINCT c.title, c.id_city, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id AND id_districts IS NULL) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL	select distinct c.title, c.id_city, case when districts_id is not null then (select districts from districts where id_districts = districts_id and id_districts is null) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null	1517938756723	\N	\N	\N	\N
977	ERROR	syntax error at or near "\\"	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS \\"Количество объектов\\" FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS \\"Количество объектов\\" FROM node LEFT JOIN cottages ON(id = node_id) WHERE template = 'cottages' UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS \\"Количество объектов\\" FROM node LEFT JOIN commercial ON(id = node_id) WHERE template = 'commercial'	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as \\"количество объектов\\" from node left join apartment on(id = node_id) where template = 'apartment' union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as \\"количество объектов\\" from node left join cottages on(id = node_id) where template = 'cottages' union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as \\"количество объектов\\" from node left join commercial on(id = node_id) where template = 'commercial'	1518083877019	\N	\N	\N	\N
831	ALTER	\N	ALTER TABLE users ADD COLUMN default_city integer	alter table users add column default_city integer	1515736940795	\N	\N	\N	\N
988	SELECT	\N	SELECT DISTINCT ci.districts_id FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN city ci ON(st.city_id = ci.id_city)	select distinct ci.districts_id from apartment ap left join street st on(ap.street = st.id_street) left join city ci on(st.city_id = ci.id_city)	1518087238093	\N	\N	\N	\N
362	SELECT	\N	SELECT * FROM region	select * from region	1492934848483	\N	\N	\N	\N
380	SELECT	\N	select * from districts	select * from districts	1492936940531	\N	\N	\N	\N
844	UPDATE	\N	UPDATE node SET author_edit = NULL	update node set author_edit = null	1515739181530	\N	\N	\N	\N
663	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", ci.title, n2.title, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажность", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city )	select n.id as "идентиф.", n1.title as "тип объяв.", ci.title, n2.title, st.street as улица, house as дом, liter as литер, storey as "этаж/этажность", numstorey as этажность, project as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city )	1493960546573	\N	\N	\N	\N
396	UPDATE	\N	UPDATE parser SET section = 'КОМНАТЫ' WHERE id <1809 AND id > 1820	update parser set section = 'комнаты' where id <1809 and id > 1820	1492950225490	\N	\N	\N	\N
415	SELECT	\N	SELECT id_street, districts, ci.title AS sity, street FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY ci.title, street	select id_street, districts, ci.title as sity, street from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by ci.title, street	1492965235647	\N	\N	\N	\N
433	DROP	\N	DROP TABLE IF EXISTS parser	drop table if exists parser	1493057606554	\N	\N	\N	\N
869	ERROR	syntax error at or near "FIRST"	select * from street ORDER BY street FIRST	select * from street order by street first	1516882247855	\N	\N	\N	\N
685	SELECT	\N	SELECT n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END|| CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN ', ' || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, ap.note AS Примечание, ud.tel || ', ' || ud.fio || ', ' || n3.title AS  "Телефоны агенства, риэлтора" FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) LEFT JOIN users u ON(ap.agent = u.id_user) LEFT JOIN userdata ud ON(u.id_user = ud.user_id) LEFT JOIN node n3 ON(n3.id = ud.agency)	select n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end|| case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then ', ' || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, ap.note as примечание, ud.tel || ', ' || ud.fio || ', ' || n3.title as  "телефоны агенства, риэлтора" from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) left join users u on(ap.agent = u.id_user) left join userdata ud on(u.id_user = ud.user_id) left join node n3 on(n3.id = ud.agency)	1494061358263	\N	\N	\N	\N
709	SELECT	\N	SELECT DISTINCT section FROM node	select distinct section from node	1494246294224	\N	\N	\N	\N
738	ALTER	\N	ALTER TABLE userdata DROP COLUMN csv_price	alter table userdata drop column csv_price	1495265225041	\N	\N	\N	\N
895	DELETE	\N	delete from node where template = 'apartment'	delete from node where template = 'apartment'	1517489312743	\N	\N	\N	\N
919	UPDATE	\N	UPDATE parser SET section = '4' WHERE id > 3572 AND id < 3577	update parser set section = '4' where id > 3572 and id < 3577	1517733965218	\N	\N	\N	\N
781	SELECT	\N	select DISTINCT email from users	select distinct email from users	1512253665029	\N	\N	\N	\N
807	SELECT	\N	select pg_catalog.setval('users_id_user_seq', 563, true)	select pg_catalog.setval('users_id_user_seq', 563, true)	1513339387850	\N	\N	\N	\N
832	SELECT	\N	select * from agency limit 3	select * from agency limit 3	1515737258634	\N	\N	\N	\N
945	SELECT	\N	select * from node, agency WHERE id = node_id	select * from node, agency where id = node_id	1517760759067	\N	\N	\N	\N
946	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id)  LEFT JOIN userdata ON(agent = id_userdata)  WHERE template = 'apartment' AND agency = 7	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id)  left join userdata on(agent = id_userdata)  where template = 'apartment' and agency = 7	1517760814291	\N	\N	\N	\N
963	ERROR	column "district_id" does not exist	SELECT DISTINCT c.title, district_id, c.id_city, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL	select distinct c.title, district_id, c.id_city, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null	1517938847408	\N	\N	\N	\N
989	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN city ci ON(st.city_id = ci.id_city)	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id) from apartment ap left join street st on(ap.street = st.id_street) left join city ci on(st.city_id = ci.id_city)	1518087330610	\N	\N	\N	\N
1019	UPDATE	\N	UPDATE parser SET section = '1' WHERE id > 4476 AND id < 4527	update parser set section = '1' where id > 4476 and id < 4527	1518102771203	\N	\N	\N	\N
845	UPDATE	\N	UPDATE node SET author = 1	update node set author = 1	1515739233108	\N	\N	\N	\N
638	SELECT	\N	SELECT id_apartment AS "Идентификатор", (SELECT title FROM node WHERE id = type) AS "Тип объявления", st.street AS "Улица", house AS "Дом", liter AS "Литер", to_char(storey, '99') || '/' || to_char(numstorey, '99') AS "Этаж/Этажность", (SELECT title FROM project WHERE id_project = project) AS "Тип дома", price AS Прайс, to_char(area1, '999D9'), to_char(area2, '999D9'), to_char(area3, '999D9') FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)	select id_apartment as "идентификатор", (select title from node where id = type) as "тип объявления", st.street as "улица", house as "дом", liter as "литер", to_char(storey, '99') || '/' || to_char(numstorey, '99') as "этаж/этажность", (select title from project where id_project = project) as "тип дома", price as прайс, to_char(area1, '999d9'), to_char(area2, '999d9'), to_char(area3, '999d9') from apartment ap left join street st on(ap.street = st.id_street)	1493881702633	\N	\N	\N	\N
664	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, ci.title AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажность", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city )	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, ci.title as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажность", numstorey as этажность, project as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city )	1493960689533	\N	\N	\N	\N
686	SELECT	\N	SELECT n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END|| CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN ', ' || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, ap.note AS Примечание, ud.tel || ', ' || ud.fio || ', ' || CASE WHEN character_length(n3.title) > 0 THEN n3.title ELSE 'Индивидуальный агент' END AS "Телефоны агенства, риэлтора" FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) LEFT JOIN users u ON(ap.agent = u.id_user) LEFT JOIN userdata ud ON(u.id_user = ud.user_id) LEFT JOIN node n3 ON(n3.id = ud.agency)	select n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end|| case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then ', ' || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, ap.note as примечание, ud.tel || ', ' || ud.fio || ', ' || case when character_length(n3.title) > 0 then n3.title else 'индивидуальный агент' end as "телефоны агенства, риэлтора" from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) left join users u on(ap.agent = u.id_user) left join userdata ud on(u.id_user = ud.user_id) left join node n3 on(n3.id = ud.agency)	1494097274594	\N	\N	\N	\N
711	SELECT	\N	SELECT DISTINCT section FROM node WHERE template = 'apartment'	select distinct section from node where template = 'apartment'	1494246399607	\N	\N	\N	\N
739	ALTER	\N	ALTER TABLE userdata ADD COLUMN csv_price bytea	alter table userdata add column csv_price bytea	1495265267269	\N	\N	\N	\N
870	SELECT	\N	SELECT * FROM district	select * from district	1516882723225	\N	\N	\N	\N
896	DELETE	\N	delete from node where template = 'cottages'	delete from node where template = 'cottages'	1517489385539	\N	\N	\N	\N
920	SELECT	\N	SELECT title, template FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id)	select title, template from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id)	1517753384996	\N	\N	\N	\N
772	SELECT	\N	select table_name, column_name from information_schema.columns where table_schema='public'	select table_name, column_name from information_schema.columns where table_schema='public'	1501597008463	\N	\N	\N	\N
964	ERROR	column c.district_id does not exist	SELECT DISTINCT c.title, c.district_id, c.id_city, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL	select distinct c.title, c.district_id, c.id_city, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null	1517938862016	\N	\N	\N	\N
833	ALTER	\N	ALTER TABLE agency ADD COLUMN city_id integer	alter table agency add column city_id integer	1515737323900	\N	\N	\N	\N
397	UPDATE	\N	UPDATE parser SET section = 'КОМНАТЫ' WHERE id =1809	update parser set section = 'комнаты' where id =1809	1492950650334	\N	\N	\N	\N
1020	UPDATE	\N	UPDATE parser SET section = '2' WHERE id > 4527 AND id < 4577	update parser set section = '2' where id > 4527 and id < 4577	1518102850754	\N	\N	\N	\N
416	SELECT	\N	select * from users	select * from users	1493000563048	\N	\N	\N	\N
434	CREATE	\N	CREATE TABLE IF NOT EXISTS parser (id SERIAL NOT NULL PRIMARY KEY, street text, house text, liter text, storey text, project text, price text, area text, toilet text, balcony text, op text, note text, tel text, section text)	create table if not exists parser (id serial not null primary key, street text, house text, liter text, storey text, project text, price text, area text, toilet text, balcony text, op text, note text, tel text, section text)	1493057653606	\N	\N	\N	\N
639	SELECT	\N	SELECT id_apartment AS "Идентификатор", (SELECT title FROM node WHERE id = type) AS "Тип объявления", st.street AS "Улица", house AS "Дом", liter AS "Литер", to_char(storey, '99') || '/' || to_char(numstorey, '99') AS "Этаж/Этажность", (SELECT title FROM project WHERE id_project = project) AS "Тип дома", price AS Прайс, to_char(area1, '999D9')  || '/' || to_char(area2, '999D9') || '/' || to_char(area3, '999D9') AS Площадь FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)	select id_apartment as "идентификатор", (select title from node where id = type) as "тип объявления", st.street as "улица", house as "дом", liter as "литер", to_char(storey, '99') || '/' || to_char(numstorey, '99') as "этаж/этажность", (select title from project where id_project = project) as "тип дома", price as прайс, to_char(area1, '999d9')  || '/' || to_char(area2, '999d9') || '/' || to_char(area3, '999d9') as площадь from apartment ap left join street st on(ap.street = st.id_street)	1493881857139	\N	\N	\N	\N
846	ERROR	column "author" cannot be cast automatically to type integer	ALTER TABLE node ALTER COLUMN author TYPE integer	alter table node alter column author type integer	1515739518952	\N	\N	\N	\N
871	DELETE	\N	delete from districts where id_districts = 8	delete from districts where id_districts = 8	1516882914446	\N	\N	\N	\N
365	SELECT	\N	SELECT * FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) ORDER BY street	select * from street s left join city ci on (s.city_id = ci.id_city) order by street	1492935176411	\N	\N	\N	\N
381	SELECT	\N	SELECT id_street, id_city, street AS Улица, ci.title AS Город, r.title AS Область, c.title AS Страна FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY Город, Улица	select id_street, id_city, street as улица, ci.title as город, r.title as область, c.title as страна from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by город, улица	1492937023555	\N	\N	\N	\N
398	UPDATE	\N	UPDATE parser SET section = 'КОМНАТЫ' WHERE id >1810 AND id < 1820	update parser set section = 'комнаты' where id >1810 and id < 1820	1492950943446	\N	\N	\N	\N
399	UPDATE	\N	UPDATE parser SET section = 'КОМНАТЫ' WHERE id =1810	update parser set section = 'комнаты' where id =1810	1492950978537	\N	\N	\N	\N
897	DELETE	\N	delete from parser_cottages	delete from parser_cottages	1517489711873	\N	\N	\N	\N
436	DELETE	\N	delete from parser where id < 1131	delete from parser where id < 1131	1493098675009	\N	\N	\N	\N
666	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, ci.title AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, ci.title as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city)	1493966883225	\N	\N	\N	\N
687	SELECT	\N	select * from project	select * from project	1494111896407	\N	\N	\N	\N
713	SELECT	\N	SELECT * FROM street LEFT JOIN city ON(city_id = id_city)	select * from street left join city on(city_id = id_city)	1494253869124	\N	\N	\N	\N
740	SELECT	\N	select table_name, column_name \r\nfrom information_schema.columns \r\nwhere table_schema='userdata'	select table_name, column_name \r\nfrom information_schema.columns \r\nwhere table_schema='userdata'	1495266565271	\N	\N	\N	\N
923	SELECT	\N	SELECT title, template FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'appartment', 'commercial')	select title, template from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'appartment', 'commercial')	1517753539418	\N	\N	\N	\N
417	UPDATE	\N	UPDATE users SET pass='840db544eab43cb34749e1a9ba35e7127c1d7a13' WHERE id_user = 31	update users set pass='840db544eab43cb34749e1a9ba35e7127c1d7a13' where id_user = 31	1493000661717	1	\N	\N	\N
965	SELECT	\N	SELECT DISTINCT c.title, c.districts_id, c.id_city, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL	select distinct c.title, c.districts_id, c.id_city, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null	1517938889182	\N	\N	\N	\N
990	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN city ci ON(st.city_id = ci.id_city)	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from apartment ap left join street st on(ap.street = st.id_street) left join city ci on(st.city_id = ci.id_city)	1518087430215	\N	\N	\N	\N
834	ALTER	\N	ALTER TABLE city ADD COLUMN select_default smallint	alter table city add column select_default smallint	1515737518119	\N	\N	\N	\N
1021	UPDATE	\N	UPDATE parser SET section = '3' WHERE id > 4577 AND id < 4620	update parser set section = '3' where id > 4577 and id < 4620	1518103001850	\N	\N	\N	\N
366	SELECT	\N	SELECT street FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) ORDER BY street	select street from street s left join city ci on (s.city_id = ci.id_city) order by street	1492935215281	\N	\N	\N	\N
382	SELECT	\N	SELECT id_street, id_city, street AS Улица, ci.title AS Город, districts AS РайонОкруг, r.title AS Область, c.title AS Страна FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY Страна, Область, Город, Улица	select id_street, id_city, street as улица, ci.title as город, districts as районокруг, r.title as область, c.title as страна from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by страна, область, город, улица	1492937348520	\N	\N	\N	\N
847	ERROR	column "author_edit" cannot be cast automatically to type integer	ALTER TABLE node ALTER COLUMN author_edit TYPE integer	alter table node alter column author_edit type integer	1515739617836	\N	\N	\N	\N
400	UPDATE	\N	UPDATE parser SET section = '1' WHERE id >1820 AND id < 1923	update parser set section = '1' where id >1820 and id < 1923	1492951136387	\N	\N	\N	\N
641	SELECT	\N	SELECT id_apartment AS "Идентификатор", (SELECT title FROM node WHERE id = type) AS "Тип объявления", st.street AS "Улица", house AS "Дом", liter AS "Литер", storey AS Этаж, numstorey AS Этажность, (SELECT title FROM project WHERE id_project = project) AS "Тип дома", price AS Прайс, area1 AS Общая, area2 AS Жилая, area3 AS Кухня FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)	select id_apartment as "идентификатор", (select title from node where id = type) as "тип объявления", st.street as "улица", house as "дом", liter as "литер", storey as этаж, numstorey as этажность, (select title from project where id_project = project) as "тип дома", price as прайс, area1 as общая, area2 as жилая, area3 as кухня from apartment ap left join street st on(ap.street = st.id_street)	1493882199783	\N	\N	\N	\N
667	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, ci.title AS Город, re.title, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, ci.title as город, re.title, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region)	1493967207034	\N	\N	\N	\N
688	SELECT	\N	SELECT DISTINCT section FROM node, apartment WHERE id=node_id	select distinct section from node, apartment where id=node_id	1494213156685	\N	\N	\N	\N
418	SELECT	\N	select * from node where alias = 'olimp-nk'	select * from node where alias = 'olimp-nk'	1493031479171	\N	\N	\N	\N
714	SELECT	\N	SELECT id_street,  street || ', ' || title AS street FROM street LEFT JOIN city ON(city_id = id_city)	select id_street,  street || ', ' || title as street from street left join city on(city_id = id_city)	1494253996464	\N	\N	\N	\N
741	SELECT	\N	SELECT column_name, column_default, data_type \r\nFROM INFORMATION_SCHEMA.COLUMNS \r\nWHERE table_name = 'userdata'	select column_name, column_default, data_type \r\nfrom information_schema.columns \r\nwhere table_name = 'userdata'	1495266602702	\N	\N	\N	\N
437	DELETE	\N	delete from parser	delete from parser	1493099169747	\N	\N	\N	\N
872	ERROR	relation "cottages" does not exist	select * from cottages	select * from cottages	1516996451456	\N	\N	\N	\N
898	DELETE	\N	delete from parser where id < 2306	delete from parser where id < 2306	1517494877201	\N	\N	\N	\N
775	SELECT	\N	SELECT table_name FROM information_schema.tables where table_schema='public' ORDER BY table_name	select table_name from information_schema.tables where table_schema='public' order by table_name	1501597499871	\N	\N	\N	\N
784	SELECT	\N	select * from session	select * from session	1512402603015	\N	\N	\N	\N
835	ALTER	\N	ALTER TABLE role ADD COLUMN payment_price smallint	alter table role add column payment_price smallint	1515737796451	\N	\N	\N	\N
485	SELECT	\N	SELECT street, ci.title as city_title FROM street LEFT JOIN city ci ON(ci.id_city = city_id) WHERE id_street IN(SELECT DISTINCT s.id_street FROM apartment a LEFT JOIN node n ON(a.node_id = n.id) LEFT JOIN street s ON(a.street = s.id_street) WHERE agent = 38)	select street, ci.title as city_title from street left join city ci on(ci.id_city = city_id) where id_street in(select distinct s.id_street from apartment a left join node n on(a.node_id = n.id) left join street s on(a.street = s.id_street) where agent = 38)	1493112150308	1	\N	\N	\N
848	ERROR	cannot drop table node because other objects depend on it	DROP TABLE IF EXISTS node	drop table if exists node	1515740353326	\N	\N	\N	\N
642	SELECT	\N	SELECT id_apartment AS "Идентификатор", (SELECT title FROM node WHERE id = type) AS "Тип объявления", st.street AS "Улица", house AS "Дом", liter AS "Литер", storey AS "Этаж/Этажность", numstorey AS Этажность, (SELECT title FROM project WHERE id_project = project) AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3 FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)	select id_apartment as "идентификатор", (select title from node where id = type) as "тип объявления", st.street as "улица", house as "дом", liter as "литер", storey as "этаж/этажность", numstorey as этажность, (select title from project where id_project = project) as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3 from apartment ap left join street st on(ap.street = st.id_street)	1493921624441	\N	\N	\N	\N
643	SELECT	\N	SELECT id_apartment AS "Идентификатор", (SELECT title FROM node WHERE id = type) AS "Тип объявления", st.street AS "Улица", house AS "Дом", liter AS "Литер", storey AS "Этаж/Этажность", numstorey AS Этажность, (SELECT title FROM project WHERE id_project = project) AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3 FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LIMIT 10	select id_apartment as "идентификатор", (select title from node where id = type) as "тип объявления", st.street as "улица", house as "дом", liter as "литер", storey as "этаж/этажность", numstorey as этажность, (select title from project where id_project = project) as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3 from apartment ap left join street st on(ap.street = st.id_street) limit 10	1493921650528	\N	\N	\N	\N
383	SELECT	\N	SELECT c.title AS Страна, r.title AS Область, districts AS РайонОкруг, ci.title AS Город, id_city, street AS Улица, id_street FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY Страна, Область, Город, Улица	select c.title as страна, r.title as область, districts as районокруг, ci.title as город, id_city, street as улица, id_street from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by страна, область, город, улица	1492937560549	\N	\N	\N	\N
644	SELECT	\N	select * from apartment limit 10	select * from apartment limit 10	1493921702133	\N	\N	\N	\N
873	CREATE	\N	CREATE TABLE IF NOT EXISTS cottages (\r\n\tid_cottages bigserial PRIMARY KEY,  \r\n\tagent integer,\r\n\ttype bigint,\r\n\tstreet integer,\r\n\tstorey smallint, \r\n\tprice integer,\r\n\tarea_house float,\r\n\tarea_land float,\r\n\tmaterial smallint,\r\n\tnote text,\r\n\tnode_id bigint references node(id) ON DELETE CASCADE)	create table if not exists cottages (\r\n\tid_cottages bigserial primary key,  \r\n\tagent integer,\r\n\ttype bigint,\r\n\tstreet integer,\r\n\tstorey smallint, \r\n\tprice integer,\r\n\tarea_house float,\r\n\tarea_land float,\r\n\tmaterial smallint,\r\n\tnote text,\r\n\tnode_id bigint references node(id) on delete cascade)	1516996489614	\N	\N	\N	\N
401	UPDATE	\N	UPDATE parser SET section = '2' WHERE id >1923 AND id < 2040	update parser set section = '2' where id >1923 and id < 2040	1492951317586	\N	\N	\N	\N
689	SELECT	\N	select * from city order by title	select * from city order by title	1494215336769	\N	\N	\N	\N
715	SELECT	\N	SELECT id_street, street || ', ' || title AS street FROM street LEFT JOIN city ON(city_id = id_city) ORDER BY city_id, street	select id_street, street || ', ' || title as street from street left join city on(city_id = id_city) order by city_id, street	1494254049333	\N	\N	\N	\N
419	SELECT	\N	select * from node	select * from node	1493036951679	\N	\N	\N	\N
438	UPDATE	\N	UPDATE parser SET section = 'КОМНАТЫ' WHERE id >1507 AND id < 1518	update parser set section = 'комнаты' where id >1507 and id < 1518	1493102683319	\N	\N	\N	\N
899	SELECT	\N	select * from parser_commercial	select * from parser_commercial	1517507324719	\N	\N	\N	\N
742	SELECT	\N	select table_name, column_name from information_schema.columns where table_schema='apartment'	select table_name, column_name from information_schema.columns where table_schema='apartment'	1495295355975	\N	\N	\N	\N
743	SELECT	\N	SELECT column_name, column_default, data_type FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'apartment'	select column_name, column_default, data_type from information_schema.columns where table_name = 'apartment'	1495295392198	\N	\N	\N	\N
785	SELECT	\N	select max(id_user) from users	select max(id_user) from users	1512484860533	1	\N	\N	\N
777	SELECT	\N	select distinct tel from userdata	select distinct tel from userdata	1501597729468	\N	\N	\N	\N
810	SELECT	\N	SELECT section, id AS Редактирование, (SELECT title FROM node WHERE id = a.type) AS Тип, title AS Заголовок, (SELECT  street || '[' || title || ']' AS Улица FROM city, street WHERE id_city = city_id AND id_street = a.street) AS Улица, house AS Дом, liter AS Литер, price AS Цена, op AS Опека, (SELECT  fio || '[' || CASE WHEN agency = 0 THEN 'ИП' ELSE (SELECT title FROM node, agency WHERE id = node_id AND id = agency) END || ']' FROM users, userdata WHERE id_user = user_id AND id_user = a.agent) AS Владелец, (SELECT fio || ' - '|| CASE WHEN role_id > 0 THEN 'Модер.' WHEN moderator > 0 THEN 'Модер. агенства' WHEN email = '14abcd17@mail.ru' THEN 'Администр.' ELSE 'Агент' END FROM users , userdata WHERE id_user = user_id AND email = author) AS Сохранил, date_create AS ДатаСохр, (SELECT fio || ' - '|| CASE WHEN role_id > 0 THEN 'Модер.' WHEN moderator > 0 THEN 'Модер. агенства' WHEN email = '14abcd17@mail.ru' THEN 'Администр.' ELSE 'Агент' END FROM users , userdata WHERE id_user = user_id AND email = author_edit) AS Правил, date_edit AS ДатаПравки FROM node n, apartment a WHERE id = node_id AND section = ANY(SELECT section FROM node) AND agent = ANY(SELECT agent FROM apartment) AND street = ANY(SELECT street FROM apartment) AND price IN(SELECT price FROM apartment) ORDER BY Улица, Дом, Цена	select section, id as редактирование, (select title from node where id = a.type) as тип, title as заголовок, (select  street || '[' || title || ']' as улица from city, street where id_city = city_id and id_street = a.street) as улица, house as дом, liter as литер, price as цена, op as опека, (select  fio || '[' || case when agency = 0 then 'ип' else (select title from node, agency where id = node_id and id = agency) end || ']' from users, userdata where id_user = user_id and id_user = a.agent) as владелец, (select fio || ' - '|| case when role_id > 0 then 'модер.' when moderator > 0 then 'модер. агенства' when email = '14abcd17@mail.ru' then 'администр.' else 'агент' end from users , userdata where id_user = user_id and email = author) as сохранил, date_create as датасохр, (select fio || ' - '|| case when role_id > 0 then 'модер.' when moderator > 0 then 'модер. агенства' when email = '14abcd17@mail.ru' then 'администр.' else 'агент' end from users , userdata where id_user = user_id and email = author_edit) as правил, date_edit as датаправки from node n, apartment a where id = node_id and section = any(select section from node) and agent = any(select agent from apartment) and street = any(select street from apartment) and price in(select price from apartment) order by улица, дом, цена	1513448868733	\N	\N	\N	\N
836	SELECT	\N	select * from node, agency where id = node_id limit 3	select * from node, agency where id = node_id limit 3	1515737895246	\N	\N	\N	\N
786	SELECT	\N	select pg_catalog.setval('users_id_user_seq', 538, true)	select pg_catalog.setval('users_id_user_seq', 538, true)	1512484888307	1	\N	\N	\N
926	SELECT	\N	SELECT DISTINCT template FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'appartment', 'commercial')	select distinct template from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'appartment', 'commercial')	1517753612936	\N	\N	\N	\N
645	SELECT	\N	SELECT id_apartment AS "Идентификатор", (SELECT title FROM node WHERE id = type) AS "Тип объявления", st.street AS "Улица", house AS "Дом", liter AS "Литер", storey AS "Этаж/Этажность", numstorey AS Этажность, (SELECT title FROM project WHERE id_project = project) AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3, (SELECT title FROM toilet WHERE id_toilet = toilet) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LIMIT 10	select id_apartment as "идентификатор", (select title from node where id = type) as "тип объявления", st.street as "улица", house as "дом", liter as "литер", storey as "этаж/этажность", numstorey as этажность, (select title from project where id_project = project) as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3, (select title from toilet where id_toilet = toilet) from apartment ap left join street st on(ap.street = st.id_street) limit 10	1493921945817	\N	\N	\N	\N
368	SELECT	\N	SELECT * FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) ORDER BY street	select * from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) order by street	1492935434077	\N	\N	\N	\N
402	UPDATE	\N	UPDATE parser SET section = '3' WHERE id >2040 AND id < 2137	update parser set section = '3' where id >2040 and id < 2137	1492951446253	\N	\N	\N	\N
669	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, ci.title AS Город, re.title AS Область, di.districts AS Район, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, ci.title as город, re.title as область, di.districts as район, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts)	1493967475382	\N	\N	\N	\N
690	SELECT	\N	SELECT * FROM city LEFT JOIN region ON(region_id = id_region)	select * from city left join region on(region_id = id_region)	1494215492849	\N	\N	\N	\N
716	SELECT	\N	SELECT DISTINCT agent FROM apartment	select distinct agent from apartment	1494266775367	\N	\N	\N	\N
420	SELECT	\N	select * from country	select * from country	1493037035034	\N	\N	\N	\N
439	UPDATE	\N	UPDATE parser SET section = '1' WHERE id >1517 AND id < 1621	update parser set section = '1' where id >1517 and id < 1621	1493102798977	\N	\N	\N	\N
849	DROP	\N	DROP TABLE IF EXISTS agency	drop table if exists agency	1515740519005	\N	\N	\N	\N
874	ERROR	relation "parser_cottages" does not exist	select * from parser_cottages	select * from parser_cottages	1516996617215	\N	\N	\N	\N
778	SELECT	\N	select * from userdata ORDER BY tel	select * from userdata order by tel	1501597817818	\N	\N	\N	\N
787	SELECT	\N	select pg_catalog.setval('users_id_user_seq', 550, true)	select pg_catalog.setval('users_id_user_seq', 550, true)	1512594892008	\N	\N	\N	\N
811	SELECT	\N	select * from role	select * from role	1514976954298	\N	\N	\N	\N
900	UPDATE	\N	UPDATE parser_commercial SET price = 0 WHERE id  IN(41, 9)	update parser_commercial set price = 0 where id  in(41, 9)	1517507456707	\N	\N	\N	\N
927	SELECT	\N	SELECT DISTINCT template FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'apartment', 'commercial')	select distinct template from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'apartment', 'commercial')	1517753642395	\N	\N	\N	\N
947	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id) LEFT JOIN userdata ON(agent = id_userdata) WHERE template = 'apartment' AND agency = 7 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN cottages ON(id = node_id) LEFT JOIN userdata ON(agent = id_userdata) WHERE template = 'cottages' AND agency = 7 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN commercial ON(id = node_id) LEFT JOIN userdata ON(agent = id_userdata) WHERE template = 'commercial' AND agency = 7	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id) left join userdata on(agent = id_userdata) where template = 'apartment' and agency = 7 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join cottages on(id = node_id) left join userdata on(agent = id_userdata) where template = 'cottages' and agency = 7 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join commercial on(id = node_id) left join userdata on(agent = id_userdata) where template = 'commercial' and agency = 7	1517761002010	\N	\N	\N	\N
966	SELECT	\N	SELECT DISTINCT c.title, c.id_city, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND districts_id IS NULL	select distinct c.title, c.id_city, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and districts_id is null	1517938937247	\N	\N	\N	\N
646	SELECT	\N	SELECT id_apartment AS "Идентиф.", (SELECT title FROM node WHERE id = type) AS "Тип объяв.", st.street AS "Улица", house AS Дом, liter AS Литер, storey AS "Этаж/Этажность", numstorey AS Этажность, (SELECT title FROM project WHERE id_project = project) AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3, (SELECT title FROM toilet WHERE id_toilet = toilet) AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)	select id_apartment as "идентиф.", (select title from node where id = type) as "тип объяв.", st.street as "улица", house as дом, liter as литер, storey as "этаж/этажность", numstorey as этажность, (select title from project where id_project = project) as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3, (select title from toilet where id_toilet = toilet) as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join street st on(ap.street = st.id_street)	1493957776912	\N	\N	\N	\N
670	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, ci.title || ', '  || re.title || ', ' || di.districts AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, ci.title || ', '  || re.title || ', ' || di.districts as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts)	1493967626562	\N	\N	\N	\N
691	SELECT	\N	SELECT * FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region)	select * from city ci left join region re on(ci.region_id = re.id_region)	1494215541343	\N	\N	\N	\N
850	DROP	\N	DROP TABLE IF EXISTS apartment	drop table if exists apartment	1515740558793	\N	\N	\N	\N
717	SELECT	\N	SELECT fio FROM users LEFT JOIN userdata ON(id_user = user_id) WHERE id_user IN(SELECT DISTINCT agent FROM apartment)	select fio from users left join userdata on(id_user = user_id) where id_user in(select distinct agent from apartment)	1494266940416	\N	\N	\N	\N
370	SELECT	\N	SELECT * FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.id_region = c.id) ORDER BY street	select * from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.id_region = c.id) order by street	1492935779788	\N	\N	\N	\N
384	SELECT	\N	SELECT c.title AS Страна, r.title AS Область, districts AS РайонОкруг, ci.title AS Город,  street AS Улица, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY Страна, Область, Город, Улица	select c.title as страна, r.title as область, districts as районокруг, ci.title as город,  street as улица, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by страна, область, город, улица	1492937989867	\N	\N	\N	\N
403	UPDATE	\N	UPDATE parser SET section = '4' WHERE id >2137 AND id < 2156	update parser set section = '4' where id >2137 and id < 2156	1492951603110	\N	\N	\N	\N
875	CREATE	\N	CREATE TABLE IF NOT EXISTS parser_cottages(\r\n\tid SERIAL PRIMARY KEY,  \r\n\tnote text,\r\n\tprice text, \r\n\ttel text, \r\n\tsection text)	create table if not exists parser_cottages(\r\n\tid serial primary key,  \r\n\tnote text,\r\n\tprice text, \r\n\ttel text, \r\n\tsection text)	1516996705982	\N	\N	\N	\N
901	DELETE	\N	delete from parser_commercial WHERE id IN(109, 110)	delete from parser_commercial where id in(109, 110)	1517507583708	\N	\N	\N	\N
421	SELECT	\N	select * from node, apartment where id=node_id	select * from node, apartment where id=node_id	1493042855419	1	\N	\N	\N
928	SELECT	\N	SELECT DISTINCT template, count(*) OVER (PARTITION BY template) AS sum FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'apartment', 'commercial')	select distinct template, count(*) over (partition by template) as sum from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'apartment', 'commercial')	1517753735312	\N	\N	\N	\N
745	SELECT	\N	select 1	select 1	1495298914362	\N	\N	\N	\N
779	SELECT	\N	select * from userdata ORDER BY fio	select * from userdata order by fio	1501597993492	\N	\N	\N	\N
788	SELECT	\N	select * from users where email = 'bcd@mail.ru'	select * from users where email = 'bcd@mail.ru'	1513014713789	\N	\N	\N	\N
812	SELECT	\N	select * from node where template = 'agency'	select * from node where template = 'agency'	1514980706139	\N	\N	\N	\N
838	CREATE	\N	CREATE TABLE IF NOT EXISTS parser(\r\n\tid SERIAL PRIMARY KEY, \r\n\tstreet text, \r\n\thouse text, \r\n\tliter text, \r\n\tstorey text, \r\n\tproject text, \r\n\tprice text, \r\n\tarea text, \r\n\ttoilet text, \r\n\tbalcony text, \r\n\top text, \r\n\tnote text, \r\n\ttel text, \r\n\tsection text)	create table if not exists parser(\r\n\tid serial primary key, \r\n\tstreet text, \r\n\thouse text, \r\n\tliter text, \r\n\tstorey text, \r\n\tproject text, \r\n\tprice text, \r\n\tarea text, \r\n\ttoilet text, \r\n\tbalcony text, \r\n\top text, \r\n\tnote text, \r\n\ttel text, \r\n\tsection text)	1515738357834	\N	\N	\N	\N
851	DROP	\N	DROP TABLE IF EXISTS article	drop table if exists article	1515740619857	\N	\N	\N	\N
371	SELECT	\N	SELECT id_street, street, ci.title, r.title, c.title FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.id_region = c.id) ORDER BY street	select id_street, street, ci.title, r.title, c.title from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.id_region = c.id) order by street	1492935881636	\N	\N	\N	\N
876	CREATE	\N	CREATE TABLE IF NOT EXISTS material(id_material SERIAL PRIMARY KEY, title text, priority integer)	create table if not exists material(id_material serial primary key, title text, priority integer)	1516997371402	\N	\N	\N	\N
404	SELECT	\N	SELECT c.title AS Страна, r.title AS Область, districts AS РайонОкруг, ci.title AS Город, street AS Улица, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY Страна, Область, Город, Улица	select c.title as страна, r.title as область, districts as районокруг, ci.title as город, street as улица, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by страна, область, город, улица	1492963863537	\N	\N	\N	\N
902	ALTER	\N	ALTER TABLE userdata ADD COLUMN code_price_commercial text default '11111111'	alter table userdata add column code_price_commercial text default '11111111'	1517548754467	\N	\N	\N	\N
406	SELECT	\N	SELECT * FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id)	select * from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id)	1492963921807	\N	\N	\N	\N
929	SELECT	\N	SELECT DISTINCT template, (SELECT name FROM permit WHERE temp = template), count(*) OVER (PARTITION BY template) AS sum FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'apartment', 'commercial')	select distinct template, (select name from permit where temp = template), count(*) over (partition by template) as sum from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'apartment', 'commercial')	1517753907190	\N	\N	\N	\N
948	SELECT	\N	SELECT section, id AS Редактирование, (SELECT title FROM node WHERE id = type) AS Тип, title AS Заголовок, (SELECT street || ' [' || title || ']' AS Улица FROM city, street WHERE id_city = city_id AND id_street = c.street) AS Улица, price AS Цена, (SELECT title FROM node WHERE id = agency) AS Агенство, fio AS Владелец, date_create AS ДатаВнесения FROM apartment c LEFT JOIN node ON(node_id = id) LEFT JOIN street s ON(c.street = s.id_street) LEFT JOIN userdata ON(user_id = agent) WHERE s.city_id = 116 AND section IN(61, 62, 63, 80, 60) AND agent = 296 AND c.street IN(6, 1234, 9, 1233) AND price IN(SELECT price FROM cottages) ORDER BY Улица, Цена	select section, id as редактирование, (select title from node where id = type) as тип, title as заголовок, (select street || ' [' || title || ']' as улица from city, street where id_city = city_id and id_street = c.street) as улица, price as цена, (select title from node where id = agency) as агенство, fio as владелец, date_create as датавнесения from apartment c left join node on(node_id = id) left join street s on(c.street = s.id_street) left join userdata on(user_id = agent) where s.city_id = 116 and section in(61, 62, 63, 80, 60) and agent = 296 and c.street in(6, 1234, 9, 1233) and price in(select price from cottages) order by улица, цена	1517838581946	\N	\N	\N	\N
692	SELECT	\N	SELECT id_city, ci.title,  re.title FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region)	select id_city, ci.title,  re.title from city ci left join region re on(ci.region_id = re.id_region)	1494215590401	\N	\N	\N	\N
718	SELECT	\N	SELECT fio FROM users LEFT JOIN userdata ON(id_user = user_id) WHERE id_user IN(SELECT DISTINCT agent FROM apartment) ORDER BY fio	select fio from users left join userdata on(id_user = user_id) where id_user in(select distinct agent from apartment) order by fio	1494266971541	\N	\N	\N	\N
746	SELECT	\N	select op from apartment where op IS NULL	select op from apartment where op is null	1495299611870	\N	\N	\N	\N
967	SELECT	\N	SELECT DISTINCT c.title, c.id_city, region_id, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND districts_id IS NULL	select distinct c.title, c.id_city, region_id, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and districts_id is null	1517939034071	\N	\N	\N	\N
991	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN city ci ON(st.city_id = ci.id_city) WHERE districts_id IS NOT NULL	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from apartment ap left join street st on(ap.street = st.id_street) left join city ci on(st.city_id = ci.id_city) where districts_id is not null	1518087503979	\N	\N	\N	\N
423	SELECT	\N	select * from users, userdata where id_user=user_id	select * from users, userdata where id_user=user_id	1493044777967	1	\N	\N	\N
1006	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM commercial ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title = 'Татарстан'	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from commercial ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null and re.title = 'татарстан'	1518089419559	\N	\N	\N	\N
852	CREATE	\N	CREATE TABLE IF NOT EXISTS node(\r\n\tid bigserial PRIMARY KEY, \r\n\ttitle varchar(1000) collate rus, \r\n\talias varchar(1000), \r\n\tdate_create bigint, \r\n\tdate_edit bigint, \r\n\tauthor integer, \r\n\tauthor_edit integer, \r\n\tstatus smallint, \r\n\tmain smallint, \r\n\ttemplate varchar(60), \r\n\tsection bigint, \r\n\tline bigint)	create table if not exists node(\r\n\tid bigserial primary key, \r\n\ttitle varchar(1000) collate rus, \r\n\talias varchar(1000), \r\n\tdate_create bigint, \r\n\tdate_edit bigint, \r\n\tauthor integer, \r\n\tauthor_edit integer, \r\n\tstatus smallint, \r\n\tmain smallint, \r\n\ttemplate varchar(60), \r\n\tsection bigint, \r\n\tline bigint)	1515741233946	\N	\N	\N	\N
317	SELECT	\N	SELECT id AS Редактирование, (SELECT title FROM node WHERE id = a.type) AS Тип, title AS Заголовок, (SELECT street || '[' || title || ']' AS Улица FROM city, street WHERE id_city = city_id AND id_street = a.street) AS Улица, house AS Дом, liter AS Литер, price AS Цена, op AS Опека, (SELECT fio || '[' || CASE WHEN agency = 0 THEN 'ИП' ELSE (SELECT title FROM node, agency WHERE id = node_id AND id = agency) END || ']' FROM users, userdata WHERE id_user = user_id AND id_user = a.agent) AS Владелец, (SELECT fio || ' - '|| CASE WHEN role_id > 0 THEN 'Модер.' WHEN moderator > 0 THEN 'Модер. агенства' ELSE 'Агент' END FROM users , userdata WHERE id_user = user_id AND email = author) AS Сохранил, date_create AS ДатаСохр, (SELECT fio || ' - '|| CASE WHEN role_id > 0 THEN 'Модер.' WHEN moderator > 0 THEN 'Модер. агенства' WHEN email = 'bcd@mail.ru' THEN 'Администр.' ELSE 'Агент' END FROM users , userdata WHERE id_user = user_id AND email = author_edit) AS Правил, date_edit AS ДатаПравки, section FROM node n, apartment a WHERE id = node_id AND section = ANY(SELECT section FROM node) ORDER BY Улица	select id as редактирование, (select title from node where id = a.type) as тип, title as заголовок, (select street || '[' || title || ']' as улица from city, street where id_city = city_id and id_street = a.street) as улица, house as дом, liter as литер, price as цена, op as опека, (select fio || '[' || case when agency = 0 then 'ип' else (select title from node, agency where id = node_id and id = agency) end || ']' from users, userdata where id_user = user_id and id_user = a.agent) as владелец, (select fio || ' - '|| case when role_id > 0 then 'модер.' when moderator > 0 then 'модер. агенства' else 'агент' end from users , userdata where id_user = user_id and email = author) as сохранил, date_create as датасохр, (select fio || ' - '|| case when role_id > 0 then 'модер.' when moderator > 0 then 'модер. агенства' when email = 'bcd@mail.ru' then 'администр.' else 'агент' end from users , userdata where id_user = user_id and email = author_edit) as правил, date_edit as датаправки, section from node n, apartment a where id = node_id and section = any(select section from node) order by улица	1492347692732	\N	\N	\N	\N
372	SELECT	\N	SELECT s.id_street, s.street, ci.title, r.title, c.title FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.id_region = c.id) ORDER BY street	select s.id_street, s.street, ci.title, r.title, c.title from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.id_region = c.id) order by street	1492935918184	\N	\N	\N	\N
386	SELECT	\N	SELECT c.title AS Страна, r.title AS Область, districts AS РайонОкруг, ci.title AS Город, street AS Улица, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY ci.title = 'Нижнекамск', Страна, Область, Город, Улица	select c.title as страна, r.title as область, districts as районокруг, ci.title as город, street as улица, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by ci.title = 'нижнекамск', страна, область, город, улица	1492946653842	\N	\N	\N	\N
407	SELECT	\N	SELECT id_street, c.title AS Страна, r.title AS Область, districts AS РайонОкруг, ci.title AS Город, street AS Улица, id_city FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN districts d ON (ci.districts_id = d.id_districts) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.country_id = c.id) ORDER BY Страна, Область, Город, Улица	select id_street, c.title as страна, r.title as область, districts as районокруг, ci.title as город, street as улица, id_city from street s left join city ci on (s.city_id = ci.id_city) left join districts d on (ci.districts_id = d.id_districts) left join region r on (ci.region_id = r.id_region) left join country c on (r.country_id = c.id) order by страна, область, город, улица	1492964710101	\N	\N	\N	\N
424	DELETE	\N	delete from apartment where node_id = 94	delete from apartment where node_id = 94	1493048261953	\N	\N	\N	\N
877	ALTER	\N	ALTER TABLE userdata ADD COLUMN code_price_cottages text default '11111111111'	alter table userdata add column code_price_cottages text default '11111111111'	1516997891444	\N	\N	\N	\N
903	ALTER	\N	ALTER TABLE cottages ADD COLUMN kdn text	alter table cottages add column kdn text	1517565982347	\N	\N	\N	\N
693	SELECT	\N	SELECT id_city, ci.title AS Город, re.title AS Область FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region)	select id_city, ci.title as город, re.title as область from city ci left join region re on(ci.region_id = re.id_region)	1494215650927	\N	\N	\N	\N
719	SELECT	\N	SELECT id_user, fio || ', ' || (SELECT title FROM node WHERE id = agency) FROM users LEFT JOIN userdata ON(id_user = user_id) WHERE id_user IN(SELECT DISTINCT agent FROM apartment) ORDER BY fio	select id_user, fio || ', ' || (select title from node where id = agency) from users left join userdata on(id_user = user_id) where id_user in(select distinct agent from apartment) order by fio	1494267179354	\N	\N	\N	\N
747	SELECT	\N	select op from apartment where op IS NOT NULL	select op from apartment where op is not null	1495299652132	\N	\N	\N	\N
930	SELECT	\N	SELECT DISTINCT template AS Шаблон, (SELECT name FROM permit WHERE temp = template), count(*) OVER (PARTITION BY template) AS sum FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'apartment', 'commercial')	select distinct template as шаблон, (select name from permit where temp = template), count(*) over (partition by template) as sum from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'apartment', 'commercial')	1517754031138	\N	\N	\N	\N
791	SELECT	\N	select * from users, userdata where id_user = user_id and id_user = 265	select * from users, userdata where id_user = user_id and id_user = 265	1513110597446	\N	\N	\N	\N
814	SELECT	\N	select * from node WHERE alias = 'prodam'	select * from node where alias = 'prodam'	1515440854869	\N	\N	\N	\N
949	SELECT	\N	select * from userdata limit 3	select * from userdata limit 3	1517865563430	\N	\N	\N	\N
968	ALTER	\N	ALTER TABLE users ADD COLUMN default_districts integer	alter table users add column default_districts integer	1517946936296	\N	\N	\N	\N
999	SELECT	\N	select * from city limit 1	select * from city limit 1	1518088761641	\N	\N	\N	\N
373	SELECT	\N	SELECT s.id_street, s.street, ci.title, r.title, c.title FROM street s LEFT JOIN city ci ON (s.city_id = ci.id_city) LEFT JOIN region r ON (ci.region_id = r.id_region) LEFT JOIN country c ON (r.id_region = c.id) ORDER BY s.street	select s.id_street, s.street, ci.title, r.title, c.title from street s left join city ci on (s.city_id = ci.id_city) left join region r on (ci.region_id = r.id_region) left join country c on (r.id_region = c.id) order by s.street	1492936018375	\N	\N	\N	\N
325	SELECT	\N	SELECT section, id AS Редактирование, (SELECT title FROM node WHERE id = a.type) AS Тип, title AS Заголовок, (SELECT  street || '[' || title || ']' AS Улица FROM city, street WHERE id_city = city_id AND id_street = a.street) AS Улица, house AS Дом, liter AS Литер, price AS Цена, op AS Опека, (SELECT  fio || '[' || CASE WHEN agency = 0 THEN 'ИП' ELSE (SELECT title FROM node, agency WHERE id = node_id AND id = agency) END || ']' FROM users, userdata WHERE id_user = user_id AND id_user = a.agent) AS Владелец, (SELECT fio || ' - '|| CASE WHEN role_id > 0 THEN 'Модер.' WHEN moderator > 0 THEN 'Модер. агенства' WHEN email = 'a1@mail.ru' THEN 'Администр.' ELSE 'Агент' END FROM users , userdata WHERE id_user = user_id AND email = author) AS Сохранил, date_create AS ДатаСохр, (SELECT fio || ' - '|| CASE WHEN role_id > 0 THEN 'Модер.' WHEN moderator > 0 THEN 'Модер. агенства' WHEN email =  'a1@mail.ru' THEN 'Администр.' ELSE 'Агент' END FROM users , userdata WHERE id_user = user_id AND email = author_edit) AS Правил, date_edit AS ДатаПравки FROM node n, apartment a WHERE id = node_id AND section = ANY(SELECT section FROM node) ORDER BY Улица	select section, id as редактирование, (select title from node where id = a.type) as тип, title as заголовок, (select  street || '[' || title || ']' as улица from city, street where id_city = city_id and id_street = a.street) as улица, house as дом, liter as литер, price as цена, op as опека, (select  fio || '[' || case when agency = 0 then 'ип' else (select title from node, agency where id = node_id and id = agency) end || ']' from users, userdata where id_user = user_id and id_user = a.agent) as владелец, (select fio || ' - '|| case when role_id > 0 then 'модер.' when moderator > 0 then 'модер. агенства' when email = 'a1@mail.ru' then 'администр.' else 'агент' end from users , userdata where id_user = user_id and email = author) as сохранил, date_create as датасохр, (select fio || ' - '|| case when role_id > 0 then 'модер.' when moderator > 0 then 'модер. агенства' when email =  'a1@mail.ru' then 'администр.' else 'агент' end from users , userdata where id_user = user_id and email = author_edit) as правил, date_edit as датаправки from node n, apartment a where id = node_id and section = any(select section from node) order by улица	1492364990523	\N	\N	\N	\N
853	CREATE	\N	CREATE TABLE IF NOT EXISTS article (\r\n\tid_article bigserial PRIMARY KEY, \r\n\tdescription varchar(2000) collate rus, \r\n\tcontent text collate rus, \r\n\tpriority bigint, \r\n\tnode_id bigint references node(id) ON DELETE CASCADE)	create table if not exists article (\r\n\tid_article bigserial primary key, \r\n\tdescription varchar(2000) collate rus, \r\n\tcontent text collate rus, \r\n\tpriority bigint, \r\n\tnode_id bigint references node(id) on delete cascade)	1515741281114	\N	\N	\N	\N
327	SELECT	\N	SELECT section, id AS Редактирование, (SELECT title FROM node WHERE id = a.type) AS Тип, title AS Заголовок, (SELECT  street || '[' || title || ']' AS Улица FROM city, street WHERE id_city = city_id AND id_street = a.street) AS Улица, house AS Дом, liter AS Литер, price AS Цена, op AS Опека, (SELECT  fio || '[' || CASE WHEN agency = 0 THEN 'ИП' ELSE (SELECT title FROM node, agency WHERE id = node_id AND id = agency) END || ']' FROM users, userdata WHERE id_user = user_id AND id_user = a.agent) AS Владелец, (SELECT fio || ' - '|| CASE WHEN role_id > 0 THEN 'Модер.' WHEN moderator > 0 THEN 'Модер. агенства' WHEN email = 'bcd@mail.ru' THEN 'Администр.' ELSE 'Агент' END FROM users , userdata WHERE id_user = user_id AND email = author) AS Сохранил, date_create AS ДатаСохр, (SELECT fio || ' - '|| CASE WHEN role_id > 0 THEN 'Модер.' WHEN moderator > 0 THEN 'Модер. агенства' WHEN email =  'bcd@mail.ru' THEN 'Администр.' ELSE 'Агент' END FROM users , userdata WHERE id_user = user_id AND email = author_edit) AS Правил, date_edit AS ДатаПравки FROM node n, apartment a WHERE id = node_id AND section = ANY(SELECT section FROM node) ORDER BY Улица	select section, id as редактирование, (select title from node where id = a.type) as тип, title as заголовок, (select  street || '[' || title || ']' as улица from city, street where id_city = city_id and id_street = a.street) as улица, house as дом, liter as литер, price as цена, op as опека, (select  fio || '[' || case when agency = 0 then 'ип' else (select title from node, agency where id = node_id and id = agency) end || ']' from users, userdata where id_user = user_id and id_user = a.agent) as владелец, (select fio || ' - '|| case when role_id > 0 then 'модер.' when moderator > 0 then 'модер. агенства' when email = 'bcd@mail.ru' then 'администр.' else 'агент' end from users , userdata where id_user = user_id and email = author) as сохранил, date_create as датасохр, (select fio || ' - '|| case when role_id > 0 then 'модер.' when moderator > 0 then 'модер. агенства' when email =  'bcd@mail.ru' then 'администр.' else 'агент' end from users , userdata where id_user = user_id and email = author_edit) as правил, date_edit as датаправки from node n, apartment a where id = node_id and section = any(select section from node) order by улица	1492408528161	\N	\N	\N	\N
854	CREATE	\N	CREATE TABLE IF NOT EXISTS apartment (\r\n\tid_apartment bigserial PRIMARY KEY, \r\n\ttype bigint, \r\n\tagent integer, \r\n\tstreet integer, \r\n\thouse text, \r\n\tliter text, \r\n\tstorey smallint, \r\n\tnumstorey smallint, \r\n\tprice integer, \r\n\tarea1 float, \r\n\tarea2 float, \r\n\tarea3 float, \r\n\top smallint, \r\n\tproject integer, \r\n\ttoilet integer,\r\n\tbalcony smallint,\r\n\tnote text,\r\n\tnode_id bigint references node(id) ON DELETE CASCADE)	create table if not exists apartment (\r\n\tid_apartment bigserial primary key, \r\n\ttype bigint, \r\n\tagent integer, \r\n\tstreet integer, \r\n\thouse text, \r\n\tliter text, \r\n\tstorey smallint, \r\n\tnumstorey smallint, \r\n\tprice integer, \r\n\tarea1 float, \r\n\tarea2 float, \r\n\tarea3 float, \r\n\top smallint, \r\n\tproject integer, \r\n\ttoilet integer,\r\n\tbalcony smallint,\r\n\tnote text,\r\n\tnode_id bigint references node(id) on delete cascade)	1515741310310	\N	\N	\N	\N
329	SELECT	\N	SELECT section, id AS Редактирование, (SELECT title FROM node WHERE id = a.type) AS Тип, title AS Заголовок, (SELECT  street || '[' || title || ']' AS Улица FROM city, street WHERE id_city = city_id AND id_street = a.street) AS Улица, house AS Дом, liter AS Литер, price AS Цена, op AS Опека, (SELECT  fio || '[' || CASE WHEN agency = 0 THEN 'ИП' ELSE (SELECT title FROM node, agency WHERE id = node_id AND id = agency) END || ']' FROM users, userdata WHERE id_user = user_id AND id_user = a.agent) AS Владелец, (SELECT fio || ' - '|| CASE WHEN role_id > 0 THEN 'Модер.' WHEN moderator > 0 THEN 'Модер. агенства' WHEN email = 'bcd@mail.ru' THEN 'Администр.' ELSE 'Агент' END FROM users , userdata WHERE id_user = user_id AND email = author) AS Сохранил, date_create AS ДатаСохр, (SELECT fio || ' - '|| CASE WHEN role_id > 0 THEN 'Модер.' WHEN moderator > 0 THEN 'Модер. агенства' WHEN email =  'bcd@mail.ru' THEN 'Администр.' ELSE 'Агент' END FROM users , userdata WHERE id_user = user_id AND email = author_edit) AS Правил, date_edit AS ДатаПравки FROM node n, apartment a WHERE id = node_id AND agent = 21 AND section = ANY(SELECT section FROM node) ORDER BY Улица	select section, id as редактирование, (select title from node where id = a.type) as тип, title as заголовок, (select  street || '[' || title || ']' as улица from city, street where id_city = city_id and id_street = a.street) as улица, house as дом, liter as литер, price as цена, op as опека, (select  fio || '[' || case when agency = 0 then 'ип' else (select title from node, agency where id = node_id and id = agency) end || ']' from users, userdata where id_user = user_id and id_user = a.agent) as владелец, (select fio || ' - '|| case when role_id > 0 then 'модер.' when moderator > 0 then 'модер. агенства' when email = 'bcd@mail.ru' then 'администр.' else 'агент' end from users , userdata where id_user = user_id and email = author) as сохранил, date_create as датасохр, (select fio || ' - '|| case when role_id > 0 then 'модер.' when moderator > 0 then 'модер. агенства' when email =  'bcd@mail.ru' then 'администр.' else 'агент' end from users , userdata where id_user = user_id and email = author_edit) as правил, date_edit as датаправки from node n, apartment a where id = node_id and agent = 21 and section = any(select section from node) order by улица	1492410552015	\N	\N	\N	\N
425	SELECT	\N	select * from node where id = 94	select * from node where id = 94	1493048465770	\N	\N	\N	\N
878	SELECT	\N	SELECT id_street, street || ' | ' || title AS street FROM street LEFT JOIN city ON(city_id = id_city) WHERE id_street = ANY(SELECT st.id_street FROM apartment c LEFT JOIN street st ON (c.street = st.id_street) LEFT JOIN city ci ON (ci.id_city = st.city_id) GROUP BY st.id_street)	select id_street, street || ' | ' || title as street from street left join city on(city_id = id_city) where id_street = any(select st.id_street from apartment c left join street st on (c.street = st.id_street) left join city ci on (ci.id_city = st.city_id) group by st.id_street)	1517038447292	\N	\N	\N	\N
855	CREATE	\N	CREATE TABLE IF NOT EXISTS agency (id_agency bigserial PRIMARY KEY, note text collate rus, city_id integer, node_id bigint references node(id) ON DELETE CASCADE)	create table if not exists agency (id_agency bigserial primary key, note text collate rus, city_id integer, node_id bigint references node(id) on delete cascade)	1515741385484	\N	\N	\N	\N
672	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title || ', ' ELSE '' END|| CASE WHEN character_length(re.title) > 0 THEN re.title || ', ' ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN di.districts || ', ' ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title || ', ' else '' end|| case when character_length(re.title) > 0 then re.title || ', ' else '' end || case when character_length(di.districts) > 0 then di.districts || ', ' else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts)	1494055399965	\N	\N	\N	\N
879	SELECT	\N	SELECT id_street, street || ' | ' || title AS street FROM street LEFT JOIN city ON(city_id = id_city) WHERE id_street = ANY(SELECT st.id_street FROM apartment c LEFT JOIN street st ON (c.street = st.id_street) LEFT JOIN city ci ON (ci.id_city = st.city_id) GROUP BY st.id_street) ORDER BY select_default, street	select id_street, street || ' | ' || title as street from street left join city on(city_id = id_city) where id_street = any(select st.id_street from apartment c left join street st on (c.street = st.id_street) left join city ci on (ci.id_city = st.city_id) group by st.id_street) order by select_default, street	1517038613847	\N	\N	\N	\N
748	ALTER	\N	ALTER TABLE apartment ALTER COLUMN op TYPE text	alter table apartment alter column op type text	1495300829049	\N	\N	\N	\N
792	SELECT	\N	select 1from userdata where tel is not null group by tel having count(1) > 1	select 1from userdata where tel is not null group by tel having count(1) > 1	1513222792213	\N	\N	\N	\N
815	SELECT	\N	select * from apartment limit 3	select * from apartment limit 3	1515476116828	\N	\N	\N	\N
904	UPDATE	\N	UPDATE userdata SET code_price_cottages = '1111111111111'	update userdata set code_price_cottages = '1111111111111'	1517566026948	\N	\N	\N	\N
931	SELECT	\N	SELECT DISTINCT template AS Шаблон, (SELECT name FROM permit WHERE temp = template) AS "Раздел", count(*) OVER (PARTITION BY template) AS sum FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'apartment', 'commercial')	select distinct template as шаблон, (select name from permit where temp = template) as "раздел", count(*) over (partition by template) as sum from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'apartment', 'commercial')	1517754111285	\N	\N	\N	\N
950	SELECT	\N	select * from users limit 3	select * from users limit 3	1517871749592	\N	\N	\N	\N
969	ERROR	syntax error at or near "-"	select * from parser-cottages	select * from parser-cottages	1518032148877	\N	\N	\N	\N
978	ERROR	syntax error at or near "\\"	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS \\"Количество объектов\\" FROM node LEFT JOIN cottages ON(id = node_id) WHERE template = 'cottages' UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN commercial ON(id = node_id) WHERE template = 'commercial'	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id) where template = 'apartment' union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as \\"количество объектов\\" from node left join cottages on(id = node_id) where template = 'cottages' union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join commercial on(id = node_id) where template = 'commercial'	1518083906200	\N	\N	\N	\N
979	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN cottages ON(id = node_id) WHERE template = 'cottages' UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN commercial ON(id = node_id) WHERE template = 'commercial'	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id) where template = 'apartment' union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join cottages on(id = node_id) where template = 'cottages' union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join commercial on(id = node_id) where template = 'commercial'	1518083922551	\N	\N	\N	\N
650	SELECT	\N	SELECT id_apartment AS "Идентиф.", (SELECT title FROM node WHERE id = type) AS "Тип объяв.", st.street AS "Улица", house AS Дом, liter AS Литер, storey AS "Этаж/Этажность", numstorey AS Этажность, (SELECT title FROM project WHERE id_project = project) AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet)	select id_apartment as "идентиф.", (select title from node where id = type) as "тип объяв.", st.street as "улица", house as дом, liter as литер, storey as "этаж/этажность", numstorey as этажность, (select title from project where id_project = project) as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet)	1493958141596	\N	\N	\N	\N
673	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END|| CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN  ', '  || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end|| case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then  ', '  || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts)	1494055630990	\N	\N	\N	\N
856	SELECT	\N	select * from permit	select * from permit	1515751370734	\N	\N	\N	\N
723	SELECT	\N	SELECT id_user, fio || ', ' || CASE WHEN agency > 0 THEN (SELECT title FROM node WHERE id = agency) WHEN agency = 0 THEN 'Индивидуальный агент' ELSE '' END AS fio FROM users LEFT JOIN userdata ON(id_user = user_id) WHERE id_user IN(SELECT DISTINCT agent FROM apartment) ORDER BY fio	select id_user, fio || ', ' || case when agency > 0 then (select title from node where id = agency) when agency = 0 then 'индивидуальный агент' else '' end as fio from users left join userdata on(id_user = user_id) where id_user in(select distinct agent from apartment) order by fio	1494267671529	\N	\N	\N	\N
880	ALTER	\N	ALTER TABLE cottages ADD COLUMN category_land smallint	alter table cottages add column category_land smallint	1517378762229	\N	\N	\N	\N
793	SELECT	\N	select 1 from userdata where tel is not null group by tel having count(1) > 1	select 1 from userdata where tel is not null group by tel having count(1) > 1	1513222905912	\N	\N	\N	\N
816	SELECT	\N	select * from node where alias = 'prodam-kvartiri'	select * from node where alias = 'prodam-kvartiri'	1515476505121	\N	\N	\N	\N
905	UPDATE	\N	UPDATE cottages SET street = 1274 WHERE id_cottages = 91	update cottages set street = 1274 where id_cottages = 91	1517567992309	\N	\N	\N	\N
906	UPDATE	\N	UPDATE cottages SET street = 1274 WHERE id_cottages = 92	update cottages set street = 1274 where id_cottages = 92	1517568001301	\N	\N	\N	\N
932	SELECT	\N	SELECT DISTINCT template AS Шаблон, (SELECT name FROM permit WHERE temp = template) AS "Раздел", count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'apartment', 'commercial')	select distinct template as шаблон, (select name from permit where temp = template) as "раздел", count(*) over (partition by template) as "количество объектов" from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'apartment', 'commercial')	1517754181990	\N	\N	\N	\N
951	SELECT	\N	SELECT districts_id, ((SELECT (SELECT title FROM region WHERE id_region = region_id) FROM districts WHERE id_districts = districts_id) || ' ' || (SELECT districts FROM districts WHERE id_districts = districts_id)) AS disrtricts FROM city WHERE select_default = 1	select districts_id, ((select (select title from region where id_region = region_id) from districts where id_districts = districts_id) || ' ' || (select districts from districts where id_districts = districts_id)) as disrtricts from city where select_default = 1	1517908222168	\N	\N	\N	\N
970	ERROR	syntax error at or near "from"	select from parser_commercial	select from parser_commercial	1518033006285	\N	\N	\N	\N
992	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN city ci ON(st.city_id = ci.id_city) WHERE districts_id IS NOT NULL AND ap.agent = 269	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from apartment ap left join street st on(ap.street = st.id_street) left join city ci on(st.city_id = ci.id_city) where districts_id is not null and ap.agent = 269	1518087551553	\N	\N	\N	\N
1000	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM commercial ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) WHERE districts_id IS NOT NULL AND ci.region_id = 95 AND u.agency = 7	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from commercial ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) where districts_id is not null and ci.region_id = 95 and u.agency = 7	1518088844831	\N	\N	\N	\N
857	SELECT	\N	SELECT node_id AS id, (SELECT title FROM node WHERE id = node_id) FROM labelandtemplate, node WHERE id = node_id AND permit_id = 15 ORDER BY line DESC	select node_id as id, (select title from node where id = node_id) from labelandtemplate, node where id = node_id and permit_id = 15 order by line desc	1515751509817	\N	\N	\N	\N
881	CREATE	\N	CREATE TABLE IF NOT EXISTS category_land(id_category_land SERIAL PRIMARY KEY, title text, priority integer)	create table if not exists category_land(id_category_land serial primary key, title text, priority integer)	1517378792698	\N	\N	\N	\N
696	SELECT	\N	SELECT id_city, ci.title || re.title || districts AS Город FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts)	select id_city, ci.title || re.title || districts as город from city ci left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts)	1494215892633	\N	\N	\N	\N
724	SELECT	\N	SELECT id_user, fio || ', ' || CASE WHEN agency > 0 THEN (SELECT title FROM node WHERE id = agency) WHEN agency = 0 THEN 'Индивидуальный агент' ELSE '' END AS fio FROM users LEFT JOIN userdata ON(id_user = user_id) WHERE id_user IN(SELECT DISTINCT agent FROM apartment) ORDER BY agency, fio	select id_user, fio || ', ' || case when agency > 0 then (select title from node where id = agency) when agency = 0 then 'индивидуальный агент' else '' end as fio from users left join userdata on(id_user = user_id) where id_user in(select distinct agent from apartment) order by agency, fio	1494267718408	\N	\N	\N	\N
750	SELECT	\N	SELECT n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END || CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN ', ' || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, pr.title AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон,  ap.op AS Опека, ap.note AS Примечание, ud.fio || ', ' || CASE WHEN character_length(n3.title) > 0 THEN n3.title ELSE 'Индивидуальный агент' END || ',' || ud.tel AS "Телефоны агенства, риэлтора" FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) LEFT JOIN users u ON(ap.agent = u.id_user) LEFT JOIN userdata ud ON(u.id_user = ud.user_id) LEFT JOIN node n3 ON(n3.id = ud.agency) WHERE ap.type IN(SELECT DISTINCT type FROM apartment) AND n.section IN(SELECT DISTINCT section FROM node WHERE template = 'apartment' ) AND ci.id_city = ANY(SELECT id_city FROM city) AND ap.street = ANY(SELECT id_street FROM street) AND ap.agent = ANY(SELECT agent FROM apartment) AND ap.op = ANY(SELECT op FROM apartment) AND price IN(SELECT price FROM apartment) ORDER BY Город, Улица, Дом	select n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end || case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then ', ' || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, pr.title as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон,  ap.op as опека, ap.note as примечание, ud.fio || ', ' || case when character_length(n3.title) > 0 then n3.title else 'индивидуальный агент' end || ',' || ud.tel as "телефоны агенства, риэлтора" from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) left join users u on(ap.agent = u.id_user) left join userdata ud on(u.id_user = ud.user_id) left join node n3 on(n3.id = ud.agency) where ap.type in(select distinct type from apartment) and n.section in(select distinct section from node where template = 'apartment' ) and ci.id_city = any(select id_city from city) and ap.street = any(select id_street from street) and ap.agent = any(select agent from apartment) and ap.op = any(select op from apartment) and price in(select price from apartment) order by город, улица, дом	1495304034998	\N	\N	\N	\N
907	UPDATE	\N	UPDATE cottages SET street = 1426 WHERE id_cottages = 147	update cottages set street = 1426 where id_cottages = 147	1517577352222	\N	\N	\N	\N
933	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS "Раздел", count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'apartment', 'commercial')	select distinct template as псевдоним, (select name from permit where temp = template) as "раздел", count(*) over (partition by template) as "количество объектов" from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'apartment', 'commercial')	1517754235303	\N	\N	\N	\N
952	SELECT	\N	SELECT DISTINCT c.title, c.id_city, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND c.title != 'Нижнекамск' ORDER BY c.title	select distinct c.title, c.id_city, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and c.title != 'нижнекамск' order by c.title	1517922741009	\N	\N	\N	\N
971	SELECT	\N	SELECT node_id, s.street FROM apartment a LEFT JOIN street s ON(a.street = s.id_street)	select node_id, s.street from apartment a left join street s on(a.street = s.id_street)	1518076945961	\N	\N	\N	\N
980	ERROR	syntax error at or near "\\"	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS \\"Количество объектов\\" FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' AND agent = $1 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS \\"Количество объектов\\" FROM node LEFT JOIN cottages ON(id = node_id) WHERE template = 'cottages' AND agent = $1 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS \\"Количество объектов\\" FROM node LEFT JOIN commercial ON(id = node_id) WHERE template = 'commercial' AND agent = 578	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as \\"количество объектов\\" from node left join apartment on(id = node_id) where template = 'apartment' and agent = $1 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as \\"количество объектов\\" from node left join cottages on(id = node_id) where template = 'cottages' and agent = $1 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as \\"количество объектов\\" from node left join commercial on(id = node_id) where template = 'commercial' and agent = 578	1518083998775	\N	\N	\N	\N
993	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN users u ON (ap.agent = u.id_user) LEFT JOIN city ci ON(st.city_id = ci.id_city) WHERE districts_id IS NOT NULL AND ap.agent = 269	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from apartment ap left join street st on(ap.street = st.id_street) left join users u on (ap.agent = u.id_user) left join city ci on(st.city_id = ci.id_city) where districts_id is not null and ap.agent = 269	1518087712899	\N	\N	\N	\N
652	SELECT	\N	SELECT id_apartment AS "Идентиф.",  n1.title AS "Тип объяв.", st.street AS "Улица", house AS Дом, liter AS Литер, storey AS "Этаж/Этажность", numstorey AS Этажность, (SELECT title FROM project WHERE id_project = project) AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN node n1 ON(n1.id = ap.type)	select id_apartment as "идентиф.",  n1.title as "тип объяв.", st.street as "улица", house as дом, liter as литер, storey as "этаж/этажность", numstorey as этажность, (select title from project where id_project = project) as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join node n1 on(n1.id = ap.type)	1493958424857	\N	\N	\N	\N
675	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END|| CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN ', ' || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание, u.id_user FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) LEFT JOIN users u ON(ap.agent = u.id_user)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end|| case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then ', ' || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание, u.id_user from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) left join users u on(ap.agent = u.id_user)	1494058813890	\N	\N	\N	\N
697	SELECT	\N	SELECT id_city, ci.title || re.title || CASE WHEN character_length(districts) > 0 THEN  districts ELSE '' END AS Город FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts)	select id_city, ci.title || re.title || case when character_length(districts) > 0 then  districts else '' end as город from city ci left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts)	1494218180739	\N	\N	\N	\N
725	SELECT	\N	SELECT DISTINCT op FROM apartment	select distinct op from apartment	1494272235376	\N	\N	\N	\N
858	SELECT	\N	select * from access	select * from access	1515753133842	\N	\N	\N	\N
795	SELECT	\N	select 1 from userdata where id_userdata is not null group by id_userdata having count(1) > 1	select 1 from userdata where id_userdata is not null group by id_userdata having count(1) > 1	1513223111019	\N	\N	\N	\N
796	SELECT	\N	select 1 from userdata where tel is not null group by tel	select 1 from userdata where tel is not null group by tel	1513223126830	\N	\N	\N	\N
818	SELECT	\N	SELECT id_user, tel, fio || '[' || (SELECT title FROM node WHERE id = agency) || ']' AS fio1 FROM users, userdata WHERE id_user = user_id AND role_id IN(16, 17)	select id_user, tel, fio || '[' || (select title from node where id = agency) || ']' as fio1 from users, userdata where id_user = user_id and role_id in(16, 17)	1515615359026	\N	\N	\N	\N
882	ERROR	syntax error at or near "ORDER"	SELECT DISTINCT c.title, c.id_city, districts_id, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE ORDER BY c.title	select distinct c.title, c.id_city, districts_id, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where order by c.title	1517414748310	\N	\N	\N	\N
883	SELECT	\N	SELECT DISTINCT c.title, c.id_city, districts_id, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) ORDER BY c.title	select distinct c.title, c.id_city, districts_id, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) order by c.title	1517414760138	\N	\N	\N	\N
908	UPDATE	\N	UPDATE parser_cottages SET price = 0 WHERE price = 'договорная'	update parser_cottages set price = 0 where price = 'договорная'	1517594853090	\N	\N	\N	\N
935	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS "Раздел", count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'apartment', 'commercial') AND a.agent = 269 AND c.agent = 269 AND cm.agent = 269	select distinct template as псевдоним, (select name from permit where temp = template) as "раздел", count(*) over (partition by template) as "количество объектов" from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'apartment', 'commercial') and a.agent = 269 and c.agent = 269 and cm.agent = 269	1517754507095	\N	\N	\N	\N
953	ERROR	column "id_districts" does not exist	SELECT DISTINCT c.title, c.id_city, id_districts, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND c.title != 'Нижнекамск' ORDER BY c.title	select distinct c.title, c.id_city, id_districts, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and c.title != 'нижнекамск' order by c.title	1517922853767	\N	\N	\N	\N
994	SELECT	\N	SELECT * FROM users LIMIT 1	select * from users limit 1	1518087755773	\N	\N	\N	\N
653	SELECT	\N	SELECT id_apartment AS "Идентиф.", n1.title AS "Тип объяв.", st.street AS "Улица", house AS Дом, liter AS Литер, storey AS "Этаж/Этажность", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN project pr ON(pr.id_project = ap.project)	select id_apartment as "идентиф.", n1.title as "тип объяв.", st.street as "улица", house as дом, liter as литер, storey as "этаж/этажность", numstorey as этажность, project as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join node n1 on(n1.id = ap.type) left join project pr on(pr.id_project = ap.project)	1493958588628	\N	\N	\N	\N
859	ERROR	relation "apartament" does not exist	select * from apartament	select * from apartament	1515754368936	\N	\N	\N	\N
698	SELECT	\N	SELECT id_city, ci.title || ', ' || re.title || CASE WHEN character_length(districts) > 0 THEN ', ' || districts ELSE '' END AS Город FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts)	select id_city, ci.title || ', ' || re.title || case when character_length(districts) > 0 then ', ' || districts else '' end as город from city ci left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts)	1494218264590	\N	\N	\N	\N
726	ALTER	\N	ALTER TABLE userdata ADD COLUMN code_price text	alter table userdata add column code_price text	1494613149617	\N	\N	\N	\N
752	SELECT	\N	SELECT n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END || CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN ', ' || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, pr.title AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, ap.op AS Опека, ap.note AS Примечание, ud.fio || ', ' || CASE WHEN character_length(n3.title) > 0 THEN n3.title ELSE 'Индивидуальный агент' END || ',' || ud.tel AS "Телефоны агенства, риэлтора" FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) LEFT JOIN users u ON(ap.agent = u.id_user) LEFT JOIN userdata ud ON(u.id_user = ud.user_id) LEFT JOIN node n3 ON(n3.id = ud.agency) WHERE ap.type IN(SELECT DISTINCT type FROM apartment) AND n.section IN(SELECT DISTINCT section FROM node WHERE template = 'apartment' ) AND ci.id_city = ANY(SELECT id_city FROM city) AND ap.street = ANY(SELECT id_street FROM street) AND ap.agent = ANY(SELECT agent FROM apartment) AND ap.op IN(SELECT DISTINCT op FROM apartment) AND price IN(SELECT price FROM apartment) ORDER BY Город, Улица, Дом	select n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end || case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then ', ' || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, pr.title as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, ap.op as опека, ap.note as примечание, ud.fio || ', ' || case when character_length(n3.title) > 0 then n3.title else 'индивидуальный агент' end || ',' || ud.tel as "телефоны агенства, риэлтора" from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) left join users u on(ap.agent = u.id_user) left join userdata ud on(u.id_user = ud.user_id) left join node n3 on(n3.id = ud.agency) where ap.type in(select distinct type from apartment) and n.section in(select distinct section from node where template = 'apartment' ) and ci.id_city = any(select id_city from city) and ap.street = any(select id_street from street) and ap.agent = any(select agent from apartment) and ap.op in(select distinct op from apartment) and price in(select price from apartment) order by город, улица, дом	1495305383135	\N	\N	\N	\N
797	SELECT	\N	select count(tel)-count(distinct tel) from userdata	select count(tel)-count(distinct tel) from userdata	1513223262259	\N	\N	\N	\N
819	SELECT	\N	SELECT id_user, tel, fio || '[' || (SELECT title FROM node WHERE id = agency) || ']' AS fio1 FROM users, userdata WHERE id_user = user_id	select id_user, tel, fio || '[' || (select title from node where id = agency) || ']' as fio1 from users, userdata where id_user = user_id	1515615399437	\N	\N	\N	\N
884	SELECT	\N	SELECT DISTINCT c.title, c.id_city, districts_id, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL ORDER BY c.title	select distinct c.title, c.id_city, districts_id, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null order by c.title	1517414828024	\N	\N	\N	\N
909	SELECT	\N	select pg_catalog.setval('users_id_user_seq', 575, true)	select pg_catalog.setval('users_id_user_seq', 575, true)	1517659917384	\N	\N	\N	\N
936	SELECT	\N	select * from apartment where agent = 269	select * from apartment where agent = 269	1517754606581	\N	\N	\N	\N
954	SELECT	\N	SELECT DISTINCT c.title, c.id_city, districts_id, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND c.title != 'Нижнекамск' ORDER BY c.title	select distinct c.title, c.id_city, districts_id, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and c.title != 'нижнекамск' order by c.title	1517922889080	\N	\N	\N	\N
972	ERROR	missing FROM-clause entry for table "si"	SELECT node_id, s.street FROM apartment a LEFT JOIN street s ON(a.street = s.id_street) LEFT JOIN city ci ON(s.city_id=si.id_city )	select node_id, s.street from apartment a left join street s on(a.street = s.id_street) left join city ci on(s.city_id=si.id_city )	1518077182955	\N	\N	\N	\N
973	SELECT	\N	SELECT node_id, s.street FROM apartment a LEFT JOIN street s ON(a.street = s.id_street) LEFT JOIN city ci ON(s.city_id=ci.id_city )	select node_id, s.street from apartment a left join street s on(a.street = s.id_street) left join city ci on(s.city_id=ci.id_city )	1518077207430	\N	\N	\N	\N
981	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' AND agent = 578	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id) where template = 'apartment' and agent = 578	1518084069478	\N	\N	\N	\N
995	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) WHERE districts_id IS NOT NULL AND u.agency = 7	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from apartment ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) where districts_id is not null and u.agency = 7	1518087823578	\N	\N	\N	\N
860	SELECT	\N	SELECT id_role FROM role WHERE payment_price = 2	select id_role from role where payment_price = 2	1515758896126	\N	\N	\N	\N
677	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END|| CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN ', ' || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, ap.note AS Примечание, ud.fio FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) LEFT JOIN users u ON(ap.agent = u.id_user) LEFT JOIN userdata ud ON(u.id_user = ud.user_id)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end|| case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then ', ' || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, ap.note as примечание, ud.fio from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) left join users u on(ap.agent = u.id_user) left join userdata ud on(u.id_user = ud.user_id)	1494059055784	\N	\N	\N	\N
699	SELECT	\N	SELECT id_city, ci.title || ', ' || re.title || CASE WHEN character_length(districts) > 0 THEN ', ' || districts ELSE '' END AS Город FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) ORDER BY Город	select id_city, ci.title || ', ' || re.title || case when character_length(districts) > 0 then ', ' || districts else '' end as город from city ci left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) order by город	1494218297834	\N	\N	\N	\N
727	ALTER	\N	ALTER TABLE userdata DROP COLUMN code_price	alter table userdata drop column code_price	1494613314729	\N	\N	\N	\N
753	SELECT	\N	SELECT n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END || CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN ', ' || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, pr.title AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, ap.op AS Опека, ap.note AS Примечание, ud.fio || ', ' || CASE WHEN character_length(n3.title) > 0 THEN n3.title ELSE 'Индивидуальный агент' END || ',' || ud.tel AS "Телефоны агенства, риэлтора" FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) LEFT JOIN users u ON(ap.agent = u.id_user) LEFT JOIN userdata ud ON(u.id_user = ud.user_id) LEFT JOIN node n3 ON(n3.id = ud.agency) WHERE ap.type IN(SELECT DISTINCT type FROM apartment) AND n.section IN(SELECT DISTINCT section FROM node WHERE template = 'apartment' ) AND ci.id_city = ANY(SELECT id_city FROM city) AND ap.street = ANY(SELECT id_street FROM street) AND ap.agent = ANY(SELECT agent FROM apartment) AND ap.op IN(SELECT op FROM apartment) AND price IN(SELECT price FROM apartment) ORDER BY Город, Улица, Дом	select n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end || case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then ', ' || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, pr.title as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, ap.op as опека, ap.note as примечание, ud.fio || ', ' || case when character_length(n3.title) > 0 then n3.title else 'индивидуальный агент' end || ',' || ud.tel as "телефоны агенства, риэлтора" from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) left join users u on(ap.agent = u.id_user) left join userdata ud on(u.id_user = ud.user_id) left join node n3 on(n3.id = ud.agency) where ap.type in(select distinct type from apartment) and n.section in(select distinct section from node where template = 'apartment' ) and ci.id_city = any(select id_city from city) and ap.street = any(select id_street from street) and ap.agent = any(select agent from apartment) and ap.op in(select op from apartment) and price in(select price from apartment) order by город, улица, дом	1495305475515	\N	\N	\N	\N
754	SELECT	\N	SELECT n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END || CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN ', ' || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, pr.title AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, ap.op AS Опека, ap.note AS Примечание, ud.fio || ', ' || CASE WHEN character_length(n3.title) > 0 THEN n3.title ELSE 'Индивидуальный агент' END || ',' || ud.tel AS "Телефоны агенства, риэлтора" FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) LEFT JOIN users u ON(ap.agent = u.id_user) LEFT JOIN userdata ud ON(u.id_user = ud.user_id) LEFT JOIN node n3 ON(n3.id = ud.agency) WHERE ap.type IN(SELECT DISTINCT type FROM apartment) AND n.section IN(SELECT DISTINCT section FROM node WHERE template = 'apartment' ) AND ci.id_city = ANY(SELECT id_city FROM city) AND ap.street = ANY(SELECT id_street FROM street) AND ap.agent = ANY(SELECT agent FROM apartment) AND price IN(SELECT price FROM apartment) ORDER BY Город, Улица, Дом	select n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end || case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then ', ' || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, pr.title as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, ap.op as опека, ap.note as примечание, ud.fio || ', ' || case when character_length(n3.title) > 0 then n3.title else 'индивидуальный агент' end || ',' || ud.tel as "телефоны агенства, риэлтора" from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) left join users u on(ap.agent = u.id_user) left join userdata ud on(u.id_user = ud.user_id) left join node n3 on(n3.id = ud.agency) where ap.type in(select distinct type from apartment) and n.section in(select distinct section from node where template = 'apartment' ) and ci.id_city = any(select id_city from city) and ap.street = any(select id_street from street) and ap.agent = any(select agent from apartment) and price in(select price from apartment) order by город, улица, дом	1495305532273	\N	\N	\N	\N
820	SELECT	\N	select * from users where id_user = 384	select * from users where id_user = 384	1515615481284	\N	\N	\N	\N
910	UPDATE	\N	UPDATE city SET select_default = 2 WHERE id_city = 249	update city set select_default = 2 where id_city = 249	1517682095532	\N	\N	\N	\N
937	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS "Раздел", count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment a ON(id = a.node_id) LEFT JOIN cottages c ON (id = c.node_id) LEFT JOIN commercial cm ON(id = cm.node_id) WHERE template IN('cottages', 'apartment', 'commercial') AND a.agent = 269	select distinct template as псевдоним, (select name from permit where temp = template) as "раздел", count(*) over (partition by template) as "количество объектов" from node left join apartment a on(id = a.node_id) left join cottages c on (id = c.node_id) left join commercial cm on(id = cm.node_id) where template in('cottages', 'apartment', 'commercial') and a.agent = 269	1517754676014	\N	\N	\N	\N
974	ERROR	cross-database references are not implemented: s.street.ci.title	SELECT node_id, s.street. ci.title FROM apartment a LEFT JOIN street s ON(a.street = s.id_street) LEFT JOIN city ci ON(s.city_id=ci.id_city )	select node_id, s.street. ci.title from apartment a left join street s on(a.street = s.id_street) left join city ci on(s.city_id=ci.id_city )	1518077248513	\N	\N	\N	\N
975	SELECT	\N	SELECT node_id, s.street, ci.title FROM apartment a LEFT JOIN street s ON(a.street = s.id_street) LEFT JOIN city ci ON(s.city_id=ci.id_city )	select node_id, s.street, ci.title from apartment a left join street s on(a.street = s.id_street) left join city ci on(s.city_id=ci.id_city )	1518077295710	\N	\N	\N	\N
655	SELECT	\N	SELECT id_apartment AS "Идентиф.", n1.title AS "Тип объяв.", n.section, st.street AS "Улица", house AS Дом, liter AS Литер, storey AS "Этаж/Этажность", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN project pr ON(pr.id_project = ap.project)	select id_apartment as "идентиф.", n1.title as "тип объяв.", n.section, st.street as "улица", house as дом, liter as литер, storey as "этаж/этажность", numstorey as этажность, project as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join node n1 on(n1.id = ap.type) left join project pr on(pr.id_project = ap.project)	1493959168081	\N	\N	\N	\N
678	SELECT	\N	select * from agency	select * from agency	1494059480651	\N	\N	\N	\N
728	ALTER	\N	ALTER TABLE userdata ADD COLUMN code_price text default '111111111111111'	alter table userdata add column code_price text default '111111111111111'	1494613372333	\N	\N	\N	\N
729	SELECT	\N	select * from userdata	select * from userdata	1494613395193	\N	\N	\N	\N
755	ALTER	\N	ALTER TABLE apartment DROP COLUMN op	alter table apartment drop column op	1495307283812	\N	\N	\N	\N
799	SELECT	\N	select tel from userdata where tel is not null	select tel from userdata where tel is not null	1513280755854	\N	\N	\N	\N
821	SELECT	\N	select * from userdata where user_id = 384	select * from userdata where user_id = 384	1515615544941	\N	\N	\N	\N
861	DELETE	\N	delete from access	delete from access	1515881952677	\N	\N	\N	\N
886	SELECT	\N	SELECT DISTINCT c.title, c.id_city, districts_id, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND c.title != 'Нижнекамск' ORDER BY c.title	select distinct c.title, c.id_city, districts_id, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and c.title != 'нижнекамск' order by c.title	1517414969207	\N	\N	\N	\N
887	SELECT	\N	SELECT DISTINCT c.title, c.id_city, districts_id, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND c.title = 'Нижнекамск' ORDER BY c.title	select distinct c.title, c.id_city, districts_id, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and c.title = 'нижнекамск' order by c.title	1517414996645	\N	\N	\N	\N
911	ERROR	relation "sity" does not exist	select * from sity	select * from sity	1517682329526	\N	\N	\N	\N
938	ERROR	syntax error at or near "'Количество объектов'"	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS 'Количество объектов' FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' AND agent = 269	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as 'количество объектов' from node left join apartment on(id = node_id) where template = 'apartment' and agent = 269	1517754870087	\N	\N	\N	\N
939	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' AND agent = 269	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id) where template = 'apartment' and agent = 269	1517754898810	\N	\N	\N	\N
955	SELECT	\N	SELECT DISTINCT c.title, c.id_city, districts_id, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND c.title != 'Нижнекамск' AND districts_id = 1 ORDER BY c.title	select distinct c.title, c.id_city, districts_id, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and c.title != 'нижнекамск' and districts_id = 1 order by c.title	1517922943060	\N	\N	\N	\N
976	SELECT	\N	SELECT node_id, s.street, ci.title FROM apartment a LEFT JOIN street s ON(a.street = s.id_street) RIGHT JOIN city ci ON(s.city_id=ci.id_city )	select node_id, s.street, ci.title from apartment a left join street s on(a.street = s.id_street) right join city ci on(s.city_id=ci.id_city )	1518077368524	\N	\N	\N	\N
983	SELECT	\N	SELECT id_districts, districts, title FROM districts LEFT JOIN region ON(region_id = id_region) WHERE title = 'Татарстан' ORDER BY title, districts	select id_districts, districts, title from districts left join region on(region_id = id_region) where title = 'татарстан' order by title, districts	1518086647709	\N	\N	\N	\N
996	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM cottages ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) WHERE districts_id IS NOT NULL AND u.agency = 7	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from cottages ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) where districts_id is not null and u.agency = 7	1518087964930	\N	\N	\N	\N
656	SELECT	\N	SELECT id_apartment AS "Идентиф.", n1.title AS "Тип объяв.", n2.title, st.street AS "Улица", house AS Дом, liter AS Литер, storey AS "Этаж/Этажность", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project)	select id_apartment as "идентиф.", n1.title as "тип объяв.", n2.title, st.street as "улица", house as дом, liter as литер, storey as "этаж/этажность", numstorey as этажность, project as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project)	1493959379692	\N	\N	\N	\N
679	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title AS Категория, CASE WHEN character_length(ci.title) > 0 THEN ci.title ELSE '' END|| CASE WHEN character_length(re.title) > 0 THEN ', ' || re.title ELSE '' END || CASE WHEN character_length(di.districts) > 0 THEN ', ' || di.districts ELSE '' END AS Город, st.street AS Улица, house AS Дом, liter AS Литер, storey AS "Этаж/Этажн", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общ/Жил/Кух", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, ap.note AS Примечание, ud.tel, ud.fio, ud.agency FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) LEFT JOIN users u ON(ap.agent = u.id_user) LEFT JOIN userdata ud ON(u.id_user = ud.user_id)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title as категория, case when character_length(ci.title) > 0 then ci.title else '' end|| case when character_length(re.title) > 0 then ', ' || re.title else '' end || case when character_length(di.districts) > 0 then ', ' || di.districts else '' end as город, st.street as улица, house as дом, liter as литер, storey as "этаж/этажн", numstorey as этажность, project as "тип дома", price as цена, area1 as "общ/жил/кух", area2, area3, t.title as санузел, balcony as балкон, op as опека, ap.note as примечание, ud.tel, ud.fio, ud.agency from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) left join users u on(ap.agent = u.id_user) left join userdata ud on(u.id_user = ud.user_id)	1494059575322	\N	\N	\N	\N
701	SELECT	\N	SELECT id_city, ci.title || ', ' || re.title || CASE WHEN character_length(districts) > 0 THEN ', ' || districts ELSE '' END AS Город FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) WHERE ci.title = 'Нижнекамск'	select id_city, ci.title || ', ' || re.title || case when character_length(districts) > 0 then ', ' || districts else '' end as город from city ci left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) where ci.title = 'нижнекамск'	1494218983765	\N	\N	\N	\N
730	UPDATE	\N	update userdata set code_price = '111111111111111' where user_id = 100	update userdata set code_price = '111111111111111' where user_id = 100	1494656445692	\N	\N	\N	\N
862	SELECT	\N	select * from parser limit 1	select * from parser limit 1	1516380091904	\N	\N	\N	\N
757	ALTER	\N	ALTER TABLE apartment ADD COLUMN op smallint	alter table apartment add column op smallint	1495307369158	\N	\N	\N	\N
800	SELECT	\N	select distinct tel from userdata where tel is not null	select distinct tel from userdata where tel is not null	1513280803689	\N	\N	\N	\N
822	SELECT	\N	select max(id) from node	select max(id) from node	1515699532447	\N	\N	\N	\N
888	SELECT	\N	SELECT id_city, title, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts FROM city WHERE id_city = ANY(SELECT id_city FROM city EXCEPT SELECT DISTINCT c.id_city FROM apartment a LEFT JOIN userdata u ON (a.agent = u.user_id) LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND u.agency = 7 AND c.title != 'Нижнекамск') ORDER BY select_default, title	select id_city, title, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts from city where id_city = any(select id_city from city except select distinct c.id_city from apartment a left join userdata u on (a.agent = u.user_id) left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and u.agency = 7 and c.title != 'нижнекамск') order by select_default, title	1517473765733	\N	\N	\N	\N
912	UPDATE	\N	update users set default_city = 116 where id_user = 1	update users set default_city = 116 where id_user = 1	1517683407553	\N	\N	\N	\N
940	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' AND agent = 269 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN cottages ON(id = node_id) WHERE template = 'cottages' AND agent = 269	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id) where template = 'apartment' and agent = 269 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join cottages on(id = node_id) where template = 'cottages' and agent = 269	1517755073090	\N	\N	\N	\N
956	SELECT	\N	SELECT DISTINCT c.title, c.id_city, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL	select distinct c.title, c.id_city, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null	1517938418882	\N	\N	\N	\N
984	SELECT	\N	SELECT * FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)	select * from apartment ap left join street st on(ap.street = st.id_street)	1518086851109	\N	\N	\N	\N
657	SELECT	\N	SELECT n.id AS "Идентиф.", n1.title AS "Тип объяв.", n2.title, st.street AS "Улица", house AS Дом, liter AS Литер, storey AS "Этаж/Этажность", numstorey AS Этажность, project AS "Тип дома", price AS Цена, area1 AS "Общая/Жилая/Кухня", area2, area3, t.title AS Санузел, balcony AS Балкон, op AS Опека, note AS Примечание FROM apartment ap LEFT JOIN node n ON(n.id = ap.node_id) LEFT JOIN node n1 ON(n1.id = ap.type) LEFT JOIN node n2 ON(n2.id = n.section) LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN toilet t ON(id_toilet = toilet) LEFT JOIN project pr ON(pr.id_project = ap.project)	select n.id as "идентиф.", n1.title as "тип объяв.", n2.title, st.street as "улица", house as дом, liter as литер, storey as "этаж/этажность", numstorey as этажность, project as "тип дома", price as цена, area1 as "общая/жилая/кухня", area2, area3, t.title as санузел, balcony as балкон, op as опека, note as примечание from apartment ap left join node n on(n.id = ap.node_id) left join node n1 on(n1.id = ap.type) left join node n2 on(n2.id = n.section) left join street st on(ap.street = st.id_street) left join toilet t on(id_toilet = toilet) left join project pr on(pr.id_project = ap.project)	1493959471617	\N	\N	\N	\N
863	UPDATE	\N	UPDATE parser SET section = '5-6' WHERE id > 1487 AND id < 1537	update parser set section = '5-6' where id > 1487 and id < 1537	1516380225158	\N	\N	\N	\N
702	SELECT	\N	SELECT id_city, ci.title || ', ' || re.title || CASE WHEN character_length(districts) > 0 THEN ', ' || districts ELSE '' END AS Город FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) WHERE ci.title != 'Нижнекамск' ORDER BY Город	select id_city, ci.title || ', ' || re.title || case when character_length(districts) > 0 then ', ' || districts else '' end as город from city ci left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) where ci.title != 'нижнекамск' order by город	1494219025197	\N	\N	\N	\N
731	UPDATE	\N	update userdata set code_price = '111111111111111' where user_id = 1	update userdata set code_price = '111111111111111' where user_id = 1	1494735992140	\N	\N	\N	\N
758	SELECT	\N	select table_name, column_name \r\nfrom information_schema.columns \r\nwhere table_schema='nkagent'	select table_name, column_name \r\nfrom information_schema.columns \r\nwhere table_schema='nkagent'	1501596308283	\N	\N	\N	\N
801	SELECT	\N	select tel, count(*) from userdata WHERE tel is not null GROUP by tel HAVING count(*)>1	select tel, count(*) from userdata where tel is not null group by tel having count(*)>1	1513281167898	\N	\N	\N	\N
823	CREATE	\N	CREATE TABLE IF NOT EXISTS labelandtemplate (id_labelandtemplate SERIAL PRIMARY KEY, node_id bigint, permit_id integer)	create table if not exists labelandtemplate (id_labelandtemplate serial primary key, node_id bigint, permit_id integer)	1515735872298	\N	\N	\N	\N
889	SELECT	\N	SELECT DISTINCT c.title, c.id_city, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN userdata u ON (a.agent = u.user_id) LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND c.title !='Нижнекамск' AND u.agency = 7 ORDER BY c.title	select distinct c.title, c.id_city, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join userdata u on (a.agent = u.user_id) left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and c.title !='нижнекамск' and u.agency = 7 order by c.title	1517475107974	\N	\N	\N	\N
913	UPDATE	\N	update cottages set street = 1289 where id_cottages = 371	update cottages set street = 1289 where id_cottages = 371	1517684012576	\N	\N	\N	\N
941	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' AND agent = 269 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN cottages ON(id = node_id) WHERE template = 'cottages' AND agent = 269 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN commercial ON(id = node_id) WHERE template = 'commercial' AND agent = 269	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id) where template = 'apartment' and agent = 269 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join cottages on(id = node_id) where template = 'cottages' and agent = 269 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join commercial on(id = node_id) where template = 'commercial' and agent = 269	1517755149453	\N	\N	\N	\N
864	SELECT	\N	select * from node limit 100	select * from node limit 100	1516528826691	\N	\N	\N	\N
890	SELECT	\N	SELECT DISTINCT c.title, c.id_city, CASE WHEN districts_id IS NOT NULL THEN (SELECT districts FROM districts WHERE id_districts = districts_id) ELSE '' END AS districts, count(*) OVER (PARTITION BY c.title) AS sum FROM apartment a LEFT JOIN street s ON (a.street = s.id_street) LEFT JOIN city c ON (s.city_id = c.id_city) WHERE id_city IS NOT NULL AND c.title = 'Нижнекамск' AND a.agent = 392	select distinct c.title, c.id_city, case when districts_id is not null then (select districts from districts where id_districts = districts_id) else '' end as districts, count(*) over (partition by c.title) as sum from apartment a left join street s on (a.street = s.id_street) left join city c on (s.city_id = c.id_city) where id_city is not null and c.title = 'нижнекамск' and a.agent = 392	1517475444610	\N	\N	\N	\N
631	SELECT	\N	SELECT id_apartment AS "Идентификатор", (SELECT title FROM node WHERE id = type) AS "Тип объявления", st.street AS "Улица", house AS "Дом", liter AS "Литер", to_char(storey, '99') || '/' || to_char(numstorey, '99') AS "Этаж/Этажность" FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)	select id_apartment as "идентификатор", (select title from node where id = type) as "тип объявления", st.street as "улица", house as "дом", liter as "литер", to_char(storey, '99') || '/' || to_char(numstorey, '99') as "этаж/этажность" from apartment ap left join street st on(ap.street = st.id_street)	1493879222684	\N	\N	\N	\N
703	SELECT	\N	SELECT id_city, ci.title || ', ' || re.title || CASE WHEN character_length(districts) > 0 THEN ', ' || districts ELSE '' END AS Город FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) WHERE ci.title = 'Нижнекамск' UNION SELECT id_city, ci.title || ', ' || re.title || CASE WHEN character_length(districts) > 0 THEN ', ' || districts ELSE '' END AS Город FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) WHERE ci.title != 'Нижнекамск' ORDER BY Город	select id_city, ci.title || ', ' || re.title || case when character_length(districts) > 0 then ', ' || districts else '' end as город from city ci left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) where ci.title = 'нижнекамск' union select id_city, ci.title || ', ' || re.title || case when character_length(districts) > 0 then ', ' || districts else '' end as город from city ci left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) where ci.title != 'нижнекамск' order by город	1494219212771	\N	\N	\N	\N
704	SELECT	\N	SELECT id_city, ci.title || ', ' || re.title || CASE WHEN character_length(districts) > 0 THEN ', ' || districts ELSE '' END AS Город FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) WHERE ci.title = 'Нижнекамск' UNION ALL SELECT id_city, ci.title || ', ' || re.title || CASE WHEN character_length(districts) > 0 THEN ', ' || districts ELSE '' END AS Город FROM city ci LEFT JOIN region re ON(ci.region_id = re.id_region) LEFT JOIN districts di ON(ci.districts_id = di.id_districts) WHERE ci.title != 'Нижнекамск' ORDER BY Город	select id_city, ci.title || ', ' || re.title || case when character_length(districts) > 0 then ', ' || districts else '' end as город from city ci left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) where ci.title = 'нижнекамск' union all select id_city, ci.title || ', ' || re.title || case when character_length(districts) > 0 then ', ' || districts else '' end as город from city ci left join region re on(ci.region_id = re.id_region) left join districts di on(ci.districts_id = di.id_districts) where ci.title != 'нижнекамск' order by город	1494219235579	\N	\N	\N	\N
732	UPDATE	\N	update userdata set code_price = '111110100100000' where user_id = 1	update userdata set code_price = '111110100100000' where user_id = 1	1494737756604	\N	\N	\N	\N
759	SELECT	\N	SELECT datname FROM pg_database WHERE datistemplate = false	select datname from pg_database where datistemplate = false	1501596363231	\N	\N	\N	\N
760	SELECT	\N	select table_name, column_name from information_schema.columns where table_schema='postgres'	select table_name, column_name from information_schema.columns where table_schema='postgres'	1501596388260	\N	\N	\N	\N
761	SELECT	\N	select table_name, column_name from information_schema.columns where table_schema='nkagent'	select table_name, column_name from information_schema.columns where table_schema='nkagent'	1501596407569	\N	\N	\N	\N
914	UPDATE	\N	UPDATE parser SET section = '1' WHERE id > 3445 AND id < 3467	update parser set section = '1' where id > 3445 and id < 3467	1517733351226	\N	\N	\N	\N
824	CREATE	\N	CREATE TABLE IF NOT EXISTS article_reject(node_id bigint UNIQUE, message text, date_message bigint)	create table if not exists article_reject(node_id bigint unique, message text, date_message bigint)	1515735967811	\N	\N	\N	\N
942	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN cottages ON(id = node_id) WHERE template = 'cottages' AND agent = 269 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN commercial ON(id = node_id) WHERE template = 'commercial' AND agent = 269	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join cottages on(id = node_id) where template = 'cottages' and agent = 269 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join commercial on(id = node_id) where template = 'commercial' and agent = 269	1517755251385	\N	\N	\N	\N
985	ERROR	column reference "street" is ambiguous	SELECT street, title FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street)  LEFT JOIN city ci ON(st.city_id = ci.id_city)	select street, title from apartment ap left join street st on(ap.street = st.id_street)  left join city ci on(st.city_id = ci.id_city)	1518087119044	\N	\N	\N	\N
986	SELECT	\N	SELECT st.street, ci.title FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN city ci ON(st.city_id = ci.id_city)	select st.street, ci.title from apartment ap left join street st on(ap.street = st.id_street) left join city ci on(st.city_id = ci.id_city)	1518087138303	\N	\N	\N	\N
982	SELECT	\N	SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN apartment ON(id = node_id) WHERE template = 'apartment' AND agent = 578 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN cottages ON(id = node_id) WHERE template = 'cottages' AND agent = 578 UNION SELECT DISTINCT template AS Псевдоним, (SELECT name FROM permit WHERE temp = template) AS Раздел, count(*) OVER (PARTITION BY template) AS "Количество объектов" FROM node LEFT JOIN commercial ON(id = node_id) WHERE template = 'commercial' AND agent = 578	select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join apartment on(id = node_id) where template = 'apartment' and agent = 578 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join cottages on(id = node_id) where template = 'cottages' and agent = 578 union select distinct template as псевдоним, (select name from permit where temp = template) as раздел, count(*) over (partition by template) as "количество объектов" from node left join commercial on(id = node_id) where template = 'commercial' and agent = 578	1518084150804	\N	\N	\N	\N
1002	ERROR	missing FROM-clause entry for table "si"	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM commercial ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(si.region_id = re.id_region) WHERE districts_id IS NOT NULL AND ci.region_id = 95 AND re.title = 'Татарстан'	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from commercial ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) left join region re on(si.region_id = re.id_region) where districts_id is not null and ci.region_id = 95 and re.title = 'татарстан'	1518089155720	\N	\N	\N	\N
1003	SELECT	\N	select * from region limit 1	select * from region limit 1	1518089200321	\N	\N	\N	\N
1007	SELECT	\N	SELECT DISTINCT ci.districts_id, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title = 'Татарстан'	select distinct ci.districts_id, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from apartment ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null and re.title = 'татарстан'	1518089482710	\N	\N	\N	\N
1008	SELECT	\N	SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL	select distinct ci.districts_id, re.title, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from apartment ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null	1518092412907	\N	\N	\N	\N
1010	SELECT	\N	SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id), count(*) OVER (PARTITION BY ci.districts_id) AS sum FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL	select distinct ci.districts_id, re.title, (select districts from districts where id_districts = ci.districts_id), count(*) over (partition by ci.districts_id) as sum from street st left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null	1518092579551	\N	\N	\N	\N
1013	SELECT	\N	SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL EXCEPT SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL	select distinct ci.districts_id, re.title, (select districts from districts where id_districts = ci.districts_id) from street st left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null except select distinct ci.districts_id, re.title, (select districts from districts where id_districts = ci.districts_id) from apartment ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null	1518093204915	\N	\N	\N	\N
1014	SELECT	\N	SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title = 'Татарстан' EXCEPT SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title = 'Татарстан'	select distinct ci.districts_id, re.title, (select districts from districts where id_districts = ci.districts_id) from street st left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null and re.title = 'татарстан' except select distinct ci.districts_id, re.title, (select districts from districts where id_districts = ci.districts_id) from apartment ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null and re.title = 'татарстан'	1518093387943	\N	\N	\N	\N
1016	SELECT	\N	SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title != 'Татарстан' EXCEPT SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title != 'Татарстан'	select distinct ci.districts_id, re.title, (select districts from districts where id_districts = ci.districts_id) from street st left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null and re.title != 'татарстан' except select distinct ci.districts_id, re.title, (select districts from districts where id_districts = ci.districts_id) from apartment ap left join street st on(ap.street = st.id_street) left join userdata u on (ap.agent = u.user_id) left join city ci on(st.city_id = ci.id_city) left join region re on(ci.region_id = re.id_region) where districts_id is not null and re.title != 'татарстан'	1518093500985	\N	\N	\N	\N
\.


--
-- Name: sql_id_sql_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('sql_id_sql_seq', 1021, true);


--
-- Data for Name: sqltable; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY sqltable (str, query) FROM stdin;
<h5><em>Строк</em>: <span class="res">15</span><br> <em>Запрос</em>: <span class="res">SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title = 'Татарстан' EXCEPT SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title = 'Татарстан'</span></h5>\n<input type="checkbox" value="SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title = Татарстан EXCEPT SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title = Татарстан" name="sql[hidden]"/>\n<div class="table-responsive">\n<table class="table table-striped table-bordered table-hover table-condensed tables-top">\n\t<tr>\n\t\t<th>districts_id</th>\n\t\t<th>title</th>\n\t\t<th>districts</th>\n\t</tr>\n\t<tr>\n\t\t<td>19\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Менделеевский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>23\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Зеленодольский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>43\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td> Лаишевский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>36\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Высокогорский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>33\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Новошешминский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>2\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Алексеевский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>37\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Приволжский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>32\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Рыбно-Слободский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>17\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Мензелинский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>27\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Заинский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>28\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Муслюмовский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>34\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Пестречинский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>46\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Агрызский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>38\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Альметьевский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>45\t\t</td>\n\t\t<td>Татарстан\t\t</td>\n\t\t<td>Верхнеуслонский р-н\t\t</td>\n\t</tr>\n</table>\n</div>\n	SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title = Татарстан EXCEPT SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title = Татарстан
<h5><em>Строк</em>: <span class="res">4</span><br> <em>Запрос</em>: <span class="res">SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title != 'Татарстан' EXCEPT SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title != 'Татарстан'</span></h5>\n<input type="checkbox" value="SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title != Татарстан EXCEPT SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title != Татарстан" name="sql[hidden]"/>\n<div class="table-responsive">\n<table class="table table-striped table-bordered table-hover table-condensed tables-top">\n\t<tr>\n\t\t<th>districts_id</th>\n\t\t<th>title</th>\n\t\t<th>districts</th>\n\t</tr>\n\t<tr>\n\t\t<td>50\t\t</td>\n\t\t<td>Марий Эл Республика \t\t</td>\n\t\t<td>Моркинский район\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>47\t\t</td>\n\t\t<td> Южно-федеральный округ\t\t</td>\n\t\t<td>Севостопольский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>44\t\t</td>\n\t\t<td>Воронежская обл.\t\t</td>\n\t\t<td>Бутурлиновский р-н\t\t</td>\n\t</tr>\n\t<tr>\n\t\t<td>49\t\t</td>\n\t\t<td>Нижегородская обл.\t\t</td>\n\t\t<td>Нижегородский р-н\t\t</td>\n\t</tr>\n</table>\n</div>\n	SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM street st LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title != Татарстан EXCEPT SELECT DISTINCT ci.districts_id, re.title, (SELECT districts FROM districts WHERE id_districts = ci.districts_id) FROM apartment ap LEFT JOIN street st ON(ap.street = st.id_street) LEFT JOIN userdata u ON (ap.agent = u.user_id) LEFT JOIN city ci ON(st.city_id = ci.id_city) LEFT JOIN region re ON(ci.region_id = re.id_region) WHERE districts_id IS NOT NULL AND re.title != Татарстан
\.


--
-- Data for Name: street; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY street (id_street, street, city_id) FROM stdin;
2	50 лет Октября	116
3	Баки Урманче	116
4	Бызова	116
106	Нагорная	119
107	Центральная	134
6	30 лет Победы	116
14	Мира просп.	116
8	Гайнуллина	116
10	Менделеева	116
7	Вахитова просп.	116
11	Лесная	116
12	Гагарина	116
17	Студенческая	116
18	Тихая аллея	116
19	Юности	116
13	Вокзальная	116
20	Корабельная	116
21	Ямьле	116
23	Школьный бульвар	116
24	Чабьинская	116
25	Чишмале	116
26	Спортивная	116
27	Мурадьяна	116
28	Южная	116
29	Тукая	116
30	Чулман	116
31	Кайманова	116
109	Магистральная	122
35	Советская	119
36	Центральная	119
43	Садовая	119
44	Интернациональная	121
45	Юбилейная	122
46	Соболековская	122
47	Молодежная	122
49	Трудовой	123
50	Каенлы	121
52	1-й комплекс	117
54	просп. Мусы Джалиля	117
55	Братьев Касимовых	118
56	Академика Рубаненко	117
57	просп. Набережночелнинский	117
58	Пушкина	125
60	Павлюхина	118
61	Академика Губкина	118
64	Академика Завойского	118
63	прост. Победы	118
65	Нурсулта́на Назарбаева	118
62	Фатыха Амирхана	118
66	ЖК Светлый	118
67	ЖК Острова	118
68	Белинского	118
69	Чистопольская	118
71	Комсомольский	117
72	Радужная	126
73	19-й комплекс	117
74	44-й комплекс	117
75	4-й комплекс	117
76	58-й комплекс	117
77	Оренбургский тракт	118
78	Губкина	128
83	Сибирский тракт	118
84	Маршала Чуйкова	118
85	Берсут	133
86	Давыдова	133
87	дер.Нижний Таканыш	133
88	Гвардейская	117
89	Железнодорожников	117
90	просп.Московский	117
91	просп. Чулман	117
92	Романтиков	134
93	Пролетарская	135
94	Ленина	129
95	Школьная	136
96	Центральная	122
97	Новозаводская	133
79	Урицкого	129
98	Солнечная	119
99	Ключевая	119
100	Набережная	119
101	Тихая	119
102	Красная	122
103	Учительская	122
104	Пролетарская	122
105	Агрономическая	122
111	Афанасовская	122
113	Чулпан	122
114	Западная	137
115	Покровская	122
116	Восточная	137
117	Жукова	137
118	Капралова	137
119	Молодежная	137
120	Октябрьская Площадь	137
121	Полевая	137
122	Садовая	137
123	СНТ СТ Автомобилист	137
124	Южная	137
125	Гагарина	137
126	Заводская	137
127	Кооперативная	137
128	Набережная	137
129	Первомайская	137
130	Пролетарская Б.	137
131	Советская	137
132	Строителей	137
133	Юности	137
134	Дачная	137
135	Лесная	137
136	Нагорная	137
137	Пионерская	137
138	Пролетарская М.	137
139	Солнечная	137
140	Энтузиастов	137
142	Школьная	119
143	40 лет Победы	136
144	Гагарина	136
145	Мусы Джалиля	136
146	Тукая	136
41	микрорайон 2-й	120
70	микрорайон 5-й	120
15	Сююмбике	116
42	микрорайон 1-й	120
22	Якты	116
53	Табеева Фикрята	116
9	Химиков просп.	116
147	50 лет Октября	136
148	Ленина	136
149	Новая	136
150	Вахитова	136
151	Механизаторов	136
152	Солнечная	136
153	Школьный бульвар	136
154	Дачная	138
155	СНТ СТ Кошчылык	138
156	СНТ СТ Птицевод	138
157	Заречная	122
158	Спортивная	122
159	переулок Тепличный	122
160	Шакирова	122
161	Полевая	122
162	СНТ СТ Мичуринец	122
163	Запрудная	122
164	Ленина	122
165	Нижнекамская	122
166	Солнечная	122
167	Тенистая	122
168	Корабельная	139
169	СНТ СТ Индустрия	139
170	СНТ СТ Энергетик-1	139
171	Макаровка	139
172	СНТ СТ Мелиоратор-2	139
173	Субай	139
174	Пролетарская	139
175	СНТ СТ Теплоэнергострой	139
176	Центральная	139
177	Гагарина	140
178	Заречная	140
179	Лесная	140
180	Полевая 1-я	140
181	СНТ СТ Шинник	140
182	Дачная 1-я	140
183	Зеленая	140
184	Луговая	140
185	Полевая 2-я	140
186	Школьная	140
187	Дачная 2-я	140
188	Кайманова	140
189	Подгорная	140
190	Полевая 3-я	140
191	Ибрагимова	130
192	Парковая	130
193	М.Джалиля	130
194	Советская	130
195	Молодежная	130
196	Тукая	130
197	70 лет Октября	131
198	Ленина	131
199	Нагорная	131
200	Гагарина	131
201	Мира	131
202	Садовая	131
203	Зеленая	131
204	Молодежная	131
205	70 лет Победы	141
206	Комсомольская	141
207	Мира	141
208	Садовая	141
209	Солнечная	141
210	Центральная	141
211	Буткаман	141
212	Лесная	141
213	Молодежная	141
214	Сарсаз	141
215	Строителей	141
216	Школьная	141
217	Гагарина	141
218	М.Джалиля	141
219	Пионерская	141
220	Советская	141
221	Тукая	141
222	С.Закирова	124
223	Центральная	124
224	Восточная	121
225	Ленина	121
226	Татарстан	121
227	Заречная	121
228	Нагорная	121
229	Школьная	121
266	Г.Камала	129
230	микрорайон 3-й	120
231	Садовая	120
232	Центральная	120
233	СНТ СТ Домостроитель	120
234	микрорайон Новосел	120
235	СНТ СТ Тамчи	120
236	Бахетле	135
237	Мелиораторов	135
238	Школьная	135
239	Гагарина	135
240	Новая	135
241	Советская	135
242	Юности	135
243	Заречная	135
244	Полевая	135
245	Солнечная	135
246	Домостроителей	123
247	Полевая	123
248	Солнечная	123
249	Мира	123
250	Пролетарская	123
252	Набережная	123
253	Советская	123
254	переулок 1 Асфальтного завода	129
255	А.Калашникова	129
256	Авиатора Костина	129
257	Академика Королева	129
258	Базарная	129
259	Бебеля	129
260	Березовая	129
261	Братьев Челышевых	129
262	переулок Бутлерова	129
263	Валиева	129
264	Вишневского	129
265	Г.Абызова	129
267	Гайдара	129
268	Герцена	129
269	Гоголя	129
270	Гуськова	129
271	40 лет Победы	129
272	А.Невского	129
273	Айвазовского	129
274	Академика Лихачева	129
275	Байдукова	129
276	переулок Бебеля	129
278	Бурнаша	129
277	Билялова	129
279	В.Ногина	129
280	Васнецова	129
281	Водников	129
282	Г.Гиниатуллина	129
283	Г.Тукая	129
284	Галактионова	129
285	Гимаева	129
286	Грибоедова	129
287	Д.Бедного	129
288	А.Валеева	129
289	А.Нуруллина	129
290	Академика Арбузова	129
291	Александра Малышева	129
292	переулок Байдукова	129
293	Белинского	129
294	Бориса Чекина	129
295	Бутлерова	129
296	переулок В.Ногина	129
297	Вахитова	129
298	Вотякова	129
299	Г.Исхакый	129
300	Гагарина	129
301	Гафури	129
302	Глинки	129
303	переулок Гуськова	129
304	Д.Булатова	129
305	Декабристов	129
306	Дзержинского	129
307	Дубравная	129
308	Жуковского	129
309	Залесная	129
310	Зяббарова	129
311	Инкубаторная	129
312	переулок К.Либкнехта	129
313	К.Якуба	129
314	переулок Камской	129
315	переулок Карьерной 2-й	129
316	Кзыл Татарстан	129
317	Космонавтов	129
318	Красноармейская	129
319	Крутогорская	129
320	Куйбышева	129
321	переулок Кулясова 1-й	129
322	Джамбула	129
323	Дорожная	129
324	Заводская	129
325	Затонская	129
326	Ибрагимова	129
327	Инкубаторной	129
328	переулок К.Маркса	129
331	переулок Карьерной 3-й	129
332	Комсомольская	129
333	Котовского	129
334	переулок Крупской	129
335	Крылова	129
336	переулок Кулясова 2-й	129
337	Джукетау	129
338	Дружбы	129
339	Жукова	129
340	Загородная	129
341	Зеленая	129
342	Ивана Мешкичева	129
343	К.Либкнехта	129
344	К.Маркса	129
345	Камская	129
346	переулок Карьерной	129
347	переулок Карьерной 4-й	129
348	Корнилова	129
349	Красная Горка	129
350	Крупской	129
351	Кузнечная	129
352	Кулясова	129
353	переулок Кулясова 3-й	129
354	Курченко	129
355	переулок Л.Толстого 2-й	129
356	Лесная	129
357	переулок Лесной 2-й	129
358	Ломоносова	129
359	переулок М.Горького	129
360	Малая	129
361	Маркина	129
362	Матросова	129
363	Мебельная	129
364	Минина	129
365	Миронова	129
366	переулок Мичурина 2-й	129
367	Н.Никонорова	129
368	Н.Семенова	129
369	Нариманова	129
370	Л.Толстого	129
371	Л.Чайкиной	129
372	Лермонтова	129
373	Лесничество	129
374	Лесозаводская	129
375	Луговая	129
376	М.Джалиля	129
377	Малореченская	129
378	переулок Маркина	129
379	переулок Маяковского	129
381	переулок Мира	129
330	Карьерная	129
329	Калинина	129
380	Менделеева	129
382	Мичурина	129
383	Можайского	129
384	Н.Ногина	129
385	Набережная	129
386	Некрасова	129
387	переулок Л.Толстого 1-й	129
388	Левитана	129
389	переулок Лермонтова	129
390	переулок Лесной 1-й	129
391	Лобачевского	129
392	М.Горького	129
393	М.Поликарповой	129
394	Маринина	129
395	Мастеровых	129
396	Маяковского	129
397	Миксина	129
398	Мира	129
399	переулок Мичурина 1-й	129
400	Молодежная	129
401	Н.Прибоя	129
402	Нагорная	129
403	Нестерова	129
404	поселок Нефтебаза	129
405	переулок Новосельской	129
406	Овражная	129
407	П.Гаврилова	129
408	Пасека	129
409	Петра Шашина	129
410	Плеханова	129
411	Победы	129
412	Полющенкова	129
413	Привалова	129
414	Пугачева	129
415	Р.Люксембург	129
416	Репина	129
417	С.Есенина	129
418	С.Тюленина	129
419	Свердлова	129
420	Советская	129
421	Новая	129
422	О.Кошевого	129
423	Октябрьская	129
424	П.Крестникова	129
425	Первомайская	129
426	Пионерская	129
427	Плодопитомник	129
428	Пожарского	129
429	Поселковая	129
430	Пролетарская	129
431	Пушкина	129
432	Р.Фахреддина	129
433	набережная Ржавец	129
434	С.Кузьмина	129
435	Садовая	129
436	Сергея Яковлева	129
437	Солнечная	129
438	Новосельская	129
439	Обыденова	129
440	Островского	129
441	Парковая	129
442	переулок Первомайской	129
443	переулок Пионерской	129
444	Победителей	129
445	Полевая	129
446	переулок Поселковой	129
447	Просек	129
448	переулок Пушкина	129
449	Радищева	129
450	Романа Орлова	129
451	С.Разина	129
452	Сайдашева	129
453	Ситдикова	129
454	Союзная	129
455	Спартаковская	129
456	Студенческая	129
457	Сурикова	129
458	Тургенева	129
459	переулок Ухтомского	129
460	переулок Фрунзе	129
461	Х.Туфана	129
462	Хлебная	129
463	Чайковского	129
464	Чернышевского	129
465	переулок Чкалова	129
466	Шишкина	129
467	Энгельса	129
468	Ягодная	129
469	Стекольщикова	129
470	Суворова	129
471	Т.Хлебниковой	129
472	поселок Учхоз	129
473	Фрунзе	129
474	Хамзина	129
475	Хмельницкого	129
476	Чапаева	129
477	Чехова	129
478	Ш.Усманова	129
479	Школьная	129
480	проспект Юбилейный	129
481	Ямашева	129
482	Стрелка	129
483	Султангалиева	129
484	Театральная	129
485	Ухтомского	129
486	переулок Учхоз	129
487	Х.Такташа	129
488	переулок Хамзина	129
489	Циолковского	129
490	Часовая	129
491	Чкалова	129
492	Шамсутдинова	129
493	Элеваторная	129
494	Южная	129
495	Яхина	129
496	Береговая	116
497	ГК АТХ Горздрав	116
498	тер. ГСК N 10	116
499	тер. ГСК N 16	116
500	тер. ГСК N 2	116
501	тер. ГСК N 22	116
510	тер. БСИ	116
511	Грушевая	116
524	Алань	116
542	Заводская	116
543	тер. ОАО Нижнекамскнефтехим	116
544	тер. Овощехранилище N2	116
526	тер. ГСК N 15	116
513	тер. ГСК N 17	116
527	тер. ГСК N 19	116
514	тер. ГСК N 20	116
515	тер. ГСК N 24	116
529	тер. ГСК N 25	116
502	тер. ГСК N 26	116
516	тер. ГСК N 27	116
503	тер. ГСК N 29	116
517	тер. ГСК N 3	116
531	тер. ГСК N 33	116
504	тер. ГСК N 4	116
532	тер. ГСК N 7	116
505	тер. ГСК N 8	116
519	тер. ГСК N 86	116
533	тер. ГСК N 9	116
520	тер. ГСК Алгоритм	116
534	тер. ГСК ВАЗ	116
507	тер. ГСК Волга	116
522	тер. ГСК Кама	116
535	тер. ГСК Домостроитель- 1	116
508	тер. ГСК Дубок	116
509	тер. ГСК МАК	116
536	тер. ГСК Клаксон	116
539	тер. ГСК Прона	116
540	тер. ГСК Телецентр	116
537	тер. ГСК Нефтехим	116
541	тер. ГСК Фасция	116
538	тер. ГСК Нефтехимик 74	116
545	тер. Промбаза	116
546	Романтиков	116
547	тер. СГК Мирный	116
548	Субай	116
549	Чистопольская	116
554	площадь Им Н.В.Лемаева	116
555	тер. ОАО Нижнекамскшина	116
556	Первопроходцев	116
557	тер. Промзона	116
558	Рябиновая	116
559	Соболековская	116
560	Центральная	116
565	Индустриальная	116
566	тер. Овощехранилище N1	116
567	тер. ППК Урожай	116
569	Садовая	116
570	Солнечная	116
571	Технологическая	116
573	Чулпан	116
525	тер. ГСК N 1	116
512	тер. ГСК N 11	116
528	тер. ГСК N 21	116
530	тер. ГСК N 28	116
518	тер. ГСК N 6	116
506	тер. ГСК N 93	116
521	тер. ГСК Домостроитель	116
562	тер. ГСК СЭС	116
552	тер. ГСК Техуглерод	116
523	тер. ГСК Менделеева 56	116
563	тер. ГСК Урожай	116
561	тер. ГСК Престиж	116
564	тер. ГСК Шинник-89	116
553	тер. ГСК Шинник-55	116
550	тер. ГСК Петрокам- авто	116
551	тер. ГСК Сайгак	116
575	Лесная	142
579	Садовая	142
582	тер. СТ Автомобилист-1	142
576	тер. СТ Ветеран	142
580	тер. СТ Дуслык	142
578	тер. СТ Шинник массив N2	142
584	тер. СТ Спутник	142
581	тер. СТ Сельхозтехника массив Дмитриевка	142
577	тер. СТ Саулык	142
583	тер. СТ Нефтехимик массив Дмитриевка	142
585	Квартал N1	134
586	Квартал N5	134
587	Проезд N1	134
588	Квартал N2	134
589	Первопроходцев	134
590	Сиреневая	134
591	Квартал N3	134
592	Первостроителей	134
593	Большая Гора	143
594	Полевая	143
595	тер. СТ Труд	143
596	Волкова гора	143
599	Евлантьева гора	143
600	тер. СТ Сенажник	143
597	тер. СТ Мелиоратор	143
598	тер. СТ Флера	143
601	Зеленая	144
604	Озерная	144
607	тер. СТ ГОСС	144
602	тер. СТ Железнодорожник	144
605	тер. СТ Медик-2	144
608	тер. СТ Монтажник-3	144
609	тер. СТ Чайка	144
606	тер. СТ Строитель	144
603	тер. СТ Сельхозтехника массив Ильинка	144
610	Джалиля	145
611	Мира	145
612	Тойминская	145
613	Цветаевой	145
614	Лесная	145
615	Набережная	145
616	Трудовая	145
617	Шишкина	145
618	Луговая	145
619	Пушкина	145
620	Тукая	145
621	переулок 10 лет Татарстана	146
622	переулок 8 Марта	146
623	Азина	146
624	Алтынай	146
625	Балан	146
626	Белокаменная	146
627	Бехтерева	146
628	Большая Покровская	146
629	Бондюжская	146
630	Вазетдинова	146
631	переулок Весенний	146
632	переулок Восточный	146
633	переулок Галиаскара Камала	146
634	Гвардейская	146
635	Городищенская	146
636	Дачная	146
637	Дорожников	146
638	10 лет Татарстана	146
639	переулок Аббасова	146
640	Акчарлак	146
641	Аэродромная	146
642	Балкыш урамы	146
643	Березовая	146
644	Благодатная	146
645	переулок Большой	146
646	Боровая	146
647	переулок Васильковый	146
648	переулок Вишневый	146
649	Габдуллы Тукая	146
650	Галиаскара Камала	146
651	Говорова	146
652	переулок Грибной	146
653	переулок Девонский	146
654	переулок Дружный	146
655	40 лет Татарии	146
656	Автомобилистов	146
657	Александра Епанешникова	146
658	Баки Урманче	146
659	Бахетле	146
660	Болгар	146
661	переулок Большой Гласисный	146
662	Буровиков	146
663	переулок Веселый	146
664	переулок Водонапорный	146
665	Гаврилова	146
666	Гассара	146
667	Горная	146
668	Дальняя	146
669	переулок Добрый	146
670	переулок Дубравный	146
671	Дуслык	146
672	переулок Западный	146
673	переулок Зеленый	146
674	шоссе Ижевское	146
675	переулок Каенлы	146
676	Карима Рашидова	146
677	Кечкенэ	146
678	переулок Ключевой	146
679	Комсомольская	146
680	Космонавтов	146
681	площадь Ленина	146
682	Луговая	146
683	М.Цветаевой	146
684	Максима Горького	146
685	переулок Малый	146
686	Матросова	146
687	переулок Маяковского	146
688	переулок Еловый	146
689	Заповедная	146
690	Землянухина	146
691	Интернациональная	146
692	Казанская	146
693	Карьерная	146
694	Кирпичный завод	146
695	Колосовская	146
696	переулок Комсомольский	146
697	Красногвардейская	146
698	Лесная	146
699	Лыжная	146
700	Мазита Гафури	146
701	Малая Московская	146
702	Марджани	146
703	Матур урам	146
704	переулок Медовый	146
705	переулок Заводской	146
706	Зеленая	146
707	заезд Зои Космодемьянской	146
708	переулок Йолдызлык	146
709	Калистова	146
710	переулок Карьерный	146
711	переулок Кленовый	146
712	Коминтерна	146
713	Кооперативная	146
714	Лангепасская	146
715	переулок Литейный	146
716	переулок Любимый	146
717	переулок Майский	146
718	Малая Покровская	146
719	переулок Марджани	146
720	Маяковского	146
721	переулок Милеш	146
722	проспект Мира	146
723	Молодежная	146
724	Мусы Джалиля	146
725	переулок Надежды Дуровой	146
726	проспект Нефтяников	146
727	Нократ	146
728	шоссе Окружное	146
729	площадь Памяти	146
730	Первомайская	146
731	переулок Пионерский	146
732	Пригородная	146
733	переулок Пристанской	146
734	Профсоюзная	146
735	Радия Нутфуллина	146
736	Разведчиков	146
737	Родная	146
738	переулок Романовского	146
739	переулок Мирный	146
740	Морквашинская	146
741	Набережная	146
742	Надежды Дуровой	146
743	переулок Нефтяников	146
744	Нурлы урам	146
745	Октябрьская	146
746	Парковая	146
747	переулок Песчаный	146
748	переулок Пограничный	146
749	Прикамская	146
750	Пролетарская	146
751	переулок Рабочий	146
752	Радужная	146
753	переулок Разведчиков	146
754	Родниковая	146
755	переулок Ромашковый	146
756	переулок Мичурина	146
757	Московская	146
758	шоссе Набережно-Челнинское	146
759	Наратлык	146
760	переулок Новый	146
761	Овражная	146
762	Отрадная	146
763	Патриотов	146
764	Пинегина	146
765	Полевой	146
766	Приовражная	146
767	переулок Промысловый	146
768	Радищева	146
769	переулок Радужный	146
770	переулок Ровный	146
771	переулок Родниковый	146
772	Рябиновая	146
773	Садовая	146
774	Саралинская	146
775	Светлая	146
776	Северная	146
777	переулок Сеченый	146
778	Славная	146
779	переулок Совхозный	146
780	Сосновая	146
781	Спортивная	146
782	переулок Строителей	146
783	Тази Гиззата	146
784	переулок Танаевский 2-й	146
785	переулок Танаевский 5-й	146
786	переулок Танаевский 8-й	146
787	переулок Тенистый	146
788	Тойминская	146
789	Туганлык	146
790	переулок Садовый	146
791	переулок Свердлова	146
792	переулок Свечникова	146
793	Сельхозхимия	146
794	переулок Сиреневый	146
795	Снежная	146
796	Солдатская	146
797	Софронова	146
798	переулок Средний	146
799	Строителей	146
800	переулок Танаевский 1-й	146
801	переулок Танаевский 3-й	146
802	переулок Танаевский 6-й	146
803	переулок Танаевский 9-й	146
804	переулок Теплый	146
805	переулок Тойминский	146
806	Тугарова	146
807	Санаторная	146
808	Свердлова	146
809	переулок Свечной	146
810	Семидворная	146
811	переулок Сказочный	146
812	Советская	146
813	переулок Солнечный	146
814	Спасская	146
815	Стахеевых	146
816	Сююмбике	146
817	переулок Танаевский 10-й	146
818	переулок Танаевский 4-й	146
819	переулок Танаевский 7-й	146
820	шоссе Танаевское	146
821	Тихая	146
822	Трехсвятская	146
823	площадь Тысячелетия	146
824	Тысячелетия	146
825	Халикова	146
826	Хлебный городок	146
827	переулок Центральный	146
828	шоссе Челнинское	146
829	переулок Чишма	146
830	Швалева	146
831	Энтузиастов	146
832	Юлдаш урамы	146
833	Фабричная	146
834	Хвойная	146
835	Цветочная	146
836	переулок Чапаева	146
837	Чернышевского	146
838	Чулман	146
839	Шишкина	146
840	переулок Юбилейный	146
841	переулок Ягодный	146
842	Федора Ляха	146
843	Хирурга Нечаева	146
844	переулок Целинный	146
845	Чапаева	146
846	Чехова	146
847	Шатлык	146
848	Шомырт	146
849	переулок Южный	146
850	Аппакова	147
851	Бугорная	147
852	Луговая	148
853	Минькинская	148
854	Северая	148
855	СНТ СТ Борок	148
856	Хуторская	148
857	Луговая 1-я	148
858	Молодежная	148
859	Солнечная	148
860	СНТ СТ Саулык	148
861	Центральная	148
862	М.Горького	148
863	Оськино	148
864	Сосновая	148
865	СНТ СТ Шинник массив N6	148
866	Школьная	148
867	50 лет Победы	149
868	Азина	149
869	Ахметшина	149
870	Бахетле	149
871	В.Хадеева	149
872	Воинов-интернационалистов	149
873	Г.Латыпова	149
874	Гастелло	149
875	Гордова	149
876	Гурьянова	149
877	Дружбы Народов	149
878	З.Космодемьянской	149
879	Западная	149
880	К.Либкнехта	149
881	переулок Кадомцевых	149
882	переулок Кичубаева	149
883	Комсомольская	149
884	А.Фасхутдинова	149
885	Академика Шамова	149
886	переулок Б.Гермака	149
887	Береговая	149
888	Вахитова	149
889	Восточная	149
890	Гагарина	149
891	Гоголя	149
892	Губкина	149
893	Дачная	149
894	переулок Дружбы Народов	149
895	Заводская	149
896	Зеленая	149
897	переулок К.Маркса	149
898	Кадомцевых	149
899	Комарова	149
900	Корабельная	149
901	Аграрная	149
902	Артистов Зиганшиных	149
903	Б.Гермака	149
904	Березки	149
905	Виктора Темина	149
906	врача Даминовой	149
907	Гайдара	149
908	Головина	149
909	Гульшат Зайнашевой	149
910	Девонская	149
911	Екатерины 2-ой	149
912	переулок Заводской	149
913	Изыскателей	149
914	К.Маркса	149
915	Карлыгач	149
916	Коммунистическая	149
917	Красноармейская	149
918	Ленина	149
919	М.Горького	149
920	М.Кичубаева	149
921	Мирная	149
922	Некрасова	149
923	переулок Новый	149
924	Октябрьская	149
925	Первомайская	149
926	Производственная	149
927	Пушкина	149
928	Речная	149
929	переулок Родниковый	149
930	Рыночная	149
931	Сабантуй	149
932	Сандугач	149
933	Сестер Есиных	149
934	переулок Социалистический	149
935	Лесная	149
936	переулок М.Джалиля	149
937	Мелиораторов	149
938	переулок Мирный	149
939	Нефтяников	149
940	О.Кошевого	149
941	П.Морозова	149
942	Пионерская	149
943	Пролетарская	149
944	Р.Люксембург	149
945	переулок Речной	149
946	Романа Солнцева	149
947	Рябиновая	149
948	Садовая	149
949	Свердлова	149
950	Солнечная	149
951	Спортивная	149
952	Лесопарковая	149
953	М.Джалиля	149
954	переулок Мелиораторов	149
955	Молодежная	149
956	Новая	149
957	Овражная	149
958	Парашютистов	149
959	Прибрежная	149
960	переулок Пролетарский	149
961	Рашита Гарая	149
962	Родниковая	149
963	Романтиков	149
964	рядового Винокурова	149
965	Садовода Костина	149
966	Северная	149
967	Социалистическая	149
968	Строителей	149
969	Тапикова	149
970	Тукая	149
971	переулок Ф.Шарафутдинова	149
972	Х.Салимовой	149
973	Хусаинова	149
974	Чернышевского	149
975	Э.Огневой	149
976	Энтузиастов	149
977	Янтарная	149
978	Татарстан	149
979	переулок Тукая	149
980	Ф.Шарафутдинова	149
981	Х.Такташ	149
982	Чапаева	149
983	проспект Шашина	149
984	Элеваторная	149
985	Юбилейная	149
986	Тракторная	149
987	Уютная	149
988	Фрунзе	149
989	хирурга Дружкова	149
990	Челнинский Тракт	149
991	Школьная	149
992	переулок Энтузиастов	149
993	Яблоневая	149
995	Лесная	150
996	Новая	150
997	Центральная	150
998	50 лет Октября	151
999	Горького	151
1000	Кирова	151
1001	Королева	151
1002	Луговая	151
1003	Пионерская	151
1004	Рейдовая	151
1005	Школьная	151
1006	8 Марта	151
1007	Карла Маркса	151
1008	Ключевая	151
1009	Ленина	151
1010	Молодежная	151
1011	Пристанская	151
1012	Свободы	151
1013	Энгельса	151
1014	Гагарина	151
1015	Карташова	151
1016	Кормушина	151
1017	Лесная	151
1018	Окунева	151
1019	Пролетарская	151
1020	Советская	151
1022	Лесная	152
1023	Садовая	152
1024	Мельничная	152
1025	Нижняя	152
1026	переулок Верхний	153
1027	Лесная	153
1028	Полевая	153
1029	СНТ СТ Смыловка	153
1030	Заводская	153
1031	Луговая	153
1032	переулок Средний	153
1033	Школьная	153
1034	Крестьянская	153
1035	переулок Нижний	153
1036	СНТ СТ Селена	153
1037	18-я годовщина Октября	133
1038	8 Марта	133
1039	Абсалямова	133
1040	Азина	133
1041	Аэродромная	133
1042	Будайли	133
1043	В.Высоцкого	133
1044	переулок Верхний	133
1045	Г.Ибрагимова	133
1046	Г.Смирнова	133
1047	Гагарина	133
1048	Горького	133
1049	переулок Дачный	133
1050	Дорожников	133
1051	переулок Заводской	133
1052	Заправочная	133
1053	переулок Зеленый	133
1054	50 лет Победы	133
1055	А.А.Салина	133
1056	переулок Агрохимиков	133
1057	Академика Валиева	133
1058	Б.Урманче	133
1059	Булатова	133
1060	В.Короленко	133
1061	Вишневая	133
1062	Г.Исхаки	133
1063	переулок Г.Смирнова	133
1064	Галактионова	133
1065	Домолазова	133
1066	Дружбы	133
1067	Западная	133
1068	Заречье	133
1069	Земляничная	133
1070	70 лет Победы	133
1071	А.Осинина	133
1072	Агрохимиков	133
1073	Ахмадиевой	133
1074	Березовая	133
1075	Булгаров	133
1076	В.Фигнер	133
1077	Въездная	133
1078	Г.Нигматуллина	133
1079	Г.Тукая	133
1080	Дачная	133
1081	переулок Дорожников	133
1082	Заводская	133
1083	переулок Западный	133
1084	Зеленая	133
1085	И.Иванова	133
1086	Ильгиза Мубаракзянова	133
1087	К.Маркса	133
1088	переулок Кашапова	133
1089	Кирпичная	133
1090	Коммунистическая	133
1091	Красноармейская	133
1092	Лермонтова	133
1093	М.Аухадиева	133
1094	М.Хайруллиной	133
1095	Майская	133
1096	Мелиораторов	133
1097	Мичурина	133
1098	Моторная	133
1099	Н.Юсуповой	133
1100	переулок Набережной Беркаса	133
1101	Нефтяников	133
1102	Новая	133
1103	Ипподромная	133
1104	К.Сафина	133
1105	Кашапова	133
1106	переулок Кирпичный	133
1107	Комсомольская	133
1108	Кул Гали	133
1109	Лесная	133
1110	М.Гайфутдинова	133
1111	Магистральная	133
1112	Максимова	133
1113	Мира	133
1114	Молодежная	133
1115	Мухутдинова	133
1116	Набережная Вятки	133
1117	Нагорная	133
1118	переулок Нигматуллина	133
1119	Новоберкасская	133
1120	переулок Ипподромный	133
1121	Карьерная	133
1122	Кирова	133
1123	Козырева	133
1124	Королева	133
1125	Ленина	133
1126	Луговая	133
1127	М.Джалиля	133
1128	переулок Магистральный	133
1129	Маяковского	133
1130	Мирсаита Яруллина	133
1131	Москвина	133
1132	Н.Идрисова	133
1133	Набережная Ошмы	133
1134	Нафикова	133
1135	переулок Нижний	133
1136	переулок Новозаводской	133
1137	Островского	133
1138	Планетарная	133
1139	Полевая	133
1140	Промышленная	133
1141	переулок Пугачева	133
1142	Р.Нуриева	133
1143	Родниковая	133
1144	Сахарова	133
1145	Северная	133
1146	Сосновая	133
1147	Степная	133
1148	Сырзаводская	133
1149	Текстильная	133
1150	Толстого	133
1151	Ф.Карима	133
1152	Фабричная	133
1153	Объездная	133
1154	Первая	133
1155	Победы	133
1156	Прибрежная	133
1157	Просвирнина	133
1158	переулок Пушкина	133
1159	Радужная	133
1160	Садовая	133
1161	Свободы	133
1162	Советская	133
1163	Союзная	133
1164	Строителей	133
1165	Т.Степановой	133
1166	переулок Текстильный	133
1167	переулок Тукая	133
1168	переулок Ф.Карима	133
1169	Фестивальная	133
1170	Осипенко	133
1171	Пионерская	133
1172	переулок Победы	133
1173	Приовражная	133
1174	Пугачева	133
1175	Пушкина	133
1176	Рафаэля Мухаметшина	133
1177	Сайдашева	133
1178	Связистов	133
1179	Солнечная	133
1180	Спортивная	133
1181	Султанбекова	133
1182	Татарстан	133
1183	Товарищеская	133
1184	Ф.Амирхана	133
1185	Ф.Яруллина	133
1186	Х.Бадиги	133
1187	Х.Вафина	133
1188	Цветочная	133
1189	Черкасова	133
1190	Чуйкова	133
1191	Ш.Марджани	133
1192	Шоссейная	133
1193	Энгельса	133
1194	Юлии Запольской	133
1195	Х.Такташа	133
1196	переулок Цветочный	133
1197	улица Чехова	133
1198	Ш.Камала	133
1199	Школьная	133
1200	Щербакова	133
1201	Энергетиков	133
1202	Ягодная	133
1203	Х.Туфана	133
1204	Чапаева	133
1205	Чкалова	133
1206	Ш.Маннура	133
1207	переулок Школьный	133
1208	переулок Энгельса	133
1209	улица Южная	133
1210	Трудовая	154
1211	Дачная	122
1212	Советская	155
1213	Центральная	156
1214	Ахмадеева	157
251	Школьная	123
1216	Большая Красная	159
1299	1) Не указано	146
1217	Козловка	159
1218	Ягодная	159
1219	Головнина	159
1220	Ленина	159
1221	Заречная	159
1222	Школьная	159
1223	Биха Юсича	160
1224	Молодежная	160
1225	Заречная	160
1226	Рябиновая	160
1227	Мира	160
1228	Юности	160
1229	Нагорная	162
1230	Центральная	161
1231	Садовая	162
1232	просп.Коста	163
1235	СНТ Дорожник	116
1236	СНТ Спутник	116
1021	СНТ Индустрия	116
1237	Большая	165
1238	Садовая	165
1239	Ерзовка	165
1240	СНТ Зай	165
1241	Заречная	165
1242	Татарская	165
1243	1) Не указано	116
1244	1) Не указано	165
1245	Дзержинского	166
1246	Октябрьская	166
1247	Центральная	166
1248	Карла Маркса	166
1249	Полевая	166
1250	Школьная	166
1251	Молодежная	166
1252	Пролетарская	166
1253	1) Не указано	166
1254	1) Не указано	129
1255	1) Не указано	144
1256	Кооперативная	167
1257	Центральная	167
1258	Молодежная	167
1259	Советская	167
1260	1) Не указано	167
1261	1) Не указано	127
1262	1) Не указано	128
1263	1) Не указано	143
1264	1) Не указано	125
1265	1) Не указано	147
1266	1) Не указано	122
1267	1) Не указано	148
1268	1) Не указано	130
1269	1) Не указано	131
1270	1) Не указано	136
1271	1) Не указано	137
1272	1) Не указано	155
1273	1) Не указано	135
1274	1) Не указано	151
1275	1) Не указано	134
1276	1) Не указано	153
1277	1) Не указано	159
1278	1) Не указано	156
1279	1) Не указано	141
1280	1) Не указано	162
1281	1) Не указано	160
1282	1) Не указано	133
1283	1) Не указано	154
1284	1) Не указано	121
1285	1) Не указано	161
1286	1) Не указано	140
1287	1) Не указано	123
1288	1) Не указано	152
1289	1) Не указано	138
1290	1) Не указано	145
1291	1) Не указано	139
1292	1) Не указано	150
1293	1) Не указано	117
1294	1) Не указано	149
1295	1) Не указано	119
1296	1) Не указано	120
1297	1) Не указано	118
1298	1) Не указано	124
1215	1) Не указано	158
1300	1) Не указано	142
1301	1) Не указано	157
1302	8 Марта	154
1303	Большая Нариманова	154
1304	Габдуллы Тукая	154
1305	Георгиевского	154
1233	Шинников просп.	116
1306	Горького	154
1307	Закировой Каусарии	154
1308	Карла Маркса	154
1309	переулок Клубный	154
1310	Крымская	154
1311	Луговая	154
1312	Малая Нариманова	154
1313	Мичурина	154
1314	Набережная	154
1315	Пастернака	154
1316	Подгорная	154
1317	Прикамская	154
1318	Пушкина	154
1319	Азина	154
1320	Бурмистрова	154
1321	Гагарина	154
1322	Гора Революции	154
1323	Гунина	154
1324	Зеленая	154
1325	Карпова	154
1326	Ключевая	154
1327	ГСК 14 квартал	158
1328	Ленина	154
1329	Майская	154
1330	ГСК 36А квартал	158
1331	сад 50 лет Победы	158
1332	Менделеева	154
1333	Молодежная	154
1334	сад 70 лет Октября	158
1335	переулок Набережный	154
1337	Первомайская	154
1338	Подклубная	154
1340	территория Промзона	154
1342	Речная	154
1345	Большая Лесная	154
1346	Вахитова	154
1347	Гассара	154
1349	Горная	154
1351	Дружбы	154
1353	бульвар Интернационалистов	154
1354	Кирова	154
1356	Красная	154
1358	Лесхозная	154
1360	Малая лесная	154
1362	Мира	154
1364	Московская	154
1365	сад Блокпост	158
1366	Октябрьская	154
1367	Пионерская	154
1369	Полевая	154
1370	Профсоюзная	154
1371	переулок Больничный	158
1372	Садовая	154
1374	Северная	154
1375	Солнечная	154
1376	Заводская	158
1377	Тойминская	154
1378	Загородная	158
1379	Фомина	154
1380	Шакирова	154
1381	Заикина	158
1382	Юбилейная	154
1383	Советская	154
1384	Залесная	158
1385	Сосновая	154
1386	Западная	158
1387	Химиков	154
1388	ГСК Западный	158
1389	Школьная	154
1390	Совхозная	154
1391	ГСК Заря	158
1392	Татарстана	154
1393	Ушковых	154
1394	Чоловского	154
1395	Засорина	158
1396	переулок Школьный	154
1397	Звездная	158
1398	сад Здоровье-1	158
1399	Большая Заводская	158
1373	Жуковского	158
1400	Ахтубинская	116
1401	Луговая 1-я	168
1402	Луговая	168
1403	Лесная	168
1404	Луговая 2-я	168
1405	Новая	168
1406	Пушкина	168
1407	Шолохова	168
1408	1) Не указано	168
1409	Дачная	169
1410	СНТ СТ Березовая Грива	169
1411	Камская	169
1412	Тихая	169
1413	Садовая	169
1414	1) Не указано	169
1415	СНТ Шинник	116
1416	Зая	170
1417	Советская	170
1418	Малая	170
1419	Соколовка	170
1420	Садовая	170
1421	1) Не указано	170
1422	В.Терешковой	171
1423	Цветочная	171
1424	Заречная	171
1425	Садовая	171
1426	1) Не указано	171
1428	Нагорная	172
1429	Школьная	172
1430	Болодурина	172
1431	Победы	172
1432	Зеленая	172
1433	Советская	172
1434	1) Не указано	172
1435	Ислаевых	173
1427	Первого Мая	172
1436	Ленина	173
1437	Кооперативная	173
1438	Красноармейская	173
1439	1) Не указано	173
1344	Жукова	158
1341	Железнодорожная 2-я	158
1339	Железнодорожная 1-я	158
1336	Агрономическая	158
1348	Алтайская	158
1350	Бакы Урманче	158
1352	Баумана	158
1355	Безымянная	158
1357	Белинского	158
1359	Береговая	158
1361	Березовая	158
1363	Библиотечная	158
1440	Володарского	174
1441	Лесная	174
1442	1) Не указано	174
1443	Дружбы	175
1444	Набережная	175
1445	Полевая	175
1446	Зеленая	175
1447	Нагорная	175
1448	Пролетарская	175
1449	Молодежная	175
1450	Октябрьская	175
1451	Школьная	175
1452	1) Не указано	175
1453	Дачная	176
1454	Московская	176
1455	Ленинградская	176
1456	Островского	176
1457	Молодежная	176
1458	Центральная	176
1459	1) Не указано	176
1460	переулок 1-й	177
1461	Центральная	177
1462	1) Не указано	177
1463	Заречная	178
1464	Центральная	178
1465	1) Не указано	178
1466	Центральная	179
1467	1) Не указано	179
1468	Центральная	180
1469	1) Не указано	180
1470	К.Маркса	181
1471	Новая	181
1472	Кирова	181
1473	Свердлова	181
1474	Ленина	181
1475	1) Не указано	181
1476	1) Не указано	182
1477	Зая	183
1478	Ленина	183
1479	Чапаева	183
1480	1) Не указано	183
1481	Бахетле	184
1482	Новая	184
1483	Гагарина	184
1484	Ленина	184
1485	1) Не указано	184
1486	Лесная	185
1487	СНТ СТ Нефтехимик массив Верхний Ключ	185
1488	СНТ СТ Шинник массив Верхний Ключ	185
1489	1) Не указано	185
1490	Дачная	186
1491	Садовая	186
1492	Центральная	186
1493	1) Не указано	186
1494	Демидова	187
1495	Нагорная	187
1496	Пролетарская	187
1497	Ленина	187
1498	Пионерская	187
1499	Садовая	187
1500	Набережная	187
1501	Полевая	187
1502	1) Не указано	187
1503	Вишневая	188
1504	Ленина	188
1505	Садовая	188
1506	Кооперативная	188
1507	Пионерская	188
1508	Центральная	188
1509	переулок Кооперативный	188
1510	Рамазанова	188
1511	1) Не указано	188
1512	Зеленая	189
1513	Центральная	189
1514	Молодежная	189
1515	Школьная	189
1516	Полевая	189
1517	1) Не указано	189
1518	Зеленая	190
1519	Школьная	190
1520	Маленькая	190
1521	Молодежная	190
1522	1) Не указано	190
1523	Вахитова	191
1524	Красноармейская	191
1525	1) Не указано	191
1526	Молодежная	192
1527	Солнечная	192
1528	Школьная	192
1529	1) Не указано	192
1530	Гагарина	193
1531	Лесная	193
1532	Строителей	193
1533	1) Не указано	193
1534	Тукая	194
1535	1) Не указано	194
1536	Пушкина	195
1537	1) Не указано	195
1538	Лесная	196
1539	Молодежная	196
1540	1) Не указано	196
1541	Верхняя	197
1542	Центральная	197
1543	1) Не указано	197
1544	Гагарина	198
1545	Молодежная	198
1546	Тукая	198
1547	1) Не указано	198
1548	Советская	199
1549	1) Не указано	199
1550	Горького	200
1551	Октябрьская	200
1552	Чапаева	200
1553	Колхозная	200
1554	Подгорная	200
1555	Южная	200
1556	Новая	200
1557	Полевая	200
1558	1) Не указано	200
1559	Заречная	201
1560	Центральная	201
1561	1) Не указано	201
1562	Лесная	202
1563	1) Не указано	202
1564	Лесная	203
1565	Песочная	203
1566	СНТ СТ Красный Бор	203
1567	1) Не указано	203
1568	Лесная	204
1569	1) Не указано	204
1570	Нагорная	205
1571	Центральная	205
1572	1) Не указано	205
1573	50 лет Татарстана	206
1574	Гагарина	206
1575	Комсомольская	206
1576	Маркина	206
1577	Нижнекамская	206
1578	Полевая	206
1579	Советская	206
1580	Чистопольская	206
1581	8 Марта	206
1582	Казанская	206
1583	Космонавтов	206
1584	Механизаторов	206
1585	Новая	206
1586	Садовая	206
1587	Солнечная	206
1588	Школьная	206
1589	Больничная	206
1590	Колхозная	206
1591	Ленина	206
1592	Нагорная	206
1593	Пионерская	206
1594	Славянка	206
1595	СНТ СТ Здоровье	206
1596	Эминентова	206
1597	1) Не указано	206
1598	Кирова	207
1599	Пушкина	207
1600	Центральная	207
1601	Новая	207
1602	Сабантуя	207
1603	Пионерская	207
1604	Тукая	207
1605	1) Не указано	207
1606	Ключевая	208
1607	Центральная	208
1608	1) Не указано	208
1234	Строителей просп.	116
1609	Речная	209
1610	Центральная	209
1611	1) Не указано	209
1612	СНТ Садовод-НК	169
1614	тер. ГСК 35	116
1615	не указана	211
1619	1)не указана	216
1620	1)не указана	217
1621	1)не указана	218
1624	1)не указана	221
1625	1)не указана	222
1626	1)не указана	223
1627	1)не указана	225
1628	1)не указана	226
1629	1)не указана	227
1630	1)не указана	228
1631	1)не указана	229
1632	1)не указана	230
1634	К.Маркса	213
1617	1) Не указано	213
1635	Октябрьская	213
1636	Комсомольская	213
1637	Советская	213
1638	Молодежная	213
1639	Первого Мая	127
1640	А.Валиханова	127
1641	Азнакаевская	127
1642	Алмалык	127
1643	Балкыш	127
1644	Бахетле	127
1645	Булгар	127
1646	Восточная	127
1647	Г.Исхаки	127
1648	Г.Хасаншиной	127
1649	Газинура	127
1650	Гильфанова	127
1651	Горького	127
1652	Дальняя	127
1653	Дуслык	127
1654	Заводской	127
1655	Заречная	127
1656	8 Марта	127
1657	А.Гурьянова	127
1658	Аккош	127
1659	Альметьевский тракт	127
1660	Баумана	127
1661	Братьев Гринь	127
1662	1)не указана	232
1663	Буровиков	127
1664	Г.Багманова	127
1665	Г.Камала	127
1666	переулок Г.Хасаншиной	127
1667	Гараева	127
1668	Глинки	127
1669	Гульбакча	127
1670	проезд Дорожников	127
1671	Ершова	127
1672	Залесная	127
1673	Зеленая	127
1674	А.Валиева	127
1675	Азатлык	127
1676	Алиша	127
1677	Багаутдинова	127
1678	переулок Баумана	127
1679	Булатова	127
1680	Вахитова	127
1681	Г.Галиева	127
1682	Г.Кашшафа	127
1683	Гагарина	127
1684	Герцена	127
1685	Гоголя	127
1686	Давыдова	127
1687	Достоевского	127
1688	З.Хазипова	127
1689	Западная	127
1690	Зои Космодемьянской	127
1691	И.Никитина	127
1692	Иванова	127
1693	Йолдыз	127
1694	Каенлы	127
1695	Кирова	127
1696	Кол Шариф	127
1697	Кошевого	127
1698	Кырлы	127
1699	Лениногорский тракт	127
1700	Луговая	127
1701	М.Гафури	127
1703	М.Хасанова	127
1704	Матросова	127
1705	Милэш	127
1706	Нахимова	127
1707	Нократ	127
1708	Остров	127
1709	И.Шакирова	127
1710	Иркен	127
1711	К.Насыри	127
1712	Казанская	127
1713	Кирпичная	127
1714	Кооперативная	127
1715	Кояшлы	127
1616	1) Не указано	212
1622	1) Не указано	219
1633	1) Не указано	231
1613	1)не указана	210
1618	1)не указана	215
1716	Латыпова	127
1717	Лесная	127
1718	М.Ахмадеева	127
1719	М.Джалиля	127
1720	Манауз	127
1721	Маяковского	127
1722	Мира	127
1723	Нефтяников	127
1724	Озерная	127
1725	П.Манакова	127
1726	Ибрагимова	127
1727	Ислам	127
1728	К.Тинчурина	127
1729	Кандаурова	127
1730	Кол Гали	127
1731	Котовского	127
1732	Кучкай-Тау	127
1733	1)не указана	233
1734	Ленина	127
1735	Лобачевского	127
1736	М.Валиева	127
1737	М.Султангалиева	127
1738	Марджани	127
1739	Мелиораторов	127
1740	Молодежная	127
1741	Николаева	127
1742	Октябрьская	127
1743	Парковая	127
1744	Пионерская	127
1745	Подстанция 21	127
1746	Пушкина	127
1747	Радужная	127
1748	С.Садыковой	127
1749	Сайдашева	127
1750	Советская	127
1751	Строителей	127
1752	Таллы	127
1753	Тулпар	127
1754	Уютная	127
1755	Ф.Энгельса	127
1756	Центральная	127
1757	Чатыр-Тау	127
1758	Чияле	127
1759	Чэчэкле	127
1760	Школьная	127
1761	Победы	127
1762	Полевая	127
1763	Р.Мухаммадиева	127
1764	Рафаила Софина	127
1765	Сабантуй	127
1766	Сандугач	127
1767	Спортивная	127
1768	Сююмбики	127
1769	Тимирязева	127
1770	Тургай	127
1771	Ф.Галиева	127
1772	Х.Такташа	127
1773	Чалтугай	127
1774	Чернышевского	127
1775	Чулман	127
1776	Шайхутдинова	127
1777	Шоссейная	127
1778	Подгорная	127
1779	Просторная	127
1780	Радищева	127
1781	Родниковая	127
1782	Садовая	127
1783	Светлая	127
1784	Старле-Елга	127
1785	Т.Гиззата	127
1786	Тукая	127
1787	Ушакова	127
1788	Ф.Карима	127
1789	Целинная	127
1790	Чаткы	127
1791	Чишмэбуй	127
1792	Чулпан	127
1793	Шатлык	127
1794	Щорса	127
1795	Энергетиков	127
1796	Юлдаш	127
1797	Ямашева	127
1798	Юбилейная	127
1799	Ютазинский тракт	127
1800	Южная	127
1801	Ялкын	127
1802	Вахитова	220
1803	Молодежная	220
1804	Школьная	220
1805	Колхозная	220
1806	Тукая	220
1807	Ленина	220
1808	Центральная	220
1623	1) Не указано	220
1809	Бутлерова	212
1810	Чернышевского	212
1811	Ленина	212
1812	Урицкого	212
1813	1)не указана	234
1814	40 лет Победы	125
1815	9 Мая	125
1816	Абдуллина	125
1817	Александрова	125
1818	Березинка	125
1819	Булгар	125
1820	Вагизовых	125
1821	Вокзальная	125
1822	Г.Баширова	125
1823	Г.Камала	125
1824	Г.Тукая	125
1825	переулок Дорожный	125
1826	Железнодорожная	125
1827	Западная	125
1828	Ибрагимова	125
1829	Исхакова	125
1830	К.Тинчурина	125
1831	65 лет Победы	125
1832	90 лет ТАССР	125
1833	Агрономическая	125
1834	Астрономическая	125
1835	переулок Березинка	125
1836	переулок Булгар	125
1837	Ватан	125
1838	Восточная	125
1839	Г.Исхаки	125
1840	Г.Салихова	125
1841	Гагарина	125
1842	Дружбы	125
1843	Заводская	125
1844	переулок Западный	125
1845	Интернациональная	125
1846	К.Наджми	125
1847	Казанская	125
1848	70 лет ВЛКСМ	125
1849	А.Алиша	125
1850	Азина	125
1851	Банковская	125
1852	Большая	125
1853	Бурганова	125
1854	Вахитова	125
1855	Г.Ахунова	125
1856	переулок Г.Исхаки	125
1857	Г.Сафиуллина	125
1858	Галактионова	125
1859	Ежкова	125
1860	Зайнуллина	125
1861	Заречная	125
1862	Ипподромная	125
1863	К.Насыри	125
1864	переулок Казанский	125
1865	Каримова	125
1866	Кол Гали	125
1867	Комсомольская	125
1868	Красная Слобода	125
1869	Лесная	125
1870	переулок Лесная 3-й	125
1871	Луговая	125
1872	М.Горького	125
1873	М.Магдиева	125
1874	переулок Майский 2-й	125
1875	Маяковского	125
1876	Мичурина	125
1877	переулок Мостовая 1-й	125
1878	Н.Сафина	125
1879	Нефтебаза	125
1880	Озерная	125
1881	Пионерская	125
1882	Кирпичная	125
1883	Комарова	125
1884	Космонавтов	125
1885	Курсави	125
1887	переулок Лесная 1-й	125
1888	переулок Лесная 4-й	125
1889	М.Галяу	125
1890	М.Джалиля	125
1891	Майская	125
1892	Маршала Жукова	125
1893	Метеорологическая	125
1894	Молодежная	125
1895	переулок Мостовая 2-й	125
1896	Набережная	125
1897	Нижняя	125
1898	Островского	125
1899	Победы	125
1900	Кленовая	125
1901	Коммуны	125
1902	Крайняя	125
1903	Левитана	125
1904	Лесная 2-й	125
1905	переулок Лесная 5-й	125
1906	М.Гафури	125
1907	М.Лотфуллина	125
1908	переулок Майский	125
1909	переулок Маяковского	125
1910	Мира	125
1911	Мостовая	125
1912	переулок Мостовая 3-й	125
1913	Нагорная	125
1914	Новая	125
1915	Первомайская	125
1916	Подгорная	125
1917	Почтовая	125
1918	С.Сайдашева	125
1919	Сибгата Хакима	125
1920	площадь Советская	125
1921	Солнечная	125
1922	Спортивная	125
1923	Сызгановых	125
1924	переулок Татарстан 1-й	125
1925	Трудовая	125
1926	Х.Такташа	125
1927	Ш.Культеси	125
1928	Энергетиков	125
1929	Садовая	125
1930	Сибгатуллина	125
1931	Советская	125
1932	Сосновая	125
1933	переулок Строителей	125
1934	Т.Гиззата	125
1935	переулок Татарстан 2-й	125
1936	Ф.Амирхана	125
1937	Цветочная	125
1938	Шаляпина	125
1939	Южная	125
1940	Родниковая	125
1941	Свердлова	125
1942	Сибирский тракт	125
1943	Соколова	125
1944	Союзная	125
1945	Строителей	125
1946	Татарстан	125
1947	Тополиная	125
1948	Фабричная	125
1949	Чулпан	125
1950	Школьная	125
1951	Ямашева	125
1952	Нагорная	217
1953	Солнечная	217
1886	1) Не указано	235
1954	70 лет Победы	235
1955	Алмазная	235
1956	Боровецкая	235
1957	Веселая	235
1958	Вишневая	235
1959	Г.Тукая	235
1960	Жасминовая	235
1961	Завидная	235
1962	им В.Филинова	235
1963	им М.Тухачевского	235
1964	им С.Буденного	235
1965	Камская аллея	235
1966	Ключевая	235
1967	Кутузова	235
1968	Луговая	235
1969	Надежды	235
1970	Овражная	235
1971	Абдуллы Курбанова	235
1972	Багратиона	235
1973	Васильковая	235
1974	Весенняя	235
1975	Восточная	235
1976	Гаяза Исхаки	235
1977	Животноводов	235
1978	Зарековка	235
1979	им И.Баграмяна	235
1980	им Р.Малиновского	235
1981	Казанская	235
1982	Кедровая	235
1983	Крайняя	235
1984	Лазурная	235
1985	Молодости	235
1986	Нефтяников	235
1987	Орхидейная	235
1988	Академика Королева	235
1989	Березовая	235
1990	Боровецкий лес	117
1991	Вербная	235
1992	Виноградная	235
1993	Г.Богомолова	235
1994	Дачная	235
1995	Жукова	235
1996	им А.Егорова	235
1997	им К.Ворошилова	235
1998	им С.Бирюзова	235
1999	Камская	235
2000	Кирова	235
2001	Кукморская	235
2002	Летняя	235
2003	Мостовая	235
2004	Новошильнинская	235
2005	Отрадная	235
2006	Первый переулок Титова	235
2007	Прибрежная	235
2008	Пушкина	235
2009	Рябиновая	235
2010	Сиреневая	235
2011	Солнечная	235
2012	Суворова	235
2013	1)не указана	236
2014	Торжественная	235
2015	Шоссейная	235
2016	Южная	235
2017	Победы	235
2018	Придорожная	235
2019	Ракитовая	235
2020	Самаркандская	235
2021	Снежная	235
2022	Сосновая	235
2023	Татарстан	235
2024	Цветочная	235
2025	Элитная	235
2026	Полевая	235
2027	Профессора Попова	235
2028	Речная	235
2029	Севастопольская	235
2030	Советская	235
2031	Спартаковская	235
2032	Титова	235
2033	Чулпан	235
2034	Юбилейная	235
2035	1)не указана	237
2036	Болотная	219
2037	Лесная	219
2038	Центральная	219
2039	Буденного	231
2040	Гагарина	231
2041	Калинина	231
2042	Ленина	231
2043	Пушкина	231
2044	Энгельса	231
2045	Ворошилова	231
2046	Горького	231
2047	Карла Маркса	231
2048	Мусы Джалиля	231
2049	Советская	231
2050	Габдуллы Тукая	231
2051	территория им Спартак КП	231
2052	Кирова	231
2053	Октября	231
2054	Татарстана	231
2055	Петрова	119
2056	1)не указана	238
2057	1)не указана	239
2058	1)не указана	240
2059	1)не указана	241
2060	Кухарево	241
2061	1)не указана	242
2062	1)не указана	243
2063	1)не указана	244
2064	1)не указана	245
2065	1)не указана	246
2066	Ахметшина	239
2067	Инеш	239
2068	Молодежная	239
2069	Советская	239
2070	Тукая	239
2071	Школьная	239
2072	Яна авыл	239
2073	Байрак	239
2074	Магариф	239
2075	Московская	239
2076	Солнечная	239
2077	Чкалова	239
2078	Энтузиастов	239
2079	Заречная	239
2080	Малая	239
2081	Парковая	239
2082	Спортивная	239
2083	Шамарова	239
2084	Ямалиева	239
2085	1)не указана	247
2086	Арбузова	244
2087	Дачная	244
2088	Калиновая	244
2089	Кооперативная	244
2090	Магистральная	244
2091	Мира	244
2092	Молодежная 2-я	244
2093	Озерная	244
2094	Полевая	244
2095	Сельхозтехника	244
2096	Совхозная	244
2097	Степная 1-я	244
2098	Татарстан	244
2099	Хайдара Бигичева	244
2100	Ю.Гагарина	244
2101	Б.Красная	244
2102	Зеленая	244
2103	Колхозная	244
2104	Лесная	244
2105	Малиновая	244
2106	Мичурина	244
2107	Нагорная	244
2108	Отрадная	244
2109	Полковая	244
2110	Сиреневая	244
2111	Солнечная	244
2112	Степная 2-я	244
2113	Тополиная	244
2114	Центральная	244
2115	Юбилейная	244
2116	Дальняя	244
2117	Иске-Казанская	244
2118	Комаровка	244
2119	Луговая	244
2120	Мелиораторов	244
2121	Молодежная	244
2122	Овражная	244
2123	П.Содомова	244
2124	Рябиновая	244
2125	Слобода	244
2126	Сосновая	244
2127	Степная 3-я	244
2128	Тукая	244
2129	Энергетиков	244
2130	Ягодная	244
2131	1)не указана	248
2132	30 лет Победы	157
2133	Болгар	157
2134	Вишневая	157
2135	Кул Шарифа	157
2136	Лесной Кордон	157
2137	Нефтяников	157
2138	Промбаза	157
2139	Свободы	157
2140	Строителей	157
2141	Урожайная	157
2142	Аклима Мухаметзянова	157
2143	Верхняя	157
2144	Джалиля	157
2145	Ленина	157
2146	Мира	157
2147	Нижняя	157
2148	Рината Галеева	157
2149	Солнечная	157
2150	Сююмбике	157
2151	Цветочная	157
2152	Молодежная	248
2153	Речная	248
2154	Центральная	248
2155	микрорайон 11-й	210
2156	микрорайон 6-й	210
2157	70 квартал	210
2158	Автозаводская	210
2159	Береговая	210
2160	В.Мишина	210
2161	Вековая	210
2162	Ветеранов	210
2163	Восточный	210
2164	Г/О Автомобилист	210
2165	Г/О Дуслык-2	210
2166	Г/О Колесник-1	210
2167	Г/О Машиностроитель-1	210
2168	Г/О ПУВКХ	210
2169	Г/О Сельхозуправление	210
2170	Г/О Строитель	210
2171	Г/О Турист-2	210
2172	микрорайон 4-й	210
2173	60 лет Победы	210
2174	8 Марта	210
2175	База МСО	210
2176	Березовая	210
2177	Валеева	210
2178	переулок Весенний	210
2179	Вокзальная	210
2180	ВПЧ-58	210
2181	Г/О Автомобилист-2	210
2182	Г/О ЗЖБК	210
2183	Г/О Колесник-2	210
2184	Г/О Машиностроитель-2	210
2185	Г/О Путник	210
2186	Г/О Спутник	210
2187	Г/О Тепловик	210
2188	Г/О Энергетик	210
2189	40 лет Татарстана	210
2190	микрорайон 7-й	210
2191	Автодорожная	210
2192	Баныкина	210
2193	Братская	210
2194	Васильева	210
2195	Весенняя	210
2196	Восточная	210
2197	Г.Тавлина	210
2198	Г/О Дуслык-1	210
2199	Г/О ЗПСК	210
2200	Г/О Колесник-3	210
2201	Г/О Сахарный Завод	210
2202	Г/О Спутник-2	210
2203	Г/О Турист-1	210
2204	Г/О Энергетик-2	210
2205	переулок Гагарина	210
2206	Газовая	210
2207	Герцена	210
2208	Горького	210
2209	Декабристов	210
2210	Дружбы	210
2211	Железнодорожная 2-я	210
2212	Заводская	210
2213	переулок Заречный	210
2214	Интернационалистов	210
2215	Камазовская	210
2216	Комарова	210
2217	Красная Площадь	210
2218	Кул Гали	210
2219	Ленина	210
2220	Лесорубов	210
2221	Луговая	210
2223	Гагарина	210
2224	Гилязова	210
2225	Громова	210
2226	Дивная	210
2227	Ефимова	210
2228	Животноводов	210
2229	Зайная	210
2230	Звездная	210
2231	Казанская	210
2232	Карла Маркса	210
2233	Комсомольская	210
2234	Красноармейская	210
2235	Кухарева	210
2236	Лермонтова	210
2237	Лобачевского	210
2238	М.Джалиля	210
2239	Газинура	210
2240	Гафиатуллина	210
2241	Горбунова	210
2243	Рублевка	249
2244	Понтонный мост	249
2245	Чайка	249
2246	Заводская	246
2247	М.Даутова	250
2248	1)не указана	250
2249	1)не указана	251
2251	121а марш.	249
2250	106д марш.	249
2222	121 марш.	249
2252	1)не указана	252
2253	1)не указана	253
2254	1)не указана	254
2255	Гайдара	210
2256	М.Никифорова	210
2257	Ломоносова	210
2258	Лесная	210
2259	Ларионова	210
2260	Крупской	210
2261	Космонавтов	210
2262	Клубная	210
2263	Калинина	210
2264	Зимина	210
2265	Заречная	210
2266	Жукова	210
2267	Железнодорожная	210
2268	Дорожная	210
2269	Девятаева	210
2270	Макарова	210
2271	Механизаторов	210
2272	переулок Мичурина	210
2273	проспект Московский	210
2274	Мударриса Аглямова	210
2275	Нариманова	210
2276	Нефтебазовская	210
2277	Нижняя	210
2278	переулок Овражный	210
2279	Ольховая	210
2280	Островского	210
2281	Первомайская	210
2282	Пионерская	210
2283	Вахитова просп.	117
2284	проспект Победы	210
2285	Прибрежная	210
2286	Пролетарская	210
2287	Пушкина	210
2288	Маяковского	210
2289	Мира	210
2290	Мичурина	210
2291	Мостовая	210
2292	Набережная	210
2293	Нежная	210
2294	Нефтехимиков	210
2295	Новая	210
2296	Озерная	210
2297	Орджоникидзе	210
2298	Отрадная	210
2299	Перспективная	210
2300	Пирогова	210
2301	Полевая	210
2302	Привокзальная	210
2303	Промышленная	210
2304	Рассветная	210
2305	Медицинская	210
2306	Мирас	210
2307	Молодежная	210
2308	МТСская	210
2309	Надежды	210
2310	Некрасова	210
2311	проспект Нефтяников	210
2312	Объездная	210
2313	Октябрьская	210
2314	Осенняя	210
2315	Партизанская	210
2316	Песочная	210
2317	бульвар Победы	210
2318	Преображенская	210
2319	Пригородная	210
2320	Профсоюзная	210
2321	Рафикова	210
2322	Речная	210
2323	Рухият	210
2324	С/О 35 квартал	210
2325	С/О ДРСУ	210
2326	С/О Корчажки	210
2327	С/О Мичурина	210
2328	С/О Урожай	210
2329	С/О Уют	210
2330	С/О Энергетик-3	210
2331	Садовая	210
2332	Свердлова	210
2333	Свободы	210
2334	Советская	210
2335	Солнечная	210
2336	СПТУ-98	210
2337	Строителей	210
2338	проспект Татарстана	210
2339	Рождественская	210
2340	Рыбная	210
2341	С/О Автомобилист	210
2342	С/О Дружба	210
2343	С/О Локомотив	210
2344	С/О МСО от ПМК-128	210
2345	С/О Успех-1	210
2346	С/О Энергетик	210
2347	С/О Энергия	210
2348	Сайдашева	210
2349	Светлая	210
2350	Сиреневая	210
2351	Современников	210
2352	Сосновая	210
2353	Степная	210
2354	Т.Ялчыгола	210
2355	Титова	210
2356	переулок Романтиков	210
2357	Рябиновая	210
2358	С/О Гудок	210
2359	С/О Зеленая Долина	210
2360	С/О Мирный	210
2361	С/О Радуга	210
2362	С/О Успех-2	210
2363	С/О Энергетик-2	210
2364	С/О Ягодка	210
2365	Сары Садыковой	210
2366	переулок Свободы	210
2367	Снежная	210
2368	Совхозная	210
2369	Спортивная	210
2370	переулок Строителей	210
2371	Татарстан	210
2372	аллея Тихая	210
2373	Толстого	210
2374	Тружеников	210
2375	Узловая	210
2376	Уральская	210
2377	Фрунзе	210
2378	переулок Цветочный 2-й	210
2379	Чернова	210
2380	Чкалова	210
2381	Шоссейная	210
2382	Юбилейная	210
2383	Юности	210
2384	Тополиная	210
2385	Тукая	210
2386	Ульянова	210
2387	Ф.Симашева	210
2388	Цветочная	210
2389	Центральная	210
2390	Черновых	210
2391	Чулпан	210
2392	Энергетиков	210
2393	Южная	210
2394	Трудовая	210
2395	Ударная	210
2396	Универсиадная	210
2397	Фермерская	210
2398	переулок Цветочный 1-й	210
2399	Чапаева	210
2400	Чехова	210
2401	Школьная	210
2402	Энтузиастов	210
2403	переулок Южный	210
2404	Первого Мая	254
2405	Нагорная	254
2406	Школьная	254
2407	Болодурина	254
2408	Победы	254
2409	Зеленая	254
2410	Советская	254
2411	Центральная	253
2412	А.Зайнетдинова	128
2413	Азнакаевский тракт	128
2414	Бугульминский тракт	128
2415	Девонская	128
2416	Ипподромная	128
2417	Комарова	128
2418	Ленинградская	128
2419	Луговая	128
2420	Молодежная	128
2421	Некрасова	128
2422	переулок Некрасова 3-й	128
2423	П.Манакова	128
2424	Пушкина	128
2425	Сайдашева	128
2426	Строительная	128
2427	Тукая	128
2428	Х.Такташа	128
2429	ГСК Автолюбитель	128
2430	Актюбинская	128
2431	Булгар	128
2432	ГСК За рулем	128
2433	Ишкаевский тракт	128
2434	Комсомольская	128
2435	Лениногорский тракт	128
2436	М.Джалиля	128
2437	Нагорная	128
2438	переулок Некрасова 1-й	128
2439	Нефтяников	128
2440	ГСК Подстанция	128
2441	Радужная	128
2442	Светлая	128
2443	Сююмбике	128
2444	Тургай	128
2445	Цветочная	128
2446	ГСК Автомобилист	128
2447	Альметьевский тракт	128
2448	Зеленая	128
2449	Каенлы	128
2450	Ленина	128
2451	Лесная	128
2452	Мирная	128
2453	Надежды	128
2454	переулок Некрасова 2-й	128
2455	Овражная	128
2456	Подстанция	128
2457	Садовая	128
2458	Солнечная	128
2459	Татарстана	128
2460	Ф.Булатова	128
2461	Чулпан	128
2462	Шатлык	128
2463	Школьная	128
2464	Энтузиастов	128
2465	Алтайская	158
2468	Болотная	158
2469	Ботаническая	158
2470	Ватутина	158
2471	сад Ветерок	158
2472	Волгоградская	158
2473	ГСК Волна	158
2474	ГСК Восход	158
2475	Гайдара	158
2476	сад Гари-2	158
2477	Гаринская	158
2478	Герцена	158
2479	ГСК Горпищекомбинат	158
2480	Дальняя	158
2481	Дачная	158
2482	ГСК Детский мир	158
2483	сад Дружба	158
2484	Железнодорожная 1-я	158
2486	сад Здоровье-2	158
2487	ГСК Идель	158
2488	сад им Мичурина	158
2489	Казанская	158
2490	Камиля Якуба	158
2491	Кирпичная	158
2492	Комарова	158
2493	Кордон квартал 104	158
2494	Космонавтов	158
2495	Декабристов	158
2496	Джалиля	158
2497	Дружбы	158
2498	Железнодорожная 2-я	158
2499	Зеленая	158
2500	сад им Гоголя	158
2501	ГСК Искра	158
2502	Калинина	158
2503	Карла Маркса	158
2504	переулок Клубная	158
2505	Комсомольская	158
2506	Королева	158
2507	Красная	158
2508	Демократическая	158
2509	Дзержинского	158
2510	Екатерины Ошариной	158
2511	Железнодорожная 3-я	158
2512	сад ЗФЗ	158
2513	сад им Гоголя-2	158
2514	Йошкар-Олинская	158
2515	Калиновая	158
2516	Катина	158
2517	Кольцевая	158
2518	Кооперативная	158
2519	Космодемьянской	158
2520	сад Красная горка	158
2521	сад Красная горка-1	158
2522	сад Красная горка-12	158
2523	сад Красная горка-2	158
2524	сад Красная горка-5	158
2525	сад Красная горка-8	158
2526	переулок Красный	158
2527	Кузнечная	158
2528	Ленина	158
2529	Липовая	158
2530	ГСК Локомотив	158
2531	Майская	158
1343	Железнодорожная 3-я	158
2532	Матросова	158
2533	Маяковского	158
2534	ГСК Милиция	158
2535	Мичурина	158
2536	Московская	158
2537	сад На улице Йошкар-Олинская	158
2538	сад Красная горка-10	158
2539	сад Красная горка-13	158
2540	сад Красная горка-3	158
2541	сад Красная горка-6	158
2542	сад Красная горка-9	158
2543	Кронштадтская	158
2544	Куйбышева	158
2545	Лермонтова	158
2546	ГСК Липовый овраг	158
2547	Ломоносова	158
2548	Малая Красная	158
2549	Машиностроителей	158
2550	сад Мебельщик	158
2551	Мира	158
2552	Молодежная	158
2553	ГСК Московская	158
2554	Набережная	158
2555	сад Красная горка-11	158
2556	сад Красная горка-14	158
2557	сад Красная горка-4	158
2558	сад Красная горка-7	158
2559	Краснофлотская	158
2560	Крылова	158
2561	Лебедева-Кумача	158
2562	Лесная	158
2563	Лиственная	158
2564	Луговая	158
2565	переулок Малый	158
2566	сад Маяк	158
2567	Металлистов	158
2568	ГСК Мирный	158
2569	Морская	158
2570	ГСК Музыкальная школа	158
2571	Набережная 1-я	158
2572	Набережная 2-я	158
2573	Нариманова	158
2574	Некрасова	158
2575	Новостроительная	158
2576	Озерная	158
2577	Осенняя	158
2578	Открытая	158
2579	сад Пасека-2	158
2580	Песочная	158
2581	Петербургская	158
2582	Победы	158
2583	ГСК Подстанция	158
2584	Почтовая	158
2585	Пролетарская	158
2586	Революции	158
2587	Рогачева	158
2588	Садовая	158
2589	Нагорная	158
2590	Насыри	158
2591	Новая	158
2592	Норкина	158
2593	Октябрьская	158
2594	Осипенко	158
2595	Отрадная	158
2596	Пасечная	158
2597	Песчаная	158
2598	Пионерская	158
2599	Подгорная	158
2600	Полевая	158
2601	Праздничная	158
2602	Просторная	158
2603	Репина	158
2604	переулок Рыбацкий	158
2605	сад Сады Милиции	158
2606	Надежды	158
2607	Наумова	158
2608	Новоподгорная	158
2609	Овражная	158
2610	Олимпийская	158
2611	Островского	158
2612	Паратская	158
2613	Первомайская	158
2614	ГСК Песчаный карьер	158
2615	Пляжная	158
2616	Подстанция	158
2617	сад Пост-Волга	158
2618	Привокзальная	158
2619	Пушкина	158
2620	ГСК Ритм	158
2621	Рябиновая	158
2622	Сайдашева	158
2623	ГСК Сатурн	158
2624	Свободная	158
2625	сад Северный	158
2626	Серафимовича	158
2627	Солнечная	158
2628	Сосновая	158
2629	Стадионная	158
2630	Степная	158
2631	проспект Строителей	158
2632	переулок Строительный 2-й	158
2633	переулок Строительный 5-й	158
2634	Тверская	158
2635	Толстого	158
2636	Тукая	158
2637	Тургенева	158
2638	Ульянова	158
2639	ГСК Уют	158
2640	Сахарова	158
2641	сад Связь	158
2642	ГСК Северный	158
2643	Серова	158
2644	сад Солнечный	158
2645	Союзная	158
2646	Станиславского	158
2647	Столичная	158
2648	Строительная	158
2649	переулок Строительный 3-й	158
2650	Судостроителей	158
2651	Тимирязева	158
2652	Торфяная	158
2653	Туктарова	158
2654	ГСК Тургенева-Украинская	158
2655	Универсиады	158
2656	Фабричная	158
2657	Свердлова	158
2658	Северная	158
2659	Семейная	158
2660	Советская	158
2661	сад Солнышко	158
2662	Спортивная	158
2663	Стахановская	158
2664	сад Столичная горка	158
2665	переулок Строительный 1-й	158
2666	переулок Строительный 4-й	158
2667	Татарстан	158
2668	Тихая	158
2669	сад Трудовик	158
2670	Тупиковая	158
2671	Украинская	158
2672	сад Учитель	158
2673	Фестивальная	158
2674	Фрунзе	158
2675	Хади Такташа	158
2676	Цветочная	158
2677	Чайковского	158
2678	Чернышевского	158
2679	ГСК Шанс	158
2680	Шатлык	158
2681	Школьная	158
2682	Энергетическая	158
2683	Южная	158
2684	Ягодная	158
2685	Фурманова	158
2686	Хазиева В.	158
2687	Центральная	158
2688	Чапаева	158
2689	Чехова	158
2690	Шариф Камала	158
2691	Шевченко	158
2692	Шустова	158
2693	ГСК Эра	158
2694	Юннатская	158
2695	Якты	158
2696	Футбольная	158
2697	Хасанова	158
2698	Чайкиной	158
2699	Черемуховая	158
2700	Чкалова	158
2701	Шарифа Камала	158
2702	Широкая	158
2703	Энгельса	158
2704	Юбилейная	158
2705	Юности	158
2706	Ясеневая	158
2707	Березовая	242
2708	Зеленая	242
2709	Лесная	242
2710	Молодежный	242
2711	Новозаводской	242
2712	Солнечная	242
2713	переулок Школьный	242
2714	Ветеранов	242
2715	Курортная	242
2716	Луговая	242
2717	Набережная	242
2718	Полевая	242
2719	Татарская	242
2720	Юбилейная	242
2721	переулок Ветеранов	242
2722	переулок Курортный	242
2723	Молодежная	242
2724	Новозаводская	242
2725	Советская	242
2726	переулок Цветочный	242
2727	Березовая Роща	225
2728	Заводская	225
2729	Комсомольская	225
2730	Москвина	225
2731	Посадская	225
2732	Сосновая	225
2733	Ветеранов	225
2734	Залесная	225
2735	Лесная	225
2736	Набережная	225
2737	Селенгурская	225
2738	Центральная	225
2739	Железнодорожная	225
2740	Заречная	225
2741	Молодежная	225
2742	Пихтовая	225
2743	Солнечная	225
2744	Черная Речка	225
2745	Железнодорожная	221
2746	Центральная	221
2747	Центральная	222
2748	Костенеевская	223
2749	Речная	223
2750	Школьная	223
2751	Набережная	223
2752	Свиногорская	223
2753	Нефтяников	223
2754	Центральная	223
2755	Дорожная	228
2756	Нагорная	228
2757	территория Сады Авиатор	228
2758	территория Сады Нива	228
2759	Чкалова	228
2760	Зеленая	228
2761	Подлужная	228
2762	территория Сады Меша-2	228
2763	территория Сады Ручеек	228
2764	Молодежная	228
2765	Профсоюзная	228
2766	территория Сады Меша-3	228
2767	Советская	228
2768	Дачная	215
2769	Набережная	215
2770	Центральная	215
2771	Заводская	215
2772	Нагорная	215
2773	Заовражная	215
2774	Пролетарская	215
2775	Горная	216
2776	Казанская	216
2777	Молодежная 1-я	216
2778	Сельхозтехника	216
2779	Зеленая	216
2780	Красноармейская	216
2781	Молодежная 2-я	216
2782	Центральная	216
2783	Кавказская	216
2784	Лесничество	216
2785	Московская	216
2786	Габдуллы Тукая	227
2787	Кутузова	227
2788	Мусы Джалиля	227
2789	Галиаскара Камала	227
2790	Мира	227
2791	Хади Такташа	227
2792	Карла Маркса	227
2793	Молодежная	227
2794	Центральная	227
2795	2-я Набережная	232
2796	Буреева	232
2797	Горького	232
2798	Дружбы	232
2799	Заозерная	232
2800	им героя Ф.П.Савельева	232
2801	Ленина	232
2802	Майская	232
2803	Набережная	232
2804	Объездная	232
2805	Парковая	232
2806	Попова	232
2807	Рябиновая	232
2808	Солнечная	232
2809	Техническая	232
2810	Чекина	232
2811	Школьная	232
2812	Автомобильная	232
2813	Г.Тукая	232
2814	Гряда	232
2815	Заводская	232
2816	Заречная	232
2817	Кирпичная	232
2818	Лесная	232
2819	Мира	232
2820	Надежды	232
2821	Октябрьская	232
2822	Подгорная	232
2823	Придорожная	232
2824	Садовая	232
2825	Строителей	232
2826	Тихонова	232
2827	Чернышевского	232
2828	Шмидта	232
2829	Буйнякова	232
2830	Гагарина	232
2831	Д.Бедного	232
2832	Заливная	232
2833	Зеленая	232
2834	Колхозная	232
2835	Луговая	232
2836	Молодежная	232
2837	Новоселов	232
2838	Отрадная	232
2839	Полевая	232
2840	Пролетарская	232
2841	Советская	232
2842	Татарстан	232
2843	Тополиная	232
2844	Чистопольская	232
2845	Юности	232
2846	Березовая	226
2847	Зеленая	226
2848	Магистральная	226
2849	Берсутская	226
2850	Лесная	226
2851	Садовая	226
2852	Залесная	226
2853	Луговая	226
2854	А.Ишмуратова	250
2855	Ф.Карими	250
2856	Гимаева	250
2857	Молодежная	250
2858	Ш.Бикчурина	250
2859	Дорожная	250
2860	Речная	250
2861	60 лет Октября	233
2862	переулок А.Алиша	233
2863	А.Сергеева	233
2864	Б.Шавалиева	233
2865	Братьев Бакировых	233
2866	В.Маяковского	233
2867	Восточная	233
2868	Г.Тукая	233
2869	З.Шаймарданова	233
2870	Зеленая	233
2871	К.Сибгатуллина	233
2872	Космонавтов	233
2873	Луговая	233
2874	М.Горького	233
2875	М.Укмаси	233
2876	Малая Районная	233
2877	Мира	233
2878	65 лет Победы	233
2879	А.Алиша	233
2880	А.Степанова	233
2881	Банковская	233
2882	В.Иванова	233
2883	В.Терешковой	233
2884	Г.Бухарина	233
2885	Г.Хроленко	233
2886	переулок З.Шаймарданова	233
2887	И.Петухова	233
2888	Карьерная	233
2889	Ленина	233
2890	М.Вахитова	233
2891	М.Джалиля	233
2892	Малая Карьерная	233
2893	Малая Садовая	233
2894	Молодежная	233
2895	8 Марта	233
2896	А.Меркушева	233
2897	А.Яковлева	233
2898	переулок Больничный	233
2899	В.Корнеева	233
2900	В.Читрова	233
2901	Г.Васильевой	233
2902	Дружбы	233
2903	Заводская	233
2904	К.Русакова	233
2905	Комсомольская	233
2906	Лесная	233
2907	М.Гиззатуллина	233
2908	М.Рыжова	233
2909	Малая Октябрьская	233
2910	Малая Северная	233
2911	Н.Крупской	233
2912	Н.Некрасова	233
2913	Нагорная	233
2914	Октябрьская	233
2915	Полевая	233
2916	Пролетарская	233
2917	Р.Файзуллина	233
2918	С.Давыдова	233
2919	С.Шакурова	233
2920	Северная	233
2921	Солнечная	233
2922	Строителей	233
2923	переулок Султангалиева	233
2924	Т.Корчебокова	233
2925	У.Валеева	233
2926	Химиков	233
2927	Ю.Гагарина	233
2928	Н.Островского	233
2929	Новая	233
2930	П.Кузьмина	233
2931	Почтовая	233
2932	Р.Ахметзянова	233
2933	Р.Шарафиева	233
2934	С.Сайдашева	233
2935	переулок Садовый	233
2936	Слободская	233
2937	Сосновая	233
2938	переулок Строителей 2-й	233
2939	переулок Султангалиева 3-й	233
2940	Татарстан	233
2941	Ф.Ахмадиева	233
2942	переулок Школьный	233
2943	Юбилейная	233
2944	Набережная	233
2945	Озерная	233
2946	Победы	233
2947	Причал	233
2948	Р.Рашитова	233
2949	С.Александрова	233
2950	С.Хамадиярова	233
2951	Светлая	233
2952	Советская	233
2953	переулок Строителей	233
2954	Султангалиева	233
2955	Сююмбике	233
2956	Труда	233
2957	Х.Такташа	233
2958	Энергетиков	233
2959	1)не указана	255
2960	Ахметова	256
2961	1)не указана	257
2962	1)не указана	258
2963	1)не указана	259
2964	Научный городок	118
2965	Чайка	260
2966	Борок	260
2967	Якты	134
2968	Садовая	134
2969	1)не указана	262
2970	CHT Кама	249
2971	СНТ Химик	249
2242	0)не указана	249
2972	CT Строитель	249
2973	Красноармейская	117
2974	Шишкин Хутор	249
2975	1)не указана	263
2976	Космонавтов	118
2977	Большая	264
2978	Комсомольская	264
2979	Мирная	264
2980	Пионерская	264
2981	Гагарина	264
2982	Короленко	264
2983	Мичурина	264
2984	Фрунзе	264
2985	Комарова	264
2986	Космонавтов	264
2987	Островского	264
2988	Чехова	264
2989	1)не указана	264
2990	1)не указана	265
2991	К.Маркса	265
2992	1)не указана	266
2993	ААКХ Державино	266
2994	Заббарова	266
2995	Лесная	266
2996	Подлесная	266
2997	Агайбашская	266
2998	Казанская	266
2999	Молодежная	266
3000	Слободская	266
3001	Вафина	266
3002	Лагерная	266
3003	Новая	266
3004	Школьная	266
3005	1)не указана	267
3006	1)не указана	268
3007	1)не указана	269
3008	1)не указана	270
3009	1)не указана	271
3010	1)не указана	272
3011	1)не указана	273
3012	1)не указана	274
3013	1)не указана	275
3014	1)не указана	276
3015	1)не указана	277
3016	1)не указана	278
3017	1)не указана	279
3018	Вахитова	238
3019	Г.Тукая	238
3020	22 Партсъезда	155
3021	Б.Габдрахманова	155
3022	Г.Тукая	155
3023	Газовая	155
3024	Дорожная	155
3025	Карла Маркса	155
3026	М.Джалиля	155
3027	Макаринская	155
3028	Молодежная	155
3029	Овражная	155
3030	Первомайская	155
3031	Рябиновая	155
3032	Связистов	155
3033	Татарстан	155
3034	Х.Такташа	155
3035	Энергетиков	155
3036	50 лет Победы	155
3037	Береговая	155
3038	Гагарина	155
3039	Гаяз Исхаки	155
3040	Заречная	155
3041	Курасанова	155
3042	М.Кабирова	155
3043	Мелиораторов	155
3044	Нагорная	155
3045	Озерная	155
3046	Полевая	155
3047	Садовая	155
3048	Северная	155
3049	Солнечная	155
3050	Техническая	155
3051	Шешминская	155
3052	Юбилейная	155
3053	70 лет Октября	155
3054	Больничный городок	155
3055	Газизуллина	155
3056	Дзержинского	155
3057	Канашская	155
3058	Ларионова	155
3059	М.Титова	155
3060	Мира	155
3061	Нефтяников	155
3062	Октябрьская	155
3063	Полевая (Кир.завод)	155
3064	Сайдашева	155
3065	Силантьева	155
3066	Строителей	155
3067	Утыз Имяни	155
3068	Школьная	155
3069	Южная	155
3070	переулок Ярмарочный	155
3071	Яурочная	155
3072	Заречная	247
3073	Мельничная	247
3074	Полевая	247
3075	Соборная площадь	247
3076	Центральная	247
3077	Зеленая	247
3078	Мира	247
3079	Придорожная	247
3080	Сююмбике	247
3081	Лесная	247
3082	Набережная	247
3083	Профсоюзная	247
3084	Тукая	247
3085	Заводская	230
3086	Молодежная	230
3087	Пролетарская	230
3088	Спортивная	230
3089	Заречная	230
3090	Подгорная	230
3091	Садовая	230
3092	Хамзина	230
3093	Кооперативная	230
3094	Подлесная	230
3095	Союзная	230
3096	Мусы Джалиля	262
3097	Ветеранов	240
3098	Ерыклинская	240
3099	И.Ш.Шакурова	240
3100	Кольцевая	240
3101	Мира	240
3102	Народная	240
3103	Полевая	240
3104	Солнечная	240
3105	Челнинская	240
3106	Восточная	240
3107	Западная	240
3108	Йолдыз	240
3109	Лесная	240
3110	Молодежная	240
3111	Парковая	240
3112	Садовая	240
3113	Цветочная	240
3114	Дуслык	240
3115	Зеленая долина	240
3116	Каткова Я.П.	240
3117	Луговая	240
3118	Надежды	240
3119	переулок Парковый	240
3120	Солидарная	240
3121	Центральная	240
3122	1)не указана	280
\.


--
-- Name: street_id_street_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('street_id_street_seq', 3122, true);


--
-- Data for Name: temporarily_users; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY temporarily_users (email, passw, now_date, url_hash) FROM stdin;
mail@nkagent.ru	a54588983f579439706357c056b68e1bec9cc269	1518076416101	0a6af7acaf349d7e81aa85bb89326d7ad65f1416
\.


--
-- Data for Name: temporarily_users_userdata; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY temporarily_users_userdata (email, now_date, url_hash, id_user, fio, tel, agency, note) FROM stdin;
14abcd17@mail.ru	1513339996024	9d007d528e4b209c90322f027fa19ebed06ab765	1	Ильдар Хизабутдинов	+79172321165	\N	\N
\.


--
-- Data for Name: toilet; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY toilet (id_toilet, title, priority) FROM stdin;
2	Общий	90
1	Нет санузла	100
3	Совмещенный	80
4	Раздельный	70
8	2 санузла	60
10	1 санузел на 2х	85
9	3 санузла	50
11	1 санузел на 4х	83
12	1 санузел на 3х	84
\.


--
-- Name: toilet_id_toilet_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('toilet_id_toilet_seq', 12, true);


--
-- Data for Name: userdata; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY userdata (id_userdata, fio, tel, agency, user_id, note, moderator, code_price, date_start, date_entry, date_final, date_payment_price, code_price_cottages, code_price_commercial) FROM stdin;
460	\N	\N	\N	578	\N	\N	111111111111111	\N	\N	\N	\N	11111111111	11111111
141	Каримова Наталья Архиповна  ГР	+79196937203	5	265	Шинников 11	5	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
168	Хамидуллина Алина Зуфаровна ГР	+79172473167	5	292	Шинников 11\r\nтел.+78989331750	\N	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
153	Бикмухаметова Эльмира Тагировна	+79196814246	5	277	Шинников 11	\N	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
172	Тимофеев Алексей Григорьевич	+79196337329	7	296	ХИМИКОВ 25	\N	111111111111111	1518048000000	1517838470502	1519862400000	\N	1111111111111	11111111
143	Тагирова Руфина Абраровна	+79178659025	7	267	химиков 25	\N	111111111111111	1518048000000	1517734785173	1519862400000	\N	1111111111111	11111111
296	Авдошина Любовь Александровна	+79172783665	7	420	\N	\N	111111111111111	1518048000000	1517734785173	1519862400000	\N	1111111111111	11111111
253	Яковлева Екатерина Александровна	+79172810530	17	377	30 ЛЕТ ПОБЕДЫ 1 тел.8903-319-41-14	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
166	Матвеева Елена Николаевна  ГР	+79196256033	\N	290	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
324	Хайрутдинова Алсу Газимовна	+79196307287	25	448	89083329922	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
205	Фахриев Рауль Фарваззович	+79872735043	75	329	КАМ.ПОЛЯНЫ	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
422	Ахметшин Азат Наилевич	+79872068980	\N	543	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
418	Салимгареева Эльмира Идрисовна	+79172351466	\N	539	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
421	Трофимова Любовь Васильевна	+79178720996	\N	542	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
428	Галкина Светлана Александровна	+79172276379	\N	549	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
433	Кормачева Эльмира Рашитовна	+79172878980	\N	554	89179266888	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
434	Калинина Ольга Николаевна	+79196308556	\N	555	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
440	Тагирова Эльвира Ахатовна	+79178634349	\N	561	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
425	Тихонова Ангелина Панфиловна	+79196824532	\N	546	89656266384	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
284	Фатихова Гульчачак Шарифулловна	+79172526131	42	408	ТУКАЯ 1	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
449	Бакиев Рамиль	+79179310190	192	569	48-90-22	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
281	Калимуллина Милауша Зуфаровна	+79178963875	11	405	МИРА 58 \r\nтел.89179059477	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
214	Кордюкова Ольга Николаевна	+79172969947	27	338	ХИМИКОВ 114	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
199	Рожин Дмитрий Викторович	+79872243971	\N	323	8939-744-48-62	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
238	Мингалиев Ильдар Мавлетович	+79172655565	52	362	СТРОИТЕЛЕЙ 20	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
223	Тазмиевна Гульфия Валивна	+79172300671	23	347	ТУКАЯ 32   \r\n тел.8917-283-25-57	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
291	Чигвинцева Надежда Леонидовна	+79178585563	54	415	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
272	Ахметзянова Валентина Петровна	+79178586712	10	396	СТУДЕНЧЕСКАЯ 10 тел.89625748547	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
275	Курашова Юлия Борисовна	+79270344621	10	399	СТУДЕНЧЕСКАЯ 10	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
279	Федорова Анастасия Васильевна	+79178880313	11	403	МИРА 58	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
229	Ямалеева Ольга Николаевна	+79172765132	42	353	ТУКАЯ  1\r\n  тел.8927-476-65-81	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
160	Шурпаева Алина Андреевна	+79872324217	39	284	СТРОИТЕЛЕЙ 18	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
159	Абдуллина Гульназ Габделнуровна	+79196405854	24	283	ХИМИКОВ 52	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
196	Анкудимова Марина Витальевна	+79872600838	5	320	Шинников 11	\N	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
289	Саргина Валентина Ивановна	+79172295338	25	413	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
458	\N	\N	\N	576	\N	\N	111111111111111	1518048000000	1518076128505	1519862400000	\N	11111111111	11111111
276	Зиятдинова Алсу Рамильевна	+79178514518	10	400	СТУДЕНЧЕСКАЯ 10	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
235	Галеев Альберт Флоридович	+79179061111	52	359	СТРОИТЕЛЕЙ 20      89179181111   Expert.tat@mail.ru8	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
193	Нурматова Рамиля Шамильевна	+79174164535	32	317	МИРА 58	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
441	Муртазина Алсу Равилевна	+79172206633	\N	562	\N	\N	111111111111111	1518048000000	1517476432447	1519862400000	\N	1111111111111	11111111
224	Сагитова Рабига Равильевна	+79872912551	23	348	ТУКАЯ 32    тел.8927-247-68-91	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
139	Сиянко Альбина Альберотовна	+79178741850	24	263	ХИМИКОВ 52	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
190	Гетман  Мария Анатольевна	+79172661640	32	314	МИРА 58 тел.89274693311	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
163	Хуснутдинова Ирина Геннадьевна	+79872727903	5	287	Шинников 11	\N	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
453	Айгуль	+79600600096	10	573	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
184	Харитонова Екатерина Филлипоновна	+79874036980	32	308	МИРА 58	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
183	Игошев Денис Сергеевич	+79179221717	53	307	ЮНОСТИ 1   тел.89673651513	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
162	Иванова Ольга Васильевна	+79178682230	35	286	ХИМИКОВ 57\r\nТ- 89176471018	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
217	Исмагилова Гульназ Рафисовна	+79178724911	\N	341	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
174	Петрухина Лилия Кафилевна	+79196310966	\N	298	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
209	Камалова Эльвира Марселовна	+79272476707	45	333	30 ЛЕТ ПОБЕДЫ 1  тел.89179277797	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
208	Елистратов Эдуард Юрьевич	+79196337388	51	332	8919-6337388, 48-77-33, 8917-285-10-75	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
147	Кузьмин Сергей Михайлович	+79172678728	50	271	30 ЛЕТ ПОБЕДЫ 1	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
241	Баринова Оксана Викторовна	+79871802026	49	365	ШИННИКОВ 1А	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
247	Патысева Эльвира Николаевна	+79172296947	49	371	ШИННИКОВ 1А  тел.8927-675-96-37	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
250	Фахертдинова Альфия Саляхутдиновна	+79179185605	49	374	ШИННИКОВ 1А  тел.8987-188-18-61	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
150	Ксенафонтова Галина Сергеевна	+79178664818	35	274	ХИМИКОВ 57	\N	000111101111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
177	Царева Оксана Анатольевна	+79178581920	117	301	Н.Челны 32/01\r\nТ- 89173992656	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
450	Снопкова Екатерина	+79172328231	\N	570	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
274	Абдуллина Ляйсан Мубаракзяновна	+79179279740	10	398	СТУДЕНЧЕСКАЯ 10	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
206	Шляхтин Иван Михайлович	+79172586395	75	330	КАМ.ПОЛЯНЫ	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
191	Лысенкова Ирина Александровна	+79178716183	32	315	МИРА 58	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
221	Кирюшенкова Людмила Алексеевна	+79172547427	34	345	СТРОИТЕЛЕЙ 23	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
148	Гайнутдинова Эльмира Ринатовна	+79179016996	8	272	Шинников 11	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
157	Борецкая Аделя Рафаэловна	+79172914510	8	281	Шинников 11	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
263	Афанасьева Татьяна Назимовна	+79172560979	6	387	ХИМИКОВ 25	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
233	Ягудин Рустем Кафилович	+79178848484	36	357	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
239	Джавадов Динар Джаббарович	+79600642033	52	363	СТРОИТЕЛЕЙ 20СТРОИТЕЛЕЙ 20\r\n89178582035	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
266	Родионова Елена Вячеславовна	+79172643307	20	390	СТРОИТЕЛЕЙ 48, тел.8927-486-87-18	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
169	Тимергазина Алсу Ирековна	+79172397075	24	293	ХИМИКОВ 52	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
226	Хакимова Ландыш Рафаиловна	+79872318006	42	350	8905-374-26-18	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
218	Хабибуллин Ришат Минневалиевич	+79172514788	22	342	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
192	Никешина Людмила Владимировна	+79178585560	32	316	МИРА 58  тел.89375995560	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
188	Садыкова Лилия Рустеменовна	+79179379678	32	312	МИРА 58	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
212	Хасанова Оксана Николаевна	+79872647600	33	336	ХИМИКОВ 114	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
236	Бояршин Ярослав Владимирович	+79172591111	52	360	СТРОИТЕЛЕЙ 20  тел.89179083883	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
231	Шайдуллина Эльвира Флюровна	+79196255323	31	355	тел.8904-769-33-32	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
171	Самигуллин Рамис Радисович	+79063333323	35	295	ХИМИКОВ 57\r\nТ- 89063333323	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
244	Латыпова Фарида Фатхрахмановна	+79600433635	49	368	ШИННИКОВ 1А  тел.89178600730	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
219	Яковлева Юлия Алексеевна	+79870675757	34	343	СТРОИТЕЛЕЙ 23 тел.8917-260-57-82	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
144	Ахметова Ольга Михайловна	+79178751374	5	268	Шинников 11	\N	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
178	Максимов Дмитрий Иванович	+79172419926	\N	302	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
152	Гарайшина Гулуса Мирхатимовна	+79874218689	35	276	ХИМИКОВ 57    Т. 89274667551,89061236280	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
257	Галимзянова Рамзия Габдулхаковна	+79656140411	\N	381	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
423	Щейкина Наталья Евгеньевна	+79172223828	10	544	89178651147	\N	111111111111111	1518048000000	1516799577738	1519862400000	\N	1111111111111	11111111
200	Газизянов Марсель Нургалеевич	+79172734178	53	324	ЮНОСТИ 1	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
175	Лазарев Олег Олегович	+79178542222	50	299	30 ЛЕТ ПОБЕДЫ 1 Т.89178800909	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
242	Кочергина Нина Ивановна	+79172621864	49	366	ШИННИКОВ 1А	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
285	Антонова Светлана Юрьевна	+79173990055	42	409	ТУКАЯ 1	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
248	Саламахина Диана Владимировна	+79178671292	49	372	ШИННИКОВ 1А	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
251	Тагирова Гузель Габдулхаковна	+79274528432	49	375	ШИННИКОВ 1АШИННИКОВ 1А	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
245	Мухутдинова Лилия Раушановна	+79370045858	49	369	ШИННИКОВ 1А тел. +79272476960	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
451	Шавалиева Марианна	+79172510530	\N	571	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
185	Склямина Светлана Борисовна	+79178652804	\N	309	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
287	Климина Алла Генадьевна	+79172980370	30	411	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
215	Смирнова Резеда Ахтямовна	+79196884909	46	339	ХИМИКОВ 114  тел.8919-688-49-09ХИМИКОВ 114  тел.8919-688-49-09  ХИМИКОВ 114  тел.8919-688-49-09ХИМИКОВ 114  тел.8919-688-49-09	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
282	Максимова Гузель Мансуровна	+79172313213	53	406	ЮНОСТИ 1	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
339	Идрисова Гульнара Вазыховна	+79173943663	13	462	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
140	Комина Ольга Александровна	+79872736658	35	264	ХИМИКОВ 57   Т- 89872889408	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
261	Царева Людмила Николаевна	+79179205963	17	385	30 ЛЕТ ПОБЕДЫ 1	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
204	Кольцова Евгения Валерьевна	+79172299978	19	328	ТУКАЯ 1	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
222	Сабанаева Анжела Олеговна	+79172710422	23	346	ТУКАЯ 32	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
348	Ульчинский Валерий Витальевич	+79179295042	30	471	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
164	Хисматова Римма Зуфаровна	+79872650365	35	288	ХИМИКОВ 57	\N	010111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
280	Зайнуллина Гузель Раисовна	+79172762153	11	404	МИРА 58	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
207	Гинатуллин Рафаэль Харисович	+79172828692	\N	331	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
290	Литвинова Елена Владимировна	+79178585562	54	414	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
1	Ильдар Хизабутдинов	+79172321165	\N	1	\N	\N	010111111111111	1518048000000	\N	1519862400000	\N	0111110111111	11111111
271	Муллагалиева Анастасия Юрьевна	+79178500182	54	395	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
459	Айсылу	+79172399822	11	577	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	11111111111	11111111
234	Шарафутдинов Ильфат Камилевич	+79172819080	36	358	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
349	Бакулина Эльвира Ринатовна	+79196339070	16	472	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
354	Васильева Лилия Мирзануровна	+79872219206	16	477	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
316	Шамсегалеева Алсу	+79874005848	26	440	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
317	Иванова Ирина Николаевна	+79172370609	25	441	89534948242 484281	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
179	Семашкин Андрей Викторович	+79196447959	25	303	Т.89270302287, 245378	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
186	Минахматова Любовь Борисовна	+79872273033	\N	310	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
146	Халитов Алик Фаимович	+79872670077	35	270	ХИМИКОВ 57	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
288	Зайцева Галия Борисовна	+79172488398	\N	412	+79172872888	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
252	Платонова Надежда Александровна	+79172623808	\N	376	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
258	Маламанова Наталья Александровна	+79196421948	\N	382	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
237	Бояршин Алексей Владимирович	+79172301717	52	361	СТРОИТЕЛЕЙ 20	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
151	Кузьмина Светлана Николаевна	+79196944319	50	275	30 ЛЕТ ПОБЕДЫ 1 Т.89172883999,	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
176	Кузьмин Алексей Михайлович	+79872843404	50	300	30 ЛЕТ ПОБЕДЫ 1	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
201	Исрафилов Айрат Нафисович	+79179350440	48	325	ЮНОСТИ 15	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
243	Миннуллина Наиля Гумаровна	+79172582763	49	367	ШИННИКОВ 1А	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
142	Шарифуллина Сания Маратовна  ГР	+79178573110	5	266	Шинников 11	\N	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
195	Павлов Олег Михайлович  ГР	+79172865885	5	319	Шинников 11	\N	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
455	Хадиева Гузель Мансуровна	+79172265470	0	574	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	11111111111	11111111
240	Ситдикова Финя Галихановна	+79172344863	49	364	ШИННИКОВ 1А  тел.8906-123-11-70	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
246	Параманова Татьяна Леонидовна	+79178881891	49	370	ШИННИКОВ 1А	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
249	Суворова Лариса Федоровна	+79179286410	49	373	ШИННИКОВ 1А	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
283	Тимергалиева Диляра Мидхатовна	+79178981719	42	407	ТУКАЯ 1	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
155	Баширова Евдокия Алексеевна	+79172571722	35	279	ХИМИКОВ 57 \r\n доп.тел.89376002240	\N	111111111111111	1518048000000	1516087355115	1519862400000	\N	1111111111111	11111111
228	Хабибуллина Гульнар Рафкатовна	+79172525877	42	352	ТУКАЯ 1	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
286	Климина Юлия Александровна	+79179005550	43	410	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
452	Ирина	+79178726498	75	572	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
299	Литвинова Ольга Львовна	+79872144213	15	423	89179198460	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
267	Хайрулина Нэля Диганшевна	+79178625303	12	391	ГАГАРИНА 4	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
392	Гаврилова Татьяна Викторовна	+79172952311	30	515	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
360	Фатахова Ирина Ильгизовна	+79172250773	40	483	+79196965644, +79172929013	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
355	Васильева Татьяна Александровна	+79874207352	38	478	+79061237554	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
352	Дыренков Иван Леонидович	+79196350550	16	475	\N	\N	111111111111111	1518048000000	1516021359576	1519862400000	\N	1111111111111	11111111
330	Гильмутдинова Светлана Феликсовна	+79393980692	14	453	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
292	Патрикеев Анатолий Владимирович	+79375851226	54	416	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
270	Фаттахов Артур Альбертович	+79872707980	54	394	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
336	Исаева Ландыш Набиулловна	+79179325660	13	459	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
225	Мингазова Лира Василовна	+79179260146	42	349	ТУКАЯ 1   тел.88555397379	\N	111111111111111	1518048000000	1517672817329	1519862400000	\N	1111111111111	11111111
227	Асулкаева Эльмира Расиховна	+79178554755	1739	351	тел.8927-243-47-55	\N	111111111111111	1518048000000	1517948203067	1519862400000	\N	1111111111111	11111111
333	Каранаева Маргарита Евгеньевна	+79172310245	13	456	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
298	Харисова Валентина Владимировна	+79172466428	9	422	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
300	Хусаинова Разина Фаттыховна	+79172474182	10	424	+79872216890	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
343	Зорина Людмила Геннадьевна	+79179296996	31	466	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
353	Низамутдинов Ильнур Фанисович	+79872130473	36	476	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
320	Пачок Тамара Сергеевна	+79179169073	25	444	89872315840	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
328	Тихонова Наталья Ивановна	+79172769384	15	451	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
303	Орлова Лариса Алексеевна	+79196938324	24	427	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
368	Давыдова Марина Николаевна	+79196243858	17	491	89274560866	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
340	Литвинов Андрей Владимирович	+79172833953	21	463	+79269594964	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
302	Кайманова Светлана Петровна	+79178885713	24	426	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
301	Литвищенко Татьяна Алексеевна	+79196243699	24	425	+79179192424	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
307	Герасимова Лилия Загитовна	+79274661460	26	431	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
310	Каримова Регина Даниловна	+79871876043	26	434	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
305	Мутигуллина Альфия Зиннатовна	+79179253630	26	429	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
304	Мутигуллин Расих Асхатович	+79172601309	26	428	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
306	Мухамадеева Фарида Ибрагимовна	+79874230130	26	430	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
312	Померанцев Вячеслав Юрьевич	+79196207373	26	436	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
314	Султанова Елена Владимировна	+79872753064	26	438	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
327	Фахреева Рафия Рафисовна	+79179166459	15	450	+79053739240	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
170	Петровских Анна Кирилловна	+79179127874	5	294	Шинников 11	\N	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
161	Безденежных Татьяна Николаевна	+79178776959	5	285	Шинников 11	\N	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
456	Люлина Галина Михайловна	+79178722994	0	575	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	11111111111	11111111
309	Бушенова Алина Александровна	+79872356947	55	433	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
381	Гайфутдинова Ляйлия Габдрафиковна	+79172720235	29	504	89870002805	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
332	Туктарова Гульфира Миннахметовна	+79274612311	14	455	+79178986096	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
406	Кадырова Лилия Борисовна	+79172344450	44	529	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
408	Кашапова Людмила Владимировна	+79172982016	44	531	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
373	Еграшина Татьяна Михайловна	+79179345350	29	496	89173925851	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
167	Шенфельд Наиля Радиковна	+79172789452	167	291	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
334	Гараев Айрат Расимович	+79196487272	46	457	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
321	Ибрагимова Диана Имилевна	+79874107876	25	445	89274717660,485654	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
325	Митягина Елена Васильевна	+79867136787	25	449	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
322	Валиахметова Раиса Файзуллиновна	+79196292819	25	446	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
318	Сипайлова Альбина Андреевна	+79179371155	25	442	89600868755	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
397	Мухаметжанова Альбина Шакиржоновна	+79172690321	43	520	89179177327	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
337	Хайруллина Лейсан Вакифовна	+79872066609	13	460	89047695350	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
376	Гильфанова Резеда Ильшатовна	+79172734077	29	499	89867175667	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
374	Гайфутдинова Танзиля Габдрафиковна	+79178797999	29	497	89274762740	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
445	иванов	+79178664747	\N	565	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
335	Сахапова Эльмира Ринатовна	+79172262048	13	458	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
420	Авдошина Юлия Эриковна	+79196484418	39	541	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
378	Галеева Розалия Альбертовна	+79172929513	29	501	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
365	Юнусов Алексей Альбертович	+79600400001	16	488	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
295	Альбина Халилзяновна Борисова	+79172398660	4	419	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
347	Ефимова Маргарита Петровна	+79046750110	11	470	89872289527	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
370	Маннанов Айдар Рашитович	+79172664282	17	493	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
371	Логиновский Евгений Гуннадиевич	+79196846264	17	494	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
446	Вахотина Оксана Александровна	+79179274015	26	566	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
313	Шафигуллина Алина Ильгизовна	+79991564292	26	437	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
315	Хорошилова Светлана Александровна	+79172745323	26	439	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
308	Хакимов Ильдар Ренатович	+79172302755	26	432	89274914535	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
379	Величко Ландыш Загитовна	+79178797674	29	502	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
377	Дуенко Нина Николаевна	+79872209941	29	500	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
375	Муксинова Гульсина Наильевна	+79172588708	29	498	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
389	Кореницын Павел Александрович	+79196295232	30	512	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
448	Суфияров Илгиз Графитович	+79375717958	35	568	Химиков 57	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
427	Епанешникова Марина Владимировна	+79172312746	\N	548	89172312746	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
419	Виноградов Алексей Владимирович	+79179050910	39	540	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
414	Шутовская Светлана Флюровна	+79874140314	39	537	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
429	Дауренбекова Аделя Кусбековна	+79196807575	52	550	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
346	Макушева Светлана Николаевна	+79872241858	11	469	89870041255	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
311	Каюмова Раиса Валиулловна	+79872362726	26	435	+79872088428	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
380	Сабирова Танзиля Ханифовна	+79173921050	29	503	89196427800	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
158	Бадикова Зульфия Раисовна	+79173989584	5	282	Шинников 11	\N	111111111111111	1518048000000	1517948482382	1519862400000	\N	1111111111111	11111111
165	Педжакова Валентина Александровна	+79173983157	34	289	СТРОИТЕЛЕЙ 23	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
232	Егорова Вера Анатольевна	+79172972888	\N	356	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
189	Асатова Альбина Раифовна	+79178664539	32	313	МИРА 58	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
338	Алимова Наталья  Петровна	+79198704260	13	461	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
359	Тимонкина Любовь Михайловна	+79196887152	16	482	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
361	Захарова Розалья Гильмановна	+79196943423	16	484	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
363	Березко Светлана Викторовна	+79600793555	16	486	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
364	Плотникова Наталья  Геннадьевна	+79872683200	16	487	89867224944	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
382	Гаптриев Роберт Хайдарович	+79178899435	32	505	89083333344	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
393	Тимофеева Любовь Валерьевна	+79196814404	30	516	89872399000,482020	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
391	Савельева Галина Александровна	+79874150269	30	514	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
390	Ежов Евгений Евгеньевич	+79172965718	30	513	89178744939	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
398	Мухаметгарипова Земфира Шакиржоновна	+79172298507	43	521	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
386	Аманова Рамия Рафаильевна	+79196315526	\N	509	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
383	Дегтярева Валентина Александровна	+79172680707	\N	506	+79625670648, +79172686785	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
387	Габдикова Танзиля Ильгисовна	+79172843797	\N	510	892704490957, 9172843797@mail.ru	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
341	Белоусов Андрей Владимирович	+79172273398	13	464	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
216	Газизова Резеда Нургалеевна	+79173997413	46	340	ХИМИКОВ 114   тел.89179230541	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
439	Тарасова Эльвира Рашитовна	+79196342852	\N	560	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
438	Смирнова Елена Александровна	+79874154737	\N	559	ЧЕЛНЫ	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
436	Махмутова Раисма Касымовна	+79172310269	\N	557	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
268	Сунгатуллина Гульназ Минегасимовна	+79179234641	7	392	ХИМИКОВ 25  тел. 8927-471-70-00	\N	111111111111111	1518048000000	1517734785173	1519862400000	\N	1111111111111	11111111
145	Тимофеева Венера Магсумяновна	+79179364399	7	269	ХИМИКОВ 25, vashdom-nk@inbox.ru	7	111111111111111	1518048000000	1517734785173	1519862400000	\N	1111111111111	11111111
294	Лилия Рашитовна Мунипова	+79274567361	4	418	\N	\N	111111111111111	1518048000000	1515759576225	1519862400000	\N	1111111111111	11111111
278	Романов Денис Юрьевич	+79874236442	11	402	МИРА 58	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
262	Чернова Светлана Константиновна	+79872313650	18	386	АХТУБИНСКАЯ 6А  тел.8927-245-40-44	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
435	Кирилов Валентин	+79093139939	\N	556	АРЕНДА АРЕНДА	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
426	Мингалиева Роза Петровна	+79172529977	\N	547	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
442	Гумерова Алсу	+79172989583	0	563	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
351	Хамидуллина Гузель Ильдусовна	+79172968701	16	474	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
356	Хаметшина Лилия Анваровна	+79173943460	16	479	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
358	Ушенкина Анастасия Сергеевна	+79872868669	16	481	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
319	Фатхиева Альбина Расиловна	+79178515138	25	443	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
273	Камаева Надежда Зарифовна	+79179027444	10	397	СТУДЕНЧЕСКАЯ 10	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
154	Медведева Райля Муллаяновна	+79179204932	24	278	ХИМИКОВ 57	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
149	Шурпаев Руслан Эрикович	+79179263561	39	273	СТРОИТЕЛЕЙ 18	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
210	Валеева Наталия Аксандровна	+79179125052	14	334	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
297	Курбангалиева Нурия Маликовна	+79196366645	9	421	+79276779536	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
369	Калпащикова Светлана Александровна	+79179177101	17	492	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
385	Боярова Лидия Ивановна	+79178822520	\N	508	+79172252104	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
411	Гомирова Гульнара Анваровна	+79172415715	\N	534	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
432	Барматунов Иван Алексеевич	+79179279391	\N	553	+79172434739	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
431	Храмов Артем Валерьевич	+79196450188	\N	552	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
404	Карпова Наталья Барисовна	+79872778817	\N	527	+79872870650	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
430	Усачева Римма Сиразетдиновна	+79178824615	\N	551	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
388	Шарифулина Василя Ильгисовна	+79182520404	52	511	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
403	Руднева Лариса Владимировна	+79172236233	44	526	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
357	Степанова Альбина Фаатовна	+79179014193	38	480	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
366	Гатаулина Лейсян Наильевна	+79872995744	40	489	+79196842322, +79872923691	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
362	Логинова Ольга Тимофеевна	+79179376530	40	485	+79172432057	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
399	Мирсаипова Гузелия Арафатовна	+79872340901	43	522	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
402	Ахатова Фарида Мухаметвакиловна	+79172235086	43	525	89600832640	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
401	Фатихова Регина Ренатовна	+79196338581	43	524	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
405	Шайхутдинова Луиза Рафаельевна	+79172909721	44	528	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
407	Шакирова Ирина Вадимовна	+79178531255	44	530	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
410	Гатауллина Лениза Котдусовна	+79172935087	44	533	89196440870	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
409	Сорокина Светлана Николаевна	+79172956036	44	532	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
400	Хадиев Нагим Фоатович	+79600892008	43	523	+79600741988	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
384	Мукминов Равиль Варахипович	+78555421277	15	507	+78555487003, +79046751048,  +78555421277	\N	111111111111111	1518048000000	1516793980804	1519862400000	\N	1111111111111	11111111
293	Зульфия Зашитовна Музлова	+79172927673	4	417	\N	\N	111111111111111	1518048000000	\N	1519862400000	\N	1111111111111	11111111
\.


--
-- Name: userdata_id_userdata_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('userdata_id_userdata_seq', 460, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nkagent
--

COPY users (id_user, date_registration, role_id, email, pass, hash_url, date_hash_url, default_city, default_districts) FROM stdin;
298	1495612204145	5	lucca8301@mail.ru	0fe44c9a98c3d955f7f21c1d88517e2f5eaf2a72	\N	\N	\N	\N
296	1495609185059	5	296@mail.ru	37c0f93540b20a77e410d2caf887bca8dddb204d	\N	\N	\N	\N
266	1495528395523	5	a89178573110@yandex.ru	6c37074c1365251da3a2e3cd0ef444f90878946e	\N	\N	\N	\N
323	1501184219876	5	rimma14@mail.ru	682ffa4bf3de441158bbd8cba8eea7bd6687301f	\N	\N	\N	\N
309	1501177651380	5	309@mail.ru	ab563ad5dc8a4b09671a906c7f6c06cc4b9692ef	\N	\N	\N	\N
302	1499367395458	5	everest4@mail.ru	6ffe306b7bfdfdd6325b0501e2336fcc14bf7623	\N	\N	\N	\N
313	1501178802359	5	airat-asatov@mail.ru	1293c9cbb5d3332d49b77786d9648f5d4ed4e4b6	\N	\N	\N	\N
303	1499368230203	5	semashkin.andrey.70@mail.ru	e6a605fce8e581f38c82e133b57e566e4a458ec6	\N	\N	\N	\N
328	1501184937574	5	Koltzova_evgenia@mail.ru	a1b53c022602a495a3d2ac859d02514d8e9bb1c0	\N	\N	\N	\N
290	1495605804695	5	elena_1975_24@mail.ru	4c9d6c02709b7fe6f30b932453c40440679c4a93	\N	\N	\N	\N
310	1501177804190	5	rimma4@mail.ru	42b8a0ca1e684a3bb19b4a0a77bf4d5fd4e3755f	\N	\N	\N	\N
291	1495605986561	5	89172789452@mail.ru	413a47379ed2dab96273173f7b17c908f24478c4	\N	\N	\N	\N
334	1501186063471	5	valeeva_nk1205@mail.ru	c722b91f3dfb3869c873d995c926517325a2738a	\N	\N	\N	\N
263	1495526185041	5	albinochka_siyan@mail.ru	1af6d8a645902d7650788fc214da4b38735f0b75	\N	\N	\N	\N
276	1495533883546	5	dar0510@mail.ru	48614076e63c95b8282d9c8e08dd73c64fc2389e	\N	\N	\N	\N
324	1501184307822	5	4178r@mail.ru	a6e6204bb4434a88c2cdcf68d2fafbc853d090a9	\N	\N	\N	\N
333	1501185849638	5	elvera79@mail.ru	85393f2a2b4617edbf290c7c536d24a17c84139a	\N	\N	\N	\N
316	1501179099388	5	rimma10@mail.ru	e32af7bf703d7d7bfc4a838e8b886ed44e5d6585	\N	\N	\N	\N
288	1495605382583	5	nk_rimma@mail.ru	45275e4c0e4f368cd1423655164638f9a356026d	\N	\N	116	\N
315	1501179020538	5	rimma9@mail.ru	8e13fd0c52998bbdaefa626a51261671124ba9f2	\N	\N	\N	\N
284	1495604620189	5	shurpaeva2014@yandex.ru	bea18d721d6ae13c782075ba93e448ace8e6449f	\N	\N	\N	\N
301	1499171800211	5	imeria@yandex.ru	91a7a8e5530bb948d9eae207bd8333c204517974	\N	\N	\N	\N
287	1495605256037	5	irishka.sokolova.68@mail.ru	67fd64546852524ceaba515e323f9d0a718e9d29	\N	\N	\N	\N
269	1495529278520	5	tivenera@mail.ru	9e2ed7e88ab17b76d328391b02bcce7923e86572	\N	\N	116	\N
569	1516135083684	5	12fg23@mail.ru	300283683bfae8d0ca04632e6c51967a36097a78	\N	\N	\N	\N
294	1495607740537	5	vavilon10@mail.ru	eb063cf7467a41b524fedf8e8f2c8ff0a9776c01	\N	\N	\N	\N
320	1501182899325	5	marina-alina71@mail.ru	0e4f53632cf090578e366478147fdf1b65eb2129	\N	\N	\N	\N
330	1501185143243	5	ivan2306197221@mail.ru	36866e68c7ec4a64362db90a26337d6d6d11cdab	\N	\N	\N	\N
274	1495533529592	5	kcefa@mail.ru	7adb1ca29417ec62e28e06ef08dcc6114d58a6f5	\N	\N	\N	\N
317	1501179174398	5	rimma11@mail.ru	579a9600828fec79bc926bfbf2aeb881f5282578	\N	\N	\N	\N
272	1495532105494	5	elechka1999@mail.ru	8bc939b0004fd51b35d740da68c50bf6ed2dd08a	\N	\N	\N	\N
307	1501176617492	5	9221717@mail.ru	3265ac606fcc3f35f26ecb06089b34e1d61d16a8	\N	\N	\N	\N
273	1495533391423	5	shurpaev2014@yandex.ru	cd352e7613a8620cd092015bf78df12e681276d2	\N	\N	\N	\N
279	1495603615027	5	bashirova.1947@mail.ru	9235243235ef9d4bfbdaca7640d1d97521b10d71	\N	\N	\N	\N
572	1516699265289	5	hgyt56342@mai.ru	9b746b84b95c4df6a5172159215c5637bbe08348	\N	\N	\N	\N
281	1495604061170	5	Adelya.kolesnikova@mail.ru	722c00faa80a68d9927413cc9b72484b33447f28	\N	\N	\N	\N
319	1501182776159	5	arn_vavilon@mail.ru	3eed689ef81025ede948f22b33bc31d853eb34a1	\N	\N	\N	\N
282	1495604283404	5	pekmabz63@mail.ru	68c9fde1c03bdd65c31b3ab98993aec5c59c28df	\N	\N	\N	\N
268	1495528910515	5	AkhmetovaOlga@mail.ru	c514d03f1f65f6c427bd65461fa38bdc82063109	\N	\N	\N	\N
285	1495604877082	5	b.tatyana.n@mail.ru	61e90d5fd10751d9a4f41745bb4dd35b1fdf9521	\N	\N	\N	\N
265	1495527083446	5	natali-nk-75@mail.ru	02d086d3bb6820c11d651c7ea22dbd892961628a	\N	\N	\N	\N
277	1495534267256	5	zulia100@rambler.ru	f110f5c8329960ccd90d9be5198a98a662f04048	\N	\N	\N	\N
275	1495533657392	5	sergey-nk@mail.ru	49de97322cffadb67ffd49e5e5ede42a587785b6	\N	\N	\N	\N
270	1495529440168	5	albo1977@mail.ru	3a0b60f489a49535dab5b8a09ea09e3a9263f886	\N	\N	\N	\N
312	1501178704975	5	ms.lilia.sadykova@mail.ru	a1f2b4e704d4152e144ca5962f989bb389ae5730	\N	\N	\N	\N
331	1501185267720	5	rimma22@mail.ru	935f600583d0ff443a1350a1e17eedb2a8c53f3f	\N	\N	\N	\N
278	1495603451141	5	n-kama88@mail.ru	b6f719de61d1007d1aba03eb478a199689348ab6	\N	\N	\N	\N
325	1501184592662	5	nedvizhimost.nk2014@bk.ru	ecfffb322276613f3cc92979dccb14a6dfff6b43	\N	\N	\N	\N
295	1495608111673	5	rieltor-ramis@mail.ru	0e84aeee195a33051b476c8338a824dc8e1fe4e0	\N	\N	\N	\N
329	1501185050248	5	329@mail.ru	25e1d4246da38da4f16a47915d830d47697809ed	\N	\N	\N	\N
283	1495604430922	5	nima17@mail.ru	3af87679dbf732c2b50773d528f460164b71268b	\N	\N	\N	\N
293	1495607317421	5	ttmirgazina_1975@mail.ru	a829a9670d9c4867f55ecb699a0bd054f40e75d6	\N	\N	\N	\N
292	1495606175260	5	Alyna.akhmetshina2205@mail.ru	f7de8d803503c86384e02d9f13e73f3319c300fe	\N	\N	\N	\N
300	1495621912844	5	everest3@mail.ru	61c879f2c978c14759d5006abffd01d41779792d	\N	\N	\N	\N
314	1501178924410	5	rimma8@mail.ru	7720e757682f90c6f6df0c9a3467f9512018c0d3	\N	\N	\N	\N
308	1501177411595	5	rimma2@mail.ru	97301d0379652ba74d283ea33d7d6c9772d65119	\N	\N	\N	\N
267	1495528646664	5	fybaeh@mail.ru	2c2e2ec5ab0d2cddcc9a022b71b1412fae3373a2	\N	\N	\N	\N
332	1501185394339	5	elistratov-71@mail.ru	330a63a05794cb800a28cdfcb4560db7521f05e9	\N	\N	\N	\N
286	1495604991745	5	Ola-2011-olya@bkl.ru	aa7d940e084b61e6d60394da98867fb032ea859c	\N	\N	\N	\N
264	1495526821029	5	kominamail.ru@mail.ru	44dc21be133c5c53eb3058edacaf7f7675d6f219	\N	\N	\N	\N
299	1495612501091	5	everest2@mail.ru	c736a5a5e7e3fd82e014335b2632bfd3b73ba792	\N	\N	\N	\N
271	1495529614274	5	sergey-nk@mail.ru	64405db945c908f0be167c9508603a4a5aff869a	\N	\N	\N	\N
376	1501437686449	5	rimma23@mail.ru41	ac97e6dbceabde3ddc401d1ab2eedde63cbb5150	\N	\N	\N	\N
381	1501438117564	5	rimma23@mail.ru46	ac097373f8096333eac334ba5be1c0b75762ebec	\N	\N	\N	\N
390	1501445287887	5	leniza0@mail.ru	8d3b4b402cdbc992b2eaa4f8547549254ad611bd	\N	\N	\N	\N
341	1501187550895	5	rimma32@mail.ru	530a4bfd4776ee4746f0d8fed5d371fb0ae7d9ea	\N	\N	\N	\N
382	1501438253438	5	rimma23@mail.ru47	ec313e70aa942d1d0d7d32ae7ff8fbdd86ab5f4e	\N	\N	\N	\N
289	1495605605039	5	xjkb@mail.ru	742c88d0d1ded9003b6041ab75c6f38bc6f87405	\N	\N	\N	\N
339	1501187180990	5	rezidasmirnova@mail.ru	4e8d880020a40ed6688e8e0f94338884418526de	\N	\N	\N	\N
349	1501209472481	5	1rimma23@mail.ru	08f269bce86395790a47fcb592f78249e4ab1478	\N	\N	\N	\N
405	1506883571270	5	405@mail.ru	ea0ec57b8f265083758280d2ca697cb08d77d4dd	\N	\N	\N	\N
570	1516270228628	5	rieltjh@mail.ru	8719bd7f5011a53d9807415cca1474f369ecf1e6	\N	\N	\N	\N
391	1501445419472	5	lina1717@yandex.ru	96f97fe3cf2dfc2b99a531eb8dec7286fb280fab	\N	\N	\N	\N
372	1501437248251	5	38rimma23@mail.ru	200c153f7015738e2a0585e248887a6cc2ec6fb9	\N	\N	\N	\N
387	1501439737201	5	tatyanaah555@mail.ru	f165c737f906b6c035c28f7ea38c62b65077fb72	\N	\N	\N	\N
398	1506882217827	5	398@mail.ru	5a627cfd741468d5fe7c08e8256ef349bce19ef3	\N	\N	\N	\N
368	1501436838391	5	34rimma23@mail.ru	09de3f327cd947d434562359da90277d4958a93b	\N	\N	\N	\N
363	1501212128973	5	dinarexpert.tat@mail.ru	2600bbc74b46f2eb6fdf6684e84a418b3132a2b1	\N	\N	\N	\N
406	1506884047484	5	Maksimova-guzel@mail.ru	46ab253094a167fdd60b795888207544dcbe71fe	\N	\N	\N	\N
360	1501211889181	5	ers-expert@bk.ru	2fab54a56d4906f71c24068c633e5533286a4c25	\N	\N	\N	\N
340	1501187257338	5	r_707@mail.ru	64d0e58d05caacf1c2f7496f831d7728fb78c383	\N	\N	\N	\N
355	1501211315553	5	nihnekamsk@mail.ru	7ce5db0af06b7012c7b1d8ad4e1cc296e7ec50a4	\N	\N	\N	\N
573	1517518858849	5	vizit1@mail.ru	f3a4e7c0c0621b5ba49e3564c63e41d487d06381	\N	\N	\N	\N
350	1501209586992	5	l_gimadeeva@mail.ru	2696e58ff38de5b58bb64b0af083c74f79de391d	\N	\N	\N	\N
357	1501211533242	5	rus-m78@inbox.ru	eaffe8f55b64c0f1623f6bde62fdf9b0dd5b5024	\N	\N	\N	\N
346	1501189129805	5	346@mail.ru	1fd75545eb473b480623b280086a7cf5997565b3	\N	\N	\N	\N
395	1506490309093	5	Rafic83@list.ru	2d9ab1e0147615823b94db0473c86b0fc9b18cff	\N	\N	\N	\N
352	1501209832057	5	4rimma23@mail.ru	009fe1c92f901fc34ecb879c527dd85587af0374	\N	\N	\N	\N
400	1506882367753	5	ziyatdinovaalsou@mail.ru	0d15a9eb6b97f7492fbf97d8a8917a0e84cc723a	\N	\N	\N	\N
353	1501209927533	5	olga9947@mail.ru	eb6a05e0636c8dd911f4527cda5f0bbbb88c6397	\N	\N	\N	\N
396	1506881992065	5	a.valakp@yandex.ru	c38366fdbc28e17ad355a69461ffe468cadfbcfb	\N	\N	\N	\N
336	1501186583614	5	Hasanovaoksana@yandex.ru	9258ce70cd446531b8090d6f87a16adcede166ad	\N	\N	\N	\N
399	1506882281840	5	11092008@inbox.ru	d69283edee717af7193843f7f88bbef91270c087	\N	\N	\N	\N
361	1501211985644	5	abb-nk@mail.ru	eb1f8b968050652f659b2f6d569ae6ddf811ec52	\N	\N	\N	\N
386	1501439601038	5	chelana-nk@mail.ru	fb0fd0ecae9baaf60e9ba90fd6b7f6281e0d9d55	\N	\N	\N	\N
348	1501189313348	5	348@mail.ru	0e981137da458b9cc1714b6912b67a68de130c36	\N	\N	\N	\N
362	1501212055002	5	ildar479@yandex.ru	568858ec29338ec4a9af0a715db9fffa59559a48	\N	\N	\N	\N
404	1506883460400	5	404@mail.ru	77ee29fc01bb04f93f02599f25b579e54f3bf5f5	\N	\N	\N	\N
375	1501437590976	5	tagirova69guzel@mail.ru	becac7f0cd7c0cb07998e8445d339095d2a136b2	\N	\N	\N	\N
377	1501437790343	5	katish_nk@mail.ru	d9d47c1ec0f267a01109090799e5d517d01eaa79	\N	\N	\N	\N
392	1501446345790	5	gulnaz.sungatullina@mail.ru	170d4cce55265866de9a1273847ec4733a5eaaba	\N	\N	\N	\N
345	1501188130503	5	rimma36@mail.ru	1160dd1ab3764d0e6c67a41bdfc27f0f06d181b6	\N	\N	\N	\N
371	1501437141699	5	37rimma23@mail.ru	6c4da8593fe0b73219ad59bfec6b7e2283a8eb03	\N	\N	\N	\N
374	1501437418644	5	rimma23@mail.ru39	808cc412956bbf3ea4e1f5ad2fe15fb5ff67be98	\N	\N	\N	\N
364	1501436485849	5	30rimma23@mail.ru	5f9fbad4ca80bdaaca15c33a3e3beeec61fe22fe	\N	\N	\N	\N
370	1501437044946	5	36rimma23@mail.ru	b3b12eb5103454f848877bcd427878cd6a88e079	\N	\N	\N	\N
365	1501436586472	5	31rimma23@mail.ru	e97c59a8228e31b21abc336bf712aa837823c932	\N	\N	\N	\N
394	1506490207950	5	roskonsultant@yandex.ru	e6c4d6082daf818e4240dacdfc9b2376758dee56	\N	\N	\N	\N
342	1501187640185	5	rishat-77@mail.ru	9423ce30a9198746866d18c5acae12f50421b9bc	\N	\N	\N	\N
347	1501189231835	5	9172832557@mail.ru	fb229de869a82bd28c181f5d5a19282ea406606f	\N	\N	\N	\N
358	1501211616660	5	sharafutdin@gmail.com	46d4f949e8717915354241f96c6a191f268d8128	\N	\N	\N	\N
385	1501438625946	5	44rimma23@mail.ru	efee7e05ba2e1beb18fec518ba45f80ea5c317cf	\N	\N	\N	\N
369	1501436942817	5	35rimma23@mail.ru	fe7255206c2a0ae8abc15a38d7d302c4b9d85633	\N	\N	\N	\N
338	1501186981144	5	olga9947@mail.ru	866544c7dedf0051d15d5e37b413cef61b444633	\N	\N	\N	\N
402	1506883213384	5	402@mail.ru	41b014f9992c0a168d8a132b91f03446b50fdd77	\N	\N	\N	\N
409	1506885342037	5	talisman3@mail.ru	b3342749ac4b33018074c546e33b3139bd7c0e02	\N	\N	\N	\N
397	1506882114928	5	kamaevank@gmail.com	9a1e1b478ea6e02ebda69e331b5aa01adc51af9d	\N	\N	\N	\N
356	1501211406709	5	8rimma23@mail.ru	2734eda6604f2b6739472c87863b854b3689a1d0	\N	\N	\N	\N
367	1501436738223	5	33rimma23@mail.ru	be6af37e9b433e29b6718fb86157a2ec461cedb9	\N	\N	\N	\N
403	1506883398781	5	Anastasia-nk@mail.ru	d14eddcf262ba7b4bddfbde9bfae90f33701aaa0	\N	\N	\N	\N
407	1506885041990	5	talisman1@mail.ru	d6b072b553d9ab1a129f3e435b3f3c5596aa66bb	\N	\N	\N	\N
408	1506885210079	5	talisman2@mail.ru	b88c5ffadf84f51f1dab1efe6e7abb0ca7c2e94b	\N	\N	\N	\N
366	1501436663575	5	32rimma23@mail.ru	f1c8fc4befbc25f8565748b34888ba3042732d0b	\N	\N	\N	\N
373	1501437316205	5	rimma23@mail.ru38	57015d0c2a05ca50f2fab916c6e128cf003f5959	\N	\N	\N	\N
343	1501187930018	5	rimma34@mail.ru	863cae4a49e2ce1901167f2a8f1e66ee9e80dc43	\N	\N	\N	\N
411	1512204560386	5	alla@citydom.ru	359bda7b9322d775bef50c66b8d083fe3b6f82d8	\N	\N	\N	\N
469	1512221358463	5	499@mail.ru	0068640be9f9e618fd9f120226ce248b1e3e60a3	\N	\N	\N	\N
455	1512218594122	5	Gulfira-nk@mail.ru	2b5e193cdc6447a1baccbc315f8a3f9677175f38	\N	\N	\N	\N
444	1512214628098	5	pachok.54@mail.ru	299b0e8cef1dd9e92fe686e3aa560cc08cba2673	\N	\N	\N	\N
426	1512211143700	5	kai_manova@mail.ru	20bee25327fbba8ab12321501823280580d6b1c0	\N	\N	\N	\N
435	1512213564441	5	435@mail.ru	bc2f8aa70b72dac69cdab13d827ea38439341820	\N	\N	\N	\N
412	1512204944130	5	rieltservice-nk_@mail.ru	48b869759ba347cce3f2fda6c73ea938ecb5eb89	\N	\N	\N	\N
460	1512219019694	5	lesya-815@yandex.ru	7730dfdcaeb2b94d1745756ced51496cd76d4f14	\N	\N	\N	\N
419	1512207666220	5	419@mail.ru	6f588c6f3a0416e59967dc6092ecba6cc6832a8e	\N	\N	\N	\N
457	1512218855881	5	garaev72@mail.ru	042ba24a0e63eded43013aec7cce217c431c5af2	\N	\N	\N	\N
423	1512210015222	5	o-litvinova72@mail.ru	87f5d1aa9898e3a3b604f48fbe04ac2c18252678	\N	\N	\N	\N
422	1512209350899	5	422@mail.ru	aed92cefd6db2f3eba4965e076fc432c5f280854	\N	\N	\N	\N
450	1512215802632	5	rafiya-f@mail.ru	6263fdcc7eccbc654f1e76ff01fcb2468ca7c005	\N	\N	\N	\N
439	1512213864416	5	439@mail.ru	0a21da867cdfd8a63461a076c5b82d97e13f2eee	\N	\N	\N	\N
464	1512219460785	5	avb20@mail.ru	147ac49973bb2b89727ad98fa8ec4141152356b8	\N	\N	\N	\N
417	1512207235767	5	zula19760@mail.ru	eb32ffa9de843596c2a9e4708814f8ee937ef4d4	\N	\N	\N	\N
418	1512207380830	5	418@mail.ru	7cb8c2b197030ba2747ebb33a4707b4d805ca67a	\N	\N	\N	\N
431	1512213015348	5	431@mail.ru	84e6067038855cbdc89f497b3ca702633914c586	\N	\N	\N	\N
359	1501211788092	5	albertexpert.tat@mail.ru	40cdd93c9f2df67df87d07a2ad60f45479d3bb1c	\N	\N	\N	\N
456	1512218625010	5	456@mail.ru	42dac3686c4bf9fc96af102fa26abacd14f8bd62	\N	\N	\N	\N
429	1512212757897	5	429@mail.ru	fb2e1699c3f0b9cc25173ce7812997f720f2391e	\N	\N	\N	\N
420	1512208161751	5	lavdoshina@list.ru	58181bed960d6ddfd6a6936556060fade6f06e97	\N	\N	\N	\N
443	1512214514511	5	443@mail.ru	59533ed1f69e0404dea6be90e27500a9e57935db	\N	\N	\N	\N
476	1512222559199	5	476@mail.ru	ceffdd572a52b225ee7fa119071fcd1a9e3f175e	\N	\N	\N	\N
442	1512214445077	5	442@mail.ru	d5d40baa6f34d9d030545d56a8213716228eb905	\N	\N	\N	\N
425	1512210991151	5	13tanyusha@mail.ru	42ba88c254373b2ee2d603d2a0b5a6db46066ee2	\N	\N	\N	\N
433	1512213405254	5	20092008-84@mail.ru	107cae96d690909ce20f3c4a82a38e75ba2e7b99	\N	\N	\N	\N
461	1512219119641	5	461@mail.ru	d5eefcdb6d86f107f3425e47d4646a2157d5e911	\N	\N	\N	\N
463	1512219429757	5	a-litviniv69@MAIL.RU	8544cf2cd1caf25ab2bdcb7e0b8fa915449b9aec	\N	\N	\N	\N
462	1512219223942	5	462@mail.ru	b3e7c6a824c8ceee1ad27e871497406ec0a3f2ac	\N	\N	\N	\N
459	1512218918962	5	459@mail.ru	0d1cbc759103b301557f9449a7e98e1244bbb20b	\N	\N	\N	\N
458	1512218866999	5	458@mail.ru	041689b224c88dbbf2e019b1860256850607853a	\N	\N	\N	\N
474	1512221969438	5	9178701296@mail.ru	d47c4b469c772db3fac3f26f469360550b51cdd3	\N	\N	\N	\N
487	1512224219531	5	natali-plotnikova@mail.ru	712a88c2a0a54be5d62e18267a99a475e310d4f3	\N	\N	\N	\N
480	1512223113554	5	albinavf@mail.ru	ad969c751f5afd773fd788bb95c972f44b220653	\N	\N	\N	\N
438	1512213787158	5	438@mail.ru	db6a6809f16fde137b01766f5655a71657e5005f	\N	\N	\N	\N
482	1512223557929	5	482@mail.ru	f7d4f33c3d89d5c13e9c55c2ee2b941e74f2ba03	\N	\N	\N	\N
477	1512222731678	5	477@mail.ru	ec77066983e50a8c6dd5c06a79f3ad072660d656	\N	\N	\N	\N
432	1512213136394	5	432@mail.ru	0209cac3da906916156cd81b7a1746d7f19525e4	\N	\N	\N	\N
481	1512223121683	5	481@mail.ru	f74c625b4f7d014e1b15c37ea59102144ad8fb59	\N	\N	\N	\N
445	1512214733189	5	diana.138@mail.ru	501c014c7717e2989cd6cb81ba04d51ef8879d90	\N	\N	\N	\N
428	1512211651981	5	mut.88@yandex.ru	8741904e786745325becf02d0d2ef96c1406dccc	\N	\N	\N	\N
483	1512223788006	5	ariana.fatt@mail.ru	25646b0ddac481aa9fee40f762fc760ab8f0efcd	\N	\N	\N	\N
472	1512221874390	5	472@mail.ru	5d0a2bd57238084b3764953bc4c4bf975c0ba040	\N	\N	\N	\N
441	1512214360108	5	441@mail.ru	4f2c182ac3358359faa750fcec3d47f167ab34ba	\N	\N	\N	\N
486	1512224004865	5	486@mail.ru	97b2e8a98dfcc1caf313924e08c226f963323c19	\N	\N	\N	\N
434	1512213461872	5	434@mail.ru	d69f71c1ee6883e4ab375b723fc4c6534157cc4d	\N	\N	\N	\N
430	1512212924069	5	430@mail.ru	4168b37c237ae8295fda26043a0bd2b1c2db7833	\N	\N	\N	\N
436	1512213645768	5	436@mail.ru	65e6935f723ac90f889addcb8effabbe8679d36a	\N	\N	\N	\N
471	1512221529536	5	Valeriy-nk@mail.ru	fe915b5cc41ba8d1971728a2106a72b37c710971	\N	\N	\N	\N
484	1512223835947	5	484@mail.ru	dcc1daf91a94be295ea0bdf3cd4a795fb5729862	\N	\N	\N	\N
437	1512213714209	5	437@mail.ru	d8d776d22d4bb97909537b4912342c16e4ed8dab	\N	\N	\N	\N
466	1512220226880	5	Thejuz@yandex.ru	62012c9bbc6c9b6996ffc02cc6465e37f7366db3	\N	\N	\N	\N
448	1512215005488	5	448@mail.ru	3fda9f66f7fae40683d87504803a0f0beedeaabe	\N	\N	\N	\N
449	1512215105273	5	449@mail.ru	88d34a056a8b08902237156fe21ccda5bfe278c4	\N	\N	\N	\N
414	1512205706601	5	somali77@mail.ru	5978f60298a1ca24bb8dcb2137b72d0894270463	\N	\N	\N	\N
416	1512205985060	5	tolik_patrikeev@mail.ru	6a032627eb2218dc9efb48e08d1d3a99f2fe9249	\N	\N	\N	\N
415	1512205870613	5	somalim77@mail.ru	002c7aa34ca383cddbf725bba9fa494abc94b55f	\N	\N	\N	\N
421	1512209159747	5	nuria_74@mail.ru	daf440ef478c6d908a2b8703e324cca9e7f5ef07	\N	\N	\N	\N
424	1512210396810	5	rosa19rio@gmail.com	74fab6a9675ba567b5f2db6800bbd1ea6356f55c	\N	\N	\N	\N
478	1512222853442	5	tanya.vasileva.1967@mail.ru	6be00b1bc72b1bbafc0df8af1c191c3edd06ff56	\N	\N	\N	\N
440	1512214071267	5	440@mail.ru	53090f43c0463643aac23d35b99e9b630826aa08	\N	\N	\N	\N
446	1512214803488	5	446@mail.ru	73506f02ce201ee3f8ff3e47e4abb3c17a0999b4	\N	\N	\N	\N
413	1512205135509	5	sargina68@mail.ru	251ba97bb50996a06f87eecc4b90abbbe7c89f1c	\N	\N	\N	\N
453	1512218447710	5	svetik-svetik68@mail.ru	b674af2aa9bb7d14e3289ee9bec5fcf34d0af163	\N	\N	\N	\N
539	1512495574449	5	539@mail.ru	1022bf2f8d0288a769d5292a61a170537faddf76	\N	\N	\N	\N
559	1512656698637	5	559@mail.ru	884dcb04e61c075da629ba4db1f1bc7d34e02fde	\N	\N	\N	\N
561	1512656922984	5	561@mail.ru	21c392158ce3b16f98146e9690cd12bd9b0555ef	\N	\N	\N	\N
511	1512230017372	5	511@mail.ru	3b778545e4030f7c1a69d83d1c80c49e2075a09e	\N	\N	\N	\N
560	1512656826582	5	560@mail.ru	5391a1fd5291ca9018d1ce7d435b53d3cd8a379a	\N	\N	\N	\N
546	1512506816503	5	546@mail.ru	ddfc36fe08c7133a7d3cbf56cd52f25533508391	\N	\N	\N	\N
500	1512227796724	5	duenko.nina@mail.ru	c6674ba91840d5d07abc0b7a486143878d47d23d	\N	\N	\N	\N
547	1512506921109	5	547@mail.ru	ec7eb535eb492bee20db42e5de5c039711b2d68d	\N	\N	\N	\N
509	1512228972415	5	rail_66@mail.ru	4b27e131228b5048dbb121156d22089972ad866a	\N	\N	\N	\N
542	1512506151255	5	542@mail.ru	5756dc00f7b23128248a3787124b771256aee91f	\N	\N	\N	\N
551	1512648529161	5	551@mail.ru	6cede38f471032a4713094c83bedda4f26b17a82	\N	\N	\N	\N
543	1512506245327	5	543@mail.ru	999db2a3b73ca150c9323299f047937dd54a96f8	\N	\N	\N	\N
553	1512648743824	5	553@mail.ru	d1ea676839aa89a3443e467aa624205732ddf51e	\N	\N	\N	\N
508	1512228827022	5	boyarova-54@mail.ru	3353b9b775c20129da4b14d0e0e8c98dd6b75c54	\N	\N	\N	\N
512	1512230605765	5	512@mail.ru	3abc8c8f5a2e17c737469489f1d23826dcf0f797	\N	\N	\N	\N
549	1512507168100	5	549@mail.ru	b01ed9284133a66992464fde08ca374a46e73eb2	\N	\N	\N	\N
532	1512233477061	5	532@mail.ru	60431a5b591e6a90eb80d6b2ca95b47864b54bbe	\N	\N	\N	\N
534	1512233711818	5	534@mail.ru	54a0464e4034b3b0534bdaabb3863a78eecf384c	\N	\N	\N	\N
530	1512233315432	5	530@mail.ru	d6b122766fc4cbaeeaac44a6a90491aad0f3c41d	\N	\N	\N	\N
494	1512224911226	5	leg1979@mail.ru	37cdeb4c8efc42dc96327bebee35db3e3bd84521	\N	\N	\N	\N
563	1512657086251	5	563@mail.ru	4c91a64ca8fb744def730f21907321fe517df237	\N	\N	\N	\N
548	1512507074403	5	548@mail.ru	5506ab2b009c0ee53faf2eb8fa4d00a7a4f0ede7	\N	\N	\N	\N
541	1512500285321	5	kwxz115@mail.ru	8d7cb2c38fd9c7c1daf8bcc081f663d6cdd0d7d8	\N	\N	\N	\N
555	1512656281468	5	555@mail.ru	7b8ab5825613fc42e8b33b9ac5f7b659a63b7fa1	\N	\N	\N	\N
502	1512227982389	5	502@mail.ru	e68790c0402f8177e3f8f8eab6733415793613bb	\N	\N	\N	\N
504	1512228189223	5	504@mail.ru	0675575976bf714a3fa924586a1bdb99030f9f56	\N	\N	\N	\N
537	1512234401293	5	537@mail.ru	2a5aaf639785b600c12749d338c44475ef70f265	\N	\N	\N	\N
527	1512233169226	5	natalya.borisovna76@mail.ru	036f756600b5d79b1d85a28e3334f40e0e37d32c	\N	\N	\N	\N
515	1512230933996	5	515@mail.ru	0d7edb9a02b95817a68ab07469a6a2741fd0c62d	\N	\N	\N	\N
501	1512227906473	5	105@mail.ru	2a74138295001be6136a265f5aa132d9a1b39233	\N	\N	\N	\N
556	1512656403245	5	556@mail.ru	ff86e97b67d205b73bc8815a337aeace71a085d7	\N	\N	\N	\N
491	1512224607675	5	zed.marina@yandex.ru	41ab05b7d05856299e19efbd01f295af856d4097	\N	\N	\N	\N
562	1512657007706	5	562@mail.ru	7eaf096d7acc69f1d2668b8cdda8e653f9997cc2	\N	\N	\N	\N
550	1512507497201	5	550@mail.ru	6c3a2c322772d782831536ed4a316b7a083a02a3	\N	\N	\N	\N
554	1512656117674	5	554@mail.ru	c3660a8fd69148bef0cc98921add8a6ff93588d1	\N	\N	\N	\N
524	1512232508476	5	regina-rt@mail.ru	3fd25ac48c3f6bb699142eaf5ff7c744564d7ca9	\N	\N	\N	\N
510	1512229339652	5	tanzilia.80@mail.ru	8953f6d78d19cbf6d886ced2e1941304773ec92d	\N	\N	\N	\N
496	1512226692977	5	496@mail.ru	6829811a68b9a43cddb2e4712a9b4a7de2355377	\N	\N	\N	\N
523	1512232383537	5	523@mail.ru	76b92731d19cd0fddaeca1f22b0065e7de338404	\N	\N	\N	\N
505	1512228465809	5	505@mail.ru	074ed30797b2bf6c4f2b95f5e380289d0be8b7f7	\N	\N	\N	\N
528	1512233176021	5	528@mail.ru	66aa13c6a54152fd6f0f3d63e41bac238d3b4b74	\N	\N	\N	\N
503	1512228100110	5	503@mail.ru	d7bebefcde9c8404b0aad9e5ae55d5143cdb6f20	\N	\N	\N	\N
571	1516365880099	5	mshavalieva@yandex.ru	d7d6b7ac2f28eece26b2cd48b9f72f04655c7715	\N	\N	\N	\N
533	1512233629879	5	533@mail.ru	18d9712174a93bd2bf43ef260f69a43aa2d1c948	\N	\N	\N	\N
540	1512500145731	5	540@mail.ru	397ad07b261569db49fe958f110acc7ff706079b	\N	\N	\N	\N
574	1517656130755	5	574@mail.ru	9ed1b9a0e9334210905e74b316dede8c3c4ea3d4	\N	\N	\N	\N
529	1512233251077	5	529@mail.ru	801f8f4f2efcee5fe1ac9b1ee00ff10eb4f592d5	\N	\N	\N	\N
516	1512231054919	5	516@mail.ru	c638e9434adcb04a2209fb0be34a8599a6dc18de	\N	\N	\N	\N
525	1512232903450	5	525@mail.ru	b873b6a3f84c6e058ceaebec143c6ad7444f10cf	\N	\N	\N	\N
493	1512224851444	5	493@mail.ru	7798eb8e527768de257def91505262d51ca9aaa7	\N	\N	\N	\N
485	1512223993564	5	olgatereshina74@mail.ru	579c224383b9fed14cc5b9f55380929b08a61675	\N	\N	\N	\N
522	1512232278019	5	522@mail.ru	6a4798e5251b78d01167eee25fa74f1ac44dd1fd	\N	\N	\N	\N
513	1512230740735	5	513@mail.ru	8ebf9c7de5a43dfad33ddadaf7a9de3acd0cc385	\N	\N	\N	\N
514	1512230845342	5	514@mail.ru	396c6749337239887e11f67c5f9f89d37262a768	\N	\N	\N	\N
526	1512233083658	5	526@mail.ru	abf808645cc1aa5c7abaac33b4d6a096866da9bf	\N	\N	\N	\N
498	1512226873218	5	498@mail.ru	1ca60271ba9abc268e2b81f0a60cdd208fb40d18	\N	\N	\N	\N
521	1512232109980	5	521@mail.ru	8dbbfd7ff1c31ba6176452022166b3f2c320ea08	\N	\N	\N	\N
531	1512233404299	5	531@mail.ru	79a3a184acb50513718d865235154fd6872f63a6	\N	\N	\N	\N
565	1513416700092	5	no@nkagent.ru	a54588983f579439706357c056b68e1bec9cc269	\N	\N	\N	\N
499	1512227471335	5	500@mail.ru	53a5482ffa75361dc118b19e25b976b92fefaba7	\N	\N	\N	\N
566	1513720284167	5	565@mail.ru	c7795c5b9718d2ea021b8555d651a59abbb19ca8	\N	\N	\N	\N
488	1512224319830	5	488@mail.ru	5095661db529c537d552d7cb7124c0cc3d7542c4	\N	\N	\N	\N
497	1512226793120	5	tanzilk@mail.ru	9ee353159da1e82a2a0943886ddcc99e243927c4	\N	\N	\N	\N
552	1512648613468	5	552@mail.ru	175b2a79eb8303fcf0da0854a8d5d3618c48159c	\N	\N	\N	\N
451	1512215875523	5	tihonatal@mail.ru	3d284e5f23661a42f6611976d6b2fbb355819297	\N	\N	\N	\N
475	1512222291657	5	vaneek.85@mail.ru	553978878cd3f287449d74d0dddaa05cd3be56a3	\N	\N	\N	\N
479	1512222861063	5	479@mail.ru	61c8612c10b7298e3e1663c6993f239d09624247	\N	\N	\N	\N
492	1512224739834	5	vetachka@list.ru	001b81e37cbc52578a08256378f66aa7a53970c7	\N	\N	\N	\N
427	1512211310087	5	orlova-stos@mail.ru	3bf1b356ce93a2cf6450ef2cc85931565b12b42d	\N	\N	\N	\N
520	1512232040864	5	alinaford@mail.ru	f3e23eddf96529423df5e932e6a7e16bfca8d896	\N	\N	\N	\N
568	1513745680410	5	Sufiyarov_ig@mail.ru	5d0b626a8224a02ba06050fedfaae895205c24d6	\N	\N	\N	\N
489	1512224466417	5	Leisantauhida@mail.ru	48d46c32f7db6f007886b83acc35701b1149daef	\N	\N	\N	\N
410	1512204151726	5	9198006060@mail.ru	93c8b9a37a24a7c5623bbfc89ed13df0507672e9	\N	\N	\N	\N
557	1512656482493	5	557@mail.ru	c3a2958141e7c07ede5f66504c99279d15b7efc1	\N	\N	\N	\N
506	1512228506219	5	degtyareva.valya@inbox.ru	dbdcff7b4649a6e9ad85c6a930d17c20e0361e3b	\N	\N	\N	\N
507	1512228707052	5	ravik19682@mail.ru	922a99ce7d24ea4059d5331c5b935640dfbd84ee	\N	\N	\N	\N
544	1512506390133	5	544@mail.ru	eaad4693f6eeb54130db630539b35d8053f8c741	\N	\N	\N	\N
575	1517656253715	5	575@mail.ru	c09de42a2e378e99938b3685b4f9762208e26b79	\N	\N	\N	\N
576	1517663205729	5	nk.olimp@mail.ru	a54588983f579439706357c056b68e1bec9cc269	\N	\N	\N	47
578	1518076428439	\N	mail@nkagent.ru	a54588983f579439706357c056b68e1bec9cc269	\N	\N	\N	\N
1	1489951722156	\N	14abcd17@mail.ru	a54588983f579439706357c056b68e1bec9cc269	\N	\N	139	1
470	1512221439466	5	rita.efimova1964@mail.ru	142a02614f50de2926a404649352f26d212286b9	\N	\N	\N	\N
577	1517724612361	5	fiktoriy1@mail.ru	6a28b694995321812aefb814ec2c26cdb0bb3eaf	\N	\N	\N	\N
351	1501209737683	5	elmira-asu@yandex.ru	503567bafc4e4cc214d7ea3bbb72a900accdbf30	\N	\N	116	\N
\.


--
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: nkagent
--

SELECT pg_catalog.setval('users_id_user_seq', 578, true);


--
-- Name: agency_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY agency
    ADD CONSTRAINT agency_pkey PRIMARY KEY (id_agency);


--
-- Name: apartment_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY apartment
    ADD CONSTRAINT apartment_pkey PRIMARY KEY (id_apartment);


--
-- Name: article_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id_article);


--
-- Name: article_reject_node_id_key; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY article_reject
    ADD CONSTRAINT article_reject_node_id_key UNIQUE (node_id);


--
-- Name: blockandsection_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY blockandsection
    ADD CONSTRAINT blockandsection_pkey PRIMARY KEY (id_blockandsection);


--
-- Name: category_land_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY category_land
    ADD CONSTRAINT category_land_pkey PRIMARY KEY (id_category_land);


--
-- Name: city_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id_city);


--
-- Name: commercial_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY commercial
    ADD CONSTRAINT commercial_pkey PRIMARY KEY (id_commercial);


--
-- Name: cottages_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY cottages
    ADD CONSTRAINT cottages_pkey PRIMARY KEY (id_cottages);


--
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: district_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id_district);


--
-- Name: districts_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id_districts);


--
-- Name: labelandtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY labelandtemplate
    ADD CONSTRAINT labelandtemplate_pkey PRIMARY KEY (id_labelandtemplate);


--
-- Name: layerandblock_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY layerandblock
    ADD CONSTRAINT layerandblock_pkey PRIMARY KEY (id_layerandblock);


--
-- Name: login_email_key; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY login
    ADD CONSTRAINT login_email_key UNIQUE (email);


--
-- Name: material_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id_material);


--
-- Name: metro_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY metro
    ADD CONSTRAINT metro_pkey PRIMARY KEY (id_metro);


--
-- Name: node_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY node
    ADD CONSTRAINT node_pkey PRIMARY KEY (id);


--
-- Name: parser_commercial_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY parser_commercial
    ADD CONSTRAINT parser_commercial_pkey PRIMARY KEY (id);


--
-- Name: parser_cottages_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY parser_cottages
    ADD CONSTRAINT parser_cottages_pkey PRIMARY KEY (id);


--
-- Name: parser_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY parser
    ADD CONSTRAINT parser_pkey PRIMARY KEY (id);


--
-- Name: permit_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT permit_pkey PRIMARY KEY (id_permit);


--
-- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id_project);


--
-- Name: region_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id_region);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);


--
-- Name: sectionandtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY sectionandtemplate
    ADD CONSTRAINT sectionandtemplate_pkey PRIMARY KEY (id_sectionandtemplate);


--
-- Name: session_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: sql_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY sql
    ADD CONSTRAINT sql_pkey PRIMARY KEY (id_sql);


--
-- Name: street_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY street
    ADD CONSTRAINT street_pkey PRIMARY KEY (id_street);


--
-- Name: temporarily_users_userdata_id_user_key; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY temporarily_users_userdata
    ADD CONSTRAINT temporarily_users_userdata_id_user_key UNIQUE (id_user);


--
-- Name: toilet_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY toilet
    ADD CONSTRAINT toilet_pkey PRIMARY KEY (id_toilet);


--
-- Name: userdata_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY userdata
    ADD CONSTRAINT userdata_pkey PRIMARY KEY (id_userdata);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: nkagent; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- Name: agency_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY agency
    ADD CONSTRAINT agency_node_id_fkey FOREIGN KEY (node_id) REFERENCES node(id) ON DELETE CASCADE;


--
-- Name: apartment_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY apartment
    ADD CONSTRAINT apartment_node_id_fkey FOREIGN KEY (node_id) REFERENCES node(id) ON DELETE CASCADE;


--
-- Name: article_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY article
    ADD CONSTRAINT article_node_id_fkey FOREIGN KEY (node_id) REFERENCES node(id) ON DELETE CASCADE;


--
-- Name: commercial_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY commercial
    ADD CONSTRAINT commercial_node_id_fkey FOREIGN KEY (node_id) REFERENCES node(id) ON DELETE CASCADE;


--
-- Name: cottages_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nkagent
--

ALTER TABLE ONLY cottages
    ADD CONSTRAINT cottages_node_id_fkey FOREIGN KEY (node_id) REFERENCES node(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

