PGDMP     !                    v         	   logicplus    9.5.10    9.5.10 �    ]	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ^	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            _	           1262    24855 	   logicplus    DATABASE     o   CREATE DATABASE logicplus WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_IN' LC_CTYPE = 'en_IN';
    DROP DATABASE logicplus;
             postgres    false                        2615    24856    lp    SCHEMA        CREATE SCHEMA lp;
    DROP SCHEMA lp;
             postgres    false            `	           0    0    lp    ACL     p   REVOKE ALL ON SCHEMA lp FROM PUBLIC;
REVOKE ALL ON SCHEMA lp FROM postgres;
GRANT ALL ON SCHEMA lp TO postgres;
                  postgres    false    8            	            2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            a	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    9            b	           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    9                        3079    12393    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            c	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                        3079    24857    citext 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;
    DROP EXTENSION citext;
                  false    9            d	           0    0    EXTENSION citext    COMMENT     S   COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';
                       false    2            g           1247    24941    email    DOMAIN     �   CREATE DOMAIN email AS citext
	CONSTRAINT email_check CHECK ((VALUE ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zAZ0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'::citext));
    DROP DOMAIN public.email;
       public       postgres    false    2    2    9    2    2    9    9    2    9    2    9    2    9    2    2    9    9    2    9    2    9    2    9    2    2    9    9    2    9    2    9    2    9    9    2    2    9    9    2    9    2    9    2    9    2    2    9    9    2    9    2    9    2    9    2    2    9    9    2    9    2    9    2    9    9    2    9    2    9            i           1247    24943    phone    DOMAIN     �   CREATE DOMAIN phone AS citext
	CONSTRAINT phone_check CHECK ((VALUE ~ '^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$'::citext));
    DROP DOMAIN public.phone;
       public       postgres    false    2    2    9    2    2    9    9    2    9    2    9    2    9    2    2    9    9    2    9    2    9    2    9    2    2    9    9    2    9    2    9    2    9    9    2    2    9    9    2    9    2    9    2    9    2    2    9    9    2    9    2    9    2    9    2    2    9    9    2    9    2    9    2    9    2    9    2    9    9            �            1259    25137    admission_batch    TABLE     n   CREATE TABLE admission_batch (
    aid integer NOT NULL,
    bid integer NOT NULL,
    id integer NOT NULL
);
    DROP TABLE lp.admission_batch;
       lp         postgres    false    8            �            1259    25150    admission_batch_id_seq    SEQUENCE     x   CREATE SEQUENCE admission_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE lp.admission_batch_id_seq;
       lp       postgres    false    207    8            e	           0    0    admission_batch_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE admission_batch_id_seq OWNED BY admission_batch.id;
            lp       postgres    false    208            �            1259    24950    admission_trnxs    TABLE       CREATE TABLE admission_trnxs (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    phone public.phone,
    email public.email,
    study character varying(50) NOT NULL,
    course character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    gender boolean DEFAULT true,
    join_date character varying(25) NOT NULL,
    fees integer NOT NULL,
    active boolean DEFAULT true,
    dp character varying(30) NOT NULL,
    details character varying(1000) NOT NULL,
    bid integer DEFAULT 0
);
    DROP TABLE lp.admission_trnxs;
       lp         postgres    false    615    8    617            f	           0    0    admission_trnxs    ACL     �   REVOKE ALL ON TABLE admission_trnxs FROM PUBLIC;
REVOKE ALL ON TABLE admission_trnxs FROM postgres;
GRANT ALL ON TABLE admission_trnxs TO postgres;
            lp       postgres    false    183            �            1259    24959    admission_trnxs_fees_seq    SEQUENCE     z   CREATE SEQUENCE admission_trnxs_fees_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE lp.admission_trnxs_fees_seq;
       lp       postgres    false    183    8            g	           0    0    admission_trnxs_fees_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE admission_trnxs_fees_seq OWNED BY admission_trnxs.fees;
            lp       postgres    false    184            �            1259    24961    admission_trnxs_id_seq    SEQUENCE     x   CREATE SEQUENCE admission_trnxs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE lp.admission_trnxs_id_seq;
       lp       postgres    false    183    8            h	           0    0    admission_trnxs_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE admission_trnxs_id_seq OWNED BY admission_trnxs.id;
            lp       postgres    false    185            �            1259    24963    batch_trnxs    TABLE     �   CREATE TABLE batch_trnxs (
    bid integer NOT NULL,
    cid integer NOT NULL,
    fid integer NOT NULL,
    day text NOT NULL,
    "time" text NOT NULL,
    active boolean DEFAULT false NOT NULL,
    entries integer DEFAULT 0 NOT NULL
);
    DROP TABLE lp.batch_trnxs;
       lp         postgres    false    8            i	           0    0    batch_trnxs    ACL     �   REVOKE ALL ON TABLE batch_trnxs FROM PUBLIC;
REVOKE ALL ON TABLE batch_trnxs FROM postgres;
GRANT ALL ON TABLE batch_trnxs TO postgres;
            lp       postgres    false    186            �            1259    24970    batch_trnxs_bid_seq    SEQUENCE     u   CREATE SEQUENCE batch_trnxs_bid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE lp.batch_trnxs_bid_seq;
       lp       postgres    false    186    8            j	           0    0    batch_trnxs_bid_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE batch_trnxs_bid_seq OWNED BY batch_trnxs.bid;
            lp       postgres    false    187            �            1259    24972    chat    TABLE     �   CREATE TABLE chat (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    message character varying(100) NOT NULL,
    date date,
    "time" time without time zone
);
    DROP TABLE lp.chat;
       lp         postgres    false    8            k	           0    0    chat    ACL     s   REVOKE ALL ON TABLE chat FROM PUBLIC;
REVOKE ALL ON TABLE chat FROM postgres;
GRANT ALL ON TABLE chat TO postgres;
            lp       postgres    false    188            �            1259    24975    chat_id_seq    SEQUENCE     m   CREATE SEQUENCE chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE lp.chat_id_seq;
       lp       postgres    false    188    8            l	           0    0    chat_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE chat_id_seq OWNED BY chat.id;
            lp       postgres    false    189            �            1259    24977    course_trnxs    TABLE     �   CREATE TABLE course_trnxs (
    id integer NOT NULL,
    cname character varying(20),
    duration character varying(30) NOT NULL,
    details character varying(1000) NOT NULL,
    active boolean DEFAULT true,
    fees integer
);
    DROP TABLE lp.course_trnxs;
       lp         postgres    false    8            m	           0    0    course_trnxs    ACL     �   REVOKE ALL ON TABLE course_trnxs FROM PUBLIC;
REVOKE ALL ON TABLE course_trnxs FROM postgres;
GRANT ALL ON TABLE course_trnxs TO postgres;
            lp       postgres    false    190            �            1259    24984    course_trxns_id_seq    SEQUENCE     u   CREATE SEQUENCE course_trxns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE lp.course_trxns_id_seq;
       lp       postgres    false    190    8            n	           0    0    course_trxns_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE course_trxns_id_seq OWNED BY course_trnxs.id;
            lp       postgres    false    191            �            1259    24986    faculty    TABLE     �  CREATE TABLE faculty (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email public.email,
    phone public.phone,
    website character varying(100) NOT NULL,
    company character varying(50) NOT NULL,
    post character varying(20) NOT NULL,
    dob date NOT NULL,
    address character varying(200) NOT NULL,
    gender boolean DEFAULT true,
    dp character varying(30),
    active boolean DEFAULT true
);
    DROP TABLE lp.faculty;
       lp         postgres    false    617    615    8            o	           0    0    faculty    ACL     |   REVOKE ALL ON TABLE faculty FROM PUBLIC;
REVOKE ALL ON TABLE faculty FROM postgres;
GRANT ALL ON TABLE faculty TO postgres;
            lp       postgres    false    192            �            1259    24994    faculty_id_seq    SEQUENCE     p   CREATE SEQUENCE faculty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE lp.faculty_id_seq;
       lp       postgres    false    8    192            p	           0    0    faculty_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE faculty_id_seq OWNED BY faculty.id;
            lp       postgres    false    193            �            1259    24996    inquiry_trnxs    TABLE     ~  CREATE TABLE inquiry_trnxs (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    phone public.phone NOT NULL,
    email public.email NOT NULL,
    course character varying(20) NOT NULL,
    study character varying(20) NOT NULL,
    details character varying(20) NOT NULL,
    active boolean DEFAULT true,
    date date NOT NULL,
    gender boolean DEFAULT true
);
    DROP TABLE lp.inquiry_trnxs;
       lp         postgres    false    615    8    617            q	           0    0    inquiry_trnxs    ACL     �   REVOKE ALL ON TABLE inquiry_trnxs FROM PUBLIC;
REVOKE ALL ON TABLE inquiry_trnxs FROM postgres;
GRANT ALL ON TABLE inquiry_trnxs TO postgres;
            lp       postgres    false    194            �            1259    25004    inquiry_trnxs_id_seq    SEQUENCE     v   CREATE SEQUENCE inquiry_trnxs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE lp.inquiry_trnxs_id_seq;
       lp       postgres    false    8    194            r	           0    0    inquiry_trnxs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE inquiry_trnxs_id_seq OWNED BY inquiry_trnxs.id;
            lp       postgres    false    195            �            1259    25006    invoice_trnxs    TABLE       CREATE TABLE invoice_trnxs (
    id integer NOT NULL,
    invoice_no character varying(10) DEFAULT 0,
    aid integer NOT NULL,
    fees integer NOT NULL,
    payment_type boolean DEFAULT false,
    bank text DEFAULT 'payment type is cash.'::text,
    chq_no text,
    active boolean
);
    DROP TABLE lp.invoice_trnxs;
       lp         postgres    false    8            s	           0    0    invoice_trnxs    ACL     �   REVOKE ALL ON TABLE invoice_trnxs FROM PUBLIC;
REVOKE ALL ON TABLE invoice_trnxs FROM postgres;
GRANT ALL ON TABLE invoice_trnxs TO postgres;
            lp       postgres    false    196            �            1259    25015    invoice_trnxs_id_seq    SEQUENCE     v   CREATE SEQUENCE invoice_trnxs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE lp.invoice_trnxs_id_seq;
       lp       postgres    false    8    196            t	           0    0    invoice_trnxs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE invoice_trnxs_id_seq OWNED BY invoice_trnxs.id;
            lp       postgres    false    197            �            1259    25017    programe    TABLE     �   CREATE TABLE programe (
    id integer NOT NULL,
    tech character varying(20) NOT NULL,
    framework character varying(20) NOT NULL,
    defination character varying(1000) NOT NULL
);
    DROP TABLE lp.programe;
       lp         postgres    false    8            u	           0    0    programe    ACL        REVOKE ALL ON TABLE programe FROM PUBLIC;
REVOKE ALL ON TABLE programe FROM postgres;
GRANT ALL ON TABLE programe TO postgres;
            lp       postgres    false    198            �            1259    25023    programe_id_seq    SEQUENCE     q   CREATE SEQUENCE programe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE lp.programe_id_seq;
       lp       postgres    false    8    198            v	           0    0    programe_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE programe_id_seq OWNED BY programe.id;
            lp       postgres    false    199            �            1259    25025 
   technology    TABLE     �   CREATE TABLE technology (
    id integer NOT NULL,
    tech character varying(20) NOT NULL,
    framework character varying(20),
    active boolean DEFAULT true
);
    DROP TABLE lp.technology;
       lp         postgres    false    8            w	           0    0 
   technology    ACL     �   REVOKE ALL ON TABLE technology FROM PUBLIC;
REVOKE ALL ON TABLE technology FROM postgres;
GRANT ALL ON TABLE technology TO postgres;
            lp       postgres    false    200            �            1259    25029    technology_id_seq    SEQUENCE     s   CREATE SEQUENCE technology_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE lp.technology_id_seq;
       lp       postgres    false    8    200            x	           0    0    technology_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE technology_id_seq OWNED BY technology.id;
            lp       postgres    false    201            �            1259    25031    test    TABLE     Y   CREATE TABLE test (
    mobile public.phone NOT NULL,
    email public.email NOT NULL
);
    DROP TABLE lp.test;
       lp         postgres    false    615    8    617            y	           0    0    test    ACL     s   REVOKE ALL ON TABLE test FROM PUBLIC;
REVOKE ALL ON TABLE test FROM postgres;
GRANT ALL ON TABLE test TO postgres;
            lp       postgres    false    202            �            1259    25037    user    TABLE     �  CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    email public.email NOT NULL,
    mobile character varying(10) NOT NULL,
    last_login timestamp without time zone DEFAULT '2017-08-19 13:04:00'::timestamp without time zone,
    status boolean DEFAULT false,
    live boolean DEFAULT false,
    active boolean DEFAULT true
);
    DROP TABLE lp."user";
       lp         postgres    false    8    615            z	           0    0    user    ACL     y   REVOKE ALL ON TABLE "user" FROM PUBLIC;
REVOKE ALL ON TABLE "user" FROM postgres;
GRANT ALL ON TABLE "user" TO postgres;
            lp       postgres    false    203            �            1259    25047    user_id_seq    SEQUENCE     m   CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE lp.user_id_seq;
       lp       postgres    false    8    203            {	           0    0    user_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE user_id_seq OWNED BY "user".id;
            lp       postgres    false    204            �            1259    25118    admisson_course    TABLE     n   CREATE TABLE admisson_course (
    id integer NOT NULL,
    aid integer NOT NULL,
    cid integer NOT NULL
);
 #   DROP TABLE public.admisson_course;
       public         postgres    false    9            �            1259    25121    admisson_course_id_seq    SEQUENCE     x   CREATE SEQUENCE admisson_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.admisson_course_id_seq;
       public       postgres    false    205    9            |	           0    0    admisson_course_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE admisson_course_id_seq OWNED BY admisson_course.id;
            public       postgres    false    206            �           2604    25152    id    DEFAULT     j   ALTER TABLE ONLY admission_batch ALTER COLUMN id SET DEFAULT nextval('admission_batch_id_seq'::regclass);
 =   ALTER TABLE lp.admission_batch ALTER COLUMN id DROP DEFAULT;
       lp       postgres    false    208    207            �           2604    25123    id    DEFAULT     j   ALTER TABLE ONLY admission_trnxs ALTER COLUMN id SET DEFAULT nextval('admission_trnxs_id_seq'::regclass);
 =   ALTER TABLE lp.admission_trnxs ALTER COLUMN id DROP DEFAULT;
       lp       postgres    false    185    183            �           2604    25124    fees    DEFAULT     n   ALTER TABLE ONLY admission_trnxs ALTER COLUMN fees SET DEFAULT nextval('admission_trnxs_fees_seq'::regclass);
 ?   ALTER TABLE lp.admission_trnxs ALTER COLUMN fees DROP DEFAULT;
       lp       postgres    false    184    183            �           2604    25125    bid    DEFAULT     d   ALTER TABLE ONLY batch_trnxs ALTER COLUMN bid SET DEFAULT nextval('batch_trnxs_bid_seq'::regclass);
 :   ALTER TABLE lp.batch_trnxs ALTER COLUMN bid DROP DEFAULT;
       lp       postgres    false    187    186            �           2604    25126    id    DEFAULT     T   ALTER TABLE ONLY chat ALTER COLUMN id SET DEFAULT nextval('chat_id_seq'::regclass);
 2   ALTER TABLE lp.chat ALTER COLUMN id DROP DEFAULT;
       lp       postgres    false    189    188            �           2604    25127    id    DEFAULT     d   ALTER TABLE ONLY course_trnxs ALTER COLUMN id SET DEFAULT nextval('course_trxns_id_seq'::regclass);
 :   ALTER TABLE lp.course_trnxs ALTER COLUMN id DROP DEFAULT;
       lp       postgres    false    191    190            �           2604    25128    id    DEFAULT     Z   ALTER TABLE ONLY faculty ALTER COLUMN id SET DEFAULT nextval('faculty_id_seq'::regclass);
 5   ALTER TABLE lp.faculty ALTER COLUMN id DROP DEFAULT;
       lp       postgres    false    193    192            �           2604    25129    id    DEFAULT     f   ALTER TABLE ONLY inquiry_trnxs ALTER COLUMN id SET DEFAULT nextval('inquiry_trnxs_id_seq'::regclass);
 ;   ALTER TABLE lp.inquiry_trnxs ALTER COLUMN id DROP DEFAULT;
       lp       postgres    false    195    194            �           2604    25130    id    DEFAULT     f   ALTER TABLE ONLY invoice_trnxs ALTER COLUMN id SET DEFAULT nextval('invoice_trnxs_id_seq'::regclass);
 ;   ALTER TABLE lp.invoice_trnxs ALTER COLUMN id DROP DEFAULT;
       lp       postgres    false    197    196            �           2604    25131    id    DEFAULT     \   ALTER TABLE ONLY programe ALTER COLUMN id SET DEFAULT nextval('programe_id_seq'::regclass);
 6   ALTER TABLE lp.programe ALTER COLUMN id DROP DEFAULT;
       lp       postgres    false    199    198            �           2604    25132    id    DEFAULT     `   ALTER TABLE ONLY technology ALTER COLUMN id SET DEFAULT nextval('technology_id_seq'::regclass);
 8   ALTER TABLE lp.technology ALTER COLUMN id DROP DEFAULT;
       lp       postgres    false    201    200            �           2604    25133    id    DEFAULT     V   ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);
 4   ALTER TABLE lp."user" ALTER COLUMN id DROP DEFAULT;
       lp       postgres    false    204    203            �           2604    25134    id    DEFAULT     j   ALTER TABLE ONLY admisson_course ALTER COLUMN id SET DEFAULT nextval('admisson_course_id_seq'::regclass);
 A   ALTER TABLE public.admisson_course ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    205            Y	          0    25137    admission_batch 
   TABLE DATA               0   COPY admission_batch (aid, bid, id) FROM stdin;
    lp       postgres    false    207   j�       }	           0    0    admission_batch_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('admission_batch_id_seq', 11, true);
            lp       postgres    false    208            A	          0    24950    admission_trnxs 
   TABLE DATA               �   COPY admission_trnxs (id, name, phone, email, study, course, address, gender, join_date, fees, active, dp, details, bid) FROM stdin;
    lp       postgres    false    183   ��       ~	           0    0    admission_trnxs_fees_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('admission_trnxs_fees_seq', 1, false);
            lp       postgres    false    184            	           0    0    admission_trnxs_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('admission_trnxs_id_seq', 12, true);
            lp       postgres    false    185            D	          0    24963    batch_trnxs 
   TABLE DATA               K   COPY batch_trnxs (bid, cid, fid, day, "time", active, entries) FROM stdin;
    lp       postgres    false    186   ό       �	           0    0    batch_trnxs_bid_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('batch_trnxs_bid_seq', 11, true);
            lp       postgres    false    187            F	          0    24972    chat 
   TABLE DATA               8   COPY chat (id, name, message, date, "time") FROM stdin;
    lp       postgres    false    188   Q�       �	           0    0    chat_id_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('chat_id_seq', 5, true);
            lp       postgres    false    189            H	          0    24977    course_trnxs 
   TABLE DATA               K   COPY course_trnxs (id, cname, duration, details, active, fees) FROM stdin;
    lp       postgres    false    190   �       �	           0    0    course_trxns_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('course_trxns_id_seq', 7, true);
            lp       postgres    false    191            J	          0    24986    faculty 
   TABLE DATA               l   COPY faculty (id, name, email, phone, website, company, post, dob, address, gender, dp, active) FROM stdin;
    lp       postgres    false    192   ��       �	           0    0    faculty_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('faculty_id_seq', 6, true);
            lp       postgres    false    193            L	          0    24996    inquiry_trnxs 
   TABLE DATA               f   COPY inquiry_trnxs (id, name, phone, email, course, study, details, active, date, gender) FROM stdin;
    lp       postgres    false    194   Ə       �	           0    0    inquiry_trnxs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('inquiry_trnxs_id_seq', 7, true);
            lp       postgres    false    195            N	          0    25006    invoice_trnxs 
   TABLE DATA               _   COPY invoice_trnxs (id, invoice_no, aid, fees, payment_type, bank, chq_no, active) FROM stdin;
    lp       postgres    false    196   a�       �	           0    0    invoice_trnxs_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('invoice_trnxs_id_seq', 12, true);
            lp       postgres    false    197            P	          0    25017    programe 
   TABLE DATA               <   COPY programe (id, tech, framework, defination) FROM stdin;
    lp       postgres    false    198   Ɛ       �	           0    0    programe_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('programe_id_seq', 1, false);
            lp       postgres    false    199            R	          0    25025 
   technology 
   TABLE DATA               :   COPY technology (id, tech, framework, active) FROM stdin;
    lp       postgres    false    200   �       �	           0    0    technology_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('technology_id_seq', 7, true);
            lp       postgres    false    201            T	          0    25031    test 
   TABLE DATA               &   COPY test (mobile, email) FROM stdin;
    lp       postgres    false    202   I�       U	          0    25037    user 
   TABLE DATA               b   COPY "user" (id, username, password, email, mobile, last_login, status, live, active) FROM stdin;
    lp       postgres    false    203   ��       �	           0    0    user_id_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('user_id_seq', 5, true);
            lp       postgres    false    204            W	          0    25118    admisson_course 
   TABLE DATA               0   COPY admisson_course (id, aid, cid) FROM stdin;
    public       postgres    false    205   J�       �	           0    0    admisson_course_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('admisson_course_id_seq', 1, false);
            public       postgres    false    206            �           2606    25154    admission_batch_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY admission_batch
    ADD CONSTRAINT admission_batch_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY lp.admission_batch DROP CONSTRAINT admission_batch_pkey;
       lp         postgres    false    207    207            �           2606    25064    admission_trnxs_email_key 
   CONSTRAINT     ^   ALTER TABLE ONLY admission_trnxs
    ADD CONSTRAINT admission_trnxs_email_key UNIQUE (email);
 O   ALTER TABLE ONLY lp.admission_trnxs DROP CONSTRAINT admission_trnxs_email_key;
       lp         postgres    false    183    183            �           2606    25066    admission_trnxs_phone_key 
   CONSTRAINT     ^   ALTER TABLE ONLY admission_trnxs
    ADD CONSTRAINT admission_trnxs_phone_key UNIQUE (phone);
 O   ALTER TABLE ONLY lp.admission_trnxs DROP CONSTRAINT admission_trnxs_phone_key;
       lp         postgres    false    183    183            �           2606    25068    admission_trnxs_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY admission_trnxs
    ADD CONSTRAINT admission_trnxs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY lp.admission_trnxs DROP CONSTRAINT admission_trnxs_pkey;
       lp         postgres    false    183    183            �           2606    25070    batch_trnxs_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY batch_trnxs
    ADD CONSTRAINT batch_trnxs_pkey PRIMARY KEY (bid);
 B   ALTER TABLE ONLY lp.batch_trnxs DROP CONSTRAINT batch_trnxs_pkey;
       lp         postgres    false    186    186            �           2606    25072 	   chat_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (id);
 4   ALTER TABLE ONLY lp.chat DROP CONSTRAINT chat_pkey;
       lp         postgres    false    188    188            �           2606    25074    course_trxns_cname_key 
   CONSTRAINT     X   ALTER TABLE ONLY course_trnxs
    ADD CONSTRAINT course_trxns_cname_key UNIQUE (cname);
 I   ALTER TABLE ONLY lp.course_trnxs DROP CONSTRAINT course_trxns_cname_key;
       lp         postgres    false    190    190            �           2606    25076    course_trxns_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY course_trnxs
    ADD CONSTRAINT course_trxns_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY lp.course_trnxs DROP CONSTRAINT course_trxns_pkey;
       lp         postgres    false    190    190            �           2606    25078    faculty_email_key 
   CONSTRAINT     N   ALTER TABLE ONLY faculty
    ADD CONSTRAINT faculty_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY lp.faculty DROP CONSTRAINT faculty_email_key;
       lp         postgres    false    192    192            �           2606    25080    faculty_phone_key 
   CONSTRAINT     N   ALTER TABLE ONLY faculty
    ADD CONSTRAINT faculty_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY lp.faculty DROP CONSTRAINT faculty_phone_key;
       lp         postgres    false    192    192            �           2606    25082    faculty_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY lp.faculty DROP CONSTRAINT faculty_pkey;
       lp         postgres    false    192    192            �           2606    25084    inquiry_trnxs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY inquiry_trnxs
    ADD CONSTRAINT inquiry_trnxs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY lp.inquiry_trnxs DROP CONSTRAINT inquiry_trnxs_pkey;
       lp         postgres    false    194    194            �           2606    25086    invoice_trnxs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY invoice_trnxs
    ADD CONSTRAINT invoice_trnxs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY lp.invoice_trnxs DROP CONSTRAINT invoice_trnxs_pkey;
       lp         postgres    false    196    196            �           2606    25088    programe_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY programe
    ADD CONSTRAINT programe_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY lp.programe DROP CONSTRAINT programe_pkey;
       lp         postgres    false    198    198            �           2606    25090    technology_framework_key 
   CONSTRAINT     \   ALTER TABLE ONLY technology
    ADD CONSTRAINT technology_framework_key UNIQUE (framework);
 I   ALTER TABLE ONLY lp.technology DROP CONSTRAINT technology_framework_key;
       lp         postgres    false    200    200            �           2606    25092    technology_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY technology
    ADD CONSTRAINT technology_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY lp.technology DROP CONSTRAINT technology_pkey;
       lp         postgres    false    200    200            �           2606    25094 	   user_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY lp."user" DROP CONSTRAINT user_pkey;
       lp         postgres    false    203    203            �           2606    25096    user_username_key 
   CONSTRAINT     P   ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
 >   ALTER TABLE ONLY lp."user" DROP CONSTRAINT user_username_key;
       lp         postgres    false    203    203            �           2606    25136    admisson_course_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY admisson_course
    ADD CONSTRAINT admisson_course_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.admisson_course DROP CONSTRAINT admisson_course_pkey;
       public         postgres    false    205    205            �           2606    25140    admission_batch_aid_fkey    FK CONSTRAINT        ALTER TABLE ONLY admission_batch
    ADD CONSTRAINT admission_batch_aid_fkey FOREIGN KEY (aid) REFERENCES admission_trnxs(id);
 N   ALTER TABLE ONLY lp.admission_batch DROP CONSTRAINT admission_batch_aid_fkey;
       lp       postgres    false    207    2216    183            �           2606    25145    admission_batch_bid_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY admission_batch
    ADD CONSTRAINT admission_batch_bid_fkey FOREIGN KEY (bid) REFERENCES batch_trnxs(bid);
 N   ALTER TABLE ONLY lp.admission_batch DROP CONSTRAINT admission_batch_bid_fkey;
       lp       postgres    false    207    186    2218            �           2606    25097    batch_trnxs_cid_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY batch_trnxs
    ADD CONSTRAINT batch_trnxs_cid_fkey FOREIGN KEY (cid) REFERENCES course_trnxs(id);
 F   ALTER TABLE ONLY lp.batch_trnxs DROP CONSTRAINT batch_trnxs_cid_fkey;
       lp       postgres    false    186    190    2224            �           2606    25102    batch_trnxs_fid_fkey    FK CONSTRAINT     o   ALTER TABLE ONLY batch_trnxs
    ADD CONSTRAINT batch_trnxs_fid_fkey FOREIGN KEY (fid) REFERENCES faculty(id);
 F   ALTER TABLE ONLY lp.batch_trnxs DROP CONSTRAINT batch_trnxs_fid_fkey;
       lp       postgres    false    2230    192    186            �           2606    25107    invoice_trnxs_aid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY invoice_trnxs
    ADD CONSTRAINT invoice_trnxs_aid_fkey FOREIGN KEY (aid) REFERENCES admission_trnxs(id);
 J   ALTER TABLE ONLY lp.invoice_trnxs DROP CONSTRAINT invoice_trnxs_aid_fkey;
       lp       postgres    false    183    196    2216            �           2606    25112    programe_framework_fkey    FK CONSTRAINT        ALTER TABLE ONLY programe
    ADD CONSTRAINT programe_framework_fkey FOREIGN KEY (framework) REFERENCES technology(framework);
 F   ALTER TABLE ONLY lp.programe DROP CONSTRAINT programe_framework_fkey;
       lp       postgres    false    2238    200    198            Y	   7   x���� ���0�Aw��s4<b+6f*��(:lVhvzs��^������H��e      A	     x�u��j�0E���$�F�ckRB��E�P&Vl�"��_9n�U7��9wnCcհ��,(.��v2U0�װ��ֺi_vT�a>tp8n_��mrf�A����#�����-[0��}��1�Bp�a})!O�� ]X(d���Lq�u��^�E�Hg.���6���1�8K2o\�ψbQ�����?�ͬ��l1�U��H�X%�����s��{�����1"k*k6�9+i��t�.���p*��Q�
k��:�/D&�l�ǧ��ɒ�A��Nn      D	   r   x�3�4�4�)M-NI��	�(-3�KJ��NC+C# �Y�i�e�i�i�雟R�����V�����ڐ�h�'B�|�z$k�Z9A�F�ss���=... Q�D      F	   �   x�]�=�0��9E����N��ti��DR%Q%nn�Ho�����38�`�"�+�[�l��EYx���y�G��|�E P�Q+��wH�9�-��;�k~{�y�wv�*��[����?�<ð�T�$3��R+�(3l      H	   �   x�u��
� ����S� n�kT�QDDѢ��nl��:Ԃ�}ZDW;w�p8�]�j��F��8e�����yA��7�baK�xY������p(��x�A�nn�j�?����P�`1��t.�Ә3(z������y��j�{��8_w<l��.tmȾ2�d��iM�����5E�	�?]      J	     x����N�0���S�X�I�pBh$&MqBB�eKX��	k�ӓV;����,[�}�+x�tqg�6���E?�ru��5�yY�MU*6��~��1��w��k�u��=��~��c������p�a��W|��t��u�����*����!�W6�x�Ǣ�R����a����L��f/Rcb�+���K�0����@�q�Y����ͫ�(�Z�'�~
�k��\�7�>��V���60"o��w�9;�D���u�m\l#GD�����<˲?ޭ��      L	   �   x�3��M�(IT(��,ᴴ401271�4���ML�s3s���s9*K2��8�\u=C8�]�u|�S�9K8��u,u,8K��9��8��ML��-,�1�8%#-�� ά�t�MJ�̬,��*��9������ %D�      N	   U   x����)0�4�4500�L�,H��M�+Q(�,HU�,VHN,�����,�24 ��$J�P�!P!�9P-g	g��'�����)P2F��� -�8      P	      x������ � �      R	   V   x�3��J,K�,.(��K�,�2��K�JK��|#΀ʒ��<N���| ��w�I,�
�R���AJL Fdd&��%���b���� �� o      T	   3   x���401271�4��M�(I,��,11q���.�������������� 2�      U	   �   x���A
�0����@�L�6��W.\�R��іR+M���"�PA�3���+8U�n���uU����Cz�Z`Ԛ]�-�B�Yb��-� �u<�!�a�߮w��tHi���1~'����!���U,���B��>���h�5���tIj���0P^��>������\A�$R!��JXE      W	      x������ � �     