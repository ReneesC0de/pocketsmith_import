--
-- PostgreSQL database dump
--

-- Dumped from database version 14.16
-- Dumped by pg_dump version 14.16

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: BudgetCategories; Type: TABLE; Schema: public; Owner: pocket_budget_user
--

CREATE TABLE public."BudgetCategories" (
    "Seq" character(10) NOT NULL,
    "Category" character(200) NOT NULL,
    "DueDate" "char",
    "Status" character(50),
    "Include" character(5),
    "Frequency" character(5)
);


ALTER TABLE public."BudgetCategories" OWNER TO pocket_budget_user;

--
-- Name: Budgeted; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Budgeted" (
    "Seq" numeric(100,0) NOT NULL,
    "Categories" character varying(200) NOT NULL,
    "PayDate_RowID" character varying(5) NOT NULL,
    "StartDate" date,
    "EndDate" date,
    "Amount" money
);


ALTER TABLE public."Budgeted" OWNER TO postgres;

--
-- Name: PayDates; Type: TABLE; Schema: public; Owner: pocket_budget_user
--

CREATE TABLE public."PayDates" (
    "RowID" character(10),
    "StartDate" date,
    "EndDate" date
);


ALTER TABLE public."PayDates" OWNER TO pocket_budget_user;

--
-- Name: PocketSmithImport; Type: TABLE; Schema: public; Owner: pocket_budget_user
--

CREATE TABLE public."PocketSmithImport" (
    "Date" date,
    "Merchant" character(300),
    "MerchantChangedFrom" character(300),
    "Amount" money,
    "Currency" character(100),
    "TransactionType" character(25),
    "Account" character(200),
    "ClosingBalance" money,
    "Category" character(300),
    "ParentCategories" character(300),
    "Labels" character(200),
    "Memo" character(800),
    "Note" character(800),
    "ID" character(100)
);


ALTER TABLE public."PocketSmithImport" OWNER TO pocket_budget_user;

--
-- Name: dummy_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dummy_table (
    key character(1) NOT NULL,
    name character(1)
);


ALTER TABLE public.dummy_table OWNER TO postgres;

--
-- Data for Name: BudgetCategories; Type: TABLE DATA; Schema: public; Owner: pocket_budget_user
--

COPY public."BudgetCategories" ("Seq", "Category", "DueDate", "Status", "Include", "Frequency") FROM stdin;
\.


--
-- Data for Name: Budgeted; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Budgeted" ("Seq", "Categories", "PayDate_RowID", "StartDate", "EndDate", "Amount") FROM stdin;
\.


--
-- Data for Name: PayDates; Type: TABLE DATA; Schema: public; Owner: pocket_budget_user
--

COPY public."PayDates" ("RowID", "StartDate", "EndDate") FROM stdin;
\.


--
-- Data for Name: PocketSmithImport; Type: TABLE DATA; Schema: public; Owner: pocket_budget_user
--

COPY public."PocketSmithImport" ("Date", "Merchant", "MerchantChangedFrom", "Amount", "Currency", "TransactionType", "Account", "ClosingBalance", "Category", "ParentCategories", "Labels", "Memo", "Note", "ID") FROM stdin;
\.


--
-- Data for Name: dummy_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dummy_table (key, name) FROM stdin;
\.


--
-- Name: BudgetCategories BudgetCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: pocket_budget_user
--

ALTER TABLE ONLY public."BudgetCategories"
    ADD CONSTRAINT "BudgetCategories_pkey" PRIMARY KEY ("Seq");


--
-- Name: Budgeted SeqDate; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Budgeted"
    ADD CONSTRAINT "SeqDate" PRIMARY KEY ("PayDate_RowID", "Seq");


--
-- Name: dummy_table dummy_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dummy_table
    ADD CONSTRAINT dummy_table_pkey PRIMARY KEY (key);


--
-- Name: TABLE "BudgetCategories"; Type: ACL; Schema: public; Owner: pocket_budget_user
--

GRANT ALL ON TABLE public."BudgetCategories" TO postgres;


--
-- Name: TABLE "Budgeted"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."Budgeted" TO pocket_budget_user;


--
-- Name: TABLE "PayDates"; Type: ACL; Schema: public; Owner: pocket_budget_user
--

GRANT ALL ON TABLE public."PayDates" TO postgres;


--
-- Name: TABLE "PocketSmithImport"; Type: ACL; Schema: public; Owner: pocket_budget_user
--

GRANT ALL ON TABLE public."PocketSmithImport" TO postgres;


--
-- PostgreSQL database dump complete
--

