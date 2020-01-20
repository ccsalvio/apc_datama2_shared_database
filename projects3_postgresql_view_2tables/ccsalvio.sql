--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-09 09:04:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 31 (class 2615 OID 23105)
-- Name: ccsalvio; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA ccsalvio;


ALTER SCHEMA ccsalvio OWNER TO datama2mi181;

SET default_tablespace = '';

--
-- TOC entry 448 (class 1259 OID 28641)
-- Name: movie; Type: TABLE; Schema: ccsalvio; Owner: datama2mi181
--

CREATE TABLE ccsalvio.movie (
    movie_name character varying NOT NULL,
    id integer NOT NULL,
    movie_type character varying NOT NULL,
    ticket_id integer
);


ALTER TABLE ccsalvio.movie OWNER TO datama2mi181;

--
-- TOC entry 444 (class 1259 OID 28608)
-- Name: ticket; Type: TABLE; Schema: ccsalvio; Owner: datama2mi181
--

CREATE TABLE ccsalvio.ticket (
    id integer NOT NULL,
    ticket_price integer NOT NULL,
    ticket_type character varying NOT NULL
);


ALTER TABLE ccsalvio.ticket OWNER TO datama2mi181;

--
-- TOC entry 454 (class 1259 OID 28717)
-- Name: cinema2; Type: VIEW; Schema: ccsalvio; Owner: datama2mi181
--

CREATE VIEW ccsalvio.cinema2 AS
 SELECT movie.movie_name,
    movie.movie_type,
    movie.ticket_id,
    ticket.ticket_price,
    ticket.ticket_type
   FROM (ccsalvio.movie
     JOIN ccsalvio.ticket ON ((movie.ticket_id = ticket.id)));


ALTER TABLE ccsalvio.cinema2 OWNER TO datama2mi181;

--
-- TOC entry 3568 (class 0 OID 28641)
-- Dependencies: 448
-- Data for Name: movie; Type: TABLE DATA; Schema: ccsalvio; Owner: datama2mi181
--

COPY ccsalvio.movie (movie_name, id, movie_type, ticket_id) FROM stdin;
A Walk to Remember	20	Romance	2
White Chicks	30	Comedy	4
\.


--
-- TOC entry 3567 (class 0 OID 28608)
-- Dependencies: 444
-- Data for Name: ticket; Type: TABLE DATA; Schema: ccsalvio; Owner: datama2mi181
--

COPY ccsalvio.ticket (id, ticket_price, ticket_type) FROM stdin;
2	400	3D
4	500	Director's Club
\.


--
-- TOC entry 3417 (class 2606 OID 28648)
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: ccsalvio; Owner: datama2mi181
--

ALTER TABLE ONLY ccsalvio.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- TOC entry 3415 (class 2606 OID 28615)
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: ccsalvio; Owner: datama2mi181
--

ALTER TABLE ONLY ccsalvio.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 3418 (class 2606 OID 28649)
-- Name: movie movie_ticket_id_fkey; Type: FK CONSTRAINT; Schema: ccsalvio; Owner: datama2mi181
--

ALTER TABLE ONLY ccsalvio.movie
    ADD CONSTRAINT movie_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES ccsalvio.ticket(id);


-- Completed on 2019-12-09 09:04:56

--
-- PostgreSQL database dump complete
--

