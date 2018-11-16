--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
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

--
-- Name: FF_SCHEMA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "FF_SCHEMA";


ALTER SCHEMA "FF_SCHEMA" OWNER TO postgres;

--
-- Name: SCHEMA "FF_SCHEMA"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "FF_SCHEMA" IS 'Schema for Family Farmer POC';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: CATEGORY; Type: TABLE; Schema: FF_SCHEMA; Owner: postgres
--

CREATE TABLE "FF_SCHEMA"."CATEGORY" (
    "CATEGORY_CODE" character varying(10) NOT NULL,
    "CATEGORY_NAME" character varying(20) NOT NULL
);


ALTER TABLE "FF_SCHEMA"."CATEGORY" OWNER TO postgres;

--
-- Name: ORDER; Type: TABLE; Schema: FF_SCHEMA; Owner: postgres
--

CREATE TABLE "FF_SCHEMA"."ORDER" (
    "ORDER_ID" uuid NOT NULL,
    "ORDER_NUMBER" bigint NOT NULL,
    "PAYMENT_TYPE" character varying(3),
    "ORDER_CATEGORY" character varying(30),
    "TOTAL_PRICE" double precision,
    "CREATED__BY" character varying(30) NOT NULL,
    "ORDER_PROCESSOR" character varying(30) NOT NULL,
    "CREATED_ON" timestamp(6) without time zone,
    "MODIFIED_ON" timestamp(6) without time zone,
    "MODIFIED_BY" timestamp(6) without time zone,
    "ORDER_STATUS" character varying(10),
    "PAYMENT_STATUS" boolean
);


ALTER TABLE "FF_SCHEMA"."ORDER" OWNER TO postgres;

--
-- Name: TABLE "ORDER"; Type: COMMENT; Schema: FF_SCHEMA; Owner: postgres
--

COMMENT ON TABLE "FF_SCHEMA"."ORDER" IS 'Transactions Table';


--
-- Name: ORDERED_PRODUCTS; Type: TABLE; Schema: FF_SCHEMA; Owner: postgres
--

CREATE TABLE "FF_SCHEMA"."ORDERED_PRODUCTS" (
    "ID" uuid NOT NULL,
    "ORDER_ID" uuid NOT NULL,
    "PRODUCT_ID" character varying(10) NOT NULL,
    "QUANTITY" character varying(10),
    "UOM" character varying(10),
    "CALCULATED_PRICE" double precision
);


ALTER TABLE "FF_SCHEMA"."ORDERED_PRODUCTS" OWNER TO postgres;

--
-- Name: TABLE "ORDERED_PRODUCTS"; Type: COMMENT; Schema: FF_SCHEMA; Owner: postgres
--

COMMENT ON TABLE "FF_SCHEMA"."ORDERED_PRODUCTS" IS 'Ordered Products by the consumer';


--
-- Name: PLOTS; Type: TABLE; Schema: FF_SCHEMA; Owner: postgres
--

CREATE TABLE "FF_SCHEMA"."PLOTS" (
    "PLOT_ID" character varying(30) NOT NULL,
    "PLOT_NAME" character varying(60) NOT NULL,
    "PLOT_AREA" double precision,
    "PLOT_LOCATION" character varying(5),
    "USER_ID" character varying(30) NOT NULL
);


ALTER TABLE "FF_SCHEMA"."PLOTS" OWNER TO postgres;

--
-- Name: PRODUCTS; Type: TABLE; Schema: FF_SCHEMA; Owner: postgres
--

CREATE TABLE "FF_SCHEMA"."PRODUCTS" (
    "PRODUCT_ID" character varying(10) NOT NULL,
    "PRODUCT_DESCRIPTION" character varying(30) NOT NULL,
    "PRODUCT_NAME" character varying(20) NOT NULL,
    "CATEGORY_CODE" character varying(10) NOT NULL,
    "PRICE_PER_UNIT" double precision
);


ALTER TABLE "FF_SCHEMA"."PRODUCTS" OWNER TO postgres;

--
-- Name: TABLE "PRODUCTS"; Type: COMMENT; Schema: FF_SCHEMA; Owner: postgres
--

COMMENT ON TABLE "FF_SCHEMA"."PRODUCTS" IS 'Table for Available Products';


--
-- Name: ROLE; Type: TABLE; Schema: FF_SCHEMA; Owner: postgres
--

CREATE TABLE "FF_SCHEMA"."ROLE" (
    "ROLE_ID" character varying(10) NOT NULL,
    "ROLE_NAME" character varying(20),
    "ROLE_DESCRIPTION" character varying(30)
);


ALTER TABLE "FF_SCHEMA"."ROLE" OWNER TO postgres;

--
-- Name: TABLE "ROLE"; Type: COMMENT; Schema: FF_SCHEMA; Owner: postgres
--

COMMENT ON TABLE "FF_SCHEMA"."ROLE" IS 'Role Master Data';


--
-- Name: USER_ROLE_MAPPER; Type: TABLE; Schema: FF_SCHEMA; Owner: postgres
--

CREATE TABLE "FF_SCHEMA"."USER_ROLE_MAPPER" (
    "USER_ID" character varying(30) NOT NULL,
    "ROLE_ID" character varying(10) NOT NULL,
    "LAST_MODIFIED" timestamp(6) without time zone
);


ALTER TABLE "FF_SCHEMA"."USER_ROLE_MAPPER" OWNER TO postgres;

--
-- Name: TABLE "USER_ROLE_MAPPER"; Type: COMMENT; Schema: FF_SCHEMA; Owner: postgres
--

COMMENT ON TABLE "FF_SCHEMA"."USER_ROLE_MAPPER" IS 'Mapper table for Users with Roles';


--
-- Name: User; Type: TABLE; Schema: FF_SCHEMA; Owner: postgres
--

CREATE TABLE "FF_SCHEMA"."User" (
    "USER_ID" character varying(30) NOT NULL,
    "FIRST_NAME" character varying(90) NOT NULL,
    "LAST_NAME" character varying(90),
    "EMAIL" character varying(30) NOT NULL,
    "PHONE_NUMBER" character varying(10) NOT NULL,
    "CREATED_ON" timestamp(6) without time zone,
    "MODIFIED_ON" timestamp(6) without time zone,
    "DELETION_INDICATOR" boolean,
    "USER_CONSENT" boolean,
    "CREATED_BY" character varying(30),
    "MODIFIED_BY" character varying(30)
);


ALTER TABLE "FF_SCHEMA"."User" OWNER TO postgres;

--
-- Name: TABLE "User"; Type: COMMENT; Schema: FF_SCHEMA; Owner: postgres
--

COMMENT ON TABLE "FF_SCHEMA"."User" IS 'User Table';


--
-- Name: CATEGORY CATEGORY_pkey; Type: CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."CATEGORY"
    ADD CONSTRAINT "CATEGORY_pkey" PRIMARY KEY ("CATEGORY_CODE");


--
-- Name: ORDERED_PRODUCTS ORDERED_PRODUCTS_pkey; Type: CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."ORDERED_PRODUCTS"
    ADD CONSTRAINT "ORDERED_PRODUCTS_pkey" PRIMARY KEY ("ID");


--
-- Name: ORDER PKEY; Type: CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."ORDER"
    ADD CONSTRAINT "PKEY" PRIMARY KEY ("ORDER_ID");


--
-- Name: PLOTS PLOTS_pkey; Type: CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."PLOTS"
    ADD CONSTRAINT "PLOTS_pkey" PRIMARY KEY ("PLOT_ID");


--
-- Name: User PRIMARY_KEY; Type: CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."User"
    ADD CONSTRAINT "PRIMARY_KEY" PRIMARY KEY ("USER_ID") INCLUDE ("USER_ID");


--
-- Name: PRODUCTS PRODUCTS_pkey; Type: CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_pkey" PRIMARY KEY ("PRODUCT_ID");


--
-- Name: ROLE ROLE_pkey; Type: CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."ROLE"
    ADD CONSTRAINT "ROLE_pkey" PRIMARY KEY ("ROLE_ID");


--
-- Name: fki_CATEGORY; Type: INDEX; Schema: FF_SCHEMA; Owner: postgres
--

CREATE INDEX "fki_CATEGORY" ON "FF_SCHEMA"."PRODUCTS" USING btree ("CATEGORY_CODE");


--
-- Name: fki_ORDERID; Type: INDEX; Schema: FF_SCHEMA; Owner: postgres
--

CREATE INDEX "fki_ORDERID" ON "FF_SCHEMA"."ORDERED_PRODUCTS" USING btree ("ORDER_ID");


--
-- Name: fki_PRODUCTID; Type: INDEX; Schema: FF_SCHEMA; Owner: postgres
--

CREATE INDEX "fki_PRODUCTID" ON "FF_SCHEMA"."ORDERED_PRODUCTS" USING btree ("PRODUCT_ID");


--
-- Name: fki_ROLE; Type: INDEX; Schema: FF_SCHEMA; Owner: postgres
--

CREATE INDEX "fki_ROLE" ON "FF_SCHEMA"."USER_ROLE_MAPPER" USING btree ("ROLE_ID");


--
-- Name: fki_USER; Type: INDEX; Schema: FF_SCHEMA; Owner: postgres
--

CREATE INDEX "fki_USER" ON "FF_SCHEMA"."USER_ROLE_MAPPER" USING btree ("USER_ID");


--
-- Name: fki_USERPLOT; Type: INDEX; Schema: FF_SCHEMA; Owner: postgres
--

CREATE INDEX "fki_USERPLOT" ON "FF_SCHEMA"."PLOTS" USING btree ("USER_ID");


--
-- Name: PRODUCTS CATEGORY; Type: FK CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."PRODUCTS"
    ADD CONSTRAINT "CATEGORY" FOREIGN KEY ("CATEGORY_CODE") REFERENCES "FF_SCHEMA"."CATEGORY"("CATEGORY_CODE") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ORDERED_PRODUCTS ORDERID; Type: FK CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."ORDERED_PRODUCTS"
    ADD CONSTRAINT "ORDERID" FOREIGN KEY ("ORDER_ID") REFERENCES "FF_SCHEMA"."ORDER"("ORDER_ID");


--
-- Name: ORDERED_PRODUCTS PRODUCTID; Type: FK CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."ORDERED_PRODUCTS"
    ADD CONSTRAINT "PRODUCTID" FOREIGN KEY ("PRODUCT_ID") REFERENCES "FF_SCHEMA"."PRODUCTS"("PRODUCT_ID");


--
-- Name: USER_ROLE_MAPPER ROLE; Type: FK CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."USER_ROLE_MAPPER"
    ADD CONSTRAINT "ROLE" FOREIGN KEY ("ROLE_ID") REFERENCES "FF_SCHEMA"."ROLE"("ROLE_ID");


--
-- Name: USER_ROLE_MAPPER USER; Type: FK CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."USER_ROLE_MAPPER"
    ADD CONSTRAINT "USER" FOREIGN KEY ("USER_ID") REFERENCES "FF_SCHEMA"."User"("USER_ID");


--
-- Name: PLOTS USERPLOT; Type: FK CONSTRAINT; Schema: FF_SCHEMA; Owner: postgres
--

ALTER TABLE ONLY "FF_SCHEMA"."PLOTS"
    ADD CONSTRAINT "USERPLOT" FOREIGN KEY ("USER_ID") REFERENCES "FF_SCHEMA"."User"("USER_ID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

