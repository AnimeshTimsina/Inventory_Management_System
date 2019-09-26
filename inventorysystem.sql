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
    name character varying(80) NOT NULL
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
-- Name: inventory_computer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_computer (
    id character varying(20) NOT NULL,
    cost numeric(10,2),
    status character varying(2) NOT NULL,
    created timestamp with time zone,
    last_modified timestamp with time zone,
    model character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    room_id character varying(20),
    date_of_acquire date NOT NULL,
    serial_no character varying(50)
);


--
-- Name: inventory_laptop; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_laptop (
    id character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    cost numeric(10,2),
    status character varying(2) NOT NULL,
    created timestamp with time zone,
    last_modified timestamp with time zone,
    date_of_acquire date NOT NULL,
    room_id character varying(20),
    serial_no character varying(50)
);


--
-- Name: inventory_networkswitch; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_networkswitch (
    id character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    no_of_ports smallint NOT NULL,
    cost numeric(10,2),
    status character varying(2) NOT NULL,
    created timestamp with time zone,
    last_modified timestamp with time zone,
    room_id character varying(20),
    date_of_acquire date NOT NULL,
    "no_of_SFP_ports" smallint NOT NULL,
    serial_no character varying(50),
    CONSTRAINT "inventory_networkswitch_no_of_SFP_ports_check" CHECK (("no_of_SFP_ports" >= 0)),
    CONSTRAINT inventory_networkswitch_no_of_ports_check CHECK ((no_of_ports >= 0))
);


--
-- Name: inventory_printer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_printer (
    id character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    cost numeric(10,2),
    status character varying(2) NOT NULL,
    created timestamp with time zone,
    last_modified timestamp with time zone,
    room_id character varying(20),
    date_of_acquire date NOT NULL,
    ip_address inet NOT NULL,
    serial_no character varying(50)
);


--
-- Name: inventory_room; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_room (
    id character varying(20) NOT NULL,
    floor smallint NOT NULL,
    CONSTRAINT inventory_room_floor_check CHECK ((floor >= 0))
);


--
-- Name: inventory_roomhasadditionalitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_roomhasadditionalitem (
    id character varying(20) NOT NULL,
    last_modified timestamp with time zone,
    room_id character varying(20),
    cost numeric(10,2),
    created timestamp with time zone,
    date_of_acquire date NOT NULL,
    model character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    serial_no character varying(50),
    status character varying(2) NOT NULL
);


--
-- Name: inventory_roomhasadditionalitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inventory_roomhasadditionalitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_roomhasadditionalitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inventory_roomhasadditionalitem_id_seq OWNED BY public.inventory_roomhasadditionalitem.id;


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
-- Name: inventory_roomhasadditionalitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_roomhasadditionalitem ALTER COLUMN id SET DEFAULT nextval('public.inventory_roomhasadditionalitem_id_seq'::regclass);


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
19	Can add computer	7	add_computer
20	Can change computer	7	change_computer
21	Can delete computer	7	delete_computer
22	Can add printer	8	add_printer
23	Can change printer	8	change_printer
24	Can delete printer	8	delete_printer
25	Can add network switch	9	add_networkswitch
26	Can change network switch	9	change_networkswitch
27	Can delete network switch	9	delete_networkswitch
28	Can add additional item	10	add_additionalitem
29	Can change additional item	10	change_additionalitem
30	Can delete additional item	10	delete_additionalitem
31	Can add room	11	add_room
32	Can change room	11	change_room
33	Can delete room	11	delete_room
34	Can add room has additional item	12	add_roomhasadditionalitem
35	Can change room has additional item	12	change_roomhasadditionalitem
36	Can delete room has additional item	12	delete_roomhasadditionalitem
37	Can add store item name	13	add_storeitemname
38	Can change store item name	13	change_storeitemname
39	Can delete store item name	13	delete_storeitemname
40	Can add store item	14	add_storeitem
41	Can change store item	14	change_storeitem
42	Can delete store item	14	delete_storeitem
43	Can add laptop	15	add_laptop
44	Can change laptop	15	change_laptop
45	Can delete laptop	15	delete_laptop
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$ZRxzsykGgQ12$+HlJrJQGJ5HVU2MiHB6R3T2fh5lxtUaeYy2mC7Fe0do=	2019-01-17 15:18:29.891611+05:45	t	animesh			asdasd@gmail.com	t	t	2018-12-24 12:27:46.138388+05:45
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
1	2018-12-24 12:37:33.501752+05:45	1	1	1	[{"added": {}}]	11	1
2	2018-12-24 12:37:36.518541+05:45	1	1-Generic-Generic	1	[{"added": {}}]	7	1
3	2018-12-24 12:37:56.699878+05:45	2	2-Generic-Generic	1	[{"added": {}}]	7	1
4	2018-12-24 12:38:05.045848+05:45	2	2	1	[{"added": {}}]	11	1
5	2018-12-24 12:38:11.971424+05:45	3	3	1	[{"added": {}}]	11	1
6	2018-12-24 12:38:45.312256+05:45	3	3-Dell-2233	1	[{"added": {}}]	7	1
7	2018-12-24 12:39:10.272256+05:45	4	4-Asus-7dy7ad	1	[{"added": {}}]	7	1
8	2018-12-24 12:39:41.762493+05:45	8	8-Apple-Macbook	1	[{"added": {}}]	15	1
9	2018-12-24 12:40:48.800693+05:45	33	Earphone - 33	1	[{"added": {}}]	10	1
10	2018-12-24 12:40:55.831682+05:45	1	2 - Earphone	1	[{"added": {}}]	12	1
11	2019-01-17 15:19:47.300612+05:45	4	4	1	[{"added": {}}]	11	1
12	2019-01-17 15:20:47.575118+05:45	500	500-Zebra-Generic	1	[{"added": {}}]	12	1
13	2019-01-17 15:21:05.087981+05:45	99999	99999-adsa-asda	1	[{"added": {}}]	12	1
14	2019-01-17 15:23:42.010834+05:45	7777123	7777123-Zebra-Generic	1	[{"added": {}}]	12	1
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
7	inventory	computer
8	inventory	printer
9	inventory	networkswitch
10	inventory	additionalitem
11	inventory	room
12	inventory	roomhasadditionalitem
13	inventory	storeitemname
14	inventory	storeitem
15	inventory	laptop
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-12-24 12:26:41.421665+05:45
2	auth	0001_initial	2018-12-24 12:26:41.552522+05:45
3	admin	0001_initial	2018-12-24 12:26:41.593388+05:45
4	admin	0002_logentry_remove_auto_add	2018-12-24 12:26:41.605443+05:45
5	contenttypes	0002_remove_content_type_name	2018-12-24 12:26:41.634077+05:45
6	auth	0002_alter_permission_name_max_length	2018-12-24 12:26:41.644869+05:45
7	auth	0003_alter_user_email_max_length	2018-12-24 12:26:41.659099+05:45
8	auth	0004_alter_user_username_opts	2018-12-24 12:26:41.67621+05:45
9	auth	0005_alter_user_last_login_null	2018-12-24 12:26:41.694602+05:45
10	auth	0006_require_contenttypes_0002	2018-12-24 12:26:41.698279+05:45
11	auth	0007_alter_validators_add_error_messages	2018-12-24 12:26:41.712106+05:45
12	auth	0008_alter_user_username_max_length	2018-12-24 12:26:41.735574+05:45
13	auth	0009_alter_user_last_name_max_length	2018-12-24 12:26:41.75149+05:45
14	inventory	0001_initial	2018-12-24 12:26:41.766166+05:45
15	inventory	0002_auto_20180717_0427	2018-12-24 12:26:41.77246+05:45
16	inventory	0003_auto_20180717_0428	2018-12-24 12:26:41.778147+05:45
17	inventory	0004_auto_20180717_0441	2018-12-24 12:26:41.79647+05:45
18	inventory	0005_auto_20180717_0443	2018-12-24 12:26:41.821319+05:45
19	inventory	0006_printer	2018-12-24 12:26:41.835524+05:45
20	inventory	0007_networkswitch	2018-12-24 12:26:41.851269+05:45
21	inventory	0008_auto_20180717_1650	2018-12-24 12:26:41.902865+05:45
22	inventory	0009_storeitem_storeitemname	2018-12-24 12:26:41.925335+05:45
23	inventory	0010_auto_20180722_0917	2018-12-24 12:26:41.937785+05:45
24	inventory	0011_auto_20180722_0921	2018-12-24 12:26:41.960227+05:45
25	inventory	0012_computer_room	2018-12-24 12:26:41.978514+05:45
26	inventory	0013_auto_20180817_0912	2018-12-24 12:26:42.017312+05:45
27	inventory	0014_auto_20180817_0928	2018-12-24 12:26:42.239738+05:45
28	inventory	0015_auto_20180917_1824	2018-12-24 12:26:42.331232+05:45
29	sessions	0001_initial	2018-12-24 12:26:42.352422+05:45
30	inventory	0016_auto_20190117_1518	2019-01-17 15:18:14.450177+05:45
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
bmlv0020p09rd9q64v2c7sv0ep3m5g1p	ZTExZjU0YzBlOTYxNDY5ZGIyZTZiMmIzOWFhZTEyYjgyMzUzM2UwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MWU0YzA4NGEyOTFkMjgyM2RjOTUzMGViMDNkNWQ1MDZmODNlYTVlIn0=	2019-01-07 12:43:46.553353+05:45
48hrxl9mn5rs6dp8wdz62l9mvolb6gvu	ZTExZjU0YzBlOTYxNDY5ZGIyZTZiMmIzOWFhZTEyYjgyMzUzM2UwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MWU0YzA4NGEyOTFkMjgyM2RjOTUzMGViMDNkNWQ1MDZmODNlYTVlIn0=	2019-01-19 15:38:34.740779+05:45
qxzsqyh2u83j1x67xcpy8xnal71d3dwo	ZTExZjU0YzBlOTYxNDY5ZGIyZTZiMmIzOWFhZTEyYjgyMzUzM2UwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MWU0YzA4NGEyOTFkMjgyM2RjOTUzMGViMDNkNWQ1MDZmODNlYTVlIn0=	2019-01-20 18:25:01.973486+05:45
7duxe92o5hjhqgbrslsdiuwa3p6tw1vm	ZTExZjU0YzBlOTYxNDY5ZGIyZTZiMmIzOWFhZTEyYjgyMzUzM2UwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MWU0YzA4NGEyOTFkMjgyM2RjOTUzMGViMDNkNWQ1MDZmODNlYTVlIn0=	2019-01-31 14:22:33.460482+05:45
rnkzqfq0lxp7sl7lvfoxw4t6exbqw7f3	ZTExZjU0YzBlOTYxNDY5ZGIyZTZiMmIzOWFhZTEyYjgyMzUzM2UwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MWU0YzA4NGEyOTFkMjgyM2RjOTUzMGViMDNkNWQ1MDZmODNlYTVlIn0=	2019-01-31 15:18:29.895423+05:45
\.


--
-- Data for Name: inventory_computer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_computer (id, cost, status, created, last_modified, model, name, room_id, date_of_acquire, serial_no) FROM stdin;
1	50000.00	WK	2018-12-24 12:37:36.516798+05:45	2018-12-24 12:37:36.51683+05:45	Generic	Generic	1	2018-12-24	1
2	100000.00	WK	2018-12-24 12:37:56.699043+05:45	2018-12-24 12:37:56.699062+05:45	Generic	Generic	1	2018-12-24	2
3	34444.00	OO	2018-12-24 12:38:45.311378+05:45	2018-12-24 12:38:45.311401+05:45	2233	Dell	2	2018-12-24	32
4	77777.00	IM	2018-12-24 12:39:10.271134+05:45	2018-12-24 12:39:10.271171+05:45	7dy7ad	Asus	3	2018-12-24	789
\.


--
-- Data for Name: inventory_laptop; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_laptop (id, name, model, cost, status, created, last_modified, date_of_acquire, room_id, serial_no) FROM stdin;
8	Apple	Macbook	200000.00	WK	2018-12-24 12:39:41.761088+05:45	2018-12-24 12:39:41.76111+05:45	2018-12-24	\N	23423
\.


--
-- Data for Name: inventory_networkswitch; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_networkswitch (id, name, model, no_of_ports, cost, status, created, last_modified, room_id, date_of_acquire, "no_of_SFP_ports", serial_no) FROM stdin;
\.


--
-- Data for Name: inventory_printer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_printer (id, name, model, cost, status, created, last_modified, room_id, date_of_acquire, ip_address, serial_no) FROM stdin;
\.


--
-- Data for Name: inventory_room; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_room (id, floor) FROM stdin;
1	1
2	2
3	3
4	2
\.


--
-- Data for Name: inventory_roomhasadditionalitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_roomhasadditionalitem (id, last_modified, room_id, cost, created, date_of_acquire, model, name, serial_no, status) FROM stdin;
1	2018-12-24 12:40:55.827683+05:45	2	\N	2019-01-17 15:18:14.252675+05:45	2019-01-17	Generic	Generic	\N	WK
500	2019-01-17 15:20:47.570952+05:45	3	788.00	2019-01-17 15:20:47.57091+05:45	2019-01-17	Generic	Zebra	123	WK
99999	2019-01-17 15:21:05.087151+05:45	2	123213.00	2019-01-17 15:21:05.087129+05:45	2019-01-17	asda	adsa	21312	OO
7777123	2019-01-17 15:23:42.00955+05:45	1	99999999.00	2019-01-17 15:23:42.009525+05:45	2019-01-17	Generic	Zebra	32	WK
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 45, true);


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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 14, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: inventory_roomhasadditionalitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inventory_roomhasadditionalitem_id_seq', 1, true);


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
-- Name: inventory_computer inventory_computer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_computer
    ADD CONSTRAINT inventory_computer_pkey PRIMARY KEY (id);


--
-- Name: inventory_computer inventory_computer_serial_no_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_computer
    ADD CONSTRAINT inventory_computer_serial_no_key UNIQUE (serial_no);


--
-- Name: inventory_laptop inventory_laptop_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_laptop
    ADD CONSTRAINT inventory_laptop_pkey PRIMARY KEY (id);


--
-- Name: inventory_laptop inventory_laptop_serial_no_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_laptop
    ADD CONSTRAINT inventory_laptop_serial_no_key UNIQUE (serial_no);


--
-- Name: inventory_networkswitch inventory_networkswitch_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_networkswitch
    ADD CONSTRAINT inventory_networkswitch_pkey PRIMARY KEY (id);


--
-- Name: inventory_networkswitch inventory_networkswitch_serial_no_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_networkswitch
    ADD CONSTRAINT inventory_networkswitch_serial_no_key UNIQUE (serial_no);


--
-- Name: inventory_printer inventory_printer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_printer
    ADD CONSTRAINT inventory_printer_pkey PRIMARY KEY (id);


--
-- Name: inventory_printer inventory_printer_serial_no_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_printer
    ADD CONSTRAINT inventory_printer_serial_no_key UNIQUE (serial_no);


--
-- Name: inventory_room inventory_room_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_room
    ADD CONSTRAINT inventory_room_pkey PRIMARY KEY (id);


--
-- Name: inventory_roomhasadditionalitem inventory_roomhasadditionalitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_roomhasadditionalitem
    ADD CONSTRAINT inventory_roomhasadditionalitem_pkey PRIMARY KEY (id);


--
-- Name: inventory_roomhasadditionalitem inventory_roomhasadditionalitem_serial_no_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_roomhasadditionalitem
    ADD CONSTRAINT inventory_roomhasadditionalitem_serial_no_key UNIQUE (serial_no);


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
-- Name: inventory_computer_id_6ea7d79b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_computer_id_6ea7d79b_like ON public.inventory_computer USING btree (id varchar_pattern_ops);


--
-- Name: inventory_computer_room_id_7ff63d6d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_computer_room_id_7ff63d6d ON public.inventory_computer USING btree (room_id);


--
-- Name: inventory_computer_room_id_7ff63d6d_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_computer_room_id_7ff63d6d_like ON public.inventory_computer USING btree (room_id varchar_pattern_ops);


--
-- Name: inventory_computer_serial_no_305faaa7_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_computer_serial_no_305faaa7_like ON public.inventory_computer USING btree (serial_no varchar_pattern_ops);


--
-- Name: inventory_laptop_id_c325af49_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_laptop_id_c325af49_like ON public.inventory_laptop USING btree (id varchar_pattern_ops);


--
-- Name: inventory_laptop_room_id_c0da2cc3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_laptop_room_id_c0da2cc3 ON public.inventory_laptop USING btree (room_id);


--
-- Name: inventory_laptop_room_id_c0da2cc3_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_laptop_room_id_c0da2cc3_like ON public.inventory_laptop USING btree (room_id varchar_pattern_ops);


--
-- Name: inventory_laptop_serial_no_7399b45a_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_laptop_serial_no_7399b45a_like ON public.inventory_laptop USING btree (serial_no varchar_pattern_ops);


--
-- Name: inventory_networkswitch_id_e6831254_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_networkswitch_id_e6831254_like ON public.inventory_networkswitch USING btree (id varchar_pattern_ops);


--
-- Name: inventory_networkswitch_room_id_123e5d8a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_networkswitch_room_id_123e5d8a ON public.inventory_networkswitch USING btree (room_id);


--
-- Name: inventory_networkswitch_room_id_123e5d8a_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_networkswitch_room_id_123e5d8a_like ON public.inventory_networkswitch USING btree (room_id varchar_pattern_ops);


--
-- Name: inventory_networkswitch_serial_no_d9aa2fa8_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_networkswitch_serial_no_d9aa2fa8_like ON public.inventory_networkswitch USING btree (serial_no varchar_pattern_ops);


--
-- Name: inventory_printer_id_c4313b51_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_printer_id_c4313b51_like ON public.inventory_printer USING btree (id varchar_pattern_ops);


--
-- Name: inventory_printer_room_id_38119ec5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_printer_room_id_38119ec5 ON public.inventory_printer USING btree (room_id);


--
-- Name: inventory_printer_room_id_38119ec5_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_printer_room_id_38119ec5_like ON public.inventory_printer USING btree (room_id varchar_pattern_ops);


--
-- Name: inventory_printer_serial_no_445b484b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_printer_serial_no_445b484b_like ON public.inventory_printer USING btree (serial_no varchar_pattern_ops);


--
-- Name: inventory_room_id_53e40c39_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_room_id_53e40c39_like ON public.inventory_room USING btree (id varchar_pattern_ops);


--
-- Name: inventory_roomhasadditionalitem_room_id_f378b506; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_roomhasadditionalitem_room_id_f378b506 ON public.inventory_roomhasadditionalitem USING btree (room_id);


--
-- Name: inventory_roomhasadditionalitem_room_id_f378b506_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_roomhasadditionalitem_room_id_f378b506_like ON public.inventory_roomhasadditionalitem USING btree (room_id varchar_pattern_ops);


--
-- Name: inventory_roomhasadditionalitem_serial_no_59a128de_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_roomhasadditionalitem_serial_no_59a128de_like ON public.inventory_roomhasadditionalitem USING btree (serial_no varchar_pattern_ops);


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
-- Name: inventory_computer inventory_computer_room_id_7ff63d6d_fk_inventory_room_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_computer
    ADD CONSTRAINT inventory_computer_room_id_7ff63d6d_fk_inventory_room_id FOREIGN KEY (room_id) REFERENCES public.inventory_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_laptop inventory_laptop_room_id_c0da2cc3_fk_inventory_room_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_laptop
    ADD CONSTRAINT inventory_laptop_room_id_c0da2cc3_fk_inventory_room_id FOREIGN KEY (room_id) REFERENCES public.inventory_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_networkswitch inventory_networkswitch_room_id_123e5d8a_fk_inventory_room_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_networkswitch
    ADD CONSTRAINT inventory_networkswitch_room_id_123e5d8a_fk_inventory_room_id FOREIGN KEY (room_id) REFERENCES public.inventory_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_printer inventory_printer_room_id_38119ec5_fk_inventory_room_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_printer
    ADD CONSTRAINT inventory_printer_room_id_38119ec5_fk_inventory_room_id FOREIGN KEY (room_id) REFERENCES public.inventory_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_roomhasadditionalitem inventory_roomhasadd_room_id_f378b506_fk_inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_roomhasadditionalitem
    ADD CONSTRAINT inventory_roomhasadd_room_id_f378b506_fk_inventory FOREIGN KEY (room_id) REFERENCES public.inventory_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

