--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 13.0

-- Started on 2020-12-14 21:02:28

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
-- TOC entry 208 (class 1259 OID 24627)
-- Name: cart_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_product (
    product_id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.cart_product OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24579)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(30) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24577)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 202
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 210 (class 1259 OID 32768)
-- Name: customer_passport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_passport (
    customer_id integer NOT NULL,
    passport_num text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.customer_passport OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24592)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price integer NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24590)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 204
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 207 (class 1259 OID 24603)
-- Name: product_photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_photo (
    id integer NOT NULL,
    url character varying(255) NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.product_photo OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24601)
-- Name: product_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_photo_id_seq OWNER TO postgres;

--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 206
-- Name: product_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_photo_id_seq OWNED BY public.product_photo.id;


--
-- TOC entry 209 (class 1259 OID 24645)
-- Name: test; Type: VIEW; Schema: public; Owner: oleksii
--

CREATE VIEW public.test AS
 SELECT c.name AS customer,
    p.name AS product
   FROM ((public.cart_product cp
     JOIN public.product p ON ((p.id = cp.product_id)))
     JOIN public.customer c ON ((c.id = cp.customer_id)));


ALTER TABLE public.test OWNER TO oleksii;

--
-- TOC entry 2823 (class 2604 OID 24582)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 2824 (class 2604 OID 24595)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 2825 (class 2604 OID 24606)
-- Name: product_photo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_photo ALTER COLUMN id SET DEFAULT nextval('public.product_photo_id_seq'::regclass);


--
-- TOC entry 2975 (class 0 OID 24627)
-- Dependencies: 208
-- Data for Name: cart_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_product (product_id, customer_id) FROM stdin;
1	1
2	2
3	2
3	3
4	4
1	4
5	5
4	5
\.


--
-- TOC entry 2970 (class 0 OID 24579)
-- Dependencies: 203
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id, name, phone, email) FROM stdin;
1	John	+380650001122	john@h.com
2	Donald	+380530224488	donald@h.com
3	Ronald	+380688907865	ronald@h.com
4	Oleh	+380505675656	oleh@h.com
5	Taras	+380234561232	taras@h.com
\.


--
-- TOC entry 2976 (class 0 OID 32768)
-- Dependencies: 210
-- Data for Name: customer_passport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_passport (customer_id, passport_num, id) FROM stdin;
1	12345	1
2	4567897	2
3	879456	3
4	8798465	4
5	897543219	5
\.


--
-- TOC entry 2972 (class 0 OID 24592)
-- Dependencies: 205
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, description, price) FROM stdin;
1	Навушники Samsung Buds	оригінал\nточно	3000
2	Серветки bella  2-ply 80 pcs.	19.5 x 21.0 cm	40
3	Чашка з квіточками	300 мл.	40
4	Маска трьохшарова медична одноразова	20 шт.	20
5	Олівець простий	HB	10
\.


--
-- TOC entry 2974 (class 0 OID 24603)
-- Dependencies: 207
-- Data for Name: product_photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_photo (id, url, product_id) FROM stdin;
1	img/1_0.png	1
2	img/1_1.png	1
3	img/2_0.png	2
4	img/3_0.png	3
5	img/3_1.png	3
6	img/3_2.png	3
7	img/4_0.png	4
8	img/4_1.png	4
\.


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 202
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 5, true);


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 204
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 5, true);


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 206
-- Name: product_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_photo_id_seq', 8, true);


--
-- TOC entry 2833 (class 2606 OID 32780)
-- Name: customer_passport customer_passport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_passport
    ADD CONSTRAINT customer_passport_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 24587)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 49155)
-- Name: customer_passport customer_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_passport
    ADD CONSTRAINT customer_unique UNIQUE (customer_id);


--
-- TOC entry 2837 (class 2606 OID 49153)
-- Name: customer_passport passport; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_passport
    ADD CONSTRAINT passport UNIQUE (passport_num);


--
-- TOC entry 2831 (class 2606 OID 24608)
-- Name: product_photo product_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_photo
    ADD CONSTRAINT product_photo_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 24600)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 24640)
-- Name: cart_product cart_product_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT cart_product_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 2839 (class 2606 OID 24630)
-- Name: cart_product cart_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT cart_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 2841 (class 2606 OID 32774)
-- Name: customer_passport customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_passport
    ADD CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 2838 (class 2606 OID 24609)
-- Name: product_photo product_photo_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_photo
    ADD CONSTRAINT product_photo_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE cart_product; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.cart_product TO PUBLIC;
GRANT ALL ON TABLE public.cart_product TO oleksii;


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE customer; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.customer TO oleksii;


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 202
-- Name: SEQUENCE customer_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.customer_id_seq TO oleksii;


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE product; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.product TO oleksii;


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 204
-- Name: SEQUENCE product_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.product_id_seq TO oleksii;


--
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE product_photo; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.product_photo TO oleksii;


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 206
-- Name: SEQUENCE product_photo_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.product_photo_id_seq TO oleksii;


-- Completed on 2020-12-14 21:02:28

--
-- PostgreSQL database dump complete
--

