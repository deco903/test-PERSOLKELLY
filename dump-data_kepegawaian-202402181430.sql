--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2024-02-18 14:30:04

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 20054)
-- Name: education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    name character varying(255) NOT NULL,
    level character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    created_by character varying(255) NOT NULL,
    updated_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT education_level_check CHECK (((level)::text = ANY ((ARRAY['tk'::character varying, 'sd'::character varying, 'sma'::character varying, 'strata-1'::character varying, 'strata-2'::character varying, 'doktor'::character varying, 'profesor'::character varying])::text[])))
);


ALTER TABLE public.education OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 20053)
-- Name: education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.education_id_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 229
-- Name: education_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.education_id_seq OWNED BY public.education.id;


--
-- TOC entry 224 (class 1259 OID 19999)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id bigint NOT NULL,
    nik character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    created_by character varying(255) NOT NULL,
    updated_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 20038)
-- Name: employee_family; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_family (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    name character varying(255) NOT NULL,
    identifier character varying(255) NOT NULL,
    job character varying(255) NOT NULL,
    place_of_birth character varying NOT NULL,
    date_of_birth date NOT NULL,
    religion character varying(255) NOT NULL,
    is_life boolean NOT NULL,
    is_divorced boolean NOT NULL,
    relation_status character varying(255) NOT NULL,
    created_by character varying(255) NOT NULL,
    updated_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT employee_family_relation_status_check CHECK (((relation_status)::text = ANY ((ARRAY['suami'::character varying, 'istri'::character varying, 'anak'::character varying, 'anak sambung'::character varying])::text[]))),
    CONSTRAINT employee_family_religion_check CHECK (((religion)::text = ANY ((ARRAY['islam'::character varying, 'katolik'::character varying, 'buda'::character varying, 'protestan'::character varying, 'konghucu'::character varying])::text[])))
);


ALTER TABLE public.employee_family OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 20037)
-- Name: employee_family_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_family_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_family_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 227
-- Name: employee_family_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_family_id_seq OWNED BY public.employee_family.id;


--
-- TOC entry 223 (class 1259 OID 19998)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 223
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- TOC entry 226 (class 1259 OID 20023)
-- Name: employee_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_profile (
    id bigint NOT NULL,
    employee_id integer NOT NULL,
    place_of_birth character varying NOT NULL,
    date_of_birth date NOT NULL,
    gender character varying(255) NOT NULL,
    is_married boolean NOT NULL,
    prof_pic character varying(255) NOT NULL,
    created_by character varying(255) NOT NULL,
    updated_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT employee_profile_gender_check CHECK (((gender)::text = ANY ((ARRAY['laki-laki'::character varying, 'perempuan'::character varying])::text[])))
);


ALTER TABLE public.employee_profile OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 20022)
-- Name: employee_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_profile_id_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 225
-- Name: employee_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_profile_id_seq OWNED BY public.employee_profile.id;


--
-- TOC entry 220 (class 1259 OID 19975)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 19974)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 219
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 215 (class 1259 OID 19951)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 19950)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 214
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 218 (class 1259 OID 19968)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 19987)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 19986)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 221
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 217 (class 1259 OID 19958)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 19957)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3220 (class 2604 OID 20057)
-- Name: education id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education ALTER COLUMN id SET DEFAULT nextval('public.education_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 20002)
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 20041)
-- Name: employee_family id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_family ALTER COLUMN id SET DEFAULT nextval('public.employee_family_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 20026)
-- Name: employee_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_profile ALTER COLUMN id SET DEFAULT nextval('public.employee_profile_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 19978)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 19954)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 19990)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 19961)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3410 (class 0 OID 20054)
-- Dependencies: 230
-- Data for Name: education; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.education (id, employee_id, name, level, description, created_by, updated_by, created_at, updated_at) FROM stdin;
1	1	smkn 7 jakarta	sma	sekolah menengah atas	admin	admin	2024-02-16 09:34:53	2024-02-16 09:34:53
2	2	universitas negeri jakarta	strata-1	sarjana	admin	admin	2024-02-16 09:35:45	2024-02-16 09:35:45
7	11	univ trisakti	strata-1	kuliah bawa mobil	admin	admin	\N	\N
8	3	gunadarma	strata-1	kuliah jurusan IT	admin	admin	\N	\N
\.


--
-- TOC entry 3404 (class 0 OID 19999)
-- Dependencies: 224
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, nik, name, is_active, start_date, end_date, created_by, updated_by, created_at, updated_at) FROM stdin;
1	11012	budi	t	2022-12-12	2029-12-12	admin	admin	2022-12-12 08:26:03	2022-12-12 08:26:03
2	11013	jarot	t	2021-09-01	2028-09-01	admin	admin	2022-12-12 08:26:25	2022-12-12 08:26:25
3	11014	jajang	t	2021-09-01	2028-09-01	admin	admin	2024-02-16 10:17:18	2024-02-16 10:17:18
11	11034	budi sudarsono	t	2021-01-01	2024-01-01	admin	admin	\N	\N
13	11036	petrus	t	2021-01-01	2024-01-01	admin	admin	\N	\N
\.


--
-- TOC entry 3408 (class 0 OID 20038)
-- Dependencies: 228
-- Data for Name: employee_family; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_family (id, employee_id, name, identifier, job, place_of_birth, date_of_birth, religion, is_life, is_divorced, relation_status, created_by, updated_by, created_at, updated_at) FROM stdin;
2	2	clara	32100594109020004	pelajar	bangkalan	2008-10-17	islam	t	f	anak	admin	admin	2024-02-16 10:10:33	2024-02-16 10:10:33
1	1	marni	32100594109960002	ibu rumah tangga	denpasar	1995-05-29	islam	t	f	istri	admin	admin	2024-02-16 10:07:30	2024-02-16 10:07:30
3	3	stephanie	32100594109020005	pelajar	bangkalan	2008-10-17	islam	t	f	anak	admin	admin	2024-02-16 10:18:31	2024-02-16 10:18:31
13	2	sulfat	32100594109020009	mahasiswa	ppontianak	1996-03-04	islam	t	f	anak	admin	admin	\N	\N
\.


--
-- TOC entry 3406 (class 0 OID 20023)
-- Dependencies: 226
-- Data for Name: employee_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_profile (id, employee_id, place_of_birth, date_of_birth, gender, is_married, prof_pic, created_by, updated_by, created_at, updated_at) FROM stdin;
1	1	jakarta	1997-05-02	laki-laki	t	 	admin	admin	2024-02-16 09:52:57	2024-02-16 09:52:57
2	2	sukabumi	1996-05-02	laki-laki	f	 	admin	admin	2024-02-16 09:54:18	2024-02-16 09:54:18
7	11	intan jaya	1994-06-04	laki-laki	t	pic2	admin	admin	\N	\N
8	11	ternate	1994-06-04	perempuan	t	pic3	admin	admin	\N	\N
9	3	medan	1994-06-04	perempuan	t	pic4	admin	admin	\N	\N
\.


--
-- TOC entry 3400 (class 0 OID 19975)
-- Dependencies: 220
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 3395 (class 0 OID 19951)
-- Dependencies: 215
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2024_02_15_123718_create_employee_table	1
7	2024_02_15_132018_create_employee_profile_table	3
8	2024_02_15_133306_create_employee_family_table	4
9	2024_02_15_130152_create_educatione_table	5
\.


--
-- TOC entry 3398 (class 0 OID 19968)
-- Dependencies: 218
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3402 (class 0 OID 19987)
-- Dependencies: 222
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3397 (class 0 OID 19958)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 229
-- Name: education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.education_id_seq', 8, true);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 227
-- Name: employee_family_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_family_id_seq', 13, true);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 223
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 13, true);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 225
-- Name: employee_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_profile_id_seq', 9, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 219
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 214
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 9, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 221
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3248 (class 2606 OID 20062)
-- Name: education education_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 20047)
-- Name: employee_family employee_family_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_family
    ADD CONSTRAINT employee_family_pkey PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 20006)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 20031)
-- Name: employee_profile employee_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 19983)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 19985)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3226 (class 2606 OID 19956)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 19994)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 19997)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3228 (class 2606 OID 19967)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3230 (class 2606 OID 19965)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 1259 OID 19973)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 3240 (class 1259 OID 19995)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3251 (class 2606 OID 20063)
-- Name: education education_employee_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON DELETE CASCADE;


--
-- TOC entry 3250 (class 2606 OID 20048)
-- Name: employee_family employee_family_employee_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_family
    ADD CONSTRAINT employee_family_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON DELETE CASCADE;


--
-- TOC entry 3249 (class 2606 OID 20032)
-- Name: employee_profile employee_profile_employee_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON DELETE CASCADE;


-- Completed on 2024-02-18 14:30:07

--
-- PostgreSQL database dump complete
--

