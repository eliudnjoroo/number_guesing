--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer NOT NULL,
    current_guess integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_guess integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (32, 1);
INSERT INTO public.games VALUES (1, 4);
INSERT INTO public.games VALUES (37, 185);
INSERT INTO public.games VALUES (44, 1);
INSERT INTO public.games VALUES (43, 1);
INSERT INTO public.games VALUES (45, 131);
INSERT INTO public.games VALUES (47, 0);
INSERT INTO public.games VALUES (34, 428);
INSERT INTO public.games VALUES (33, 124);
INSERT INTO public.games VALUES (36, 487);
INSERT INTO public.games VALUES (35, 56);
INSERT INTO public.games VALUES (38, 221);
INSERT INTO public.games VALUES (39, 97);
INSERT INTO public.games VALUES (40, 359);
INSERT INTO public.games VALUES (46, 163);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (80, 'eli', 1, 1);
INSERT INTO public.users VALUES (82, 'user_1745694343002', 2, 314);
INSERT INTO public.users VALUES (81, 'user_1745694343003', 5, 726);
INSERT INTO public.users VALUES (84, 'user_1745694539350', 2, 69);
INSERT INTO public.users VALUES (83, 'user_1745694539351', 5, 319);
INSERT INTO public.users VALUES (86, 'user_1745694572414', 2, 184);
INSERT INTO public.users VALUES (85, 'user_1745694572415', 5, 11);
INSERT INTO public.users VALUES (87, 'njor', 0, 0);
INSERT INTO public.users VALUES (89, 'user_1745694688156', 2, 100);
INSERT INTO public.users VALUES (88, 'user_1745694688157', 5, 26);
INSERT INTO public.users VALUES (91, 'user_1745694745497', 2, 345);
INSERT INTO public.users VALUES (90, 'user_1745694745498', 5, 37);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 91, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

