--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 9.5.9

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public IS 'standard public schema';

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: author_publication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE author_publication (
    author_oid integer NOT NULL,
    publication_oid integer NOT NULL
);


ALTER TABLE author_publication OWNER TO postgres;

--
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE collection (
    oid integer NOT NULL,
    description character varying(255),
    title character varying(255),
    researcher_oid integer
);


ALTER TABLE collection OWNER TO postgres;

--
-- Name: collection_keyword; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE collection_keyword (
    collection_oid integer NOT NULL,
    keyword_oid integer NOT NULL
);


ALTER TABLE collection_keyword OWNER TO postgres;

--
-- Name: collection_publication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE collection_publication (
    collection_oid integer NOT NULL,
    publication_oid integer NOT NULL
);


ALTER TABLE collection_publication OWNER TO postgres;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comment (
    oid integer NOT NULL,
    "timestamp" timestamp without time zone,
    textualcontent character varying(255),
    title character varying(255),
    researcher_oid integer,
    publication_oid integer
);


ALTER TABLE comment OWNER TO postgres;

--
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "group" (
    oid integer NOT NULL,
    groupname character varying(255),
    module_oid integer
);


ALTER TABLE "group" OWNER TO postgres;

--
-- Name: group_module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE group_module (
    group_oid integer NOT NULL,
    module_oid integer NOT NULL
);


ALTER TABLE group_module OWNER TO postgres;

--
-- Name: keyword; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE keyword (
    oid integer NOT NULL,
    word character varying(255)
);


ALTER TABLE keyword OWNER TO postgres;

--
-- Name: keyword_publication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE keyword_publication (
    keyword_oid integer NOT NULL,
    publication_oid integer NOT NULL
);


ALTER TABLE keyword_publication OWNER TO postgres;

--
-- Name: module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE module (
    oid integer NOT NULL,
    moduleid character varying(255),
    modulename character varying(255)
);


ALTER TABLE module OWNER TO postgres;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE notification (
    oid integer NOT NULL,
    shown integer,
    message character varying(255),
    researcher_oid integer,
    "timestamp" timestamp without time zone
);


ALTER TABLE notification OWNER TO postgres;

--
-- Name: publication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE publication (
    oid integer NOT NULL,
    title character varying(255),
    venue character varying(255),
    year integer,
    abstract character varying(255),
    file character varying(255)
);


ALTER TABLE publication OWNER TO postgres;

--
-- Name: researcher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE researcher (
    oid integer NOT NULL,
    university character varying(255),
    name character varying(255),
    reputation double precision,
    user_oid integer
);


ALTER TABLE researcher OWNER TO postgres;

--
-- Name: researcher_university; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE researcher_university (
    researcher_oid integer NOT NULL,
    university_oid integer NOT NULL
);


ALTER TABLE researcher_university OWNER TO postgres;

--
-- Name: sharedwith; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sharedwith (
    collection_oid integer NOT NULL,
    researcher_oid integer NOT NULL
);


ALTER TABLE sharedwith OWNER TO postgres;

--
-- Name: university; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE university (
    oid integer NOT NULL,
    country character varying(255),
    city character varying(255),
    name character varying(255)
);


ALTER TABLE university OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    oid integer NOT NULL,
    username character varying(255),
    password character varying(255),
    email character varying(255),
    group_oid integer
);


ALTER TABLE "user" OWNER TO postgres;

--
-- Name: user_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_group (
    user_oid integer NOT NULL,
    group_oid integer NOT NULL
);


ALTER TABLE user_group OWNER TO postgres;

--
-- Data for Name: author_publication; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO author_publication VALUES (3, 1);
INSERT INTO author_publication VALUES (2, 2);
INSERT INTO author_publication VALUES (3, 3);


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO collection VALUES (1, 'Papers to read on the toilet', 'Toilet papers', 3);
INSERT INTO collection VALUES (2, 'Better than collection 1', 'Collection 2', 3);


--
-- Data for Name: collection_keyword; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Data for Name: collection_publication; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO collection_publication VALUES (1, 1);
INSERT INTO collection_publication VALUES (1, 2);
INSERT INTO collection_publication VALUES (1, 3);
INSERT INTO collection_publication VALUES (2, 2);


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--


INSERT INTO comment VALUES (1, NULL, 'Absolutely amazing paper, what a time to be alive', 'Changed my life', 3, 1);
INSERT INTO comment VALUES (2, NULL, 'The concept is amazing, but you did not prove that the created subspace is actually infinite, what is the length of this subspace toilet paper? And if we reach that length, does the subspace not collapse and cause a very shitty explosion?', 'Cool idea, some questions remain though', 2, 2);
INSERT INTO comment VALUES (3, NULL, 'Poopadiepoppedie', 'Poopadiepoppedie', 3, 3);
INSERT INTO comment VALUES (4, NULL, 'Poopadiepoppedie Poopadiepoppedie', 'Poopadiepoppedie', 2, 3);
INSERT INTO comment VALUES (5, NULL, 'Poopadiepoppedie Poopadiepoppedie Poopadiepoppedie', 'Poopadiepoppedie', 1, 3);


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "group" VALUES (1, 'admin', 1);
INSERT INTO "group" VALUES (2, 'researcher', 2);


--
-- Data for Name: group_module; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO group_module VALUES (2, 1);


--
-- Data for Name: keyword; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO keyword VALUES (1, 'Computers');
INSERT INTO keyword VALUES (2, 'Internet');
INSERT INTO keyword VALUES (3, 'Graphs');
INSERT INTO keyword VALUES (4, 'Quantum');
INSERT INTO keyword VALUES (5, 'Science fiction');
INSERT INTO keyword VALUES (6, 'Toilet');
INSERT INTO keyword VALUES (7, 'Serious');
INSERT INTO keyword VALUES (8, 'Web Science');
INSERT INTO keyword VALUES (9, 'Database');
INSERT INTO keyword VALUES (10, 'Semantic Web');

--
-- Data for Name: keyword_publication; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO keyword_publication VALUES (4, 1);
INSERT INTO keyword_publication VALUES (5, 1);
INSERT INTO keyword_publication VALUES (6, 1);
INSERT INTO keyword_publication VALUES (6, 2);
INSERT INTO keyword_publication VALUES (7, 2);
INSERT INTO keyword_publication VALUES (1, 2);
INSERT INTO keyword_publication VALUES (10, 3);
INSERT INTO keyword_publication VALUES (8, 3);


--
-- Data for Name: module; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO module VALUES (1, 'sv3', 'Admin');
INSERT INTO module VALUES (2, 'sv1', 'Researcher');


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO notification VALUES (1, 3, 'Welcome to the portal, new user!', 1, NULL);
INSERT INTO notification VALUES (2, 3, 'Welcome to the portal, new user!', 2, NULL);
INSERT INTO notification VALUES (3, 3, 'Welcome to the portal, new user!', 3, NULL);


--
-- Data for Name: publication; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO publication VALUES (1, 'Quantum Toilet Pooping', 'Delft Unviersity', 2034, 'Quantum Toilet pooping allows you to be at 2 places at the same time, giving oppertunity to keep working while pooping on the toilet.', '');
INSERT INTO publication VALUES (2, 'Subspace toilet paper', 'Mens toilet #3', 2036, 'Following up on the Quantum pooping, a new technology has been developed that efficitvely wraps the subspace of a piece of toilet paper to be infite, efficitvely allowing the usage of infinite toilet paper.', 'yes');
INSERT INTO publication VALUES (3, 'Poopadiepoppedie', 'Outside', 2028, 'The new premier song to sing on the toilet', '');


--
-- Data for Name: researcher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO researcher VALUES (1, 'tudelft', 'researcher', 0, 1);
INSERT INTO researcher VALUES (2, 'tudelft', 'admin', 0, 2);
INSERT INTO researcher VALUES (3, 'tudelft', 'Derk Snijders', 0, 3);


--
-- Data for Name: researcher_university; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: sharedwith; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: university; Type: TABLE DATA; Schema: public; Owner: postgres
--


INSERT INTO university VALUES (1, 'The Netherlands', 'Delft', 'Technical University Delft');
INSERT INTO university VALUES (2, 'The Netherlands', 'Enschede', 'University of Twente');
INSERT INTO university VALUES (3, 'Oezbekistan', 'Mountaintop 3', 'Monastery of Swag');

--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user" VALUES (1, 'researcher', 'researcher', 'wse.webratio@gmail.com', 2);
INSERT INTO "user" VALUES (2, 'admin', 'admin', 'wse.webratio@gmail.com', 1);
INSERT INTO "user" VALUES (3, 'i3anaan', 'i3anaan', 'i3anaan@gmail.com', 2);


--
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: author_publication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author_publication
    ADD CONSTRAINT author_publication_pkey PRIMARY KEY (author_oid, publication_oid);


--
-- Name: collection_keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY collection_keyword
    ADD CONSTRAINT collection_keyword_pkey PRIMARY KEY (collection_oid, keyword_oid);


--
-- Name: collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (oid);


--
-- Name: collection_publication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY collection_publication
    ADD CONSTRAINT collection_publication_pkey PRIMARY KEY (collection_oid, publication_oid);


--
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (oid);


--
-- Name: group_module_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_module
    ADD CONSTRAINT group_module_pkey PRIMARY KEY (group_oid, module_oid);


--
-- Name: group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (oid);


--
-- Name: keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY keyword
    ADD CONSTRAINT keyword_pkey PRIMARY KEY (oid);


--
-- Name: keyword_publication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY keyword_publication
    ADD CONSTRAINT keyword_publication_pkey PRIMARY KEY (keyword_oid, publication_oid);


--
-- Name: module_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY module
    ADD CONSTRAINT module_pkey PRIMARY KEY (oid);


--
-- Name: notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (oid);


--
-- Name: publication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publication
    ADD CONSTRAINT publication_pkey PRIMARY KEY (oid);


--
-- Name: researcher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY researcher
    ADD CONSTRAINT researcher_pkey PRIMARY KEY (oid);


--
-- Name: researcher_university_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY researcher_university
    ADD CONSTRAINT researcher_university_pkey PRIMARY KEY (researcher_oid, university_oid);


--
-- Name: sharedwith_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sharedwith
    ADD CONSTRAINT sharedwith_pkey PRIMARY KEY (collection_oid, researcher_oid);


--
-- Name: university_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY university
    ADD CONSTRAINT university_pkey PRIMARY KEY (oid);


--
-- Name: user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (user_oid, group_oid);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (oid);


--
-- Name: fk_author_publication_publicat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author_publication
    ADD CONSTRAINT fk_author_publication_publicat FOREIGN KEY (publication_oid) REFERENCES publication(oid);


--
-- Name: fk_author_publication_research; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author_publication
    ADD CONSTRAINT fk_author_publication_research FOREIGN KEY (author_oid) REFERENCES researcher(oid);


--
-- Name: fk_collection_keyword_collecti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY collection_keyword
    ADD CONSTRAINT fk_collection_keyword_collecti FOREIGN KEY (collection_oid) REFERENCES collection(oid);


--
-- Name: fk_collection_keyword_keyword; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY collection_keyword
    ADD CONSTRAINT fk_collection_keyword_keyword FOREIGN KEY (keyword_oid) REFERENCES keyword(oid);


--
-- Name: fk_collection_publication_coll; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY collection_publication
    ADD CONSTRAINT fk_collection_publication_coll FOREIGN KEY (collection_oid) REFERENCES collection(oid);


--
-- Name: fk_collection_publication_publ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY collection_publication
    ADD CONSTRAINT fk_collection_publication_publ FOREIGN KEY (publication_oid) REFERENCES publication(oid);


--
-- Name: fk_collection_researcher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT fk_collection_researcher FOREIGN KEY (researcher_oid) REFERENCES researcher(oid);


--
-- Name: fk_comment_publication; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_comment_publication FOREIGN KEY (publication_oid) REFERENCES publication(oid);


--
-- Name: fk_comment_researcher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_comment_researcher FOREIGN KEY (researcher_oid) REFERENCES researcher(oid);


--
-- Name: fk_group_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT fk_group_module FOREIGN KEY (module_oid) REFERENCES module(oid);


--
-- Name: fk_group_module_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_module
    ADD CONSTRAINT fk_group_module_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);


--
-- Name: fk_group_module_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_module
    ADD CONSTRAINT fk_group_module_module FOREIGN KEY (module_oid) REFERENCES module(oid);


--
-- Name: fk_keyword_publication_keyword; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY keyword_publication
    ADD CONSTRAINT fk_keyword_publication_keyword FOREIGN KEY (keyword_oid) REFERENCES keyword(oid);


--
-- Name: fk_keyword_publication_publica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY keyword_publication
    ADD CONSTRAINT fk_keyword_publication_publica FOREIGN KEY (publication_oid) REFERENCES publication(oid);


--
-- Name: fk_notification_researcher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT fk_notification_researcher FOREIGN KEY (researcher_oid) REFERENCES researcher(oid);


--
-- Name: fk_researcher_university_resea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY researcher_university
    ADD CONSTRAINT fk_researcher_university_resea FOREIGN KEY (researcher_oid) REFERENCES researcher(oid);


--
-- Name: fk_researcher_university_unive; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY researcher_university
    ADD CONSTRAINT fk_researcher_university_unive FOREIGN KEY (university_oid) REFERENCES university(oid);


--
-- Name: fk_researcher_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY researcher
    ADD CONSTRAINT fk_researcher_user FOREIGN KEY (user_oid) REFERENCES "user"(oid);


--
-- Name: fk_sharedwith_collection; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sharedwith
    ADD CONSTRAINT fk_sharedwith_collection FOREIGN KEY (collection_oid) REFERENCES collection(oid);


--
-- Name: fk_sharedwith_researcher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sharedwith
    ADD CONSTRAINT fk_sharedwith_researcher FOREIGN KEY (researcher_oid) REFERENCES researcher(oid);


--
-- Name: fk_user_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT fk_user_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);


--
-- Name: fk_user_group_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT fk_user_group_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);


--
-- Name: fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_oid) REFERENCES "user"(oid);


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

