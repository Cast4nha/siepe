--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 9.5.9

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

--
-- Name: categorialocal_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE categorialocal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE  categorialocal_id_seq OWNER TO siepe;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tipolocal; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE tipolocal (
    id bigint DEFAULT nextval('categorialocal_id_seq'::regclass) NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE tipolocal OWNER TO siepe;

--
-- Name: comunidade_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE comunidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  comunidade_id_seq OWNER TO siepe;

--
-- Name: comunidade; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE comunidade (
    id bigint DEFAULT nextval('comunidade_id_seq'::regclass) NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE comunidade OWNER TO siepe;

--
-- Name: embarcacao_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE embarcacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  embarcacao_id_seq OWNER TO siepe;

--
-- Name: embarcacao; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE embarcacao (
    id bigint DEFAULT nextval('embarcacao_id_seq'::regclass) NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE embarcacao OWNER TO siepe;

--
-- Name: especie_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE especie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  especie_id_seq OWNER TO siepe;

--
-- Name: especie; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE especie (
    id bigint DEFAULT nextval('especie_id_seq'::regclass) NOT NULL,
    nomepopular character varying NOT NULL,
    nomecientifico character varying NOT NULL
);


ALTER TABLE especie OWNER TO siepe;

--
-- Name: instrumento_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE instrumento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  instrumento_id_seq OWNER TO siepe;

--
-- Name: instrumento; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE instrumento (
    id bigint DEFAULT nextval('instrumento_id_seq'::regclass) NOT NULL,
    descricao character varying NOT NULL,
    tipo character varying NOT NULL
);


ALTER TABLE instrumento OWNER TO siepe;

--
-- Name: localpesca_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE localpesca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  localpesca_id_seq OWNER TO siepe;

--
-- Name: local; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE local (
    id bigint DEFAULT nextval('localpesca_id_seq'::regclass) NOT NULL,
    idtipolocal bigint,
    idrio bigint,
    nome character varying NOT NULL
);


ALTER TABLE local OWNER TO siepe;

--
-- Name: pesca_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE pesca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  pesca_id_seq OWNER TO siepe;

--
-- Name: pesca; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE pesca (
    id bigint DEFAULT nextval('pesca_id_seq'::regclass) NOT NULL,
    idpescador bigint,
    datapesca date NOT NULL,
    horarioinicio time without time zone,
    horariotermino time without time zone,
    tempochegada time without time zone,
    numpescadores integer NOT NULL,
    pesototal double precision NOT NULL,
    tempototal time without time zone NOT NULL
);


ALTER TABLE pesca OWNER TO siepe;

--
-- Name: pesca_instrumento; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE pesca_instrumento (
    idpesca bigint NOT NULL,
    idinstrumento bigint NOT NULL,
    qtd bigint NOT NULL
);


ALTER TABLE pesca_instrumento OWNER TO siepe;

--
-- Name: pesca_localpesca; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE pesca_localpesca (
    idpesca bigint NOT NULL,
    idlocalpesca bigint NOT NULL
);


ALTER TABLE pesca_localpesca OWNER TO siepe;

--
-- Name: pesca_pescado; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE pesca_pescado (
    idpesca bigint NOT NULL,
    idpescado bigint NOT NULL
);

ALTER TABLE pesca_pescado OWNER TO siepe;

--
-- Name: pesca_pescado; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE pesca_embarcacao (
    idpesca bigint NOT NULL,
    idembarcacao bigint NOT NULL,
    tamanho double precision NOT NULL,
    motorpotencia double precision NOT NULL
);

ALTER TABLE pesca_embarcacao OWNER TO siepe;

--
-- Name: pescado_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE pescado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  pescado_id_seq OWNER TO siepe;

--
-- Name: pescado; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE pescado (
    id bigint DEFAULT nextval('pescado_id_seq'::regclass) NOT NULL,
    idespecie bigint,
    numpeixes integer NOT NULL,
    qtdovados integer NOT NULL,
    pesototal double precision NOT NULL,
    preco double precision NOT NULL
);


ALTER TABLE pescado OWNER TO siepe;

--
-- Name: pescador_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE pescador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  pescador_id_seq OWNER TO siepe;

--
-- Name: pescador; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE pescador (
    id bigint DEFAULT nextval('pescador_id_seq'::regclass) NOT NULL,
    idcomunidade bigint,
    nome character varying NOT NULL
);


ALTER TABLE pescador OWNER TO siepe;

--
-- Name: rio_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE rio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  rio_id_seq OWNER TO siepe;

--
-- Name: rio; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE rio (
    id bigint DEFAULT nextval('rio_id_seq'::regclass) NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE rio OWNER TO siepe;


--
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  perfil_id_seq OWNER TO siepe;

--
-- Name: rio; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE perfil (
    id bigint DEFAULT nextval('perfil_id_seq'::regclass) NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE perfil OWNER TO siepe;
--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: siepe
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE  usuario_id_seq OWNER TO siepe;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: siepe
--

CREATE TABLE usuario (
    id bigint DEFAULT nextval('usuario_id_seq'::regclass) NOT NULL,
    login character varying NOT NULL,
    senha character varying NOT NULL,
    idPerfil bigint,
    nome character varying,
    email character varying
);



ALTER TABLE usuario OWNER TO siepe;

--
-- Name: categorialocal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: siepe
--

SELECT pg_catalog.setval('categorialocal_id_seq', 1, false);

--
-- Name: comunidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: siepe
--

SELECT pg_catalog.setval('comunidade_id_seq', 1, false);


--
-- Name: embarcacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: siepe
--

SELECT pg_catalog.setval('embarcacao_id_seq', 1, false);


--
-- Name: especie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: siepe
--

SELECT pg_catalog.setval('especie_id_seq', 1, false);


--
-- Name: instrumento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: siepe
--

SELECT pg_catalog.setval('instrumento_id_seq', 1, false);


--
-- Name: localpesca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: siepe
--

SELECT pg_catalog.setval('localpesca_id_seq', 1, false);


--
-- Name: pesca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: siepe
--

SELECT pg_catalog.setval('pesca_id_seq', 1, false);


--
-- Name: pescado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: siepe
--

SELECT pg_catalog.setval('pescado_id_seq', 1, false);


--
-- Name: pescador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: siepe
--

SELECT pg_catalog.setval('pescador_id_seq', 1, false);


--
-- Name: rio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: siepe
--

SELECT pg_catalog.setval('rio_id_seq', 1, false);


--
-- Name: categorialocal_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY tipolocal
    ADD CONSTRAINT tipolocal_pkey PRIMARY KEY (id);


--
-- Name: perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id);

--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: comunidade_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY comunidade
    ADD CONSTRAINT comunidade_pkey PRIMARY KEY (id);


--
-- Name: embarcacao_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY embarcacao
    ADD CONSTRAINT embarcacao_pkey PRIMARY KEY (id);


--
-- Name: especie_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY especie
    ADD CONSTRAINT especie_pkey PRIMARY KEY (id);


--
-- Name: instrumento_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY instrumento
    ADD CONSTRAINT instrumento_pkey PRIMARY KEY (id);


--
-- Name: localpesca_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY localpesca
    ADD CONSTRAINT localpesca_pkey PRIMARY KEY (id);


--
-- Name: pesca_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pesca
    ADD CONSTRAINT pesca_pkey PRIMARY KEY (id);


--
-- Name: pescado_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pescado
    ADD CONSTRAINT pescado_pkey PRIMARY KEY (id);


--
-- Name: pescadores_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pescador
    ADD CONSTRAINT pescadores_pkey PRIMARY KEY (id);


--
-- Name: rio_pkey; Type: CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY rio
    ADD CONSTRAINT rio_pkey PRIMARY KEY (id);


--
-- Name: fki_categorialocal; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_tipolocal ON local USING btree (idtipolocal);


--
-- Name: fki_comunidade; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_comunidade ON pescador USING btree (idcomunidade);


--
-- Name: fki_especie; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_especie ON pescado USING btree (idespecie);


--
-- Name: fki_instrumento; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_instrumento ON pesca_instrumento USING btree (idinstrumento);


--
-- Name: fki_localpesca; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_localpesca ON pesca_localpesca USING btree (idlocalpesca);


--
-- Name: fki_localpesca_pesca; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_localpesca_pesca ON pesca_localpesca USING btree (idpesca);


--
-- Name: fki_pesca; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_pesca ON pesca_instrumento USING btree (idpesca);


--
-- Name: fki_pescado; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_pescado ON pesca_pescado USING btree (idpescado);


--
-- Name: fki_pescado_pesca; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_pescado_pesca ON pesca_pescado USING btree (idpesca);


--
-- Name: fki_pescador; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_pescador ON pesca USING btree (idpescador);


--
-- Name: fki_rio; Type: INDEX; Schema: public; Owner: siepe
--

CREATE INDEX fki_rio ON localpesca USING btree (idrio);


--
-- Name: fk_tipolocal; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY localpesca
    ADD CONSTRAINT fk_tipolocal FOREIGN KEY (idtipolocal) REFERENCES tipolocal(id);


--
-- Name: fk_comunidade; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pescador
    ADD CONSTRAINT fk_comunidade FOREIGN KEY (idcomunidade) REFERENCES comunidade(id);


--
-- Name: fk_embarcacao; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE usuario
  ADD CONSTRAINT fk_usuarioperfil FOREIGN KEY (idperfil) REFERENCES perfil (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--
-- Name: fk_especie; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pescado
    ADD CONSTRAINT fk_especie FOREIGN KEY (idespecie) REFERENCES especie(id);


--
-- Name: fk_instrumento; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pesca_instrumento
    ADD CONSTRAINT fk_instrumento FOREIGN KEY (idinstrumento) REFERENCES instrumento(id);


--
-- Name: fk_instrumento_pesca; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pesca_instrumento
    ADD CONSTRAINT fk_instrumento_pesca FOREIGN KEY (idpesca) REFERENCES pesca(id);

--
-- Name: fk_pescaembarcacao; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pesca_embarcacao
    ADD CONSTRAINT fk_pescaembarcacao FOREIGN KEY (idpesca) REFERENCES pesca(id);


--
-- Name: fk_localpesca; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pesca_embarcacao
    ADD CONSTRAINT fk_embarcacao FOREIGN KEY (idembarcacao) REFERENCES embarcacao(id);


--
-- Name: fk_localpesca; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pesca_localpesca
    ADD CONSTRAINT fk_localpesca FOREIGN KEY (idlocalpesca) REFERENCES localpesca(id);


--
-- Name: fk_localpesca_pesca; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pesca_localpesca
    ADD CONSTRAINT fk_localpesca_pesca FOREIGN KEY (idpesca) REFERENCES pesca(id);


--
-- Name: fk_pescado; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pesca_pescado
    ADD CONSTRAINT fk_pescado FOREIGN KEY (idpescado) REFERENCES pescado(id);


--
-- Name: fk_pescado_pesca; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pesca_pescado
    ADD CONSTRAINT fk_pescado_pesca FOREIGN KEY (idpesca) REFERENCES pesca(id);


--
-- Name: fk_pescador; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY pesca
    ADD CONSTRAINT fk_pescador FOREIGN KEY (idpescador) REFERENCES pescador(id);


--
-- Name: fk_rio; Type: FK CONSTRAINT; Schema: public; Owner: siepe
--

ALTER TABLE ONLY localpesca
    ADD CONSTRAINT fk_rio FOREIGN KEY (idrio) REFERENCES rio(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: siepe
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

ALTER TABLE pesca
  DROP COLUMN tempochegada;
ALTER TABLE pesca
   ALTER COLUMN pesototal DROP NOT NULL;
ALTER TABLE pesca
   ALTER COLUMN tempototal DROP NOT NULL;
ALTER TABLE pesca
  ADD COLUMN pesovendido double precision;
ALTER TABLE pesca
  ADD COLUMN valorcusto double precision;
ALTER TABLE pesca
  ADD COLUMN valorvenda double precision;

CREATE TABLE public.tipocomprador
(
   id serial, 
   descricao character varying, 
   CONSTRAINT tipocomprador_pkey PRIMARY KEY (id)
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE public.tipocomprador
  OWNER TO siepe;

CREATE TABLE public.pesca_tipocomprador
(
   idpesca integer, 
   idtipocomprador integer, 
   CONSTRAINT fk_pescatipocomprador_pesca FOREIGN KEY (idpesca) REFERENCES pesca (id) ON UPDATE NO ACTION ON DELETE NO ACTION, 
   CONSTRAINT fk_pescatipocomprador_tipocomprador FOREIGN KEY (idtipocomprador) REFERENCES tipocomprador (id) ON UPDATE NO ACTION ON DELETE NO ACTION
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE public.pesca_tipocomprador
  OWNER TO siepe;

ALTER TABLE pescado
  ADD COLUMN tamanhomenor double precision;
ALTER TABLE pescado
  ADD COLUMN tamanhomaior double precision;

