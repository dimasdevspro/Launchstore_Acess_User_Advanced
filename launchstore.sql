--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Ubuntu 13.2-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.2 (Ubuntu 13.2-1.pgdg20.04+1)

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
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: dimas
--

CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.updated_at = NOW();
RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO dimas;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: dimas
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO dimas;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: dimas
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO dimas;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dimas
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: dimas
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name text,
    path text,
    product_id integer
);


ALTER TABLE public.files OWNER TO dimas;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: dimas
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO dimas;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dimas
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: dimas
--

CREATE TABLE public.products (
    id integer NOT NULL,
    category_id integer NOT NULL,
    user_id integer,
    name text NOT NULL,
    description text,
    old_price integer,
    price integer NOT NULL,
    quantity integer,
    status integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.products OWNER TO dimas;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: dimas
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO dimas;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dimas
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: dimas
--

CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO dimas;

--
-- Name: users; Type: TABLE; Schema: public; Owner: dimas
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    cpf_cnpj text NOT NULL,
    cep text,
    address text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    reset_token text,
    reset_token_expires text
);


ALTER TABLE public.users OWNER TO dimas;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dimas
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO dimas;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dimas
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: dimas
--

COPY public.categories (id, name) FROM stdin;
1	comida
2	eletrônicos
3	automóveis
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: dimas
--

COPY public.files (id, name, path, product_id) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: dimas
--

COPY public.products (id, category_id, user_id, name, description, old_price, price, quantity, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: dimas
--

COPY public.session (sid, sess, expire) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dimas
--

COPY public.users (id, name, email, password, cpf_cnpj, cep, address, created_at, updated_at, reset_token, reset_token_expires) FROM stdin;
10	Einstein	einstein@yahoo.br	$2a$08$TQVqYv3tfJoF1GuyvmR8BupeF3encUzUWvyNUHhmCWwz4TuiJnhLi	12345678900	04456000	Rua São Constantino 1002	2021-02-02 13:15:45.655944	2021-02-02 13:15:45.655944	\N	\N
11	Ananda Carmargo Pereira	ananda@caper.com.br	$2a$08$BldzLCtuX/NE3sUnwq.AJe6SO/ntsSeHCPCY4bCxtJCj/0rbIF60W	24567890090	01000980	Rua São Paulo	2021-02-02 17:38:55.225563	2021-02-02 17:38:55.225563	\N	\N
13	Dimas Alves Pereira	dimasdevspro@gmail.com	$2a$08$F3purLswhv1ZgPv.NNxKseNXF1waaSB5tQw0QyTiaZBNcElU/RBXG	29380059892	04456000	Rua São Constantino, 207	2021-02-03 10:25:24.487447	2021-02-03 10:25:24.487447	\N	\N
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dimas
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dimas
--

SELECT pg_catalog.setval('public.files_id_seq', 4, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dimas
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dimas
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: users users_cpf_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cpf_cnpj_key UNIQUE (cpf_cnpj);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: dimas
--

CREATE INDEX "IDX_session_expire" ON public.session USING btree (expire);


--
-- Name: products set_timestamp; Type: TRIGGER; Schema: public; Owner: dimas
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


--
-- Name: users set_timestamp; Type: TRIGGER; Schema: public; Owner: dimas
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


--
-- Name: files files_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: products products_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dimas
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

