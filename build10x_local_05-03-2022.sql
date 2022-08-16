--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.2

-- Started on 2022-03-05 17:09:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 40847)
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 40853)
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 201
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- TOC entry 202 (class 1259 OID 40855)
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_links (
    permission_id integer,
    role_id integer
);


ALTER TABLE public.admin_permissions_role_links OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 40858)
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 40864)
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO postgres;

--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 204
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- TOC entry 205 (class 1259 OID 40866)
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 40872)
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 206
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- TOC entry 207 (class 1259 OID 40874)
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_links (
    user_id integer,
    role_id integer
);


ALTER TABLE public.admin_users_roles_links OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 40877)
-- Name: annotations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotations (
    id integer NOT NULL,
    name character varying(255),
    grid_id character varying(255),
    comments text,
    x_coordinate double precision,
    y_coordinate double precision,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.annotations OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 40883)
-- Name: annotations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotations_id_seq OWNER TO postgres;

--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 209
-- Name: annotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotations_id_seq OWNED BY public.annotations.id;


--
-- TOC entry 210 (class 1259 OID 40885)
-- Name: elevations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elevations (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    project_id integer,
    grid_rows integer,
    grid_columns integer,
    image_path character varying(255)
);


ALTER TABLE public.elevations OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 40891)
-- Name: elevations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.elevations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elevations_id_seq OWNER TO postgres;

--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 211
-- Name: elevations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.elevations_id_seq OWNED BY public.elevations.id;


--
-- TOC entry 212 (class 1259 OID 40893)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 40899)
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 213
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- TOC entry 214 (class 1259 OID 40901)
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_morphs (
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer
);


ALTER TABLE public.files_related_morphs OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 40907)
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 40913)
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO postgres;

--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 216
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- TOC entry 217 (class 1259 OID 40915)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(255),
    company character varying(255),
    type integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    project_address text,
    building_address text,
    bin character varying(255),
    block character varying(255),
    ct character varying(255),
    lot character varying(255),
    consulting_firm character varying(255),
    project_date date,
    project_time time without time zone,
    inspector_id integer,
    image_path character varying(255),
    api_created_by_id integer
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 40921)
-- Name: projects_api_created_by_user_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_api_created_by_user_links (
    project_id integer,
    user_id integer
);


ALTER TABLE public.projects_api_created_by_user_links OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 40924)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 219
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 220 (class 1259 OID 40926)
-- Name: projects_inspector_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_inspector_links (
    project_id integer,
    user_id integer
);


ALTER TABLE public.projects_inspector_links OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 40929)
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 40935)
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 222
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- TOC entry 223 (class 1259 OID 40937)
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 40943)
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 224
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- TOC entry 225 (class 1259 OID 40945)
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 40951)
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 226
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- TOC entry 227 (class 1259 OID 40953)
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 40956)
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 228
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- TOC entry 229 (class 1259 OID 40958)
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 40964)
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 230
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- TOC entry 231 (class 1259 OID 40966)
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 40969)
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 232
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- TOC entry 233 (class 1259 OID 40971)
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_links (
    permission_id integer,
    role_id integer
);


ALTER TABLE public.up_permissions_role_links OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 40974)
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 40980)
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO postgres;

--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 235
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- TOC entry 236 (class 1259 OID 40982)
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    chief_inspector_id bigint,
    name character varying(255),
    mobile character varying(255)
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 41268)
-- Name: up_users_chief_inspector_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_chief_inspector_links (
    user_id integer,
    inv_user_id integer
);


ALTER TABLE public.up_users_chief_inspector_links OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 40988)
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO postgres;

--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 237
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- TOC entry 238 (class 1259 OID 40990)
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_links (
    user_id integer,
    role_id integer
);


ALTER TABLE public.up_users_role_links OWNER TO postgres;

--
-- TOC entry 2987 (class 2604 OID 40993)
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- TOC entry 2988 (class 2604 OID 40994)
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- TOC entry 2989 (class 2604 OID 40995)
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- TOC entry 2990 (class 2604 OID 40996)
-- Name: annotations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotations ALTER COLUMN id SET DEFAULT nextval('public.annotations_id_seq'::regclass);


--
-- TOC entry 2991 (class 2604 OID 40997)
-- Name: elevations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevations ALTER COLUMN id SET DEFAULT nextval('public.elevations_id_seq'::regclass);


--
-- TOC entry 2992 (class 2604 OID 40998)
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- TOC entry 2993 (class 2604 OID 40999)
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- TOC entry 2994 (class 2604 OID 41000)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 2995 (class 2604 OID 41001)
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- TOC entry 2996 (class 2604 OID 41002)
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- TOC entry 2997 (class 2604 OID 41003)
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- TOC entry 2998 (class 2604 OID 41004)
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- TOC entry 2999 (class 2604 OID 41005)
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- TOC entry 3000 (class 2604 OID 41006)
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- TOC entry 3001 (class 2604 OID 41007)
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- TOC entry 3002 (class 2604 OID 41008)
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- TOC entry 3243 (class 0 OID 40847)
-- Dependencies: 200
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_permissions VALUES (1, 'plugin::upload.read', NULL, '{}', '[]', '2022-02-05 18:30:11.643', '2022-02-05 18:30:11.643', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (2, 'plugin::upload.assets.create', NULL, '{}', '[]', '2022-02-05 18:30:11.656', '2022-02-05 18:30:11.656', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (3, 'plugin::upload.assets.update', NULL, '{}', '[]', '2022-02-05 18:30:11.661', '2022-02-05 18:30:11.661', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (4, 'plugin::upload.assets.download', NULL, '{}', '[]', '2022-02-05 18:30:11.666', '2022-02-05 18:30:11.666', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (5, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2022-02-05 18:30:11.668', '2022-02-05 18:30:11.668', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (6, 'plugin::upload.read', NULL, '{}', '["admin::is-creator"]', '2022-02-05 18:30:11.671', '2022-02-05 18:30:11.671', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (7, 'plugin::upload.assets.create', NULL, '{}', '[]', '2022-02-05 18:30:11.674', '2022-02-05 18:30:11.674', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (8, 'plugin::upload.assets.update', NULL, '{}', '["admin::is-creator"]', '2022-02-05 18:30:11.677', '2022-02-05 18:30:11.677', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (9, 'plugin::upload.assets.download', NULL, '{}', '[]', '2022-02-05 18:30:11.68', '2022-02-05 18:30:11.68', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (10, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2022-02-05 18:30:11.682', '2022-02-05 18:30:11.682', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (14, 'plugin::content-manager.explorer.delete', 'plugin::users-permissions.user', '{}', '[]', '2022-02-05 18:30:11.715', '2022-02-05 18:30:11.715', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (15, 'plugin::content-manager.single-types.configure-view', NULL, '{}', '[]', '2022-02-05 18:30:11.717', '2022-02-05 18:30:11.717', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (16, 'plugin::content-manager.collection-types.configure-view', NULL, '{}', '[]', '2022-02-05 18:30:11.72', '2022-02-05 18:30:11.72', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (17, 'plugin::content-manager.components.configure-layout', NULL, '{}', '[]', '2022-02-05 18:30:11.722', '2022-02-05 18:30:11.722', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (18, 'plugin::content-type-builder.read', NULL, '{}', '[]', '2022-02-05 18:30:11.725', '2022-02-05 18:30:11.725', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (19, 'plugin::email.settings.read', NULL, '{}', '[]', '2022-02-05 18:30:11.727', '2022-02-05 18:30:11.727', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (20, 'plugin::upload.read', NULL, '{}', '[]', '2022-02-05 18:30:11.73', '2022-02-05 18:30:11.73', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (21, 'plugin::upload.assets.create', NULL, '{}', '[]', '2022-02-05 18:30:11.733', '2022-02-05 18:30:11.733', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (22, 'plugin::upload.assets.update', NULL, '{}', '[]', '2022-02-05 18:30:11.738', '2022-02-05 18:30:11.738', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (23, 'plugin::upload.assets.download', NULL, '{}', '[]', '2022-02-05 18:30:11.741', '2022-02-05 18:30:11.741', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (24, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2022-02-05 18:30:11.743', '2022-02-05 18:30:11.743', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (25, 'plugin::upload.settings.read', NULL, '{}', '[]', '2022-02-05 18:30:11.746', '2022-02-05 18:30:11.746', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (26, 'plugin::users-permissions.roles.create', NULL, '{}', '[]', '2022-02-05 18:30:11.749', '2022-02-05 18:30:11.749', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (27, 'plugin::users-permissions.roles.read', NULL, '{}', '[]', '2022-02-05 18:30:11.751', '2022-02-05 18:30:11.751', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (28, 'plugin::users-permissions.roles.update', NULL, '{}', '[]', '2022-02-05 18:30:11.754', '2022-02-05 18:30:11.754', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (29, 'plugin::users-permissions.roles.delete', NULL, '{}', '[]', '2022-02-05 18:30:11.756', '2022-02-05 18:30:11.756', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (30, 'plugin::users-permissions.providers.read', NULL, '{}', '[]', '2022-02-05 18:30:11.759', '2022-02-05 18:30:11.759', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (31, 'plugin::users-permissions.providers.update', NULL, '{}', '[]', '2022-02-05 18:30:11.761', '2022-02-05 18:30:11.761', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (32, 'plugin::users-permissions.email-templates.read', NULL, '{}', '[]', '2022-02-05 18:30:11.763', '2022-02-05 18:30:11.763', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (33, 'plugin::users-permissions.email-templates.update', NULL, '{}', '[]', '2022-02-05 18:30:11.766', '2022-02-05 18:30:11.766', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (34, 'plugin::users-permissions.advanced-settings.read', NULL, '{}', '[]', '2022-02-05 18:30:11.768', '2022-02-05 18:30:11.768', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (35, 'plugin::users-permissions.advanced-settings.update', NULL, '{}', '[]', '2022-02-05 18:30:11.771', '2022-02-05 18:30:11.771', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (36, 'plugin::i18n.locale.create', NULL, '{}', '[]', '2022-02-05 18:30:11.773', '2022-02-05 18:30:11.773', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (37, 'plugin::i18n.locale.read', NULL, '{}', '[]', '2022-02-05 18:30:11.776', '2022-02-05 18:30:11.776', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (38, 'plugin::i18n.locale.update', NULL, '{}', '[]', '2022-02-05 18:30:11.779', '2022-02-05 18:30:11.779', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (39, 'plugin::i18n.locale.delete', NULL, '{}', '[]', '2022-02-05 18:30:11.782', '2022-02-05 18:30:11.782', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (40, 'admin::marketplace.read', NULL, '{}', '[]', '2022-02-05 18:30:11.784', '2022-02-05 18:30:11.784', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (41, 'admin::marketplace.plugins.install', NULL, '{}', '[]', '2022-02-05 18:30:11.787', '2022-02-05 18:30:11.787', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (42, 'admin::marketplace.plugins.uninstall', NULL, '{}', '[]', '2022-02-05 18:30:11.789', '2022-02-05 18:30:11.789', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (43, 'admin::webhooks.create', NULL, '{}', '[]', '2022-02-05 18:30:11.792', '2022-02-05 18:30:11.792', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (44, 'admin::webhooks.read', NULL, '{}', '[]', '2022-02-05 18:30:11.795', '2022-02-05 18:30:11.795', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (45, 'admin::webhooks.update', NULL, '{}', '[]', '2022-02-05 18:30:11.798', '2022-02-05 18:30:11.798', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (46, 'admin::webhooks.delete', NULL, '{}', '[]', '2022-02-05 18:30:11.801', '2022-02-05 18:30:11.801', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (47, 'admin::users.create', NULL, '{}', '[]', '2022-02-05 18:30:11.803', '2022-02-05 18:30:11.803', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (48, 'admin::users.read', NULL, '{}', '[]', '2022-02-05 18:30:11.806', '2022-02-05 18:30:11.806', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (49, 'admin::users.update', NULL, '{}', '[]', '2022-02-05 18:30:11.808', '2022-02-05 18:30:11.808', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (50, 'admin::users.delete', NULL, '{}', '[]', '2022-02-05 18:30:11.81', '2022-02-05 18:30:11.81', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (51, 'admin::roles.create', NULL, '{}', '[]', '2022-02-05 18:30:11.813', '2022-02-05 18:30:11.813', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (52, 'admin::roles.read', NULL, '{}', '[]', '2022-02-05 18:30:11.815', '2022-02-05 18:30:11.815', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (53, 'admin::roles.update', NULL, '{}', '[]', '2022-02-05 18:30:11.818', '2022-02-05 18:30:11.818', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (54, 'admin::roles.delete', NULL, '{}', '[]', '2022-02-05 18:30:11.82', '2022-02-05 18:30:11.82', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (55, 'admin::api-tokens.create', NULL, '{}', '[]', '2022-02-05 18:30:11.824', '2022-02-05 18:30:11.824', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (56, 'admin::api-tokens.read', NULL, '{}', '[]', '2022-02-05 18:30:11.826', '2022-02-05 18:30:11.826', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (57, 'admin::api-tokens.update', NULL, '{}', '[]', '2022-02-05 18:30:11.829', '2022-02-05 18:30:11.829', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (58, 'admin::api-tokens.delete', NULL, '{}', '[]', '2022-02-05 18:30:11.832', '2022-02-05 18:30:11.832', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (62, 'plugin::content-manager.explorer.delete', 'api::project.project', '{}', '[]', '2022-02-05 18:35:43.614', '2022-02-05 18:35:43.614', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (66, 'plugin::content-manager.explorer.delete', 'api::elevation.elevation', '{}', '[]', '2022-02-05 18:37:08.193', '2022-02-05 18:37:08.193', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (73, 'plugin::content-manager.explorer.create', 'api::annotation.annotation', '{"fields": ["Name", "GridId", "Comments", "XCoordinate", "YCoordinate", "Attachment"]}', '[]', '2022-02-05 18:40:41.978', '2022-02-05 18:40:41.978', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (74, 'plugin::content-manager.explorer.read', 'api::annotation.annotation', '{"fields": ["Name", "GridId", "Comments", "XCoordinate", "YCoordinate", "Attachment"]}', '[]', '2022-02-05 18:40:41.986', '2022-02-05 18:40:41.986', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (75, 'plugin::content-manager.explorer.update', 'api::annotation.annotation', '{"fields": ["Name", "GridId", "Comments", "XCoordinate", "YCoordinate", "Attachment"]}', '[]', '2022-02-05 18:40:41.989', '2022-02-05 18:40:41.989', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (76, 'plugin::content-manager.explorer.delete', 'api::annotation.annotation', '{}', '[]', '2022-02-05 18:40:41.992', '2022-02-05 18:40:41.992', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (83, 'plugin::content-manager.explorer.create', 'api::elevation.elevation', '{"fields": ["Name", "Image", "ProjectId", "GridRows", "GridColumns", "ImagePath"]}', '[]', '2022-02-13 12:37:16.665', '2022-02-13 12:37:16.665', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (84, 'plugin::content-manager.explorer.read', 'api::elevation.elevation', '{"fields": ["Name", "Image", "ProjectId", "GridRows", "GridColumns", "ImagePath"]}', '[]', '2022-02-13 12:37:16.671', '2022-02-13 12:37:16.671', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (85, 'plugin::content-manager.explorer.update', 'api::elevation.elevation', '{"fields": ["Name", "Image", "ProjectId", "GridRows", "GridColumns", "ImagePath"]}', '[]', '2022-02-13 12:37:16.674', '2022-02-13 12:37:16.674', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (89, 'plugin::documentation.read', NULL, '{}', '[]', '2022-02-17 21:16:43.75', '2022-02-17 21:16:43.75', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (90, 'plugin::documentation.settings.update', NULL, '{}', '[]', '2022-02-17 21:16:43.763', '2022-02-17 21:16:43.763', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (91, 'plugin::documentation.settings.regenerate', NULL, '{}', '[]', '2022-02-17 21:16:43.767', '2022-02-17 21:16:43.767', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (92, 'plugin::documentation.settings.read', NULL, '{}', '[]', '2022-02-17 21:16:43.771', '2022-02-17 21:16:43.771', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (93, 'plugin::content-manager.explorer.create', 'api::project.project', '{"fields": ["Name", "Company", "Type", "ProjectAddress", "BuildingAddress", "BIN", "Block", "CT", "LOT", "ConsultingFirm", "ProjectDate", "ProjectTime", "Inspector", "InspectorId", "ImagePath", "APICreatedById", "APICreatedByUser"]}', '[]', '2022-02-22 16:20:32.478', '2022-02-22 16:20:32.478', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (94, 'plugin::content-manager.explorer.read', 'api::project.project', '{"fields": ["Name", "Company", "Type", "ProjectAddress", "BuildingAddress", "BIN", "Block", "CT", "LOT", "ConsultingFirm", "ProjectDate", "ProjectTime", "Inspector", "InspectorId", "ImagePath", "APICreatedById", "APICreatedByUser"]}', '[]', '2022-02-22 16:20:32.487', '2022-02-22 16:20:32.487', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (95, 'plugin::content-manager.explorer.update', 'api::project.project', '{"fields": ["Name", "Company", "Type", "ProjectAddress", "BuildingAddress", "BIN", "Block", "CT", "LOT", "ConsultingFirm", "ProjectDate", "ProjectTime", "Inspector", "InspectorId", "ImagePath", "APICreatedById", "APICreatedByUser"]}', '[]', '2022-02-22 16:20:32.491', '2022-02-22 16:20:32.491', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (102, 'plugin::content-manager.explorer.create', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "chief_inspector_id", "chief_inspector", "name", "mobile"]}', '[]', '2022-03-05 12:21:12.705', '2022-03-05 12:21:12.705', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (103, 'plugin::content-manager.explorer.read', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "chief_inspector_id", "chief_inspector", "name", "mobile"]}', '[]', '2022-03-05 12:21:12.71', '2022-03-05 12:21:12.71', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (104, 'plugin::content-manager.explorer.update', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "chief_inspector_id", "chief_inspector", "name", "mobile"]}', '[]', '2022-03-05 12:21:12.712', '2022-03-05 12:21:12.712', NULL, NULL);


--
-- TOC entry 3245 (class 0 OID 40855)
-- Dependencies: 202
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_permissions_role_links VALUES (1, 2);
INSERT INTO public.admin_permissions_role_links VALUES (2, 2);
INSERT INTO public.admin_permissions_role_links VALUES (3, 2);
INSERT INTO public.admin_permissions_role_links VALUES (4, 2);
INSERT INTO public.admin_permissions_role_links VALUES (5, 2);
INSERT INTO public.admin_permissions_role_links VALUES (6, 3);
INSERT INTO public.admin_permissions_role_links VALUES (7, 3);
INSERT INTO public.admin_permissions_role_links VALUES (8, 3);
INSERT INTO public.admin_permissions_role_links VALUES (9, 3);
INSERT INTO public.admin_permissions_role_links VALUES (10, 3);
INSERT INTO public.admin_permissions_role_links VALUES (14, 1);
INSERT INTO public.admin_permissions_role_links VALUES (15, 1);
INSERT INTO public.admin_permissions_role_links VALUES (16, 1);
INSERT INTO public.admin_permissions_role_links VALUES (17, 1);
INSERT INTO public.admin_permissions_role_links VALUES (18, 1);
INSERT INTO public.admin_permissions_role_links VALUES (19, 1);
INSERT INTO public.admin_permissions_role_links VALUES (20, 1);
INSERT INTO public.admin_permissions_role_links VALUES (21, 1);
INSERT INTO public.admin_permissions_role_links VALUES (22, 1);
INSERT INTO public.admin_permissions_role_links VALUES (23, 1);
INSERT INTO public.admin_permissions_role_links VALUES (24, 1);
INSERT INTO public.admin_permissions_role_links VALUES (25, 1);
INSERT INTO public.admin_permissions_role_links VALUES (26, 1);
INSERT INTO public.admin_permissions_role_links VALUES (27, 1);
INSERT INTO public.admin_permissions_role_links VALUES (28, 1);
INSERT INTO public.admin_permissions_role_links VALUES (29, 1);
INSERT INTO public.admin_permissions_role_links VALUES (30, 1);
INSERT INTO public.admin_permissions_role_links VALUES (31, 1);
INSERT INTO public.admin_permissions_role_links VALUES (32, 1);
INSERT INTO public.admin_permissions_role_links VALUES (33, 1);
INSERT INTO public.admin_permissions_role_links VALUES (34, 1);
INSERT INTO public.admin_permissions_role_links VALUES (35, 1);
INSERT INTO public.admin_permissions_role_links VALUES (36, 1);
INSERT INTO public.admin_permissions_role_links VALUES (37, 1);
INSERT INTO public.admin_permissions_role_links VALUES (38, 1);
INSERT INTO public.admin_permissions_role_links VALUES (39, 1);
INSERT INTO public.admin_permissions_role_links VALUES (40, 1);
INSERT INTO public.admin_permissions_role_links VALUES (41, 1);
INSERT INTO public.admin_permissions_role_links VALUES (42, 1);
INSERT INTO public.admin_permissions_role_links VALUES (43, 1);
INSERT INTO public.admin_permissions_role_links VALUES (44, 1);
INSERT INTO public.admin_permissions_role_links VALUES (45, 1);
INSERT INTO public.admin_permissions_role_links VALUES (46, 1);
INSERT INTO public.admin_permissions_role_links VALUES (47, 1);
INSERT INTO public.admin_permissions_role_links VALUES (48, 1);
INSERT INTO public.admin_permissions_role_links VALUES (49, 1);
INSERT INTO public.admin_permissions_role_links VALUES (50, 1);
INSERT INTO public.admin_permissions_role_links VALUES (51, 1);
INSERT INTO public.admin_permissions_role_links VALUES (52, 1);
INSERT INTO public.admin_permissions_role_links VALUES (53, 1);
INSERT INTO public.admin_permissions_role_links VALUES (54, 1);
INSERT INTO public.admin_permissions_role_links VALUES (55, 1);
INSERT INTO public.admin_permissions_role_links VALUES (56, 1);
INSERT INTO public.admin_permissions_role_links VALUES (57, 1);
INSERT INTO public.admin_permissions_role_links VALUES (58, 1);
INSERT INTO public.admin_permissions_role_links VALUES (62, 1);
INSERT INTO public.admin_permissions_role_links VALUES (66, 1);
INSERT INTO public.admin_permissions_role_links VALUES (73, 1);
INSERT INTO public.admin_permissions_role_links VALUES (74, 1);
INSERT INTO public.admin_permissions_role_links VALUES (75, 1);
INSERT INTO public.admin_permissions_role_links VALUES (76, 1);
INSERT INTO public.admin_permissions_role_links VALUES (83, 1);
INSERT INTO public.admin_permissions_role_links VALUES (84, 1);
INSERT INTO public.admin_permissions_role_links VALUES (85, 1);
INSERT INTO public.admin_permissions_role_links VALUES (89, 1);
INSERT INTO public.admin_permissions_role_links VALUES (90, 1);
INSERT INTO public.admin_permissions_role_links VALUES (91, 1);
INSERT INTO public.admin_permissions_role_links VALUES (92, 1);
INSERT INTO public.admin_permissions_role_links VALUES (93, 1);
INSERT INTO public.admin_permissions_role_links VALUES (94, 1);
INSERT INTO public.admin_permissions_role_links VALUES (95, 1);
INSERT INTO public.admin_permissions_role_links VALUES (102, 1);
INSERT INTO public.admin_permissions_role_links VALUES (103, 1);
INSERT INTO public.admin_permissions_role_links VALUES (104, 1);


--
-- TOC entry 3246 (class 0 OID 40858)
-- Dependencies: 203
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_roles VALUES (1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2022-02-05 18:30:11.62', '2022-02-05 18:30:11.62', NULL, NULL);
INSERT INTO public.admin_roles VALUES (2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2022-02-05 18:30:11.635', '2022-02-05 18:30:11.635', NULL, NULL);
INSERT INTO public.admin_roles VALUES (3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2022-02-05 18:30:11.638', '2022-02-05 18:30:11.638', NULL, NULL);


--
-- TOC entry 3248 (class 0 OID 40866)
-- Dependencies: 205
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_users VALUES (1, 'Build', '10x', NULL, 'hello@citrusleaf.in', '$2a$10$DDHazisQZNUQvTV0SDh2FeOfS7kRksYKFFyCDS5iOl7yPjK/Lp0gK', NULL, NULL, true, false, NULL, '2022-02-05 18:30:23.228', '2022-02-05 18:30:23.228', NULL, NULL);


--
-- TOC entry 3250 (class 0 OID 40874)
-- Dependencies: 207
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_users_roles_links VALUES (1, 1);


--
-- TOC entry 3251 (class 0 OID 40877)
-- Dependencies: 208
-- Data for Name: annotations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3253 (class 0 OID 40885)
-- Dependencies: 210
-- Data for Name: elevations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3255 (class 0 OID 40893)
-- Dependencies: 212
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3257 (class 0 OID 40901)
-- Dependencies: 214
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3258 (class 0 OID 40907)
-- Dependencies: 215
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.i18n_locale VALUES (1, 'English (en)', 'en', '2022-02-05 18:30:11.542', '2022-02-05 18:30:11.542', NULL, NULL);


--
-- TOC entry 3260 (class 0 OID 40915)
-- Dependencies: 217
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.projects VALUES (10, 'Spencer, Hodkiewicz and Trantow', 'Ledner, Gulgowski and Schmitt', 1, '2022-02-22 12:58:28.137', '2022-02-22 12:58:28.137', NULL, NULL, '3295 Cormier Road', '7672 Rafaela Road', '27256', '57987', '49286', '76753', 'Aufderhar - Windler', '2022-02-22', '21:00:00', 2, 'projects/new-year.png', NULL);
INSERT INTO public.projects VALUES (11, 'Senger - Kozey', 'Gleason - Roberts', 1, '2022-02-22 13:38:03.443', '2022-02-22 13:38:03.443', NULL, NULL, '90542 Lexus Manors', '2704 Carol Underpass', '5637', '7593', '57185', '35357', 'Mertz, Hettinger and Purdy', '2022-02-22', '18:00:00', 2, NULL, NULL);
INSERT INTO public.projects VALUES (12, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 15:19:01.959', '2022-02-22 15:19:01.959', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', NULL);
INSERT INTO public.projects VALUES (13, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:28:22.643', '2022-02-22 16:28:22.643', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', NULL);
INSERT INTO public.projects VALUES (14, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:38:16.828', '2022-02-22 16:38:16.828', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', NULL);
INSERT INTO public.projects VALUES (15, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:38:27.428', '2022-02-22 16:38:27.428', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', NULL);
INSERT INTO public.projects VALUES (16, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:39:41.991', '2022-02-22 16:39:41.991', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 1);
INSERT INTO public.projects VALUES (17, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:40:14.407', '2022-02-22 16:40:14.407', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 1);
INSERT INTO public.projects VALUES (18, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:42:12.387', '2022-02-22 16:42:12.387', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 1);
INSERT INTO public.projects VALUES (19, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:45:03.197', '2022-02-22 16:45:17.372', NULL, 1, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 2);
INSERT INTO public.projects VALUES (20, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:49:54.235', '2022-02-22 16:49:54.235', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 1);
INSERT INTO public.projects VALUES (21, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:50:08.249', '2022-02-22 16:50:08.249', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 2);
INSERT INTO public.projects VALUES (22, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:53:24.149', '2022-02-22 16:53:24.149', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 2);
INSERT INTO public.projects VALUES (23, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:53:41.689', '2022-02-22 16:53:41.706', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 2);
INSERT INTO public.projects VALUES (25, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:55:37.86', '2022-02-22 16:55:39.348', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 2);
INSERT INTO public.projects VALUES (26, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:56:28.942', '2022-02-22 16:56:30.439', NULL, NULL, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 2);
INSERT INTO public.projects VALUES (24, 'Reichel Inc', 'Parker Group', 1, '2022-02-22 16:54:25.551', '2022-02-23 17:26:29.717', NULL, 1, '4957 Schmitt Via', '662 Dejah Street', '84847', '22496', '33657', '28315', 'Corkery and Sons', '2022-02-22', '21:00:00', 2, '/projects/abcd.png', 2);
INSERT INTO public.projects VALUES (27, 'Hoppe LLC', 'Prosacco and Sons', 1, '2022-03-05 15:26:57.767', '2022-03-05 15:26:57.79', NULL, NULL, '82250 Wunsch Mountain', '85887 Balistreri Forks', '41033', '34862', '93645', '39150', 'Ziemann - Wyman', '2022-03-05', '18:00:00', 2, NULL, NULL);


--
-- TOC entry 3261 (class 0 OID 40921)
-- Dependencies: 218
-- Data for Name: projects_api_created_by_user_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.projects_api_created_by_user_links VALUES (19, 1);
INSERT INTO public.projects_api_created_by_user_links VALUES (25, 2);
INSERT INTO public.projects_api_created_by_user_links VALUES (26, 2);
INSERT INTO public.projects_api_created_by_user_links VALUES (24, 1);


--
-- TOC entry 3263 (class 0 OID 40926)
-- Dependencies: 220
-- Data for Name: projects_inspector_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.projects_inspector_links VALUES (26, 2);
INSERT INTO public.projects_inspector_links VALUES (27, 2);


--
-- TOC entry 3264 (class 0 OID 40929)
-- Dependencies: 221
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3266 (class 0 OID 40937)
-- Dependencies: 223
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.strapi_core_store_settings VALUES (2, 'plugin_content_manager_configuration_content_types::admin::role', '{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"Users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"editRelations":["users","permissions"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (3, 'plugin_content_manager_configuration_content_types::admin::api-token', '{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"AccessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AccessKey","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (4, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission', '{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"editRelations":["role"],"edit":[[{"name":"action","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (5, 'plugin_content_manager_configuration_content_types::plugin::upload.file', '{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"AlternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AlternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"Caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"Width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Width","searchable":true,"sortable":true}},"height":{"edit":{"label":"Height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"Formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"Hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"Ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"Mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"Size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Size","searchable":true,"sortable":true}},"url":{"edit":{"label":"Url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"PreviewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreviewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"Provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider_metadata","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (6, 'plugin_content_manager_configuration_content_types::admin::permission', '{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"Subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"Properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"Conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"editRelations":["role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (1, 'strapi_content_types_schema', '{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access"],"configurable":false,"required":false,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access"],"configurable":false,"required":false,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"api::annotation.annotation":{"kind":"collectionType","collectionName":"annotations","info":{"singularName":"annotation","pluralName":"annotations","displayName":"Annotation"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"Name":{"type":"string","required":true},"GridId":{"type":"string","required":true},"Comments":{"type":"text","required":false},"XCoordinate":{"type":"float","required":true},"YCoordinate":{"type":"float","unique":false,"required":true},"Attachment":{"allowedTypes":["images","files","videos"],"type":"media","multiple":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"annotations","info":{"singularName":"annotation","pluralName":"annotations","displayName":"Annotation"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"Name":{"type":"string","required":true},"GridId":{"type":"string","required":true},"Comments":{"type":"text","required":false},"XCoordinate":{"type":"float","required":true},"YCoordinate":{"type":"float","unique":false,"required":true},"Attachment":{"allowedTypes":["images","files","videos"],"type":"media","multiple":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"annotation","connection":"default","uid":"api::annotation.annotation","apiName":"annotation","globalId":"Annotation","actions":{},"lifecycles":{}},"api::elevation.elevation":{"kind":"collectionType","collectionName":"elevations","info":{"singularName":"elevation","pluralName":"elevations","displayName":"Elevation","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"Name":{"type":"string"},"Image":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos"]},"ProjectId":{"type":"integer","required":true},"GridRows":{"type":"integer","required":true},"GridColumns":{"type":"integer","required":true},"ImagePath":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"elevations","info":{"singularName":"elevation","pluralName":"elevations","displayName":"Elevation","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"Name":{"type":"string"},"Image":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos"]},"ProjectId":{"type":"integer","required":true},"GridRows":{"type":"integer","required":true},"GridColumns":{"type":"integer","required":true},"ImagePath":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"elevation","connection":"default","uid":"api::elevation.elevation","apiName":"elevation","globalId":"Elevation","actions":{},"lifecycles":{}},"api::project.project":{"kind":"collectionType","collectionName":"projects","info":{"singularName":"project","pluralName":"projects","displayName":"Project","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"Name":{"type":"string","required":true},"Company":{"type":"string","required":false},"Type":{"type":"integer","required":true},"ProjectAddress":{"type":"text"},"BuildingAddress":{"type":"text"},"BIN":{"type":"string"},"Block":{"type":"string"},"CT":{"type":"string"},"LOT":{"type":"string"},"ConsultingFirm":{"type":"string"},"ProjectDate":{"type":"date"},"ProjectTime":{"type":"time"},"Inspector":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"InspectorId":{"type":"integer"},"ImagePath":{"type":"string"},"APICreatedById":{"type":"integer"},"APICreatedByUser":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"projects","info":{"singularName":"project","pluralName":"projects","displayName":"Project","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"Name":{"type":"string","required":true},"Company":{"type":"string","required":false},"Type":{"type":"integer","required":true},"ProjectAddress":{"type":"text"},"BuildingAddress":{"type":"text"},"BIN":{"type":"string"},"Block":{"type":"string"},"CT":{"type":"string"},"LOT":{"type":"string"},"ConsultingFirm":{"type":"string"},"ProjectDate":{"type":"date"},"ProjectTime":{"type":"time"},"Inspector":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"InspectorId":{"type":"integer"},"ImagePath":{"type":"string"},"APICreatedById":{"type":"integer"},"APICreatedByUser":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"}},"kind":"collectionType"},"modelType":"contentType","modelName":"project","connection":"default","uid":"api::project.project","apiName":"project","globalId":"Project","actions":{},"lifecycles":{}},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"chief_inspector_id":{"type":"biginteger"},"chief_inspector":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"name":{"type":"string"},"mobile":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__filename__":"schema.json","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"chief_inspector_id":{"type":"biginteger"},"chief_inspector":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"name":{"type":"string"},"mobile":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (8, 'plugin_content_manager_configuration_content_types::plugin::i18n.locale', '{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (9, 'plugin_content_manager_configuration_content_types::admin::user', '{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"Firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"Lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"RegistrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"RegistrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"IsActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"IsActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"Roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"PreferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"editRelations":["roles"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (10, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.role', '{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (11, 'plugin_upload_settings', '{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (12, 'plugin_users-permissions_grant', '{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"//api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"//api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"//api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"//api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"//api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"//api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"//api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"//api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"//api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"//api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"//api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"//api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"//api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"//api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (14, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (15, 'plugin_i18n_default_locale', '"en"', 'string', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (13, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Build10x","email":"no-reply@mg.cldev.xyz"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\n\n<p>But don’t worry! You can use the following link to reset your password:</p>\n<p><%= URL %>?code=<%= TOKEN %></p>\n\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\n\n<p>You have to confirm your email address. Please click on the link below.</p>\n\n<p><%= URL %>?confirmation=<%= CODE %></p>\n\n<p>Thanks.</p>"}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (17, 'plugin_content_manager_configuration_content_types::api::project.project', '{"uid":"api::project.project","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"Company":{"edit":{"label":"Company","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Company","searchable":true,"sortable":true}},"Type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"ProjectAddress":{"edit":{"label":"ProjectAddress","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ProjectAddress","searchable":true,"sortable":true}},"BuildingAddress":{"edit":{"label":"BuildingAddress","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"BuildingAddress","searchable":true,"sortable":true}},"BIN":{"edit":{"label":"BIN","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"BIN","searchable":true,"sortable":true}},"Block":{"edit":{"label":"Block","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Block","searchable":true,"sortable":true}},"CT":{"edit":{"label":"CT","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"CT","searchable":true,"sortable":true}},"LOT":{"edit":{"label":"LOT","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"LOT","searchable":true,"sortable":true}},"ConsultingFirm":{"edit":{"label":"ConsultingFirm","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ConsultingFirm","searchable":true,"sortable":true}},"ProjectDate":{"edit":{"label":"ProjectDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ProjectDate","searchable":true,"sortable":true}},"ProjectTime":{"edit":{"label":"ProjectTime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ProjectTime","searchable":true,"sortable":true}},"Inspector":{"edit":{"label":"Inspector","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Inspector","searchable":true,"sortable":true}},"InspectorId":{"edit":{"label":"InspectorId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"InspectorId","searchable":true,"sortable":true}},"ImagePath":{"edit":{"label":"ImagePath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ImagePath","searchable":true,"sortable":true}},"APICreatedById":{"edit":{"label":"APICreatedById","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"APICreatedById","searchable":true,"sortable":true}},"APICreatedByUser":{"edit":{"label":"APICreatedByUser","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"APICreatedByUser","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","Company","Type"],"edit":[[{"name":"Name","size":6},{"name":"Company","size":6}],[{"name":"Type","size":4},{"name":"ProjectAddress","size":6}],[{"name":"BuildingAddress","size":6},{"name":"BIN","size":6}],[{"name":"Block","size":6},{"name":"CT","size":6}],[{"name":"LOT","size":6},{"name":"ConsultingFirm","size":6}],[{"name":"ProjectDate","size":4},{"name":"ProjectTime","size":4},{"name":"InspectorId","size":4}],[{"name":"ImagePath","size":6},{"name":"APICreatedById","size":4}]],"editRelations":["Inspector","APICreatedByUser"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (20, 'plugin_documentation_config', '{"restrictedAccess":false}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (16, 'core_admin_auth', '{"providers":{"autoRegister":false,"defaultRole":null}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (19, 'plugin_content_manager_configuration_content_types::api::annotation.annotation', '{"uid":"api::annotation.annotation","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"GridId":{"edit":{"label":"GridId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"GridId","searchable":true,"sortable":true}},"Comments":{"edit":{"label":"Comments","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Comments","searchable":true,"sortable":true}},"XCoordinate":{"edit":{"label":"XCoordinate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"XCoordinate","searchable":true,"sortable":true}},"YCoordinate":{"edit":{"label":"YCoordinate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"YCoordinate","searchable":true,"sortable":true}},"Attachment":{"edit":{"label":"Attachment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Attachment","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","GridId","Comments"],"editRelations":[],"edit":[[{"name":"Name","size":6},{"name":"GridId","size":6}],[{"name":"Comments","size":6},{"name":"XCoordinate","size":4}],[{"name":"YCoordinate","size":4},{"name":"Attachment","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (18, 'plugin_content_manager_configuration_content_types::api::elevation.elevation', '{"uid":"api::elevation.elevation","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"Image":{"edit":{"label":"Image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Image","searchable":false,"sortable":false}},"ProjectId":{"edit":{"label":"ProjectId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ProjectId","searchable":true,"sortable":true}},"GridRows":{"edit":{"label":"GridRows","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"GridRows","searchable":true,"sortable":true}},"GridColumns":{"edit":{"label":"GridColumns","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"GridColumns","searchable":true,"sortable":true}},"ImagePath":{"edit":{"label":"ImagePath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ImagePath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","Image","createdAt"],"edit":[[{"name":"Name","size":6},{"name":"Image","size":6}],[{"name":"ProjectId","size":4},{"name":"GridRows","size":4},{"name":"GridColumns","size":4}],[{"name":"ImagePath","size":6}]],"editRelations":[]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (7, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.user', '{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"ConfirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ConfirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"Confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"chief_inspector_id":{"edit":{"label":"Chief_inspector_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Chief_inspector_id","searchable":true,"sortable":true}},"chief_inspector":{"edit":{"label":"Chief_inspector","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Chief_inspector","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"mobile":{"edit":{"label":"Mobile","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Mobile","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"chief_inspector_id","size":4}],[{"name":"name","size":6},{"name":"mobile","size":6}]],"editRelations":["role","chief_inspector"]}}', 'object', NULL, NULL);


--
-- TOC entry 3268 (class 0 OID 40945)
-- Dependencies: 225
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.strapi_database_schema VALUES (16, '{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"annotations","indexes":[{"name":"annotations_created_by_id_fk","columns":["created_by_id"]},{"name":"annotations_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"annotations_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"annotations_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"grid_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"comments","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"x_coordinate","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"y_coordinate","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"elevations","indexes":[{"name":"elevations_created_by_id_fk","columns":["created_by_id"]},{"name":"elevations_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"elevations_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"elevations_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"project_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"grid_rows","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"grid_columns","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"image_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"projects","indexes":[{"name":"projects_created_by_id_fk","columns":["created_by_id"]},{"name":"projects_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"projects_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"projects_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"company","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"project_address","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"building_address","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"bin","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"block","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ct","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lot","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"consulting_firm","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"project_date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"project_time","type":"time","args":[{"precision":3}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"inspector_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"image_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"api_created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"chief_inspector_id","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mobile","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"projects_inspector_links","indexes":[{"name":"projects_inspector_links_fk","columns":["project_id"]},{"name":"projects_inspector_links_inv_fk","columns":["user_id"]}],"foreignKeys":[{"name":"projects_inspector_links_fk","columns":["project_id"],"referencedColumns":["id"],"referencedTable":"projects","onDelete":"CASCADE"},{"name":"projects_inspector_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"project_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"projects_api_created_by_user_links","indexes":[{"name":"projects_api_created_by_user_links_fk","columns":["project_id"]},{"name":"projects_api_created_by_user_links_inv_fk","columns":["user_id"]}],"foreignKeys":[{"name":"projects_api_created_by_user_links_fk","columns":["project_id"],"referencedColumns":["id"],"referencedTable":"projects","onDelete":"CASCADE"},{"name":"projects_api_created_by_user_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"project_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_chief_inspector_links","indexes":[{"name":"up_users_chief_inspector_links_fk","columns":["user_id"]},{"name":"up_users_chief_inspector_links_inv_fk","columns":["inv_user_id"]}],"foreignKeys":[{"name":"up_users_chief_inspector_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_chief_inspector_links_inv_fk","columns":["inv_user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}', '2022-03-05 12:21:11.846', 'ec5fbe40556a6524aba9df72133573ef');


--
-- TOC entry 3270 (class 0 OID 40953)
-- Dependencies: 227
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3272 (class 0 OID 40958)
-- Dependencies: 229
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3274 (class 0 OID 40966)
-- Dependencies: 231
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_permissions VALUES (1, 'plugin::users-permissions.auth.connect', '2022-02-05 18:30:11.521', '2022-02-05 18:30:11.521', NULL, NULL);
INSERT INTO public.up_permissions VALUES (2, 'plugin::users-permissions.user.me', '2022-02-05 18:30:11.521', '2022-02-05 18:30:11.521', NULL, NULL);
INSERT INTO public.up_permissions VALUES (5, 'plugin::users-permissions.auth.register', '2022-02-05 18:30:11.529', '2022-02-05 18:30:11.529', NULL, NULL);
INSERT INTO public.up_permissions VALUES (8, 'plugin::users-permissions.user.me', '2022-02-05 18:30:11.529', '2022-02-05 18:30:11.529', NULL, NULL);
INSERT INTO public.up_permissions VALUES (9, 'plugin::users-permissions.auth.callback', '2022-02-05 18:30:11.528', '2022-02-05 18:30:11.528', NULL, NULL);
INSERT INTO public.up_permissions VALUES (10, 'plugin::users-permissions.auth.connect', '2022-02-05 18:30:11.528', '2022-02-05 18:30:11.528', NULL, NULL);
INSERT INTO public.up_permissions VALUES (12, 'api::project.project.getUploadPresignedUrl', '2022-02-16 17:17:00.31', '2022-02-16 17:17:00.31', NULL, NULL);
INSERT INTO public.up_permissions VALUES (13, 'api::project.project.getUploadPresignedUrl', '2022-02-16 17:17:14.064', '2022-02-16 17:17:14.064', NULL, NULL);
INSERT INTO public.up_permissions VALUES (14, 'api::project.project.getUploadPresignedUrl', '2022-02-16 17:17:19.692', '2022-02-16 17:17:19.692', NULL, NULL);
INSERT INTO public.up_permissions VALUES (15, 'api::project.project.find', '2022-02-16 17:17:37.5', '2022-02-16 17:17:37.5', NULL, NULL);
INSERT INTO public.up_permissions VALUES (16, 'api::project.project.findOne', '2022-02-16 17:17:37.5', '2022-02-16 17:17:37.5', NULL, NULL);
INSERT INTO public.up_permissions VALUES (17, 'api::project.project.create', '2022-02-16 17:17:37.5', '2022-02-16 17:17:37.5', NULL, NULL);
INSERT INTO public.up_permissions VALUES (18, 'api::project.project.update', '2022-02-16 17:17:37.5', '2022-02-16 17:17:37.5', NULL, NULL);
INSERT INTO public.up_permissions VALUES (19, 'api::project.project.find', '2022-02-16 17:17:48.468', '2022-02-16 17:17:48.468', NULL, NULL);
INSERT INTO public.up_permissions VALUES (20, 'api::project.project.create', '2022-02-16 17:17:48.468', '2022-02-16 17:17:48.468', NULL, NULL);
INSERT INTO public.up_permissions VALUES (21, 'api::project.project.update', '2022-02-16 17:17:48.468', '2022-02-16 17:17:48.468', NULL, NULL);
INSERT INTO public.up_permissions VALUES (23, 'api::project.project.delete', '2022-02-16 17:17:48.468', '2022-02-16 17:17:48.468', NULL, NULL);
INSERT INTO public.up_permissions VALUES (22, 'api::project.project.findOne', '2022-02-16 17:17:48.468', '2022-02-16 17:17:48.468', NULL, NULL);
INSERT INTO public.up_permissions VALUES (24, 'api::project.project.getDownloadPresignedUrl', '2022-02-16 19:50:25.252', '2022-02-16 19:50:25.252', NULL, NULL);
INSERT INTO public.up_permissions VALUES (27, 'plugin::users-permissions.user.count', '2022-02-22 17:26:31.967', '2022-02-22 17:26:31.967', NULL, NULL);
INSERT INTO public.up_permissions VALUES (25, 'plugin::users-permissions.user.find', '2022-02-22 17:26:31.967', '2022-02-22 17:26:31.967', NULL, NULL);
INSERT INTO public.up_permissions VALUES (26, 'plugin::users-permissions.user.findOne', '2022-02-22 17:26:31.967', '2022-02-22 17:26:31.967', NULL, NULL);
INSERT INTO public.up_permissions VALUES (28, 'plugin::users-permissions.user.me', '2022-02-22 17:26:31.967', '2022-02-22 17:26:31.967', NULL, NULL);
INSERT INTO public.up_permissions VALUES (29, 'plugin::users-permissions.role.getRole', '2022-02-22 17:26:31.967', '2022-02-22 17:26:31.967', NULL, NULL);
INSERT INTO public.up_permissions VALUES (30, 'plugin::users-permissions.role.getRoles', '2022-02-22 17:26:31.967', '2022-02-22 17:26:31.967', NULL, NULL);
INSERT INTO public.up_permissions VALUES (31, 'plugin::users-permissions.permissions.getPermissions', '2022-02-22 17:26:31.967', '2022-02-22 17:26:31.967', NULL, NULL);
INSERT INTO public.up_permissions VALUES (32, 'plugin::users-permissions.auth.forgotPassword', '2022-02-23 17:03:54.576', '2022-02-23 17:03:54.576', NULL, NULL);
INSERT INTO public.up_permissions VALUES (33, 'plugin::users-permissions.auth.resetPassword', '2022-02-23 17:04:15.937', '2022-02-23 17:04:15.937', NULL, NULL);
INSERT INTO public.up_permissions VALUES (34, 'plugin::users-permissions.auth.forgotPassword', '2022-02-23 17:04:15.937', '2022-02-23 17:04:15.937', NULL, NULL);
INSERT INTO public.up_permissions VALUES (35, 'api::project.project.getDownloadPresignedUrl', '2022-02-23 17:24:25.533', '2022-02-23 17:24:25.533', NULL, NULL);
INSERT INTO public.up_permissions VALUES (36, 'api::project.project.findOne', '2022-02-23 17:24:25.533', '2022-02-23 17:24:25.533', NULL, NULL);
INSERT INTO public.up_permissions VALUES (37, 'api::project.project.find', '2022-02-23 17:24:25.533', '2022-02-23 17:24:25.533', NULL, NULL);
INSERT INTO public.up_permissions VALUES (38, 'plugin::users-permissions.user.find', '2022-02-23 17:24:52.232', '2022-02-23 17:24:52.232', NULL, NULL);
INSERT INTO public.up_permissions VALUES (39, 'plugin::users-permissions.user.findOne', '2022-02-23 17:24:52.233', '2022-02-23 17:24:52.233', NULL, NULL);
INSERT INTO public.up_permissions VALUES (40, 'plugin::users-permissions.user.count', '2022-02-23 17:24:52.233', '2022-02-23 17:24:52.233', NULL, NULL);
INSERT INTO public.up_permissions VALUES (41, 'plugin::users-permissions.user.me', '2022-02-23 17:24:52.233', '2022-02-23 17:24:52.233', NULL, NULL);
INSERT INTO public.up_permissions VALUES (42, 'plugin::users-permissions.role.getRole', '2022-02-23 17:24:52.233', '2022-02-23 17:24:52.233', NULL, NULL);
INSERT INTO public.up_permissions VALUES (43, 'plugin::users-permissions.role.getRoles', '2022-02-23 17:24:52.233', '2022-02-23 17:24:52.233', NULL, NULL);
INSERT INTO public.up_permissions VALUES (44, 'plugin::users-permissions.user.update', '2022-02-23 17:24:54.928', '2022-02-23 17:24:54.928', NULL, NULL);
INSERT INTO public.up_permissions VALUES (45, 'plugin::users-permissions.user.create', '2022-03-05 14:33:22.2', '2022-03-05 14:33:22.2', NULL, NULL);
INSERT INTO public.up_permissions VALUES (46, 'plugin::users-permissions.user.update', '2022-03-05 14:33:22.2', '2022-03-05 14:33:22.2', NULL, NULL);


--
-- TOC entry 3276 (class 0 OID 40971)
-- Dependencies: 233
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_permissions_role_links VALUES (1, 1);
INSERT INTO public.up_permissions_role_links VALUES (2, 1);
INSERT INTO public.up_permissions_role_links VALUES (5, 2);
INSERT INTO public.up_permissions_role_links VALUES (8, 2);
INSERT INTO public.up_permissions_role_links VALUES (9, 2);
INSERT INTO public.up_permissions_role_links VALUES (10, 2);
INSERT INTO public.up_permissions_role_links VALUES (12, 4);
INSERT INTO public.up_permissions_role_links VALUES (13, 5);
INSERT INTO public.up_permissions_role_links VALUES (14, 1);
INSERT INTO public.up_permissions_role_links VALUES (15, 4);
INSERT INTO public.up_permissions_role_links VALUES (16, 4);
INSERT INTO public.up_permissions_role_links VALUES (17, 4);
INSERT INTO public.up_permissions_role_links VALUES (18, 4);
INSERT INTO public.up_permissions_role_links VALUES (19, 1);
INSERT INTO public.up_permissions_role_links VALUES (20, 1);
INSERT INTO public.up_permissions_role_links VALUES (23, 1);
INSERT INTO public.up_permissions_role_links VALUES (22, 1);
INSERT INTO public.up_permissions_role_links VALUES (21, 1);
INSERT INTO public.up_permissions_role_links VALUES (24, 4);
INSERT INTO public.up_permissions_role_links VALUES (25, 4);
INSERT INTO public.up_permissions_role_links VALUES (27, 4);
INSERT INTO public.up_permissions_role_links VALUES (26, 4);
INSERT INTO public.up_permissions_role_links VALUES (29, 4);
INSERT INTO public.up_permissions_role_links VALUES (28, 4);
INSERT INTO public.up_permissions_role_links VALUES (31, 4);
INSERT INTO public.up_permissions_role_links VALUES (30, 4);
INSERT INTO public.up_permissions_role_links VALUES (32, 4);
INSERT INTO public.up_permissions_role_links VALUES (33, 2);
INSERT INTO public.up_permissions_role_links VALUES (34, 2);
INSERT INTO public.up_permissions_role_links VALUES (35, 5);
INSERT INTO public.up_permissions_role_links VALUES (36, 5);
INSERT INTO public.up_permissions_role_links VALUES (37, 5);
INSERT INTO public.up_permissions_role_links VALUES (38, 5);
INSERT INTO public.up_permissions_role_links VALUES (39, 5);
INSERT INTO public.up_permissions_role_links VALUES (41, 5);
INSERT INTO public.up_permissions_role_links VALUES (40, 5);
INSERT INTO public.up_permissions_role_links VALUES (43, 5);
INSERT INTO public.up_permissions_role_links VALUES (42, 5);
INSERT INTO public.up_permissions_role_links VALUES (44, 5);
INSERT INTO public.up_permissions_role_links VALUES (45, 4);
INSERT INTO public.up_permissions_role_links VALUES (46, 4);


--
-- TOC entry 3277 (class 0 OID 40974)
-- Dependencies: 234
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_roles VALUES (3, 'Super Admin', 'Role used by the owners of the system', 'super_admin', '2022-02-07 13:11:48.281', '2022-02-07 13:11:48.281', NULL, NULL);
INSERT INTO public.up_roles VALUES (1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', '2022-02-05 18:30:11.514', '2022-02-16 17:17:48.464', NULL, NULL);
INSERT INTO public.up_roles VALUES (2, 'Public', 'Default role given to unauthenticated user.', 'public', '2022-02-05 18:30:11.517', '2022-02-23 17:04:15.934', NULL, NULL);
INSERT INTO public.up_roles VALUES (5, 'Field Inspector', 'Role used by field inspector (from the app)', 'field_inspector', '2022-02-07 13:12:24.598', '2022-02-23 17:24:54.922', NULL, NULL);
INSERT INTO public.up_roles VALUES (4, 'Chief Inspector', 'Role for chief inspectors', 'chief_inspector', '2022-02-07 13:12:08.605', '2022-03-05 14:33:22.19', NULL, NULL);


--
-- TOC entry 3279 (class 0 OID 40982)
-- Dependencies: 236
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_users VALUES (1, 'ci1@build10x.com', 'ci1@build10x.com', 'local', '$2a$10$bTvsLnI2f7k2sW.LwWkfj.SF8h9o5E6RY6IFNCyu9aa.en9wAIw66', NULL, NULL, true, false, '2022-02-11 10:11:27.244', '2022-02-11 10:11:27.244', 1, 1, NULL, NULL, NULL);
INSERT INTO public.up_users VALUES (3, 'amrit@citrusleaf.in', 'amrit@citrusleaf.in', 'local', '$2a$10$lXBWGLBspwi.0ppGcCld/Orbaue7J6O3iwT2btuzpUkSw7w28LEj.', NULL, NULL, true, false, '2022-02-23 17:03:26', '2022-02-23 17:05:33.808', 1, 1, NULL, NULL, NULL);
INSERT INTO public.up_users VALUES (2, 'fi1@build10x.com', 'fi1@build10x.com', 'local', '$2a$10$2F0nPWPMpdBDefqtVf8BY.LHwgNZabPqY250Iv7kCNlTbZ/Qjdl8q', NULL, NULL, true, false, '2022-02-22 12:17:08.223', '2022-03-05 12:22:04.569', 1, 1, 1, 'FI', '8989897777');
INSERT INTO public.up_users VALUES (4, 'Jonatan_Bins@gmail.com', 'jonatan_bins@gmail.com', 'local', '$2a$10$8q8C5Ti80V7FzAl7dmOoaeGvvjpgN4.Vu5qCl0LEB4e9jLyR7KxEq', NULL, NULL, false, false, '2022-03-05 15:03:12.682', '2022-03-05 15:03:12.682', NULL, NULL, NULL, 'Vickie Williamson', '(389) 521-9588');
INSERT INTO public.up_users VALUES (5, 'Stevie32@hotmail.com', 'Stevie32@hotmail.com', NULL, '$2a$10$qBHNuH8FNULbTrbqTKnMYesmcKK3T33Xw6r7IGxtPRK9Yq/dLhHW2', NULL, NULL, false, false, '2022-03-05 15:08:45.783', '2022-03-05 15:08:45.783', NULL, NULL, NULL, 'Marie Schuppe', '(319) 984-9225');
INSERT INTO public.up_users VALUES (6, 'Burdette.Haag45@hotmail.com', 'Burdette.Haag45@hotmail.com', NULL, '$2a$10$sO9OlgiN2aglSswtR/YG2uMjBeVz27aTG1Cs8K7JAdUxJkuMgPsKS', NULL, NULL, false, false, '2022-03-05 15:24:08.238', '2022-03-05 15:24:08.238', NULL, NULL, NULL, 'Jimmy Denesik', '(386) 724-1214');
INSERT INTO public.up_users VALUES (7, 'Samanta42@yahoo.com', 'Samanta42@yahoo.com', NULL, '$2a$10$7GqtDX88y9ACa/AYEJVBDOMWdWEeD6yZptBw86X8QR8djvpiHWbAq', NULL, NULL, true, true, '2022-03-05 15:29:18.064', '2022-03-05 15:29:18.064', NULL, NULL, 1, 'Cynthia Walker DVM', '809-909-5351 x76456');
INSERT INTO public.up_users VALUES (8, 'Kristopher74@hotmail.com', 'Kristopher74@hotmail.com', NULL, '$2a$10$KCMezONkwibeADMML7wroO7J/.3VP2myoU7OH.6J3uhLvY.L8dojO', NULL, NULL, true, true, '2022-03-05 15:29:55.018', '2022-03-05 15:29:55.018', NULL, NULL, 1, 'Crystal Kshlerin', '(979) 649-2681 x990');
INSERT INTO public.up_users VALUES (9, 'Irma.Barton90@gmail.com', 'Irma.Barton90@gmail.com', NULL, '$2a$10$Di9xOtIIgr3egjR5j.8yOOYvKPA0R5MoFqR0qORjMug11yXB3rI2u', NULL, NULL, true, true, '2022-03-05 15:30:51.32', '2022-03-05 15:30:51.32', NULL, NULL, 1, 'Delbert Rau', '1-369-612-6495 x898');
INSERT INTO public.up_users VALUES (10, 'Icie_Runolfsdottir@gmail.com', 'Icie_Runolfsdottir@gmail.com', NULL, '$2a$10$pnKMCAmBqKLuV/0vzRm5ZOtTs9G/sBzzkRnCOmOR.bwWmn2eaCQc2', NULL, NULL, true, true, '2022-03-05 15:32:07.832', '2022-03-05 15:32:07.832', NULL, NULL, 1, 'Sheryl Dare', '(453) 243-8867 x1996');
INSERT INTO public.up_users VALUES (11, 'abcd1234', 'abcfi@gmail.com', NULL, '$2a$10$aLfQTjvprwfoqdRFMtT9TOiTYRyLWi7LlkOwNbDVWCV1bZRwdCmCq', NULL, NULL, true, true, '2022-03-05 15:34:41.131', '2022-03-05 15:34:41.131', NULL, NULL, 1, 'ABC FI', '8765433252');


--
-- TOC entry 3282 (class 0 OID 41268)
-- Dependencies: 239
-- Data for Name: up_users_chief_inspector_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_users_chief_inspector_links VALUES (2, 1);
INSERT INTO public.up_users_chief_inspector_links VALUES (7, 1);
INSERT INTO public.up_users_chief_inspector_links VALUES (8, 1);
INSERT INTO public.up_users_chief_inspector_links VALUES (9, 1);
INSERT INTO public.up_users_chief_inspector_links VALUES (10, 1);
INSERT INTO public.up_users_chief_inspector_links VALUES (11, 1);


--
-- TOC entry 3281 (class 0 OID 40990)
-- Dependencies: 238
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_users_role_links VALUES (1, 4);
INSERT INTO public.up_users_role_links VALUES (3, 4);
INSERT INTO public.up_users_role_links VALUES (2, 5);
INSERT INTO public.up_users_role_links VALUES (4, 1);
INSERT INTO public.up_users_role_links VALUES (6, 5);
INSERT INTO public.up_users_role_links VALUES (7, 5);
INSERT INTO public.up_users_role_links VALUES (8, 5);
INSERT INTO public.up_users_role_links VALUES (9, 5);
INSERT INTO public.up_users_role_links VALUES (10, 5);
INSERT INTO public.up_users_role_links VALUES (11, 5);


--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 201
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 104, true);


--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 204
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 206
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 209
-- Name: annotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotations_id_seq', 1, false);


--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 211
-- Name: elevations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.elevations_id_seq', 1, false);


--
-- TOC entry 3309 (class 0 OID 0)
-- Dependencies: 213
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 1, false);


--
-- TOC entry 3310 (class 0 OID 0)
-- Dependencies: 216
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- TOC entry 3311 (class 0 OID 0)
-- Dependencies: 219
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 27, true);


--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 222
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- TOC entry 3313 (class 0 OID 0)
-- Dependencies: 224
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 20, true);


--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 226
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 16, true);


--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 228
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 230
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 232
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 46, true);


--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 235
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 5, true);


--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 237
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 11, true);


--
-- TOC entry 3005 (class 2606 OID 41012)
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3011 (class 2606 OID 41014)
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3015 (class 2606 OID 41016)
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3021 (class 2606 OID 41018)
-- Name: annotations annotations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT annotations_pkey PRIMARY KEY (id);


--
-- TOC entry 3025 (class 2606 OID 41020)
-- Name: elevations elevations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevations
    ADD CONSTRAINT elevations_pkey PRIMARY KEY (id);


--
-- TOC entry 3029 (class 2606 OID 41022)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- TOC entry 3034 (class 2606 OID 41024)
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- TOC entry 3038 (class 2606 OID 41026)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3046 (class 2606 OID 41028)
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3049 (class 2606 OID 41030)
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3051 (class 2606 OID 41032)
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- TOC entry 3053 (class 2606 OID 41034)
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3055 (class 2606 OID 41036)
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- TOC entry 3058 (class 2606 OID 41038)
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3064 (class 2606 OID 41040)
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3068 (class 2606 OID 41042)
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3003 (class 1259 OID 41043)
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- TOC entry 3007 (class 1259 OID 41044)
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- TOC entry 3008 (class 1259 OID 41045)
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- TOC entry 3006 (class 1259 OID 41046)
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- TOC entry 3009 (class 1259 OID 41047)
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- TOC entry 3012 (class 1259 OID 41048)
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- TOC entry 3013 (class 1259 OID 41049)
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- TOC entry 3017 (class 1259 OID 41050)
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- TOC entry 3018 (class 1259 OID 41051)
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- TOC entry 3016 (class 1259 OID 41052)
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- TOC entry 3019 (class 1259 OID 41053)
-- Name: annotations_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX annotations_created_by_id_fk ON public.annotations USING btree (created_by_id);


--
-- TOC entry 3022 (class 1259 OID 41054)
-- Name: annotations_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX annotations_updated_by_id_fk ON public.annotations USING btree (updated_by_id);


--
-- TOC entry 3023 (class 1259 OID 41055)
-- Name: elevations_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elevations_created_by_id_fk ON public.elevations USING btree (created_by_id);


--
-- TOC entry 3026 (class 1259 OID 41056)
-- Name: elevations_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX elevations_updated_by_id_fk ON public.elevations USING btree (updated_by_id);


--
-- TOC entry 3027 (class 1259 OID 41057)
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- TOC entry 3031 (class 1259 OID 41058)
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- TOC entry 3030 (class 1259 OID 41059)
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- TOC entry 3032 (class 1259 OID 41060)
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- TOC entry 3035 (class 1259 OID 41061)
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- TOC entry 3040 (class 1259 OID 41062)
-- Name: projects_api_created_by_user_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_api_created_by_user_links_fk ON public.projects_api_created_by_user_links USING btree (project_id);


--
-- TOC entry 3041 (class 1259 OID 41063)
-- Name: projects_api_created_by_user_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_api_created_by_user_links_inv_fk ON public.projects_api_created_by_user_links USING btree (user_id);


--
-- TOC entry 3036 (class 1259 OID 41064)
-- Name: projects_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_created_by_id_fk ON public.projects USING btree (created_by_id);


--
-- TOC entry 3042 (class 1259 OID 41065)
-- Name: projects_inspector_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_inspector_links_fk ON public.projects_inspector_links USING btree (project_id);


--
-- TOC entry 3043 (class 1259 OID 41066)
-- Name: projects_inspector_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_inspector_links_inv_fk ON public.projects_inspector_links USING btree (user_id);


--
-- TOC entry 3039 (class 1259 OID 41067)
-- Name: projects_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_updated_by_id_fk ON public.projects USING btree (updated_by_id);


--
-- TOC entry 3044 (class 1259 OID 41068)
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- TOC entry 3047 (class 1259 OID 41069)
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- TOC entry 3056 (class 1259 OID 41070)
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- TOC entry 3060 (class 1259 OID 41071)
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- TOC entry 3061 (class 1259 OID 41072)
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- TOC entry 3059 (class 1259 OID 41073)
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- TOC entry 3062 (class 1259 OID 41074)
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- TOC entry 3065 (class 1259 OID 41075)
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- TOC entry 3072 (class 1259 OID 41271)
-- Name: up_users_chief_inspector_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_chief_inspector_links_fk ON public.up_users_chief_inspector_links USING btree (user_id);


--
-- TOC entry 3073 (class 1259 OID 41272)
-- Name: up_users_chief_inspector_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_chief_inspector_links_inv_fk ON public.up_users_chief_inspector_links USING btree (inv_user_id);


--
-- TOC entry 3066 (class 1259 OID 41076)
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- TOC entry 3070 (class 1259 OID 41077)
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- TOC entry 3071 (class 1259 OID 41078)
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- TOC entry 3069 (class 1259 OID 41079)
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- TOC entry 3074 (class 2606 OID 41080)
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3076 (class 2606 OID 41085)
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3077 (class 2606 OID 41090)
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3075 (class 2606 OID 41095)
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3078 (class 2606 OID 41100)
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3079 (class 2606 OID 41105)
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3080 (class 2606 OID 41110)
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3082 (class 2606 OID 41115)
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- TOC entry 3083 (class 2606 OID 41120)
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3081 (class 2606 OID 41125)
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3084 (class 2606 OID 41130)
-- Name: annotations annotations_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT annotations_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3085 (class 2606 OID 41135)
-- Name: annotations annotations_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT annotations_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3086 (class 2606 OID 41140)
-- Name: elevations elevations_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevations
    ADD CONSTRAINT elevations_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3087 (class 2606 OID 41145)
-- Name: elevations elevations_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elevations
    ADD CONSTRAINT elevations_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3088 (class 2606 OID 41150)
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3090 (class 2606 OID 41155)
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 3089 (class 2606 OID 41160)
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3091 (class 2606 OID 41165)
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3092 (class 2606 OID 41170)
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3095 (class 2606 OID 41175)
-- Name: projects_api_created_by_user_links projects_api_created_by_user_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_api_created_by_user_links
    ADD CONSTRAINT projects_api_created_by_user_links_fk FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- TOC entry 3096 (class 2606 OID 41180)
-- Name: projects_api_created_by_user_links projects_api_created_by_user_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_api_created_by_user_links
    ADD CONSTRAINT projects_api_created_by_user_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 3093 (class 2606 OID 41185)
-- Name: projects projects_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3097 (class 2606 OID 41190)
-- Name: projects_inspector_links projects_inspector_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_inspector_links
    ADD CONSTRAINT projects_inspector_links_fk FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- TOC entry 3098 (class 2606 OID 41195)
-- Name: projects_inspector_links projects_inspector_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_inspector_links
    ADD CONSTRAINT projects_inspector_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 3094 (class 2606 OID 41200)
-- Name: projects projects_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3099 (class 2606 OID 41205)
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3100 (class 2606 OID 41210)
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3101 (class 2606 OID 41215)
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3103 (class 2606 OID 41220)
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3104 (class 2606 OID 41225)
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3102 (class 2606 OID 41230)
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3105 (class 2606 OID 41235)
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3106 (class 2606 OID 41240)
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3111 (class 2606 OID 41273)
-- Name: up_users_chief_inspector_links up_users_chief_inspector_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_chief_inspector_links
    ADD CONSTRAINT up_users_chief_inspector_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 3112 (class 2606 OID 41278)
-- Name: up_users_chief_inspector_links up_users_chief_inspector_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_chief_inspector_links
    ADD CONSTRAINT up_users_chief_inspector_links_inv_fk FOREIGN KEY (inv_user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 3107 (class 2606 OID 41245)
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3109 (class 2606 OID 41250)
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 3110 (class 2606 OID 41255)
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3108 (class 2606 OID 41260)
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


-- Completed on 2022-03-05 17:09:41

--
-- PostgreSQL database dump complete
--

