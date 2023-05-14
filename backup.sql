--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.admin_permissions_role_links OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order double precision,
    user_order double precision
);


ALTER TABLE public.admin_users_roles_links OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_links_id_seq OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);


ALTER TABLE public.files_folder_links OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_links_id_seq OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_morphs OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_morphs_id_seq OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    stripe_id character varying(255),
    products jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    title character varying(255),
    subtitle character varying(255),
    price numeric(10,2),
    description text,
    size jsonb,
    original_price numeric(10,2),
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_categories_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_categories_links (
    id integer NOT NULL,
    product_id integer,
    category_id integer,
    category_order double precision,
    product_order double precision
);


ALTER TABLE public.products_categories_links OWNER TO postgres;

--
-- Name: products_categories_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_categories_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_categories_links_id_seq OWNER TO postgres;

--
-- Name: products_categories_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_categories_links_id_seq OWNED BY public.products_categories_links.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: strapi-stripe_ss-payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."strapi-stripe_ss-payment" (
    id integer NOT NULL,
    txn_date timestamp(6) without time zone,
    transaction_id character varying(255),
    is_txn_successful boolean,
    txn_message text,
    txn_error_message character varying(255),
    txn_amount numeric(10,2),
    customer_name character varying(255),
    customer_email character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public."strapi-stripe_ss-payment" OWNER TO postgres;

--
-- Name: strapi-stripe_ss-payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."strapi-stripe_ss-payment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."strapi-stripe_ss-payment_id_seq" OWNER TO postgres;

--
-- Name: strapi-stripe_ss-payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."strapi-stripe_ss-payment_id_seq" OWNED BY public."strapi-stripe_ss-payment".id;


--
-- Name: strapi-stripe_ss-product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."strapi-stripe_ss-product" (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255),
    description text,
    price numeric(10,2),
    currency character varying(255),
    is_subscription boolean,
    "interval" character varying(255),
    trial_period_days integer,
    stripe_product_id character varying(255),
    stripe_price_id character varying(255),
    stripe_plan_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public."strapi-stripe_ss-product" OWNER TO postgres;

--
-- Name: strapi-stripe_ss-product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."strapi-stripe_ss-product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."strapi-stripe_ss-product_id_seq" OWNER TO postgres;

--
-- Name: strapi-stripe_ss-product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."strapi-stripe_ss-product_id_seq" OWNED BY public."strapi-stripe_ss-product".id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_stripe_ss_payment_stripe_product_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_stripe_ss_payment_stripe_product_links (
    id integer NOT NULL,
    ss_payment_id integer,
    ss_product_id integer,
    ss_payment_order double precision
);


ALTER TABLE public.strapi_stripe_ss_payment_stripe_product_links OWNER TO postgres;

--
-- Name: strapi_stripe_ss_payment_stripe_product_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_stripe_ss_payment_stripe_product_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_stripe_ss_payment_stripe_product_links_id_seq OWNER TO postgres;

--
-- Name: strapi_stripe_ss_payment_stripe_product_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_stripe_ss_payment_stripe_product_links_id_seq OWNED BY public.strapi_stripe_ss_payment_stripe_product_links.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_links OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO postgres;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.up_permissions_role_links OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order double precision
);


ALTER TABLE public.up_users_role_links OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_links_id_seq OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);


ALTER TABLE public.upload_folders_parent_links OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_links_id_seq OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_categories_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories_links ALTER COLUMN id SET DEFAULT nextval('public.products_categories_links_id_seq'::regclass);


--
-- Name: strapi-stripe_ss-payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_ss-payment" ALTER COLUMN id SET DEFAULT nextval('public."strapi-stripe_ss-payment_id_seq"'::regclass);


--
-- Name: strapi-stripe_ss-product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_ss-product" ALTER COLUMN id SET DEFAULT nextval('public."strapi-stripe_ss-product_id_seq"'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_stripe_ss_payment_stripe_product_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_stripe_ss_payment_stripe_product_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_stripe_ss_payment_stripe_product_links_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::upload.read	\N	{}	[]	2023-05-03 14:20:54.173	2023-05-03 14:20:54.173	\N	\N
2	plugin::upload.configure-view	\N	{}	[]	2023-05-03 14:20:55.14	2023-05-03 14:20:55.14	\N	\N
3	plugin::upload.assets.create	\N	{}	[]	2023-05-03 14:20:56.105	2023-05-03 14:20:56.105	\N	\N
4	plugin::upload.assets.update	\N	{}	[]	2023-05-03 14:20:57.028	2023-05-03 14:20:57.028	\N	\N
5	plugin::upload.assets.download	\N	{}	[]	2023-05-03 14:20:57.95	2023-05-03 14:20:57.95	\N	\N
6	plugin::upload.assets.copy-link	\N	{}	[]	2023-05-03 14:20:58.961	2023-05-03 14:20:58.961	\N	\N
7	plugin::upload.read	\N	{}	["admin::is-creator"]	2023-05-03 14:20:59.93	2023-05-03 14:20:59.93	\N	\N
8	plugin::upload.configure-view	\N	{}	[]	2023-05-03 14:21:00.888	2023-05-03 14:21:00.888	\N	\N
9	plugin::upload.assets.create	\N	{}	[]	2023-05-03 14:21:01.853	2023-05-03 14:21:01.853	\N	\N
10	plugin::upload.assets.update	\N	{}	["admin::is-creator"]	2023-05-03 14:21:02.823	2023-05-03 14:21:02.823	\N	\N
11	plugin::upload.assets.download	\N	{}	[]	2023-05-03 14:21:03.781	2023-05-03 14:21:03.781	\N	\N
12	plugin::upload.assets.copy-link	\N	{}	[]	2023-05-03 14:21:04.786	2023-05-03 14:21:04.786	\N	\N
13	plugin::content-manager.explorer.create	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2023-05-03 14:21:06.384	2023-05-03 14:21:06.384	\N	\N
14	plugin::content-manager.explorer.read	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2023-05-03 14:21:07.386	2023-05-03 14:21:07.386	\N	\N
15	plugin::content-manager.explorer.update	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2023-05-03 14:21:08.35	2023-05-03 14:21:08.35	\N	\N
16	plugin::content-manager.explorer.delete	plugin::users-permissions.user	{}	[]	2023-05-03 14:21:09.308	2023-05-03 14:21:09.308	\N	\N
17	plugin::content-manager.single-types.configure-view	\N	{}	[]	2023-05-03 14:21:10.31	2023-05-03 14:21:10.31	\N	\N
18	plugin::content-manager.collection-types.configure-view	\N	{}	[]	2023-05-03 14:21:11.275	2023-05-03 14:21:11.275	\N	\N
19	plugin::content-manager.components.configure-layout	\N	{}	[]	2023-05-03 14:21:12.235	2023-05-03 14:21:12.235	\N	\N
20	plugin::content-type-builder.read	\N	{}	[]	2023-05-03 14:21:13.246	2023-05-03 14:21:13.246	\N	\N
21	plugin::email.settings.read	\N	{}	[]	2023-05-03 14:21:14.208	2023-05-03 14:21:14.208	\N	\N
22	plugin::upload.read	\N	{}	[]	2023-05-03 14:21:15.125	2023-05-03 14:21:15.125	\N	\N
23	plugin::upload.assets.create	\N	{}	[]	2023-05-03 14:21:16.09	2023-05-03 14:21:16.09	\N	\N
24	plugin::upload.assets.update	\N	{}	[]	2023-05-03 14:21:17.095	2023-05-03 14:21:17.095	\N	\N
25	plugin::upload.assets.download	\N	{}	[]	2023-05-03 14:21:18.098	2023-05-03 14:21:18.098	\N	\N
26	plugin::upload.assets.copy-link	\N	{}	[]	2023-05-03 14:21:19.141	2023-05-03 14:21:19.141	\N	\N
27	plugin::upload.configure-view	\N	{}	[]	2023-05-03 14:21:20.06	2023-05-03 14:21:20.06	\N	\N
28	plugin::upload.settings.read	\N	{}	[]	2023-05-03 14:21:20.981	2023-05-03 14:21:20.981	\N	\N
29	plugin::users-permissions.roles.create	\N	{}	[]	2023-05-03 14:21:21.983	2023-05-03 14:21:21.983	\N	\N
30	plugin::users-permissions.roles.read	\N	{}	[]	2023-05-03 14:21:22.946	2023-05-03 14:21:22.946	\N	\N
31	plugin::users-permissions.roles.update	\N	{}	[]	2023-05-03 14:21:23.857	2023-05-03 14:21:23.857	\N	\N
32	plugin::users-permissions.roles.delete	\N	{}	[]	2023-05-03 14:21:24.857	2023-05-03 14:21:24.857	\N	\N
33	plugin::users-permissions.providers.read	\N	{}	[]	2023-05-03 14:21:25.775	2023-05-03 14:21:25.775	\N	\N
34	plugin::users-permissions.providers.update	\N	{}	[]	2023-05-03 14:21:26.737	2023-05-03 14:21:26.737	\N	\N
35	plugin::users-permissions.email-templates.read	\N	{}	[]	2023-05-03 14:21:27.698	2023-05-03 14:21:27.698	\N	\N
36	plugin::users-permissions.email-templates.update	\N	{}	[]	2023-05-03 14:21:28.706	2023-05-03 14:21:28.706	\N	\N
37	plugin::users-permissions.advanced-settings.read	\N	{}	[]	2023-05-03 14:21:29.625	2023-05-03 14:21:29.625	\N	\N
38	plugin::users-permissions.advanced-settings.update	\N	{}	[]	2023-05-03 14:21:30.636	2023-05-03 14:21:30.636	\N	\N
39	plugin::i18n.locale.create	\N	{}	[]	2023-05-03 14:21:31.644	2023-05-03 14:21:31.644	\N	\N
40	plugin::i18n.locale.read	\N	{}	[]	2023-05-03 14:21:32.566	2023-05-03 14:21:32.566	\N	\N
41	plugin::i18n.locale.update	\N	{}	[]	2023-05-03 14:21:33.569	2023-05-03 14:21:33.569	\N	\N
42	plugin::i18n.locale.delete	\N	{}	[]	2023-05-03 14:21:34.577	2023-05-03 14:21:34.577	\N	\N
43	admin::marketplace.read	\N	{}	[]	2023-05-03 14:21:35.537	2023-05-03 14:21:35.537	\N	\N
44	admin::webhooks.create	\N	{}	[]	2023-05-03 14:21:36.458	2023-05-03 14:21:36.458	\N	\N
45	admin::webhooks.read	\N	{}	[]	2023-05-03 14:21:37.372	2023-05-03 14:21:37.372	\N	\N
46	admin::webhooks.update	\N	{}	[]	2023-05-03 14:21:38.377	2023-05-03 14:21:38.377	\N	\N
47	admin::webhooks.delete	\N	{}	[]	2023-05-03 14:21:39.294	2023-05-03 14:21:39.294	\N	\N
48	admin::users.create	\N	{}	[]	2023-05-03 14:21:40.254	2023-05-03 14:21:40.254	\N	\N
49	admin::users.read	\N	{}	[]	2023-05-03 14:21:41.172	2023-05-03 14:21:41.172	\N	\N
50	admin::users.update	\N	{}	[]	2023-05-03 14:21:42.217	2023-05-03 14:21:42.217	\N	\N
51	admin::users.delete	\N	{}	[]	2023-05-03 14:21:43.178	2023-05-03 14:21:43.178	\N	\N
52	admin::roles.create	\N	{}	[]	2023-05-03 14:21:44.099	2023-05-03 14:21:44.099	\N	\N
53	admin::roles.read	\N	{}	[]	2023-05-03 14:21:45.101	2023-05-03 14:21:45.101	\N	\N
54	admin::roles.update	\N	{}	[]	2023-05-03 14:21:46.021	2023-05-03 14:21:46.021	\N	\N
55	admin::roles.delete	\N	{}	[]	2023-05-03 14:21:46.938	2023-05-03 14:21:46.938	\N	\N
56	admin::api-tokens.access	\N	{}	[]	2023-05-03 14:21:47.9	2023-05-03 14:21:47.9	\N	\N
57	admin::api-tokens.create	\N	{}	[]	2023-05-03 14:21:48.86	2023-05-03 14:21:48.86	\N	\N
58	admin::api-tokens.read	\N	{}	[]	2023-05-03 14:21:49.824	2023-05-03 14:21:49.824	\N	\N
59	admin::api-tokens.update	\N	{}	[]	2023-05-03 14:21:50.744	2023-05-03 14:21:50.744	\N	\N
60	admin::api-tokens.regenerate	\N	{}	[]	2023-05-03 14:21:51.706	2023-05-03 14:21:51.706	\N	\N
61	admin::api-tokens.delete	\N	{}	[]	2023-05-03 14:21:52.675	2023-05-03 14:21:52.675	\N	\N
62	admin::project-settings.update	\N	{}	[]	2023-05-03 14:21:53.602	2023-05-03 14:21:53.602	\N	\N
63	admin::project-settings.read	\N	{}	[]	2023-05-03 14:21:54.53	2023-05-03 14:21:54.53	\N	\N
64	admin::transfer.tokens.access	\N	{}	[]	2023-05-03 14:21:55.497	2023-05-03 14:21:55.497	\N	\N
65	admin::transfer.tokens.create	\N	{}	[]	2023-05-03 14:21:56.418	2023-05-03 14:21:56.418	\N	\N
66	admin::transfer.tokens.read	\N	{}	[]	2023-05-03 14:21:57.386	2023-05-03 14:21:57.386	\N	\N
67	admin::transfer.tokens.update	\N	{}	[]	2023-05-03 14:21:58.35	2023-05-03 14:21:58.35	\N	\N
68	admin::transfer.tokens.regenerate	\N	{}	[]	2023-05-03 14:21:59.318	2023-05-03 14:21:59.318	\N	\N
69	admin::transfer.tokens.delete	\N	{}	[]	2023-05-03 14:22:00.277	2023-05-03 14:22:00.277	\N	\N
73	plugin::content-manager.explorer.delete	api::product.product	{}	[]	2023-05-03 17:15:09.919	2023-05-03 17:15:09.919	\N	\N
74	plugin::content-manager.explorer.publish	api::product.product	{}	[]	2023-05-03 17:15:10.914	2023-05-03 17:15:10.914	\N	\N
81	plugin::content-manager.explorer.delete	api::category.category	{}	[]	2023-05-03 17:19:14.095	2023-05-03 17:19:14.095	\N	\N
82	plugin::content-manager.explorer.publish	api::category.category	{}	[]	2023-05-03 17:19:15.014	2023-05-03 17:19:15.014	\N	\N
83	plugin::content-manager.explorer.create	api::order.order	{"fields": ["stripe_id", "products"]}	[]	2023-05-03 17:21:39.988	2023-05-03 17:21:39.988	\N	\N
84	plugin::content-manager.explorer.read	api::order.order	{"fields": ["stripe_id", "products"]}	[]	2023-05-03 17:21:41.024	2023-05-03 17:21:41.024	\N	\N
85	plugin::content-manager.explorer.update	api::order.order	{"fields": ["stripe_id", "products"]}	[]	2023-05-03 17:21:41.983	2023-05-03 17:21:41.983	\N	\N
86	plugin::content-manager.explorer.delete	api::order.order	{}	[]	2023-05-03 17:21:42.895	2023-05-03 17:21:42.895	\N	\N
87	plugin::content-manager.explorer.publish	api::order.order	{}	[]	2023-05-03 17:21:43.899	2023-05-03 17:21:43.899	\N	\N
94	plugin::content-manager.explorer.create	api::category.category	{"fields": ["title", "slug", "products"]}	[]	2023-05-03 17:33:13.143	2023-05-03 17:33:13.143	\N	\N
95	plugin::content-manager.explorer.create	api::product.product	{"fields": ["title", "subtitle", "price", "description", "size", "images", "thumbnail", "original_price", "slug", "categories"]}	[]	2023-05-03 17:33:14.105	2023-05-03 17:33:14.105	\N	\N
96	plugin::content-manager.explorer.read	api::category.category	{"fields": ["title", "slug", "products"]}	[]	2023-05-03 17:33:15.097	2023-05-03 17:33:15.097	\N	\N
97	plugin::content-manager.explorer.read	api::product.product	{"fields": ["title", "subtitle", "price", "description", "size", "images", "thumbnail", "original_price", "slug", "categories"]}	[]	2023-05-03 17:33:16.057	2023-05-03 17:33:16.057	\N	\N
98	plugin::content-manager.explorer.update	api::category.category	{"fields": ["title", "slug", "products"]}	[]	2023-05-03 17:33:17.061	2023-05-03 17:33:17.061	\N	\N
99	plugin::content-manager.explorer.update	api::product.product	{"fields": ["title", "subtitle", "price", "description", "size", "images", "thumbnail", "original_price", "slug", "categories"]}	[]	2023-05-03 17:33:18.032	2023-05-03 17:33:18.032	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	3	1
8	8	3	2
9	9	3	3
10	10	3	4
11	11	3	5
12	12	3	6
13	13	1	1
14	14	1	2
15	15	1	3
16	16	1	4
17	17	1	5
18	18	1	6
19	19	1	7
20	20	1	8
21	21	1	9
22	22	1	10
23	23	1	11
24	24	1	12
25	25	1	13
26	26	1	14
27	27	1	15
28	28	1	16
29	29	1	17
30	30	1	18
31	31	1	19
32	32	1	20
33	33	1	21
34	34	1	22
35	35	1	23
36	36	1	24
37	37	1	25
38	38	1	26
39	39	1	27
40	40	1	28
41	41	1	29
42	42	1	30
43	43	1	31
44	44	1	32
45	45	1	33
46	46	1	34
47	47	1	35
48	48	1	36
49	49	1	37
50	50	1	38
51	51	1	39
52	52	1	40
53	53	1	41
54	54	1	42
55	55	1	43
56	56	1	44
57	57	1	45
58	58	1	46
59	59	1	47
60	60	1	48
61	61	1	49
62	62	1	50
63	63	1	51
64	64	1	52
65	65	1	53
66	66	1	54
67	67	1	55
68	68	1	56
69	69	1	57
73	73	1	61
74	74	1	62
81	81	1	69
82	82	1	70
83	83	1	71
84	84	1	72
85	85	1	73
86	86	1	74
87	87	1	75
94	94	1	76
95	95	1	77
96	96	1	78
97	97	1	79
98	98	1	80
99	99	1	81
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2023-05-03 14:20:51.792	2023-05-03 14:20:51.792	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2023-05-03 14:20:52.76	2023-05-03 14:20:52.76	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2023-05-03 14:20:53.562	2023-05-03 14:20:53.562	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Ahmed	Sattar	\N	ahmed@example.com	$2a$10$ZPcnNIc4VfmSXyqhuyLx6u9mwAbXG1s9RuTA2qg5hIthgQCmY90fm	\N	\N	t	f	\N	2023-05-03 14:22:22.527	2023-05-03 14:22:22.527	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
1	1	1	1	1
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, title, slug, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
1	Jordan	jordan	2023-04-18 16:05:03.535	2023-04-18 16:05:11.393	2023-04-18 16:05:11.039	1	1
2	Football	football	2023-04-18 16:05:56.368	2023-04-18 16:06:04.037	2023-04-18 16:06:03.715	1	1
3	Sneakers	sneakers	2023-04-18 16:07:05.218	2023-04-18 16:07:12.801	2023-04-18 16:07:12.429	1	1
4	Running	running	2023-04-18 16:07:35.911	2023-04-18 16:07:50.17	2023-04-18 16:07:49.86	1	1
6	Basketball	basketball	2023-04-18 16:09:19.95	2023-04-18 16:09:27.012	2023-04-18 16:09:26.697	1	1
7	Golf	golf	2023-04-18 16:09:49.826	2023-04-18 16:09:56.697	2023-04-18 16:09:56.371	1	1
5	Shoes	shoes	2023-04-18 16:08:51.929	2023-05-12 02:39:24.711	2023-04-18 16:08:59.298	1	1
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
14	slide-3.png	\N	\N	1200	525	{"large": {"ext": ".png", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683131351/shoe-store/large_slide_3_2910a47031.png", "hash": "large_slide_3_2910a47031", "mime": "image/png", "name": "large_slide-3.png", "path": null, "size": 285.2, "width": 1000, "height": 438, "provider_metadata": {"public_id": "shoe-store/large_slide_3_2910a47031", "resource_type": "image"}}, "small": {"ext": ".png", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683131351/shoe-store/small_slide_3_2910a47031.png", "hash": "small_slide_3_2910a47031", "mime": "image/png", "name": "small_slide-3.png", "path": null, "size": 78.97, "width": 500, "height": 219, "provider_metadata": {"public_id": "shoe-store/small_slide_3_2910a47031", "resource_type": "image"}}, "medium": {"ext": ".png", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683131352/shoe-store/medium_slide_3_2910a47031.png", "hash": "medium_slide_3_2910a47031", "mime": "image/png", "name": "medium_slide-3.png", "path": null, "size": 166.44, "width": 750, "height": 328, "provider_metadata": {"public_id": "shoe-store/medium_slide_3_2910a47031", "resource_type": "image"}}, "thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683131350/shoe-store/thumbnail_slide_3_2910a47031.png", "hash": "thumbnail_slide_3_2910a47031", "mime": "image/png", "name": "thumbnail_slide-3.png", "path": null, "size": 22.77, "width": 245, "height": 107, "provider_metadata": {"public_id": "shoe-store/thumbnail_slide_3_2910a47031", "resource_type": "image"}}}	slide_3_2910a47031	.png	image/png	97.35	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683131351/shoe-store/slide_3_2910a47031.png	\N	cloudinary	{"public_id": "shoe-store/slide_3_2910a47031", "resource_type": "image"}	/	2023-05-03 22:29:11.306	2023-05-03 22:29:11.306	1	1
15	air-jordan-1-mid-se-bottom.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/large_air_jordan_1_mid_se_bottom_39510152ae.webp", "hash": "large_air_jordan_1_mid_se_bottom_39510152ae", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-bottom.webp", "path": null, "size": 8.11, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_bottom_39510152ae", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/small_air_jordan_1_mid_se_bottom_39510152ae.webp", "hash": "small_air_jordan_1_mid_se_bottom_39510152ae", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-bottom.webp", "path": null, "size": 3.18, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_bottom_39510152ae", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/medium_air_jordan_1_mid_se_bottom_39510152ae.webp", "hash": "medium_air_jordan_1_mid_se_bottom_39510152ae", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-bottom.webp", "path": null, "size": 5.66, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_bottom_39510152ae", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/thumbnail_air_jordan_1_mid_se_bottom_39510152ae.webp", "hash": "thumbnail_air_jordan_1_mid_se_bottom_39510152ae", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-bottom.webp", "path": null, "size": 0.7, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_bottom_39510152ae", "resource_type": "image"}}}	air_jordan_1_mid_se_bottom_39510152ae	.webp	image/webp	10.34	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/air_jordan_1_mid_se_bottom_39510152ae.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_mid_se_bottom_39510152ae", "resource_type": "image"}	/	2023-05-03 22:59:48.114	2023-05-03 22:59:48.114	1	1
16	air-jordan-1-mid-se-right.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/large_air_jordan_1_mid_se_right_a3d6586e78.webp", "hash": "large_air_jordan_1_mid_se_right_a3d6586e78", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-right.webp", "path": null, "size": 21.95, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_right_a3d6586e78", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/small_air_jordan_1_mid_se_right_a3d6586e78.webp", "hash": "small_air_jordan_1_mid_se_right_a3d6586e78", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-right.webp", "path": null, "size": 7.59, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_right_a3d6586e78", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/medium_air_jordan_1_mid_se_right_a3d6586e78.webp", "hash": "medium_air_jordan_1_mid_se_right_a3d6586e78", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-right.webp", "path": null, "size": 14.34, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_right_a3d6586e78", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/thumbnail_air_jordan_1_mid_se_right_a3d6586e78.webp", "hash": "thumbnail_air_jordan_1_mid_se_right_a3d6586e78", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-right.webp", "path": null, "size": 1.37, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_right_a3d6586e78", "resource_type": "image"}}}	air_jordan_1_mid_se_right_a3d6586e78	.webp	image/webp	30.06	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/air_jordan_1_mid_se_right_a3d6586e78.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_mid_se_right_a3d6586e78", "resource_type": "image"}	/	2023-05-03 22:59:48.21	2023-05-03 22:59:48.21	1	1
17	air-jordan-1-mid-se-top.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/large_air_jordan_1_mid_se_top_e5dd9bb397.webp", "hash": "large_air_jordan_1_mid_se_top_e5dd9bb397", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-top.webp", "path": null, "size": 35.85, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_top_e5dd9bb397", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/small_air_jordan_1_mid_se_top_e5dd9bb397.webp", "hash": "small_air_jordan_1_mid_se_top_e5dd9bb397", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-top.webp", "path": null, "size": 13.53, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_top_e5dd9bb397", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/medium_air_jordan_1_mid_se_top_e5dd9bb397.webp", "hash": "medium_air_jordan_1_mid_se_top_e5dd9bb397", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-top.webp", "path": null, "size": 24.62, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_top_e5dd9bb397", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/thumbnail_air_jordan_1_mid_se_top_e5dd9bb397.webp", "hash": "thumbnail_air_jordan_1_mid_se_top_e5dd9bb397", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-top.webp", "path": null, "size": 2.52, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_top_e5dd9bb397", "resource_type": "image"}}}	air_jordan_1_mid_se_top_e5dd9bb397	.webp	image/webp	49.94	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/air_jordan_1_mid_se_top_e5dd9bb397.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_mid_se_top_e5dd9bb397", "resource_type": "image"}	/	2023-05-03 22:59:48.41	2023-05-03 22:59:48.41	1	1
18	air-jordan-1-mid-se-left.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/large_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "large_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-left.webp", "path": null, "size": 23.45, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/small_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "small_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-left.webp", "path": null, "size": 7.99, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/medium_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "medium_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-left.webp", "path": null, "size": 15.26, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/thumbnail_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "thumbnail_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-left.webp", "path": null, "size": 1.4, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}}	air_jordan_1_mid_se_left_3643a20769	.webp	image/webp	30.64	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/air_jordan_1_mid_se_left_3643a20769.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}	/	2023-05-03 22:59:48.491	2023-05-03 23:00:20.35	1	1
19	air-jordan-xxxvii-low-pf-top.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "large_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 32.99, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "small_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 12.08, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "medium_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 22.1, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 2.37, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}}	air_jordan_xxxvii_low_pf_top_43be7a6249	.webp	image/webp	46.80	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_top_43be7a6249.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}	/	2023-05-03 23:02:03.795	2023-05-03 23:02:03.795	1	1
20	air-jordan-xxxvii-low-pf-right.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 19.39, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 7.33, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 13.14, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 1.43, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}}	air_jordan_xxxvii_low_pf_right_cd4f8bf37c	.webp	image/webp	25.27	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}	/	2023-05-03 23:02:04.167	2023-05-03 23:02:04.167	1	1
21	air-jordan-xxxvii-low-pf-left.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 22.11, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 8.17, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 14.85, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 1.55, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}	air_jordan_xxxvii_low_pf_left_57dfa46bd3	.webp	image/webp	28.83	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}	/	2023-05-03 23:02:04.309	2023-05-03 23:02:04.309	1	1
22	air-jordan-xxxvii-low-pf-bottom.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 25.22, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 9.32, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 17.07, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 1.49, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}}	air_jordan_xxxvii_low_pf_bottom_ab2af3a63a	.webp	image/webp	32.07	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}	/	2023-05-03 23:02:04.65	2023-05-03 23:02:04.65	1	1
23	jordan-why-not-6-pf-right.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/large_jordan_why_not_6_pf_right_cbc33243ac.webp", "hash": "large_jordan_why_not_6_pf_right_cbc33243ac", "mime": "image/webp", "name": "large_jordan-why-not-6-pf-right.webp", "path": null, "size": 30.73, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_why_not_6_pf_right_cbc33243ac", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/small_jordan_why_not_6_pf_right_cbc33243ac.webp", "hash": "small_jordan_why_not_6_pf_right_cbc33243ac", "mime": "image/webp", "name": "small_jordan-why-not-6-pf-right.webp", "path": null, "size": 10.43, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_why_not_6_pf_right_cbc33243ac", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/medium_jordan_why_not_6_pf_right_cbc33243ac.webp", "hash": "medium_jordan_why_not_6_pf_right_cbc33243ac", "mime": "image/webp", "name": "medium_jordan-why-not-6-pf-right.webp", "path": null, "size": 19.85, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_why_not_6_pf_right_cbc33243ac", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133670/shoe-store/thumbnail_jordan_why_not_6_pf_right_cbc33243ac.webp", "hash": "thumbnail_jordan_why_not_6_pf_right_cbc33243ac", "mime": "image/webp", "name": "thumbnail_jordan-why-not-6-pf-right.webp", "path": null, "size": 1.59, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_why_not_6_pf_right_cbc33243ac", "resource_type": "image"}}}	jordan_why_not_6_pf_right_cbc33243ac	.webp	image/webp	44.49	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/jordan_why_not_6_pf_right_cbc33243ac.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_why_not_6_pf_right_cbc33243ac", "resource_type": "image"}	/	2023-05-03 23:07:51.423	2023-05-03 23:07:51.423	1	1
24	jordan-why-not-6-pf-bottom.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/large_jordan_why_not_6_pf_bottom_5950d881b0.webp", "hash": "large_jordan_why_not_6_pf_bottom_5950d881b0", "mime": "image/webp", "name": "large_jordan-why-not-6-pf-bottom.webp", "path": null, "size": 39.38, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_why_not_6_pf_bottom_5950d881b0", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/small_jordan_why_not_6_pf_bottom_5950d881b0.webp", "hash": "small_jordan_why_not_6_pf_bottom_5950d881b0", "mime": "image/webp", "name": "small_jordan-why-not-6-pf-bottom.webp", "path": null, "size": 13.69, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_why_not_6_pf_bottom_5950d881b0", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/medium_jordan_why_not_6_pf_bottom_5950d881b0.webp", "hash": "medium_jordan_why_not_6_pf_bottom_5950d881b0", "mime": "image/webp", "name": "medium_jordan-why-not-6-pf-bottom.webp", "path": null, "size": 26.31, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_why_not_6_pf_bottom_5950d881b0", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/thumbnail_jordan_why_not_6_pf_bottom_5950d881b0.webp", "hash": "thumbnail_jordan_why_not_6_pf_bottom_5950d881b0", "mime": "image/webp", "name": "thumbnail_jordan-why-not-6-pf-bottom.webp", "path": null, "size": 1.79, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_why_not_6_pf_bottom_5950d881b0", "resource_type": "image"}}}	jordan_why_not_6_pf_bottom_5950d881b0	.webp	image/webp	53.79	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/jordan_why_not_6_pf_bottom_5950d881b0.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_why_not_6_pf_bottom_5950d881b0", "resource_type": "image"}	/	2023-05-03 23:07:51.612	2023-05-03 23:07:51.612	1	1
25	jordan-why-not-6-pf-top.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/large_jordan_why_not_6_pf_top_f231ac45b2.webp", "hash": "large_jordan_why_not_6_pf_top_f231ac45b2", "mime": "image/webp", "name": "large_jordan-why-not-6-pf-top.webp", "path": null, "size": 57.08, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_why_not_6_pf_top_f231ac45b2", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/small_jordan_why_not_6_pf_top_f231ac45b2.webp", "hash": "small_jordan_why_not_6_pf_top_f231ac45b2", "mime": "image/webp", "name": "small_jordan-why-not-6-pf-top.webp", "path": null, "size": 20.56, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_why_not_6_pf_top_f231ac45b2", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/medium_jordan_why_not_6_pf_top_f231ac45b2.webp", "hash": "medium_jordan_why_not_6_pf_top_f231ac45b2", "mime": "image/webp", "name": "medium_jordan-why-not-6-pf-top.webp", "path": null, "size": 38.1, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_why_not_6_pf_top_f231ac45b2", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/thumbnail_jordan_why_not_6_pf_top_f231ac45b2.webp", "hash": "thumbnail_jordan_why_not_6_pf_top_f231ac45b2", "mime": "image/webp", "name": "thumbnail_jordan-why-not-6-pf-top.webp", "path": null, "size": 3.19, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_why_not_6_pf_top_f231ac45b2", "resource_type": "image"}}}	jordan_why_not_6_pf_top_f231ac45b2	.webp	image/webp	82.46	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/jordan_why_not_6_pf_top_f231ac45b2.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_why_not_6_pf_top_f231ac45b2", "resource_type": "image"}	/	2023-05-03 23:07:51.78	2023-05-03 23:07:51.78	1	1
26	jordan-why-not-6-pf-left.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/large_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "large_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "large_jordan-why-not-6-pf-left.webp", "path": null, "size": 28.07, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/small_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "small_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "small_jordan-why-not-6-pf-left.webp", "path": null, "size": 9.99, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133673/shoe-store/medium_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "medium_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "medium_jordan-why-not-6-pf-left.webp", "path": null, "size": 18.26, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133670/shoe-store/thumbnail_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "thumbnail_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "thumbnail_jordan-why-not-6-pf-left.webp", "path": null, "size": 1.71, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}}	jordan_why_not_6_pf_left_69e6e0db81	.webp	image/webp	39.96	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/jordan_why_not_6_pf_left_69e6e0db81.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}	/	2023-05-03 23:07:52.677	2023-05-03 23:07:52.677	1	1
27	jordan-stay-loyal-2-right.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/large_jordan_stay_loyal_2_right_aeeaea3a04.webp", "hash": "large_jordan_stay_loyal_2_right_aeeaea3a04", "mime": "image/webp", "name": "large_jordan-stay-loyal-2-right.webp", "path": null, "size": 24.27, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_stay_loyal_2_right_aeeaea3a04", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/small_jordan_stay_loyal_2_right_aeeaea3a04.webp", "hash": "small_jordan_stay_loyal_2_right_aeeaea3a04", "mime": "image/webp", "name": "small_jordan-stay-loyal-2-right.webp", "path": null, "size": 8.08, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_stay_loyal_2_right_aeeaea3a04", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/medium_jordan_stay_loyal_2_right_aeeaea3a04.webp", "hash": "medium_jordan_stay_loyal_2_right_aeeaea3a04", "mime": "image/webp", "name": "medium_jordan-stay-loyal-2-right.webp", "path": null, "size": 15.83, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_stay_loyal_2_right_aeeaea3a04", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/thumbnail_jordan_stay_loyal_2_right_aeeaea3a04.webp", "hash": "thumbnail_jordan_stay_loyal_2_right_aeeaea3a04", "mime": "image/webp", "name": "thumbnail_jordan-stay-loyal-2-right.webp", "path": null, "size": 1.4, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_stay_loyal_2_right_aeeaea3a04", "resource_type": "image"}}}	jordan_stay_loyal_2_right_aeeaea3a04	.webp	image/webp	34.23	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/jordan_stay_loyal_2_right_aeeaea3a04.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_stay_loyal_2_right_aeeaea3a04", "resource_type": "image"}	/	2023-05-03 23:12:06.111	2023-05-03 23:12:06.111	1	1
28	jordan-stay-loyal-2-front.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/large_jordan_stay_loyal_2_front_acfcb56382.webp", "hash": "large_jordan_stay_loyal_2_front_acfcb56382", "mime": "image/webp", "name": "large_jordan-stay-loyal-2-front.webp", "path": null, "size": 23.74, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_stay_loyal_2_front_acfcb56382", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/small_jordan_stay_loyal_2_front_acfcb56382.webp", "hash": "small_jordan_stay_loyal_2_front_acfcb56382", "mime": "image/webp", "name": "small_jordan-stay-loyal-2-front.webp", "path": null, "size": 8.5, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_stay_loyal_2_front_acfcb56382", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/medium_jordan_stay_loyal_2_front_acfcb56382.webp", "hash": "medium_jordan_stay_loyal_2_front_acfcb56382", "mime": "image/webp", "name": "medium_jordan-stay-loyal-2-front.webp", "path": null, "size": 15.8, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_stay_loyal_2_front_acfcb56382", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/thumbnail_jordan_stay_loyal_2_front_acfcb56382.webp", "hash": "thumbnail_jordan_stay_loyal_2_front_acfcb56382", "mime": "image/webp", "name": "thumbnail_jordan-stay-loyal-2-front.webp", "path": null, "size": 1.58, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_stay_loyal_2_front_acfcb56382", "resource_type": "image"}}}	jordan_stay_loyal_2_front_acfcb56382	.webp	image/webp	33.54	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/jordan_stay_loyal_2_front_acfcb56382.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_stay_loyal_2_front_acfcb56382", "resource_type": "image"}	/	2023-05-03 23:12:06.151	2023-05-03 23:12:06.151	1	1
29	jordan-stay-loyal-2-angle.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/large_jordan_stay_loyal_2_angle_993b6a0fcf.webp", "hash": "large_jordan_stay_loyal_2_angle_993b6a0fcf", "mime": "image/webp", "name": "large_jordan-stay-loyal-2-angle.webp", "path": null, "size": 29.95, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_stay_loyal_2_angle_993b6a0fcf", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/small_jordan_stay_loyal_2_angle_993b6a0fcf.webp", "hash": "small_jordan_stay_loyal_2_angle_993b6a0fcf", "mime": "image/webp", "name": "small_jordan-stay-loyal-2-angle.webp", "path": null, "size": 10.11, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_stay_loyal_2_angle_993b6a0fcf", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/medium_jordan_stay_loyal_2_angle_993b6a0fcf.webp", "hash": "medium_jordan_stay_loyal_2_angle_993b6a0fcf", "mime": "image/webp", "name": "medium_jordan-stay-loyal-2-angle.webp", "path": null, "size": 19.69, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_stay_loyal_2_angle_993b6a0fcf", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/thumbnail_jordan_stay_loyal_2_angle_993b6a0fcf.webp", "hash": "thumbnail_jordan_stay_loyal_2_angle_993b6a0fcf", "mime": "image/webp", "name": "thumbnail_jordan-stay-loyal-2-angle.webp", "path": null, "size": 1.71, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_stay_loyal_2_angle_993b6a0fcf", "resource_type": "image"}}}	jordan_stay_loyal_2_angle_993b6a0fcf	.webp	image/webp	42.85	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133927/shoe-store/jordan_stay_loyal_2_angle_993b6a0fcf.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_stay_loyal_2_angle_993b6a0fcf", "resource_type": "image"}	/	2023-05-03 23:12:06.583	2023-05-03 23:12:06.583	1	1
30	jordan-stay-loyal-2-left.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/large_jordan_stay_loyal_2_left_aae8b0f01d.webp", "hash": "large_jordan_stay_loyal_2_left_aae8b0f01d", "mime": "image/webp", "name": "large_jordan-stay-loyal-2-left.webp", "path": null, "size": 24.83, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_stay_loyal_2_left_aae8b0f01d", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/small_jordan_stay_loyal_2_left_aae8b0f01d.webp", "hash": "small_jordan_stay_loyal_2_left_aae8b0f01d", "mime": "image/webp", "name": "small_jordan-stay-loyal-2-left.webp", "path": null, "size": 8.41, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_stay_loyal_2_left_aae8b0f01d", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133927/shoe-store/medium_jordan_stay_loyal_2_left_aae8b0f01d.webp", "hash": "medium_jordan_stay_loyal_2_left_aae8b0f01d", "mime": "image/webp", "name": "medium_jordan-stay-loyal-2-left.webp", "path": null, "size": 16.34, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_stay_loyal_2_left_aae8b0f01d", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/thumbnail_jordan_stay_loyal_2_left_aae8b0f01d.webp", "hash": "thumbnail_jordan_stay_loyal_2_left_aae8b0f01d", "mime": "image/webp", "name": "thumbnail_jordan-stay-loyal-2-left.webp", "path": null, "size": 1.41, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_stay_loyal_2_left_aae8b0f01d", "resource_type": "image"}}}	jordan_stay_loyal_2_left_aae8b0f01d	.webp	image/webp	33.53	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/jordan_stay_loyal_2_left_aae8b0f01d.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_stay_loyal_2_left_aae8b0f01d", "resource_type": "image"}	/	2023-05-03 23:12:06.602	2023-05-03 23:12:06.602	1	1
31	jordan-stay-loyal-2-top.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133927/shoe-store/large_jordan_stay_loyal_2_top_bddb55fda5.webp", "hash": "large_jordan_stay_loyal_2_top_bddb55fda5", "mime": "image/webp", "name": "large_jordan-stay-loyal-2-top.webp", "path": null, "size": 43.39, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_stay_loyal_2_top_bddb55fda5", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133927/shoe-store/small_jordan_stay_loyal_2_top_bddb55fda5.webp", "hash": "small_jordan_stay_loyal_2_top_bddb55fda5", "mime": "image/webp", "name": "small_jordan-stay-loyal-2-top.webp", "path": null, "size": 13.45, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_stay_loyal_2_top_bddb55fda5", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133927/shoe-store/medium_jordan_stay_loyal_2_top_bddb55fda5.webp", "hash": "medium_jordan_stay_loyal_2_top_bddb55fda5", "mime": "image/webp", "name": "medium_jordan-stay-loyal-2-top.webp", "path": null, "size": 26.89, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_stay_loyal_2_top_bddb55fda5", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133927/shoe-store/thumbnail_jordan_stay_loyal_2_top_bddb55fda5.webp", "hash": "thumbnail_jordan_stay_loyal_2_top_bddb55fda5", "mime": "image/webp", "name": "thumbnail_jordan-stay-loyal-2-top.webp", "path": null, "size": 2.31, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_stay_loyal_2_top_bddb55fda5", "resource_type": "image"}}}	jordan_stay_loyal_2_top_bddb55fda5	.webp	image/webp	63.32	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133927/shoe-store/jordan_stay_loyal_2_top_bddb55fda5.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_stay_loyal_2_top_bddb55fda5", "resource_type": "image"}	/	2023-05-03 23:12:07.02	2023-05-03 23:12:07.02	1	1
32	jordan-stay-loyal-2-bottom.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133927/shoe-store/large_jordan_stay_loyal_2_bottom_42d6b26e3c.webp", "hash": "large_jordan_stay_loyal_2_bottom_42d6b26e3c", "mime": "image/webp", "name": "large_jordan-stay-loyal-2-bottom.webp", "path": null, "size": 24.81, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_stay_loyal_2_bottom_42d6b26e3c", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/small_jordan_stay_loyal_2_bottom_42d6b26e3c.webp", "hash": "small_jordan_stay_loyal_2_bottom_42d6b26e3c", "mime": "image/webp", "name": "small_jordan-stay-loyal-2-bottom.webp", "path": null, "size": 9.34, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_stay_loyal_2_bottom_42d6b26e3c", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/medium_jordan_stay_loyal_2_bottom_42d6b26e3c.webp", "hash": "medium_jordan_stay_loyal_2_bottom_42d6b26e3c", "mime": "image/webp", "name": "medium_jordan-stay-loyal-2-bottom.webp", "path": null, "size": 17.48, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_stay_loyal_2_bottom_42d6b26e3c", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133928/shoe-store/thumbnail_jordan_stay_loyal_2_bottom_42d6b26e3c.webp", "hash": "thumbnail_jordan_stay_loyal_2_bottom_42d6b26e3c", "mime": "image/webp", "name": "thumbnail_jordan-stay-loyal-2-bottom.webp", "path": null, "size": 0.89, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_stay_loyal_2_bottom_42d6b26e3c", "resource_type": "image"}}}	jordan_stay_loyal_2_bottom_42d6b26e3c	.webp	image/webp	33.96	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133926/shoe-store/jordan_stay_loyal_2_bottom_42d6b26e3c.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_stay_loyal_2_bottom_42d6b26e3c", "resource_type": "image"}	/	2023-05-03 23:12:07.03	2023-05-03 23:12:07.03	1	1
33	jordan-delta-3-low-left.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/large_jordan_delta_3_low_left_0c60e569b7.webp", "hash": "large_jordan_delta_3_low_left_0c60e569b7", "mime": "image/webp", "name": "large_jordan-delta-3-low-left.webp", "path": null, "size": 21.59, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_delta_3_low_left_0c60e569b7", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/small_jordan_delta_3_low_left_0c60e569b7.webp", "hash": "small_jordan_delta_3_low_left_0c60e569b7", "mime": "image/webp", "name": "small_jordan-delta-3-low-left.webp", "path": null, "size": 6.66, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_delta_3_low_left_0c60e569b7", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/medium_jordan_delta_3_low_left_0c60e569b7.webp", "hash": "medium_jordan_delta_3_low_left_0c60e569b7", "mime": "image/webp", "name": "medium_jordan-delta-3-low-left.webp", "path": null, "size": 13.56, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_delta_3_low_left_0c60e569b7", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/thumbnail_jordan_delta_3_low_left_0c60e569b7.webp", "hash": "thumbnail_jordan_delta_3_low_left_0c60e569b7", "mime": "image/webp", "name": "thumbnail_jordan-delta-3-low-left.webp", "path": null, "size": 0.95, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_delta_3_low_left_0c60e569b7", "resource_type": "image"}}}	jordan_delta_3_low_left_0c60e569b7	.webp	image/webp	30.06	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/jordan_delta_3_low_left_0c60e569b7.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_delta_3_low_left_0c60e569b7", "resource_type": "image"}	/	2023-05-03 23:13:38.093	2023-05-03 23:13:38.093	1	1
34	jordan-delta-3-low-top.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134019/shoe-store/large_jordan_delta_3_low_top_c5aacaadad.webp", "hash": "large_jordan_delta_3_low_top_c5aacaadad", "mime": "image/webp", "name": "large_jordan-delta-3-low-top.webp", "path": null, "size": 48.81, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_delta_3_low_top_c5aacaadad", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/small_jordan_delta_3_low_top_c5aacaadad.webp", "hash": "small_jordan_delta_3_low_top_c5aacaadad", "mime": "image/webp", "name": "small_jordan-delta-3-low-top.webp", "path": null, "size": 14.75, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_delta_3_low_top_c5aacaadad", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/medium_jordan_delta_3_low_top_c5aacaadad.webp", "hash": "medium_jordan_delta_3_low_top_c5aacaadad", "mime": "image/webp", "name": "medium_jordan-delta-3-low-top.webp", "path": null, "size": 30.59, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_delta_3_low_top_c5aacaadad", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/thumbnail_jordan_delta_3_low_top_c5aacaadad.webp", "hash": "thumbnail_jordan_delta_3_low_top_c5aacaadad", "mime": "image/webp", "name": "thumbnail_jordan-delta-3-low-top.webp", "path": null, "size": 2.05, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_delta_3_low_top_c5aacaadad", "resource_type": "image"}}}	jordan_delta_3_low_top_c5aacaadad	.webp	image/webp	70.97	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134019/shoe-store/jordan_delta_3_low_top_c5aacaadad.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_delta_3_low_top_c5aacaadad", "resource_type": "image"}	/	2023-05-03 23:13:38.193	2023-05-03 23:13:38.193	1	1
35	jordan-delta-3-low-bottom.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/large_jordan_delta_3_low_bottom_376a46b404.webp", "hash": "large_jordan_delta_3_low_bottom_376a46b404", "mime": "image/webp", "name": "large_jordan-delta-3-low-bottom.webp", "path": null, "size": 14.81, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_delta_3_low_bottom_376a46b404", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/small_jordan_delta_3_low_bottom_376a46b404.webp", "hash": "small_jordan_delta_3_low_bottom_376a46b404", "mime": "image/webp", "name": "small_jordan-delta-3-low-bottom.webp", "path": null, "size": 5.71, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_delta_3_low_bottom_376a46b404", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/medium_jordan_delta_3_low_bottom_376a46b404.webp", "hash": "medium_jordan_delta_3_low_bottom_376a46b404", "mime": "image/webp", "name": "medium_jordan-delta-3-low-bottom.webp", "path": null, "size": 9.92, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_delta_3_low_bottom_376a46b404", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/thumbnail_jordan_delta_3_low_bottom_376a46b404.webp", "hash": "thumbnail_jordan_delta_3_low_bottom_376a46b404", "mime": "image/webp", "name": "thumbnail_jordan-delta-3-low-bottom.webp", "path": null, "size": 1.03, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_delta_3_low_bottom_376a46b404", "resource_type": "image"}}}	jordan_delta_3_low_bottom_376a46b404	.webp	image/webp	20.03	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134019/shoe-store/jordan_delta_3_low_bottom_376a46b404.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_delta_3_low_bottom_376a46b404", "resource_type": "image"}	/	2023-05-03 23:13:38.551	2023-05-03 23:13:38.551	1	1
36	jordan-delta-3-low-right.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/large_jordan_delta_3_low_right_7e99270778.webp", "hash": "large_jordan_delta_3_low_right_7e99270778", "mime": "image/webp", "name": "large_jordan-delta-3-low-right.webp", "path": null, "size": 23.57, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_delta_3_low_right_7e99270778", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/small_jordan_delta_3_low_right_7e99270778.webp", "hash": "small_jordan_delta_3_low_right_7e99270778", "mime": "image/webp", "name": "small_jordan-delta-3-low-right.webp", "path": null, "size": 7.21, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_delta_3_low_right_7e99270778", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/medium_jordan_delta_3_low_right_7e99270778.webp", "hash": "medium_jordan_delta_3_low_right_7e99270778", "mime": "image/webp", "name": "medium_jordan-delta-3-low-right.webp", "path": null, "size": 14.8, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_delta_3_low_right_7e99270778", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134018/shoe-store/thumbnail_jordan_delta_3_low_right_7e99270778.webp", "hash": "thumbnail_jordan_delta_3_low_right_7e99270778", "mime": "image/webp", "name": "thumbnail_jordan-delta-3-low-right.webp", "path": null, "size": 0.98, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_delta_3_low_right_7e99270778", "resource_type": "image"}}}	jordan_delta_3_low_right_7e99270778	.webp	image/webp	34.23	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134019/shoe-store/jordan_delta_3_low_right_7e99270778.webp	\N	cloudinary	{"public_id": "shoe-store/jordan_delta_3_low_right_7e99270778", "resource_type": "image"}	/	2023-05-03 23:13:38.562	2023-05-03 23:13:38.562	1	1
37	air-jordan-13-retro-bottom.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134154/shoe-store/large_air_jordan_13_retro_bottom_af50685ccb.webp", "hash": "large_air_jordan_13_retro_bottom_af50685ccb", "mime": "image/webp", "name": "large_air-jordan-13-retro-bottom.webp", "path": null, "size": 31.83, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_13_retro_bottom_af50685ccb", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134152/shoe-store/small_air_jordan_13_retro_bottom_af50685ccb.webp", "hash": "small_air_jordan_13_retro_bottom_af50685ccb", "mime": "image/webp", "name": "small_air-jordan-13-retro-bottom.webp", "path": null, "size": 11.27, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_13_retro_bottom_af50685ccb", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134152/shoe-store/medium_air_jordan_13_retro_bottom_af50685ccb.webp", "hash": "medium_air_jordan_13_retro_bottom_af50685ccb", "mime": "image/webp", "name": "medium_air-jordan-13-retro-bottom.webp", "path": null, "size": 21.13, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_13_retro_bottom_af50685ccb", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/thumbnail_air_jordan_13_retro_bottom_af50685ccb.webp", "hash": "thumbnail_air_jordan_13_retro_bottom_af50685ccb", "mime": "image/webp", "name": "thumbnail_air-jordan-13-retro-bottom.webp", "path": null, "size": 1.73, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_13_retro_bottom_af50685ccb", "resource_type": "image"}}}	air_jordan_13_retro_bottom_af50685ccb	.webp	image/webp	43.18	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134156/shoe-store/air_jordan_13_retro_bottom_af50685ccb.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_13_retro_bottom_af50685ccb", "resource_type": "image"}	/	2023-05-03 23:15:56.604	2023-05-03 23:15:56.604	1	1
38	air-jordan-13-retro-model1.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/large_air_jordan_13_retro_model1_2790369d9f.webp", "hash": "large_air_jordan_13_retro_model1_2790369d9f", "mime": "image/webp", "name": "large_air-jordan-13-retro-model1.webp", "path": null, "size": 21.6, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_13_retro_model1_2790369d9f", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/small_air_jordan_13_retro_model1_2790369d9f.webp", "hash": "small_air_jordan_13_retro_model1_2790369d9f", "mime": "image/webp", "name": "small_air-jordan-13-retro-model1.webp", "path": null, "size": 8.7, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_13_retro_model1_2790369d9f", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134159/shoe-store/medium_air_jordan_13_retro_model1_2790369d9f.webp", "hash": "medium_air_jordan_13_retro_model1_2790369d9f", "mime": "image/webp", "name": "medium_air-jordan-13-retro-model1.webp", "path": null, "size": 15.25, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_13_retro_model1_2790369d9f", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134153/shoe-store/thumbnail_air_jordan_13_retro_model1_2790369d9f.webp", "hash": "thumbnail_air_jordan_13_retro_model1_2790369d9f", "mime": "image/webp", "name": "thumbnail_air-jordan-13-retro-model1.webp", "path": null, "size": 1.94, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_13_retro_model1_2790369d9f", "resource_type": "image"}}}	air_jordan_13_retro_model1_2790369d9f	.webp	image/webp	26.95	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134158/shoe-store/air_jordan_13_retro_model1_2790369d9f.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_13_retro_model1_2790369d9f", "resource_type": "image"}	/	2023-05-03 23:15:58.162	2023-05-03 23:15:58.162	1	1
39	air-jordan-13-retro-right.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134153/shoe-store/large_air_jordan_13_retro_right_9512f7fb31.webp", "hash": "large_air_jordan_13_retro_right_9512f7fb31", "mime": "image/webp", "name": "large_air-jordan-13-retro-right.webp", "path": null, "size": 26.98, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_13_retro_right_9512f7fb31", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134166/shoe-store/small_air_jordan_13_retro_right_9512f7fb31.webp", "hash": "small_air_jordan_13_retro_right_9512f7fb31", "mime": "image/webp", "name": "small_air-jordan-13-retro-right.webp", "path": null, "size": 7.86, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_13_retro_right_9512f7fb31", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134159/shoe-store/medium_air_jordan_13_retro_right_9512f7fb31.webp", "hash": "medium_air_jordan_13_retro_right_9512f7fb31", "mime": "image/webp", "name": "medium_air-jordan-13-retro-right.webp", "path": null, "size": 16.62, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_13_retro_right_9512f7fb31", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/thumbnail_air_jordan_13_retro_right_9512f7fb31.webp", "hash": "thumbnail_air_jordan_13_retro_right_9512f7fb31", "mime": "image/webp", "name": "thumbnail_air-jordan-13-retro-right.webp", "path": null, "size": 1.26, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_13_retro_right_9512f7fb31", "resource_type": "image"}}}	air_jordan_13_retro_right_9512f7fb31	.webp	image/webp	38.58	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134156/shoe-store/air_jordan_13_retro_right_9512f7fb31.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_13_retro_right_9512f7fb31", "resource_type": "image"}	/	2023-05-03 23:16:05.196	2023-05-03 23:16:05.196	1	1
40	air-jordan-13-retro-left.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134156/shoe-store/large_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "large_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "large_air-jordan-13-retro-left.webp", "path": null, "size": 27.03, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134166/shoe-store/small_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "small_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "small_air-jordan-13-retro-left.webp", "path": null, "size": 8.38, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/medium_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "medium_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "medium_air-jordan-13-retro-left.webp", "path": null, "size": 16.89, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134159/shoe-store/thumbnail_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "thumbnail_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "thumbnail_air-jordan-13-retro-left.webp", "path": null, "size": 1.46, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}}	air_jordan_13_retro_left_c244eba9cc	.webp	image/webp	37.12	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134154/shoe-store/air_jordan_13_retro_left_c244eba9cc.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}	/	2023-05-03 23:16:05.767	2023-05-03 23:16:05.767	1	1
41	air-jordan-6-retro-right.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/large_air_jordan_6_retro_right_6d99f4b1fa.webp", "hash": "large_air_jordan_6_retro_right_6d99f4b1fa", "mime": "image/webp", "name": "large_air-jordan-6-retro-right.webp", "path": null, "size": 19.54, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_6_retro_right_6d99f4b1fa", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/small_air_jordan_6_retro_right_6d99f4b1fa.webp", "hash": "small_air_jordan_6_retro_right_6d99f4b1fa", "mime": "image/webp", "name": "small_air-jordan-6-retro-right.webp", "path": null, "size": 7.6, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_6_retro_right_6d99f4b1fa", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/medium_air_jordan_6_retro_right_6d99f4b1fa.webp", "hash": "medium_air_jordan_6_retro_right_6d99f4b1fa", "mime": "image/webp", "name": "medium_air-jordan-6-retro-right.webp", "path": null, "size": 13.54, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_6_retro_right_6d99f4b1fa", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/thumbnail_air_jordan_6_retro_right_6d99f4b1fa.webp", "hash": "thumbnail_air_jordan_6_retro_right_6d99f4b1fa", "mime": "image/webp", "name": "thumbnail_air-jordan-6-retro-right.webp", "path": null, "size": 1.49, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_6_retro_right_6d99f4b1fa", "resource_type": "image"}}}	air_jordan_6_retro_right_6d99f4b1fa	.webp	image/webp	25.31	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/air_jordan_6_retro_right_6d99f4b1fa.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_6_retro_right_6d99f4b1fa", "resource_type": "image"}	/	2023-05-03 23:21:46.575	2023-05-03 23:21:46.575	1	1
42	air-jordan-6-retro-model1.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/large_air_jordan_6_retro_model1_7d8a9be593.webp", "hash": "large_air_jordan_6_retro_model1_7d8a9be593", "mime": "image/webp", "name": "large_air-jordan-6-retro-model1.webp", "path": null, "size": 34.87, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_6_retro_model1_7d8a9be593", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/small_air_jordan_6_retro_model1_7d8a9be593.webp", "hash": "small_air_jordan_6_retro_model1_7d8a9be593", "mime": "image/webp", "name": "small_air-jordan-6-retro-model1.webp", "path": null, "size": 14.65, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_6_retro_model1_7d8a9be593", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/medium_air_jordan_6_retro_model1_7d8a9be593.webp", "hash": "medium_air_jordan_6_retro_model1_7d8a9be593", "mime": "image/webp", "name": "medium_air-jordan-6-retro-model1.webp", "path": null, "size": 25.32, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_6_retro_model1_7d8a9be593", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/thumbnail_air_jordan_6_retro_model1_7d8a9be593.webp", "hash": "thumbnail_air_jordan_6_retro_model1_7d8a9be593", "mime": "image/webp", "name": "thumbnail_air-jordan-6-retro-model1.webp", "path": null, "size": 3.09, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_6_retro_model1_7d8a9be593", "resource_type": "image"}}}	air_jordan_6_retro_model1_7d8a9be593	.webp	image/webp	44.76	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/air_jordan_6_retro_model1_7d8a9be593.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_6_retro_model1_7d8a9be593", "resource_type": "image"}	/	2023-05-03 23:21:48.039	2023-05-03 23:21:48.039	1	1
43	air-jordan-6-retro-left.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/large_air_jordan_6_retro_left_0c040e85e0.webp", "hash": "large_air_jordan_6_retro_left_0c040e85e0", "mime": "image/webp", "name": "large_air-jordan-6-retro-left.webp", "path": null, "size": 23.46, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_6_retro_left_0c040e85e0", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/small_air_jordan_6_retro_left_0c040e85e0.webp", "hash": "small_air_jordan_6_retro_left_0c040e85e0", "mime": "image/webp", "name": "small_air-jordan-6-retro-left.webp", "path": null, "size": 8.6, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_6_retro_left_0c040e85e0", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/medium_air_jordan_6_retro_left_0c040e85e0.webp", "hash": "medium_air_jordan_6_retro_left_0c040e85e0", "mime": "image/webp", "name": "medium_air-jordan-6-retro-left.webp", "path": null, "size": 15.64, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_6_retro_left_0c040e85e0", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/thumbnail_air_jordan_6_retro_left_0c040e85e0.webp", "hash": "thumbnail_air_jordan_6_retro_left_0c040e85e0", "mime": "image/webp", "name": "thumbnail_air-jordan-6-retro-left.webp", "path": null, "size": 1.54, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_6_retro_left_0c040e85e0", "resource_type": "image"}}}	air_jordan_6_retro_left_0c040e85e0	.webp	image/webp	30.67	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/air_jordan_6_retro_left_0c040e85e0.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_6_retro_left_0c040e85e0", "resource_type": "image"}	/	2023-05-03 23:21:48.167	2023-05-03 23:21:48.167	1	1
44	air-jordan-6-retro-bottom.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/large_air_jordan_6_retro_bottom_174a33f657.webp", "hash": "large_air_jordan_6_retro_bottom_174a33f657", "mime": "image/webp", "name": "large_air-jordan-6-retro-bottom.webp", "path": null, "size": 11.21, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_6_retro_bottom_174a33f657", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/small_air_jordan_6_retro_bottom_174a33f657.webp", "hash": "small_air_jordan_6_retro_bottom_174a33f657", "mime": "image/webp", "name": "small_air-jordan-6-retro-bottom.webp", "path": null, "size": 4.72, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_6_retro_bottom_174a33f657", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/medium_air_jordan_6_retro_bottom_174a33f657.webp", "hash": "medium_air_jordan_6_retro_bottom_174a33f657", "mime": "image/webp", "name": "medium_air-jordan-6-retro-bottom.webp", "path": null, "size": 7.88, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_6_retro_bottom_174a33f657", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/thumbnail_air_jordan_6_retro_bottom_174a33f657.webp", "hash": "thumbnail_air_jordan_6_retro_bottom_174a33f657", "mime": "image/webp", "name": "thumbnail_air-jordan-6-retro-bottom.webp", "path": null, "size": 1.02, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_6_retro_bottom_174a33f657", "resource_type": "image"}}}	air_jordan_6_retro_bottom_174a33f657	.webp	image/webp	13.96	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134507/shoe-store/air_jordan_6_retro_bottom_174a33f657.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_6_retro_bottom_174a33f657", "resource_type": "image"}	/	2023-05-03 23:21:48.236	2023-05-03 23:21:48.236	1	1
45	air-jordan-1-retro-high-og-bottom.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/large_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "large_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 26, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "small_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 8.21, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "medium_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 16.11, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/thumbnail_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 1.23, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}}	air_jordan_1_retro_high_og_bottom_c556118bd5	.webp	image/webp	37.15	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/air_jordan_1_retro_high_og_bottom_c556118bd5.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}	/	2023-05-03 23:26:15.806	2023-05-03 23:26:15.806	1	1
46	air-jordan-1-retro-high-og-right.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/large_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "large_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 24.71, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "small_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 8.14, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "medium_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 15.59, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/thumbnail_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 1.49, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}}	air_jordan_1_retro_high_og_right_cede4b9178	.webp	image/webp	31.78	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/air_jordan_1_retro_high_og_right_cede4b9178.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}	/	2023-05-03 23:26:16.517	2023-05-03 23:26:16.517	1	1
47	air-jordan-1-retro-high-og-top.jpeg	\N	\N	864	1080	{"large": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134778/shoe-store/large_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "large_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "large_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 78.94, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}, "small": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/small_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "small_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "small_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 26.36, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}, "medium": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/medium_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "medium_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "medium_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 50.27, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}, "thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/thumbnail_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "thumbnail_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "thumbnail_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 4.22, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}}	air_jordan_1_retro_high_og_top_77c1961ca7	.jpeg	image/jpeg	57.99	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/air_jordan_1_retro_high_og_top_77c1961ca7.jpg	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}	/	2023-05-03 23:26:17.174	2023-05-03 23:26:17.174	1	1
48	air-jordan-1-retro-high-og-left.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134778/shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "large_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 24.1, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "small_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 8.39, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "medium_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 15.82, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 1.64, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}	air_jordan_1_retro_high_og_left_509a9f34a1	.webp	image/webp	33.16	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}	/	2023-05-03 23:26:17.288	2023-05-03 23:26:17.288	1	1
49	air-jordan-1-mid-se-craft-bottom.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/large_air_jordan_1_mid_se_craft_bottom_c60efa86c2.webp", "hash": "large_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-craft-bottom.webp", "path": null, "size": 28.52, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/small_air_jordan_1_mid_se_craft_bottom_c60efa86c2.webp", "hash": "small_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-craft-bottom.webp", "path": null, "size": 8.68, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/medium_air_jordan_1_mid_se_craft_bottom_c60efa86c2.webp", "hash": "medium_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-craft-bottom.webp", "path": null, "size": 17.67, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/thumbnail_air_jordan_1_mid_se_craft_bottom_c60efa86c2.webp", "hash": "thumbnail_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-craft-bottom.webp", "path": null, "size": 1.19, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "resource_type": "image"}}}	air_jordan_1_mid_se_craft_bottom_c60efa86c2	.webp	image/webp	41.50	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/air_jordan_1_mid_se_craft_bottom_c60efa86c2.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_mid_se_craft_bottom_c60efa86c2", "resource_type": "image"}	/	2023-05-03 23:27:36.497	2023-05-03 23:27:36.497	1	1
50	air-jordan-1-mid-se-craft-top.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/large_air_jordan_1_mid_se_craft_top_533060cff9.webp", "hash": "large_air_jordan_1_mid_se_craft_top_533060cff9", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-craft-top.webp", "path": null, "size": 36.05, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_craft_top_533060cff9", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/small_air_jordan_1_mid_se_craft_top_533060cff9.webp", "hash": "small_air_jordan_1_mid_se_craft_top_533060cff9", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-craft-top.webp", "path": null, "size": 12.13, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_craft_top_533060cff9", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/medium_air_jordan_1_mid_se_craft_top_533060cff9.webp", "hash": "medium_air_jordan_1_mid_se_craft_top_533060cff9", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-craft-top.webp", "path": null, "size": 23.55, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_craft_top_533060cff9", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/thumbnail_air_jordan_1_mid_se_craft_top_533060cff9.webp", "hash": "thumbnail_air_jordan_1_mid_se_craft_top_533060cff9", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-craft-top.webp", "path": null, "size": 2.13, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_craft_top_533060cff9", "resource_type": "image"}}}	air_jordan_1_mid_se_craft_top_533060cff9	.webp	image/webp	52.39	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/air_jordan_1_mid_se_craft_top_533060cff9.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_mid_se_craft_top_533060cff9", "resource_type": "image"}	/	2023-05-03 23:27:36.603	2023-05-03 23:27:36.603	1	1
51	air-jordan-1-mid-se-craft-left.jpeg	\N	\N	864	1080	{"large": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/large_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "large_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "large_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 58.84, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}, "small": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/small_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "small_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "small_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 15.51, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}, "medium": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/medium_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "medium_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "medium_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 34.21, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}, "thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/thumbnail_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "thumbnail_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "thumbnail_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 2.33, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}}	air_jordan_1_mid_se_craft_left_a82f51ac77	.jpeg	image/jpeg	43.20	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/air_jordan_1_mid_se_craft_left_a82f51ac77.jpg	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}	/	2023-05-03 23:27:36.971	2023-05-03 23:27:36.971	1	1
52	air-jordan-1-mid-se-craft-right.webp	\N	\N	864	1080	{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134858/shoe-store/large_air_jordan_1_mid_se_craft_right_36bdaf055f.webp", "hash": "large_air_jordan_1_mid_se_craft_right_36bdaf055f", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-craft-right.webp", "path": null, "size": 39.28, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_craft_right_36bdaf055f", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/small_air_jordan_1_mid_se_craft_right_36bdaf055f.webp", "hash": "small_air_jordan_1_mid_se_craft_right_36bdaf055f", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-craft-right.webp", "path": null, "size": 9.89, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_craft_right_36bdaf055f", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/medium_air_jordan_1_mid_se_craft_right_36bdaf055f.webp", "hash": "medium_air_jordan_1_mid_se_craft_right_36bdaf055f", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-craft-right.webp", "path": null, "size": 22.79, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_craft_right_36bdaf055f", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/thumbnail_air_jordan_1_mid_se_craft_right_36bdaf055f.webp", "hash": "thumbnail_air_jordan_1_mid_se_craft_right_36bdaf055f", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-craft-right.webp", "path": null, "size": 1.34, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_craft_right_36bdaf055f", "resource_type": "image"}}}	air_jordan_1_mid_se_craft_right_36bdaf055f	.webp	image/webp	57.62	https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/air_jordan_1_mid_se_craft_right_36bdaf055f.webp	\N	cloudinary	{"public_id": "shoe-store/air_jordan_1_mid_se_craft_right_36bdaf055f", "resource_type": "image"}	/	2023-05-03 23:27:38.02	2023-05-03 23:27:38.02	1	1
\.


--
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
145	33	5	api::product.product	images	1
146	34	5	api::product.product	images	2
147	35	5	api::product.product	images	3
148	36	5	api::product.product	images	4
149	33	5	api::product.product	thumbnail	1
150	15	1	api::product.product	images	1
151	16	1	api::product.product	images	2
152	17	1	api::product.product	images	3
153	18	1	api::product.product	images	4
154	18	1	api::product.product	thumbnail	1
160	23	3	api::product.product	images	1
161	24	3	api::product.product	images	2
162	25	3	api::product.product	images	3
163	26	3	api::product.product	images	4
164	26	3	api::product.product	thumbnail	1
165	37	6	api::product.product	images	1
166	38	6	api::product.product	images	2
167	39	6	api::product.product	images	3
168	40	6	api::product.product	images	4
169	40	6	api::product.product	thumbnail	1
48	45	8	api::product.product	images	1
49	46	8	api::product.product	images	2
50	47	8	api::product.product	images	3
51	48	8	api::product.product	images	4
52	48	8	api::product.product	thumbnail	1
58	49	9	api::product.product	images	1
59	50	9	api::product.product	images	2
60	51	9	api::product.product	images	3
61	52	9	api::product.product	images	4
62	51	9	api::product.product	thumbnail	1
113	19	2	api::product.product	images	1
114	20	2	api::product.product	images	2
115	21	2	api::product.product	images	3
116	22	2	api::product.product	images	4
117	21	2	api::product.product	thumbnail	1
118	27	4	api::product.product	images	1
119	28	4	api::product.product	images	2
120	29	4	api::product.product	images	3
121	30	4	api::product.product	images	4
122	31	4	api::product.product	images	5
123	32	4	api::product.product	images	6
124	30	4	api::product.product	thumbnail	1
135	41	7	api::product.product	images	1
136	42	7	api::product.product	images	2
137	43	7	api::product.product	images	3
138	44	7	api::product.product	images	4
139	43	7	api::product.product	thumbnail	1
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	English (en)	en	2023-05-03 14:20:50.045	2023-05-03 14:20:50.045	\N	\N
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, stripe_id, products, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
1	cs_test_a1mL8lDtTrb0IZpepzjzfI2gPQkER9Bsg6ODKpcI13Qd12bf0RNU1DEsZD	[{"id": 2, "attributes": {"size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "air-jordan-xxxvii-low-pf", "price": 16295, "title": "Air Jordan XXXVII Low PF", "images": {"data": [{"id": 19, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-top.webp", "size": 46.8, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "large_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 32.99, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "small_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 12.08, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "medium_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 22.1, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 2.37, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:03.795Z", "updatedAt": "2023-05-03T17:02:03.795Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}}, {"id": 20, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-right.webp", "size": 25.27, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 19.39, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 7.33, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 13.14, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 1.43, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.167Z", "updatedAt": "2023-05-03T17:02:04.167Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}}, {"id": 21, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-left.webp", "size": 28.83, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 22.11, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 8.17, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 14.85, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 1.55, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.309Z", "updatedAt": "2023-05-03T17:02:04.309Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}, {"id": 22, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-bottom.webp", "size": 32.07, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 25.22, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 9.32, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 17.07, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 1.49, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.650Z", "updatedAt": "2023-05-03T17:02:04.650Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}}]}, "subtitle": "Men's Basketball Shoes", "createdAt": "2023-04-18T11:11:58.314Z", "thumbnail": {"data": {"id": 21, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-left.webp", "size": 28.83, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 22.11, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 8.17, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 14.85, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 1.55, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.309Z", "updatedAt": "2023-05-03T17:02:04.309Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}}, "updatedAt": "2023-05-06T16:21:47.064Z", "categories": {"data": [{"id": 1, "attributes": {"slug": "jordan", "title": "Jordan", "createdAt": "2023-04-18T10:05:03.535Z", "updatedAt": "2023-04-18T10:05:11.393Z", "publishedAt": "2023-04-18T10:05:11.039Z"}}, {"id": 6, "attributes": {"slug": "basketball", "title": "Basketball", "createdAt": "2023-04-18T10:09:19.950Z", "updatedAt": "2023-04-18T10:09:27.012Z", "publishedAt": "2023-04-18T10:09:26.697Z"}}, {"id": 5, "attributes": {"slug": "shoes", "title": "Shoes", "createdAt": "2023-04-18T10:08:51.929Z", "updatedAt": "2023-05-11T20:39:24.711Z", "publishedAt": "2023-04-18T10:08:59.298Z"}}]}, "description": "You've got the hops and the speed╬ô├ç├╢lace up in shoes that enhance what you bring to the court. The latest AJ is all about take-offs and landings, with multiple Air units to get you off the ground. The upper is made with strong, reinforced leno-weave fabric that'll keep you contained and leave your game uncompromised. This low-top model is designed for playing on outdoor courts.\\n\\n- Colour Shown: White/Siren Red/Black\\n- Style: DQ4123-100", "publishedAt": "2023-04-18T11:32:07.346Z", "original_price": null}, "selectedQty": 1, "selectedSize": "UK 6"}]	2023-05-14 18:43:10.71	2023-05-14 18:43:10.71	2023-05-14 18:43:10.706	\N	\N
2	cs_test_a14DOZRhyzgnvof1nrsxiglrbZStRABwncFKqfEtXpBQPmh2CopOPuk7Dz	[{"id": 2, "attributes": {"size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "air-jordan-xxxvii-low-pf", "price": 16295, "title": "Air Jordan XXXVII Low PF", "images": {"data": [{"id": 19, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-top.webp", "size": 46.8, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "large_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 32.99, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "small_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 12.08, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "medium_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 22.1, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 2.37, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:03.795Z", "updatedAt": "2023-05-03T17:02:03.795Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}}, {"id": 20, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-right.webp", "size": 25.27, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 19.39, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 7.33, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 13.14, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 1.43, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.167Z", "updatedAt": "2023-05-03T17:02:04.167Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}}, {"id": 21, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-left.webp", "size": 28.83, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 22.11, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 8.17, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 14.85, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 1.55, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.309Z", "updatedAt": "2023-05-03T17:02:04.309Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}, {"id": 22, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-bottom.webp", "size": 32.07, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 25.22, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 9.32, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 17.07, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 1.49, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.650Z", "updatedAt": "2023-05-03T17:02:04.650Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}}]}, "subtitle": "Men's Basketball Shoes", "createdAt": "2023-04-18T11:11:58.314Z", "thumbnail": {"data": {"id": 21, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-left.webp", "size": 28.83, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 22.11, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 8.17, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 14.85, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 1.55, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.309Z", "updatedAt": "2023-05-03T17:02:04.309Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}}, "updatedAt": "2023-05-06T16:21:47.064Z", "categories": {"data": [{"id": 1, "attributes": {"slug": "jordan", "title": "Jordan", "createdAt": "2023-04-18T10:05:03.535Z", "updatedAt": "2023-04-18T10:05:11.393Z", "publishedAt": "2023-04-18T10:05:11.039Z"}}, {"id": 6, "attributes": {"slug": "basketball", "title": "Basketball", "createdAt": "2023-04-18T10:09:19.950Z", "updatedAt": "2023-04-18T10:09:27.012Z", "publishedAt": "2023-04-18T10:09:26.697Z"}}, {"id": 5, "attributes": {"slug": "shoes", "title": "Shoes", "createdAt": "2023-04-18T10:08:51.929Z", "updatedAt": "2023-05-11T20:39:24.711Z", "publishedAt": "2023-04-18T10:08:59.298Z"}}]}, "description": "You've got the hops and the speed╬ô├ç├╢lace up in shoes that enhance what you bring to the court. The latest AJ is all about take-offs and landings, with multiple Air units to get you off the ground. The upper is made with strong, reinforced leno-weave fabric that'll keep you contained and leave your game uncompromised. This low-top model is designed for playing on outdoor courts.\\n\\n- Colour Shown: White/Siren Red/Black\\n- Style: DQ4123-100", "publishedAt": "2023-04-18T11:32:07.346Z", "original_price": null}, "selectedQty": 1, "selectedSize": "UK 10.5"}]	2023-05-14 18:47:58.785	2023-05-14 18:47:58.785	2023-05-14 18:47:58.783	\N	\N
3	cs_test_b1eNqbNeo9hkCMSsVqfjzaxCi6leAt39wz3tLoZIm1Msa7AMKq4V4K7tQS	[{"id": 8, "attributes": {"size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "air-jordan-1-retro-high-og", "price": 16995, "title": "Air Jordan 1 Retro High OG", "images": {"data": [{"id": 45, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "air-jordan-1-retro-high-og-bottom.webp", "size": 37.15, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/large_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "large_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 26, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "small_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 8.21, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "medium_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 16.11, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/thumbnail_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 1.23, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:15.806Z", "updatedAt": "2023-05-03T17:26:15.806Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}}, {"id": 46, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "air-jordan-1-retro-high-og-right.webp", "size": 31.78, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/large_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "large_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 24.71, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "small_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 8.14, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "medium_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 15.59, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/thumbnail_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 1.49, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:16.517Z", "updatedAt": "2023-05-03T17:26:16.517Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}}, {"id": 47, "attributes": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "air-jordan-1-retro-high-og-top.jpeg", "size": 57.99, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134778/shoe-store/large_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "large_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "large_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 78.94, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}, "small": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/small_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "small_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "small_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 26.36, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}, "medium": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/medium_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "medium_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "medium_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 50.27, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}, "thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/thumbnail_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "thumbnail_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "thumbnail_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 4.22, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:17.174Z", "updatedAt": "2023-05-03T17:26:17.174Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}}, {"id": 48, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "air-jordan-1-retro-high-og-left.webp", "size": 33.16, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134778/shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "large_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 24.1, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "small_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 8.39, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "medium_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 15.82, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 1.64, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:17.288Z", "updatedAt": "2023-05-03T17:26:17.288Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}]}, "subtitle": "Men's Shoes", "createdAt": "2023-04-18T11:26:51.335Z", "thumbnail": {"data": {"id": 48, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "air-jordan-1-retro-high-og-left.webp", "size": 33.16, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134778/shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "large_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 24.1, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "small_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 8.39, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "medium_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 15.82, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 1.64, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:17.288Z", "updatedAt": "2023-05-03T17:26:17.288Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}}, "updatedAt": "2023-05-03T17:26:35.435Z", "categories": {"data": [{"id": 1, "attributes": {"slug": "jordan", "title": "Jordan", "createdAt": "2023-04-18T10:05:03.535Z", "updatedAt": "2023-04-18T10:05:11.393Z", "publishedAt": "2023-04-18T10:05:11.039Z"}}, {"id": 6, "attributes": {"slug": "basketball", "title": "Basketball", "createdAt": "2023-04-18T10:09:19.950Z", "updatedAt": "2023-04-18T10:09:27.012Z", "publishedAt": "2023-04-18T10:09:26.697Z"}}, {"id": 5, "attributes": {"slug": "shoes", "title": "Shoes", "createdAt": "2023-04-18T10:08:51.929Z", "updatedAt": "2023-05-11T20:39:24.711Z", "publishedAt": "2023-04-18T10:08:59.298Z"}}]}, "description": "3 + 1 = a whole new icon. Celebrating 35 years of the Air Jordan 3, these kicks combine the classic AJ1 silhouette with an original AJ3 colourway. Crafted to the '85 specs, it's got premium leather, a high-top collar and the woven tongue label you know and love. Bold splashes of True Blue throughout (check out the Wings logo) stand out against layers of white and Cement Grey. And the finishing touch? Nike Air cushioning underfoot lets you keep pace, so nothing holds you back from stepping out in style.\\n\\nColour Shown: True Blue/Cement Grey/White\\nStyle: DZ5485-410", "publishedAt": "2023-05-03T17:10:23.571Z", "original_price": null}, "selectedQty": 1, "selectedSize": "UK 10.5"}, {"id": 3, "attributes": {"size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "jordan-why-not-6-pf", "price": 13995, "title": "Jordan Why Not .6 PF", "images": {"data": [{"id": 23, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/jordan_why_not_6_pf_right_cbc33243ac.webp", "hash": "jordan_why_not_6_pf_right_cbc33243ac", "mime": "image/webp", "name": "jordan-why-not-6-pf-right.webp", "size": 44.49, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/large_jordan_why_not_6_pf_right_cbc33243ac.webp", "hash": "large_jordan_why_not_6_pf_right_cbc33243ac", "mime": "image/webp", "name": "large_jordan-why-not-6-pf-right.webp", "path": null, "size": 30.73, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_why_not_6_pf_right_cbc33243ac", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/small_jordan_why_not_6_pf_right_cbc33243ac.webp", "hash": "small_jordan_why_not_6_pf_right_cbc33243ac", "mime": "image/webp", "name": "small_jordan-why-not-6-pf-right.webp", "path": null, "size": 10.43, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_why_not_6_pf_right_cbc33243ac", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/medium_jordan_why_not_6_pf_right_cbc33243ac.webp", "hash": "medium_jordan_why_not_6_pf_right_cbc33243ac", "mime": "image/webp", "name": "medium_jordan-why-not-6-pf-right.webp", "path": null, "size": 19.85, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_why_not_6_pf_right_cbc33243ac", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133670/shoe-store/thumbnail_jordan_why_not_6_pf_right_cbc33243ac.webp", "hash": "thumbnail_jordan_why_not_6_pf_right_cbc33243ac", "mime": "image/webp", "name": "thumbnail_jordan-why-not-6-pf-right.webp", "path": null, "size": 1.59, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_why_not_6_pf_right_cbc33243ac", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:07:51.423Z", "updatedAt": "2023-05-03T17:07:51.423Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/jordan_why_not_6_pf_right_cbc33243ac", "resource_type": "image"}}}, {"id": 24, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/jordan_why_not_6_pf_bottom_5950d881b0.webp", "hash": "jordan_why_not_6_pf_bottom_5950d881b0", "mime": "image/webp", "name": "jordan-why-not-6-pf-bottom.webp", "size": 53.79, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/large_jordan_why_not_6_pf_bottom_5950d881b0.webp", "hash": "large_jordan_why_not_6_pf_bottom_5950d881b0", "mime": "image/webp", "name": "large_jordan-why-not-6-pf-bottom.webp", "path": null, "size": 39.38, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_why_not_6_pf_bottom_5950d881b0", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/small_jordan_why_not_6_pf_bottom_5950d881b0.webp", "hash": "small_jordan_why_not_6_pf_bottom_5950d881b0", "mime": "image/webp", "name": "small_jordan-why-not-6-pf-bottom.webp", "path": null, "size": 13.69, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_why_not_6_pf_bottom_5950d881b0", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/medium_jordan_why_not_6_pf_bottom_5950d881b0.webp", "hash": "medium_jordan_why_not_6_pf_bottom_5950d881b0", "mime": "image/webp", "name": "medium_jordan-why-not-6-pf-bottom.webp", "path": null, "size": 26.31, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_why_not_6_pf_bottom_5950d881b0", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/thumbnail_jordan_why_not_6_pf_bottom_5950d881b0.webp", "hash": "thumbnail_jordan_why_not_6_pf_bottom_5950d881b0", "mime": "image/webp", "name": "thumbnail_jordan-why-not-6-pf-bottom.webp", "path": null, "size": 1.79, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_why_not_6_pf_bottom_5950d881b0", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:07:51.612Z", "updatedAt": "2023-05-03T17:07:51.612Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/jordan_why_not_6_pf_bottom_5950d881b0", "resource_type": "image"}}}, {"id": 25, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/jordan_why_not_6_pf_top_f231ac45b2.webp", "hash": "jordan_why_not_6_pf_top_f231ac45b2", "mime": "image/webp", "name": "jordan-why-not-6-pf-top.webp", "size": 82.46, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/large_jordan_why_not_6_pf_top_f231ac45b2.webp", "hash": "large_jordan_why_not_6_pf_top_f231ac45b2", "mime": "image/webp", "name": "large_jordan-why-not-6-pf-top.webp", "path": null, "size": 57.08, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_why_not_6_pf_top_f231ac45b2", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/small_jordan_why_not_6_pf_top_f231ac45b2.webp", "hash": "small_jordan_why_not_6_pf_top_f231ac45b2", "mime": "image/webp", "name": "small_jordan-why-not-6-pf-top.webp", "path": null, "size": 20.56, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_why_not_6_pf_top_f231ac45b2", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/medium_jordan_why_not_6_pf_top_f231ac45b2.webp", "hash": "medium_jordan_why_not_6_pf_top_f231ac45b2", "mime": "image/webp", "name": "medium_jordan-why-not-6-pf-top.webp", "path": null, "size": 38.1, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_why_not_6_pf_top_f231ac45b2", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/thumbnail_jordan_why_not_6_pf_top_f231ac45b2.webp", "hash": "thumbnail_jordan_why_not_6_pf_top_f231ac45b2", "mime": "image/webp", "name": "thumbnail_jordan-why-not-6-pf-top.webp", "path": null, "size": 3.19, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_why_not_6_pf_top_f231ac45b2", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:07:51.780Z", "updatedAt": "2023-05-03T17:07:51.780Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/jordan_why_not_6_pf_top_f231ac45b2", "resource_type": "image"}}}, {"id": 26, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "jordan-why-not-6-pf-left.webp", "size": 39.96, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/large_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "large_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "large_jordan-why-not-6-pf-left.webp", "path": null, "size": 28.07, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/small_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "small_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "small_jordan-why-not-6-pf-left.webp", "path": null, "size": 9.99, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133673/shoe-store/medium_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "medium_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "medium_jordan-why-not-6-pf-left.webp", "path": null, "size": 18.26, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133670/shoe-store/thumbnail_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "thumbnail_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "thumbnail_jordan-why-not-6-pf-left.webp", "path": null, "size": 1.71, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:07:52.677Z", "updatedAt": "2023-05-03T17:07:52.677Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}}]}, "subtitle": "Men's Shoes", "createdAt": "2023-04-18T11:26:47.321Z", "thumbnail": {"data": {"id": 26, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "jordan-why-not-6-pf-left.webp", "size": 39.96, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133672/shoe-store/large_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "large_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "large_jordan-why-not-6-pf-left.webp", "path": null, "size": 28.07, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133671/shoe-store/small_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "small_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "small_jordan-why-not-6-pf-left.webp", "path": null, "size": 9.99, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133673/shoe-store/medium_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "medium_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "medium_jordan-why-not-6-pf-left.webp", "path": null, "size": 18.26, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133670/shoe-store/thumbnail_jordan_why_not_6_pf_left_69e6e0db81.webp", "hash": "thumbnail_jordan_why_not_6_pf_left_69e6e0db81", "mime": "image/webp", "name": "thumbnail_jordan-why-not-6-pf-left.webp", "path": null, "size": 1.71, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:07:52.677Z", "updatedAt": "2023-05-03T17:07:52.677Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/jordan_why_not_6_pf_left_69e6e0db81", "resource_type": "image"}}}}, "updatedAt": "2023-05-11T20:39:55.778Z", "categories": {"data": [{"id": 4, "attributes": {"slug": "running", "title": "Running", "createdAt": "2023-04-18T10:07:35.911Z", "updatedAt": "2023-04-18T10:07:50.170Z", "publishedAt": "2023-04-18T10:07:49.860Z"}}, {"id": 5, "attributes": {"slug": "shoes", "title": "Shoes", "createdAt": "2023-04-18T10:08:51.929Z", "updatedAt": "2023-05-11T20:39:24.711Z", "publishedAt": "2023-04-18T10:08:59.298Z"}}, {"id": 2, "attributes": {"slug": "football", "title": "Football", "createdAt": "2023-04-18T10:05:56.368Z", "updatedAt": "2023-04-18T10:06:04.037Z", "publishedAt": "2023-04-18T10:06:03.715Z"}}]}, "description": "Russell Westbrook's 6th signature shoe isΓÇöyou guessed itΓÇöall about speed. To get you goin' as fast as possible, we've wrapped the rubber out-sole nearly up to the mid-sole, so you're not gonna slip when you explode from 0 to 100. Added security comes from the interior bootie that keeps you strapped in as you jet across the court. It's all held together by an outer shroud and fastened with a zip collar that spells out Russell's signature question: \\"Why Not?\\"\\n\\n- Color Shown: Phantom/Rattan/Pale Ivory/Black\\n- Style: DO7190-002", "publishedAt": "2023-05-03T17:08:41.781Z", "original_price": null}, "selectedQty": 1, "selectedSize": "UK 9"}, {"id": 1, "attributes": {"size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "air-jordan-1-mid-se", "price": 12295, "title": "Air Jordan 1 Mid SE", "images": {"data": [{"id": 15, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/air_jordan_1_mid_se_bottom_39510152ae.webp", "hash": "air_jordan_1_mid_se_bottom_39510152ae", "mime": "image/webp", "name": "air-jordan-1-mid-se-bottom.webp", "size": 10.34, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/large_air_jordan_1_mid_se_bottom_39510152ae.webp", "hash": "large_air_jordan_1_mid_se_bottom_39510152ae", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-bottom.webp", "path": null, "size": 8.11, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_bottom_39510152ae", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/small_air_jordan_1_mid_se_bottom_39510152ae.webp", "hash": "small_air_jordan_1_mid_se_bottom_39510152ae", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-bottom.webp", "path": null, "size": 3.18, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_bottom_39510152ae", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/medium_air_jordan_1_mid_se_bottom_39510152ae.webp", "hash": "medium_air_jordan_1_mid_se_bottom_39510152ae", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-bottom.webp", "path": null, "size": 5.66, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_bottom_39510152ae", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/thumbnail_air_jordan_1_mid_se_bottom_39510152ae.webp", "hash": "thumbnail_air_jordan_1_mid_se_bottom_39510152ae", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-bottom.webp", "path": null, "size": 0.7, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_bottom_39510152ae", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T16:59:48.114Z", "updatedAt": "2023-05-03T16:59:48.114Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_mid_se_bottom_39510152ae", "resource_type": "image"}}}, {"id": 16, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/air_jordan_1_mid_se_right_a3d6586e78.webp", "hash": "air_jordan_1_mid_se_right_a3d6586e78", "mime": "image/webp", "name": "air-jordan-1-mid-se-right.webp", "size": 30.06, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/large_air_jordan_1_mid_se_right_a3d6586e78.webp", "hash": "large_air_jordan_1_mid_se_right_a3d6586e78", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-right.webp", "path": null, "size": 21.95, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_right_a3d6586e78", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/small_air_jordan_1_mid_se_right_a3d6586e78.webp", "hash": "small_air_jordan_1_mid_se_right_a3d6586e78", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-right.webp", "path": null, "size": 7.59, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_right_a3d6586e78", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/medium_air_jordan_1_mid_se_right_a3d6586e78.webp", "hash": "medium_air_jordan_1_mid_se_right_a3d6586e78", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-right.webp", "path": null, "size": 14.34, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_right_a3d6586e78", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/thumbnail_air_jordan_1_mid_se_right_a3d6586e78.webp", "hash": "thumbnail_air_jordan_1_mid_se_right_a3d6586e78", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-right.webp", "path": null, "size": 1.37, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_right_a3d6586e78", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T16:59:48.210Z", "updatedAt": "2023-05-03T16:59:48.210Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_mid_se_right_a3d6586e78", "resource_type": "image"}}}, {"id": 17, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/air_jordan_1_mid_se_top_e5dd9bb397.webp", "hash": "air_jordan_1_mid_se_top_e5dd9bb397", "mime": "image/webp", "name": "air-jordan-1-mid-se-top.webp", "size": 49.94, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/large_air_jordan_1_mid_se_top_e5dd9bb397.webp", "hash": "large_air_jordan_1_mid_se_top_e5dd9bb397", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-top.webp", "path": null, "size": 35.85, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_top_e5dd9bb397", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/small_air_jordan_1_mid_se_top_e5dd9bb397.webp", "hash": "small_air_jordan_1_mid_se_top_e5dd9bb397", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-top.webp", "path": null, "size": 13.53, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_top_e5dd9bb397", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/medium_air_jordan_1_mid_se_top_e5dd9bb397.webp", "hash": "medium_air_jordan_1_mid_se_top_e5dd9bb397", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-top.webp", "path": null, "size": 24.62, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_top_e5dd9bb397", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/thumbnail_air_jordan_1_mid_se_top_e5dd9bb397.webp", "hash": "thumbnail_air_jordan_1_mid_se_top_e5dd9bb397", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-top.webp", "path": null, "size": 2.52, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_top_e5dd9bb397", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T16:59:48.410Z", "updatedAt": "2023-05-03T16:59:48.410Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_mid_se_top_e5dd9bb397", "resource_type": "image"}}}, {"id": 18, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/air_jordan_1_mid_se_left_3643a20769.webp", "hash": "air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "air-jordan-1-mid-se-left.webp", "size": 30.64, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/large_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "large_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-left.webp", "path": null, "size": 23.45, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/small_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "small_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-left.webp", "path": null, "size": 7.99, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/medium_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "medium_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-left.webp", "path": null, "size": 15.26, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/thumbnail_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "thumbnail_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-left.webp", "path": null, "size": 1.4, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T16:59:48.491Z", "updatedAt": "2023-05-03T17:00:20.350Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}}]}, "subtitle": "Men's Shoes", "createdAt": "2023-04-18T10:04:20.918Z", "thumbnail": {"data": {"id": 18, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/air_jordan_1_mid_se_left_3643a20769.webp", "hash": "air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "air-jordan-1-mid-se-left.webp", "size": 30.64, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/large_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "large_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-left.webp", "path": null, "size": 23.45, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/small_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "small_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-left.webp", "path": null, "size": 7.99, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133189/shoe-store/medium_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "medium_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-left.webp", "path": null, "size": 15.26, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133188/shoe-store/thumbnail_air_jordan_1_mid_se_left_3643a20769.webp", "hash": "thumbnail_air_jordan_1_mid_se_left_3643a20769", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-left.webp", "path": null, "size": 1.4, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T16:59:48.491Z", "updatedAt": "2023-05-03T17:00:20.350Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_mid_se_left_3643a20769", "resource_type": "image"}}}}, "updatedAt": "2023-05-06T17:06:56.385Z", "categories": {"data": [{"id": 3, "attributes": {"slug": "sneakers", "title": "Sneakers", "createdAt": "2023-04-18T10:07:05.218Z", "updatedAt": "2023-04-18T10:07:12.801Z", "publishedAt": "2023-04-18T10:07:12.429Z"}}, {"id": 5, "attributes": {"slug": "shoes", "title": "Shoes", "createdAt": "2023-04-18T10:08:51.929Z", "updatedAt": "2023-05-11T20:39:24.711Z", "publishedAt": "2023-04-18T10:08:59.298Z"}}]}, "description": "Every time the AJ1 gets a remake, you get the classic sneaker in new colours and textures for an exciting, revamped look but with all the familiar comforts you know. Premium materials and accents give modern expression to an all-time favourite.\\n\\n- Colour Shown: White/Black/Ice Blue\\n- Style: DV1308-104", "publishedAt": "2023-05-03T17:03:36.466Z", "original_price": 20000}, "selectedQty": 1, "selectedSize": "UK 9"}]	2023-05-14 18:48:36.505	2023-05-14 18:48:36.505	2023-05-14 18:48:36.503	\N	\N
4	cs_test_a15aj0sEpmTRdjN0ES2UD1yGG8HcAIgn685hL0eUMa6iRSGOciReXG5TE1	[{"id": 9, "attributes": {"size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "air-jordan-1-mid-se-craft", "price": 12295, "title": "Air Jordan 1 Mid SE Craft", "images": {"data": [{"id": 49, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/air_jordan_1_mid_se_craft_bottom_c60efa86c2.webp", "hash": "air_jordan_1_mid_se_craft_bottom_c60efa86c2", "mime": "image/webp", "name": "air-jordan-1-mid-se-craft-bottom.webp", "size": 41.5, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/large_air_jordan_1_mid_se_craft_bottom_c60efa86c2.webp", "hash": "large_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-craft-bottom.webp", "path": null, "size": 28.52, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/small_air_jordan_1_mid_se_craft_bottom_c60efa86c2.webp", "hash": "small_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-craft-bottom.webp", "path": null, "size": 8.68, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/medium_air_jordan_1_mid_se_craft_bottom_c60efa86c2.webp", "hash": "medium_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-craft-bottom.webp", "path": null, "size": 17.67, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/thumbnail_air_jordan_1_mid_se_craft_bottom_c60efa86c2.webp", "hash": "thumbnail_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-craft-bottom.webp", "path": null, "size": 1.19, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_craft_bottom_c60efa86c2", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:27:36.497Z", "updatedAt": "2023-05-03T17:27:36.497Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_mid_se_craft_bottom_c60efa86c2", "resource_type": "image"}}}, {"id": 50, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/air_jordan_1_mid_se_craft_top_533060cff9.webp", "hash": "air_jordan_1_mid_se_craft_top_533060cff9", "mime": "image/webp", "name": "air-jordan-1-mid-se-craft-top.webp", "size": 52.39, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/large_air_jordan_1_mid_se_craft_top_533060cff9.webp", "hash": "large_air_jordan_1_mid_se_craft_top_533060cff9", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-craft-top.webp", "path": null, "size": 36.05, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_craft_top_533060cff9", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/small_air_jordan_1_mid_se_craft_top_533060cff9.webp", "hash": "small_air_jordan_1_mid_se_craft_top_533060cff9", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-craft-top.webp", "path": null, "size": 12.13, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_craft_top_533060cff9", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/medium_air_jordan_1_mid_se_craft_top_533060cff9.webp", "hash": "medium_air_jordan_1_mid_se_craft_top_533060cff9", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-craft-top.webp", "path": null, "size": 23.55, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_craft_top_533060cff9", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/thumbnail_air_jordan_1_mid_se_craft_top_533060cff9.webp", "hash": "thumbnail_air_jordan_1_mid_se_craft_top_533060cff9", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-craft-top.webp", "path": null, "size": 2.13, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_craft_top_533060cff9", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:27:36.603Z", "updatedAt": "2023-05-03T17:27:36.603Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_mid_se_craft_top_533060cff9", "resource_type": "image"}}}, {"id": 51, "attributes": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "air-jordan-1-mid-se-craft-left.jpeg", "size": 43.2, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/large_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "large_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "large_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 58.84, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}, "small": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/small_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "small_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "small_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 15.51, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}, "medium": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/medium_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "medium_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "medium_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 34.21, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}, "thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/thumbnail_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "thumbnail_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "thumbnail_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 2.33, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:27:36.971Z", "updatedAt": "2023-05-03T17:27:36.971Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}}, {"id": 52, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/air_jordan_1_mid_se_craft_right_36bdaf055f.webp", "hash": "air_jordan_1_mid_se_craft_right_36bdaf055f", "mime": "image/webp", "name": "air-jordan-1-mid-se-craft-right.webp", "size": 57.62, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134858/shoe-store/large_air_jordan_1_mid_se_craft_right_36bdaf055f.webp", "hash": "large_air_jordan_1_mid_se_craft_right_36bdaf055f", "mime": "image/webp", "name": "large_air-jordan-1-mid-se-craft-right.webp", "path": null, "size": 39.28, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_craft_right_36bdaf055f", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/small_air_jordan_1_mid_se_craft_right_36bdaf055f.webp", "hash": "small_air_jordan_1_mid_se_craft_right_36bdaf055f", "mime": "image/webp", "name": "small_air-jordan-1-mid-se-craft-right.webp", "path": null, "size": 9.89, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_craft_right_36bdaf055f", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/medium_air_jordan_1_mid_se_craft_right_36bdaf055f.webp", "hash": "medium_air_jordan_1_mid_se_craft_right_36bdaf055f", "mime": "image/webp", "name": "medium_air-jordan-1-mid-se-craft-right.webp", "path": null, "size": 22.79, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_craft_right_36bdaf055f", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/thumbnail_air_jordan_1_mid_se_craft_right_36bdaf055f.webp", "hash": "thumbnail_air_jordan_1_mid_se_craft_right_36bdaf055f", "mime": "image/webp", "name": "thumbnail_air-jordan-1-mid-se-craft-right.webp", "path": null, "size": 1.34, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_craft_right_36bdaf055f", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:27:38.020Z", "updatedAt": "2023-05-03T17:27:38.020Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_mid_se_craft_right_36bdaf055f", "resource_type": "image"}}}]}, "subtitle": "Men's Shoes", "createdAt": "2023-04-18T11:26:52.248Z", "thumbnail": {"data": {"id": 51, "attributes": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "air-jordan-1-mid-se-craft-left.jpeg", "size": 43.2, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/large_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "large_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "large_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 58.84, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}, "small": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/small_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "small_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "small_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 15.51, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}, "medium": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134857/shoe-store/medium_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "medium_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "medium_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 34.21, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}, "thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134856/shoe-store/thumbnail_air_jordan_1_mid_se_craft_left_a82f51ac77.jpg", "hash": "thumbnail_air_jordan_1_mid_se_craft_left_a82f51ac77", "mime": "image/jpeg", "name": "thumbnail_air-jordan-1-mid-se-craft-left.jpeg", "path": null, "size": 2.33, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:27:36.971Z", "updatedAt": "2023-05-03T17:27:36.971Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_mid_se_craft_left_a82f51ac77", "resource_type": "image"}}}}, "updatedAt": "2023-05-03T21:23:25.555Z", "categories": {"data": [{"id": 1, "attributes": {"slug": "jordan", "title": "Jordan", "createdAt": "2023-04-18T10:05:03.535Z", "updatedAt": "2023-04-18T10:05:11.393Z", "publishedAt": "2023-04-18T10:05:11.039Z"}}, {"id": 6, "attributes": {"slug": "basketball", "title": "Basketball", "createdAt": "2023-04-18T10:09:19.950Z", "updatedAt": "2023-04-18T10:09:27.012Z", "publishedAt": "2023-04-18T10:09:26.697Z"}}, {"id": 5, "attributes": {"slug": "shoes", "title": "Shoes", "createdAt": "2023-04-18T10:08:51.929Z", "updatedAt": "2023-05-11T20:39:24.711Z", "publishedAt": "2023-04-18T10:08:59.298Z"}}]}, "description": "Turn style on its head with this crafted take on the Air Jordan 1 Mid. Its \\"inside out\\"-inspired construction, including unique layering and exposed foam accents, ups the ante on this timeless Jordan Brand silhouette. Details like the deco stitching on the Swoosh add coveted appeal, while the unexpected shading, rich mixture of materials and aged midsole aesthetic give this release an artisan finish.\\n\\nColour Shown: Sail/Fossil Stone/Celestial Gold/Taupe Haze\\nStyle: DM9652-102", "publishedAt": "2023-05-03T17:10:25.793Z", "original_price": null}, "selectedQty": 1, "selectedSize": "UK 10.5"}]	2023-05-14 18:50:11.805	2023-05-14 18:50:11.805	2023-05-14 18:50:11.798	\N	\N
5	cs_test_b1amSrzXdq4AoHsG137fR8zfMnteBrWtgb9Pu5n8mYupqMCWFTLJQbF7jN	[{"id": 2, "attributes": {"size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "air-jordan-xxxvii-low-pf", "price": 16295, "title": "Air Jordan XXXVII Low PF", "images": {"data": [{"id": 19, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-top.webp", "size": 46.8, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "large_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 32.99, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "small_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 12.08, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "medium_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 22.1, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-top.webp", "path": null, "size": 2.37, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:03.795Z", "updatedAt": "2023-05-03T17:02:03.795Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_top_43be7a6249", "resource_type": "image"}}}, {"id": 20, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-right.webp", "size": 25.27, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 19.39, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 7.33, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 13.14, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-right.webp", "path": null, "size": 1.43, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.167Z", "updatedAt": "2023-05-03T17:02:04.167Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_right_cd4f8bf37c", "resource_type": "image"}}}, {"id": 21, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-left.webp", "size": 28.83, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 22.11, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 8.17, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 14.85, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 1.55, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.309Z", "updatedAt": "2023-05-03T17:02:04.309Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}, {"id": 22, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-bottom.webp", "size": 32.07, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 25.22, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 9.32, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 17.07, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-bottom.webp", "path": null, "size": 1.49, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.650Z", "updatedAt": "2023-05-03T17:02:04.650Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_bottom_ab2af3a63a", "resource_type": "image"}}}]}, "subtitle": "Men's Basketball Shoes", "createdAt": "2023-04-18T11:11:58.314Z", "thumbnail": {"data": {"id": 21, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "air-jordan-xxxvii-low-pf-left.webp", "size": 28.83, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "large_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 22.11, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "small_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 8.17, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133324/shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "medium_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 14.85, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683133323/shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3.webp", "hash": "thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "mime": "image/webp", "name": "thumbnail_air-jordan-xxxvii-low-pf-left.webp", "path": null, "size": 1.55, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:02:04.309Z", "updatedAt": "2023-05-03T17:02:04.309Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_xxxvii_low_pf_left_57dfa46bd3", "resource_type": "image"}}}}, "updatedAt": "2023-05-06T16:21:47.064Z", "categories": {"data": [{"id": 1, "attributes": {"slug": "jordan", "title": "Jordan", "createdAt": "2023-04-18T10:05:03.535Z", "updatedAt": "2023-04-18T10:05:11.393Z", "publishedAt": "2023-04-18T10:05:11.039Z"}}, {"id": 6, "attributes": {"slug": "basketball", "title": "Basketball", "createdAt": "2023-04-18T10:09:19.950Z", "updatedAt": "2023-04-18T10:09:27.012Z", "publishedAt": "2023-04-18T10:09:26.697Z"}}, {"id": 5, "attributes": {"slug": "shoes", "title": "Shoes", "createdAt": "2023-04-18T10:08:51.929Z", "updatedAt": "2023-05-11T20:39:24.711Z", "publishedAt": "2023-04-18T10:08:59.298Z"}}]}, "description": "You've got the hops and the speed╬ô├ç├╢lace up in shoes that enhance what you bring to the court. The latest AJ is all about take-offs and landings, with multiple Air units to get you off the ground. The upper is made with strong, reinforced leno-weave fabric that'll keep you contained and leave your game uncompromised. This low-top model is designed for playing on outdoor courts.\\n\\n- Colour Shown: White/Siren Red/Black\\n- Style: DQ4123-100", "publishedAt": "2023-04-18T11:32:07.346Z", "original_price": null}, "selectedQty": 1, "selectedSize": "UK 8"}, {"id": 8, "attributes": {"size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "air-jordan-1-retro-high-og", "price": 16995, "title": "Air Jordan 1 Retro High OG", "images": {"data": [{"id": 45, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "air-jordan-1-retro-high-og-bottom.webp", "size": 37.15, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/large_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "large_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 26, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "small_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 8.21, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "medium_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 16.11, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/thumbnail_air_jordan_1_retro_high_og_bottom_c556118bd5.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_bottom_c556118bd5", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-bottom.webp", "path": null, "size": 1.23, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:15.806Z", "updatedAt": "2023-05-03T17:26:15.806Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_bottom_c556118bd5", "resource_type": "image"}}}, {"id": 46, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "air-jordan-1-retro-high-og-right.webp", "size": 31.78, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/large_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "large_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 24.71, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "small_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 8.14, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "medium_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 15.59, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/thumbnail_air_jordan_1_retro_high_og_right_cede4b9178.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_right_cede4b9178", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-right.webp", "path": null, "size": 1.49, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:16.517Z", "updatedAt": "2023-05-03T17:26:16.517Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_right_cede4b9178", "resource_type": "image"}}}, {"id": 47, "attributes": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "air-jordan-1-retro-high-og-top.jpeg", "size": 57.99, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134778/shoe-store/large_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "large_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "large_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 78.94, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}, "small": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/small_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "small_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "small_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 26.36, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}, "medium": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/medium_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "medium_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "medium_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 50.27, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}, "thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/thumbnail_air_jordan_1_retro_high_og_top_77c1961ca7.jpg", "hash": "thumbnail_air_jordan_1_retro_high_og_top_77c1961ca7", "mime": "image/jpeg", "name": "thumbnail_air-jordan-1-retro-high-og-top.jpeg", "path": null, "size": 4.22, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:17.174Z", "updatedAt": "2023-05-03T17:26:17.174Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_top_77c1961ca7", "resource_type": "image"}}}, {"id": 48, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "air-jordan-1-retro-high-og-left.webp", "size": 33.16, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134778/shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "large_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 24.1, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "small_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 8.39, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "medium_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 15.82, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 1.64, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:17.288Z", "updatedAt": "2023-05-03T17:26:17.288Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}]}, "subtitle": "Men's Shoes", "createdAt": "2023-04-18T11:26:51.335Z", "thumbnail": {"data": {"id": 48, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "air-jordan-1-retro-high-og-left.webp", "size": 33.16, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134778/shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "large_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 24.1, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "small_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 8.39, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "medium_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 15.82, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 1.64, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:17.288Z", "updatedAt": "2023-05-03T17:26:17.288Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}}, "updatedAt": "2023-05-03T17:26:35.435Z", "categories": {"data": [{"id": 1, "attributes": {"slug": "jordan", "title": "Jordan", "createdAt": "2023-04-18T10:05:03.535Z", "updatedAt": "2023-04-18T10:05:11.393Z", "publishedAt": "2023-04-18T10:05:11.039Z"}}, {"id": 6, "attributes": {"slug": "basketball", "title": "Basketball", "createdAt": "2023-04-18T10:09:19.950Z", "updatedAt": "2023-04-18T10:09:27.012Z", "publishedAt": "2023-04-18T10:09:26.697Z"}}, {"id": 5, "attributes": {"slug": "shoes", "title": "Shoes", "createdAt": "2023-04-18T10:08:51.929Z", "updatedAt": "2023-05-11T20:39:24.711Z", "publishedAt": "2023-04-18T10:08:59.298Z"}}]}, "description": "3 + 1 = a whole new icon. Celebrating 35 years of the Air Jordan 3, these kicks combine the classic AJ1 silhouette with an original AJ3 colourway. Crafted to the '85 specs, it's got premium leather, a high-top collar and the woven tongue label you know and love. Bold splashes of True Blue throughout (check out the Wings logo) stand out against layers of white and Cement Grey. And the finishing touch? Nike Air cushioning underfoot lets you keep pace, so nothing holds you back from stepping out in style.\\n\\nColour Shown: True Blue/Cement Grey/White\\nStyle: DZ5485-410", "publishedAt": "2023-05-03T17:10:23.571Z", "original_price": null}, "selectedQty": 1, "selectedSize": "UK 6.5"}]	2023-05-14 20:38:01.254	2023-05-14 20:38:01.254	2023-05-14 20:38:01.25	\N	\N
6	cs_test_a10tmUhKzI0gZyfWFHfgzpUCT0ln57SfW56nGEG5YMIF6gzs68diqfio0p	[{"id": 6, "attributes": {"size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "air-jordan-13-retro", "price": 19295, "title": "Air Jordan 13 Retro", "images": {"data": [{"id": 37, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134156/shoe-store/air_jordan_13_retro_bottom_af50685ccb.webp", "hash": "air_jordan_13_retro_bottom_af50685ccb", "mime": "image/webp", "name": "air-jordan-13-retro-bottom.webp", "size": 43.18, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134154/shoe-store/large_air_jordan_13_retro_bottom_af50685ccb.webp", "hash": "large_air_jordan_13_retro_bottom_af50685ccb", "mime": "image/webp", "name": "large_air-jordan-13-retro-bottom.webp", "path": null, "size": 31.83, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_13_retro_bottom_af50685ccb", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134152/shoe-store/small_air_jordan_13_retro_bottom_af50685ccb.webp", "hash": "small_air_jordan_13_retro_bottom_af50685ccb", "mime": "image/webp", "name": "small_air-jordan-13-retro-bottom.webp", "path": null, "size": 11.27, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_13_retro_bottom_af50685ccb", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134152/shoe-store/medium_air_jordan_13_retro_bottom_af50685ccb.webp", "hash": "medium_air_jordan_13_retro_bottom_af50685ccb", "mime": "image/webp", "name": "medium_air-jordan-13-retro-bottom.webp", "path": null, "size": 21.13, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_13_retro_bottom_af50685ccb", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/thumbnail_air_jordan_13_retro_bottom_af50685ccb.webp", "hash": "thumbnail_air_jordan_13_retro_bottom_af50685ccb", "mime": "image/webp", "name": "thumbnail_air-jordan-13-retro-bottom.webp", "path": null, "size": 1.73, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_13_retro_bottom_af50685ccb", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:15:56.604Z", "updatedAt": "2023-05-03T17:15:56.604Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_13_retro_bottom_af50685ccb", "resource_type": "image"}}}, {"id": 38, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134158/shoe-store/air_jordan_13_retro_model1_2790369d9f.webp", "hash": "air_jordan_13_retro_model1_2790369d9f", "mime": "image/webp", "name": "air-jordan-13-retro-model1.webp", "size": 26.95, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/large_air_jordan_13_retro_model1_2790369d9f.webp", "hash": "large_air_jordan_13_retro_model1_2790369d9f", "mime": "image/webp", "name": "large_air-jordan-13-retro-model1.webp", "path": null, "size": 21.6, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_13_retro_model1_2790369d9f", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/small_air_jordan_13_retro_model1_2790369d9f.webp", "hash": "small_air_jordan_13_retro_model1_2790369d9f", "mime": "image/webp", "name": "small_air-jordan-13-retro-model1.webp", "path": null, "size": 8.7, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_13_retro_model1_2790369d9f", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134159/shoe-store/medium_air_jordan_13_retro_model1_2790369d9f.webp", "hash": "medium_air_jordan_13_retro_model1_2790369d9f", "mime": "image/webp", "name": "medium_air-jordan-13-retro-model1.webp", "path": null, "size": 15.25, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_13_retro_model1_2790369d9f", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134153/shoe-store/thumbnail_air_jordan_13_retro_model1_2790369d9f.webp", "hash": "thumbnail_air_jordan_13_retro_model1_2790369d9f", "mime": "image/webp", "name": "thumbnail_air-jordan-13-retro-model1.webp", "path": null, "size": 1.94, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_13_retro_model1_2790369d9f", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:15:58.162Z", "updatedAt": "2023-05-03T17:15:58.162Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_13_retro_model1_2790369d9f", "resource_type": "image"}}}, {"id": 39, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134156/shoe-store/air_jordan_13_retro_right_9512f7fb31.webp", "hash": "air_jordan_13_retro_right_9512f7fb31", "mime": "image/webp", "name": "air-jordan-13-retro-right.webp", "size": 38.58, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134153/shoe-store/large_air_jordan_13_retro_right_9512f7fb31.webp", "hash": "large_air_jordan_13_retro_right_9512f7fb31", "mime": "image/webp", "name": "large_air-jordan-13-retro-right.webp", "path": null, "size": 26.98, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_13_retro_right_9512f7fb31", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134166/shoe-store/small_air_jordan_13_retro_right_9512f7fb31.webp", "hash": "small_air_jordan_13_retro_right_9512f7fb31", "mime": "image/webp", "name": "small_air-jordan-13-retro-right.webp", "path": null, "size": 7.86, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_13_retro_right_9512f7fb31", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134159/shoe-store/medium_air_jordan_13_retro_right_9512f7fb31.webp", "hash": "medium_air_jordan_13_retro_right_9512f7fb31", "mime": "image/webp", "name": "medium_air-jordan-13-retro-right.webp", "path": null, "size": 16.62, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_13_retro_right_9512f7fb31", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/thumbnail_air_jordan_13_retro_right_9512f7fb31.webp", "hash": "thumbnail_air_jordan_13_retro_right_9512f7fb31", "mime": "image/webp", "name": "thumbnail_air-jordan-13-retro-right.webp", "path": null, "size": 1.26, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_13_retro_right_9512f7fb31", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:16:05.196Z", "updatedAt": "2023-05-03T17:16:05.196Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_13_retro_right_9512f7fb31", "resource_type": "image"}}}, {"id": 40, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134154/shoe-store/air_jordan_13_retro_left_c244eba9cc.webp", "hash": "air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "air-jordan-13-retro-left.webp", "size": 37.12, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134156/shoe-store/large_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "large_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "large_air-jordan-13-retro-left.webp", "path": null, "size": 27.03, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134166/shoe-store/small_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "small_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "small_air-jordan-13-retro-left.webp", "path": null, "size": 8.38, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/medium_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "medium_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "medium_air-jordan-13-retro-left.webp", "path": null, "size": 16.89, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134159/shoe-store/thumbnail_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "thumbnail_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "thumbnail_air-jordan-13-retro-left.webp", "path": null, "size": 1.46, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:16:05.767Z", "updatedAt": "2023-05-03T17:16:05.767Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}}]}, "subtitle": "Shoe", "createdAt": "2023-04-18T11:26:49.686Z", "thumbnail": {"data": {"id": 40, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134154/shoe-store/air_jordan_13_retro_left_c244eba9cc.webp", "hash": "air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "air-jordan-13-retro-left.webp", "size": 37.12, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134156/shoe-store/large_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "large_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "large_air-jordan-13-retro-left.webp", "path": null, "size": 27.03, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134166/shoe-store/small_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "small_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "small_air-jordan-13-retro-left.webp", "path": null, "size": 8.38, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134155/shoe-store/medium_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "medium_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "medium_air-jordan-13-retro-left.webp", "path": null, "size": 16.89, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134159/shoe-store/thumbnail_air_jordan_13_retro_left_c244eba9cc.webp", "hash": "thumbnail_air_jordan_13_retro_left_c244eba9cc", "mime": "image/webp", "name": "thumbnail_air-jordan-13-retro-left.webp", "path": null, "size": 1.46, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:16:05.767Z", "updatedAt": "2023-05-03T17:16:05.767Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_13_retro_left_c244eba9cc", "resource_type": "image"}}}}, "updatedAt": "2023-05-11T20:40:14.602Z", "categories": {"data": [{"id": 5, "attributes": {"slug": "shoes", "title": "Shoes", "createdAt": "2023-04-18T10:08:51.929Z", "updatedAt": "2023-05-11T20:39:24.711Z", "publishedAt": "2023-04-18T10:08:59.298Z"}}, {"id": 1, "attributes": {"slug": "jordan", "title": "Jordan", "createdAt": "2023-04-18T10:05:03.535Z", "updatedAt": "2023-04-18T10:05:11.393Z", "publishedAt": "2023-04-18T10:05:11.039Z"}}, {"id": 4, "attributes": {"slug": "running", "title": "Running", "createdAt": "2023-04-18T10:07:35.911Z", "updatedAt": "2023-04-18T10:07:50.170Z", "publishedAt": "2023-04-18T10:07:49.860Z"}}]}, "description": "The Air Jordan 13 Retro brings back the memorable game shoe that Michael Jordan wore during the '97╬ô├ç├┤98 season, all the way to his 6th championship title. All the classic details are there like the quilted overlay, iconic sculpted midsole and holographic eye.\\n\\n- Colour Shown: Black/White/True Red\\n- Style: 414571-062", "publishedAt": "2023-05-03T17:10:19.153Z", "original_price": null}, "selectedQty": 1, "selectedSize": "UK 8"}]	2023-05-14 20:40:35.856	2023-05-14 20:40:35.856	2023-05-14 20:40:35.852	\N	\N
7	cs_test_a1ylRRjDMZ8DXNMufKpAmSMksfnAfJ4QuLuhTnagerIyDIA99dycPvl3H8	[{"id": 8, "size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "air-jordan-1-retro-high-og", "price": 16995, "title": "Air Jordan 1 Retro High OG", "subtitle": "Men's Shoes", "thumbnail": {"data": {"id": 48, "attributes": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "air-jordan-1-retro-high-og-left.webp", "size": 33.16, "width": 864, "height": 1080, "caption": null, "formats": {"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134778/shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "large_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "large_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 24.1, "width": 800, "height": 1000, "provider_metadata": {"public_id": "shoe-store/large_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "small_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "small_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 8.39, "width": 400, "height": 500, "provider_metadata": {"public_id": "shoe-store/small_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "medium_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "medium_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 15.82, "width": 600, "height": 750, "provider_metadata": {"public_id": "shoe-store/medium_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134777/shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1.webp", "hash": "thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "mime": "image/webp", "name": "thumbnail_air-jordan-1-retro-high-og-left.webp", "path": null, "size": 1.64, "width": 125, "height": 156, "provider_metadata": {"public_id": "shoe-store/thumbnail_air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}, "provider": "cloudinary", "createdAt": "2023-05-03T17:26:17.288Z", "updatedAt": "2023-05-03T17:26:17.288Z", "previewUrl": null, "alternativeText": null, "provider_metadata": {"public_id": "shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1", "resource_type": "image"}}}}, "selectedQty": 1, "selectedSize": "UK 8"}]	2023-05-14 22:08:19.989	2023-05-14 22:08:19.989	2023-05-14 22:08:19.986	\N	\N
8	cs_test_a1MhnzhLUYMQ8D8796R46W7HyEaMclmW0Jv2iLm52ZZPpHUvbsOZEabFhI	[{"id": 8, "size": {"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}, "slug": "air-jordan-1-retro-high-og", "price": 16995, "title": "Air Jordan 1 Retro High OG", "subtitle": "Men's Shoes", "thumbnail": "https://res.cloudinary.com/dt2sfnsfc/image/upload/v1683134776/shoe-store/air_jordan_1_retro_high_og_left_509a9f34a1.webp", "selectedQty": 1, "selectedSize": "UK 8"}]	2023-05-14 22:34:10.373	2023-05-14 22:34:10.373	2023-05-14 22:34:10.368	\N	\N
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, title, subtitle, price, description, size, original_price, slug, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
2	Air Jordan XXXVII Low PF	Men's Basketball Shoes	16295.00	You've got the hops and the speed╬ô├ç├╢lace up in shoes that enhance what you bring to the court. The latest AJ is all about take-offs and landings, with multiple Air units to get you off the ground. The upper is made with strong, reinforced leno-weave fabric that'll keep you contained and leave your game uncompromised. This low-top model is designed for playing on outdoor courts.\n\n- Colour Shown: White/Siren Red/Black\n- Style: DQ4123-100	{"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}	\N	air-jordan-xxxvii-low-pf	2023-04-18 17:11:58.314	2023-05-06 22:21:47.064	2023-04-18 17:32:07.346	1	1
8	Air Jordan 1 Retro High OG	Men's Shoes	16995.00	3 + 1 = a whole new icon. Celebrating 35 years of the Air Jordan 3, these kicks combine the classic AJ1 silhouette with an original AJ3 colourway. Crafted to the '85 specs, it's got premium leather, a high-top collar and the woven tongue label you know and love. Bold splashes of True Blue throughout (check out the Wings logo) stand out against layers of white and Cement Grey. And the finishing touch? Nike Air cushioning underfoot lets you keep pace, so nothing holds you back from stepping out in style.\n\nColour Shown: True Blue/Cement Grey/White\nStyle: DZ5485-410	{"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}	\N	air-jordan-1-retro-high-og	2023-04-18 17:26:51.335	2023-05-03 23:26:35.435	2023-05-03 23:10:23.571	1	1
9	Air Jordan 1 Mid SE Craft	Men's Shoes	12295.00	Turn style on its head with this crafted take on the Air Jordan 1 Mid. Its "inside out"-inspired construction, including unique layering and exposed foam accents, ups the ante on this timeless Jordan Brand silhouette. Details like the deco stitching on the Swoosh add coveted appeal, while the unexpected shading, rich mixture of materials and aged midsole aesthetic give this release an artisan finish.\n\nColour Shown: Sail/Fossil Stone/Celestial Gold/Taupe Haze\nStyle: DM9652-102	{"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}	\N	air-jordan-1-mid-se-craft	2023-04-18 17:26:52.248	2023-05-04 03:23:25.555	2023-05-03 23:10:25.793	1	1
4	Jordan Stay Loyal 2	Men's Shoes Jordan	10295.00	Inspired by generations of Js, these kicks are a collage of cool. Design details recall decades of legendary shoes while paying homage to MJs storied career. Breathable mesh, sturdy leather and lightweight Air cushioning in the heel make it that much easier to walk in the footsteps of greatness.\n\n- Colour Shown: Black/Gym Red/White\n- Style: DQ8401-061	{"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}	\N	jordan-stay-loyal-2	2023-04-18 17:26:48.112	2023-05-06 22:21:54.204	2023-05-03 23:10:07.387	1	1
6	Air Jordan 13 Retro	Shoe	19295.00	The Air Jordan 13 Retro brings back the memorable game shoe that Michael Jordan wore during the '97╬ô├ç├┤98 season, all the way to his 6th championship title. All the classic details are there like the quilted overlay, iconic sculpted midsole and holographic eye.\n\n- Colour Shown: Black/White/True Red\n- Style: 414571-062	{"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}	\N	air-jordan-13-retro	2023-04-18 17:26:49.686	2023-05-12 02:40:14.602	2023-05-03 23:10:19.153	1	1
7	Air Jordan 6 Retro	Men's Shoes	18395.00	Be cool. Stay cool. The AJ-6 "Cool Grey" lets your style take flight with a colourway rooted to Jordan Brand DNA. MJ wore 'em when he claimed his first championship and you'll be wearing 'em for╬ô├ç├╢well, whatever you want. Laden with sleek features like dynamic design lines and an iced outsole, these sneakers bring speed and class to any 'fit. After all, they were famously inspired by Jordan's (wait for it) COOL sports car. So lace up and let your kicks do the rest.\n\n- Colour Shown: White/Cool Grey/Medium Grey\n- Style: CT8529-100	{"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}	\N	air-jordan-6-retro	2023-04-18 17:26:50.474	2023-05-06 22:22:29.917	2023-05-03 23:10:21.418	1	1
5	Jordan Delta 3 Low	Men's Shoes	12795.00	You can't help but look cool in low tops that meld high-end craft with high-tech features. Airy Ripstop and soft, synthetic suede pair with a smooth interior. The result? Classic low-top looks and the premium comfort you expect from Jordan Brand.\n- \n- Colour Shown: Sesame/Chambray\n- Style: DN2647-200	{"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}	\N	jordan-delta-3-low	2023-04-18 17:26:48.893	2023-05-06 23:06:23.345	2023-05-03 23:10:14.619	1	1
1	Air Jordan 1 Mid SE	Men's Shoes	12295.00	Every time the AJ1 gets a remake, you get the classic sneaker in new colours and textures for an exciting, revamped look but with all the familiar comforts you know. Premium materials and accents give modern expression to an all-time favourite.\n\n- Colour Shown: White/Black/Ice Blue\n- Style: DV1308-104	{"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}	20000.00	air-jordan-1-mid-se	2023-04-18 16:04:20.918	2023-05-06 23:06:56.385	2023-05-03 23:03:36.466	1	1
3	Jordan Why Not .6 PF	Men's Shoes	13995.00	Russell Westbrook's 6th signature shoe isΓÇöyou guessed itΓÇöall about speed. To get you goin' as fast as possible, we've wrapped the rubber out-sole nearly up to the mid-sole, so you're not gonna slip when you explode from 0 to 100. Added security comes from the interior bootie that keeps you strapped in as you jet across the court. It's all held together by an outer shroud and fastened with a zip collar that spells out Russell's signature question: "Why Not?"\n\n- Color Shown: Phantom/Rattan/Pale Ivory/Black\n- Style: DO7190-002	{"data": [{"size": "UK 6", "enabled": true}, {"size": "UK 6.5", "enabled": true}, {"size": "UK 7", "enabled": true}, {"size": "UK 7.5", "enabled": true}, {"size": "UK 8", "enabled": true}, {"size": "UK 8.5", "enabled": true}, {"size": "UK 9", "enabled": true}, {"size": "UK 9.5", "enabled": true}, {"size": "UK 10", "enabled": true}, {"size": "UK 10.5", "enabled": true}, {"size": "UK 11", "enabled": false}, {"size": "UK 11.5", "enabled": false}]}	\N	jordan-why-not-6-pf	2023-04-18 17:26:47.321	2023-05-12 02:39:55.778	2023-05-03 23:08:41.781	1	1
\.


--
-- Data for Name: products_categories_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_categories_links (id, product_id, category_id, category_order, product_order) FROM stdin;
25	1	3	1	2
1	2	6	1	1
7	4	6	1	2
17	7	6	1	3
19	8	6	1	4
22	9	6	1	5
27	5	5	3	8
28	2	5	2	7
29	1	5	2	6
6	4	5	2	1
15	7	5	2	3
18	8	5	2	4
21	9	5	2	5
26	3	5	2	9
30	3	2	3	1
3	3	4	1	1
13	6	1	2	1
14	6	5	1	2
31	6	4	3	3
2	2	1	1	1
8	4	1	1	2
16	7	1	1	4
20	8	1	1	5
23	9	1	1	6
9	5	3	1	1
24	5	4	2	2
\.


--
-- Data for Name: strapi-stripe_ss-payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."strapi-stripe_ss-payment" (id, txn_date, transaction_id, is_txn_successful, txn_message, txn_error_message, txn_amount, customer_name, customer_email, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi-stripe_ss-product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."strapi-stripe_ss-product" (id, title, slug, description, price, currency, is_subscription, "interval", trial_period_days, stripe_product_id, stripe_price_id, stripe_plan_id, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	shoe store		full-access	358e1fb43a14b4ec515b19805ba7909095978ac832dcc1c88cf3bba92b3d82a4db64f91b74dfb4caefd833c322119848f86f1f65b61bc345289abda19a3a641a	2023-05-14 22:48:31.699	\N	\N	2023-05-03 23:29:00.555	2023-05-14 22:48:31.699	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::admin::permission	{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::api-token	{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]}}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::user	{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
6	plugin_content_manager_configuration_content_types::admin::role	{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]}}	object	\N	\N
7	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"uid":"admin::transfer-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
15	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
16	plugin_upload_view_configuration	{"pageSize":100,"sort":"createdAt:DESC"}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"plugin::strapi-stripe.ss-product":{"info":{"tableName":"StripeProduct","singularName":"ss-product","pluralName":"ss-products","displayName":"Product","description":"Stripe Products","kind":"collectionType"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","min":1,"required":true,"configurable":false},"slug":{"type":"uid","targetField":"title","unique":true,"required":true,"configurable":false},"description":{"type":"text","min":1,"required":true,"configurable":false},"price":{"type":"decimal","required":true,"configurable":false},"currency":{"type":"string","min":1,"required":true,"configurable":false},"productImage":{"type":"media","required":true,"configurable":false},"isSubscription":{"type":"boolean","default":false,"configurable":false},"interval":{"type":"string","configurable":false},"trialPeriodDays":{"type":"integer","configurable":false},"stripeProductId":{"type":"string","min":3,"required":true,"configurable":false},"stripePriceId":{"type":"string","min":3,"configurable":false},"stripePlanId":{"type":"string","min":3,"configurable":false},"stripePayment":{"type":"relation","relation":"oneToMany","target":"plugin::strapi-stripe.ss-payment","mappedBy":"stripeProduct","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"tableName":"StripeProduct","singularName":"ss-product","pluralName":"ss-products","displayName":"Product","description":"Stripe Products","kind":"collectionType"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","min":1,"required":true,"configurable":false},"slug":{"type":"uid","targetField":"title","unique":true,"required":true,"configurable":false},"description":{"type":"text","min":1,"required":true,"configurable":false},"price":{"type":"decimal","required":true,"configurable":false},"currency":{"type":"string","min":1,"required":true,"configurable":false},"productImage":{"type":"media","required":true,"configurable":false},"isSubscription":{"type":"boolean","default":false,"configurable":false},"interval":{"type":"string","configurable":false},"trialPeriodDays":{"type":"integer","configurable":false},"stripeProductId":{"type":"string","min":3,"required":true,"configurable":false},"stripePriceId":{"type":"string","min":3,"configurable":false},"stripePlanId":{"type":"string","min":3,"configurable":false},"stripePayment":{"type":"relation","relation":"oneToMany","target":"plugin::strapi-stripe.ss-payment","mappedBy":"stripeProduct","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"ss-product","connection":"default","uid":"plugin::strapi-stripe.ss-product","plugin":"strapi-stripe","collectionName":"strapi-stripe_ss-product","globalId":"StrapiStripeSsProduct"},"plugin::strapi-stripe.ss-payment":{"info":{"tableName":"StripePayment","singularName":"ss-payment","pluralName":"ss-payments","displayName":"Payment","description":"Stripe Payment","kind":"collectionType"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"txnDate":{"type":"datetime","required":true,"configurable":false},"transactionId":{"type":"string","maxLength":250,"required":true,"configurable":false},"isTxnSuccessful":{"type":"boolean","default":false,"configurable":false},"txnMessage":{"type":"text","maxLength":5000,"configurable":false},"txnErrorMessage":{"type":"string","maxLength":250,"configurable":false},"txnAmount":{"type":"decimal","required":true,"configurable":false},"customerName":{"type":"string","required":true,"configurable":false},"customerEmail":{"type":"string","required":true,"configurable":false},"stripeProduct":{"type":"relation","relation":"manyToOne","target":"plugin::strapi-stripe.ss-product","inversedBy":"stripePayment","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"tableName":"StripePayment","singularName":"ss-payment","pluralName":"ss-payments","displayName":"Payment","description":"Stripe Payment","kind":"collectionType"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"txnDate":{"type":"datetime","required":true,"configurable":false},"transactionId":{"type":"string","maxLength":250,"required":true,"configurable":false},"isTxnSuccessful":{"type":"boolean","default":false,"configurable":false},"txnMessage":{"type":"text","maxLength":5000,"configurable":false},"txnErrorMessage":{"type":"string","maxLength":250,"configurable":false},"txnAmount":{"type":"decimal","required":true,"configurable":false},"customerName":{"type":"string","required":true,"configurable":false},"customerEmail":{"type":"string","required":true,"configurable":false},"stripeProduct":{"type":"relation","relation":"manyToOne","target":"plugin::strapi-stripe.ss-product","inversedBy":"stripePayment","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"ss-payment","connection":"default","uid":"plugin::strapi-stripe.ss-payment","plugin":"strapi-stripe","collectionName":"strapi-stripe_ss-payment","globalId":"StrapiStripeSsPayment"},"api::category.category":{"kind":"collectionType","collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title"},"products":{"type":"relation","relation":"manyToMany","target":"api::product.product","mappedBy":"categories"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title"},"products":{"type":"relation","relation":"manyToMany","target":"api::product.product","mappedBy":"categories"}},"kind":"collectionType"},"modelType":"contentType","modelName":"category","connection":"default","uid":"api::category.category","apiName":"category","globalId":"Category","actions":{},"lifecycles":{}},"api::order.order":{"kind":"collectionType","collectionName":"orders","info":{"singularName":"order","pluralName":"orders","displayName":"Order"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"stripe_id":{"type":"string","required":false},"products":{"type":"json"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"orders","info":{"singularName":"order","pluralName":"orders","displayName":"Order"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"stripe_id":{"type":"string","required":false},"products":{"type":"json"}},"kind":"collectionType"},"modelType":"contentType","modelName":"order","connection":"default","uid":"api::order.order","apiName":"order","globalId":"Order","actions":{},"lifecycles":{}},"api::product.product":{"kind":"collectionType","collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"Product","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"subtitle":{"type":"string"},"price":{"type":"decimal","required":true},"description":{"type":"richtext"},"size":{"type":"json"},"images":{"type":"media","multiple":true,"required":false,"allowedTypes":["images"]},"thumbnail":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"original_price":{"type":"decimal"},"slug":{"type":"uid","targetField":"title"},"categories":{"type":"relation","relation":"manyToMany","target":"api::category.category","inversedBy":"products"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"Product","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"subtitle":{"type":"string"},"price":{"type":"decimal","required":true},"description":{"type":"richtext"},"size":{"type":"json"},"images":{"type":"media","multiple":true,"required":false,"allowedTypes":["images"]},"thumbnail":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"original_price":{"type":"decimal"},"slug":{"type":"uid","targetField":"title"},"categories":{"type":"relation","relation":"manyToMany","target":"api::category.category","inversedBy":"products"}},"kind":"collectionType"},"modelType":"contentType","modelName":"product","connection":"default","uid":"api::product.product","apiName":"product","globalId":"Product","actions":{},"lifecycles":{}}}	object	\N	\N
17	plugin_upload_metrics	{"weeklySchedule":"20 51 15 * * 4","lastWeeklyUpdate":1683798680014}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::upload.file	{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]}}	object	\N	\N
21	plugin_i18n_default_locale	"en"	string	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]}}	object	\N	\N
11	plugin_content_manager_configuration_content_types::admin::transfer-token	{"uid":"admin::transfer-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]}}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]}}	object	\N	\N
13	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]}}	object	\N	\N
22	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null}}	object	\N	\N
14	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object	\N	\N
18	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]}}	object	\N	\N
19	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don╬ô├ç├ût worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
20	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
25	plugin_content_manager_configuration_content_types::api::order.order	{"uid":"api::order.order","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"stripe_id","defaultSortBy":"stripe_id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"stripe_id":{"edit":{"label":"stripe_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"stripe_id","searchable":true,"sortable":true}},"products":{"edit":{"label":"products","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"products","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","stripe_id","createdAt","updatedAt"],"edit":[[{"name":"stripe_id","size":6}],[{"name":"products","size":12}]]}}	object	\N	\N
24	plugin_content_manager_configuration_content_types::api::category.category	{"uid":"api::category.category","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"products":{"edit":{"label":"products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"products","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","products"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"products","size":6}]]}}	object	\N	\N
23	plugin_content_manager_configuration_content_types::api::product.product	{"uid":"api::product.product","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"subtitle":{"edit":{"label":"subtitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subtitle","searchable":true,"sortable":true}},"price":{"edit":{"label":"price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"price","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":false,"sortable":false}},"images":{"edit":{"label":"images","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"images","searchable":false,"sortable":false}},"thumbnail":{"edit":{"label":"thumbnail","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"thumbnail","searchable":false,"sortable":false}},"original_price":{"edit":{"label":"original_price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"original_price","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"categories":{"edit":{"label":"categories","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"categories","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6},{"name":"subtitle","size":6}],[{"name":"price","size":4},{"name":"original_price","size":4}],[{"name":"description","size":12}],[{"name":"size","size":12}],[{"name":"images","size":6},{"name":"thumbnail","size":6}],[{"name":"slug","size":6},{"name":"categories","size":6}]],"list":["thumbnail","id","title","price","categories"]}}	object	\N	\N
26	plugin_content_manager_configuration_content_types::plugin::strapi-stripe.ss-product	{"uid":"plugin::strapi-stripe.ss-product","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"price":{"edit":{"label":"price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"price","searchable":true,"sortable":true}},"currency":{"edit":{"label":"currency","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"currency","searchable":true,"sortable":true}},"productImage":{"edit":{"label":"productImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"productImage","searchable":false,"sortable":false}},"isSubscription":{"edit":{"label":"isSubscription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isSubscription","searchable":true,"sortable":true}},"interval":{"edit":{"label":"interval","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"interval","searchable":true,"sortable":true}},"trialPeriodDays":{"edit":{"label":"trialPeriodDays","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"trialPeriodDays","searchable":true,"sortable":true}},"stripeProductId":{"edit":{"label":"stripeProductId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"stripeProductId","searchable":true,"sortable":true}},"stripePriceId":{"edit":{"label":"stripePriceId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"stripePriceId","searchable":true,"sortable":true}},"stripePlanId":{"edit":{"label":"stripePlanId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"stripePlanId","searchable":true,"sortable":true}},"stripePayment":{"edit":{"label":"stripePayment","description":"","placeholder":"","visible":true,"editable":true,"mainField":"transactionId"},"list":{"label":"stripePayment","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","description"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"description","size":6},{"name":"price","size":4}],[{"name":"currency","size":6},{"name":"productImage","size":6}],[{"name":"isSubscription","size":4},{"name":"interval","size":6}],[{"name":"trialPeriodDays","size":4},{"name":"stripeProductId","size":6}],[{"name":"stripePriceId","size":6},{"name":"stripePlanId","size":6}],[{"name":"stripePayment","size":6}]]}}	object	\N	\N
27	plugin_content_manager_configuration_content_types::plugin::strapi-stripe.ss-payment	{"uid":"plugin::strapi-stripe.ss-payment","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"transactionId","defaultSortBy":"transactionId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"txnDate":{"edit":{"label":"txnDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"txnDate","searchable":true,"sortable":true}},"transactionId":{"edit":{"label":"transactionId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"transactionId","searchable":true,"sortable":true}},"isTxnSuccessful":{"edit":{"label":"isTxnSuccessful","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isTxnSuccessful","searchable":true,"sortable":true}},"txnMessage":{"edit":{"label":"txnMessage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"txnMessage","searchable":true,"sortable":true}},"txnErrorMessage":{"edit":{"label":"txnErrorMessage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"txnErrorMessage","searchable":true,"sortable":true}},"txnAmount":{"edit":{"label":"txnAmount","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"txnAmount","searchable":true,"sortable":true}},"customerName":{"edit":{"label":"customerName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customerName","searchable":true,"sortable":true}},"customerEmail":{"edit":{"label":"customerEmail","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customerEmail","searchable":true,"sortable":true}},"stripeProduct":{"edit":{"label":"stripeProduct","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"stripeProduct","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","txnDate","transactionId","isTxnSuccessful"],"edit":[[{"name":"txnDate","size":6},{"name":"transactionId","size":6}],[{"name":"isTxnSuccessful","size":4},{"name":"txnMessage","size":6}],[{"name":"txnErrorMessage","size":6},{"name":"txnAmount","size":4}],[{"name":"customerName","size":6},{"name":"customerEmail","size":6}],[{"name":"stripeProduct","size":6}]]}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
8	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi-stripe_ss-product","indexes":[{"type":"unique","name":"strapi-stripe_ss-product_slug_unique","columns":["slug"]},{"name":"strapi-stripe_ss-product_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi-stripe_ss-product_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi-stripe_ss-product_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi-stripe_ss-product_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"currency","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_subscription","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"interval","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"trial_period_days","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"stripe_product_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"stripe_price_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"stripe_plan_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi-stripe_ss-payment","indexes":[{"name":"strapi-stripe_ss-payment_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi-stripe_ss-payment_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi-stripe_ss-payment_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi-stripe_ss-payment_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"txn_date","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"transaction_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_txn_successful","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"txn_message","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"txn_error_message","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"txn_amount","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"customer_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"customer_email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"categories","indexes":[{"type":"unique","name":"categories_slug_unique","columns":["slug"]},{"name":"categories_created_by_id_fk","columns":["created_by_id"]},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"orders","indexes":[{"name":"orders_created_by_id_fk","columns":["created_by_id"]},{"name":"orders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"orders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"orders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"stripe_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"products","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products","indexes":[{"type":"unique","name":"products_slug_unique","columns":["slug"]},{"name":"products_created_by_id_fk","columns":["created_by_id"]},{"name":"products_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"products_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"products_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subtitle","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"original_price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"],"type":null},{"name":"files_related_morphs_id_column_index","columns":["related_id"],"type":null}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_stripe_ss_payment_stripe_product_links","indexes":[{"name":"strapi_stripe_ss_payment_stripe_product_links_fk","columns":["ss_payment_id"]},{"name":"strapi_stripe_ss_payment_stripe_product_links_inv_fk","columns":["ss_product_id"]},{"name":"strapi_stripe_ss_payment_stripe_product_links_unique","columns":["ss_payment_id","ss_product_id"],"type":"unique"},{"name":"strapi_stripe_ss_payment_stripe_product_links_order_inv_fk","columns":["ss_payment_order"]}],"foreignKeys":[{"name":"strapi_stripe_ss_payment_stripe_product_links_fk","columns":["ss_payment_id"],"referencedColumns":["id"],"referencedTable":"strapi-stripe_ss-payment","onDelete":"CASCADE"},{"name":"strapi_stripe_ss_payment_stripe_product_links_inv_fk","columns":["ss_product_id"],"referencedColumns":["id"],"referencedTable":"strapi-stripe_ss-product","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"ss_payment_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"ss_product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"ss_payment_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products_categories_links","indexes":[{"name":"products_categories_links_fk","columns":["product_id"]},{"name":"products_categories_links_inv_fk","columns":["category_id"]},{"name":"products_categories_links_unique","columns":["product_id","category_id"],"type":"unique"},{"name":"products_categories_links_order_fk","columns":["category_order"]},{"name":"products_categories_links_order_inv_fk","columns":["product_order"]}],"foreignKeys":[{"name":"products_categories_links_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"},{"name":"products_categories_links_inv_fk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2023-05-12 04:22:04.351	461c7eb780a67098718907f018d42c26
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_stripe_ss_payment_stripe_product_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_stripe_ss_payment_stripe_product_links (id, ss_payment_id, ss_product_id, ss_payment_order) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions_token_links (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_tokens (id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
2	plugin::users-permissions.user.me	2023-05-03 14:20:47.786	2023-05-03 14:20:47.786	\N	\N
1	plugin::users-permissions.auth.changePassword	2023-05-03 14:20:47.786	2023-05-03 14:20:47.786	\N	\N
3	plugin::users-permissions.auth.connect	2023-05-03 14:20:48.796	2023-05-03 14:20:48.796	\N	\N
9	plugin::users-permissions.auth.callback	2023-05-03 14:20:48.796	2023-05-03 14:20:48.796	\N	\N
4	plugin::users-permissions.auth.sendEmailConfirmation	2023-05-03 14:20:48.796	2023-05-03 14:20:48.796	\N	\N
8	plugin::users-permissions.auth.register	2023-05-03 14:20:48.796	2023-05-03 14:20:48.796	\N	\N
7	plugin::users-permissions.auth.forgotPassword	2023-05-03 14:20:48.796	2023-05-03 14:20:48.796	\N	\N
5	plugin::users-permissions.auth.resetPassword	2023-05-03 14:20:48.796	2023-05-03 14:20:48.796	\N	\N
6	plugin::users-permissions.auth.emailConfirmation	2023-05-03 14:20:48.796	2023-05-03 14:20:48.796	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	1	1
2	2	1	1
3	9	2	1
4	3	2	1
5	6	2	1
6	5	2	1
7	8	2	1
9	7	2	1
8	4	2	1
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated	2023-05-03 14:20:46.212	2023-05-03 14:20:46.212	\N	\N
2	Public	Default role given to unauthenticated user.	public	2023-05-03 14:20:46.823	2023-05-03 14:20:46.823	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 99, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 99, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 52, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 169, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 8, true);


--
-- Name: products_categories_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_categories_links_id_seq', 31, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 2, true);


--
-- Name: strapi-stripe_ss-payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."strapi-stripe_ss-payment_id_seq"', 1, false);


--
-- Name: strapi-stripe_ss-product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."strapi-stripe_ss-product_id_seq"', 1, false);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 27, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 8, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_stripe_ss_payment_stripe_product_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_stripe_ss_payment_stripe_product_links_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 9, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 9, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, false);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_unique UNIQUE (slug);


--
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products_categories_links products_categories_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_pkey PRIMARY KEY (id);


--
-- Name: products_categories_links products_categories_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_unique UNIQUE (product_id, category_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_unique UNIQUE (slug);


--
-- Name: strapi-stripe_ss-payment strapi-stripe_ss-payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_ss-payment"
    ADD CONSTRAINT "strapi-stripe_ss-payment_pkey" PRIMARY KEY (id);


--
-- Name: strapi-stripe_ss-product strapi-stripe_ss-product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_ss-product"
    ADD CONSTRAINT "strapi-stripe_ss-product_pkey" PRIMARY KEY (id);


--
-- Name: strapi-stripe_ss-product strapi-stripe_ss-product_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_ss-product"
    ADD CONSTRAINT "strapi-stripe_ss-product_slug_unique" UNIQUE (slug);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_stripe_ss_payment_stripe_product_links strapi_stripe_ss_payment_stripe_product_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_stripe_ss_payment_stripe_product_links
    ADD CONSTRAINT strapi_stripe_ss_payment_stripe_product_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_stripe_ss_payment_stripe_product_links strapi_stripe_ss_payment_stripe_product_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_stripe_ss_payment_stripe_product_links
    ADD CONSTRAINT strapi_stripe_ss_payment_stripe_product_links_unique UNIQUE (ss_payment_id, ss_product_id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_created_by_id_fk ON public.categories USING btree (created_by_id);


--
-- Name: categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_updated_by_id_fk ON public.categories USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_related_morphs_id_column_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_id_column_index ON public.files_related_morphs USING btree (related_id);


--
-- Name: files_related_morphs_order_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_order_index ON public.files_related_morphs USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: orders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_created_by_id_fk ON public.orders USING btree (created_by_id);


--
-- Name: orders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_updated_by_id_fk ON public.orders USING btree (updated_by_id);


--
-- Name: products_categories_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_categories_links_fk ON public.products_categories_links USING btree (product_id);


--
-- Name: products_categories_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_categories_links_inv_fk ON public.products_categories_links USING btree (category_id);


--
-- Name: products_categories_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_categories_links_order_fk ON public.products_categories_links USING btree (category_order);


--
-- Name: products_categories_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_categories_links_order_inv_fk ON public.products_categories_links USING btree (product_order);


--
-- Name: products_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_created_by_id_fk ON public.products USING btree (created_by_id);


--
-- Name: products_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_updated_by_id_fk ON public.products USING btree (updated_by_id);


--
-- Name: strapi-stripe_ss-payment_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "strapi-stripe_ss-payment_created_by_id_fk" ON public."strapi-stripe_ss-payment" USING btree (created_by_id);


--
-- Name: strapi-stripe_ss-payment_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "strapi-stripe_ss-payment_updated_by_id_fk" ON public."strapi-stripe_ss-payment" USING btree (updated_by_id);


--
-- Name: strapi-stripe_ss-product_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "strapi-stripe_ss-product_created_by_id_fk" ON public."strapi-stripe_ss-product" USING btree (created_by_id);


--
-- Name: strapi-stripe_ss-product_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "strapi-stripe_ss-product_updated_by_id_fk" ON public."strapi-stripe_ss-product" USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_stripe_ss_payment_stripe_product_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_stripe_ss_payment_stripe_product_links_fk ON public.strapi_stripe_ss_payment_stripe_product_links USING btree (ss_payment_id);


--
-- Name: strapi_stripe_ss_payment_stripe_product_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_stripe_ss_payment_stripe_product_links_inv_fk ON public.strapi_stripe_ss_payment_stripe_product_links USING btree (ss_product_id);


--
-- Name: strapi_stripe_ss_payment_stripe_product_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_stripe_ss_payment_stripe_product_links_order_inv_fk ON public.strapi_stripe_ss_payment_stripe_product_links USING btree (ss_payment_order);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: orders orders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: orders orders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products_categories_links products_categories_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_categories_links products_categories_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_inv_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: products products_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products products_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi-stripe_ss-payment strapi-stripe_ss-payment_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_ss-payment"
    ADD CONSTRAINT "strapi-stripe_ss-payment_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi-stripe_ss-payment strapi-stripe_ss-payment_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_ss-payment"
    ADD CONSTRAINT "strapi-stripe_ss-payment_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi-stripe_ss-product strapi-stripe_ss-product_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_ss-product"
    ADD CONSTRAINT "strapi-stripe_ss-product_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi-stripe_ss-product strapi-stripe_ss-product_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."strapi-stripe_ss-product"
    ADD CONSTRAINT "strapi-stripe_ss-product_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_stripe_ss_payment_stripe_product_links strapi_stripe_ss_payment_stripe_product_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_stripe_ss_payment_stripe_product_links
    ADD CONSTRAINT strapi_stripe_ss_payment_stripe_product_links_fk FOREIGN KEY (ss_payment_id) REFERENCES public."strapi-stripe_ss-payment"(id) ON DELETE CASCADE;


--
-- Name: strapi_stripe_ss_payment_stripe_product_links strapi_stripe_ss_payment_stripe_product_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_stripe_ss_payment_stripe_product_links
    ADD CONSTRAINT strapi_stripe_ss_payment_stripe_product_links_inv_fk FOREIGN KEY (ss_product_id) REFERENCES public."strapi-stripe_ss-product"(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

