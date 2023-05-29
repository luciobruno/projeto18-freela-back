--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    id integer NOT NULL,
    follow integer,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.follows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    image text NOT NULL,
    description character varying(300) NOT NULL,
    likes integer DEFAULT 0,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    image text NOT NULL,
    biography character varying(200) NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.follows VALUES (1, 2, 1, '2023-05-29 06:24:46.711715');
INSERT INTO public.follows VALUES (2, 3, 1, '2023-05-29 06:24:48.878893');
INSERT INTO public.follows VALUES (3, 1, 3, '2023-05-29 06:30:47.638472');
INSERT INTO public.follows VALUES (4, 2, 3, '2023-05-29 06:30:51.07936');


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (2, 'https://uploads.metropoles.com/wp-content/uploads/2021/06/09110407/cachorro-fofo-usando-oculos_23-2148917262-1.jpg', 'Meu cachorro favorito', 0, 1, '2023-05-29 06:41:57.727824');
INSERT INTO public.posts VALUES (1, 'https://uploads.metropoles.com/wp-content/uploads/2021/06/09110407/cachorro-fofo-usando-oculos_23-2148917262-1.jpg', 'Meu cachorro favorito', 9, 1, '2023-05-29 06:02:58.739391');
INSERT INTO public.posts VALUES (3, 'https://uploads.metropoles.com/wp-content/uploads/2021/06/09110407/cachorro-fofo-usando-oculos_23-2148917262-1.jpg', 'Meu cachorro favorito', 0, 1, '2023-05-29 06:47:06.256496');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '30bf4596-de71-42f1-9c7d-c51544783d2f', 1, '2023-05-28 19:44:45.887148');
INSERT INTO public.sessions VALUES (2, '1d5d26b7-1a8a-48c6-91ec-cefe23cf34c2', 2, '2023-05-29 05:56:47.964839');
INSERT INTO public.sessions VALUES (3, 'e5bec0cc-c543-46c2-a600-c60e2414d1d1', 1, '2023-05-29 06:04:10.007654');
INSERT INTO public.sessions VALUES (4, '821ecb3f-04af-435f-94b6-688920ebba96', 3, '2023-05-29 06:15:04.494727');
INSERT INTO public.sessions VALUES (5, '1ebf1f81-978a-4266-96bd-39b77b5e6c29', 3, '2023-05-29 06:30:35.55466');
INSERT INTO public.sessions VALUES (6, '8a17852d-82b2-46ff-80c9-0387adb535a8', 3, '2023-05-29 06:46:52.882441');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'lucio', 'lucio@lucio.com.br', 'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png', 'Estudante da Driven', '$2b$10$nCwn11YoU3KTjO/zP/aJQOR.rEuYpRziNmTeuBMD.uEGRVVIfqhnq', '2023-05-28 19:40:18.23259');
INSERT INTO public.users VALUES (2, 'lucio', 'lucio2@lucio2.com.br', 'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png', 'Estudante da Driven', '$2b$10$Kg64zwuCwmAIMqxcCO9QieVcyBSBa8k9OeOnyx62CNL.TtVQpVqOO', '2023-05-29 04:03:16.869261');
INSERT INTO public.users VALUES (3, 'lucas', 'lucas@lucas.com.br', 'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png', 'Estudante da Driven', '$2b$10$ljR5kSTWvgccYiTIijP86.UDR/bBpCWcQRUi6u6IOuuwhi.AnEy3O', '2023-05-29 06:14:57.451692');


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.follows_id_seq', 4, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 3, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: follows follows_follow_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follow_fkey FOREIGN KEY (follow) REFERENCES public.users(id);


--
-- Name: follows follows_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT "follows_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

