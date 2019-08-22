--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: inventory_categorie; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_categorie (
    id integer NOT NULL,
    category_name character varying(50) NOT NULL,
    extra_fields jsonb
);


--
-- Name: inventory_categorie_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inventory_categorie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_categorie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inventory_categorie_id_seq OWNED BY public.inventory_categorie.id;


--
-- Name: inventory_floor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_floor (
    id integer NOT NULL,
    floor smallint NOT NULL,
    CONSTRAINT inventory_floor_floor_check CHECK ((floor >= 0))
);


--
-- Name: inventory_floor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inventory_floor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inventory_floor_id_seq OWNED BY public.inventory_floor.id;


--
-- Name: inventory_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_item (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    model character varying(50),
    cost_per_item numeric(10,2),
    date_of_acquire date NOT NULL,
    working integer NOT NULL,
    in_maintenance integer NOT NULL,
    out_of_order integer NOT NULL,
    created timestamp with time zone,
    last_modified timestamp with time zone,
    extra_value jsonb,
    category_id integer,
    room_id integer
);


--
-- Name: inventory_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inventory_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inventory_item_id_seq OWNED BY public.inventory_item.id;


--
-- Name: inventory_room; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_room (
    id integer NOT NULL,
    room_no smallint NOT NULL,
    room_name character varying(50) NOT NULL,
    floor_id integer NOT NULL,
    CONSTRAINT inventory_room_room_no_check CHECK ((room_no >= 0))
);


--
-- Name: inventory_room_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inventory_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inventory_room_id_seq OWNED BY public.inventory_room.id;


--
-- Name: inventory_subitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_subitem (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    model character varying(50),
    cost_per_item numeric(10,2),
    working integer NOT NULL,
    in_maintenance integer NOT NULL,
    out_of_order integer NOT NULL,
    item_id integer
);


--
-- Name: inventory_subitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inventory_subitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_subitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inventory_subitem_id_seq OWNED BY public.inventory_subitem.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: inventory_categorie id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_categorie ALTER COLUMN id SET DEFAULT nextval('public.inventory_categorie_id_seq'::regclass);


--
-- Name: inventory_floor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_floor ALTER COLUMN id SET DEFAULT nextval('public.inventory_floor_id_seq'::regclass);


--
-- Name: inventory_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_item ALTER COLUMN id SET DEFAULT nextval('public.inventory_item_id_seq'::regclass);


--
-- Name: inventory_room id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_room ALTER COLUMN id SET DEFAULT nextval('public.inventory_room_id_seq'::regclass);


--
-- Name: inventory_subitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_subitem ALTER COLUMN id SET DEFAULT nextval('public.inventory_subitem_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add categorie	7	add_categorie
20	Can change categorie	7	change_categorie
21	Can delete categorie	7	delete_categorie
22	Can add floor	8	add_floor
23	Can change floor	8	change_floor
24	Can delete floor	8	delete_floor
25	Can add item	9	add_item
26	Can change item	9	change_item
27	Can delete item	9	delete_item
28	Can add room	10	add_room
29	Can change room	10	change_room
30	Can delete room	10	delete_room
31	Can add sub item	11	add_subitem
32	Can change sub item	11	change_subitem
33	Can delete sub item	11	delete_subitem
34	Can view log entry	1	view_logentry
35	Can view permission	2	view_permission
36	Can view group	3	view_group
37	Can view user	4	view_user
38	Can view content type	5	view_contenttype
39	Can view session	6	view_session
40	Can view categorie	7	view_categorie
41	Can view floor	8	view_floor
42	Can view item	9	view_item
43	Can view room	10	view_room
44	Can view sub item	11	view_subitem
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$yR8SQCIXf8dg$rtj0sLiNfpworxNXEqjRLOo2NNeUeAhUUIFIyU6M0lA=	2019-08-22 09:16:17.826218+05:45	t	admin				t	t	2019-07-29 21:52:02.087893+05:45
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-07-29 23:57:51.10612+05:45	4	Test2	3		7	1
2	2019-07-30 00:04:10.552691+05:45	5	TestCategorie	2	[{"changed": {"fields": ["extra_fields"]}}]	7	1
3	2019-07-30 00:04:39.350997+05:45	115	windows-12ed	2	[{"changed": {"fields": ["extra_value"]}}]	9	1
4	2019-07-30 00:10:59.215655+05:45	115	windows-12ed	2	[]	9	1
5	2019-07-30 00:11:06.177597+05:45	5	TestCategorie	2	[{"changed": {"fields": ["extra_fields"]}}]	7	1
6	2019-07-30 00:11:28.972181+05:45	115	windows-12ed	2	[{"changed": {"fields": ["extra_value"]}}]	9	1
7	2019-07-30 00:20:17.355187+05:45	5	TestCategorie	2	[{"changed": {"fields": ["extra_fields"]}}]	7	1
8	2019-07-30 00:20:30.694478+05:45	115	windows-12ed	2	[{"changed": {"fields": ["extra_value"]}}]	9	1
9	2019-07-30 00:22:55.795377+05:45	115	windows-12ed	2	[{"changed": {"fields": ["extra_value"]}}]	9	1
10	2019-07-30 00:23:02.291042+05:45	5	TestCategorie	2	[{"changed": {"fields": ["extra_fields"]}}]	7	1
11	2019-07-30 00:24:19.003442+05:45	115	windows-12ed	2	[{"changed": {"fields": ["extra_value"]}}]	9	1
12	2019-07-30 00:24:31.299998+05:45	5	TestCategorie	2	[{"changed": {"fields": ["extra_fields"]}}]	7	1
13	2019-07-30 00:27:53.699842+05:45	5	TestCategorie	2	[{"changed": {"fields": ["extra_fields"]}}]	7	1
14	2019-07-30 00:28:11.024694+05:45	115	windows-12ed	2	[]	9	1
15	2019-07-30 00:28:33.503695+05:45	115	windows-12ed	2	[{"changed": {"fields": ["extra_value"]}}]	9	1
16	2019-07-30 00:36:00.576469+05:45	115	windows-12ed	2	[]	9	1
17	2019-07-30 12:14:46.913911+05:45	117	TechX-sdsd	3		9	1
18	2019-07-30 12:15:24.3123+05:45	118	TechX-sdsd	3		9	1
19	2019-07-30 12:16:30.132084+05:45	120	asbcsnac-Genericascax	3		9	1
20	2019-07-30 12:16:30.136642+05:45	119	TechX-sdsd	3		9	1
21	2019-07-30 12:16:30.139697+05:45	116	Tech-12345	3		9	1
22	2019-07-30 12:24:01.034621+05:45	121	Genericscsa-qwsqGeneric	3		9	1
23	2019-07-30 12:36:45.314147+05:45	122	acsa-Genericgfsda	3		9	1
24	2019-08-18 14:44:42.76992+05:45	10	here is	3		7	1
25	2019-08-18 14:44:42.778133+05:45	9	lab furniture	3		7	1
26	2019-08-18 14:46:39.196381+05:45	11	kit of mine	3		7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	inventory	categorie
8	inventory	floor
9	inventory	item
10	inventory	room
11	inventory	subitem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-07-29 21:51:37.371385+05:45
2	auth	0001_initial	2019-07-29 21:51:37.488993+05:45
3	admin	0001_initial	2019-07-29 21:51:37.530425+05:45
4	admin	0002_logentry_remove_auto_add	2019-07-29 21:51:37.542762+05:45
5	contenttypes	0002_remove_content_type_name	2019-07-29 21:51:37.578919+05:45
6	auth	0002_alter_permission_name_max_length	2019-07-29 21:51:37.590287+05:45
7	auth	0003_alter_user_email_max_length	2019-07-29 21:51:37.608806+05:45
8	auth	0004_alter_user_username_opts	2019-07-29 21:51:37.628434+05:45
9	auth	0005_alter_user_last_login_null	2019-07-29 21:51:37.649815+05:45
10	auth	0006_require_contenttypes_0002	2019-07-29 21:51:37.653414+05:45
11	auth	0007_alter_validators_add_error_messages	2019-07-29 21:51:37.670548+05:45
12	auth	0008_alter_user_username_max_length	2019-07-29 21:51:37.706034+05:45
13	auth	0009_alter_user_last_name_max_length	2019-07-29 21:51:37.737944+05:45
14	inventory	0001_initial	2019-07-29 21:51:37.830512+05:45
15	sessions	0001_initial	2019-07-29 21:51:37.849964+05:45
16	admin	0003_logentry_add_action_flag_choices	2019-08-02 12:57:37.997086+05:45
17	auth	0010_alter_group_name_max_length	2019-08-02 12:57:38.113699+05:45
18	auth	0011_update_proxy_permissions	2019-08-02 12:57:38.13138+05:45
19	inventory	0002_auto_20190818_0914	2019-08-18 14:59:55.399133+05:45
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
uuejz94mc5xqsgqg3wrbtb2yc6o9fhgt	OTQ3ZjA3YzgxYjNlYmY1YTQyNjU2NzRmYmVhMDU5YzNjMzk0MTI2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNjExMDY2YTU2MDI1ZjNkNDg5YmFjOWM1NGJkYmIzZjRiNjJkOGEyIn0=	2019-08-16 13:03:29.47332+05:45
c2uhwhtxngpdlwd4a2ftuiv0aj4ad5kc	OTQ3ZjA3YzgxYjNlYmY1YTQyNjU2NzRmYmVhMDU5YzNjMzk0MTI2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNjExMDY2YTU2MDI1ZjNkNDg5YmFjOWM1NGJkYmIzZjRiNjJkOGEyIn0=	2019-08-27 15:55:40.311241+05:45
6b5xy8j13he9r93y7bxa6m9azi1vebz0	OTQ3ZjA3YzgxYjNlYmY1YTQyNjU2NzRmYmVhMDU5YzNjMzk0MTI2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNjExMDY2YTU2MDI1ZjNkNDg5YmFjOWM1NGJkYmIzZjRiNjJkOGEyIn0=	2019-09-01 12:08:07.026084+05:45
2dhjadirmxkkyydk9b1g5q0l6bfxhisk	OTQ3ZjA3YzgxYjNlYmY1YTQyNjU2NzRmYmVhMDU5YzNjMzk0MTI2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNjExMDY2YTU2MDI1ZjNkNDg5YmFjOWM1NGJkYmIzZjRiNjJkOGEyIn0=	2019-09-01 14:44:34.961003+05:45
8gyxsq0lkj7q4u4woltkmuam47ivzdt9	OTQ3ZjA3YzgxYjNlYmY1YTQyNjU2NzRmYmVhMDU5YzNjMzk0MTI2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNjExMDY2YTU2MDI1ZjNkNDg5YmFjOWM1NGJkYmIzZjRiNjJkOGEyIn0=	2019-09-05 09:16:17.839559+05:45
\.


--
-- Data for Name: inventory_categorie; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_categorie (id, category_name, extra_fields) FROM stdin;
3	TrainerKit	{}
1	lab	{}
6	Test	{"field1": "Brand1", "field2": "Brand2", "field3": "Brand8"}
\.


--
-- Data for Name: inventory_floor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_floor (id, floor) FROM stdin;
1	0
4	69
\.


--
-- Data for Name: inventory_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_item (id, name, model, cost_per_item, date_of_acquire, working, in_maintenance, out_of_order, created, last_modified, extra_value, category_id, room_id) FROM stdin;
62	Analog Communication Trainer Kit	ED 2960	\N	2019-07-26	6	0	0	2019-07-26 15:53:01.286+05:45	2019-07-26 15:53:01.335+05:45	{}	3	3
1	Hampden toolbox	\N	\N	2019-07-26	1	0	0	2019-07-26 07:18:53.957+05:45	2019-08-18 12:29:16.013965+05:45	{}	1	1
2	Steel Cabinet	\N	\N	2019-07-26	9	0	0	2019-07-26 07:19:18.443+05:45	2019-08-18 12:29:16.019857+05:45	{}	1	1
3	Lab Table	\N	\N	2019-07-26	8	0	0	2019-07-26 07:19:37.994+05:45	2019-08-18 12:29:16.023818+05:45	{}	1	1
5	Hameg Analogue Oscilloscope 60MHz	HM605	\N	2019-07-26	7	0	0	2019-07-26 07:24:08.572+05:45	2019-08-18 12:29:16.032105+05:45	{}	1	1
6	AVOMETER 8	Generic	\N	2019-07-26	11	0	0	2019-07-26 07:24:42.669+05:45	2019-08-18 12:29:16.034947+05:45	{}	1	1
7	Sympson multimeter 260	\N	\N	2019-07-26	11	0	0	2019-07-26 07:25:15.618+05:45	2019-08-18 12:29:16.037807+05:45	{}	1	1
9	Decade Capacitance Box	IET HACS-Z Series	\N	2019-07-26	12	0	0	2019-07-26 07:28:30.185+05:45	2019-08-18 12:29:16.040518+05:45	{}	1	1
10	Decade Resistance box X 5 upto 1 MOhm	IFT	\N	2019-07-26	12	0	0	2019-07-26 07:42:14.25+05:45	2019-08-18 12:29:16.043178+05:45	{}	1	1
11	Decade Resistance box x 4 upto 100Ohm	IFT	\N	2019-07-26	12	0	0	2019-07-26 07:42:14.256+05:45	2019-08-18 12:29:16.046174+05:45	{}	1	1
12	CA 401 AMP Meter		\N	2019-07-26	7	0	0	2019-07-26 07:42:14.261+05:45	2019-08-18 12:29:16.049628+05:45	{}	1	1
13	Protek A432 Multimeter		\N	2019-07-26	9	0	0	2019-07-26 07:42:14.267+05:45	2019-08-18 12:29:16.052454+05:45	{}	1	1
14	Escoro Single Source 0: 30V Power Supply		\N	2019-07-26	1	0	0	2019-07-26 07:42:14.27+05:45	2019-08-18 12:29:16.055466+05:45	{}	1	1
15	Autonix Power Supply		\N	2019-07-26	1	0	0	2019-07-26 07:42:14.274+05:45	2019-08-18 12:29:16.058694+05:45	{}	1	1
16	Function Generator 5132 Philips		\N	2019-07-26	12	0	0	2019-07-26 07:42:14.277+05:45	2019-08-18 12:29:16.061607+05:45	{}	1	1
17	Protoboard		\N	2019-07-26	11	0	0	2019-07-26 07:42:14.28+05:45	2019-08-18 12:29:16.064867+05:45	{}	1	1
18	Pulse Generator Philips	PM5705	\N	2019-07-26	12	0	0	2019-07-26 07:42:14.283+05:45	2019-08-18 12:29:16.067728+05:45	{}	1	1
19	HP Digital Multimeter	34401A	\N	2019-07-26	12	0	0	2019-07-26 07:42:14.286+05:45	2019-08-18 12:29:16.069749+05:45	{}	1	1
20	Fluke/Philips RLC	PM6303A	\N	2019-07-26	1	0	0	2019-07-26 07:42:14.289+05:45	2019-08-18 12:29:16.072139+05:45	{}	1	1
21	Oscilloscope Hameg 30MHz	HM303-3	\N	2019-07-26	2	0	0	2019-07-26 07:42:14.292+05:45	2019-08-18 12:29:16.074702+05:45	{}	1	1
22	BK Precision Circuit Analyser		\N	2019-07-26	2	0	0	2019-07-26 07:42:14.296+05:45	2019-08-18 12:29:16.07759+05:45	{}	1	1
23	Curve Tracer	HM 8042	\N	2019-07-26	2	0	0	2019-07-26 07:42:14.299+05:45	2019-08-18 12:29:16.080582+05:45	{}	1	1
24	Dual Output Power Supply M.N	TW-5050D	\N	2019-07-26	6	0	0	2019-07-26 07:42:14.303+05:45	2019-08-18 12:29:16.083114+05:45	{}	1	1
25	Computer set NEC		\N	2019-07-26	1	0	0	2019-07-26 07:42:14.306+05:45	2019-08-18 12:29:16.085713+05:45	{}	1	1
26	Hitachi Multimedia Projector		\N	2019-07-26	1	0	0	2019-07-26 07:42:14.309+05:45	2019-08-18 12:29:16.088502+05:45	{}	1	1
27	Belmerit MT 100 all in one	MT-100	\N	2019-07-26	6	0	0	2019-07-26 09:14:19.509+05:45	2019-08-18 12:29:16.090993+05:45	{}	1	4
29	OP amp Kit- local made		\N	2019-07-26	6	0	0	2019-07-26 09:14:19.523+05:45	2019-08-18 12:29:16.096954+05:45	{}	1	4
30	Digital Electronics Trainer Kit	LTB-825	\N	2019-07-26	6	0	0	2019-07-26 09:14:19.527+05:45	2019-08-18 12:29:16.099887+05:45	{}	1	4
31	HP Oscilloscope 100 MHz	54600 B	\N	2019-07-26	6	0	0	2019-07-26 09:14:19.53+05:45	2019-08-18 12:29:16.102666+05:45	{}	1	4
32	Proto Tool Box		\N	2019-07-26	1	0	0	2019-07-26 09:14:19.533+05:45	2019-08-18 12:29:16.105455+05:45	{}	1	4
33	Experiment Table		\N	2019-07-26	6	0	0	2019-07-26 09:14:19.537+05:45	2019-08-18 12:29:16.108101+05:45	{}	1	4
34	Office Table	wooden	\N	2019-07-26	1	0	0	2019-07-26 09:14:19.54+05:45	2019-08-18 12:29:16.110464+05:45	{}	1	4
35	Cupboard common	Steel	\N	2019-07-26	1	0	0	2019-07-26 09:14:19.543+05:45	2019-08-18 12:29:16.113352+05:45	{}	1	4
36	Student Bag case	Steel	\N	2019-07-26	1	0	0	2019-07-26 09:14:19.546+05:45	2019-08-18 12:29:16.115916+05:45	{}	1	4
37	Telephone internal	Alcatel	\N	2019-07-26	1	0	0	2019-07-26 09:14:19.549+05:45	2019-08-18 12:29:16.118511+05:45	{}	1	4
38	Star Plus Battery 150Ah		\N	2019-07-26	4	0	0	2019-07-26 09:14:19.551+05:45	2019-08-18 12:29:16.121267+05:45	{}	1	4
39	Inverter D Sine 03K5		\N	2019-07-26	1	0	0	2019-07-26 09:14:19.555+05:45	2019-08-18 12:29:16.12417+05:45	{}	1	4
40	Student Bag case	steel	\N	2019-07-26	1	0	1	2019-07-26 09:26:04.414+05:45	2019-08-18 12:29:16.127105+05:45	{}	1	7
41	Experiment Table	wooden	\N	2019-07-26	12	0	12	2019-07-26 09:26:04.422+05:45	2019-08-18 12:29:16.130809+05:45	{}	1	7
42	Stool		\N	2019-07-26	24	0	24	2019-07-26 09:26:04.427+05:45	2019-08-18 12:29:16.133513+05:45	{}	1	7
43	Cupboard Common	steel	\N	2019-07-26	1	0	1	2019-07-26 09:26:04.43+05:45	2019-08-18 12:29:16.136485+05:45	{}	1	7
44	Projector Screen		\N	2019-07-26	1	0	1	2019-07-26 09:26:04.433+05:45	2019-08-18 12:29:16.139712+05:45	{}	1	7
45	NEC CPU	MG33LBZEEDVFSBZ	\N	2019-07-26	24	0	0	2019-07-26 09:57:19.613+05:45	2019-08-18 12:29:16.14255+05:45	{}	1	6
46	NEC Monitor	L190NU	\N	2019-07-26	24	0	0	2019-07-26 09:57:19.619+05:45	2019-08-18 12:29:16.145689+05:45	{}	1	6
47	Office Chair		\N	2019-07-26	1	0	0	2019-07-26 09:57:19.623+05:45	2019-08-18 12:29:16.148521+05:45	{}	1	6
48	Table		\N	2019-07-26	23	0	0	2019-07-26 09:57:19.627+05:45	2019-08-18 12:29:16.151087+05:45	{}	1	6
49	Stool		\N	2019-07-26	25	0	0	2019-07-26 09:57:19.671+05:45	2019-08-18 12:29:16.153517+05:45	{}	1	6
50	White Board		\N	2019-07-26	1	0	0	2019-07-26 09:57:19.675+05:45	2019-08-18 12:29:16.156356+05:45	{}	1	6
72	Answering Machine	Panasonic KX-T1000	\N	2019-07-28	1	0	0	2019-07-28 13:54:56.231+05:45	2019-08-18 12:29:16.159901+05:45	{}	1	3
73	Telephone Set	FeTAp 792-1	\N	2019-07-28	2	0	0	2019-07-28 13:54:56.283+05:45	2019-08-18 12:29:16.162641+05:45	{}	1	3
74	Air Cooler	Daikin	\N	2019-07-28	1	0	0	2019-07-28 13:54:56.29+05:45	2019-08-18 12:29:16.165212+05:45	{}	1	3
75	Steel Cabinet		\N	2019-07-28	11	0	0	2019-07-28 13:54:56.295+05:45	2019-08-18 12:29:16.167744+05:45	{}	1	3
76	Tool Box		\N	2019-07-28	1	0	0	2019-07-28 13:54:56.301+05:45	2019-08-18 12:29:16.170551+05:45	{}	1	3
77	Power Supply Module	ED 2900	\N	2019-07-28	6	0	0	2019-07-28 13:54:56.306+05:45	2019-08-18 12:29:16.173001+05:45	{}	1	3
79	Bel-Merit-All in One Instrument	MT-100	\N	2019-07-28	5	0	0	2019-07-28 13:54:56.314+05:45	2019-08-18 12:29:16.178998+05:45	{}	1	3
80	Function Generator	TCE 7708	\N	2019-07-28	5	0	0	2019-07-28 13:54:56.321+05:45	2019-08-18 12:29:16.181541+05:45	{}	1	3
81	Project Board with Power Supply	Breadboards	\N	2019-07-28	6	0	0	2019-07-28 13:54:56.327+05:45	2019-08-18 12:29:16.184471+05:45	{}	1	3
82	Audio Generator	LEADER LAG 26	\N	2019-07-28	4	0	0	2019-07-28 13:54:56.332+05:45	2019-08-18 12:29:16.187388+05:45	{}	1	3
83	Sweep Function Generator(10MHz)	BK Precision 4017	\N	2019-07-28	3	0	0	2019-07-28 13:54:56.336+05:45	2019-08-18 12:29:16.190365+05:45	{}	1	3
84	RT Signal Generator	BK Precision 2005A	\N	2019-07-28	3	0	0	2019-07-28 13:54:56.343+05:45	2019-08-18 12:29:16.193396+05:45	{}	1	3
85	EMI Test Receiver	Rhode & Swartz ESHS 10	\N	2019-07-28	1	0	0	2019-07-28 13:54:56.347+05:45	2019-08-18 12:29:16.197457+05:45	{}	1	3
86	Loop Antenna(Rhode & Schwarz)	HFH2-Z2-335.171132	\N	2019-07-28	1	0	0	2019-07-28 13:54:56.351+05:45	2019-08-18 12:29:16.200594+05:45	{}	1	3
87	Tripod for Loop Antenna(Rhode & Schwarz)		\N	2019-07-28	1	0	0	2019-07-28 13:54:56.355+05:45	2019-08-18 12:29:16.203392+05:45	{}	1	3
88	Microwave Trainer Kit	ED 3000	\N	2019-07-28	6	0	0	2019-07-28 13:54:56.359+05:45	2019-08-18 12:29:16.206153+05:45	{}	1	3
89	SWR Meter	SWR 3002	\N	2019-07-28	6	0	0	2019-07-28 13:54:56.363+05:45	2019-08-18 12:29:16.208799+05:45	{}	1	3
110	Telephone Exchange Trainer Kit	TPS 7.1.7 Keybold Telephone Technology	\N	2019-07-28	1	0	0	2019-07-28 14:06:21.87+05:45	2019-07-28 14:06:21.87+05:45	{}	3	3
111	Digital Communication Trainer Kit	ED 2970	\N	2019-07-28	6	0	0	2019-07-28 14:07:08.054+05:45	2019-07-28 14:07:46.126+05:45	{}	3	3
112	Analog Communication Trainer Kit	ED 2950	\N	2019-07-28	6	0	0	2019-07-28 14:07:34.322+05:45	2019-07-28 14:07:34.322+05:45	{}	3	3
94	Trainer Antenna Kit	E15 D	\N	2019-07-28	4	0	0	2019-07-28 13:54:56.385+05:45	2019-08-18 12:29:16.223776+05:45	{}	1	3
95	Advance Antenna Unit	E15L	\N	2019-07-28	1	0	0	2019-07-28 14:04:21.487+05:45	2019-08-18 12:29:16.22647+05:45	{}	1	3
96	Fiber Optic Trainer Receiver	E15T	\N	2019-07-28	6	0	0	2019-07-28 14:04:21.493+05:45	2019-08-18 12:29:16.229367+05:45	{}	1	3
97	Fiber Optic Trainer transmitter	E15T	\N	2019-07-28	6	0	0	2019-07-28 14:04:21.496+05:45	2019-08-18 12:29:16.232255+05:45	{}	1	3
98	Digital Multimeter	Keithley 195A	\N	2019-07-28	1	0	0	2019-07-28 14:04:21.5+05:45	2019-08-18 12:29:16.234846+05:45	{}	1	3
99	Temperature Controlled Chamber	Tenney	\N	2019-07-28	1	0	0	2019-07-28 14:04:21.502+05:45	2019-08-18 12:29:16.237475+05:45	{}	1	3
100	Projector Screen		\N	2019-07-28	1	0	0	2019-07-28 14:04:21.506+05:45	2019-08-18 12:29:16.239993+05:45	{}	1	3
101	HF Power Meter	PM3001	\N	2019-07-28	6	0	0	2019-07-28 14:04:21.508+05:45	2019-08-18 12:29:16.242573+05:45	{}	1	3
102	Vernier Calliper		\N	2019-07-28	6	0	0	2019-07-28 14:04:21.511+05:45	2019-08-18 12:29:16.245288+05:45	{}	1	3
103	Experiment Lab Table		\N	2019-07-28	8	0	0	2019-07-28 14:04:21.514+05:45	2019-08-18 12:29:16.247894+05:45	{}	1	3
104	Stool		\N	2019-07-28	24	0	0	2019-07-28 14:04:21.517+05:45	2019-08-18 12:29:16.250332+05:45	{}	1	3
105	Officer Table		\N	2019-07-28	2	0	0	2019-07-28 14:04:21.52+05:45	2019-08-18 12:29:16.252762+05:45	{}	1	3
106	Office Chair		\N	2019-07-28	1	0	0	2019-07-28 14:04:21.523+05:45	2019-08-18 12:29:16.255118+05:45	{}	1	3
107	Table Lamp Set	Naska Leris	\N	2019-07-28	8	0	0	2019-07-28 14:04:21.527+05:45	2019-08-18 12:29:16.257804+05:45	{}	1	3
108	Telephone Set	Mitel Sunerset 410	\N	2019-07-28	3	0	0	2019-07-28 14:04:21.53+05:45	2019-08-18 12:29:16.260518+05:45	{}	1	3
4	Office Table	\N	\N	2019-07-26	1	0	0	2019-07-26 07:19:56.198+05:45	2019-08-18 12:29:16.026611+05:45	{}	1	1
28	Discrete Component Kit	Tesca-36185	\N	2019-07-26	4	0	0	2019-07-26 09:14:19.519+05:45	2019-08-18 12:29:16.094019+05:45	{}	1	4
78	Hewlett Packard Oscilloscope(100MHz)	HP 54600B	\N	2019-07-28	5	0	0	2019-07-28 13:54:56.31+05:45	2019-08-18 12:29:16.175576+05:45	{}	1	3
90	Universal Counter	BK PRECESSION 1823	\N	2019-07-28	3	0	0	2019-07-28 13:54:56.367+05:45	2019-08-18 12:29:16.211654+05:45	{}	1	3
91	Spectrum Analyzer	Protek-P 7802	\N	2019-07-28	3	0	0	2019-07-28 13:54:56.371+05:45	2019-08-18 12:29:16.215535+05:45	{}	1	3
92	True RMS Multimeter	BK precisson 2833	\N	2019-07-28	3	0	0	2019-07-28 13:54:56.374+05:45	2019-08-18 12:29:16.218173+05:45	{}	1	3
93	25 MHz Dual Trace Oscilloscope	Bel Merit 3304	\N	2019-07-28	1	0	0	2019-07-28 13:54:56.379+05:45	2019-08-18 12:29:16.221101+05:45	{}	1	3
109	Telephone Set	Premier 2500	\N	2019-07-28	7	0	0	2019-07-28 14:04:21.533+05:45	2019-08-18 12:29:16.263357+05:45	{}	1	3
8	Universal Counter	5315A	\N	2019-07-26	6	0	0	2019-07-26 07:25:56.412+05:45	2019-08-18 12:29:16.265954+05:45	{}	1	1
130	chair	steek	\N	2019-08-18	25	0	0	2019-08-18 14:14:06.851298+05:45	2019-08-18 14:14:06.860486+05:45	{}	1	1
124	Generic	Generic	\N	2019-07-30	3	0	0	2019-07-30 14:11:41.398306+05:45	2019-08-22 09:17:12.328039+05:45	{"Brand1": "asdsa", "Brand2": "wefs", "Brand8": "sdvscs"}	6	79
125	Generic	Generic	\N	2019-07-30	2	1	2	2019-07-30 14:12:48.372317+05:45	2019-08-22 09:17:12.331542+05:45	{"Brand1": "asdsa", "Brand2": "wefs", "Brand8": "sdvscs"}	6	80
126	Genericjbgjbj	Generic	\N	2019-08-02	10	0	0	2019-08-02 12:59:24.638246+05:45	2019-08-22 09:17:12.334326+05:45	{"Brand1": "refsda", "Brand2": "fesrdgfg", "Brand8": "fgdsa"}	6	80
\.


--
-- Data for Name: inventory_room; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_room (id, room_no, room_name, floor_id) FROM stdin;
1	1	Basic Lab -1	1
2	2	Advance Computer Lab	1
3	3	Electronic and Communication Lab	1
4	4	Basic Lab -2	1
5	5	Project Lab	1
6	6	DBMS Lab	1
7	7	General Computer Lab	1
79	69	Generic	1
80	0	Store	1
\.


--
-- Data for Name: inventory_subitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_subitem (id, name, model, cost_per_item, working, in_maintenance, out_of_order, item_id) FROM stdin;
2	Superhet Receiver	ED 2960B	\N	6	0	0	62
3	Double Sideband	ED 2960C	\N	6	0	0	62
4	Single Sideband	ED 2960D	\N	6	0	0	62
5	Sample Hold and Multiplex	ED 2960 E	\N	6	0	0	62
6	Pulse Code Modulator	ED 2960F	\N	6	0	0	62
7	Delta Modulator	ED 2960G	\N	6	0	0	62
25	73551 Handset with Cradle Content	\N	\N	1	0	0	110
26	73553 Pulse Dialer Push Button	\N	\N	1	0	0	110
27	73580 Subscriber Matching Unit	\N	\N	1	0	0	110
28	73554 Dialer Push Button	\N	\N	1	0	0	110
29	72689 Power Supply 28v 12v	\N	\N	1	0	0	110
30	73581 Multi Frequency Receiver	\N	\N	1	0	0	110
31	73582 Mux and Demux	\N	\N	1	0	0	110
32	73583 Switching System	\N	\N	1	0	0	110
33	73586 Control Unit	\N	\N	1	0	0	110
34	Data Source	ED 2970 A	\N	6	0	0	111
35	Data Format	ED 2970 B	\N	6	0	0	111
36	Double Balanced Modulators	ED 2970 C	\N	6	0	0	111
37	Carrier Phase Shifter	ED 2970 D	\N	6	0	0	111
38	VCO	ED 2970 E	\N	6	0	0	111
39	Data Clock Regenerator	ED 2970 F	\N	6	0	0	111
40	Data Recovery	ED 2970 G	\N	6	0	0	111
41	Data Recovery	ED 2970 H	\N	6	0	0	111
42	Low Pass Filter	ED 2970 J	\N	6	0	0	111
43	Audio Module	ED 2970 K	\N	6	0	0	111
44	Tuned Circuit	ED 2970 L	\N	6	0	0	111
45	Power Supply	ED 2970 M	\N	6	0	0	111
46	Signal Source	ED 2950 A	\N	6	0	0	112
47	Amplifier	ED 2950 B	\N	6	0	0	112
48	Detector	ED 2950 C	\N	6	0	0	112
49	Balanced Modulator	ED 2950 D	\N	6	0	0	112
50	Active Filter	ED 2950 E	\N	6	0	0	112
51	Passive Filter & Diode Bridge	ED 2950 F	\N	6	0	0	112
52	Tuned Circuit	ED 2950 H	\N	6	0	0	112
53	Crystal Unit	ED 2950 J	\N	6	0	0	112
54	Aerial Unit	ED 2950 K	\N	6	0	0	112
1	Waveform Generator/Analyzer	ED 2960A	\N	11	0	0	62
58	Generic	Generic	875.00	20	0	0	126
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 26, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: inventory_categorie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inventory_categorie_id_seq', 11, true);


--
-- Name: inventory_floor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inventory_floor_id_seq', 4, true);


--
-- Name: inventory_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inventory_item_id_seq', 130, true);


--
-- Name: inventory_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inventory_room_id_seq', 80, true);


--
-- Name: inventory_subitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inventory_subitem_id_seq', 60, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: inventory_categorie inventory_categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_categorie
    ADD CONSTRAINT inventory_categorie_pkey PRIMARY KEY (id);


--
-- Name: inventory_floor inventory_floor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_floor
    ADD CONSTRAINT inventory_floor_pkey PRIMARY KEY (id);


--
-- Name: inventory_item inventory_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_pkey PRIMARY KEY (id);


--
-- Name: inventory_room inventory_room_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_room
    ADD CONSTRAINT inventory_room_pkey PRIMARY KEY (id);


--
-- Name: inventory_subitem inventory_subitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_subitem
    ADD CONSTRAINT inventory_subitem_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: inventory_item_category_id_44f2108d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_item_category_id_44f2108d ON public.inventory_item USING btree (category_id);


--
-- Name: inventory_item_room_id_80654f8c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_item_room_id_80654f8c ON public.inventory_item USING btree (room_id);


--
-- Name: inventory_room_floor_id_523d9a01; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_room_floor_id_523d9a01 ON public.inventory_room USING btree (floor_id);


--
-- Name: inventory_subitem_item_id_53d499d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_subitem_item_id_53d499d3 ON public.inventory_subitem USING btree (item_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_item inventory_item_category_id_44f2108d_fk_inventory_categorie_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_category_id_44f2108d_fk_inventory_categorie_id FOREIGN KEY (category_id) REFERENCES public.inventory_categorie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_item inventory_item_room_id_80654f8c_fk_inventory_room_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_room_id_80654f8c_fk_inventory_room_id FOREIGN KEY (room_id) REFERENCES public.inventory_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_room inventory_room_floor_id_523d9a01_fk_inventory_floor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_room
    ADD CONSTRAINT inventory_room_floor_id_523d9a01_fk_inventory_floor_id FOREIGN KEY (floor_id) REFERENCES public.inventory_floor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_subitem inventory_subitem_item_id_53d499d3_fk_inventory_item_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_subitem
    ADD CONSTRAINT inventory_subitem_item_id_53d499d3_fk_inventory_item_id FOREIGN KEY (item_id) REFERENCES public.inventory_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

