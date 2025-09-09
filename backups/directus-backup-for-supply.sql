--
-- PostgreSQL database dump
--

\restrict SCGEh4ESKYsBuPlwCbhAe1ChQbNFbp8eMYEPW2Szf3okna8XKPbdpbiWSz1KbzV

-- Dumped from database version 15.14 (Debian 15.14-1.pgdg13+1)
-- Dumped by pg_dump version 15.14 (Debian 15.14-1.pgdg13+1)

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

DROP DATABASE IF EXISTS directus;
--
-- Name: directus; Type: DATABASE; Schema: -; Owner: -
--

-- CREATE DATABASE directus WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


\unrestrict SCGEh4ESKYsBuPlwCbhAe1ChQbNFbp8eMYEPW2Szf3okna8XKPbdpbiWSz1KbzV
\connect directus
\restrict SCGEh4ESKYsBuPlwCbhAe1ChQbNFbp8eMYEPW2Szf3okna8XKPbdpbiWSz1KbzV

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
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Map_Cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Map_Cities" (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    parent integer,
    location public.geometry(Point,4326),
    "Name" character varying(255)
);


--
-- Name: Map_Cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Map_Cities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Map_Cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Map_Cities_id_seq" OWNED BY public."Map_Cities".id;


--
-- Name: Trust_Logo_Images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Trust_Logo_Images" (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    section integer,
    "Logo_Image" uuid,
    href character varying(255),
    "Label" character varying(255)
);


--
-- Name: Trust_Logo_Images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Trust_Logo_Images_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Trust_Logo_Images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Trust_Logo_Images_id_seq" OWNED BY public."Trust_Logo_Images".id;


--
-- Name: Trust_Logo_Images_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Trust_Logo_Images_translations" (
    id integer NOT NULL,
    "Trust_Logo_Images_id" integer,
    languages_code character varying(255),
    alt_text character varying(255)
);


--
-- Name: Trust_Logo_Images_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Trust_Logo_Images_translations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Trust_Logo_Images_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Trust_Logo_Images_translations_id_seq" OWNED BY public."Trust_Logo_Images_translations".id;


--
-- Name: Trust_Logos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Trust_Logos" (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    is_monochrome boolean DEFAULT true,
    "Monochrome_Color" character varying(255),
    "Enable_Links" boolean DEFAULT true,
    scroll_logos boolean DEFAULT true,
    scroll_speed real DEFAULT '30'::real
);


--
-- Name: Trust_Logos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Trust_Logos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Trust_Logos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Trust_Logos_id_seq" OWNED BY public."Trust_Logos".id;


--
-- Name: Trust_Logos_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Trust_Logos_translations" (
    id integer NOT NULL,
    "Trust_Logos_id" integer,
    languages_code character varying(255),
    "Intro_Text" character varying(255)
);


--
-- Name: Trust_Logos_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Trust_Logos_translations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Trust_Logos_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Trust_Logos_translations_id_seq" OWNED BY public."Trust_Logos_translations".id;


--
-- Name: company; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    logo uuid,
    name text,
    favicon uuid,
    "useFaviconInHeader" boolean DEFAULT false
);


--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.company_id_seq OWNED BY public.company.id;


--
-- Name: company_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company_translations (
    id integer NOT NULL,
    company_id integer,
    languages_code character varying(255),
    tagline text,
    "SEO_Meta_Title_Append" text
);


--
-- Name: company_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.company_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: company_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.company_translations_id_seq OWNED BY public.company_translations.id;


--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    visual_editor_urls json,
    accepted_terms boolean DEFAULT false,
    project_id uuid
);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json,
    text_direction character varying(255) DEFAULT 'auto'::character varying NOT NULL
);


--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: hero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hero (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone
);


--
-- Name: hero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hero_id_seq OWNED BY public.hero.id;


--
-- Name: hero_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hero_translations (
    id integer NOT NULL,
    hero_id integer,
    languages_code character varying(255),
    supporting_text text,
    heading text,
    "CTA" text,
    "CTA2" text,
    heading_highlighted text,
    supporting_text2 text
);


--
-- Name: hero_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hero_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hero_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hero_translations_id_seq OWNED BY public.hero_translations.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.languages (
    code character varying(255) NOT NULL,
    name character varying(255),
    direction character varying(255) DEFAULT 'ltr'::character varying
);


--
-- Name: map_animation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.map_animation (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    start integer,
    "Name" character varying(255),
    hero integer
);


--
-- Name: map_animation_Map_Cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."map_animation_Map_Cities" (
    id integer NOT NULL,
    map_animation_id integer,
    "Map_Cities_id" integer
);


--
-- Name: map_animation_Map_Cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."map_animation_Map_Cities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: map_animation_Map_Cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."map_animation_Map_Cities_id_seq" OWNED BY public."map_animation_Map_Cities".id;


--
-- Name: map_animation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.map_animation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: map_animation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.map_animation_id_seq OWNED BY public.map_animation.id;


--
-- Name: navigation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.navigation (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    location character varying(255) DEFAULT 'header'::character varying,
    href text,
    "isButton" boolean DEFAULT false,
    icon character varying(255),
    parent integer
);


--
-- Name: navigation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.navigation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: navigation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.navigation_id_seq OWNED BY public.navigation.id;


--
-- Name: navigation_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.navigation_translations (
    id integer NOT NULL,
    navigation_id integer,
    languages_code character varying(255),
    label character varying(255),
    description text
);


--
-- Name: navigation_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.navigation_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: navigation_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.navigation_translations_id_seq OWNED BY public.navigation_translations.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id uuid NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    slug text,
    hero_image uuid
);


--
-- Name: pages_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_translations (
    id integer NOT NULL,
    pages_id uuid,
    languages_code character varying(255),
    title text,
    hero_title text,
    hero_subtitle text,
    body text
);


--
-- Name: pages_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_translations_id_seq OWNED BY public.pages_translations.id;


--
-- Name: Map_Cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Map_Cities" ALTER COLUMN id SET DEFAULT nextval('public."Map_Cities_id_seq"'::regclass);


--
-- Name: Trust_Logo_Images id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logo_Images" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logo_Images_id_seq"'::regclass);


--
-- Name: Trust_Logo_Images_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logo_Images_translations" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logo_Images_translations_id_seq"'::regclass);


--
-- Name: Trust_Logos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logos" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logos_id_seq"'::regclass);


--
-- Name: Trust_Logos_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logos_translations" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logos_translations_id_seq"'::regclass);


--
-- Name: company id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);


--
-- Name: company_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_translations ALTER COLUMN id SET DEFAULT nextval('public.company_translations_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: hero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero ALTER COLUMN id SET DEFAULT nextval('public.hero_id_seq'::regclass);


--
-- Name: hero_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero_translations ALTER COLUMN id SET DEFAULT nextval('public.hero_translations_id_seq'::regclass);


--
-- Name: map_animation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.map_animation ALTER COLUMN id SET DEFAULT nextval('public.map_animation_id_seq'::regclass);


--
-- Name: map_animation_Map_Cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."map_animation_Map_Cities" ALTER COLUMN id SET DEFAULT nextval('public."map_animation_Map_Cities_id_seq"'::regclass);


--
-- Name: navigation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.navigation ALTER COLUMN id SET DEFAULT nextval('public.navigation_id_seq'::regclass);


--
-- Name: navigation_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.navigation_translations ALTER COLUMN id SET DEFAULT nextval('public.navigation_translations_id_seq'::regclass);


--
-- Name: pages_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_translations ALTER COLUMN id SET DEFAULT nextval('public.pages_translations_id_seq'::regclass);


--
-- Data for Name: Map_Cities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Map_Cities" (id, status, sort, user_created, date_created, user_updated, date_updated, parent, location, "Name") FROM stdin;
1	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:19:43.63-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:21:26.882-04	1	0101000020E6100000C8864AE474C354C0B021537C682D4540	Detroit
2	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:23:11.371-04	\N	\N	1	0101000020E610000000781F8C6455C2BFE4ADC90FACC14940	London
3	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:38.858-04	\N	\N	1	0101000020E6100000540FC39A687961404C610443C5DA4140	Tokyo
4	draft	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:38.862-04	\N	\N	1	0101000020E61000008070BD9A6F980340505ECCB75D6B1940	Cotonou
5	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:38.866-04	\N	\N	1	0101000020E610000078CFDCE9BC885C4084E1ABABAA4A3640	Hong Kong
6	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:38.871-04	\N	\N	1	0101000020E6100000DCC98F2BBB6047C00026DEC255BE37C0	São Paulo
7	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:27:34.376-04	\N	\N	1	0101000020E61000004C9B65A022DD624049AE4B9E88E140C0	Sydney
8	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:28:29.353-04	\N	\N	1	0101000020E6100000E52EACD3467B52C010B90EAD58624440	New York
9	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:28:29.357-04	\N	\N	1	0101000020E61000003053D6296E955EC0EC95EBE9DCC74740	Seattle
10	draft	\N	\N	\N	\N	\N	\N	0101000020E610000033333333333301C03333333333934C40	Aberdeen
11	draft	\N	\N	\N	\N	\N	\N	0101000020E61000003333333333536140211FF46C567541C0	Adelaide
12	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000000840DFE00B93A96A4240	Algiers
13	draft	\N	\N	\N	\N	\N	\N	0101000020E61000002A3A92CB7F881340BBB88D06F02E4A40	Amsterdam
14	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000211FF46C56754040211FF46C56F54340	Ankara
15	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000211FF46C56D54CC000000000004039C0	Asunción
16	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000F0BB5A679B7374088855AD3BCFB4240	Athens
17	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000D86540BBB88D06F06E42C0	Auckland
18	draft	\N	\N	\N	\N	\N	\N	0101000020E610000000000000002059400000000000802B40	Bangkok
19	draft	\N	\N	\N	\N	\N	\N	0101000020E61000003333333333330140454772F90FB14440	Barcelona
20	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000910F7A36AB1A5D40211FF46C56F54340	Beijing
21	draft	\N	\N	\N	\N	\N	\N	0101000020E610000012143FC6DC3D48C0F2B0506B9A77F7BF	Belém
22	draft	\N	\N	\N	\N	\N	\N	0101000020E61000005D6DC5FEB2BB17C0BBB88D06F04E4B40	Belfast
23	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000F1F44A5986883440BBB88D06F06E4640	Belgrade
24	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000857CD0B359D52A400000000000404A40	Berlin
25	draft	\N	\N	\N	\N	\N	\N	0101000020E610000026E4839ECDAAFEBF211FF46C56354A40	Birmingham
26	draft	\N	\N	\N	\N	\N	\N	0101000020E610000000000000009052C0C3D32B6519221240	Bogotá
27	draft	\N	\N	\N	\N	\N	\N	0101000020E610000033333333333352400000000000003340	Bombay
28	draft	\N	\N	\N	\N	\N	\N	0101000020E61000007FFB3A70CE88E0BFDFE00B93A96A4640	Bordeaux
29	draft	\N	\N	\N	\N	\N	\N	0101000020E610000052499D8026A22140DFE00B93A98A4A40	Bremen
30	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000D1915CFE4324634024287E8CB97B3BC0	Brisbane
31	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000ED0DBE3099AA04C088855AD3BCBB4940	Bristol
32	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000D6C56D3480771140BBB88D06F06E4940	Brussels
33	draft	\N	\N	\N	\N	\N	\N	0101000020E610000076711B0DE01D3A40211FF46C56354640	Bucharest
34	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000BEC11726531533400000000000C04740	Budapest
35	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000BBB88D06F02E4DC0DFE00B93A94A41C0	Buenos Aires
36	draft	\N	\N	\N	\N	\N	\N	0101000020E61000009A99999999593F40F1F44A5986083E40	Cairo
37	draft	\N	\N	\N	\N	\N	\N	0101000020E61000009A99999999195640A9A44E4013913640	Calcutta
38	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000505C4076711B0DE01D3740	Canton
39	draft	\N	\N	\N	\N	\N	\N	0101000020E610000076711B0DE05D3240211FF46C56F540C0	Cape Town
40	draft	\N	\N	\N	\N	\N	\N	0101000020E61000003CBD529621C250C01E166A4DF3EE2440	Caracas
41	draft	\N	\N	\N	\N	\N	\N	0101000020E61000006666666666264AC0A3923A014D441340	Cayenne
42	draft	\N	\N	\N	\N	\N	\N	0101000020E61000006FF085C954855AC076711B0DE09D3C40	Chihuahua
43	draft	\N	\N	\N	\N	\N	\N	0101000020E61000002AA913D044A45A40DCD7817346C43D40	Chongqing
44	draft	\N	\N	\N	\N	\N	\N	0101000020E610000052499D8026222940211FF46C56D54B40	Copenhagen
45	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000910F7A36AB0A50C00F0BB5A679773FC0	Córdoba
46	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000F0BB5A6797731C0857CD0B359552D40	Dakar
47	draft	\N	\N	\N	\N	\N	\N	0101000020E610000033333333335B60401E166A4DF3EE28C0	Darwin
48	draft	\N	\N	\N	\N	\N	\N	0101000020E610000066666666668645400000000000002740	Djibouti
49	draft	\N	\N	\N	\N	\N	\N	0101000020E610000000000000000019C0DFE00B93A9AA4A40	Dublin
50	draft	\N	\N	\N	\N	\N	\N	0101000020E61000008A8EE4F21FE23E408A8EE4F21FE23DC0	Durban
51	draft	\N	\N	\N	\N	\N	\N	0101000020E610000013F241CF665509C0211FF46C56F54B40	Edinburgh
52	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000AEB6627FD95D2140BBB88D06F00E4940	Frankfurt
53	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000204DC00000000000001B40	Georgetown
54	draft	\N	\N	\N	\N	\N	\N	0101000020E610000000000000000011C0DFE00B93A9EA4B40	Glasgow
55	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000F775E09C11A156C0EBE2361AC03B2D40	Guatemala City
56	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000D656EC2FBBFB53C013F241CF665501C0	Guayaquil
57	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000E2E995B20C1124406666666666C64A40	Hamburg
58	draft	\N	\N	\N	\N	\N	\N	0101000020E61000008A8EE4F21FA23740A323B9FC87A85140	Hammerfest
59	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000A323B9FC879854C08A8EE4F21F223740	Havana
60	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000003940211FF46C56154E40	Helsinki
61	draft	\N	\N	\N	\N	\N	\N	0101000020E610000095D40968226A6240BBB88D06F06E45C0	Hobart
62	draft	\N	\N	\N	\N	\N	\N	0101000020E61000005DDC4603788751C0423EE8D9AC2A34C0	Iquique
63	draft	\N	\N	\N	\N	\N	\N	0101000020E61000006FF085C954155A400000000000404A40	Irkutsk
64	draft	\N	\N	\N	\N	\N	\N	0101000020E61000003333333333B35A40705F07CE191119C0	Jakarta
65	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000A9A44E4013113C403333333333333AC0	Johannesburg
66	draft	\N	\N	\N	\N	\N	\N	0101000020E61000002AA913D0443453C024287E8CB9FB3140	Kingston
67	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000E2E995B20C912E4033333333333311C0	Kinshasa
68	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000CDCCCCCCCC6C594054742497FF100940	Kuala Lumpur
69	draft	\N	\N	\N	\N	\N	\N	0101000020E61000005DDC4603781751C033333333337330C0	La Paz
70	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000000000000000F8BF0000000000E04A40	Leeds
71	draft	\N	\N	\N	\N	\N	\N	0101000020E61000003CBD5296214253C000000000000028C0	Lima
72	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000CDCCCCCCCC4C22C012143FC6DC5D4340	Lisbon
73	draft	\N	\N	\N	\N	\N	\N	0101000020E610000000000000000008C0211FF46C56B54A40	Liverpool
74	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000F7065F984C5513400000000000E04640	Lyons
75	draft	\N	\N	\N	\N	\N	\N	0101000020E61000009A99999999990DC0ACADD85F76374440	Madrid
76	draft	\N	\N	\N	\N	\N	\N	0101000020E610000000000000000002C00000000000C04A40	Manchester
77	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000CDCCCCCCCC3C5E407B832F4CA62A2D40	Manila
78	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000F7065F984C551540DFE00B93A9AA4540	Marseilles
79	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000910F7A36AB9A5AC03333333333333740	Mazatlán
80	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000E0434024287E8CB97B3540	Mecca
81	draft	\N	\N	\N	\N	\N	\N	0101000020E610000062A1D634EF1E6240787AA52C43E442C0	Melbourne
82	draft	\N	\N	\N	\N	\N	\N	0101000020E61000005DDC460378C758C0575BB1BFEC6E3340	Mexico City
83	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000857CD0B3595522409A99999999B94640	Milan
84	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000211FF46C56154CC0454772F90F7141C0	Montevideo
85	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000CDCCCCCCCCCC42400000000000E04B40	Moscow
86	draft	\N	\N	\N	\N	\N	\N	0101000020E61000007B832F4CA62A2740454772F90F114840	Munich
87	draft	\N	\N	\N	\N	\N	\N	0101000020E610000066666666663E60406666666666664040	Nagasaki
88	draft	\N	\N	\N	\N	\N	\N	0101000020E61000006B2BF697DD1D6140BBB88D06F08E4140	Nagoya
89	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000211FF46C5675424026E4839ECDAAF6BF	Nairobi
90	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000A323B9FC87B85D406666666666064040	Nanjing
91	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000802C40DFE00B93A96A4440	Naples
92	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000CDCCCCCCCC4C5340BEC1172653953C40	New Delhi
93	draft	\N	\N	\N	\N	\N	\N	0101000020E61000005917B7D100DEF9BF88855AD3BC7B4B40	Newcastle-on-Tyne
94	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000CDCCCCCCCCCC3E409A99999999394740	Odessa
95	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000F06040787AA52C43444140	Osaka
96	draft	\N	\N	\N	\N	\N	\N	0101000020E610000066666666666625409A99999999F94D40	Oslo
97	draft	\N	\N	\N	\N	\N	\N	0101000020E61000003CBD529621E253C01E166A4DF3EE2140	Panama City
98	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000A04BC00000000000001740	Paramaribo
99	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000ED0DBE3099AA02406666666666664840	Paris
100	draft	\N	\N	\N	\N	\N	\N	0101000020E61000005DDC460378F75C403333333333F33FC0	Perth
101	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000F7065F984C5510C0211FF46C56354940	Plymouth
102	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000D1915CFE43646240857CD0B359D522C0	Port Moresby
103	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000AEB6627FD9DD2C40DFE00B93A90A4940	Prague
104	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000005840BEC1172653D53040	Rangoon
105	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000F0BB5A679F735C02AA913D044045040	Reykjavík
106	draft	\N	\N	\N	\N	\N	\N	0101000020E61000009A999999999945C03333333333F336C0	Rio de Janeiro
107	draft	\N	\N	\N	\N	\N	\N	0101000020E61000006666666666E628403333333333F34440	Rome
108	draft	\N	\N	\N	\N	\N	\N	0101000020E61000009A999999993943C0AEB6627FD9DD29C0	Salvador
109	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000B051C088855AD3BCBB40C0	Santiago
110	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000CDCCCCCCCC4C3E40ACADD85F76F74D40	St. Petersburg
111	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000C442AD69DE5D5E40423EE8D9AC2A3F40	Shanghai
112	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000910F7A36ABFA59404182E2C798BBF33F	Singapore
113	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000BEC1172653553740211FF46C56554540	Sofia
114	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000CDCCCCCCCC0C3240787AA52C43A44D40	Stockholm
115	draft	\N	\N	\N	\N	\N	\N	0101000020E61000006666666666C64740BEC1172653D532C0	Tananarive
116	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000E049400000000000E04140	Teheran
117	draft	\N	\N	\N	\N	\N	\N	0101000020E61000006666666666662A409A99999999794040	Tripoli
118	draft	\N	\N	\N	\N	\N	\N	0101000020E61000007B832F4CA6AA2840ACADD85F76B74640	Venice
119	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000910F7A36AB0A58C0423EE8D9AC2A3340	Veracruz
120	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000BEC117265355304012143FC6DC1D4840	Vienna
121	draft	\N	\N	\N	\N	\N	\N	0101000020E61000000000000000806040211FF46C56954540	Vladivostok
122	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000000000000000354012143FC6DC1D4A40	Warsaw
123	draft	\N	\N	\N	\N	\N	\N	0101000020E61000009E5E29CB10D96540787AA52C43A444C0	Wellington
124	draft	\N	\N	\N	\N	\N	\N	0101000020E6100000B8AF03E78C082140CDCCCCCCCCAC4740	Zürich
\.


--
-- Data for Name: Trust_Logo_Images; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Trust_Logo_Images" (id, status, sort, user_created, date_created, user_updated, date_updated, section, "Logo_Image", href, "Label") FROM stdin;
2	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:57:32.659-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:47.957-04	1	0c316c98-891a-45f2-b878-b5fa454cc1ca	https://www.google.com	Google
3	published	1	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:07:47.068-04	\N	\N	1	010d86f5-4725-4504-bfbe-c38b55cd6c20	https://linkedin.com	LinkedIn
6	published	4	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.685-04	\N	\N	1	0874f072-3951-4a37-b07d-0efa9c4322b2	https://Ryder.com	Ryder
7	published	5	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.516-04	\N	\N	1	1c7d9621-79f2-4833-8266-87c9c3282c55	https://XPOLogistics.com	XPO Logistics
5	published	3	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.661-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.553-04	1	370b1813-1783-4773-a4c8-e6a4ce6971fe	https://fedex.com	FedEx
4	published	2	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.629-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.595-04	1	22a9f2ef-3eb5-46a2-bd0c-494fce784e75	https://www.ups.com	Deutsche Post
8	published	6	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.029-04	\N	\N	1	534613e9-de55-49fe-bba9-fe525dfddca0	https://cn.ca	CN Rail
9	published	7	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.061-04	\N	\N	1	dbf78878-f604-44e1-9186-7088c79289a3	https://www.cevalogistics.com	Ceva Logistics
10	published	8	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.09-04	\N	\N	1	0ebdfdd1-c2c8-41cd-8ae2-d62cb1b892f4	https://www.tnt.com	TNT
\.


--
-- Data for Name: Trust_Logo_Images_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Trust_Logo_Images_translations" (id, "Trust_Logo_Images_id", languages_code, alt_text) FROM stdin;
1	2	en	Google
2	2	fr	Google
3	2	de	Google
4	2	es	Google
5	3	en	LinkedIn
6	3	fr	LinkedIn
7	3	de	LinkedIn
8	3	es	LinkedIn
17	6	en	Ryder
18	6	fr	Ryder
19	6	de	Ryder
20	6	es	Ryder
21	7	en	XPO Logistics
22	7	fr	XPO Logistics
23	7	de	XPO Logistics
24	7	es	XPO Logistics
13	5	en	FedEx
14	5	fr	FedEx
15	5	de	FedEx
16	5	es	FedEx
9	4	en	Deutsche Post
10	4	fr	Deutsche Post
11	4	de	Deutsche Post
12	4	es	Deutsche Post
25	8	en	CN Rail
26	8	fr	CN Rail
27	8	de	CN Rail
28	8	es	CN Rail
29	9	en	Ceva Logistics
30	9	fr	Ceva Logistics
31	9	de	Ceva Logistics
32	9	es	Ceva Logistics
33	10	en	TNT Express
34	10	fr	TNT Express
35	10	de	TNT Express
36	10	es	TNT Express
\.


--
-- Data for Name: Trust_Logos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Trust_Logos" (id, status, user_created, date_created, user_updated, date_updated, is_monochrome, "Monochrome_Color", "Enable_Links", scroll_logos, scroll_speed) FROM stdin;
1	published	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:12.961-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:58:59.606-04	t	#BBBBBB	t	t	21
\.


--
-- Data for Name: Trust_Logos_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Trust_Logos_translations" (id, "Trust_Logos_id", languages_code, "Intro_Text") FROM stdin;
1	1	en	Trusted by scaling companies in logistics, SaaS, and transportation
2	1	fr	De confiance auprès des entreprises en croissance dans la logistique, le SaaS et le transport
3	1	de	Vertraut von wachsenden Unternehmen in Logistik, SaaS und Transport
4	1	es	De confianza para empresas en crecimiento en logística, SaaS y transporte
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.company (id, user_created, date_created, user_updated, date_updated, logo, name, favicon, "useFaviconInHeader") FROM stdin;
1	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:56.576-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:19.212-04	893633e0-d183-4e63-bdde-1ec61ae92ff5	LogisticIQ	1fb1f6b8-ba4d-4301-8a72-decb8dd89c71	t
\.


--
-- Data for Name: company_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.company_translations (id, company_id, languages_code, tagline, "SEO_Meta_Title_Append") FROM stdin;
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
5c845e5e-45f7-4a22-a354-0b1fd9028e7b	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
421067ca-112c-45f8-9445-518e2d2cc412	452c5584-65f7-4232-9b37-35cf01451390	\N	63994293-f78c-4f9b-8c9a-e2241cd53433	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-05 22:41:59.069-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_users	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	http://10.0.20.3:8055
2	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-05 22:42:09.382-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_settings	1	http://10.0.20.3:8055
3	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-05 22:55:54.299-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	1	http://10.0.20.3:8055
4	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-05 22:55:54.307-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	2	http://10.0.20.3:8055
5	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-05 22:55:54.314-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	3	http://10.0.20.3:8055
6	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-05 22:55:54.321-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	4	http://10.0.20.3:8055
7	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-05 22:55:54.327-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Articles	http://10.0.20.3:8055
10	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-05 23:01:28.337-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	5	http://10.0.20.3:8055
11	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-05 23:02:53.71-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	6	http://10.0.20.3:8055
12	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:19.332-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Articles	http://10.0.20.3:8055
13	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:19.338-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	1	http://10.0.20.3:8055
14	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:19.34-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	2	http://10.0.20.3:8055
15	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:19.341-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	3	http://10.0.20.3:8055
16	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:19.342-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	4	http://10.0.20.3:8055
17	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:19.344-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	5	http://10.0.20.3:8055
18	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:19.345-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	6	http://10.0.20.3:8055
19	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:59.738-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
20	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:59.745-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
21	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:59.752-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
22	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:59.758-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
23	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:59.763-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
24	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:59.768-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
25	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:59.773-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
26	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:02:59.779-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
27	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:03:57.47-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
28	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:04:49.67-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	15	http://10.0.20.3:8055
29	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:09:37.496-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	16	http://10.0.20.3:8055
30	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:10:04.727-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	17	http://10.0.20.3:8055
31	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:11:11.625-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
32	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:12:05.589-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	19	http://10.0.20.3:8055
33	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:14:21.411-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
34	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:29:06.992-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_settings	1	http://10.0.20.3:8055
35	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:32:17.842-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	20	http://10.0.20.3:8055
36	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.507-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
37	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.521-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
38	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.532-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
39	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.542-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
40	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.552-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
41	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.563-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
42	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.575-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
43	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.585-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
44	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.596-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	15	http://10.0.20.3:8055
45	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.607-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	16	http://10.0.20.3:8055
46	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.62-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	17	http://10.0.20.3:8055
47	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.631-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
48	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.641-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	19	http://10.0.20.3:8055
49	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:11.652-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	20	http://10.0.20.3:8055
50	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.646-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
51	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.662-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
52	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.673-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	20	http://10.0.20.3:8055
53	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.684-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
54	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.693-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
55	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.703-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
56	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.712-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
57	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.722-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
58	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.733-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
59	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.744-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	15	http://10.0.20.3:8055
60	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.753-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	16	http://10.0.20.3:8055
61	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.763-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	17	http://10.0.20.3:8055
62	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.773-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
63	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:33:25.782-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	19	http://10.0.20.3:8055
64	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:36:48.805-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
65	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.542-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_policies	016d9eea-27c6-4acf-95f3-ac3f26b1f0bc	http://10.0.20.3:8055
66	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.578-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	1	http://10.0.20.3:8055
67	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.583-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	2	http://10.0.20.3:8055
68	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.59-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	3	http://10.0.20.3:8055
69	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.595-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	4	http://10.0.20.3:8055
70	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.599-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	5	http://10.0.20.3:8055
71	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.606-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	6	http://10.0.20.3:8055
72	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.611-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	7	http://10.0.20.3:8055
73	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.616-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	8	http://10.0.20.3:8055
74	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.622-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	9	http://10.0.20.3:8055
75	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.627-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	10	http://10.0.20.3:8055
76	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.632-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	11	http://10.0.20.3:8055
77	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.638-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	12	http://10.0.20.3:8055
78	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.644-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	13	http://10.0.20.3:8055
79	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.65-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	14	http://10.0.20.3:8055
80	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.656-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	15	http://10.0.20.3:8055
81	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.661-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	16	http://10.0.20.3:8055
82	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.666-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	17	http://10.0.20.3:8055
83	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.671-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	18	http://10.0.20.3:8055
84	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.676-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	19	http://10.0.20.3:8055
85	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:39:49.681-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	20	http://10.0.20.3:8055
86	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:40:46.179-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_policies	016d9eea-27c6-4acf-95f3-ac3f26b1f0bc	http://10.0.20.3:8055
87	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:40:58.106-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_policies	016d9eea-27c6-4acf-95f3-ac3f26b1f0bc	http://10.0.20.3:8055
88	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:25.567-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
89	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:34.949-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	22	http://10.0.20.3:8055
90	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:34.954-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages_translations	http://10.0.20.3:8055
91	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.022-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	23	http://10.0.20.3:8055
92	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.027-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	24	http://10.0.20.3:8055
93	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.033-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	25	http://10.0.20.3:8055
94	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.038-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
95	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.095-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	26	http://10.0.20.3:8055
96	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.211-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	27	http://10.0.20.3:8055
97	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.454-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	en-US	http://10.0.20.3:8055
98	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.458-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	ar-SA	http://10.0.20.3:8055
99	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.463-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	de-DE	http://10.0.20.3:8055
100	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.468-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	fr-FR	http://10.0.20.3:8055
101	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.472-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	ru-RU	http://10.0.20.3:8055
102	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.477-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	es-ES	http://10.0.20.3:8055
103	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.481-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	it-IT	http://10.0.20.3:8055
104	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:42:35.485-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	pt-BR	http://10.0.20.3:8055
105	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:43:43.966-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	en	http://10.0.20.3:8055
106	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:44:10.899-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	ar-SA	http://10.0.20.3:8055
107	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:44:10.901-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	en	http://10.0.20.3:8055
108	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:44:10.903-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	it-IT	http://10.0.20.3:8055
109	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:44:10.904-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	pt-BR	http://10.0.20.3:8055
110	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:44:10.906-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	ru-RU	http://10.0.20.3:8055
111	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:44:41.836-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	20	http://10.0.20.3:8055
112	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:45:49.34-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
113	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.725-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
114	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.737-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
115	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.747-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
116	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.757-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
117	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.766-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
118	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.776-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
119	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.786-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
120	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.798-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
121	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.809-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
122	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.828-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	15	http://10.0.20.3:8055
123	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.84-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	16	http://10.0.20.3:8055
124	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.85-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	17	http://10.0.20.3:8055
125	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.859-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
126	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:17.87-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	19	http://10.0.20.3:8055
127	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.313-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
128	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.323-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
129	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.335-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
130	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.345-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
131	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.353-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
132	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.363-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
133	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.372-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
134	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.381-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
135	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.39-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
136	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.4-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	15	http://10.0.20.3:8055
137	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.408-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	16	http://10.0.20.3:8055
138	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.417-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	17	http://10.0.20.3:8055
139	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.427-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
140	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:46:20.435-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	19	http://10.0.20.3:8055
141	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:48:10.81-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	28	http://10.0.20.3:8055
142	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:49:09.512-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	29	http://10.0.20.3:8055
143	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:49:32.999-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	30	http://10.0.20.3:8055
144	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:49:51.183-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	31	http://10.0.20.3:8055
145	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:16.465-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	15	http://10.0.20.3:8055
146	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:16.476-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	16	http://10.0.20.3:8055
147	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:19.62-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	17	http://10.0.20.3:8055
148	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:43.618-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	19	http://10.0.20.3:8055
149	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:46.928-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
150	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:46.938-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
151	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:46.949-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
152	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:46.959-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
153	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:46.969-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
154	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:46.979-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
155	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:46.989-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
156	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:46.998-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
157	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:47.007-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
158	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:47.081-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
159	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.372-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
161	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.384-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
163	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.396-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
165	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.408-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
167	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.419-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
169	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.433-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
171	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.452-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
173	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.466-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
175	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.478-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
177	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.491-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
179	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:01.037-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
180	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:01.049-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
181	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:01.06-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
182	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:01.07-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
183	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:01.08-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
184	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:01.091-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
185	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:01.102-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
186	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:01.111-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
187	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:01.121-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
188	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:01.132-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
189	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.592-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
191	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.605-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
193	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.616-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
195	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.629-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
197	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.641-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
199	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.656-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
201	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.668-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
203	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.683-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
205	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.694-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
207	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.71-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
209	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.881-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
210	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.892-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
160	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.379-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
162	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.392-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
164	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.405-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
166	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.416-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
168	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.429-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
170	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.445-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
172	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.457-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
174	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.47-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
176	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.486-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
178	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:50:57.5-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
190	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.6-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
192	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.613-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
194	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.626-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
196	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.636-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
198	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.648-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
200	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.661-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
202	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.673-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
204	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.685-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
206	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.697-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
208	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.713-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
211	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.902-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
212	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.913-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
213	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.925-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
214	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.936-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
215	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.944-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
216	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.952-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
217	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.964-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
218	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:11.975-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
219	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.278-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
220	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.286-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
221	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.291-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
222	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.298-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
223	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.306-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
224	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.312-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
225	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.319-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
226	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.324-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
227	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.331-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
228	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.337-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
229	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.342-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
230	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.349-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
231	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.353-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
232	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.36-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
233	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.365-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
234	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.373-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
235	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.376-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
236	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.386-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
237	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.388-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
238	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:51:25.397-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
239	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:52:39.108-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
240	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:03.134-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
241	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:03.135-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
242	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:17.051-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
243	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:20.676-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
244	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:20.688-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
245	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:20.7-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
246	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:20.712-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
247	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:20.723-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
248	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:20.733-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
249	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:20.743-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
250	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:20.755-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
251	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:20.765-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
252	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:20.774-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
253	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:30.635-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	7	http://10.0.20.3:8055
254	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:30.67-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	14	http://10.0.20.3:8055
255	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:30.688-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	8	http://10.0.20.3:8055
256	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:30.699-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	11	http://10.0.20.3:8055
257	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:30.709-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	10	http://10.0.20.3:8055
258	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:30.721-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	13	http://10.0.20.3:8055
259	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:30.731-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	12	http://10.0.20.3:8055
260	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:30.742-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	18	http://10.0.20.3:8055
261	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:30.751-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
262	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:53:30.76-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	9	http://10.0.20.3:8055
263	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:55:06.436-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	de-DE	http://10.0.20.3:8055
264	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:55:20.053-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	en-US	http://10.0.20.3:8055
265	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:55:34.257-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	es-ES	http://10.0.20.3:8055
266	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:55:39.671-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	fr-FR	http://10.0.20.3:8055
270	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:56:44.013-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	fr	http://10.0.20.3:8055
271	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:56:57.822-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	es-ES	http://10.0.20.3:8055
272	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:56:57.823-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	fr-FR	http://10.0.20.3:8055
273	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:56:57.824-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	en-US	http://10.0.20.3:8055
274	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:56:57.825-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	de-DE	http://10.0.20.3:8055
267	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:56:04.89-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	en	http://10.0.20.3:8055
268	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:56:17.021-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	de	http://10.0.20.3:8055
269	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 13:56:30.403-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	languages	es	http://10.0.20.3:8055
275	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:01:51.386-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
276	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:04:27.334-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
277	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:05:05.234-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	21	http://10.0.20.3:8055
278	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:06:48.109-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	pages_translations	1	http://10.0.20.3:8055
279	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:06:48.115-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	pages_translations	2	http://10.0.20.3:8055
280	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:06:48.12-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	pages	2e499703-c9d0-4471-ba16-9604a64b37f1	http://10.0.20.3:8055
281	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:07:07.398-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	pages_translations	3	http://10.0.20.3:8055
282	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:07:07.405-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	pages_translations	4	http://10.0.20.3:8055
283	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:07:07.41-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	pages	2e499703-c9d0-4471-ba16-9604a64b37f1	http://10.0.20.3:8055
284	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:08:10.918-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	32	http://10.0.20.3:8055
285	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:08:10.923-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	33	http://10.0.20.3:8055
286	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:08:10.929-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	34	http://10.0.20.3:8055
287	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:08:10.935-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	35	http://10.0.20.3:8055
288	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:08:10.94-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	36	http://10.0.20.3:8055
289	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:08:10.945-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	37	http://10.0.20.3:8055
290	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:08:10.95-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	38	http://10.0.20.3:8055
291	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:08:10.955-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation	http://10.0.20.3:8055
292	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:09:33.457-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	39	http://10.0.20.3:8055
293	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:10:23.848-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	40	http://10.0.20.3:8055
294	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:11:09.048-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	41	http://10.0.20.3:8055
295	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:11:09.161-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	42	http://10.0.20.3:8055
296	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:11:09.166-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation_translations	http://10.0.20.3:8055
297	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:11:09.23-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	43	http://10.0.20.3:8055
298	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:11:09.349-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	44	http://10.0.20.3:8055
299	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:11:54.442-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	45	http://10.0.20.3:8055
300	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:13:26.208-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	41	http://10.0.20.3:8055
301	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:01.354-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	46	http://10.0.20.3:8055
302	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:08.413-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	32	http://10.0.20.3:8055
303	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:11.826-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	33	http://10.0.20.3:8055
304	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:15.103-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	34	http://10.0.20.3:8055
305	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:18.586-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	46	http://10.0.20.3:8055
306	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.277-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	32	http://10.0.20.3:8055
307	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.289-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	33	http://10.0.20.3:8055
308	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.299-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	46	http://10.0.20.3:8055
309	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.311-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	34	http://10.0.20.3:8055
310	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.323-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	35	http://10.0.20.3:8055
311	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.335-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	36	http://10.0.20.3:8055
312	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.345-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	37	http://10.0.20.3:8055
313	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.354-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	38	http://10.0.20.3:8055
314	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.364-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	39	http://10.0.20.3:8055
315	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.374-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	40	http://10.0.20.3:8055
316	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:21.385-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	41	http://10.0.20.3:8055
317	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:34.934-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	32	http://10.0.20.3:8055
318	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:34.945-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	33	http://10.0.20.3:8055
319	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:34.957-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	46	http://10.0.20.3:8055
320	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:34.969-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	35	http://10.0.20.3:8055
321	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:34.98-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	36	http://10.0.20.3:8055
322	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:34.993-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	37	http://10.0.20.3:8055
323	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:35.003-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	38	http://10.0.20.3:8055
324	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:35.013-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	39	http://10.0.20.3:8055
325	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:35.022-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	34	http://10.0.20.3:8055
326	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:35.032-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	40	http://10.0.20.3:8055
327	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:35.041-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	41	http://10.0.20.3:8055
328	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:38.442-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	39	http://10.0.20.3:8055
329	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.558-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	32	http://10.0.20.3:8055
330	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.568-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	33	http://10.0.20.3:8055
331	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.578-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	46	http://10.0.20.3:8055
332	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.588-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	39	http://10.0.20.3:8055
333	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.598-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	35	http://10.0.20.3:8055
334	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.607-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	36	http://10.0.20.3:8055
335	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.618-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	37	http://10.0.20.3:8055
336	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.629-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	38	http://10.0.20.3:8055
337	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.639-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	34	http://10.0.20.3:8055
338	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.649-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	40	http://10.0.20.3:8055
339	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:24:41.659-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	41	http://10.0.20.3:8055
340	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:27:22.792-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	1	http://10.0.20.3:8055
341	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:27:22.796-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	2	http://10.0.20.3:8055
342	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:27:22.801-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	3	http://10.0.20.3:8055
343	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:27:22.806-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	4	http://10.0.20.3:8055
344	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:27:22.81-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	1	http://10.0.20.3:8055
345	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:28:22.197-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	5	http://10.0.20.3:8055
346	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:28:22.203-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	6	http://10.0.20.3:8055
347	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:28:22.208-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	7	http://10.0.20.3:8055
348	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:28:22.212-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	8	http://10.0.20.3:8055
349	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:28:22.217-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	2	http://10.0.20.3:8055
350	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:00.476-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	9	http://10.0.20.3:8055
351	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:00.481-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	10	http://10.0.20.3:8055
352	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:00.486-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	11	http://10.0.20.3:8055
353	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:00.491-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	12	http://10.0.20.3:8055
354	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:00.494-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	3	http://10.0.20.3:8055
355	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:38.597-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	13	http://10.0.20.3:8055
356	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:38.604-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	14	http://10.0.20.3:8055
357	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:38.609-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	15	http://10.0.20.3:8055
358	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:38.614-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	16	http://10.0.20.3:8055
359	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:38.619-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	4	http://10.0.20.3:8055
360	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:30:24.51-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	17	http://10.0.20.3:8055
361	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:30:24.516-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	18	http://10.0.20.3:8055
362	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:30:24.52-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	19	http://10.0.20.3:8055
363	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:30:24.526-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	20	http://10.0.20.3:8055
364	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:30:24.531-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	5	http://10.0.20.3:8055
365	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:30:30.133-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	1	http://10.0.20.3:8055
366	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:08.412-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	47	http://10.0.20.3:8055
367	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:08.418-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	48	http://10.0.20.3:8055
368	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:08.423-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	49	http://10.0.20.3:8055
369	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:08.427-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	50	http://10.0.20.3:8055
370	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:08.431-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	51	http://10.0.20.3:8055
371	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:08.436-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
372	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:51.573-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	52	http://10.0.20.3:8055
373	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:51.694-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	53	http://10.0.20.3:8055
374	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:51.697-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
375	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:51.758-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	54	http://10.0.20.3:8055
376	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:32:51.866-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	55	http://10.0.20.3:8055
377	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:33:20.033-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	56	http://10.0.20.3:8055
378	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:33:29.174-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	56	http://10.0.20.3:8055
379	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:33:45.219-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	57	http://10.0.20.3:8055
380	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:34:47.594-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	58	http://10.0.20.3:8055
381	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:35:18.758-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	59	http://10.0.20.3:8055
382	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:47:17.773-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	f5496cbd-f251-4913-8d06-ea9f4da1d1a9	http://10.0.20.3:8055
383	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:47:17.795-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	f5496cbd-f251-4913-8d06-ea9f4da1d1a9	http://10.0.20.3:8055
384	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:48:42.65-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	6a965309-2b31-4260-81dc-a105fd60e40e	http://10.0.20.3:8055
385	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:48:42.661-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	6a965309-2b31-4260-81dc-a105fd60e40e	http://10.0.20.3:8055
386	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:16.037-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	60	http://10.0.20.3:8055
387	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:20.226-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	47	http://10.0.20.3:8055
388	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:20.236-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	48	http://10.0.20.3:8055
389	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:20.246-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	49	http://10.0.20.3:8055
390	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:20.256-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	50	http://10.0.20.3:8055
391	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:20.266-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	51	http://10.0.20.3:8055
392	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:20.277-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	60	http://10.0.20.3:8055
393	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:20.287-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	52	http://10.0.20.3:8055
394	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:20.297-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	59	http://10.0.20.3:8055
395	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:03:56.579-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	company	1	http://10.0.20.3:8055
396	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:05:15.879-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	4786e6f0-4fc2-4fc3-8866-556ee1cba44d	http://10.0.20.3:8055
397	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:05:15.893-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	4786e6f0-4fc2-4fc3-8866-556ee1cba44d	http://10.0.20.3:8055
398	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:09:52.49-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	14468428-708c-4b9c-a208-5f144e000fb0	http://10.0.20.3:8055
399	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:09:52.502-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	14468428-708c-4b9c-a208-5f144e000fb0	http://10.0.20.3:8055
400	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:12:07.373-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	7954cc0b-72f2-46c6-8dc6-a7e630d3d69f	http://10.0.20.3:8055
401	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:12:07.384-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	7954cc0b-72f2-46c6-8dc6-a7e630d3d69f	http://10.0.20.3:8055
402	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:12:13.782-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	caac001a-44b5-44ae-95fa-d69a0a1afbda	http://10.0.20.3:8055
403	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:12:13.793-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	caac001a-44b5-44ae-95fa-d69a0a1afbda	http://10.0.20.3:8055
404	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:13:06.518-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	0cfea432-c175-4365-a492-dfe4ad143fdd	http://10.0.20.3:8055
405	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:13:06.529-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	0cfea432-c175-4365-a492-dfe4ad143fdd	http://10.0.20.3:8055
406	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:13:12.134-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	8986db7f-5bee-4ebe-b305-ef1440292da5	http://10.0.20.3:8055
407	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:13:12.144-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	8986db7f-5bee-4ebe-b305-ef1440292da5	http://10.0.20.3:8055
408	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:13:43.839-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	0523a3b0-3c0e-414c-8b9f-f5acf7d20427	http://10.0.20.3:8055
409	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:13:43.848-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	0523a3b0-3c0e-414c-8b9f-f5acf7d20427	http://10.0.20.3:8055
410	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:27:03.625-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	893633e0-d183-4e63-bdde-1ec61ae92ff5	http://10.0.20.3:8055
411	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:27:10.483-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	company	1	http://10.0.20.3:8055
412	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:29:48.77-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	21	http://10.0.20.3:8055
413	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:29:48.781-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	22	http://10.0.20.3:8055
414	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:29:48.787-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://10.0.20.3:8055
415	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:30:53.191-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	23	http://10.0.20.3:8055
416	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:30:53.2-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	24	http://10.0.20.3:8055
417	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:30:53.206-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	25	http://10.0.20.3:8055
418	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:30:53.211-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	26	http://10.0.20.3:8055
419	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:30:53.218-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	27	http://10.0.20.3:8055
420	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:30:53.224-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://10.0.20.3:8055
421	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:30.261-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation	http://10.0.20.3:8055
422	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:30.262-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
423	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:30.272-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
424	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:30.28-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
425	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:30.288-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation_translations	http://10.0.20.3:8055
426	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:30.296-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
427	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:30.308-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages_translations	http://10.0.20.3:8055
428	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:36.561-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
429	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:36.57-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
430	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:36.579-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
431	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:36.587-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation_translations	http://10.0.20.3:8055
432	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:36.595-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
433	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:36.603-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages_translations	http://10.0.20.3:8055
434	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:52:36.611-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation	http://10.0.20.3:8055
435	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:53:11.402-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	61	http://10.0.20.3:8055
436	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:53:11.408-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	62	http://10.0.20.3:8055
437	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:53:11.413-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	63	http://10.0.20.3:8055
438	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:53:11.418-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	64	http://10.0.20.3:8055
439	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:53:11.424-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	65	http://10.0.20.3:8055
440	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:53:11.429-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	66	http://10.0.20.3:8055
441	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:53:11.435-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	landing	http://10.0.20.3:8055
442	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:54:19.272-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	landing	http://10.0.20.3:8055
443	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:54:42.937-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	67	http://10.0.20.3:8055
444	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:54:42.943-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	68	http://10.0.20.3:8055
445	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:54:42.948-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	69	http://10.0.20.3:8055
446	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:54:42.953-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	70	http://10.0.20.3:8055
447	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:54:42.959-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	71	http://10.0.20.3:8055
448	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:54:42.965-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	72	http://10.0.20.3:8055
449	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:54:42.97-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
450	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:57:50.917-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	73	http://10.0.20.3:8055
451	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:57:51.052-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	74	http://10.0.20.3:8055
452	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:57:51.057-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
453	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:57:51.125-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	75	http://10.0.20.3:8055
454	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 21:57:51.243-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	76	http://10.0.20.3:8055
455	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:25:32.78-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	77	http://10.0.20.3:8055
456	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:26:43.913-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	78	http://10.0.20.3:8055
457	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:26:59.543-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation	http://10.0.20.3:8055
458	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:27:15.102-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	79	http://10.0.20.3:8055
459	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:29:48.041-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	21	http://10.0.20.3:8055
460	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:29:48.046-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	22	http://10.0.20.3:8055
461	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:29:48.052-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	23	http://10.0.20.3:8055
462	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:29:48.058-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	24	http://10.0.20.3:8055
463	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:29:48.063-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	6	http://10.0.20.3:8055
464	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:30:05.933-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	6	http://10.0.20.3:8055
465	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:31:51.467-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
466	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:31:51.468-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
467	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:31:51.477-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
468	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:31:51.484-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
469	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:31:51.491-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation_translations	http://10.0.20.3:8055
470	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:31:51.498-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
471	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:31:51.506-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages_translations	http://10.0.20.3:8055
472	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:31:51.514-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation	http://10.0.20.3:8055
473	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:31:51.521-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
474	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:31:51.528-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	landing	http://10.0.20.3:8055
475	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:32:07.413-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
476	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:32:12.645-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
477	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:32:15.858-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	landing	http://10.0.20.3:8055
478	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:32:15.863-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	61	http://10.0.20.3:8055
479	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:32:15.865-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	62	http://10.0.20.3:8055
480	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:32:15.866-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	63	http://10.0.20.3:8055
481	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:32:15.867-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	64	http://10.0.20.3:8055
482	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:32:15.869-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	65	http://10.0.20.3:8055
483	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:32:15.871-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	66	http://10.0.20.3:8055
484	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:01.137-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
485	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:09.556-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
486	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:09.557-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation	http://10.0.20.3:8055
487	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:09.564-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
488	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:09.572-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
489	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:09.581-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation_translations	http://10.0.20.3:8055
490	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:09.591-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
491	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:09.6-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages_translations	http://10.0.20.3:8055
492	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:09.609-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
493	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:09.619-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
494	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:09.626-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
495	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:16.142-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
497	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:16.151-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
498	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:16.159-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
499	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:16.166-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation_translations	http://10.0.20.3:8055
500	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:16.176-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
501	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:16.185-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages_translations	http://10.0.20.3:8055
502	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:16.193-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
503	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:16.201-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
504	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:19.579-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages_translations	http://10.0.20.3:8055
513	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:25.943-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
514	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:25.95-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
515	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:25.959-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
516	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:25.97-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
517	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:25.979-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
518	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:25.986-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
519	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:46.935-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
520	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:54.449-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
528	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:59.495-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
529	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:59.504-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
530	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:59.511-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
531	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:59.518-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
532	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:59.53-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
533	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:06.098-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
534	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:09.077-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
535	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:09.085-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
536	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:09.092-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
537	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:09.1-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
538	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:09.107-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
539	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:09.114-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
541	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:12.797-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
543	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:12.809-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
548	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:37.626-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
550	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:57.951-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
496	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:16.143-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
505	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:19.58-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company	http://10.0.20.3:8055
506	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:19.589-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
507	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:19.596-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
508	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:19.606-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation_translations	http://10.0.20.3:8055
509	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:19.614-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
510	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:19.623-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
511	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:19.63-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
512	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:25.942-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	navigation_translations	http://10.0.20.3:8055
521	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:54.449-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
522	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:54.458-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
523	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:54.465-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
524	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:54.472-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
525	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:54.481-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
526	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:54.491-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
527	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:33:59.495-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
540	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:12.796-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	company_translations	http://10.0.20.3:8055
542	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:12.805-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
544	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:12.814-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
545	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:12.822-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
546	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:12.829-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
547	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:23.613-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	languages	http://10.0.20.3:8055
549	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:57.95-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
551	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:57.962-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
552	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:57.97-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
553	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:34:57.977-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
554	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:40:05.832-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	25	http://10.0.20.3:8055
555	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:40:05.838-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	26	http://10.0.20.3:8055
556	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:40:05.842-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	27	http://10.0.20.3:8055
557	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:40:05.847-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation_translations	28	http://10.0.20.3:8055
558	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:40:05.851-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	7	http://10.0.20.3:8055
559	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:45:52.374-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	80	http://10.0.20.3:8055
560	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:46:31.425-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	81	http://10.0.20.3:8055
561	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:46:48.004-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	80	http://10.0.20.3:8055
562	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:46:56.221-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	82	http://10.0.20.3:8055
563	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:47:00.418-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	74	http://10.0.20.3:8055
564	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:47:00.429-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	75	http://10.0.20.3:8055
565	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:47:00.44-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	76	http://10.0.20.3:8055
566	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:47:00.451-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	82	http://10.0.20.3:8055
567	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:47:00.461-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	81	http://10.0.20.3:8055
568	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:47:43.048-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	83	http://10.0.20.3:8055
569	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:48:31.676-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	84	http://10.0.20.3:8055
570	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:48:36.078-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	77	http://10.0.20.3:8055
571	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:49:00.23-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	6	http://10.0.20.3:8055
572	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:49:14.608-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	navigation	7	http://10.0.20.3:8055
573	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:38.914-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
574	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:38.923-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
575	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:38.931-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
576	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:38.937-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
577	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:38.945-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
578	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:45.073-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
579	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:45.074-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
580	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:45.081-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
581	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:45.086-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
582	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:45.091-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
583	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:56:45.098-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
584	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:57:41.969-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	73	http://10.0.20.3:8055
585	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:58:26.377-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	73	http://10.0.20.3:8055
586	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:04:38.838-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	1	http://10.0.20.3:8055
587	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:04:38.844-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	2	http://10.0.20.3:8055
588	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:04:38.85-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	3	http://10.0.20.3:8055
589	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:04:38.858-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	4	http://10.0.20.3:8055
590	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:04:38.862-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
591	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:04:56.36-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	85	http://10.0.20.3:8055
592	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:06:44.554-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	1	http://10.0.20.3:8055
593	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:06:44.563-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	3	http://10.0.20.3:8055
594	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:06:44.57-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	4	http://10.0.20.3:8055
595	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:06:44.578-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	2	http://10.0.20.3:8055
596	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:06:44.583-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
597	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:06:49.369-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
598	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:13:38.123-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	86	http://10.0.20.3:8055
599	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:14:37.094-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	pages	2e499703-c9d0-4471-ba16-9604a64b37f1	http://10.0.20.3:8055
600	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:16:19.47-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	1fb1f6b8-ba4d-4301-8a72-decb8dd89c71	http://10.0.20.3:8055
601	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:16:23.968-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	company	1	http://10.0.20.3:8055
602	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:24:02.883-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	28	http://10.0.20.3:8055
603	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:24:02.888-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://10.0.20.3:8055
604	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:24:55.987-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	87	http://10.0.20.3:8055
605	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:00.857-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	47	http://10.0.20.3:8055
606	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:00.867-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	48	http://10.0.20.3:8055
607	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:00.88-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	49	http://10.0.20.3:8055
608	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:00.89-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	50	http://10.0.20.3:8055
609	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:00.9-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	51	http://10.0.20.3:8055
610	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:00.91-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	60	http://10.0.20.3:8055
611	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:00.923-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	52	http://10.0.20.3:8055
612	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:00.933-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	87	http://10.0.20.3:8055
613	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:00.945-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	59	http://10.0.20.3:8055
614	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:00.955-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	86	http://10.0.20.3:8055
615	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:04.606-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	87	http://10.0.20.3:8055
616	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:25:19.213-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	company	1	http://10.0.20.3:8055
617	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:13:10.509-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	29	http://10.0.20.3:8055
618	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:13:10.515-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	30	http://10.0.20.3:8055
619	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:13:10.519-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://10.0.20.3:8055
620	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:14:38.48-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	88	http://10.0.20.3:8055
621	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:14:42.244-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	74	http://10.0.20.3:8055
622	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:14:42.255-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	75	http://10.0.20.3:8055
623	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:14:42.265-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	76	http://10.0.20.3:8055
624	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:14:42.277-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	82	http://10.0.20.3:8055
625	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:14:42.287-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	88	http://10.0.20.3:8055
626	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:14:42.297-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	81	http://10.0.20.3:8055
627	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:14:42.307-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	83	http://10.0.20.3:8055
628	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:14:42.317-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	85	http://10.0.20.3:8055
629	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:15:25.95-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	1	http://10.0.20.3:8055
630	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:15:25.958-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	3	http://10.0.20.3:8055
631	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:15:25.965-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	2	http://10.0.20.3:8055
632	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:15:25.973-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	4	http://10.0.20.3:8055
633	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 00:15:25.979-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
634	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:10:06.642-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
635	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:17:53.445-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	89	http://10.0.20.3:8055
636	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:17:53.451-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	90	http://10.0.20.3:8055
637	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:17:53.457-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	91	http://10.0.20.3:8055
638	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:17:53.462-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	92	http://10.0.20.3:8055
639	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:17:53.467-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	93	http://10.0.20.3:8055
640	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:17:53.473-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	94	http://10.0.20.3:8055
641	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:17:53.479-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	95	http://10.0.20.3:8055
642	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:17:53.484-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
643	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:18:30.81-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	96	http://10.0.20.3:8055
644	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:02.644-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
645	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:02.645-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
646	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:02.656-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
647	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:02.659-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
648	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:02.666-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
649	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:02.669-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
650	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:02.676-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
651	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:55.368-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
652	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:55.373-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	89	http://10.0.20.3:8055
653	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:55.374-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	90	http://10.0.20.3:8055
654	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:55.375-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	91	http://10.0.20.3:8055
655	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:55.376-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	92	http://10.0.20.3:8055
656	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:55.377-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	93	http://10.0.20.3:8055
657	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:55.379-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	94	http://10.0.20.3:8055
658	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:55.38-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	95	http://10.0.20.3:8055
659	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:24:55.381-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	96	http://10.0.20.3:8055
660	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:26:38.488-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	97	http://10.0.20.3:8055
661	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:26:38.494-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	98	http://10.0.20.3:8055
662	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:26:38.499-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	99	http://10.0.20.3:8055
663	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:26:38.504-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	100	http://10.0.20.3:8055
664	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:26:38.509-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	101	http://10.0.20.3:8055
665	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:26:38.513-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	102	http://10.0.20.3:8055
666	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:26:38.518-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
667	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:27:05.369-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	103	http://10.0.20.3:8055
668	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:23.6-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	104	http://10.0.20.3:8055
669	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:23.731-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	105	http://10.0.20.3:8055
670	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:23.736-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
671	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:23.798-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	106	http://10.0.20.3:8055
672	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:23.893-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	107	http://10.0.20.3:8055
673	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:30.385-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
674	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:47.326-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
675	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:47.334-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
676	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:47.341-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
677	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:47.348-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
678	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:47.355-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
679	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:47.363-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
680	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:52.161-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
683	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:52.17-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
684	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:52.177-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
688	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:57.474-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
690	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:57.482-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
692	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:57.491-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
694	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:57.5-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
681	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:52.162-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
682	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:52.169-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
685	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:52.178-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
686	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:52.187-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
687	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:52.196-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
689	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:57.475-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
691	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:57.486-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
693	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:57.494-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
695	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:29:57.503-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
696	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:01.309-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
697	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:01.328-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
698	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:01.342-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
699	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:01.349-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
700	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:06.951-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
701	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:07.002-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
702	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:07.009-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
703	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:07.015-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
704	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:49.439-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	108	http://10.0.20.3:8055
705	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:49.443-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	109	http://10.0.20.3:8055
706	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:49.448-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	110	http://10.0.20.3:8055
707	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:49.453-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	111	http://10.0.20.3:8055
708	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:49.457-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	112	http://10.0.20.3:8055
709	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:49.462-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	113	http://10.0.20.3:8055
710	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:49.467-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	114	http://10.0.20.3:8055
711	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:30:49.471-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
712	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:31:05.127-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	115	http://10.0.20.3:8055
713	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:31:24.747-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	116	http://10.0.20.3:8055
714	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:31:42.025-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	117	http://10.0.20.3:8055
715	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:32:52.137-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
716	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:33:13.202-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
717	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:33:13.203-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
718	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:33:13.211-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
719	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:33:13.22-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
720	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:33:13.227-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
721	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:33:58.792-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	115	http://10.0.20.3:8055
722	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:01.169-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	117	http://10.0.20.3:8055
723	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:03.199-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	108	http://10.0.20.3:8055
724	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:03.209-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	109	http://10.0.20.3:8055
725	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:03.218-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	110	http://10.0.20.3:8055
726	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:03.226-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	111	http://10.0.20.3:8055
727	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:03.235-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	112	http://10.0.20.3:8055
728	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:03.243-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	113	http://10.0.20.3:8055
729	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:03.252-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	114	http://10.0.20.3:8055
730	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:03.261-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	115	http://10.0.20.3:8055
731	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:03.271-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	117	http://10.0.20.3:8055
732	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:03.28-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	116	http://10.0.20.3:8055
733	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:34:51.071-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	118	http://10.0.20.3:8055
734	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:35:05.835-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
735	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:35:11.883-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
741	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:40:51.426-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
742	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:46:27.804-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	119	http://10.0.20.3:8055
743	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:37.96-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
744	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:37.972-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
745	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:37.98-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
746	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:37.987-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
747	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:37.994-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
748	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:43.386-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	119	http://10.0.20.3:8055
749	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:51.973-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
750	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:51.974-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
751	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:51.984-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
752	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:51.984-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
753	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:51.992-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
754	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:51.993-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
755	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:52-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
756	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:52-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
757	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:52.01-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
758	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:55.793-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
759	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:55.797-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
760	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:55.803-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
761	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:55.81-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
762	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:55.818-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
763	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:59.749-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
764	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:59.757-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
765	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:59.764-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
766	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:59.771-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
767	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:56:59.778-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
768	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:58:52.484-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	120	http://10.0.20.3:8055
769	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:59:29.249-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	120	http://10.0.20.3:8055
770	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 08:59:51.619-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	121	http://10.0.20.3:8055
771	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:04:06.873-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	121	http://10.0.20.3:8055
772	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:11:49.665-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	122	http://10.0.20.3:8055
773	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:12:53.21-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	122	http://10.0.20.3:8055
774	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:13:17.267-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	123	http://10.0.20.3:8055
775	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:14:38.629-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	123	http://10.0.20.3:8055
776	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:17:04.244-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	115	http://10.0.20.3:8055
777	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:22:23.777-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	124	http://10.0.20.3:8055
778	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:23:30.332-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
779	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:26:28.657-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	29b5aedc-d2b2-423e-90c5-43181d3824b8	http://10.0.20.3:8055
781	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:27:37.815-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	116	http://10.0.20.3:8055
782	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:27:52.561-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
783	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:27:52.566-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	108	http://10.0.20.3:8055
784	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:27:52.568-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	109	http://10.0.20.3:8055
785	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:27:52.569-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	110	http://10.0.20.3:8055
786	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:27:52.57-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	111	http://10.0.20.3:8055
787	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:27:52.571-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	112	http://10.0.20.3:8055
788	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:27:52.573-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	113	http://10.0.20.3:8055
789	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:27:52.574-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	114	http://10.0.20.3:8055
790	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:27:52.575-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	117	http://10.0.20.3:8055
791	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:01.679-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
792	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:01.682-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	105	http://10.0.20.3:8055
793	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:01.683-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	106	http://10.0.20.3:8055
794	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:01.685-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	107	http://10.0.20.3:8055
795	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:01.686-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	118	http://10.0.20.3:8055
796	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:01.702-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	104	http://10.0.20.3:8055
797	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:05.711-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
798	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:05.715-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	97	http://10.0.20.3:8055
799	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:05.716-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	98	http://10.0.20.3:8055
800	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:05.717-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	99	http://10.0.20.3:8055
801	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:05.718-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	100	http://10.0.20.3:8055
802	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:05.72-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	101	http://10.0.20.3:8055
803	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:05.721-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	102	http://10.0.20.3:8055
804	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:05.722-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	103	http://10.0.20.3:8055
805	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:28:05.723-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	124	http://10.0.20.3:8055
806	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:32:30.216-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	125	http://10.0.20.3:8055
807	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:32:30.222-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	126	http://10.0.20.3:8055
808	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:32:30.226-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	127	http://10.0.20.3:8055
809	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:32:30.23-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	128	http://10.0.20.3:8055
810	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:32:30.235-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	129	http://10.0.20.3:8055
811	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:32:30.239-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	130	http://10.0.20.3:8055
812	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:32:30.243-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
813	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:32:56.511-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	131	http://10.0.20.3:8055
814	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:33:00.412-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	131	http://10.0.20.3:8055
815	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:33:34.051-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	132	http://10.0.20.3:8055
816	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:33:36.802-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	132	http://10.0.20.3:8055
817	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:34:04.813-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	133	http://10.0.20.3:8055
818	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:34:08.549-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	133	http://10.0.20.3:8055
819	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:34:58.117-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	134	http://10.0.20.3:8055
820	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:34:58.232-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	135	http://10.0.20.3:8055
821	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:34:58.236-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
822	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:34:58.297-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	136	http://10.0.20.3:8055
823	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:34:58.412-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	137	http://10.0.20.3:8055
824	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:35:40.262-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	134	http://10.0.20.3:8055
825	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:36:05.877-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	138	http://10.0.20.3:8055
826	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:36:35.051-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	139	http://10.0.20.3:8055
827	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:36:35.056-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	140	http://10.0.20.3:8055
828	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:36:35.061-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	141	http://10.0.20.3:8055
829	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:36:35.066-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	142	http://10.0.20.3:8055
830	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:36:35.07-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	143	http://10.0.20.3:8055
831	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:36:35.075-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	144	http://10.0.20.3:8055
832	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:36:35.079-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	145	http://10.0.20.3:8055
833	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:36:35.083-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
834	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:42:44.243-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
835	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:43:24.976-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	146	http://10.0.20.3:8055
836	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:43:38.743-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
837	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:11.255-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
838	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:11.262-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
839	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:11.269-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
840	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:11.275-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
841	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:11.281-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
842	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:11.288-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
843	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:11.294-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
844	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:18.902-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
845	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:18.902-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
846	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:18.91-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
847	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:18.911-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
848	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:18.918-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
849	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:18.919-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
850	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:18.926-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
851	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:18.932-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
852	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:18.94-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
853	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:20.802-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
854	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:20.818-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
855	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:44:20.828-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero_translations	http://10.0.20.3:8055
856	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:45:48.306-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
857	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:46:22.88-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	148	http://10.0.20.3:8055
858	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:46:36.821-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	148	http://10.0.20.3:8055
859	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:46:55.678-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	149	http://10.0.20.3:8055
860	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:48:56.369-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	150	http://10.0.20.3:8055
861	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:49:03.876-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	151	http://10.0.20.3:8055
862	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:49:13.524-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	150	http://10.0.20.3:8055
863	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:49:56.258-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	152	http://10.0.20.3:8055
864	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:49:56.405-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	153	http://10.0.20.3:8055
865	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:49:56.41-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images_translations	http://10.0.20.3:8055
866	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:49:56.473-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	154	http://10.0.20.3:8055
867	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:49:56.604-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	155	http://10.0.20.3:8055
868	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:50:21.981-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	156	http://10.0.20.3:8055
869	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:50:37.689-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
870	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:50:37.69-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	pages	http://10.0.20.3:8055
871	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:50:37.702-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Landing_Page	http://10.0.20.3:8055
872	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:50:37.709-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Menus	http://10.0.20.3:8055
873	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:50:37.716-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	General_Settings	http://10.0.20.3:8055
874	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:50:37.723-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos_translations	http://10.0.20.3:8055
875	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:50:37.732-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images_translations	http://10.0.20.3:8055
877	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:56:26.977-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
876	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:54:59.604-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logos	http://10.0.20.3:8055
878	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:56:54.091-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	0c316c98-891a-45f2-b878-b5fa454cc1ca	http://10.0.20.3:8055
879	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:57:32.664-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	1	http://10.0.20.3:8055
880	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:57:32.669-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	2	http://10.0.20.3:8055
881	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:57:32.673-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	3	http://10.0.20.3:8055
882	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:57:32.678-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	4	http://10.0.20.3:8055
883	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:57:32.683-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	2	http://10.0.20.3:8055
884	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:12.391-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	146	http://10.0.20.3:8055
885	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.181-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	139	http://10.0.20.3:8055
886	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.189-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	140	http://10.0.20.3:8055
887	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.199-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	141	http://10.0.20.3:8055
888	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.207-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	142	http://10.0.20.3:8055
889	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.216-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	143	http://10.0.20.3:8055
890	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.225-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	144	http://10.0.20.3:8055
891	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.235-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	145	http://10.0.20.3:8055
892	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.245-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	149	http://10.0.20.3:8055
893	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.255-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	151	http://10.0.20.3:8055
894	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.264-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	152	http://10.0.20.3:8055
895	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:16.273-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	146	http://10.0.20.3:8055
896	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:58:30.345-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	146	http://10.0.20.3:8055
897	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:59:21.678-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
898	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:00:29.716-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
899	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:01:26.031-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
900	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:02:54.507-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
901	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:12.966-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	2	http://10.0.20.3:8055
902	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:12.976-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
903	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:32.568-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	157	http://10.0.20.3:8055
904	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.124-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	139	http://10.0.20.3:8055
905	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.132-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	157	http://10.0.20.3:8055
906	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.14-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	140	http://10.0.20.3:8055
907	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.149-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	141	http://10.0.20.3:8055
908	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.158-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	142	http://10.0.20.3:8055
909	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.168-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	143	http://10.0.20.3:8055
910	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.176-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	144	http://10.0.20.3:8055
911	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.185-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	145	http://10.0.20.3:8055
912	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.196-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	149	http://10.0.20.3:8055
913	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.205-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	151	http://10.0.20.3:8055
914	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.214-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	152	http://10.0.20.3:8055
915	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:36.224-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	146	http://10.0.20.3:8055
916	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:03:47.958-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	2	http://10.0.20.3:8055
917	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:04:14.369-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
918	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:04:58.174-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
919	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:05:25.826-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
920	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:08:34.968-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Trust_Logo_Images	http://10.0.20.3:8055
921	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:14:55.82-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos_translations	1	http://10.0.20.3:8055
922	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:14:55.825-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos_translations	2	http://10.0.20.3:8055
923	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:14:55.829-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos_translations	3	http://10.0.20.3:8055
924	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:14:55.834-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos_translations	4	http://10.0.20.3:8055
925	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:14:55.84-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
926	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:15:09.51-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
927	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:15:57.316-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
928	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:32:09.406-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	31	http://10.0.20.3:8055
929	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:32:09.411-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	32	http://10.0.20.3:8055
930	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:32:09.416-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	33	http://10.0.20.3:8055
931	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:32:09.42-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	34	http://10.0.20.3:8055
932	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:32:09.424-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://10.0.20.3:8055
933	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:38:11.634-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	158	http://10.0.20.3:8055
934	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:38:14.771-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	74	http://10.0.20.3:8055
935	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:38:14.782-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	75	http://10.0.20.3:8055
936	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:38:14.792-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	76	http://10.0.20.3:8055
937	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:38:14.803-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	82	http://10.0.20.3:8055
938	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:38:14.812-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	88	http://10.0.20.3:8055
939	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:38:14.822-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	81	http://10.0.20.3:8055
940	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:38:14.832-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	83	http://10.0.20.3:8055
941	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:38:14.842-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	158	http://10.0.20.3:8055
942	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:38:14.852-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	85	http://10.0.20.3:8055
943	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:45:04.982-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	159	http://10.0.20.3:8055
944	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:45:04.986-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	160	http://10.0.20.3:8055
945	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:45:04.991-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	161	http://10.0.20.3:8055
946	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:45:04.996-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	162	http://10.0.20.3:8055
947	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:45:05.001-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	163	http://10.0.20.3:8055
948	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:45:05.005-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	164	http://10.0.20.3:8055
949	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:45:05.01-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	165	http://10.0.20.3:8055
950	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:45:05.014-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Map_Cities	http://10.0.20.3:8055
951	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:45:56.501-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
952	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:46:46.533-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	166	http://10.0.20.3:8055
953	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:46:46.664-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	167	http://10.0.20.3:8055
954	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:56:55.929-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	35	http://10.0.20.3:8055
955	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 10:56:55.933-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://10.0.20.3:8055
956	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:01:07.669-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	1	http://10.0.20.3:8055
957	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:01:07.677-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	2	http://10.0.20.3:8055
958	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:01:07.683-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	3	http://10.0.20.3:8055
959	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:01:07.689-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	4	http://10.0.20.3:8055
960	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:01:07.695-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
961	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:24.87-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	168	http://10.0.20.3:8055
962	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:30.689-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	168	http://10.0.20.3:8055
963	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.161-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	125	http://10.0.20.3:8055
964	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.173-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	126	http://10.0.20.3:8055
965	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.183-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	127	http://10.0.20.3:8055
966	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.192-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	128	http://10.0.20.3:8055
967	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.2-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	129	http://10.0.20.3:8055
968	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.209-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	130	http://10.0.20.3:8055
969	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.218-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	131	http://10.0.20.3:8055
970	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.228-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	132	http://10.0.20.3:8055
971	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.236-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	133	http://10.0.20.3:8055
972	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.246-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	168	http://10.0.20.3:8055
973	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.255-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	134	http://10.0.20.3:8055
974	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:03:33.265-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
975	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:07:14.69-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	010d86f5-4725-4504-bfbe-c38b55cd6c20	http://10.0.20.3:8055
976	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:07:47.073-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	5	http://10.0.20.3:8055
977	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:07:47.079-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	6	http://10.0.20.3:8055
978	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:07:47.084-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	7	http://10.0.20.3:8055
979	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:07:47.089-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	8	http://10.0.20.3:8055
980	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:07:47.093-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	3	http://10.0.20.3:8055
981	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:07:47.099-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
982	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:18:41.92-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	169	http://10.0.20.3:8055
983	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:19:43.633-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	1	http://10.0.20.3:8055
984	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:19:43.639-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
985	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:19:59.771-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	170	http://10.0.20.3:8055
986	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:20:28.145-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	1	http://10.0.20.3:8055
987	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:20:28.151-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
988	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:21:07.391-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	1	http://10.0.20.3:8055
989	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:21:26.884-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	1	http://10.0.20.3:8055
990	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:21:26.915-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
991	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:21:56.223-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
992	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:22:02.067-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	Map_Cities	http://10.0.20.3:8055
993	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:22:36.527-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	167	http://10.0.20.3:8055
994	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:23:11.373-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	2	http://10.0.20.3:8055
995	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:23:11.379-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
996	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:38.859-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	3	http://10.0.20.3:8055
997	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:38.864-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	4	http://10.0.20.3:8055
998	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:38.868-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	5	http://10.0.20.3:8055
999	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:38.872-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	6	http://10.0.20.3:8055
1000	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:38.876-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
1001	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:48.303-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	159	http://10.0.20.3:8055
1002	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:48.312-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	160	http://10.0.20.3:8055
1003	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:48.32-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	161	http://10.0.20.3:8055
1004	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:48.33-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	162	http://10.0.20.3:8055
1005	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:48.341-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	163	http://10.0.20.3:8055
1006	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:48.35-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	164	http://10.0.20.3:8055
1007	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:48.359-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	165	http://10.0.20.3:8055
1008	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:48.368-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	170	http://10.0.20.3:8055
1009	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:48.378-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	166	http://10.0.20.3:8055
1010	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:48.387-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	169	http://10.0.20.3:8055
1011	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:26:57.7-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	166	http://10.0.20.3:8055
1012	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:27:34.399-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	7	http://10.0.20.3:8055
1013	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:27:34.405-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
1014	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:28:29.355-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	8	http://10.0.20.3:8055
1015	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:28:29.358-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Map_Cities	9	http://10.0.20.3:8055
1016	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:28:29.362-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
1017	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:33:31.307-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	18b14f63-1d2c-4f47-aebc-e4fd7a55df5e	http://10.0.20.3:8055
1018	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:34:49.161-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	6d0b105d-1845-4e73-9a8d-939e2c4406ce	http://10.0.20.3:8055
1019	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:36:14.113-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	d752773c-8023-430b-a914-8180c52bd990	http://10.0.20.3:8055
1020	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:36:47.205-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	0874f072-3951-4a37-b07d-0efa9c4322b2	http://10.0.20.3:8055
1021	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.635-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	9	http://10.0.20.3:8055
1022	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.64-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	10	http://10.0.20.3:8055
1023	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.645-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	11	http://10.0.20.3:8055
1024	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.65-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	12	http://10.0.20.3:8055
1025	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.654-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	4	http://10.0.20.3:8055
1026	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.665-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	13	http://10.0.20.3:8055
1027	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.669-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	14	http://10.0.20.3:8055
1028	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.673-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	15	http://10.0.20.3:8055
1029	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.677-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	16	http://10.0.20.3:8055
1030	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.681-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	5	http://10.0.20.3:8055
1031	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.689-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	17	http://10.0.20.3:8055
1032	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.693-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	18	http://10.0.20.3:8055
1033	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.697-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	19	http://10.0.20.3:8055
1034	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.702-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	20	http://10.0.20.3:8055
1035	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.706-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	6	http://10.0.20.3:8055
1036	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:37:13.712-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
1037	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:41:08.935-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	370b1813-1783-4773-a4c8-e6a4ce6971fe	http://10.0.20.3:8055
1038	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:42:51.314-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	22a9f2ef-3eb5-46a2-bd0c-494fce784e75	http://10.0.20.3:8055
1039	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:03.106-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	1c7d9621-79f2-4833-8266-87c9c3282c55	http://10.0.20.3:8055
1040	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.522-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	21	http://10.0.20.3:8055
1041	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.529-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	22	http://10.0.20.3:8055
1042	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.534-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	23	http://10.0.20.3:8055
1043	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.538-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	24	http://10.0.20.3:8055
1044	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.545-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	7	http://10.0.20.3:8055
1045	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.558-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	13	http://10.0.20.3:8055
1046	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.566-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	14	http://10.0.20.3:8055
1047	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.573-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	15	http://10.0.20.3:8055
1048	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.58-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	16	http://10.0.20.3:8055
1049	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.585-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	5	http://10.0.20.3:8055
1050	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.6-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	9	http://10.0.20.3:8055
1051	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.607-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	10	http://10.0.20.3:8055
1052	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.613-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	11	http://10.0.20.3:8055
1053	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.62-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	12	http://10.0.20.3:8055
1054	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.626-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	4	http://10.0.20.3:8055
1055	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:42.636-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
1056	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:46:36.116-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	534613e9-de55-49fe-bba9-fe525dfddca0	http://10.0.20.3:8055
1057	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:48:51.558-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	dbf78878-f604-44e1-9186-7088c79289a3	http://10.0.20.3:8055
1058	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:50:37.53-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_files	0ebdfdd1-c2c8-41cd-8ae2-d62cb1b892f4	http://10.0.20.3:8055
1059	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.034-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	25	http://10.0.20.3:8055
1060	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.041-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	26	http://10.0.20.3:8055
1061	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.046-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	27	http://10.0.20.3:8055
1062	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.051-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	28	http://10.0.20.3:8055
1063	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.056-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	8	http://10.0.20.3:8055
1064	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.066-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	29	http://10.0.20.3:8055
1065	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.071-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	30	http://10.0.20.3:8055
1066	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.076-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	31	http://10.0.20.3:8055
1067	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.081-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	32	http://10.0.20.3:8055
1068	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.086-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	9	http://10.0.20.3:8055
1069	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.094-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	33	http://10.0.20.3:8055
1070	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.099-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	34	http://10.0.20.3:8055
1071	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.103-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	35	http://10.0.20.3:8055
1072	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.108-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images_translations	36	http://10.0.20.3:8055
1073	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.112-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logo_Images	10	http://10.0.20.3:8055
1074	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:51:49.117-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
1075	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:06.533-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	171	http://10.0.20.3:8055
1076	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.436-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	125	http://10.0.20.3:8055
1077	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.446-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	126	http://10.0.20.3:8055
1078	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.456-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	127	http://10.0.20.3:8055
1079	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.466-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	128	http://10.0.20.3:8055
1080	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.477-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	129	http://10.0.20.3:8055
1081	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.489-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	130	http://10.0.20.3:8055
1082	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.499-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	131	http://10.0.20.3:8055
1083	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.509-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	132	http://10.0.20.3:8055
1084	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.518-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	133	http://10.0.20.3:8055
1085	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.528-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	168	http://10.0.20.3:8055
1086	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.541-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	171	http://10.0.20.3:8055
1087	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.553-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	134	http://10.0.20.3:8055
1088	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:11.565-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
1089	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:13.732-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	171	http://10.0.20.3:8055
1090	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.182-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	125	http://10.0.20.3:8055
1091	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.194-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	126	http://10.0.20.3:8055
1092	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.204-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	127	http://10.0.20.3:8055
1093	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.213-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	128	http://10.0.20.3:8055
1094	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.222-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	129	http://10.0.20.3:8055
1095	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.232-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	130	http://10.0.20.3:8055
1096	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.241-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	131	http://10.0.20.3:8055
1097	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.25-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	132	http://10.0.20.3:8055
1098	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.261-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	168	http://10.0.20.3:8055
1099	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.27-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	171	http://10.0.20.3:8055
1100	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.28-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	133	http://10.0.20.3:8055
1101	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.291-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	134	http://10.0.20.3:8055
1102	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:54:21.3-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	147	http://10.0.20.3:8055
1103	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:02:20.552-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	172	http://10.0.20.3:8055
1104	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:02:20.559-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	173	http://10.0.20.3:8055
1105	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:02:20.565-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	174	http://10.0.20.3:8055
1106	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:02:20.57-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	175	http://10.0.20.3:8055
1107	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:02:20.575-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	176	http://10.0.20.3:8055
1108	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:02:20.579-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	177	http://10.0.20.3:8055
1109	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:02:20.584-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	178	http://10.0.20.3:8055
1110	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:02:20.589-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	map_animation	http://10.0.20.3:8055
1111	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:04:03.175-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	179	http://10.0.20.3:8055
1112	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:04:03.414-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	180	http://10.0.20.3:8055
1113	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:04:03.42-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	map_animation_start_city	http://10.0.20.3:8055
1114	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:04:03.498-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	181	http://10.0.20.3:8055
1115	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:04:03.63-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	182	http://10.0.20.3:8055
1116	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:04:03.767-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	183	http://10.0.20.3:8055
1117	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:04:26.818-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	179	http://10.0.20.3:8055
1118	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:05:21.793-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	184	http://10.0.20.3:8055
1119	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:05:26.326-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	179	http://10.0.20.3:8055
1120	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:06:07.261-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	185	http://10.0.20.3:8055
1121	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:06:07.409-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	186	http://10.0.20.3:8055
1122	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:06:07.414-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	map_animation_Map_Cities	http://10.0.20.3:8055
1123	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:06:07.48-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	187	http://10.0.20.3:8055
1124	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:06:07.619-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	188	http://10.0.20.3:8055
1125	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:06:16.902-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	184	http://10.0.20.3:8055
1126	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:06:19.168-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	185	http://10.0.20.3:8055
1127	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:06:39.04-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation	1	http://10.0.20.3:8055
1128	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:07:13.377-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	185	http://10.0.20.3:8055
1129	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:07:49.841-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation_Map_Cities	1	http://10.0.20.3:8055
1130	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:07:49.846-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation_Map_Cities	2	http://10.0.20.3:8055
1131	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:07:49.852-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation	1	http://10.0.20.3:8055
1132	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:15.075-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	189	http://10.0.20.3:8055
1133	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:19.539-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	172	http://10.0.20.3:8055
1134	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:19.549-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	173	http://10.0.20.3:8055
1135	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:19.558-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	189	http://10.0.20.3:8055
1136	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:19.567-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	174	http://10.0.20.3:8055
1137	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:19.577-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	175	http://10.0.20.3:8055
1138	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:19.585-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	176	http://10.0.20.3:8055
1139	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:19.595-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	177	http://10.0.20.3:8055
1140	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:19.606-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	178	http://10.0.20.3:8055
1141	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:19.614-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	184	http://10.0.20.3:8055
1142	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:19.622-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	185	http://10.0.20.3:8055
1143	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:08:37.601-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation	1	http://10.0.20.3:8055
1144	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:09:15.273-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation_Map_Cities	3	http://10.0.20.3:8055
1145	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:09:15.279-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation	2	http://10.0.20.3:8055
1146	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:10:20.984-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	185	http://10.0.20.3:8055
1147	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:11:01.376-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	185	http://10.0.20.3:8055
1148	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:11:43.58-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation_Map_Cities	4	http://10.0.20.3:8055
1149	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:11:43.586-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation_Map_Cities	5	http://10.0.20.3:8055
1150	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:11:43.59-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation	3	http://10.0.20.3:8055
1151	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:12:04.457-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	167	http://10.0.20.3:8055
1152	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:12:57.243-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	190	http://10.0.20.3:8055
1153	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:13:23.149-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	190	http://10.0.20.3:8055
1154	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:14:04.501-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
1155	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:14:27.687-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	190	http://10.0.20.3:8055
1156	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:15:39.877-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	191	http://10.0.20.3:8055
1157	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:16:53.724-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	191	http://10.0.20.3:8055
1158	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:18:07.616-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	192	http://10.0.20.3:8055
1159	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:18:28.598-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	192	http://10.0.20.3:8055
1160	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:19:05.605-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	193	http://10.0.20.3:8055
1161	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:19:39.054-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	map_animation	http://10.0.20.3:8055
1162	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:19:45.861-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	hero	http://10.0.20.3:8055
1163	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:20:13.013-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	193	http://10.0.20.3:8055
1164	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:20:35.659-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation	1	http://10.0.20.3:8055
1165	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:20:35.669-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation	2	http://10.0.20.3:8055
1166	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:20:35.677-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	map_animation	3	http://10.0.20.3:8055
1167	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:20:35.683-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
1168	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:26:40.309-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_collections	map_animation_start_city	http://10.0.20.3:8055
1169	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:26:40.313-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	180	http://10.0.20.3:8055
1170	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:26:40.314-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	181	http://10.0.20.3:8055
1171	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:26:40.315-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	182	http://10.0.20.3:8055
1172	delete	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:26:40.316-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_fields	183	http://10.0.20.3:8055
1173	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:27:24.852-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	36	http://10.0.20.3:8055
1174	create	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:27:24.857-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_permissions	37	http://10.0.20.3:8055
1175	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:27:24.861-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://10.0.20.3:8055
1176	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:29:53.258-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	1	http://10.0.20.3:8055
1177	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:29:53.268-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	3	http://10.0.20.3:8055
1178	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:29:53.276-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	4	http://10.0.20.3:8055
1179	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:29:53.284-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero_translations	2	http://10.0.20.3:8055
1180	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:29:53.29-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	hero	1	http://10.0.20.3:8055
1181	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:37:51.137-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
1182	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:52:14.398-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
1183	update	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:58:59.609-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	Trust_Logos	1	http://10.0.20.3:8055
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
languages	language_chinese_dayi	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	General_Settings	open	\N	f
company	business_center	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	2	General_Settings	open	\N	f
navigation	account_tree	\N	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	1	Menus	open	\N	f
company_translations	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	company	open	\N	f
hero_translations	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	3	Landing_Page	open	\N	f
pages	article	\N	\N	f	f	\N	status	t	archived	draft	sort	all	\N	[]	1	\N	open	\N	f
Landing_Page	folder	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	2	\N	open	\N	f
Menus	account_tree	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	3	\N	open	\N	f
General_Settings	settings	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	4	\N	open	\N	f
Trust_Logos_translations	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	5	\N	open	\N	f
Trust_Logo_Images_translations	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	6	\N	open	\N	f
Trust_Logos	typo3	\N	\N	f	t	\N	status	t	archived	draft	\N	all	\N	\N	2	Landing_Page	open	\N	f
Trust_Logo_Images	typo3	\N	\N	t	f	\N	status	t	archived	draft	sort	all	\N	\N	1	Trust_Logos	open	\N	f
pages_translations	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	pages	open	\N	f
Map_Cities	\N	\N	\N	t	f	\N	status	t	archived	draft	sort	all	\N	\N	\N	\N	open	\N	f
map_animation_Map_Cities	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
navigation_translations	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	navigation	open	\N	f
map_animation	\N	\N	\N	t	f	\N	status	t	archived	draft	sort	all	\N	\N	\N	\N	open	\N	f
hero	exclamation	\N	\N	f	t	\N	status	t	archived	draft	\N	all	\N	\N	1	Landing_Page	open	\N	f
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
132	Trust_Logos	Monochrome_Color	\N	select-color	{"opacity":true,"presets":[{"name":"Light Gray","color":"#BBBBBB"}]}	\N	\N	f	f	8	half	\N	\N	\N	f	\N	\N	\N
133	Trust_Logos	Enable_Links	cast-boolean	boolean	\N	\N	\N	f	f	11	half	\N	\N	\N	f	\N	\N	\N
130	Trust_Logos	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
131	Trust_Logos	is_monochrome	cast-boolean	boolean	\N	\N	\N	f	f	7	half	\N	\N	\N	f	\N	\N	\N
21	pages	translations	translations	translations	{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true}	translations	{"languageField":"code","defaultLanguage":"en"}	f	f	9	fill	\N	\N	\N	f	\N	\N	\N
42	navigation_translations	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
7	pages	id	uuid	input	\N	\N	\N	t	t	1	half	\N	\N	\N	f	\N	\N	\N
14	pages	slug	\N	input	\N	\N	\N	f	f	2	half	\N	\N	\N	t	\N	\N	\N
8	pages	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	3	half	\N	\N	\N	f	\N	\N	\N
43	navigation_translations	navigation_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
11	pages	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
10	pages	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
28	pages_translations	title	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
29	pages_translations	hero_title	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
44	navigation_translations	languages_code	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
13	pages	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
45	navigation_translations	label	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
12	pages	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	7	half	\N	\N	\N	f	\N	\N	\N
18	pages	hero_image	file	file-image	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
22	pages_translations	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
23	languages	code	\N	\N	\N	\N	\N	f	f	1	full	\N	\N	\N	f	\N	\N	\N
24	languages	name	\N	\N	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
25	languages	direction	\N	select-dropdown	{"choices":[{"text":"$t:left_to_right","value":"ltr"},{"text":"$t:right_to_left","value":"rtl"}]}	labels	{"choices":[{"text":"$t:left_to_right","value":"ltr"},{"text":"$t:right_to_left","value":"rtl"}],"format":false}	f	f	3	full	\N	\N	\N	f	\N	\N	\N
26	pages_translations	pages_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
27	pages_translations	languages_code	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
30	pages_translations	hero_subtitle	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
38	navigation	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	8	half	\N	\N	\N	f	\N	\N	\N
9	pages	sort	\N	input	\N	\N	\N	f	t	10	full	\N	\N	\N	f	\N	\N	\N
46	navigation	isButton	cast-boolean	boolean	{"label":"Display as Button"}	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N
34	navigation	sort	\N	input	\N	\N	\N	f	t	9	half	\N	\N	\N	f	\N	\N	\N
39	navigation	location	\N	select-radio	{"choices":[{"text":"Header","value":"header"},{"text":"Footer","value":"footer"}]}	\N	\N	f	f	4	half	\N	\N	\N	t	\N	\N	\N
35	navigation	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
36	navigation	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
53	company_translations	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
54	company_translations	company_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
31	pages_translations	body	\N	input-rich-text-md	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
37	navigation	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	7	half	\N	\N	\N	f	\N	\N	\N
55	company_translations	languages_code	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
40	navigation	href	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
41	navigation	translations	translations	translations	{"defaultLanguage":"en","defaultOpenSplitView":true,"languageField":"name"}	\N	{"languageField":"name","defaultLanguage":"en"}	f	f	11	full	\N	\N	\N	f	\N	\N	\N
57	company_translations	tagline	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
32	navigation	id	\N	input	\N	\N	\N	t	t	1	half	\N	\N	\N	f	\N	\N	\N
33	navigation	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	half	\N	\N	\N	f	\N	\N	\N
58	company_translations	SEO_Meta_Title_Append	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
48	company	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	2	half	\N	\N	\N	f	\N	\N	\N
49	company	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
50	company	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
51	company	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
60	company	name	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
52	company	translations	translations	translations	{"languageField":"name","defaultOpenSplitView":true}	translations	{"languageField":"name"}	f	f	7	full	\N	\N	\N	f	\N	\N	\N
59	company	logo	file	file-image	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
47	company	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
157	Trust_Logo_Images	Label	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
74	hero_translations	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
75	hero_translations	hero_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
76	hero_translations	languages_code	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
82	hero_translations	heading	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
67	hero	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
68	hero	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
69	hero	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
70	hero	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
71	hero	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
72	hero	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
88	hero_translations	heading_highlighted	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
78	navigation	icon	\N	select-icon	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N
79	navigation_translations	description	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
81	hero_translations	supporting_text	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
83	hero_translations	CTA	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
85	hero_translations	CTA2	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
84	navigation	parent	m2o	select-dropdown-m2o	\N	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N
73	hero	translations	translations	translations	{"defaultOpenSplitView":true,"languageField":"name","defaultLanguage":"en"}	translations	{"languageField":"name"}	f	f	7	full	\N	\N	\N	f	\N	\N	\N
86	company	favicon	file	file-image	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
87	company	useFaviconInHeader	cast-boolean	boolean	\N	\N	\N	f	f	8	half	\N	\N	\N	f	\N	\N	\N
127	Trust_Logos	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
128	Trust_Logos	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
129	Trust_Logos	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
159	Map_Cities	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
160	Map_Cities	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
161	Map_Cities	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
162	Map_Cities	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
172	map_animation	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
174	map_animation	sort	\N	input	\N	\N	\N	f	t	4	full	\N	\N	\N	f	\N	\N	\N
163	Map_Cities	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
164	Map_Cities	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
165	Map_Cities	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
170	Map_Cities	Name	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
168	Trust_Logos	scroll_logos	cast-boolean	boolean	\N	\N	\N	f	f	9	half	\N	\N	\N	f	\N	\N	\N
175	map_animation	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
125	Trust_Logos	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
126	Trust_Logos	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
135	Trust_Logos_translations	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
136	Trust_Logos_translations	Trust_Logos_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
137	Trust_Logos_translations	languages_code	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
138	Trust_Logos_translations	Intro_Text	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
186	map_animation_Map_Cities	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
153	Trust_Logo_Images_translations	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
154	Trust_Logo_Images_translations	Trust_Logo_Images_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
155	Trust_Logo_Images_translations	languages_code	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
156	Trust_Logo_Images_translations	alt_text	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
187	map_animation_Map_Cities	map_animation_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
169	Map_Cities	location	\N	map	{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"}	\N	\N	f	f	10	full	\N	\N	\N	t	\N	\N	\N
166	Map_Cities	parent	m2o	\N	\N	\N	\N	f	t	9	full	\N	\N	\N	f	\N	\N	\N
188	map_animation_Map_Cities	Map_Cities_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
178	map_animation	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	8	half	\N	\N	\N	f	\N	\N	\N
193	hero	animations	o2m	list-o2m	{"template":"{{Name}}"}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
171	Trust_Logos	scroll_speed	\N	slider	{"minValue":10,"maxValue":120,"stepInterval":1}	\N	\N	f	f	10	half	\N	\N	\N	f	\N	\N	\N
134	Trust_Logos	translations	translations	translations	{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true}	translations	{"languageField":"name","defaultLanguage":"en"}	f	f	12	full	\N	\N	\N	f	\N	\N	\N
147	Trust_Logos	Logos	o2m	list-o2m	{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{status}} {{Label}}"}	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N
139	Trust_Logo_Images	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
140	Trust_Logo_Images	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	3	full	\N	\N	\N	f	\N	\N	\N
141	Trust_Logo_Images	sort	\N	input	\N	\N	\N	f	t	4	full	\N	\N	\N	f	\N	\N	\N
142	Trust_Logo_Images	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
143	Trust_Logo_Images	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
144	Trust_Logo_Images	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	7	half	\N	\N	\N	f	\N	\N	\N
145	Trust_Logo_Images	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	8	half	\N	\N	\N	f	\N	\N	\N
149	Trust_Logo_Images	Logo_Image	file	file-image	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
151	Trust_Logo_Images	href	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
152	Trust_Logo_Images	translations	translations	translations	{"defaultOpenSplitView":true,"languageField":"name","defaultLanguage":"en"}	translations	{"languageField":"name","defaultLanguage":"en"}	f	f	11	full	\N	\N	\N	f	\N	\N	\N
146	Trust_Logo_Images	section	m2o	select-dropdown-m2o	{"enableLink":true}	related-values	\N	f	t	12	full	\N	\N	\N	f	\N	\N	\N
158	hero_translations	supporting_text2	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
173	map_animation	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
184	map_animation	start	m2o	select-dropdown-m2o	{"template":"{{Name}}"}	\N	\N	f	f	9	half	\N	\N	\N	f	\N	\N	\N
189	map_animation	Name	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
176	map_animation	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
177	map_animation	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar}} {{first_name}} {{last_name}}"}	user	\N	t	t	7	half	\N	\N	\N	f	\N	\N	\N
185	map_animation	end_city	m2m	list-m2m	{"enableCreate":false,"template":"{{Map_Cities_id.Name}}","layout":"table","fields":["Map_Cities_id.Name"]}	\N	\N	f	f	10	half	\N	\N	\N	f	\N	\N	\N
192	map_animation	hero	m2o	select-dropdown-m2o	{"enableSelect":false,"enableCreate":false}	\N	\N	f	t	11	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
893633e0-d183-4e63-bdde-1ec61ae92ff5	gcs	893633e0-d183-4e63-bdde-1ec61ae92ff5.svg	replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg	Replicate Prediction K74xhhpn11rma0cs4p08az29zr	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 15:27:03.621-04	\N	2025-09-07 15:27:04.153-04	\N	10339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-07 15:27:04.151-04
1fb1f6b8-ba4d-4301-8a72-decb8dd89c71	gcs	1fb1f6b8-ba4d-4301-8a72-decb8dd89c71.png	favicon.png	Favicon	image/png	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:16:19.467-04	\N	2025-09-07 23:16:19.918-04	\N	6707	212	199	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-09-07 23:16:19.917-04
29b5aedc-d2b2-423e-90c5-43181d3824b8	gcs	29b5aedc-d2b2-423e-90c5-43181d3824b8.svg	Google_2015_logo.svg	Google 2015 Logo	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:26:28.655-04	\N	2025-09-08 09:26:29.282-04	\N	1906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 09:26:29.281-04
0c316c98-891a-45f2-b878-b5fa454cc1ca	gcs	0c316c98-891a-45f2-b878-b5fa454cc1ca.svg	Google_2015_logo.svg	Google 2015 Logo	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 09:56:54.089-04	\N	2025-09-08 09:56:54.462-04	\N	1906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 09:56:54.461-04
010d86f5-4725-4504-bfbe-c38b55cd6c20	gcs	010d86f5-4725-4504-bfbe-c38b55cd6c20.png	LI-Logo.png	Li Logo	image/png	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:07:14.687-04	\N	2025-09-08 11:07:15.01-04	\N	25367	2212	540	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-09-08 11:07:15.009-04
18b14f63-1d2c-4f47-aebc-e4fd7a55df5e	gcs	18b14f63-1d2c-4f47-aebc-e4fd7a55df5e.svg	United_Parcel_Service_logo_2014.svg	United Parcel Service Logo 2014.svg	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:33:31.304-04	\N	2025-09-08 11:33:31.646-04	\N	2357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 11:33:31.645-04
6d0b105d-1845-4e73-9a8d-939e2c4406ce	gcs	6d0b105d-1845-4e73-9a8d-939e2c4406ce.svg	DB_Schenker_logo.svg	DB Schenker Logo.svg	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:34:49.158-04	\N	2025-09-08 11:34:49.353-04	\N	9486	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 11:34:49.351-04
d752773c-8023-430b-a914-8180c52bd990	gcs	d752773c-8023-430b-a914-8180c52bd990.html	Ryder	Ryder	text/html; charset=UTF-8	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:36:14.11-04	\N	2025-09-08 11:36:14.331-04	\N	161040	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 11:36:14.329-04
0874f072-3951-4a37-b07d-0efa9c4322b2	gcs	0874f072-3951-4a37-b07d-0efa9c4322b2.png	Ryder.png	Ryder	image/png	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:36:47.202-04	\N	2025-09-08 11:36:47.564-04	\N	75857	2560	702	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-09-08 11:36:47.562-04
370b1813-1783-4773-a4c8-e6a4ce6971fe	gcs	370b1813-1783-4773-a4c8-e6a4ce6971fe.svg	latest	Latest	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:41:08.931-04	\N	2025-09-08 11:41:09.249-04	\N	2570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 11:41:09.248-04
22a9f2ef-3eb5-46a2-bd0c-494fce784e75	gcs	22a9f2ef-3eb5-46a2-bd0c-494fce784e75.svg	Deutsche_Post_bw.svg	Deutsche Post Bw.svg	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:42:51.311-04	\N	2025-09-08 11:42:51.5-04	\N	8817	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 11:42:51.499-04
1c7d9621-79f2-4833-8266-87c9c3282c55	gcs	1c7d9621-79f2-4833-8266-87c9c3282c55.svg	XPO_Logistics_logo.svg	Xpo Logistics Logo.svg	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:44:03.103-04	\N	2025-09-08 11:44:03.301-04	\N	3286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 11:44:03.3-04
534613e9-de55-49fe-bba9-fe525dfddca0	gcs	534613e9-de55-49fe-bba9-fe525dfddca0.svg	CN_Railway_logo.svg	Cn Railway Logo.svg	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:46:36.113-04	\N	2025-09-08 11:46:36.307-04	\N	294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 11:46:36.306-04
dbf78878-f604-44e1-9186-7088c79289a3	gcs	dbf78878-f604-44e1-9186-7088c79289a3.svg	idb4fz6gDv_1757346520362.svg	Idb4fz6g Dv 1757346520362	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:48:51.555-04	\N	2025-09-08 11:48:51.92-04	\N	3244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 11:48:51.919-04
0ebdfdd1-c2c8-41cd-8ae2-d62cb1b892f4	gcs	0ebdfdd1-c2c8-41cd-8ae2-d62cb1b892f4.svg	TNT_Logo.svg	Tnt Logo.svg	image/svg+xml	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 11:50:37.529-04	\N	2025-09-08 11:50:37.729-04	\N	7168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-09-08 11:50:37.728-04
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2025-09-05 22:41:30.258291-04
20201029A	Remove System Relations	2025-09-05 22:41:30.269064-04
20201029B	Remove System Collections	2025-09-05 22:41:30.281874-04
20201029C	Remove System Fields	2025-09-05 22:41:30.296815-04
20201105A	Add Cascade System Relations	2025-09-05 22:41:30.404688-04
20201105B	Change Webhook URL Type	2025-09-05 22:41:30.422969-04
20210225A	Add Relations Sort Field	2025-09-05 22:41:30.435613-04
20210304A	Remove Locked Fields	2025-09-05 22:41:30.442756-04
20210312A	Webhooks Collections Text	2025-09-05 22:41:30.45586-04
20210331A	Add Refresh Interval	2025-09-05 22:41:30.462215-04
20210415A	Make Filesize Nullable	2025-09-05 22:41:30.480616-04
20210416A	Add Collections Accountability	2025-09-05 22:41:30.491749-04
20210422A	Remove Files Interface	2025-09-05 22:41:30.497161-04
20210506A	Rename Interfaces	2025-09-05 22:41:30.540822-04
20210510A	Restructure Relations	2025-09-05 22:41:30.57324-04
20210518A	Add Foreign Key Constraints	2025-09-05 22:41:30.586641-04
20210519A	Add System Fk Triggers	2025-09-05 22:41:30.637089-04
20210521A	Add Collections Icon Color	2025-09-05 22:41:30.644141-04
20210525A	Add Insights	2025-09-05 22:41:30.673797-04
20210608A	Add Deep Clone Config	2025-09-05 22:41:30.680274-04
20210626A	Change Filesize Bigint	2025-09-05 22:41:30.701508-04
20210716A	Add Conditions to Fields	2025-09-05 22:41:30.707896-04
20210721A	Add Default Folder	2025-09-05 22:41:30.718803-04
20210802A	Replace Groups	2025-09-05 22:41:30.726065-04
20210803A	Add Required to Fields	2025-09-05 22:41:30.732184-04
20210805A	Update Groups	2025-09-05 22:41:30.738989-04
20210805B	Change Image Metadata Structure	2025-09-05 22:41:30.746725-04
20210811A	Add Geometry Config	2025-09-05 22:41:30.753344-04
20210831A	Remove Limit Column	2025-09-05 22:41:30.763282-04
20210903A	Add Auth Provider	2025-09-05 22:41:30.799135-04
20210907A	Webhooks Collections Not Null	2025-09-05 22:41:30.816082-04
20210910A	Move Module Setup	2025-09-05 22:41:30.825371-04
20210920A	Webhooks URL Not Null	2025-09-05 22:41:30.842111-04
20210924A	Add Collection Organization	2025-09-05 22:41:30.854273-04
20210927A	Replace Fields Group	2025-09-05 22:41:30.871755-04
20210927B	Replace M2M Interface	2025-09-05 22:41:30.875924-04
20210929A	Rename Login Action	2025-09-05 22:41:30.879924-04
20211007A	Update Presets	2025-09-05 22:41:30.891043-04
20211009A	Add Auth Data	2025-09-05 22:41:30.896744-04
20211016A	Add Webhook Headers	2025-09-05 22:41:30.902586-04
20211103A	Set Unique to User Token	2025-09-05 22:41:30.910822-04
20211103B	Update Special Geometry	2025-09-05 22:41:30.915818-04
20211104A	Remove Collections Listing	2025-09-05 22:41:30.922213-04
20211118A	Add Notifications	2025-09-05 22:41:30.949121-04
20211211A	Add Shares	2025-09-05 22:41:30.981808-04
20211230A	Add Project Descriptor	2025-09-05 22:41:30.988436-04
20220303A	Remove Default Project Color	2025-09-05 22:41:31.003996-04
20220308A	Add Bookmark Icon and Color	2025-09-05 22:41:31.012337-04
20220314A	Add Translation Strings	2025-09-05 22:41:31.019023-04
20220322A	Rename Field Typecast Flags	2025-09-05 22:41:31.026525-04
20220323A	Add Field Validation	2025-09-05 22:41:31.033061-04
20220325A	Fix Typecast Flags	2025-09-05 22:41:31.041482-04
20220325B	Add Default Language	2025-09-05 22:41:31.062989-04
20220402A	Remove Default Value Panel Icon	2025-09-05 22:41:31.078221-04
20220429A	Add Flows	2025-09-05 22:41:31.130275-04
20220429B	Add Color to Insights Icon	2025-09-05 22:41:31.137265-04
20220429C	Drop Non Null From IP of Activity	2025-09-05 22:41:31.143497-04
20220429D	Drop Non Null From Sender of Notifications	2025-09-05 22:41:31.150406-04
20220614A	Rename Hook Trigger to Event	2025-09-05 22:41:31.156943-04
20220801A	Update Notifications Timestamp Column	2025-09-05 22:41:31.173163-04
20220802A	Add Custom Aspect Ratios	2025-09-05 22:41:31.179918-04
20220826A	Add Origin to Accountability	2025-09-05 22:41:31.188637-04
20230401A	Update Material Icons	2025-09-05 22:41:31.206299-04
20230525A	Add Preview Settings	2025-09-05 22:41:31.213047-04
20230526A	Migrate Translation Strings	2025-09-05 22:41:31.232906-04
20230721A	Require Shares Fields	2025-09-05 22:41:31.245372-04
20230823A	Add Content Versioning	2025-09-05 22:41:31.278196-04
20230927A	Themes	2025-09-05 22:41:31.314228-04
20231009A	Update CSV Fields to Text	2025-09-05 22:41:31.322611-04
20231009B	Update Panel Options	2025-09-05 22:41:31.327592-04
20231010A	Add Extensions	2025-09-05 22:41:31.335275-04
20231215A	Add Focalpoints	2025-09-05 22:41:31.340532-04
20240122A	Add Report URL Fields	2025-09-05 22:41:31.346057-04
20240204A	Marketplace	2025-09-05 22:41:31.394991-04
20240305A	Change Useragent Type	2025-09-05 22:41:31.417496-04
20240311A	Deprecate Webhooks	2025-09-05 22:41:31.434827-04
20240422A	Public Registration	2025-09-05 22:41:31.446946-04
20240515A	Add Session Window	2025-09-05 22:41:31.453749-04
20240701A	Add Tus Data	2025-09-05 22:41:31.461009-04
20240716A	Update Files Date Fields	2025-09-05 22:41:31.47573-04
20240806A	Permissions Policies	2025-09-05 22:41:31.553901-04
20240817A	Update Icon Fields Length	2025-09-05 22:41:31.618382-04
20240909A	Separate Comments	2025-09-05 22:41:31.640889-04
20240909B	Consolidate Content Versioning	2025-09-05 22:41:31.647749-04
20240924A	Migrate Legacy Comments	2025-09-05 22:41:31.657967-04
20240924B	Populate Versioning Deltas	2025-09-05 22:41:31.666067-04
20250224A	Visual Editor	2025-09-05 22:41:31.673502-04
20250609A	License Banner	2025-09-05 22:41:31.683505-04
20250613A	Add Project ID	2025-09-05 22:41:31.707818-04
20250718A	Add Direction	2025-09-05 22:41:31.714667-04
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
21	navigation	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
22	navigation_translations	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
23	pages	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
24	pages_translations	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
25	languages	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
26	company_translations	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
27	company	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
28	directus_files	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
29	hero	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
30	hero_translations	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
31	Trust_Logos	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
32	Trust_Logos_translations	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
33	Trust_Logo_Images_translations	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
34	Trust_Logo_Images	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
35	Map_Cities	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
36	map_animation	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
37	map_animation_Map_Cities	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
63994293-f78c-4f9b-8c9a-e2241cd53433	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
2	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	\N	pages	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
1	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	\N	languages	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
4	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	\N	company	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
3	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	\N	navigation	\N	tabular	{"tabular":{"page":1},"map":{"limit":1000}}	{"kanban":{"groupOrder":{"groupField":"status","sortMap":{"published":0,"draft":1,"archived":2}}},"tabular":{"spacing":"cozy"}}	30	\N	bookmark	\N
5	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	\N	hero	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
8	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	\N	Map_Cities	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
9	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	\N	map_animation	\N	\N	{"tabular":{"fields":["Name","end_city","start","status"]}}	{"tabular":{"widths":{"Name":364,"end_city":160,"start":160,"status":160}}}	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
2	pages	user_created	directus_users	\N	\N	\N	\N	\N	nullify
3	pages	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
4	pages	hero_image	directus_files	\N	\N	\N	\N	\N	nullify
5	pages_translations	languages_code	languages	\N	\N	\N	pages_id	\N	nullify
6	pages_translations	pages_id	pages	translations	\N	\N	languages_code	\N	nullify
7	navigation	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
8	navigation	user_created	directus_users	\N	\N	\N	\N	\N	nullify
9	navigation_translations	languages_code	languages	\N	\N	\N	navigation_id	\N	nullify
10	navigation_translations	navigation_id	navigation	translations	\N	\N	languages_code	\N	nullify
11	company	user_created	directus_users	\N	\N	\N	\N	\N	nullify
12	company	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
13	company_translations	languages_code	languages	\N	\N	\N	company_id	\N	nullify
14	company_translations	company_id	company	translations	\N	\N	languages_code	\N	nullify
16	company	logo	directus_files	\N	\N	\N	\N	\N	nullify
19	hero	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
20	hero	user_created	directus_users	\N	\N	\N	\N	\N	nullify
21	hero_translations	languages_code	languages	\N	\N	\N	hero_id	\N	nullify
22	hero_translations	hero_id	hero	translations	\N	\N	languages_code	\N	nullify
24	navigation	parent	navigation	\N	\N	\N	\N	\N	nullify
25	company	favicon	directus_files	\N	\N	\N	\N	\N	nullify
36	Trust_Logos	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
37	Trust_Logos	user_created	directus_users	\N	\N	\N	\N	\N	nullify
38	Trust_Logos_translations	languages_code	languages	\N	\N	\N	Trust_Logos_id	\N	nullify
39	Trust_Logos_translations	Trust_Logos_id	Trust_Logos	translations	\N	\N	languages_code	\N	nullify
40	Trust_Logo_Images	user_created	directus_users	\N	\N	\N	\N	\N	nullify
41	Trust_Logo_Images	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
42	Trust_Logo_Images	section	Trust_Logos	Logos	\N	\N	\N	sort	nullify
44	Trust_Logo_Images	Logo_Image	directus_files	\N	\N	\N	\N	\N	nullify
45	Trust_Logo_Images_translations	languages_code	languages	\N	\N	\N	Trust_Logo_Images_id	\N	nullify
46	Trust_Logo_Images_translations	Trust_Logo_Images_id	Trust_Logo_Images	translations	\N	\N	languages_code	\N	nullify
47	Map_Cities	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
48	Map_Cities	user_created	directus_users	\N	\N	\N	\N	\N	nullify
50	map_animation	user_created	directus_users	\N	\N	\N	\N	\N	nullify
51	map_animation	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
54	map_animation	start	Map_Cities	\N	\N	\N	\N	\N	nullify
55	map_animation_Map_Cities	Map_Cities_id	Map_Cities	\N	\N	\N	map_animation_id	\N	nullify
56	map_animation_Map_Cities	map_animation_id	map_animation	end_city	\N	\N	Map_Cities_id	\N	nullify
49	Map_Cities	parent	hero	\N	\N	\N	\N	\N	nullify
57	map_animation	hero	hero	animations	\N	\N	\N	sort	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"accepted_terms":true,"project_id":"01991ce6-7e37-7754-b267-d68f07c17098"}	{"accepted_terms":true}	\N	\N
2	3	directus_fields	1	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Articles"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Articles"}	\N	\N
3	4	directus_fields	2	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Articles"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Articles"}	\N	\N
4	5	directus_fields	3	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"Articles"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"Articles"}	\N	\N
5	6	directus_fields	4	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Articles"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Articles"}	\N	\N
6	7	directus_collections	Articles	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Articles"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Articles"}	\N	\N
8	10	directus_fields	5	{"sort":5,"interface":"input-rich-text-html","special":null,"required":true,"options":{"toolbar":["undo","redo","bold","italic","underline","strikethrough","h1","h2","h3","alignleft","aligncenter","alignright","alignjustify","numlist","bullist","removeformat","blockquote","customLink","customImage","customMedia","table","hr","fullscreen","code"]},"collection":"Articles","field":"main_content"}	{"sort":5,"interface":"input-rich-text-html","special":null,"required":true,"options":{"toolbar":["undo","redo","bold","italic","underline","strikethrough","h1","h2","h3","alignleft","aligncenter","alignright","alignjustify","numlist","bullist","removeformat","blockquote","customLink","customImage","customMedia","table","hr","fullscreen","code"]},"collection":"Articles","field":"main_content"}	\N	\N
9	11	directus_fields	6	{"sort":6,"interface":"file-image","special":["file"],"collection":"Articles","field":"featured_image"}	{"sort":6,"interface":"file-image","special":["file"],"collection":"Articles","field":"featured_image"}	\N	\N
10	19	directus_fields	7	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"pages"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"pages"}	\N	\N
11	20	directus_fields	8	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"pages"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"pages"}	\N	\N
12	21	directus_fields	9	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"pages"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"pages"}	\N	\N
243	267	languages	en	{"code":"en","name":"English"}	{"code":"en","name":"English"}	\N	\N
830	923	Trust_Logos_translations	3	{"Intro_Text":"Vertraut von wachsenden Unternehmen in Logistik, SaaS und Transport","languages_code":{"code":"de"},"Trust_Logos_id":1}	{"Intro_Text":"Vertraut von wachsenden Unternehmen in Logistik, SaaS und Transport","languages_code":{"code":"de"},"Trust_Logos_id":1}	832	\N
13	22	directus_fields	10	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"pages"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"pages"}	\N	\N
14	23	directus_fields	11	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages"}	\N	\N
15	24	directus_fields	12	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages"}	\N	\N
16	25	directus_fields	13	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages"}	\N	\N
17	26	directus_collections	pages	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"pages"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"pages"}	\N	\N
18	27	directus_fields	14	{"sort":8,"interface":"input","special":null,"required":true,"collection":"pages","field":"slug"}	{"sort":8,"interface":"input","special":null,"required":true,"collection":"pages","field":"slug"}	\N	\N
19	28	directus_fields	15	{"sort":9,"interface":"input","special":null,"collection":"pages","field":"title"}	{"sort":9,"interface":"input","special":null,"collection":"pages","field":"title"}	\N	\N
20	29	directus_fields	16	{"sort":10,"interface":"input","special":null,"collection":"pages","field":"hero_title"}	{"sort":10,"interface":"input","special":null,"collection":"pages","field":"hero_title"}	\N	\N
21	30	directus_fields	17	{"sort":11,"interface":"input","special":null,"collection":"pages","field":"hero_subtitle"}	{"sort":11,"interface":"input","special":null,"collection":"pages","field":"hero_subtitle"}	\N	\N
22	31	directus_fields	18	{"sort":12,"interface":"file-image","special":["file"],"collection":"pages","field":"hero_image"}	{"sort":12,"interface":"file-image","special":["file"],"collection":"pages","field":"hero_image"}	\N	\N
23	32	directus_fields	19	{"sort":13,"interface":"input-rich-text-md","special":null,"collection":"pages","field":"body"}	{"sort":13,"interface":"input-rich-text-md","special":null,"collection":"pages","field":"body"}	\N	\N
24	33	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"article"}	\N	\N
25	34	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"Documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"accepted_terms":true,"project_id":"01991ce6-7e37-7754-b267-d68f07c17098"}	{"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"Documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true}]}	\N	\N
26	35	directus_fields	20	{"sort":14,"interface":"select-dropdown","special":null,"required":true,"options":{"choices":[{"text":"English","value":"en"},{"text":"French","value":"fr"},{"text":"German","value":"de"},{"text":"Spanish","value":"es"}],"icon":"language"},"collection":"pages","field":"locale"}	{"sort":14,"interface":"select-dropdown","special":null,"required":true,"options":{"choices":[{"text":"English","value":"en"},{"text":"French","value":"fr"},{"text":"German","value":"de"},{"text":"Spanish","value":"es"}],"icon":"language"},"collection":"pages","field":"locale"}	\N	\N
27	36	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
28	37	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
244	268	languages	de	{"code":"de","name":"German"}	{"code":"de","name":"German"}	\N	\N
245	269	languages	es	{"code":"es","name":"Spanish"}	{"code":"es","name":"Spanish"}	\N	\N
29	38	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":3,"group":null}	\N	\N
30	39	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":4,"group":null}	\N	\N
31	40	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":5,"group":null}	\N	\N
32	41	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":6,"group":null}	\N	\N
33	42	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":7,"group":null}	\N	\N
34	43	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":8,"group":null}	\N	\N
35	44	directus_fields	15	{"id":15,"collection":"pages","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"title","sort":9,"group":null}	\N	\N
36	45	directus_fields	16	{"id":16,"collection":"pages","field":"hero_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_title","sort":10,"group":null}	\N	\N
37	46	directus_fields	17	{"id":17,"collection":"pages","field":"hero_subtitle","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_subtitle","sort":11,"group":null}	\N	\N
38	47	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":12,"group":null}	\N	\N
39	48	directus_fields	19	{"id":19,"collection":"pages","field":"body","special":null,"interface":"input-rich-text-md","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"body","sort":13,"group":null}	\N	\N
40	49	directus_fields	20	{"id":20,"collection":"pages","field":"locale","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"English","value":"en"},{"text":"French","value":"fr"},{"text":"German","value":"de"},{"text":"Spanish","value":"es"}],"icon":"language"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"locale","sort":14,"group":null}	\N	\N
41	50	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
42	51	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
43	52	directus_fields	20	{"id":20,"collection":"pages","field":"locale","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"English","value":"en"},{"text":"French","value":"fr"},{"text":"German","value":"de"},{"text":"Spanish","value":"es"}],"icon":"language"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"locale","sort":3,"group":null}	\N	\N
44	53	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
45	54	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":5,"group":null}	\N	\N
46	55	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":6,"group":null}	\N	\N
47	56	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":7,"group":null}	\N	\N
48	57	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":8,"group":null}	\N	\N
49	58	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":9,"group":null}	\N	\N
50	59	directus_fields	15	{"id":15,"collection":"pages","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"title","sort":10,"group":null}	\N	\N
51	60	directus_fields	16	{"id":16,"collection":"pages","field":"hero_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_title","sort":11,"group":null}	\N	\N
52	61	directus_fields	17	{"id":17,"collection":"pages","field":"hero_subtitle","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_subtitle","sort":12,"group":null}	\N	\N
53	62	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":13,"group":null}	\N	\N
54	63	directus_fields	19	{"id":19,"collection":"pages","field":"body","special":null,"interface":"input-rich-text-md","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"body","sort":14,"group":null}	\N	\N
55	64	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"item_duplication_fields":[]}	\N	\N
56	65	directus_policies	016d9eea-27c6-4acf-95f3-ac3f26b1f0bc	{"name":"Public","admin_access":false,"app_access":true}	{"name":"Public","admin_access":false,"app_access":true}	\N	\N
57	66	directus_permissions	1	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_collections","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_collections","action":"read"}	\N	\N
58	67	directus_permissions	2	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_fields","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_fields","action":"read"}	\N	\N
59	68	directus_permissions	3	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_relations","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_relations","action":"read"}	\N	\N
60	69	directus_permissions	4	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_translations","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_translations","action":"read"}	\N	\N
61	70	directus_permissions	5	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_activity","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_activity","action":"read"}	\N	\N
62	71	directus_permissions	6	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"read"}	\N	\N
63	72	directus_permissions	7	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":{"comment":{"_nnull":true}},"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"create"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":{"comment":{"_nnull":true}},"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"create"}	\N	\N
64	73	directus_permissions	8	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["comment"],"system":true,"collection":"directus_comments","action":"update"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["comment"],"system":true,"collection":"directus_comments","action":"update"}	\N	\N
65	74	directus_permissions	9	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"delete"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_comments","action":"delete"}	\N	\N
66	75	directus_permissions	10	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"_or":[{"user":{"_eq":"$CURRENT_USER"}},{"_and":[{"user":{"_null":true}},{"role":{"_eq":"$CURRENT_ROLE"}}]},{"_and":[{"user":{"_null":true}},{"role":{"_null":true}}]}]},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"_or":[{"user":{"_eq":"$CURRENT_USER"}},{"_and":[{"user":{"_null":true}},{"role":{"_eq":"$CURRENT_ROLE"}}]},{"_and":[{"user":{"_null":true}},{"role":{"_null":true}}]}]},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"read"}	\N	\N
67	76	directus_permissions	11	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":{"user":{"_eq":"$CURRENT_USER"}},"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"create"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":{"user":{"_eq":"$CURRENT_USER"}},"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"create"}	\N	\N
68	77	directus_permissions	12	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":{"user":{"_eq":"$CURRENT_USER"}},"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"update"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":{"user":{"_eq":"$CURRENT_USER"}},"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"update"}	\N	\N
69	78	directus_permissions	13	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"delete"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_presets","action":"delete"}	\N	\N
70	79	directus_permissions	14	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"id":{"_in":"$CURRENT_ROLES"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_roles","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"id":{"_in":"$CURRENT_ROLES"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_roles","action":"read"}	\N	\N
71	80	directus_permissions	15	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_settings","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_settings","action":"read"}	\N	\N
72	81	directus_permissions	16	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_translations","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_translations","action":"read"}	\N	\N
73	82	directus_permissions	17	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"recipient":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_notifications","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"recipient":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_notifications","action":"read"}	\N	\N
74	83	directus_permissions	18	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"recipient":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["status"],"system":true,"collection":"directus_notifications","action":"update"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"recipient":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["status"],"system":true,"collection":"directus_notifications","action":"update"}	\N	\N
75	84	directus_permissions	19	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_shares","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"system":true,"collection":"directus_shares","action":"read"}	\N	\N
76	85	directus_permissions	20	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"id":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["id","first_name","last_name","last_page","email","password","location","title","description","tags","preferences_divider","avatar","language","appearance","theme_light","theme_dark","tfa_secret","status","role"],"system":true,"collection":"directus_users","action":"read"}	{"policy":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","permissions":{"id":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["id","first_name","last_name","last_page","email","password","location","title","description","tags","preferences_divider","avatar","language","appearance","theme_light","theme_dark","tfa_secret","status","role"],"system":true,"collection":"directus_users","action":"read"}	\N	\N
77	86	directus_policies	016d9eea-27c6-4acf-95f3-ac3f26b1f0bc	{"id":"016d9eea-27c6-4acf-95f3-ac3f26b1f0bc","name":"Public","icon":"badge","description":null,"ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":false,"permissions":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],"users":[],"roles":[]}	{"app_access":false}	\N	\N
78	88	directus_fields	21	{"sort":15,"special":["translations"],"translations":null,"display":"translations","collection":"pages","field":"translations"}	{"sort":15,"special":["translations"],"translations":null,"display":"translations","collection":"pages","field":"translations"}	\N	\N
79	89	directus_fields	22	{"sort":1,"hidden":true,"field":"id","collection":"pages_translations"}	{"sort":1,"hidden":true,"field":"id","collection":"pages_translations"}	\N	\N
80	90	directus_collections	pages_translations	{"hidden":true,"icon":"import_export","collection":"pages_translations"}	{"hidden":true,"icon":"import_export","collection":"pages_translations"}	\N	\N
81	91	directus_fields	23	{"sort":1,"field":"code","collection":"languages"}	{"sort":1,"field":"code","collection":"languages"}	\N	\N
82	92	directus_fields	24	{"sort":2,"field":"name","collection":"languages"}	{"sort":2,"field":"name","collection":"languages"}	\N	\N
83	93	directus_fields	25	{"sort":3,"interface":"select-dropdown","options":{"choices":[{"text":"$t:left_to_right","value":"ltr"},{"text":"$t:right_to_left","value":"rtl"}]},"display":"labels","display_options":{"choices":[{"text":"$t:left_to_right","value":"ltr"},{"text":"$t:right_to_left","value":"rtl"}],"format":false},"field":"direction","collection":"languages"}	{"sort":3,"interface":"select-dropdown","options":{"choices":[{"text":"$t:left_to_right","value":"ltr"},{"text":"$t:right_to_left","value":"rtl"}]},"display":"labels","display_options":{"choices":[{"text":"$t:left_to_right","value":"ltr"},{"text":"$t:right_to_left","value":"rtl"}],"format":false},"field":"direction","collection":"languages"}	\N	\N
84	94	directus_collections	languages	{"collection":"languages"}	{"collection":"languages"}	\N	\N
85	95	directus_fields	26	{"sort":2,"hidden":true,"collection":"pages_translations","field":"pages_id"}	{"sort":2,"hidden":true,"collection":"pages_translations","field":"pages_id"}	\N	\N
86	96	directus_fields	27	{"sort":3,"hidden":true,"collection":"pages_translations","field":"languages_code"}	{"sort":3,"hidden":true,"collection":"pages_translations","field":"languages_code"}	\N	\N
87	97	languages	en-US	{"code":"en-US","name":"English","direction":"ltr"}	{"code":"en-US","name":"English","direction":"ltr"}	\N	\N
88	98	languages	ar-SA	{"code":"ar-SA","name":"Arabic","direction":"rtl"}	{"code":"ar-SA","name":"Arabic","direction":"rtl"}	\N	\N
89	99	languages	de-DE	{"code":"de-DE","name":"German","direction":"ltr"}	{"code":"de-DE","name":"German","direction":"ltr"}	\N	\N
90	100	languages	fr-FR	{"code":"fr-FR","name":"French","direction":"ltr"}	{"code":"fr-FR","name":"French","direction":"ltr"}	\N	\N
91	101	languages	ru-RU	{"code":"ru-RU","name":"Russian","direction":"ltr"}	{"code":"ru-RU","name":"Russian","direction":"ltr"}	\N	\N
92	102	languages	es-ES	{"code":"es-ES","name":"Spanish","direction":"ltr"}	{"code":"es-ES","name":"Spanish","direction":"ltr"}	\N	\N
93	103	languages	it-IT	{"code":"it-IT","name":"Italian","direction":"ltr"}	{"code":"it-IT","name":"Italian","direction":"ltr"}	\N	\N
94	104	languages	pt-BR	{"code":"pt-BR","name":"Portuguese","direction":"ltr"}	{"code":"pt-BR","name":"Portuguese","direction":"ltr"}	\N	\N
95	105	languages	en	{"code":"en","name":"English"}	{"code":"en","name":"English"}	\N	\N
96	112	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":15,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display_options":{"languageField":"name","defaultLanguage":"en-US"},"translations":null}	\N	\N
97	113	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
98	114	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
99	115	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":3,"group":null}	\N	\N
100	116	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":4,"group":null}	\N	\N
101	117	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":5,"group":null}	\N	\N
102	118	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":6,"group":null}	\N	\N
103	119	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":7,"group":null}	\N	\N
104	120	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":8,"group":null}	\N	\N
105	121	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":9,"group":null}	\N	\N
106	122	directus_fields	15	{"id":15,"collection":"pages","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"title","sort":10,"group":null}	\N	\N
107	123	directus_fields	16	{"id":16,"collection":"pages","field":"hero_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_title","sort":11,"group":null}	\N	\N
108	124	directus_fields	17	{"id":17,"collection":"pages","field":"hero_subtitle","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_subtitle","sort":12,"group":null}	\N	\N
109	125	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":13,"group":null}	\N	\N
110	126	directus_fields	19	{"id":19,"collection":"pages","field":"body","special":null,"interface":"input-rich-text-md","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"body","sort":14,"group":null}	\N	\N
111	127	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
112	128	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
113	129	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":3,"group":null}	\N	\N
114	130	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
115	131	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":5,"group":null}	\N	\N
116	132	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":6,"group":null}	\N	\N
117	133	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":7,"group":null}	\N	\N
118	134	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":8,"group":null}	\N	\N
119	135	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":9,"group":null}	\N	\N
120	136	directus_fields	15	{"id":15,"collection":"pages","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"title","sort":10,"group":null}	\N	\N
121	137	directus_fields	16	{"id":16,"collection":"pages","field":"hero_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_title","sort":11,"group":null}	\N	\N
122	138	directus_fields	17	{"id":17,"collection":"pages","field":"hero_subtitle","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_subtitle","sort":12,"group":null}	\N	\N
123	139	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":13,"group":null}	\N	\N
124	140	directus_fields	19	{"id":19,"collection":"pages","field":"body","special":null,"interface":"input-rich-text-md","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"body","sort":14,"group":null}	\N	\N
125	141	directus_fields	28	{"sort":4,"interface":"input","special":null,"collection":"pages_translations","field":"title"}	{"sort":4,"interface":"input","special":null,"collection":"pages_translations","field":"title"}	\N	\N
126	142	directus_fields	29	{"sort":5,"interface":"input","special":null,"collection":"pages_translations","field":"hero_title"}	{"sort":5,"interface":"input","special":null,"collection":"pages_translations","field":"hero_title"}	\N	\N
127	143	directus_fields	30	{"sort":6,"interface":"input","special":null,"collection":"pages_translations","field":"hero_subtitle"}	{"sort":6,"interface":"input","special":null,"collection":"pages_translations","field":"hero_subtitle"}	\N	\N
128	144	directus_fields	31	{"sort":7,"interface":"input-rich-text-md","special":null,"collection":"pages_translations","field":"body"}	{"sort":7,"interface":"input-rich-text-md","special":null,"collection":"pages_translations","field":"body"}	\N	\N
129	149	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
130	150	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
131	151	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":3,"group":null}	\N	\N
140	160	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
142	162	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
132	152	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
133	153	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":5,"group":null}	\N	\N
134	154	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":6,"group":null}	\N	\N
135	155	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":7,"group":null}	\N	\N
136	156	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":8,"group":null}	\N	\N
137	157	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":9,"group":null}	\N	\N
138	158	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":10,"group":null}	\N	\N
139	159	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
141	161	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
143	163	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":3,"group":null}	\N	\N
145	165	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
147	167	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":5,"group":null}	\N	\N
149	169	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":6,"group":null}	\N	\N
902	997	Map_Cities	4	{"Name":"Cotonou","location":{"coordinates":[2.449431618601068,6.354849693154009],"type":"Point"},"parent":1}	{"Name":"Cotonou","location":{"coordinates":[2.449431618601068,6.354849693154009],"type":"Point"},"parent":1}	905	\N
144	164	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":3,"group":null}	\N	\N
146	166	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
148	168	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":5,"group":null}	\N	\N
150	170	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":6,"group":null}	\N	\N
152	172	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":7,"group":null}	\N	\N
154	174	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":8,"group":null}	\N	\N
156	176	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":9,"group":null}	\N	\N
158	178	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":10,"group":null}	\N	\N
170	190	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
172	192	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
174	194	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":3,"group":null}	\N	\N
176	196	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
178	198	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":5,"group":null}	\N	\N
151	171	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":7,"group":null}	\N	\N
153	173	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":8,"group":null}	\N	\N
155	175	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":9,"group":null}	\N	\N
157	177	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":10,"group":null}	\N	\N
159	179	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
160	180	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
161	181	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":3,"group":null}	\N	\N
162	182	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
163	183	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":5,"group":null}	\N	\N
164	184	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":6,"group":null}	\N	\N
165	185	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":7,"group":null}	\N	\N
166	186	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":8,"group":null}	\N	\N
167	187	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":9,"group":null}	\N	\N
168	188	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":10,"group":null}	\N	\N
169	189	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
171	191	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
173	193	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":3,"group":null}	\N	\N
175	195	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
177	197	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":5,"group":null}	\N	\N
179	199	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":6,"group":null}	\N	\N
181	201	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":7,"group":null}	\N	\N
183	203	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":8,"group":null}	\N	\N
185	205	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":9,"group":null}	\N	\N
187	207	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":10,"group":null}	\N	\N
189	209	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
190	210	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
191	211	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":3,"group":null}	\N	\N
192	212	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
180	200	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":6,"group":null}	\N	\N
182	202	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":7,"group":null}	\N	\N
184	204	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":8,"group":null}	\N	\N
186	206	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":9,"group":null}	\N	\N
188	208	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":10,"group":null}	\N	\N
193	213	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":5,"group":null}	\N	\N
194	214	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":6,"group":null}	\N	\N
195	215	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":7,"group":null}	\N	\N
196	216	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":8,"group":null}	\N	\N
197	217	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":9,"group":null}	\N	\N
198	218	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":10,"group":null}	\N	\N
199	219	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
200	220	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
201	221	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":2,"group":null}	\N	\N
202	222	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
203	223	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":3,"group":null}	\N	\N
204	224	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":3,"group":null}	\N	\N
205	225	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":4,"group":null}	\N	\N
207	227	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":5,"group":null}	\N	\N
209	229	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":6,"group":null}	\N	\N
206	226	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
208	228	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":5,"group":null}	\N	\N
210	230	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":6,"group":null}	\N	\N
212	232	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":7,"group":null}	\N	\N
214	234	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":8,"group":null}	\N	\N
216	236	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":9,"group":null}	\N	\N
218	238	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":10,"group":null}	\N	\N
211	231	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":7,"group":null}	\N	\N
213	233	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":8,"group":null}	\N	\N
215	235	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":9,"group":null}	\N	\N
217	237	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":10,"group":null}	\N	\N
219	239	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":4,"width":"fill","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","width":"fill"}	\N	\N
220	240	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","width":"half"}	\N	\N
221	241	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","width":"half"}	\N	\N
222	242	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","width":"half"}	\N	\N
223	243	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
224	244	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
225	245	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":3,"group":null}	\N	\N
226	246	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":4,"group":null}	\N	\N
227	247	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":5,"group":null}	\N	\N
228	248	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":6,"group":null}	\N	\N
229	249	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":7,"group":null}	\N	\N
230	250	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":8,"group":null}	\N	\N
231	251	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":9,"width":"fill","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":9,"group":null}	\N	\N
232	252	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":10,"group":null}	\N	\N
233	253	directus_fields	7	{"id":7,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
234	254	directus_fields	14	{"id":14,"collection":"pages","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"slug","sort":2,"group":null}	\N	\N
235	255	directus_fields	8	{"id":8,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":3,"group":null}	\N	\N
236	256	directus_fields	11	{"id":11,"collection":"pages","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_created","sort":4,"group":null}	\N	\N
237	257	directus_fields	10	{"id":10,"collection":"pages","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_created","sort":5,"group":null}	\N	\N
238	258	directus_fields	13	{"id":13,"collection":"pages","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"date_updated","sort":6,"group":null}	\N	\N
239	259	directus_fields	12	{"id":12,"collection":"pages","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"user_updated","sort":7,"group":null}	\N	\N
240	260	directus_fields	18	{"id":18,"collection":"pages","field":"hero_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"hero_image","sort":8,"group":null}	\N	\N
241	261	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en-US"},"readonly":false,"hidden":false,"sort":9,"width":"fill","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":9,"group":null}	\N	\N
242	262	directus_fields	9	{"id":9,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":10,"group":null}	\N	\N
246	270	languages	fr	{"code":"fr","name":"French"}	{"code":"fr","name":"French"}	\N	\N
831	924	Trust_Logos_translations	4	{"Intro_Text":"De confianza para empresas en crecimiento en logística, SaaS y transporte","languages_code":{"code":"es"},"Trust_Logos_id":1}	{"Intro_Text":"De confianza para empresas en crecimiento en logística, SaaS y transporte","languages_code":{"code":"es"},"Trust_Logos_id":1}	832	\N
247	275	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":9,"width":"fill","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","options":{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true},"display_options":{"languageField":"name","defaultLanguage":"en"}}	\N	\N
248	276	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"code","defaultLanguage":"en","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":9,"width":"fill","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","options":{"languageField":"code","defaultLanguage":"en","defaultOpenSplitView":true}}	\N	\N
249	277	directus_fields	21	{"id":21,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"code","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":9,"width":"fill","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","options":{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true},"display_options":{"languageField":"code","defaultLanguage":"en"}}	\N	\N
252	280	pages	2e499703-c9d0-4471-ba16-9604a64b37f1	{"slug":"test","translations":{"create":[{"title":"test","languages_code":{"code":"en"}},{"title":"testfr","languages_code":{"code":"fr"}}],"update":[],"delete":[]}}	{"slug":"test","translations":{"create":[{"title":"test","languages_code":{"code":"en"}},{"title":"testfr","languages_code":{"code":"fr"}}],"update":[],"delete":[]}}	\N	\N
250	278	pages_translations	1	{"title":"test","languages_code":{"code":"en"},"pages_id":"2e499703-c9d0-4471-ba16-9604a64b37f1"}	{"title":"test","languages_code":{"code":"en"},"pages_id":"2e499703-c9d0-4471-ba16-9604a64b37f1"}	252	\N
251	279	pages_translations	2	{"title":"testfr","languages_code":{"code":"fr"},"pages_id":"2e499703-c9d0-4471-ba16-9604a64b37f1"}	{"title":"testfr","languages_code":{"code":"fr"},"pages_id":"2e499703-c9d0-4471-ba16-9604a64b37f1"}	252	\N
255	283	pages	2e499703-c9d0-4471-ba16-9604a64b37f1	{"id":"2e499703-c9d0-4471-ba16-9604a64b37f1","status":"draft","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-07T18:06:48.102Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-07T18:07:07.392Z","slug":"test","hero_image":null,"translations":[1,2,3,4]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-07T18:07:07.392Z"}	\N	\N
253	281	pages_translations	3	{"title":"pruefung","languages_code":{"code":"de"},"pages_id":"2e499703-c9d0-4471-ba16-9604a64b37f1"}	{"title":"pruefung","languages_code":{"code":"de"},"pages_id":"2e499703-c9d0-4471-ba16-9604a64b37f1"}	255	\N
254	282	pages_translations	4	{"title":"examen","languages_code":{"code":"es"},"pages_id":"2e499703-c9d0-4471-ba16-9604a64b37f1"}	{"title":"examen","languages_code":{"code":"es"},"pages_id":"2e499703-c9d0-4471-ba16-9604a64b37f1"}	255	\N
256	284	directus_fields	32	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"navigation"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"navigation"}	\N	\N
257	285	directus_fields	33	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"navigation"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"navigation"}	\N	\N
258	286	directus_fields	34	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"navigation"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"navigation"}	\N	\N
259	287	directus_fields	35	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"navigation"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"navigation"}	\N	\N
260	288	directus_fields	36	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"navigation"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"navigation"}	\N	\N
261	289	directus_fields	37	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"navigation"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"navigation"}	\N	\N
262	290	directus_fields	38	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"navigation"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"navigation"}	\N	\N
263	291	directus_collections	navigation	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"navigation"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"navigation"}	\N	\N
264	292	directus_fields	39	{"sort":8,"interface":"select-radio","special":null,"required":true,"options":{"choices":[{"text":"Header","value":"header"},{"text":"Footer","value":"footer"}]},"collection":"navigation","field":"location"}	{"sort":8,"interface":"select-radio","special":null,"required":true,"options":{"choices":[{"text":"Header","value":"header"},{"text":"Footer","value":"footer"}]},"collection":"navigation","field":"location"}	\N	\N
265	293	directus_fields	40	{"sort":9,"interface":"input","special":null,"collection":"navigation","field":"href"}	{"sort":9,"interface":"input","special":null,"collection":"navigation","field":"href"}	\N	\N
266	294	directus_fields	41	{"sort":10,"special":["translations"],"translations":null,"interface":"translations","options":{"defaultLanguage":"en"},"collection":"navigation","field":"translations"}	{"sort":10,"special":["translations"],"translations":null,"interface":"translations","options":{"defaultLanguage":"en"},"collection":"navigation","field":"translations"}	\N	\N
267	295	directus_fields	42	{"sort":1,"hidden":true,"field":"id","collection":"navigation_translations"}	{"sort":1,"hidden":true,"field":"id","collection":"navigation_translations"}	\N	\N
268	296	directus_collections	navigation_translations	{"hidden":true,"icon":"import_export","collection":"navigation_translations"}	{"hidden":true,"icon":"import_export","collection":"navigation_translations"}	\N	\N
269	297	directus_fields	43	{"sort":2,"hidden":true,"collection":"navigation_translations","field":"navigation_id"}	{"sort":2,"hidden":true,"collection":"navigation_translations","field":"navigation_id"}	\N	\N
270	298	directus_fields	44	{"sort":3,"hidden":true,"collection":"navigation_translations","field":"languages_code"}	{"sort":3,"hidden":true,"collection":"navigation_translations","field":"languages_code"}	\N	\N
271	299	directus_fields	45	{"sort":4,"interface":"input","special":null,"required":true,"collection":"navigation_translations","field":"label"}	{"sort":4,"interface":"input","special":null,"required":true,"collection":"navigation_translations","field":"label"}	\N	\N
272	300	directus_fields	41	{"id":41,"collection":"navigation","field":"translations","special":["translations"],"interface":"translations","options":{"defaultLanguage":"en","defaultOpenSplitView":true,"languageField":"name"},"display":null,"display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"translations","options":{"defaultLanguage":"en","defaultOpenSplitView":true,"languageField":"name"},"display":null,"display_options":{"languageField":"name","defaultLanguage":"en"}}	\N	\N
273	301	directus_fields	46	{"sort":11,"interface":"boolean","special":["cast-boolean"],"required":false,"options":{"label":"Display as Button"},"collection":"navigation","field":"isButton"}	{"sort":11,"interface":"boolean","special":["cast-boolean"],"required":false,"options":{"label":"Display as Button"},"collection":"navigation","field":"isButton"}	\N	\N
274	302	directus_fields	32	{"id":32,"collection":"navigation","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"id","width":"half"}	\N	\N
275	303	directus_fields	33	{"id":33,"collection":"navigation","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"status","width":"half"}	\N	\N
276	304	directus_fields	34	{"id":34,"collection":"navigation","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"sort","width":"half"}	\N	\N
277	305	directus_fields	46	{"id":46,"collection":"navigation","field":"isButton","special":["cast-boolean"],"interface":"boolean","options":{"label":"Display as Button"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"isButton","width":"half"}	\N	\N
278	306	directus_fields	32	{"id":32,"collection":"navigation","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"id","sort":1,"group":null}	\N	\N
279	307	directus_fields	33	{"id":33,"collection":"navigation","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"status","sort":2,"group":null}	\N	\N
280	308	directus_fields	46	{"id":46,"collection":"navigation","field":"isButton","special":["cast-boolean"],"interface":"boolean","options":{"label":"Display as Button"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"isButton","sort":3,"group":null}	\N	\N
281	309	directus_fields	34	{"id":34,"collection":"navigation","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"sort","sort":4,"group":null}	\N	\N
282	310	directus_fields	35	{"id":35,"collection":"navigation","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"user_created","sort":5,"group":null}	\N	\N
283	311	directus_fields	36	{"id":36,"collection":"navigation","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"date_created","sort":6,"group":null}	\N	\N
284	312	directus_fields	37	{"id":37,"collection":"navigation","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"user_updated","sort":7,"group":null}	\N	\N
285	313	directus_fields	38	{"id":38,"collection":"navigation","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"date_updated","sort":8,"group":null}	\N	\N
286	314	directus_fields	39	{"id":39,"collection":"navigation","field":"location","special":null,"interface":"select-radio","options":{"choices":[{"text":"Header","value":"header"},{"text":"Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"location","sort":9,"group":null}	\N	\N
287	315	directus_fields	40	{"id":40,"collection":"navigation","field":"href","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"href","sort":10,"group":null}	\N	\N
288	316	directus_fields	41	{"id":41,"collection":"navigation","field":"translations","special":["translations"],"interface":"translations","options":{"defaultLanguage":"en","defaultOpenSplitView":true,"languageField":"name"},"display":null,"display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"translations","sort":11,"group":null}	\N	\N
289	317	directus_fields	32	{"id":32,"collection":"navigation","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"id","sort":1,"group":null}	\N	\N
290	318	directus_fields	33	{"id":33,"collection":"navigation","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"status","sort":2,"group":null}	\N	\N
291	319	directus_fields	46	{"id":46,"collection":"navigation","field":"isButton","special":["cast-boolean"],"interface":"boolean","options":{"label":"Display as Button"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"isButton","sort":3,"group":null}	\N	\N
292	320	directus_fields	35	{"id":35,"collection":"navigation","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"user_created","sort":4,"group":null}	\N	\N
293	321	directus_fields	36	{"id":36,"collection":"navigation","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"date_created","sort":5,"group":null}	\N	\N
294	322	directus_fields	37	{"id":37,"collection":"navigation","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"user_updated","sort":6,"group":null}	\N	\N
295	323	directus_fields	38	{"id":38,"collection":"navigation","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"date_updated","sort":7,"group":null}	\N	\N
296	324	directus_fields	39	{"id":39,"collection":"navigation","field":"location","special":null,"interface":"select-radio","options":{"choices":[{"text":"Header","value":"header"},{"text":"Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"location","sort":8,"group":null}	\N	\N
297	325	directus_fields	34	{"id":34,"collection":"navigation","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"sort","sort":9,"group":null}	\N	\N
298	326	directus_fields	40	{"id":40,"collection":"navigation","field":"href","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"href","sort":10,"group":null}	\N	\N
299	327	directus_fields	41	{"id":41,"collection":"navigation","field":"translations","special":["translations"],"interface":"translations","options":{"defaultLanguage":"en","defaultOpenSplitView":true,"languageField":"name"},"display":null,"display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"translations","sort":11,"group":null}	\N	\N
300	328	directus_fields	39	{"id":39,"collection":"navigation","field":"location","special":null,"interface":"select-radio","options":{"choices":[{"text":"Header","value":"header"},{"text":"Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"location","width":"half"}	\N	\N
301	329	directus_fields	32	{"id":32,"collection":"navigation","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"id","sort":1,"group":null}	\N	\N
302	330	directus_fields	33	{"id":33,"collection":"navigation","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"status","sort":2,"group":null}	\N	\N
303	331	directus_fields	46	{"id":46,"collection":"navigation","field":"isButton","special":["cast-boolean"],"interface":"boolean","options":{"label":"Display as Button"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"isButton","sort":3,"group":null}	\N	\N
304	332	directus_fields	39	{"id":39,"collection":"navigation","field":"location","special":null,"interface":"select-radio","options":{"choices":[{"text":"Header","value":"header"},{"text":"Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"location","sort":4,"group":null}	\N	\N
903	998	Map_Cities	5	{"location":{"coordinates":[114.13653036654966,22.291666726554027],"type":"Point"},"Name":"Hong Kong","status":"published","parent":1}	{"location":{"coordinates":[114.13653036654966,22.291666726554027],"type":"Point"},"Name":"Hong Kong","status":"published","parent":1}	905	\N
305	333	directus_fields	35	{"id":35,"collection":"navigation","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"user_created","sort":5,"group":null}	\N	\N
306	334	directus_fields	36	{"id":36,"collection":"navigation","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"date_created","sort":6,"group":null}	\N	\N
307	335	directus_fields	37	{"id":37,"collection":"navigation","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"user_updated","sort":7,"group":null}	\N	\N
308	336	directus_fields	38	{"id":38,"collection":"navigation","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"date_updated","sort":8,"group":null}	\N	\N
309	337	directus_fields	34	{"id":34,"collection":"navigation","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"sort","sort":9,"group":null}	\N	\N
310	338	directus_fields	40	{"id":40,"collection":"navigation","field":"href","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"href","sort":10,"group":null}	\N	\N
311	339	directus_fields	41	{"id":41,"collection":"navigation","field":"translations","special":["translations"],"interface":"translations","options":{"defaultLanguage":"en","defaultOpenSplitView":true,"languageField":"name"},"display":null,"display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"translations","sort":11,"group":null}	\N	\N
316	344	navigation	1	{"href":"#companies","translations":{"create":[{"languages_code":{"code":"en"},"label":"For Companies"},{"languages_code":{"code":"fr"},"label":"Pour les Entreprises"},{"label":"Für Unternehmen","languages_code":{"code":"de"}},{"label":"Para Empresas","languages_code":{"code":"es"}}],"update":[],"delete":[]}}	{"href":"#companies","translations":{"create":[{"languages_code":{"code":"en"},"label":"For Companies"},{"languages_code":{"code":"fr"},"label":"Pour les Entreprises"},{"label":"Für Unternehmen","languages_code":{"code":"de"}},{"label":"Para Empresas","languages_code":{"code":"es"}}],"update":[],"delete":[]}}	\N	\N
312	340	navigation_translations	1	{"languages_code":{"code":"en"},"label":"For Companies","navigation_id":1}	{"languages_code":{"code":"en"},"label":"For Companies","navigation_id":1}	316	\N
313	341	navigation_translations	2	{"languages_code":{"code":"fr"},"label":"Pour les Entreprises","navigation_id":1}	{"languages_code":{"code":"fr"},"label":"Pour les Entreprises","navigation_id":1}	316	\N
314	342	navigation_translations	3	{"label":"Für Unternehmen","languages_code":{"code":"de"},"navigation_id":1}	{"label":"Für Unternehmen","languages_code":{"code":"de"},"navigation_id":1}	316	\N
315	343	navigation_translations	4	{"label":"Para Empresas","languages_code":{"code":"es"},"navigation_id":1}	{"label":"Para Empresas","languages_code":{"code":"es"},"navigation_id":1}	316	\N
321	349	navigation	2	{"status":"published","href":"#candidates","translations":{"create":[{"label":"For Candidates","languages_code":{"code":"en"}},{"label":"Pour les Candidats","languages_code":{"code":"fr"}},{"label":"Für Kandidaten","languages_code":{"code":"de"}},{"label":"Para Candidatos","languages_code":{"code":"es"}}],"update":[],"delete":[]}}	{"status":"published","href":"#candidates","translations":{"create":[{"label":"For Candidates","languages_code":{"code":"en"}},{"label":"Pour les Candidats","languages_code":{"code":"fr"}},{"label":"Für Kandidaten","languages_code":{"code":"de"}},{"label":"Para Candidatos","languages_code":{"code":"es"}}],"update":[],"delete":[]}}	\N	\N
317	345	navigation_translations	5	{"label":"For Candidates","languages_code":{"code":"en"},"navigation_id":2}	{"label":"For Candidates","languages_code":{"code":"en"},"navigation_id":2}	321	\N
318	346	navigation_translations	6	{"label":"Pour les Candidats","languages_code":{"code":"fr"},"navigation_id":2}	{"label":"Pour les Candidats","languages_code":{"code":"fr"},"navigation_id":2}	321	\N
319	347	navigation_translations	7	{"label":"Für Kandidaten","languages_code":{"code":"de"},"navigation_id":2}	{"label":"Für Kandidaten","languages_code":{"code":"de"},"navigation_id":2}	321	\N
320	348	navigation_translations	8	{"label":"Para Candidatos","languages_code":{"code":"es"},"navigation_id":2}	{"label":"Para Candidatos","languages_code":{"code":"es"},"navigation_id":2}	321	\N
322	350	navigation_translations	9	{"label":"Why Us","languages_code":{"code":"en"},"navigation_id":3}	{"label":"Why Us","languages_code":{"code":"en"},"navigation_id":3}	326	\N
323	351	navigation_translations	10	{"label":"Pourquoi Nous","languages_code":{"code":"fr"},"navigation_id":3}	{"label":"Pourquoi Nous","languages_code":{"code":"fr"},"navigation_id":3}	326	\N
326	354	navigation	3	{"status":"published","href":"#why-us","translations":{"create":[{"label":"Why Us","languages_code":{"code":"en"}},{"label":"Pourquoi Nous","languages_code":{"code":"fr"}},{"label":"Warum Wir","languages_code":{"code":"de"}},{"label":"Por Qué Nosotros","languages_code":{"code":"es"}}],"update":[],"delete":[]}}	{"status":"published","href":"#why-us","translations":{"create":[{"label":"Why Us","languages_code":{"code":"en"}},{"label":"Pourquoi Nous","languages_code":{"code":"fr"}},{"label":"Warum Wir","languages_code":{"code":"de"}},{"label":"Por Qué Nosotros","languages_code":{"code":"es"}}],"update":[],"delete":[]}}	\N	\N
324	352	navigation_translations	11	{"label":"Warum Wir","languages_code":{"code":"de"},"navigation_id":3}	{"label":"Warum Wir","languages_code":{"code":"de"},"navigation_id":3}	326	\N
325	353	navigation_translations	12	{"label":"Por Qué Nosotros","languages_code":{"code":"es"},"navigation_id":3}	{"label":"Por Qué Nosotros","languages_code":{"code":"es"},"navigation_id":3}	326	\N
331	359	navigation	4	{"status":"published","translations":{"create":[{"label":"Upskill AI","languages_code":{"code":"en"}},{"label":"Monter en Compétences IA","languages_code":{"code":"fr"}},{"label":"KI-Weiterbildung","languages_code":{"code":"de"}},{"label":"Capacítate en IA","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"#ai"}	{"status":"published","translations":{"create":[{"label":"Upskill AI","languages_code":{"code":"en"}},{"label":"Monter en Compétences IA","languages_code":{"code":"fr"}},{"label":"KI-Weiterbildung","languages_code":{"code":"de"}},{"label":"Capacítate en IA","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"#ai"}	\N	\N
327	355	navigation_translations	13	{"label":"Upskill AI","languages_code":{"code":"en"},"navigation_id":4}	{"label":"Upskill AI","languages_code":{"code":"en"},"navigation_id":4}	331	\N
328	356	navigation_translations	14	{"label":"Monter en Compétences IA","languages_code":{"code":"fr"},"navigation_id":4}	{"label":"Monter en Compétences IA","languages_code":{"code":"fr"},"navigation_id":4}	331	\N
329	357	navigation_translations	15	{"label":"KI-Weiterbildung","languages_code":{"code":"de"},"navigation_id":4}	{"label":"KI-Weiterbildung","languages_code":{"code":"de"},"navigation_id":4}	331	\N
330	358	navigation_translations	16	{"label":"Capacítate en IA","languages_code":{"code":"es"},"navigation_id":4}	{"label":"Capacítate en IA","languages_code":{"code":"es"},"navigation_id":4}	331	\N
336	364	navigation	5	{"status":"published","translations":{"create":[{"label":"Get Started","languages_code":{"code":"en"}},{"label":"Commencer","languages_code":{"code":"fr"}},{"label":"Los","languages_code":{"code":"de"}},{"label":"Comenzar","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"#get-started","isButton":true}	{"status":"published","translations":{"create":[{"label":"Get Started","languages_code":{"code":"en"}},{"label":"Commencer","languages_code":{"code":"fr"}},{"label":"Los","languages_code":{"code":"de"}},{"label":"Comenzar","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"#get-started","isButton":true}	\N	\N
332	360	navigation_translations	17	{"label":"Get Started","languages_code":{"code":"en"},"navigation_id":5}	{"label":"Get Started","languages_code":{"code":"en"},"navigation_id":5}	336	\N
333	361	navigation_translations	18	{"label":"Commencer","languages_code":{"code":"fr"},"navigation_id":5}	{"label":"Commencer","languages_code":{"code":"fr"},"navigation_id":5}	336	\N
334	362	navigation_translations	19	{"label":"Los","languages_code":{"code":"de"},"navigation_id":5}	{"label":"Los","languages_code":{"code":"de"},"navigation_id":5}	336	\N
335	363	navigation_translations	20	{"label":"Comenzar","languages_code":{"code":"es"},"navigation_id":5}	{"label":"Comenzar","languages_code":{"code":"es"},"navigation_id":5}	336	\N
337	365	navigation	1	{"id":1,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-07T18:27:22.786Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-07T18:30:30.131Z","location":"header","href":"#companies","isButton":false,"translations":[1,2,3,4]}	{"status":"published","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-07T18:30:30.131Z"}	\N	\N
338	366	directus_fields	47	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"company"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"company"}	\N	\N
339	367	directus_fields	48	{"sort":2,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"company"}	{"sort":2,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"company"}	\N	\N
340	368	directus_fields	49	{"sort":3,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"company"}	{"sort":3,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"company"}	\N	\N
974	1069	Trust_Logo_Images_translations	33	{"alt_text":"TNT Express","languages_code":{"code":"en"},"Trust_Logo_Images_id":10}	{"alt_text":"TNT Express","languages_code":{"code":"en"},"Trust_Logo_Images_id":10}	978	\N
975	1070	Trust_Logo_Images_translations	34	{"alt_text":"TNT Express","languages_code":{"code":"fr"},"Trust_Logo_Images_id":10}	{"alt_text":"TNT Express","languages_code":{"code":"fr"},"Trust_Logo_Images_id":10}	978	\N
341	369	directus_fields	50	{"sort":4,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"company"}	{"sort":4,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"company"}	\N	\N
342	370	directus_fields	51	{"sort":5,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"company"}	{"sort":5,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"company"}	\N	\N
343	371	directus_collections	company	{"singleton":false,"collection":"company"}	{"singleton":false,"collection":"company"}	\N	\N
344	372	directus_fields	52	{"sort":6,"special":["translations"],"display":"translations","display_options":{"languageField":"name"},"interface":"translations","options":{"languageField":"name","defaultOpenSplitView":true},"collection":"company","field":"translations"}	{"sort":6,"special":["translations"],"display":"translations","display_options":{"languageField":"name"},"interface":"translations","options":{"languageField":"name","defaultOpenSplitView":true},"collection":"company","field":"translations"}	\N	\N
345	373	directus_fields	53	{"sort":1,"hidden":true,"field":"id","collection":"company_translations"}	{"sort":1,"hidden":true,"field":"id","collection":"company_translations"}	\N	\N
346	374	directus_collections	company_translations	{"hidden":true,"icon":"import_export","collection":"company_translations"}	{"hidden":true,"icon":"import_export","collection":"company_translations"}	\N	\N
347	375	directus_fields	54	{"sort":2,"hidden":true,"collection":"company_translations","field":"company_id"}	{"sort":2,"hidden":true,"collection":"company_translations","field":"company_id"}	\N	\N
348	376	directus_fields	55	{"sort":3,"hidden":true,"collection":"company_translations","field":"languages_code"}	{"sort":3,"hidden":true,"collection":"company_translations","field":"languages_code"}	\N	\N
349	377	directus_fields	56	{"sort":4,"interface":"file-image","special":["file"],"collection":"company_translations","field":"logo"}	{"sort":4,"interface":"file-image","special":["file"],"collection":"company_translations","field":"logo"}	\N	\N
350	379	directus_fields	57	{"sort":4,"interface":"input","special":null,"collection":"company_translations","field":"tagline"}	{"sort":4,"interface":"input","special":null,"collection":"company_translations","field":"tagline"}	\N	\N
351	380	directus_fields	58	{"sort":5,"interface":"input","special":null,"collection":"company_translations","field":"SEO_Meta_Title_Append"}	{"sort":5,"interface":"input","special":null,"collection":"company_translations","field":"SEO_Meta_Title_Append"}	\N	\N
352	381	directus_fields	59	{"sort":7,"interface":"file-image","special":["file"],"collection":"company","field":"logo"}	{"sort":7,"interface":"file-image","special":["file"],"collection":"company","field":"logo"}	\N	\N
353	382	directus_files	f5496cbd-f251-4913-8d06-ea9f4da1d1a9	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	\N	\N
354	384	directus_files	6a965309-2b31-4260-81dc-a105fd60e40e	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	\N	\N
355	386	directus_fields	60	{"sort":8,"interface":"input","special":null,"required":true,"collection":"company","field":"name"}	{"sort":8,"interface":"input","special":null,"required":true,"collection":"company","field":"name"}	\N	\N
356	387	directus_fields	47	{"id":47,"collection":"company","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"id","sort":1,"group":null}	\N	\N
357	388	directus_fields	48	{"id":48,"collection":"company","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"user_created","sort":2,"group":null}	\N	\N
358	389	directus_fields	49	{"id":49,"collection":"company","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"date_created","sort":3,"group":null}	\N	\N
359	390	directus_fields	50	{"id":50,"collection":"company","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"user_updated","sort":4,"group":null}	\N	\N
360	391	directus_fields	51	{"id":51,"collection":"company","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"date_updated","sort":5,"group":null}	\N	\N
361	392	directus_fields	60	{"id":60,"collection":"company","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"name","sort":6,"group":null}	\N	\N
904	999	Map_Cities	6	{"status":"published","Name":"São Paulo","location":{"coordinates":[-46.75571198006557,-23.743496112094363],"type":"Point"},"parent":1}	{"status":"published","Name":"São Paulo","location":{"coordinates":[-46.75571198006557,-23.743496112094363],"type":"Point"},"parent":1}	905	\N
362	393	directus_fields	52	{"id":52,"collection":"company","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name"},"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"translations","sort":7,"group":null}	\N	\N
363	394	directus_fields	59	{"id":59,"collection":"company","field":"logo","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"logo","sort":8,"group":null}	\N	\N
364	395	company	1	{"name":"LogisticIQ"}	{"name":"LogisticIQ"}	\N	\N
365	396	directus_files	4786e6f0-4fc2-4fc3-8866-556ee1cba44d	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	\N	\N
366	398	directus_files	14468428-708c-4b9c-a208-5f144e000fb0	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	\N	\N
367	400	directus_files	7954cc0b-72f2-46c6-8dc6-a7e630d3d69f	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	\N	\N
368	402	directus_files	caac001a-44b5-44ae-95fa-d69a0a1afbda	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	\N	\N
369	404	directus_files	0cfea432-c175-4365-a492-dfe4ad143fdd	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	\N	\N
370	406	directus_files	8986db7f-5bee-4ebe-b305-ef1440292da5	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	\N	\N
371	408	directus_files	0523a3b0-3c0e-414c-8b9f-f5acf7d20427	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"local"}	\N	\N
372	410	directus_files	893633e0-d183-4e63-bdde-1ec61ae92ff5	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"gcs"}	{"title":"Replicate Prediction K74xhhpn11rma0cs4p08az29zr","filename_download":"replicate-prediction-k74xhhpn11rma0cs4p08az29zr.svg","type":"image/svg+xml","storage":"gcs"}	\N	\N
373	411	company	1	{"id":1,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-07T19:03:56.576Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-07T19:27:10.481Z","logo":"893633e0-d183-4e63-bdde-1ec61ae92ff5","name":"LogisticIQ","translations":[]}	{"logo":"893633e0-d183-4e63-bdde-1ec61ae92ff5","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-07T19:27:10.481Z"}	\N	\N
374	412	directus_permissions	21	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"navigation","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"navigation","action":"read"}	\N	\N
375	413	directus_permissions	22	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"navigation_translations","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"navigation_translations","action":"read"}	\N	\N
376	415	directus_permissions	23	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"pages","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"pages","action":"read"}	\N	\N
377	416	directus_permissions	24	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"pages_translations","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"pages_translations","action":"read"}	\N	\N
378	417	directus_permissions	25	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"languages","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"languages","action":"read"}	\N	\N
379	418	directus_permissions	26	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"company_translations","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"company_translations","action":"read"}	\N	\N
380	419	directus_permissions	27	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"company","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"company","action":"read"}	\N	\N
381	421	directus_collections	navigation	{"collection":"navigation","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"company","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"company"}	\N	\N
382	422	directus_collections	company	{"collection":"company","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
383	423	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
384	424	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
385	425	directus_collections	navigation_translations	{"collection":"navigation_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
386	426	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
387	427	directus_collections	pages_translations	{"collection":"pages_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
388	428	directus_collections	company	{"collection":"company","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
389	429	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
390	430	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
391	431	directus_collections	navigation_translations	{"collection":"navigation_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
392	432	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
393	433	directus_collections	pages_translations	{"collection":"pages_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
394	434	directus_collections	navigation	{"collection":"navigation","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
395	435	directus_fields	61	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"landing"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"landing"}	\N	\N
402	442	directus_collections	landing	{"collection":"landing","icon":"web","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"web"}	\N	\N
976	1071	Trust_Logo_Images_translations	35	{"alt_text":"TNT Express","languages_code":{"code":"de"},"Trust_Logo_Images_id":10}	{"alt_text":"TNT Express","languages_code":{"code":"de"},"Trust_Logo_Images_id":10}	978	\N
396	436	directus_fields	62	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"landing"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"landing"}	\N	\N
397	437	directus_fields	63	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"landing"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"landing"}	\N	\N
398	438	directus_fields	64	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"landing"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"landing"}	\N	\N
399	439	directus_fields	65	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"landing"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"landing"}	\N	\N
400	440	directus_fields	66	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"landing"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"landing"}	\N	\N
401	441	directus_collections	landing	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"landing"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"landing"}	\N	\N
403	443	directus_fields	67	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"hero"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"hero"}	\N	\N
404	444	directus_fields	68	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"hero"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"hero"}	\N	\N
405	445	directus_fields	69	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"hero"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"hero"}	\N	\N
406	446	directus_fields	70	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"hero"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"hero"}	\N	\N
407	447	directus_fields	71	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"hero"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"hero"}	\N	\N
520	568	directus_fields	83	{"sort":6,"interface":"input","special":null,"collection":"hero_translations","field":"CTA"}	{"sort":6,"interface":"input","special":null,"collection":"hero_translations","field":"CTA"}	\N	\N
408	448	directus_fields	72	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"hero"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"hero"}	\N	\N
409	449	directus_collections	hero	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"hero"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"hero"}	\N	\N
410	450	directus_fields	73	{"sort":7,"special":["translations"],"collection":"hero","field":"translations"}	{"sort":7,"special":["translations"],"collection":"hero","field":"translations"}	\N	\N
411	451	directus_fields	74	{"sort":1,"hidden":true,"field":"id","collection":"hero_translations"}	{"sort":1,"hidden":true,"field":"id","collection":"hero_translations"}	\N	\N
412	452	directus_collections	hero_translations	{"hidden":true,"icon":"import_export","collection":"hero_translations"}	{"hidden":true,"icon":"import_export","collection":"hero_translations"}	\N	\N
413	453	directus_fields	75	{"sort":2,"hidden":true,"collection":"hero_translations","field":"hero_id"}	{"sort":2,"hidden":true,"collection":"hero_translations","field":"hero_id"}	\N	\N
414	454	directus_fields	76	{"sort":3,"hidden":true,"collection":"hero_translations","field":"languages_code"}	{"sort":3,"hidden":true,"collection":"hero_translations","field":"languages_code"}	\N	\N
415	455	directus_fields	77	{"sort":12,"special":["m2o"],"collection":"navigation","field":"parent_id"}	{"sort":12,"special":["m2o"],"collection":"navigation","field":"parent_id"}	\N	\N
416	456	directus_fields	78	{"sort":13,"interface":"select-icon","special":null,"collection":"navigation","field":"icon"}	{"sort":13,"interface":"select-icon","special":null,"collection":"navigation","field":"icon"}	\N	\N
417	457	directus_collections	navigation	{"collection":"navigation","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"account_tree"}	\N	\N
418	458	directus_fields	79	{"sort":5,"interface":"input","special":null,"collection":"navigation_translations","field":"description"}	{"sort":5,"interface":"input","special":null,"collection":"navigation_translations","field":"description"}	\N	\N
423	463	navigation	6	{"status":"published","href":"/jobs","translations":{"create":[{"label":"Job Search","languages_code":{"code":"en"},"description":"Browse open positions and apply online."},{"label":"Recherche d’Emploi","languages_code":{"code":"fr"},"description":"Parcourez les offres et postulez en ligne."},{"label":"Jobsuche","languages_code":{"code":"de"},"description":"Stellenangebote durchsuchen und online bewerben."},{"label":"Búsqueda de Empleo","languages_code":{"code":"es"},"description":"Explora las vacantes y postúlate en línea."}],"update":[],"delete":[]},"parent_id":1,"icon":"manage_search"}	{"status":"published","href":"/jobs","translations":{"create":[{"label":"Job Search","languages_code":{"code":"en"},"description":"Browse open positions and apply online."},{"label":"Recherche d’Emploi","languages_code":{"code":"fr"},"description":"Parcourez les offres et postulez en ligne."},{"label":"Jobsuche","languages_code":{"code":"de"},"description":"Stellenangebote durchsuchen und online bewerben."},{"label":"Búsqueda de Empleo","languages_code":{"code":"es"},"description":"Explora las vacantes y postúlate en línea."}],"update":[],"delete":[]},"parent_id":1,"icon":"manage_search"}	\N	\N
419	459	navigation_translations	21	{"label":"Job Search","languages_code":{"code":"en"},"description":"Browse open positions and apply online.","navigation_id":6}	{"label":"Job Search","languages_code":{"code":"en"},"description":"Browse open positions and apply online.","navigation_id":6}	423	\N
420	460	navigation_translations	22	{"label":"Recherche d’Emploi","languages_code":{"code":"fr"},"description":"Parcourez les offres et postulez en ligne.","navigation_id":6}	{"label":"Recherche d’Emploi","languages_code":{"code":"fr"},"description":"Parcourez les offres et postulez en ligne.","navigation_id":6}	423	\N
421	461	navigation_translations	23	{"label":"Jobsuche","languages_code":{"code":"de"},"description":"Stellenangebote durchsuchen und online bewerben.","navigation_id":6}	{"label":"Jobsuche","languages_code":{"code":"de"},"description":"Stellenangebote durchsuchen und online bewerben.","navigation_id":6}	423	\N
422	462	navigation_translations	24	{"label":"Búsqueda de Empleo","languages_code":{"code":"es"},"description":"Explora las vacantes y postúlate en línea.","navigation_id":6}	{"label":"Búsqueda de Empleo","languages_code":{"code":"es"},"description":"Explora las vacantes y postúlate en línea.","navigation_id":6}	423	\N
424	464	navigation	6	{"id":6,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T02:29:48.035Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T02:30:05.931Z","location":"header","href":"/jobs","isButton":false,"parent_id":2,"icon":"manage_search","translations":[21,22,23,24]}	{"parent_id":2,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T02:30:05.931Z"}	\N	\N
425	465	directus_collections	hero	{"collection":"hero","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"landing","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"landing"}	\N	\N
426	466	directus_collections	company	{"collection":"company","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
427	467	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
521	569	directus_fields	84	{"sort":14,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"navigation","field":"parent"}	{"sort":14,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"navigation","field":"parent"}	\N	\N
428	468	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
429	469	directus_collections	navigation_translations	{"collection":"navigation_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
430	470	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
431	471	directus_collections	pages_translations	{"collection":"pages_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
432	472	directus_collections	navigation	{"collection":"navigation","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
433	473	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
434	474	directus_collections	landing	{"collection":"landing","icon":"web","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
435	475	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"color":null,"translations":null}	{"collection":"Landing_Page","icon":"folder","note":null,"color":null,"translations":null}	\N	\N
436	476	directus_collections	hero	{"collection":"hero","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
437	484	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"color":null,"translations":null}	{"collection":"Menus","icon":"account_tree","note":null,"color":null,"translations":null}	\N	\N
438	485	directus_collections	company	{"collection":"company","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
439	486	directus_collections	navigation	{"collection":"navigation","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Menus","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Menus"}	\N	\N
440	487	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
441	488	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
442	489	directus_collections	navigation_translations	{"collection":"navigation_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
443	490	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
444	491	directus_collections	pages_translations	{"collection":"pages_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
445	492	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
446	493	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
447	494	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
449	496	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"hero","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"hero"}	\N	\N
458	505	directus_collections	company	{"collection":"company","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
459	506	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
460	507	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
461	508	directus_collections	navigation_translations	{"collection":"navigation_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
462	509	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
463	510	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
464	511	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
465	512	directus_collections	navigation_translations	{"collection":"navigation_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"navigation","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"navigation"}	\N	\N
474	521	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
475	522	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
476	523	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
477	524	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
448	495	directus_collections	company	{"collection":"company","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
450	497	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
451	498	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
452	499	directus_collections	navigation_translations	{"collection":"navigation_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
453	500	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
454	501	directus_collections	pages_translations	{"collection":"pages_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
455	502	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
456	503	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
457	504	directus_collections	pages_translations	{"collection":"pages_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"pages","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"pages"}	\N	\N
466	513	directus_collections	company	{"collection":"company","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
467	514	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
468	515	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
469	516	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
470	517	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
471	518	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
472	519	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"color":null,"translations":null}	{"collection":"General_Settings","icon":"settings","note":null,"color":null,"translations":null}	\N	\N
553	602	directus_permissions	28	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	\N	\N
473	520	directus_collections	company	{"collection":"company","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"General_Settings","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"General_Settings"}	\N	\N
481	528	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
482	529	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
483	530	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
484	531	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
485	532	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
486	533	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"company","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"company"}	\N	\N
487	534	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
488	535	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
489	536	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
490	537	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
491	538	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
492	539	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
494	541	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"General_Settings","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"General_Settings"}	\N	\N
496	543	directus_collections	company	{"collection":"company","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"General_Settings","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"General_Settings"}	\N	\N
501	548	directus_collections	company	{"collection":"company","icon":"business_center","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"General_Settings","collapse":"open","preview_url":null,"versioning":false}	{"icon":"business_center"}	\N	\N
478	525	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
479	526	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
480	527	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"company","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"company"}	\N	\N
493	540	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
495	542	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
497	544	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
498	545	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
499	546	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
500	547	directus_collections	languages	{"collection":"languages","icon":"language_chinese_dayi","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"General_Settings","collapse":"open","preview_url":null,"versioning":false}	{"icon":"language_chinese_dayi"}	\N	\N
502	549	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
504	551	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
505	552	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
506	553	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
503	550	directus_collections	company_translations	{"collection":"company_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"company","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"company"}	\N	\N
511	558	navigation	7	{"status":"published","translations":{"create":[{"label":"Resume Builder","languages_code":{"code":"en"},"description":"Create a professional resume in minutes"},{"label":"Créateur de CV","languages_code":{"code":"fr"},"description":"Créez un CV professionnel en quelques minutes."},{"label":"Lebenslauf-Generator","languages_code":{"code":"de"},"description":"Erstellen Sie in wenigen Minuten einen professionellen Lebenslauf."},{"label":"Creador de Currículum","languages_code":{"code":"es"},"description":"Crea un currículum profesional en minutos."}],"update":[],"delete":[]},"parent_id":2,"icon":"edit_document","href":"/resume-builder"}	{"status":"published","translations":{"create":[{"label":"Resume Builder","languages_code":{"code":"en"},"description":"Create a professional resume in minutes"},{"label":"Créateur de CV","languages_code":{"code":"fr"},"description":"Créez un CV professionnel en quelques minutes."},{"label":"Lebenslauf-Generator","languages_code":{"code":"de"},"description":"Erstellen Sie in wenigen Minuten einen professionellen Lebenslauf."},{"label":"Creador de Currículum","languages_code":{"code":"es"},"description":"Crea un currículum profesional en minutos."}],"update":[],"delete":[]},"parent_id":2,"icon":"edit_document","href":"/resume-builder"}	\N	\N
507	554	navigation_translations	25	{"label":"Resume Builder","languages_code":{"code":"en"},"description":"Create a professional resume in minutes","navigation_id":7}	{"label":"Resume Builder","languages_code":{"code":"en"},"description":"Create a professional resume in minutes","navigation_id":7}	511	\N
508	555	navigation_translations	26	{"label":"Créateur de CV","languages_code":{"code":"fr"},"description":"Créez un CV professionnel en quelques minutes.","navigation_id":7}	{"label":"Créateur de CV","languages_code":{"code":"fr"},"description":"Créez un CV professionnel en quelques minutes.","navigation_id":7}	511	\N
509	556	navigation_translations	27	{"label":"Lebenslauf-Generator","languages_code":{"code":"de"},"description":"Erstellen Sie in wenigen Minuten einen professionellen Lebenslauf.","navigation_id":7}	{"label":"Lebenslauf-Generator","languages_code":{"code":"de"},"description":"Erstellen Sie in wenigen Minuten einen professionellen Lebenslauf.","navigation_id":7}	511	\N
510	557	navigation_translations	28	{"label":"Creador de Currículum","languages_code":{"code":"es"},"description":"Crea un currículum profesional en minutos.","navigation_id":7}	{"label":"Creador de Currículum","languages_code":{"code":"es"},"description":"Crea un currículum profesional en minutos.","navigation_id":7}	511	\N
512	559	directus_fields	80	{"sort":4,"interface":"input","special":null,"required":false,"collection":"hero_translations","field":"heading"}	{"sort":4,"interface":"input","special":null,"required":false,"collection":"hero_translations","field":"heading"}	\N	\N
513	560	directus_fields	81	{"sort":5,"interface":"input","special":null,"collection":"hero_translations","field":"supporting_text"}	{"sort":5,"interface":"input","special":null,"collection":"hero_translations","field":"supporting_text"}	\N	\N
514	562	directus_fields	82	{"sort":6,"interface":"input","special":null,"collection":"hero_translations","field":"heading"}	{"sort":6,"interface":"input","special":null,"collection":"hero_translations","field":"heading"}	\N	\N
515	563	directus_fields	74	{"id":74,"collection":"hero_translations","field":"id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"id","sort":1,"group":null}	\N	\N
516	564	directus_fields	75	{"id":75,"collection":"hero_translations","field":"hero_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"hero_id","sort":2,"group":null}	\N	\N
517	565	directus_fields	76	{"id":76,"collection":"hero_translations","field":"languages_code","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"languages_code","sort":3,"group":null}	\N	\N
518	566	directus_fields	82	{"id":82,"collection":"hero_translations","field":"heading","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"heading","sort":4,"group":null}	\N	\N
519	567	directus_fields	81	{"id":81,"collection":"hero_translations","field":"supporting_text","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"supporting_text","sort":5,"group":null}	\N	\N
522	571	navigation	6	{"id":6,"status":"published","sort":2,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T02:29:48.035Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T02:49:00.227Z","location":"header","href":"/jobs","isButton":false,"icon":"manage_search","parent":2,"translations":[21,22,23,24]}	{"parent":2,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T02:49:00.227Z"}	\N	\N
523	572	navigation	7	{"id":7,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T02:40:05.826Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T02:49:14.606Z","location":"header","href":"/resume-builder","isButton":false,"icon":"edit_document","parent":2,"translations":[25,26,27,28]}	{"parent":2,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T02:49:14.606Z"}	\N	\N
524	573	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
525	574	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
526	575	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
527	576	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
528	577	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
530	579	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
532	581	directus_collections	hero	{"collection":"hero","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
542	591	directus_fields	85	{"sort":7,"interface":"input","special":null,"collection":"hero_translations","field":"CTA2"}	{"sort":7,"interface":"input","special":null,"collection":"hero_translations","field":"CTA2"}	\N	\N
529	578	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
531	580	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
533	582	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
534	583	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
535	584	directus_fields	73	{"id":73,"collection":"hero","field":"translations","special":["translations"],"interface":"translations","options":{"defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name"},"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero","field":"translations","interface":"translations","options":{"defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name"}}	\N	\N
536	585	directus_fields	73	{"id":73,"collection":"hero","field":"translations","special":["translations"],"interface":"translations","options":{"defaultOpenSplitView":true,"languageField":"name","defaultLanguage":"en"},"display":"translations","display_options":{"languageField":"name"},"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero","field":"translations","options":{"defaultOpenSplitView":true,"languageField":"name","defaultLanguage":"en"}}	\N	\N
537	586	hero_translations	1	{"languages_code":{"code":"en"},"heading":"The Supply Chain Talent Marketplace Built for Speed & Precision","supporting_text":"Where growth-stage companies hire elite operators — and top talent lands their next big role.","CTA":"For Companies → Hire Top Supply Chain Talent","hero_id":1}	{"languages_code":{"code":"en"},"heading":"The Supply Chain Talent Marketplace Built for Speed & Precision","supporting_text":"Where growth-stage companies hire elite operators — and top talent lands their next big role.","CTA":"For Companies → Hire Top Supply Chain Talent","hero_id":1}	541	\N
538	587	hero_translations	2	{"heading":"El Mercado de Talento en Cadena de Suministro Creado para la Velocidad y la Precisión","languages_code":{"code":"es"},"supporting_text":"Donde las empresas en crecimiento contratan a operadores de élite — y el mejor talento consigue su próximo gran rol.","CTA":"Para Empresas → Contrata al Mejor Talento en Cadena de Suministro","hero_id":1}	{"heading":"El Mercado de Talento en Cadena de Suministro Creado para la Velocidad y la Precisión","languages_code":{"code":"es"},"supporting_text":"Donde las empresas en crecimiento contratan a operadores de élite — y el mejor talento consigue su próximo gran rol.","CTA":"Para Empresas → Contrata al Mejor Talento en Cadena de Suministro","hero_id":1}	541	\N
546	595	hero_translations	2	{"id":2,"hero_id":1,"languages_code":"es","supporting_text":"Donde las empresas en crecimiento contratan a operadores de élite — y el mejor talento consigue su próximo gran rol.","heading":"El Mercado de Talento en Cadena de Suministro Creado para la Velocidad y la Precisión","CTA":"Para Empresas → Contrata al Mejor Talento en Cadena de Suministro","CTA2":"Para Candidatos → Encuentra tu Próximo Puesto"}	{"languages_code":"es","CTA2":"Para Candidatos → Encuentra tu Próximo Puesto"}	547	\N
555	605	directus_fields	47	{"id":47,"collection":"company","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"id","sort":1,"group":null}	\N	\N
556	606	directus_fields	48	{"id":48,"collection":"company","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"user_created","sort":2,"group":null}	\N	\N
557	607	directus_fields	49	{"id":49,"collection":"company","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"date_created","sort":3,"group":null}	\N	\N
558	608	directus_fields	50	{"id":50,"collection":"company","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"user_updated","sort":4,"group":null}	\N	\N
559	609	directus_fields	51	{"id":51,"collection":"company","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"date_updated","sort":5,"group":null}	\N	\N
977	1072	Trust_Logo_Images_translations	36	{"alt_text":"TNT Express","languages_code":{"code":"es"},"Trust_Logo_Images_id":10}	{"alt_text":"TNT Express","languages_code":{"code":"es"},"Trust_Logo_Images_id":10}	978	\N
541	590	hero	1	{"translations":{"create":[{"languages_code":{"code":"en"},"heading":"The Supply Chain Talent Marketplace Built for Speed & Precision","supporting_text":"Where growth-stage companies hire elite operators — and top talent lands their next big role.","CTA":"For Companies → Hire Top Supply Chain Talent"},{"heading":"El Mercado de Talento en Cadena de Suministro Creado para la Velocidad y la Precisión","languages_code":{"code":"es"},"supporting_text":"Donde las empresas en crecimiento contratan a operadores de élite — y el mejor talento consigue su próximo gran rol.","CTA":"Para Empresas → Contrata al Mejor Talento en Cadena de Suministro"},{"heading":"Le Marché de Talents de la Chaîne d’Approvisionnement Conçu pour la Rapidité et la Précision","languages_code":{"code":"fr"},"supporting_text":"Là où les entreprises en phase de croissance recrutent des opérateurs d’élite — et où les meilleurs talents décrochent leur prochain grand rôle.","CTA":"Pour les Entreprises → Recrutez les Meilleurs Talents en Chaîne d’Approvisionnement"},{"heading":"Der Talentmarktplatz für Lieferketten — Entwickelt für Schnelligkeit und Präzision","languages_code":{"code":"de"},"supporting_text":"Wo Wachstumsunternehmen Elite-Operatoren einstellen — und Top-Talente ihre nächste große Rolle finden.","CTA":"Für Unternehmen → Top-Talente für Lieferketten Einstellen"}],"update":[],"delete":[]}}	{"translations":{"create":[{"languages_code":{"code":"en"},"heading":"The Supply Chain Talent Marketplace Built for Speed & Precision","supporting_text":"Where growth-stage companies hire elite operators — and top talent lands their next big role.","CTA":"For Companies → Hire Top Supply Chain Talent"},{"heading":"El Mercado de Talento en Cadena de Suministro Creado para la Velocidad y la Precisión","languages_code":{"code":"es"},"supporting_text":"Donde las empresas en crecimiento contratan a operadores de élite — y el mejor talento consigue su próximo gran rol.","CTA":"Para Empresas → Contrata al Mejor Talento en Cadena de Suministro"},{"heading":"Le Marché de Talents de la Chaîne d’Approvisionnement Conçu pour la Rapidité et la Précision","languages_code":{"code":"fr"},"supporting_text":"Là où les entreprises en phase de croissance recrutent des opérateurs d’élite — et où les meilleurs talents décrochent leur prochain grand rôle.","CTA":"Pour les Entreprises → Recrutez les Meilleurs Talents en Chaîne d’Approvisionnement"},{"heading":"Der Talentmarktplatz für Lieferketten — Entwickelt für Schnelligkeit und Präzision","languages_code":{"code":"de"},"supporting_text":"Wo Wachstumsunternehmen Elite-Operatoren einstellen — und Top-Talente ihre nächste große Rolle finden.","CTA":"Für Unternehmen → Top-Talente für Lieferketten Einstellen"}],"update":[],"delete":[]}}	\N	\N
539	588	hero_translations	3	{"heading":"Le Marché de Talents de la Chaîne d’Approvisionnement Conçu pour la Rapidité et la Précision","languages_code":{"code":"fr"},"supporting_text":"Là où les entreprises en phase de croissance recrutent des opérateurs d’élite — et où les meilleurs talents décrochent leur prochain grand rôle.","CTA":"Pour les Entreprises → Recrutez les Meilleurs Talents en Chaîne d’Approvisionnement","hero_id":1}	{"heading":"Le Marché de Talents de la Chaîne d’Approvisionnement Conçu pour la Rapidité et la Précision","languages_code":{"code":"fr"},"supporting_text":"Là où les entreprises en phase de croissance recrutent des opérateurs d’élite — et où les meilleurs talents décrochent leur prochain grand rôle.","CTA":"Pour les Entreprises → Recrutez les Meilleurs Talents en Chaîne d’Approvisionnement","hero_id":1}	541	\N
540	589	hero_translations	4	{"heading":"Der Talentmarktplatz für Lieferketten — Entwickelt für Schnelligkeit und Präzision","languages_code":{"code":"de"},"supporting_text":"Wo Wachstumsunternehmen Elite-Operatoren einstellen — und Top-Talente ihre nächste große Rolle finden.","CTA":"Für Unternehmen → Top-Talente für Lieferketten Einstellen","hero_id":1}	{"heading":"Der Talentmarktplatz für Lieferketten — Entwickelt für Schnelligkeit und Präzision","languages_code":{"code":"de"},"supporting_text":"Wo Wachstumsunternehmen Elite-Operatoren einstellen — und Top-Talente ihre nächste große Rolle finden.","CTA":"Für Unternehmen → Top-Talente für Lieferketten Einstellen","hero_id":1}	541	\N
547	596	hero	1	{"id":1,"status":"draft","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T03:06:44.548Z","translations":[1,2,3,4]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T03:06:44.548Z"}	\N	\N
543	592	hero_translations	1	{"id":1,"hero_id":1,"languages_code":"en","supporting_text":"Where growth-stage companies hire elite operators — and top talent lands their next big role.","heading":"The Supply Chain Talent Marketplace Built for Speed & Precision","CTA":"For Companies → Hire Top Supply Chain Talent","CTA2":"For Candidates → Find Your Next Role"}	{"languages_code":"en","CTA2":"For Candidates → Find Your Next Role"}	547	\N
544	593	hero_translations	3	{"id":3,"hero_id":1,"languages_code":"fr","supporting_text":"Là où les entreprises en phase de croissance recrutent des opérateurs d’élite — et où les meilleurs talents décrochent leur prochain grand rôle.","heading":"Le Marché de Talents de la Chaîne d’Approvisionnement Conçu pour la Rapidité et la Précision","CTA":"Pour les Entreprises → Recrutez les Meilleurs Talents en Chaîne d’Approvisionnement","CTA2":"Pour les Candidats → Trouvez votre Prochain Rôle"}	{"languages_code":"fr","CTA2":"Pour les Candidats → Trouvez votre Prochain Rôle"}	547	\N
545	594	hero_translations	4	{"id":4,"hero_id":1,"languages_code":"de","supporting_text":"Wo Wachstumsunternehmen Elite-Operatoren einstellen — und Top-Talente ihre nächste große Rolle finden.","heading":"Der Talentmarktplatz für Lieferketten — Entwickelt für Schnelligkeit und Präzision","CTA":"Für Unternehmen → Top-Talente für Lieferketten Einstellen","CTA2":"Für Kandidaten → Finde deine Nächste Rolle"}	{"languages_code":"de","CTA2":"Für Kandidaten → Finde deine Nächste Rolle"}	547	\N
548	597	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T03:06:49.368Z","translations":[1,2,3,4]}	{"status":"published","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T03:06:49.368Z"}	\N	\N
549	598	directus_fields	86	{"sort":9,"interface":"file-image","special":["file"],"collection":"company","field":"favicon"}	{"sort":9,"interface":"file-image","special":["file"],"collection":"company","field":"favicon"}	\N	\N
550	599	pages	2e499703-c9d0-4471-ba16-9604a64b37f1	{"id":"2e499703-c9d0-4471-ba16-9604a64b37f1","status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-07T18:06:48.102Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T03:14:37.092Z","slug":"test","hero_image":null,"translations":[1,2,3,4]}	{"status":"published","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T03:14:37.092Z"}	\N	\N
551	600	directus_files	1fb1f6b8-ba4d-4301-8a72-decb8dd89c71	{"title":"Favicon","filename_download":"favicon.png","type":"image/png","storage":"gcs"}	{"title":"Favicon","filename_download":"favicon.png","type":"image/png","storage":"gcs"}	\N	\N
552	601	company	1	{"id":1,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-07T19:03:56.576Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T03:16:23.966Z","logo":"893633e0-d183-4e63-bdde-1ec61ae92ff5","name":"LogisticIQ","favicon":"1fb1f6b8-ba4d-4301-8a72-decb8dd89c71","translations":[]}	{"favicon":"1fb1f6b8-ba4d-4301-8a72-decb8dd89c71","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T03:16:23.966Z"}	\N	\N
554	604	directus_fields	87	{"sort":10,"interface":"boolean","special":["cast-boolean"],"collection":"company","field":"useFaviconInHeader"}	{"sort":10,"interface":"boolean","special":["cast-boolean"],"collection":"company","field":"useFaviconInHeader"}	\N	\N
560	610	directus_fields	60	{"id":60,"collection":"company","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"name","sort":6,"group":null}	\N	\N
561	611	directus_fields	52	{"id":52,"collection":"company","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name"},"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"translations","sort":7,"group":null}	\N	\N
562	612	directus_fields	87	{"id":87,"collection":"company","field":"useFaviconInHeader","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"useFaviconInHeader","sort":8,"group":null}	\N	\N
563	613	directus_fields	59	{"id":59,"collection":"company","field":"logo","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"logo","sort":9,"group":null}	\N	\N
564	614	directus_fields	86	{"id":86,"collection":"company","field":"favicon","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"favicon","sort":10,"group":null}	\N	\N
565	615	directus_fields	87	{"id":87,"collection":"company","field":"useFaviconInHeader","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"company","field":"useFaviconInHeader","width":"half"}	\N	\N
566	616	company	1	{"id":1,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-07T19:03:56.576Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T03:25:19.212Z","logo":"893633e0-d183-4e63-bdde-1ec61ae92ff5","name":"LogisticIQ","favicon":"1fb1f6b8-ba4d-4301-8a72-decb8dd89c71","useFaviconInHeader":true,"translations":[]}	{"useFaviconInHeader":true,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T03:25:19.212Z"}	\N	\N
567	617	directus_permissions	29	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"hero","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"hero","action":"read"}	\N	\N
568	618	directus_permissions	30	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"hero_translations","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"hero_translations","action":"read"}	\N	\N
569	620	directus_fields	88	{"sort":8,"interface":"input","special":null,"collection":"hero_translations","field":"heading_highlighted"}	{"sort":8,"interface":"input","special":null,"collection":"hero_translations","field":"heading_highlighted"}	\N	\N
570	621	directus_fields	74	{"id":74,"collection":"hero_translations","field":"id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"id","sort":1,"group":null}	\N	\N
571	622	directus_fields	75	{"id":75,"collection":"hero_translations","field":"hero_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"hero_id","sort":2,"group":null}	\N	\N
572	623	directus_fields	76	{"id":76,"collection":"hero_translations","field":"languages_code","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"languages_code","sort":3,"group":null}	\N	\N
573	624	directus_fields	82	{"id":82,"collection":"hero_translations","field":"heading","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"heading","sort":4,"group":null}	\N	\N
574	625	directus_fields	88	{"id":88,"collection":"hero_translations","field":"heading_highlighted","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"heading_highlighted","sort":5,"group":null}	\N	\N
575	626	directus_fields	81	{"id":81,"collection":"hero_translations","field":"supporting_text","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"supporting_text","sort":6,"group":null}	\N	\N
576	627	directus_fields	83	{"id":83,"collection":"hero_translations","field":"CTA","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"CTA","sort":7,"group":null}	\N	\N
1016	1111	directus_fields	179	{"sort":8,"interface":"list-m2a","special":["m2a"],"options":{},"collection":"map_animation","field":"start_city"}	{"sort":8,"interface":"list-m2a","special":["m2a"],"options":{},"collection":"map_animation","field":"start_city"}	\N	\N
577	628	directus_fields	85	{"id":85,"collection":"hero_translations","field":"CTA2","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"CTA2","sort":8,"group":null}	\N	\N
582	633	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T04:15:25.945Z","translations":[1,2,3,4]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T04:15:25.945Z"}	\N	\N
578	629	hero_translations	1	{"id":1,"hero_id":1,"languages_code":"en","supporting_text":"Where growth-stage companies hire elite operators — and top talent lands their next big role.","heading":"The Supply Chain Talent Marketplace Built for","CTA":"For Companies → Hire Top Supply Chain Talent","CTA2":"For Candidates → Find Your Next Role","heading_highlighted":"Speed & Precision"}	{"languages_code":"en","heading":"The Supply Chain Talent Marketplace Built for","heading_highlighted":"Speed & Precision"}	582	\N
579	630	hero_translations	3	{"id":3,"hero_id":1,"languages_code":"fr","supporting_text":"Là où les entreprises en phase de croissance recrutent des opérateurs d’élite — et où les meilleurs talents décrochent leur prochain grand rôle.","heading":"Le Marché de Talents de la Chaîne d’Approvisionnement Conçu pour la ","CTA":"Pour les Entreprises → Recrutez les Meilleurs Talents en Chaîne d’Approvisionnement","CTA2":"Pour les Candidats → Trouvez votre Prochain Rôle","heading_highlighted":"Rapidité et la Précision"}	{"languages_code":"fr","heading":"Le Marché de Talents de la Chaîne d’Approvisionnement Conçu pour la ","heading_highlighted":"Rapidité et la Précision"}	582	\N
580	631	hero_translations	2	{"id":2,"hero_id":1,"languages_code":"es","supporting_text":"Donde las empresas en crecimiento contratan a operadores de élite — y el mejor talento consigue su próximo gran rol.","heading":"El Mercado de Talento en Cadena de Suministro Creado para la ","CTA":"Para Empresas → Contrata al Mejor Talento en Cadena de Suministro","CTA2":"Para Candidatos → Encuentra tu Próximo Puesto","heading_highlighted":"Velocidad y la Precisión"}	{"languages_code":"es","heading":"El Mercado de Talento en Cadena de Suministro Creado para la ","heading_highlighted":"Velocidad y la Precisión"}	582	\N
581	632	hero_translations	4	{"id":4,"hero_id":1,"languages_code":"de","supporting_text":"Wo Wachstumsunternehmen Elite-Operatoren einstellen — und Top-Talente ihre nächste große Rolle finden.","heading":"Der Talentmarktplatz für Lieferketten — Entwickelt für ","CTA":"Für Unternehmen → Top-Talente für Lieferketten Einstellen","CTA2":"Für Kandidaten → Finde deine Nächste Rolle","heading_highlighted":"Schnelligkeit und Präzision"}	{"languages_code":"de","heading":"Der Talentmarktplatz für Lieferketten — Entwickelt für ","heading_highlighted":"Schnelligkeit und Präzision"}	582	\N
583	634	directus_collections	hero	{"collection":"hero","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"singleton":true}	\N	\N
584	635	directus_fields	89	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Trust_Logos"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Trust_Logos"}	\N	\N
599	650	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
617	677	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
1017	1112	directus_fields	180	{"sort":1,"hidden":true,"field":"id","collection":"map_animation_start_city"}	{"sort":1,"hidden":true,"field":"id","collection":"map_animation_start_city"}	\N	\N
1018	1113	directus_collections	map_animation_start_city	{"hidden":true,"icon":"import_export","collection":"map_animation_start_city"}	{"hidden":true,"icon":"import_export","collection":"map_animation_start_city"}	\N	\N
1019	1114	directus_fields	181	{"sort":2,"hidden":true,"collection":"map_animation_start_city","field":"map_animation_id"}	{"sort":2,"hidden":true,"collection":"map_animation_start_city","field":"map_animation_id"}	\N	\N
1020	1115	directus_fields	182	{"sort":3,"hidden":true,"collection":"map_animation_start_city","field":"item"}	{"sort":3,"hidden":true,"collection":"map_animation_start_city","field":"item"}	\N	\N
1021	1116	directus_fields	183	{"sort":4,"hidden":true,"collection":"map_animation_start_city","field":"collection"}	{"sort":4,"hidden":true,"collection":"map_animation_start_city","field":"collection"}	\N	\N
1022	1117	directus_fields	179	{"id":179,"collection":"map_animation","field":"start_city","special":["m2a"],"interface":"list-m2a","options":{"enableSelect":false,"enableCreate":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"start_city","options":{"enableSelect":false,"enableCreate":false}}	\N	\N
1024	1120	directus_fields	185	{"sort":10,"interface":"list-m2m","special":["m2m"],"options":{"enableCreate":false,"enableSelect":false},"collection":"map_animation","field":"end_city"}	{"sort":10,"interface":"list-m2m","special":["m2m"],"options":{"enableCreate":false,"enableSelect":false},"collection":"map_animation","field":"end_city"}	\N	\N
1025	1121	directus_fields	186	{"sort":1,"hidden":true,"field":"id","collection":"map_animation_Map_Cities"}	{"sort":1,"hidden":true,"field":"id","collection":"map_animation_Map_Cities"}	\N	\N
1026	1122	directus_collections	map_animation_Map_Cities	{"hidden":true,"icon":"import_export","collection":"map_animation_Map_Cities"}	{"hidden":true,"icon":"import_export","collection":"map_animation_Map_Cities"}	\N	\N
1027	1123	directus_fields	187	{"sort":2,"hidden":true,"collection":"map_animation_Map_Cities","field":"map_animation_id"}	{"sort":2,"hidden":true,"collection":"map_animation_Map_Cities","field":"map_animation_id"}	\N	\N
585	636	directus_fields	90	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Trust_Logos"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Trust_Logos"}	\N	\N
586	637	directus_fields	91	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"Trust_Logos"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"Trust_Logos"}	\N	\N
587	638	directus_fields	92	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Trust_Logos"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Trust_Logos"}	\N	\N
588	639	directus_fields	93	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Trust_Logos"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Trust_Logos"}	\N	\N
589	640	directus_fields	94	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Trust_Logos"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Trust_Logos"}	\N	\N
590	641	directus_fields	95	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Trust_Logos"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Trust_Logos"}	\N	\N
591	642	directus_collections	Trust_Logos	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Trust_Logos"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Trust_Logos"}	\N	\N
592	643	directus_fields	96	{"sort":8,"interface":"file-image","special":["file"],"options":{},"collection":"Trust_Logos","field":"logo"}	{"sort":8,"interface":"file-image","special":["file"],"options":{},"collection":"Trust_Logos","field":"logo"}	\N	\N
593	644	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
594	645	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
595	646	directus_collections	hero	{"collection":"hero","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
596	647	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
597	648	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Landing_Page"}	\N	\N
598	649	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
600	660	directus_fields	97	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Trust_Logos"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Trust_Logos"}	\N	\N
601	661	directus_fields	98	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Trust_Logos"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Trust_Logos"}	\N	\N
602	662	directus_fields	99	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Trust_Logos"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Trust_Logos"}	\N	\N
603	663	directus_fields	100	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Trust_Logos"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Trust_Logos"}	\N	\N
604	664	directus_fields	101	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Trust_Logos"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Trust_Logos"}	\N	\N
605	665	directus_fields	102	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Trust_Logos"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Trust_Logos"}	\N	\N
606	666	directus_collections	Trust_Logos	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"Trust_Logos"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"Trust_Logos"}	\N	\N
607	667	directus_fields	103	{"sort":7,"interface":"boolean","special":["cast-boolean"],"collection":"Trust_Logos","field":"isGray"}	{"sort":7,"interface":"boolean","special":["cast-boolean"],"collection":"Trust_Logos","field":"isGray"}	\N	\N
608	668	directus_fields	104	{"sort":8,"special":["translations"],"interface":"translations","options":{"defaultOpenSplitView":true,"defaultLanguage":"en","languageField":"name"},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"collection":"Trust_Logos","field":"translations"}	{"sort":8,"special":["translations"],"interface":"translations","options":{"defaultOpenSplitView":true,"defaultLanguage":"en","languageField":"name"},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"collection":"Trust_Logos","field":"translations"}	\N	\N
609	669	directus_fields	105	{"sort":1,"hidden":true,"field":"id","collection":"Trust_Logos_translations"}	{"sort":1,"hidden":true,"field":"id","collection":"Trust_Logos_translations"}	\N	\N
610	670	directus_collections	Trust_Logos_translations	{"hidden":true,"icon":"import_export","collection":"Trust_Logos_translations"}	{"hidden":true,"icon":"import_export","collection":"Trust_Logos_translations"}	\N	\N
611	671	directus_fields	106	{"sort":2,"hidden":true,"collection":"Trust_Logos_translations","field":"Trust_Logos_id"}	{"sort":2,"hidden":true,"collection":"Trust_Logos_translations","field":"Trust_Logos_id"}	\N	\N
612	672	directus_fields	107	{"sort":3,"hidden":true,"collection":"Trust_Logos_translations","field":"languages_code"}	{"sort":3,"hidden":true,"collection":"Trust_Logos_translations","field":"languages_code"}	\N	\N
613	673	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"odysee"}	\N	\N
614	674	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
615	675	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
616	676	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
618	678	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
619	679	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
621	680	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
622	683	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
624	684	directus_collections	hero	{"collection":"hero","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Landing_Page"}	\N	\N
628	688	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
630	690	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
632	692	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
634	694	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
620	681	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
623	682	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
625	685	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
626	686	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
627	687	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
629	689	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
631	691	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
633	693	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Landing_Page"}	\N	\N
635	695	directus_collections	hero	{"collection":"hero","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":"Landing_Page"}	\N	\N
636	696	directus_collections	hero	{"collection":"hero","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
637	697	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
638	698	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Landing_Page"}	\N	\N
639	699	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":"Landing_Page"}	\N	\N
640	700	directus_collections	hero	{"collection":"hero","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
641	701	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
673	733	directus_fields	118	{"sort":4,"interface":"input","special":null,"collection":"Trust_Logos_translations","field":"Intro_Text"}	{"sort":4,"interface":"input","special":null,"collection":"Trust_Logos_translations","field":"Intro_Text"}	\N	\N
642	702	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Landing_Page"}	\N	\N
643	703	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":"Landing_Page"}	\N	\N
644	704	directus_fields	108	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Trust_Logo_Images"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Trust_Logo_Images"}	\N	\N
645	705	directus_fields	109	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Trust_Logo_Images"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Trust_Logo_Images"}	\N	\N
646	706	directus_fields	110	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"Trust_Logo_Images"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"Trust_Logo_Images"}	\N	\N
647	707	directus_fields	111	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Trust_Logo_Images"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Trust_Logo_Images"}	\N	\N
648	708	directus_fields	112	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Trust_Logo_Images"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Trust_Logo_Images"}	\N	\N
649	709	directus_fields	113	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Trust_Logo_Images"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Trust_Logo_Images"}	\N	\N
650	710	directus_fields	114	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Trust_Logo_Images"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Trust_Logo_Images"}	\N	\N
651	711	directus_collections	Trust_Logo_Images	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Trust_Logo_Images"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Trust_Logo_Images"}	\N	\N
652	712	directus_fields	115	{"sort":8,"interface":"input","special":null,"collection":"Trust_Logo_Images","field":"Company_Name"}	{"sort":8,"interface":"input","special":null,"collection":"Trust_Logo_Images","field":"Company_Name"}	\N	\N
653	713	directus_fields	116	{"sort":9,"interface":"file-image","special":["file"],"collection":"Trust_Logo_Images","field":"Logo_Image"}	{"sort":9,"interface":"file-image","special":["file"],"collection":"Trust_Logo_Images","field":"Logo_Image"}	\N	\N
654	714	directus_fields	117	{"sort":10,"interface":"input","special":null,"collection":"Trust_Logo_Images","field":"href"}	{"sort":10,"interface":"input","special":null,"collection":"Trust_Logo_Images","field":"href"}	\N	\N
655	715	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"odysee"}	\N	\N
656	716	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
1023	1118	directus_fields	184	{"sort":9,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{Name}}"},"collection":"map_animation","field":"start"}	{"sort":9,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{Name}}"},"collection":"map_animation","field":"start"}	\N	\N
657	717	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Trust_Logos_translations","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Trust_Logos_translations"}	\N	\N
658	718	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
659	719	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
660	720	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
661	721	directus_fields	115	{"id":115,"collection":"Trust_Logo_Images","field":"Company_Name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"Company_Name","width":"half"}	\N	\N
662	722	directus_fields	117	{"id":117,"collection":"Trust_Logo_Images","field":"href","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"href","width":"half"}	\N	\N
663	723	directus_fields	108	{"id":108,"collection":"Trust_Logo_Images","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"id","sort":1,"group":null}	\N	\N
664	724	directus_fields	109	{"id":109,"collection":"Trust_Logo_Images","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"status","sort":2,"group":null}	\N	\N
665	725	directus_fields	110	{"id":110,"collection":"Trust_Logo_Images","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"sort","sort":3,"group":null}	\N	\N
666	726	directus_fields	111	{"id":111,"collection":"Trust_Logo_Images","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"user_created","sort":4,"group":null}	\N	\N
667	727	directus_fields	112	{"id":112,"collection":"Trust_Logo_Images","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"date_created","sort":5,"group":null}	\N	\N
668	728	directus_fields	113	{"id":113,"collection":"Trust_Logo_Images","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"user_updated","sort":6,"group":null}	\N	\N
669	729	directus_fields	114	{"id":114,"collection":"Trust_Logo_Images","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"date_updated","sort":7,"group":null}	\N	\N
670	730	directus_fields	115	{"id":115,"collection":"Trust_Logo_Images","field":"Company_Name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"Company_Name","sort":8,"group":null}	\N	\N
671	731	directus_fields	117	{"id":117,"collection":"Trust_Logo_Images","field":"href","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"href","sort":9,"group":null}	\N	\N
672	732	directus_fields	116	{"id":116,"collection":"Trust_Logo_Images","field":"Logo_Image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"Logo_Image","sort":10,"group":null}	\N	\N
674	734	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"singleton":true}	\N	\N
675	735	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"singleton":false}	\N	\N
1028	1124	directus_fields	188	{"sort":3,"hidden":true,"collection":"map_animation_Map_Cities","field":"Map_Cities_id"}	{"sort":3,"hidden":true,"collection":"map_animation_Map_Cities","field":"Map_Cities_id"}	\N	\N
1029	1125	directus_fields	184	{"id":184,"collection":"map_animation","field":"start","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{Name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"start","width":"half"}	\N	\N
1030	1126	directus_fields	185	{"id":185,"collection":"map_animation","field":"end_city","special":["m2m"],"interface":"list-m2m","options":{"enableCreate":false,"enableSelect":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"end_city","width":"half"}	\N	\N
681	741	directus_collections	hero	{"collection":"hero","icon":"exclamation","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"icon":"exclamation"}	\N	\N
682	742	directus_fields	119	{"sort":9,"special":["o2m"],"interface":"list-o2m-tree-view","options":{"displayTemplate":null,"filter":{"_and":[{"status":{"_eq":"published"}}]}},"display":null,"collection":"Trust_Logos","field":"Trust_Logo_Images"}	{"sort":9,"special":["o2m"],"interface":"list-o2m-tree-view","options":{"displayTemplate":null,"filter":{"_and":[{"status":{"_eq":"published"}}]}},"display":null,"collection":"Trust_Logos","field":"Trust_Logo_Images"}	\N	\N
683	743	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
684	744	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
685	745	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
906	1001	directus_fields	159	{"id":159,"collection":"Map_Cities","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"id","sort":1,"group":null}	\N	\N
907	1002	directus_fields	160	{"id":160,"collection":"Map_Cities","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"status","sort":2,"group":null}	\N	\N
686	746	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
687	747	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
688	749	directus_collections	hero	{"collection":"hero","icon":"exclamation","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
689	750	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
690	751	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
691	752	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
692	753	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
693	754	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Landing_Page"}	\N	\N
694	755	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
695	756	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":"Landing_Page"}	\N	\N
696	757	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":"Landing_Page"}	\N	\N
697	758	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Trust_Logo_Images","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Trust_Logo_Images"}	\N	\N
698	759	directus_collections	hero	{"collection":"hero","icon":"exclamation","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
699	760	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
700	761	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Landing_Page"}	\N	\N
908	1003	directus_fields	161	{"id":161,"collection":"Map_Cities","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"sort","sort":3,"group":null}	\N	\N
701	762	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":"Landing_Page"}	\N	\N
702	763	directus_collections	hero	{"collection":"hero","icon":"exclamation","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
703	764	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
704	765	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Landing_Page"}	\N	\N
705	766	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":"Landing_Page"}	\N	\N
706	767	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":"Landing_Page"}	\N	\N
707	768	directus_fields	120	{"sort":9,"special":["o2m"],"interface":null,"display":null,"collection":"Trust_Logos","field":"Logos"}	{"sort":9,"special":["o2m"],"interface":null,"display":null,"collection":"Trust_Logos","field":"Logos"}	\N	\N
708	770	directus_fields	121	{"sort":9,"special":["o2m"],"collection":"Trust_Logos","field":"Logos"}	{"sort":9,"special":["o2m"],"collection":"Trust_Logos","field":"Logos"}	\N	\N
709	772	directus_fields	122	{"sort":9,"special":["o2m"],"collection":"Trust_Logos","field":"Logos"}	{"sort":9,"special":["o2m"],"collection":"Trust_Logos","field":"Logos"}	\N	\N
710	774	directus_fields	123	{"sort":9,"special":["o2m"],"collection":"Trust_Logos","field":"Logos"}	{"sort":9,"special":["o2m"],"collection":"Trust_Logos","field":"Logos"}	\N	\N
711	777	directus_fields	124	{"sort":9,"special":["o2m"],"collection":"Trust_Logos","field":"logos"}	{"sort":9,"special":["o2m"],"collection":"Trust_Logos","field":"logos"}	\N	\N
712	778	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"odysee","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"singleton":false}	\N	\N
713	779	directus_files	29b5aedc-d2b2-423e-90c5-43181d3824b8	{"title":"Google 2015 Logo","filename_download":"Google_2015_logo.svg","type":"image/svg+xml","storage":"gcs"}	{"title":"Google 2015 Logo","filename_download":"Google_2015_logo.svg","type":"image/svg+xml","storage":"gcs"}	\N	\N
715	806	directus_fields	125	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Trust_Logos"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Trust_Logos"}	\N	\N
716	807	directus_fields	126	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Trust_Logos"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Trust_Logos"}	\N	\N
717	808	directus_fields	127	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Trust_Logos"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Trust_Logos"}	\N	\N
718	809	directus_fields	128	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Trust_Logos"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Trust_Logos"}	\N	\N
719	810	directus_fields	129	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Trust_Logos"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Trust_Logos"}	\N	\N
720	811	directus_fields	130	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Trust_Logos"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Trust_Logos"}	\N	\N
721	812	directus_collections	Trust_Logos	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"Trust_Logos"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"Trust_Logos"}	\N	\N
722	813	directus_fields	131	{"sort":7,"interface":"boolean","special":["cast-boolean"],"collection":"Trust_Logos","field":"is_monochrome"}	{"sort":7,"interface":"boolean","special":["cast-boolean"],"collection":"Trust_Logos","field":"is_monochrome"}	\N	\N
723	814	directus_fields	131	{"id":131,"collection":"Trust_Logos","field":"is_monochrome","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"is_monochrome","width":"half"}	\N	\N
724	815	directus_fields	132	{"sort":8,"interface":"select-color","special":null,"options":{"opacity":true,"presets":[{"name":"Light Gray","color":"#BBBBBB"}]},"collection":"Trust_Logos","field":"Monochrome_Color"}	{"sort":8,"interface":"select-color","special":null,"options":{"opacity":true,"presets":[{"name":"Light Gray","color":"#BBBBBB"}]},"collection":"Trust_Logos","field":"Monochrome_Color"}	\N	\N
725	816	directus_fields	132	{"id":132,"collection":"Trust_Logos","field":"Monochrome_Color","special":null,"interface":"select-color","options":{"opacity":true,"presets":[{"name":"Light Gray","color":"#BBBBBB"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Monochrome_Color","width":"half"}	\N	\N
726	817	directus_fields	133	{"sort":9,"interface":"boolean","special":["cast-boolean"],"collection":"Trust_Logos","field":"Enable_Links"}	{"sort":9,"interface":"boolean","special":["cast-boolean"],"collection":"Trust_Logos","field":"Enable_Links"}	\N	\N
727	818	directus_fields	133	{"id":133,"collection":"Trust_Logos","field":"Enable_Links","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Enable_Links","width":"half"}	\N	\N
728	819	directus_fields	134	{"sort":10,"special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en"},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"collection":"Trust_Logos","field":"translations"}	{"sort":10,"special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en"},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"collection":"Trust_Logos","field":"translations"}	\N	\N
729	820	directus_fields	135	{"sort":1,"hidden":true,"field":"id","collection":"Trust_Logos_translations"}	{"sort":1,"hidden":true,"field":"id","collection":"Trust_Logos_translations"}	\N	\N
730	821	directus_collections	Trust_Logos_translations	{"hidden":true,"icon":"import_export","collection":"Trust_Logos_translations"}	{"hidden":true,"icon":"import_export","collection":"Trust_Logos_translations"}	\N	\N
731	822	directus_fields	136	{"sort":2,"hidden":true,"collection":"Trust_Logos_translations","field":"Trust_Logos_id"}	{"sort":2,"hidden":true,"collection":"Trust_Logos_translations","field":"Trust_Logos_id"}	\N	\N
732	823	directus_fields	137	{"sort":3,"hidden":true,"collection":"Trust_Logos_translations","field":"languages_code"}	{"sort":3,"hidden":true,"collection":"Trust_Logos_translations","field":"languages_code"}	\N	\N
733	824	directus_fields	134	{"id":134,"collection":"Trust_Logos","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"translations","options":{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true}}	\N	\N
734	825	directus_fields	138	{"sort":4,"interface":"input","special":null,"collection":"Trust_Logos_translations","field":"Intro_Text"}	{"sort":4,"interface":"input","special":null,"collection":"Trust_Logos_translations","field":"Intro_Text"}	\N	\N
735	826	directus_fields	139	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Trust_Logo_Images"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Trust_Logo_Images"}	\N	\N
750	841	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
751	842	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
736	827	directus_fields	140	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Trust_Logo_Images"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Trust_Logo_Images"}	\N	\N
737	828	directus_fields	141	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"Trust_Logo_Images"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"Trust_Logo_Images"}	\N	\N
738	829	directus_fields	142	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Trust_Logo_Images"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Trust_Logo_Images"}	\N	\N
739	830	directus_fields	143	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Trust_Logo_Images"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Trust_Logo_Images"}	\N	\N
740	831	directus_fields	144	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Trust_Logo_Images"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Trust_Logo_Images"}	\N	\N
741	832	directus_fields	145	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Trust_Logo_Images"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Trust_Logo_Images"}	\N	\N
742	833	directus_collections	Trust_Logo_Images	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Trust_Logo_Images"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Trust_Logo_Images"}	\N	\N
743	834	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"singleton":false}	\N	\N
744	835	directus_fields	146	{"sort":8,"special":["m2o"],"collection":"Trust_Logo_Images","field":"section"}	{"sort":8,"special":["m2o"],"collection":"Trust_Logo_Images","field":"section"}	\N	\N
745	836	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"singleton":true}	\N	\N
746	837	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
747	838	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
748	839	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
749	840	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
752	843	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
753	844	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
754	845	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
755	846	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
756	847	directus_collections	hero	{"collection":"hero","icon":"exclamation","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
757	848	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
758	849	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Landing_Page"}	\N	\N
759	850	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
760	851	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
761	852	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
762	853	directus_collections	hero	{"collection":"hero","icon":"exclamation","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Landing_Page"}	\N	\N
763	854	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Landing_Page"}	\N	\N
764	855	directus_collections	hero_translations	{"collection":"hero_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Landing_Page"}	\N	\N
765	856	directus_fields	147	{"sort":11,"special":["o2m"],"collection":"Trust_Logos","field":"Logos"}	{"sort":11,"special":["o2m"],"collection":"Trust_Logos","field":"Logos"}	\N	\N
766	857	directus_fields	148	{"sort":9,"interface":"file-image","special":["file"],"collection":"Trust_Logo_Images","field":"Logo"}	{"sort":9,"interface":"file-image","special":["file"],"collection":"Trust_Logo_Images","field":"Logo"}	\N	\N
767	859	directus_fields	149	{"sort":9,"interface":"file-image","special":["file"],"collection":"Trust_Logo_Images","field":"Logo_Image"}	{"sort":9,"interface":"file-image","special":["file"],"collection":"Trust_Logo_Images","field":"Logo_Image"}	\N	\N
768	860	directus_fields	150	{"sort":10,"interface":"input","special":null,"collection":"Trust_Logo_Images","field":"alt"}	{"sort":10,"interface":"input","special":null,"collection":"Trust_Logo_Images","field":"alt"}	\N	\N
769	861	directus_fields	151	{"sort":11,"interface":"input","special":null,"collection":"Trust_Logo_Images","field":"href"}	{"sort":11,"interface":"input","special":null,"collection":"Trust_Logo_Images","field":"href"}	\N	\N
770	863	directus_fields	152	{"sort":12,"special":["translations"],"translations":null,"interface":"translations","options":{"defaultOpenSplitView":true,"languageField":"name","defaultLanguage":"en"},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"collection":"Trust_Logo_Images","field":"translations"}	{"sort":12,"special":["translations"],"translations":null,"interface":"translations","options":{"defaultOpenSplitView":true,"languageField":"name","defaultLanguage":"en"},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"collection":"Trust_Logo_Images","field":"translations"}	\N	\N
771	864	directus_fields	153	{"sort":1,"hidden":true,"field":"id","collection":"Trust_Logo_Images_translations"}	{"sort":1,"hidden":true,"field":"id","collection":"Trust_Logo_Images_translations"}	\N	\N
772	865	directus_collections	Trust_Logo_Images_translations	{"hidden":true,"icon":"import_export","collection":"Trust_Logo_Images_translations"}	{"hidden":true,"icon":"import_export","collection":"Trust_Logo_Images_translations"}	\N	\N
773	866	directus_fields	154	{"sort":2,"hidden":true,"collection":"Trust_Logo_Images_translations","field":"Trust_Logo_Images_id"}	{"sort":2,"hidden":true,"collection":"Trust_Logo_Images_translations","field":"Trust_Logo_Images_id"}	\N	\N
774	867	directus_fields	155	{"sort":3,"hidden":true,"collection":"Trust_Logo_Images_translations","field":"languages_code"}	{"sort":3,"hidden":true,"collection":"Trust_Logo_Images_translations","field":"languages_code"}	\N	\N
775	868	directus_fields	156	{"sort":4,"interface":"input","special":null,"collection":"Trust_Logo_Images_translations","field":"alt_text"}	{"sort":4,"interface":"input","special":null,"collection":"Trust_Logo_Images_translations","field":"alt_text"}	\N	\N
776	869	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Trust_Logos","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Trust_Logos"}	\N	\N
777	870	directus_collections	pages	{"collection":"pages","icon":"article","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":[],"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
778	871	directus_collections	Landing_Page	{"collection":"Landing_Page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
779	872	directus_collections	Menus	{"collection":"Menus","icon":"account_tree","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
780	873	directus_collections	General_Settings	{"collection":"General_Settings","icon":"settings","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
781	874	directus_collections	Trust_Logos_translations	{"collection":"Trust_Logos_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
782	875	directus_collections	Trust_Logo_Images_translations	{"collection":"Trust_Logo_Images_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
783	876	directus_collections	Trust_Logos	{"collection":"Trust_Logos","icon":"typo3","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"icon":"typo3"}	\N	\N
784	877	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":"typo3","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Trust_Logos","collapse":"open","preview_url":null,"versioning":false}	{"icon":"typo3"}	\N	\N
785	878	directus_files	0c316c98-891a-45f2-b878-b5fa454cc1ca	{"title":"Google 2015 Logo","filename_download":"Google_2015_logo.svg","type":"image/svg+xml","storage":"gcs"}	{"title":"Google 2015 Logo","filename_download":"Google_2015_logo.svg","type":"image/svg+xml","storage":"gcs"}	\N	\N
786	879	Trust_Logo_Images_translations	1	{"alt_text":"Google","languages_code":{"code":"en"},"Trust_Logo_Images_id":2}	{"alt_text":"Google","languages_code":{"code":"en"},"Trust_Logo_Images_id":2}	790	\N
828	921	Trust_Logos_translations	1	{"Intro_Text":"Trusted by scaling companies in logistics, SaaS, and transportation","languages_code":{"code":"en"},"Trust_Logos_id":1}	{"Intro_Text":"Trusted by scaling companies in logistics, SaaS, and transportation","languages_code":{"code":"en"},"Trust_Logos_id":1}	832	\N
829	922	Trust_Logos_translations	2	{"Intro_Text":"De confiance auprès des entreprises en croissance dans la logistique, le SaaS et le transport","languages_code":{"code":"fr"},"Trust_Logos_id":1}	{"Intro_Text":"De confiance auprès des entreprises en croissance dans la logistique, le SaaS et le transport","languages_code":{"code":"fr"},"Trust_Logos_id":1}	832	\N
790	883	Trust_Logo_Images	2	{"status":"published","Logo_Image":"0c316c98-891a-45f2-b878-b5fa454cc1ca","translations":{"create":[{"alt_text":"Google","languages_code":{"code":"en"}},{"alt_text":"Google","languages_code":{"code":"fr"}},{"alt_text":"Google","languages_code":{"code":"de"}},{"languages_code":{"code":"es"},"alt_text":"Google"}],"update":[],"delete":[]},"href":"https://www.google.com"}	{"status":"published","Logo_Image":"0c316c98-891a-45f2-b878-b5fa454cc1ca","translations":{"create":[{"alt_text":"Google","languages_code":{"code":"en"}},{"alt_text":"Google","languages_code":{"code":"fr"}},{"alt_text":"Google","languages_code":{"code":"de"}},{"languages_code":{"code":"es"},"alt_text":"Google"}],"update":[],"delete":[]},"href":"https://www.google.com"}	\N	\N
787	880	Trust_Logo_Images_translations	2	{"alt_text":"Google","languages_code":{"code":"fr"},"Trust_Logo_Images_id":2}	{"alt_text":"Google","languages_code":{"code":"fr"},"Trust_Logo_Images_id":2}	790	\N
788	881	Trust_Logo_Images_translations	3	{"alt_text":"Google","languages_code":{"code":"de"},"Trust_Logo_Images_id":2}	{"alt_text":"Google","languages_code":{"code":"de"},"Trust_Logo_Images_id":2}	790	\N
789	882	Trust_Logo_Images_translations	4	{"languages_code":{"code":"es"},"alt_text":"Google","Trust_Logo_Images_id":2}	{"languages_code":{"code":"es"},"alt_text":"Google","Trust_Logo_Images_id":2}	790	\N
791	884	directus_fields	146	{"id":146,"collection":"Trust_Logo_Images","field":"section","special":["m2o"],"interface":"select-dropdown-m2o","options":{"enableLink":true},"display":"related-values","display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"section","interface":"select-dropdown-m2o","options":{"enableLink":true},"display":"related-values"}	\N	\N
792	885	directus_fields	139	{"id":139,"collection":"Trust_Logo_Images","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"id","sort":1,"group":null}	\N	\N
793	886	directus_fields	140	{"id":140,"collection":"Trust_Logo_Images","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"status","sort":2,"group":null}	\N	\N
794	887	directus_fields	141	{"id":141,"collection":"Trust_Logo_Images","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"sort","sort":3,"group":null}	\N	\N
795	888	directus_fields	142	{"id":142,"collection":"Trust_Logo_Images","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"user_created","sort":4,"group":null}	\N	\N
796	889	directus_fields	143	{"id":143,"collection":"Trust_Logo_Images","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"date_created","sort":5,"group":null}	\N	\N
797	890	directus_fields	144	{"id":144,"collection":"Trust_Logo_Images","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"user_updated","sort":6,"group":null}	\N	\N
798	891	directus_fields	145	{"id":145,"collection":"Trust_Logo_Images","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"date_updated","sort":7,"group":null}	\N	\N
799	892	directus_fields	149	{"id":149,"collection":"Trust_Logo_Images","field":"Logo_Image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"Logo_Image","sort":8,"group":null}	\N	\N
800	893	directus_fields	151	{"id":151,"collection":"Trust_Logo_Images","field":"href","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"href","sort":9,"group":null}	\N	\N
801	894	directus_fields	152	{"id":152,"collection":"Trust_Logo_Images","field":"translations","special":["translations"],"interface":"translations","options":{"defaultOpenSplitView":true,"languageField":"name","defaultLanguage":"en"},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"translations","sort":10,"group":null}	\N	\N
802	895	directus_fields	146	{"id":146,"collection":"Trust_Logo_Images","field":"section","special":["m2o"],"interface":"select-dropdown-m2o","options":{"enableLink":true},"display":"related-values","display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"section","sort":11,"group":null}	\N	\N
803	896	directus_fields	146	{"id":146,"collection":"Trust_Logo_Images","field":"section","special":["m2o"],"interface":"select-dropdown-m2o","options":{"enableLink":true},"display":"related-values","display_options":null,"readonly":false,"hidden":true,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"section","hidden":true}	\N	\N
804	897	directus_fields	147	{"id":147,"collection":"Trust_Logos","field":"Logos","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Logos","interface":"list-o2m-tree-view","display":null}	\N	\N
805	898	directus_fields	147	{"id":147,"collection":"Trust_Logos","field":"Logos","special":["o2m"],"interface":"list-o2m","options":{"layout":"table","fields":["Logo_Image"]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Logos","interface":"list-o2m","options":{"layout":"table","fields":["Logo_Image"]}}	\N	\N
806	899	directus_fields	147	{"id":147,"collection":"Trust_Logos","field":"Logos","special":["o2m"],"interface":"list-o2m","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Logos","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true}}	\N	\N
807	900	directus_fields	147	{"id":147,"collection":"Trust_Logos","field":"Logos","special":["o2m"],"interface":"list-o2m","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{translations.alt_text}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Logos","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{translations.alt_text}}"}}	\N	\N
809	902	Trust_Logos	1	{"Logos":{"create":[],"update":[{"section":"+","id":2}],"delete":[]}}	{"Logos":{"create":[],"update":[{"section":"+","id":2}],"delete":[]}}	\N	\N
808	901	Trust_Logo_Images	2	{"id":2,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T13:57:32.659Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T14:03:12.964Z","section":1,"Logo_Image":"0c316c98-891a-45f2-b878-b5fa454cc1ca","href":"https://www.google.com","translations":[1,2,3,4]}	{"section":1,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T14:03:12.964Z"}	809	\N
810	903	directus_fields	157	{"sort":12,"interface":"input","special":null,"collection":"Trust_Logo_Images","field":"Label"}	{"sort":12,"interface":"input","special":null,"collection":"Trust_Logo_Images","field":"Label"}	\N	\N
811	904	directus_fields	139	{"id":139,"collection":"Trust_Logo_Images","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"id","sort":1,"group":null}	\N	\N
812	905	directus_fields	157	{"id":157,"collection":"Trust_Logo_Images","field":"Label","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"Label","sort":2,"group":null}	\N	\N
813	906	directus_fields	140	{"id":140,"collection":"Trust_Logo_Images","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"status","sort":3,"group":null}	\N	\N
814	907	directus_fields	141	{"id":141,"collection":"Trust_Logo_Images","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"sort","sort":4,"group":null}	\N	\N
815	908	directus_fields	142	{"id":142,"collection":"Trust_Logo_Images","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"user_created","sort":5,"group":null}	\N	\N
823	916	Trust_Logo_Images	2	{"id":2,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T13:57:32.659Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T14:03:47.957Z","section":1,"Logo_Image":"0c316c98-891a-45f2-b878-b5fa454cc1ca","href":"https://www.google.com","Label":"Google","translations":[1,2,3,4]}	{"Label":"Google","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T14:03:47.957Z"}	\N	\N
951	1046	Trust_Logo_Images_translations	14	{"id":14,"Trust_Logo_Images_id":5,"languages_code":"fr","alt_text":"FedEx"}	{"languages_code":"fr","alt_text":"FedEx"}	954	\N
816	909	directus_fields	143	{"id":143,"collection":"Trust_Logo_Images","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"date_created","sort":6,"group":null}	\N	\N
817	910	directus_fields	144	{"id":144,"collection":"Trust_Logo_Images","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"user_updated","sort":7,"group":null}	\N	\N
818	911	directus_fields	145	{"id":145,"collection":"Trust_Logo_Images","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"date_updated","sort":8,"group":null}	\N	\N
819	912	directus_fields	149	{"id":149,"collection":"Trust_Logo_Images","field":"Logo_Image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"Logo_Image","sort":9,"group":null}	\N	\N
820	913	directus_fields	151	{"id":151,"collection":"Trust_Logo_Images","field":"href","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"href","sort":10,"group":null}	\N	\N
821	914	directus_fields	152	{"id":152,"collection":"Trust_Logo_Images","field":"translations","special":["translations"],"interface":"translations","options":{"defaultOpenSplitView":true,"languageField":"name","defaultLanguage":"en"},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"translations","sort":11,"group":null}	\N	\N
822	915	directus_fields	146	{"id":146,"collection":"Trust_Logo_Images","field":"section","special":["m2o"],"interface":"select-dropdown-m2o","options":{"enableLink":true},"display":"related-values","display_options":null,"readonly":false,"hidden":true,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logo_Images","field":"section","sort":12,"group":null}	\N	\N
824	917	directus_fields	147	{"id":147,"collection":"Trust_Logos","field":"Logos","special":["o2m"],"interface":"list-o2m","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{Label}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Logos","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{Label}}"},"display":null}	\N	\N
825	918	directus_fields	147	{"id":147,"collection":"Trust_Logos","field":"Logos","special":["o2m"],"interface":"list-o2m","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{status}}{{Label}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Logos","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{status}}{{Label}}"}}	\N	\N
826	919	directus_fields	147	{"id":147,"collection":"Trust_Logos","field":"Logos","special":["o2m"],"interface":"list-o2m","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{status}} {{Label}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Logos","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{status}} {{Label}}"}}	\N	\N
827	920	directus_collections	Trust_Logo_Images	{"collection":"Trust_Logo_Images","icon":"typo3","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Trust_Logos","collapse":"open","preview_url":null,"versioning":false}	{"hidden":true}	\N	\N
832	925	Trust_Logos	1	{"id":1,"status":"draft","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T14:03:12.961Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T14:14:55.815Z","is_monochrome":true,"Monochrome_Color":null,"Enable_Links":true,"translations":[1,2,3,4],"Logos":[2]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T14:14:55.815Z"}	\N	\N
833	926	Trust_Logos	1	{"id":1,"status":"draft","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T14:03:12.961Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T14:15:09.509Z","is_monochrome":true,"Monochrome_Color":"#BBBBBB","Enable_Links":true,"translations":[1,2,3,4],"Logos":[2]}	{"Monochrome_Color":"#BBBBBB","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T14:15:09.509Z"}	\N	\N
834	927	Trust_Logos	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T14:03:12.961Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T14:15:57.314Z","is_monochrome":true,"Monochrome_Color":"#BBBBBB","Enable_Links":true,"translations":[1,2,3,4],"Logos":[2]}	{"status":"published","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T14:15:57.314Z"}	\N	\N
835	928	directus_permissions	31	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Trust_Logos","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Trust_Logos","action":"read"}	\N	\N
836	929	directus_permissions	32	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Trust_Logos_translations","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Trust_Logos_translations","action":"read"}	\N	\N
837	930	directus_permissions	33	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Trust_Logo_Images_translations","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Trust_Logo_Images_translations","action":"read"}	\N	\N
838	931	directus_permissions	34	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Trust_Logo_Images","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Trust_Logo_Images","action":"read"}	\N	\N
839	933	directus_fields	158	{"sort":9,"interface":"input","special":null,"collection":"hero_translations","field":"supporting_text2"}	{"sort":9,"interface":"input","special":null,"collection":"hero_translations","field":"supporting_text2"}	\N	\N
840	934	directus_fields	74	{"id":74,"collection":"hero_translations","field":"id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"id","sort":1,"group":null}	\N	\N
841	935	directus_fields	75	{"id":75,"collection":"hero_translations","field":"hero_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"hero_id","sort":2,"group":null}	\N	\N
842	936	directus_fields	76	{"id":76,"collection":"hero_translations","field":"languages_code","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"languages_code","sort":3,"group":null}	\N	\N
843	937	directus_fields	82	{"id":82,"collection":"hero_translations","field":"heading","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"heading","sort":4,"group":null}	\N	\N
844	938	directus_fields	88	{"id":88,"collection":"hero_translations","field":"heading_highlighted","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"heading_highlighted","sort":5,"group":null}	\N	\N
845	939	directus_fields	81	{"id":81,"collection":"hero_translations","field":"supporting_text","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"supporting_text","sort":6,"group":null}	\N	\N
846	940	directus_fields	83	{"id":83,"collection":"hero_translations","field":"CTA","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"CTA","sort":7,"group":null}	\N	\N
847	941	directus_fields	158	{"id":158,"collection":"hero_translations","field":"supporting_text2","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"supporting_text2","sort":8,"group":null}	\N	\N
848	942	directus_fields	85	{"id":85,"collection":"hero_translations","field":"CTA2","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_translations","field":"CTA2","sort":9,"group":null}	\N	\N
849	943	directus_fields	159	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Map_Cities"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Map_Cities"}	\N	\N
872	967	directus_fields	129	{"id":129,"collection":"Trust_Logos","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"user_updated","sort":5,"group":null}	\N	\N
952	1047	Trust_Logo_Images_translations	15	{"id":15,"Trust_Logo_Images_id":5,"languages_code":"de","alt_text":"FedEx"}	{"languages_code":"de","alt_text":"FedEx"}	954	\N
850	944	directus_fields	160	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Map_Cities"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"Map_Cities"}	\N	\N
851	945	directus_fields	161	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"Map_Cities"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"Map_Cities"}	\N	\N
852	946	directus_fields	162	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Map_Cities"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Map_Cities"}	\N	\N
853	947	directus_fields	163	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Map_Cities"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Map_Cities"}	\N	\N
854	948	directus_fields	164	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Map_Cities"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Map_Cities"}	\N	\N
855	949	directus_fields	165	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Map_Cities"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Map_Cities"}	\N	\N
856	950	directus_collections	Map_Cities	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Map_Cities"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Map_Cities"}	\N	\N
857	951	directus_collections	hero	{"collection":"hero","icon":"exclamation","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"singleton":false}	\N	\N
858	952	directus_fields	166	{"sort":8,"special":["m2o"],"hidden":false,"collection":"Map_Cities","field":"parent"}	{"sort":8,"special":["m2o"],"hidden":false,"collection":"Map_Cities","field":"parent"}	\N	\N
859	953	directus_fields	167	{"sort":8,"special":["o2m"],"interface":"list-o2m","collection":"hero","field":"Map_Cities"}	{"sort":8,"special":["o2m"],"interface":"list-o2m","collection":"hero","field":"Map_Cities"}	\N	\N
860	954	directus_permissions	35	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Map_Cities","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"Map_Cities","action":"read"}	\N	\N
861	956	hero_translations	1	{"id":1,"hero_id":1,"languages_code":"en","supporting_text":"Where growth-stage companies hire elite operators — and top talent lands their next big role.","heading":"The Supply Chain Talent Marketplace Built for","CTA":"Hire Top Talent Now → How it Works","CTA2":"Start Here","heading_highlighted":"Speed & Precision","supporting_text2":"Are you a supply chain operator looking for your next role?"}	{"languages_code":"en","CTA":"Hire Top Talent Now → How it Works","CTA2":"Start Here","supporting_text2":"Are you a supply chain operator looking for your next role?"}	865	\N
953	1048	Trust_Logo_Images_translations	16	{"id":16,"Trust_Logo_Images_id":5,"languages_code":"es","alt_text":"FedEx"}	{"languages_code":"es","alt_text":"FedEx"}	954	\N
955	1050	Trust_Logo_Images_translations	9	{"id":9,"Trust_Logo_Images_id":4,"languages_code":"en","alt_text":"Deutsche Post"}	{"languages_code":"en","alt_text":"Deutsche Post"}	959	\N
956	1051	Trust_Logo_Images_translations	10	{"id":10,"Trust_Logo_Images_id":4,"languages_code":"fr","alt_text":"Deutsche Post"}	{"languages_code":"fr","alt_text":"Deutsche Post"}	959	\N
865	960	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:01:07.663Z","translations":[1,2,3,4],"Map_Cities":[]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:01:07.663Z"}	\N	\N
862	957	hero_translations	2	{"id":2,"hero_id":1,"languages_code":"es","supporting_text":"Donde las empresas en crecimiento contratan a operadores de élite — y el mejor talento consigue su próximo gran rol.","heading":"El Mercado de Talento en Cadena de Suministro Creado para la ","CTA":"Contrata al Mejor Talento Ahora → Cómo Funciona","CTA2":"Comienza Aquí","heading_highlighted":"Velocidad y la Precisión","supporting_text2":"¿Eres un operador de cadena de suministro que busca su próximo rol?"}	{"languages_code":"es","CTA":"Contrata al Mejor Talento Ahora → Cómo Funciona","CTA2":"Comienza Aquí","supporting_text2":"¿Eres un operador de cadena de suministro que busca su próximo rol?"}	865	\N
863	958	hero_translations	3	{"id":3,"hero_id":1,"languages_code":"fr","supporting_text":"Là où les entreprises en phase de croissance recrutent des opérateurs d’élite — et où les meilleurs talents décrochent leur prochain grand rôle.","heading":"Le Marché de Talents de la Chaîne d’Approvisionnement Conçu pour la ","CTA":"Recrutez les Meilleurs Talents Maintenant → Comment ça Marche","CTA2":"Commencez Ici","heading_highlighted":"Rapidité et la Précision","supporting_text2":"Êtes-vous un opérateur de la chaîne d’approvisionnement à la recherche de votre prochain rôle ?"}	{"languages_code":"fr","CTA":"Recrutez les Meilleurs Talents Maintenant → Comment ça Marche","CTA2":"Commencez Ici","supporting_text2":"Êtes-vous un opérateur de la chaîne d’approvisionnement à la recherche de votre prochain rôle ?"}	865	\N
864	959	hero_translations	4	{"id":4,"hero_id":1,"languages_code":"de","supporting_text":"Wo Wachstumsunternehmen Elite-Operatoren einstellen — und Top-Talente ihre nächste große Rolle finden.","heading":"Der Talentmarktplatz für Lieferketten — Entwickelt für ","CTA":"Top-Talente Jetzt Einstellen → So Funktioniert’s","CTA2":"Jetzt Los","heading_highlighted":"Schnelligkeit und Präzision","supporting_text2":"Sind Sie ein Supply-Chain-Operator auf der Suche nach Ihrer nächsten Rolle?"}	{"languages_code":"de","CTA":"Top-Talente Jetzt Einstellen → So Funktioniert’s","CTA2":"Jetzt Los","supporting_text2":"Sind Sie ein Supply-Chain-Operator auf der Suche nach Ihrer nächsten Rolle?"}	865	\N
866	961	directus_fields	168	{"sort":12,"interface":"boolean","special":["cast-boolean"],"collection":"Trust_Logos","field":"scroll_logos"}	{"sort":12,"interface":"boolean","special":["cast-boolean"],"collection":"Trust_Logos","field":"scroll_logos"}	\N	\N
867	962	directus_fields	168	{"id":168,"collection":"Trust_Logos","field":"scroll_logos","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"scroll_logos","width":"half"}	\N	\N
868	963	directus_fields	125	{"id":125,"collection":"Trust_Logos","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"id","sort":1,"group":null}	\N	\N
869	964	directus_fields	126	{"id":126,"collection":"Trust_Logos","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"status","sort":2,"group":null}	\N	\N
870	965	directus_fields	127	{"id":127,"collection":"Trust_Logos","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"user_created","sort":3,"group":null}	\N	\N
871	966	directus_fields	128	{"id":128,"collection":"Trust_Logos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"date_created","sort":4,"group":null}	\N	\N
971	1066	Trust_Logo_Images_translations	31	{"alt_text":"Ceva Logistics","languages_code":{"code":"de"},"Trust_Logo_Images_id":9}	{"alt_text":"Ceva Logistics","languages_code":{"code":"de"},"Trust_Logo_Images_id":9}	973	\N
873	968	directus_fields	130	{"id":130,"collection":"Trust_Logos","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"date_updated","sort":6,"group":null}	\N	\N
874	969	directus_fields	131	{"id":131,"collection":"Trust_Logos","field":"is_monochrome","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"is_monochrome","sort":7,"group":null}	\N	\N
875	970	directus_fields	132	{"id":132,"collection":"Trust_Logos","field":"Monochrome_Color","special":null,"interface":"select-color","options":{"opacity":true,"presets":[{"name":"Light Gray","color":"#BBBBBB"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Monochrome_Color","sort":8,"group":null}	\N	\N
876	971	directus_fields	133	{"id":133,"collection":"Trust_Logos","field":"Enable_Links","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Enable_Links","sort":9,"group":null}	\N	\N
877	972	directus_fields	168	{"id":168,"collection":"Trust_Logos","field":"scroll_logos","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"scroll_logos","sort":10,"group":null}	\N	\N
878	973	directus_fields	134	{"id":134,"collection":"Trust_Logos","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"translations","sort":11,"group":null}	\N	\N
879	974	directus_fields	147	{"id":147,"collection":"Trust_Logos","field":"Logos","special":["o2m"],"interface":"list-o2m","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{status}} {{Label}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Logos","sort":12,"group":null}	\N	\N
880	975	directus_files	010d86f5-4725-4504-bfbe-c38b55cd6c20	{"title":"Li Logo","filename_download":"LI-Logo.png","type":"image/png","storage":"gcs"}	{"title":"Li Logo","filename_download":"LI-Logo.png","type":"image/png","storage":"gcs"}	\N	\N
881	976	Trust_Logo_Images_translations	5	{"alt_text":"LinkedIn","languages_code":{"code":"en"},"Trust_Logo_Images_id":3}	{"alt_text":"LinkedIn","languages_code":{"code":"en"},"Trust_Logo_Images_id":3}	885	\N
882	977	Trust_Logo_Images_translations	6	{"alt_text":"LinkedIn","languages_code":{"code":"fr"},"Trust_Logo_Images_id":3}	{"alt_text":"LinkedIn","languages_code":{"code":"fr"},"Trust_Logo_Images_id":3}	885	\N
883	978	Trust_Logo_Images_translations	7	{"alt_text":"LinkedIn","languages_code":{"code":"de"},"Trust_Logo_Images_id":3}	{"alt_text":"LinkedIn","languages_code":{"code":"de"},"Trust_Logo_Images_id":3}	885	\N
884	979	Trust_Logo_Images_translations	8	{"alt_text":"LinkedIn","languages_code":{"code":"es"},"Trust_Logo_Images_id":3}	{"alt_text":"LinkedIn","languages_code":{"code":"es"},"Trust_Logo_Images_id":3}	885	\N
886	981	Trust_Logos	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T14:03:12.961Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:07:47.064Z","is_monochrome":true,"Monochrome_Color":"#BBBBBB","Enable_Links":true,"scroll_logos":true,"Logos":[3,2],"translations":[1,2,3,4]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:07:47.064Z"}	\N	\N
885	980	Trust_Logo_Images	3	{"Label":"LinkedIn","status":"published","Logo_Image":"010d86f5-4725-4504-bfbe-c38b55cd6c20","translations":{"create":[{"alt_text":"LinkedIn","languages_code":{"code":"en"}},{"alt_text":"LinkedIn","languages_code":{"code":"fr"}},{"alt_text":"LinkedIn","languages_code":{"code":"de"}},{"alt_text":"LinkedIn","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"https://linkedin.com","sort":1,"section":1}	{"Label":"LinkedIn","status":"published","Logo_Image":"010d86f5-4725-4504-bfbe-c38b55cd6c20","translations":{"create":[{"alt_text":"LinkedIn","languages_code":{"code":"en"}},{"alt_text":"LinkedIn","languages_code":{"code":"fr"}},{"alt_text":"LinkedIn","languages_code":{"code":"de"}},{"alt_text":"LinkedIn","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"https://linkedin.com","sort":1,"section":1}	886	\N
887	982	directus_fields	169	{"sort":9,"interface":"map","special":null,"options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"required":true,"collection":"Map_Cities","field":"location"}	{"sort":9,"interface":"map","special":null,"options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"required":true,"collection":"Map_Cities","field":"location"}	\N	\N
889	984	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:19:43.628Z","translations":[1,2,3,4],"Map_Cities":[1]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:19:43.628Z"}	\N	\N
888	983	Map_Cities	1	{"status":"published","location":{"coordinates":[-83.67187500000097,43.06888777417052],"type":"Point"},"parent":"1"}	{"status":"published","location":{"coordinates":[-83.67187500000097,43.06888777417052],"type":"Point"},"parent":"1"}	889	\N
890	985	directus_fields	170	{"sort":10,"interface":"input","special":null,"required":true,"collection":"Map_Cities","field":"Name"}	{"sort":10,"interface":"input","special":null,"required":true,"collection":"Map_Cities","field":"Name"}	\N	\N
892	987	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:20:28.140Z","translations":[1,2,3,4],"Map_Cities":[]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:20:28.140Z"}	\N	\N
891	986	Map_Cities	1	{"id":1,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T15:19:43.630Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:20:28.144Z","parent":null,"location":{"type":"Point","coordinates":[-83.67187500000097,43.06888777417052]},"Name":null}	{"parent":null,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:20:28.144Z"}	892	\N
893	988	Map_Cities	1	{"id":1,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T15:19:43.630Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:21:07.389Z","parent":null,"location":{"type":"Point","coordinates":[-83.05400950696924,42.35475114878807]},"Name":"Detroit"}	{"location":{"type":"Point","coordinates":[-83.05400950696924,42.35475114878807]},"Name":"Detroit","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:21:07.389Z"}	\N	\N
895	990	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:21:26.879Z","translations":[1,2,3,4],"Map_Cities":[1]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:21:26.879Z"}	\N	\N
894	989	Map_Cities	1	{"id":1,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T15:19:43.630Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:21:26.882Z","parent":1,"location":{"type":"Point","coordinates":[-83.05400950696924,42.35475114878807]},"Name":"Detroit"}	{"parent":"1","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:21:26.882Z"}	895	\N
896	991	directus_collections	hero	{"collection":"hero","icon":"exclamation","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"singleton":true}	\N	\N
897	992	directus_collections	Map_Cities	{"collection":"Map_Cities","icon":null,"note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"hidden":true}	\N	\N
898	993	directus_fields	167	{"id":167,"collection":"hero","field":"Map_Cities","special":["o2m"],"interface":"list-o2m","options":{"template":"{{Name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero","field":"Map_Cities","options":{"template":"{{Name}}"}}	\N	\N
900	995	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:23:11.369Z","translations":[1,2,3,4],"Map_Cities":[1,2]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:23:11.369Z"}	\N	\N
899	994	Map_Cities	2	{"Name":"London","location":{"coordinates":[-0.14323098031940162,51.51306340549107],"type":"Point"},"status":"published","parent":1}	{"Name":"London","location":{"coordinates":[-0.14323098031940162,51.51306340549107],"type":"Point"},"status":"published","parent":1}	900	\N
905	1000	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:26:38.856Z","translations":[1,2,3,4],"Map_Cities":[1,2,3,4,5,6]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:26:38.856Z"}	\N	\N
901	996	Map_Cities	3	{"status":"published","Name":"Tokyo","location":{"coordinates":[139.7940191087497,35.70914495195265],"type":"Point"},"parent":1}	{"status":"published","Name":"Tokyo","location":{"coordinates":[139.7940191087497,35.70914495195265],"type":"Point"},"parent":1}	905	\N
909	1004	directus_fields	162	{"id":162,"collection":"Map_Cities","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"user_created","sort":4,"group":null}	\N	\N
910	1005	directus_fields	163	{"id":163,"collection":"Map_Cities","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"date_created","sort":5,"group":null}	\N	\N
911	1006	directus_fields	164	{"id":164,"collection":"Map_Cities","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"user_updated","sort":6,"group":null}	\N	\N
912	1007	directus_fields	165	{"id":165,"collection":"Map_Cities","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"date_updated","sort":7,"group":null}	\N	\N
913	1008	directus_fields	170	{"id":170,"collection":"Map_Cities","field":"Name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"Name","sort":8,"group":null}	\N	\N
914	1009	directus_fields	166	{"id":166,"collection":"Map_Cities","field":"parent","special":["m2o"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"parent","sort":9,"group":null}	\N	\N
915	1010	directus_fields	169	{"id":169,"collection":"Map_Cities","field":"location","special":null,"interface":"map","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"location","sort":10,"group":null}	\N	\N
916	1011	directus_fields	166	{"id":166,"collection":"Map_Cities","field":"parent","special":["m2o"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Map_Cities","field":"parent","hidden":true}	\N	\N
918	1013	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:27:34.374Z","translations":[1,2,3,4],"Map_Cities":[1,2,3,4,5,6,7]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:27:34.374Z"}	\N	\N
917	1012	Map_Cities	7	{"Name":"Sydney","status":"published","location":{"coordinates":[150.9104768738274,-33.76198176093437],"type":"Point"},"parent":1}	{"Name":"Sydney","status":"published","location":{"coordinates":[150.9104768738274,-33.76198176093437],"type":"Point"},"parent":1}	918	\N
921	1016	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:28:29.351Z","translations":[1,2,3,4],"Map_Cities":[1,2,3,4,5,6,7,8,9]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:28:29.351Z"}	\N	\N
919	1014	Map_Cities	8	{"status":"published","Name":"New York","location":{"coordinates":[-73.92619792761577,40.76833117693798],"type":"Point"},"parent":1}	{"status":"published","Name":"New York","location":{"coordinates":[-73.92619792761577,40.76833117693798],"type":"Point"},"parent":1}	921	\N
920	1015	Map_Cities	9	{"status":"published","Name":"Seattle","location":{"coordinates":[-122.33484884195491,47.561429252655074],"type":"Point"},"parent":1}	{"status":"published","Name":"Seattle","location":{"coordinates":[-122.33484884195491,47.561429252655074],"type":"Point"},"parent":1}	921	\N
922	1017	directus_files	18b14f63-1d2c-4f47-aebc-e4fd7a55df5e	{"filename_download":"United_Parcel_Service_logo_2014.svg","storage":"gcs","type":"image/svg+xml","title":"United Parcel Service Logo 2014.svg"}	{"filename_download":"United_Parcel_Service_logo_2014.svg","storage":"gcs","type":"image/svg+xml","title":"United Parcel Service Logo 2014.svg"}	\N	\N
923	1018	directus_files	6d0b105d-1845-4e73-9a8d-939e2c4406ce	{"filename_download":"DB_Schenker_logo.svg","storage":"gcs","type":"image/svg+xml","title":"DB Schenker Logo.svg"}	{"filename_download":"DB_Schenker_logo.svg","storage":"gcs","type":"image/svg+xml","title":"DB Schenker Logo.svg"}	\N	\N
924	1019	directus_files	d752773c-8023-430b-a914-8180c52bd990	{"filename_download":"Ryder","storage":"gcs","type":"text/html; charset=UTF-8","title":"Ryder"}	{"filename_download":"Ryder","storage":"gcs","type":"text/html; charset=UTF-8","title":"Ryder"}	\N	\N
925	1020	directus_files	0874f072-3951-4a37-b07d-0efa9c4322b2	{"title":"Ryder","filename_download":"Ryder.png","type":"image/png","storage":"gcs"}	{"title":"Ryder","filename_download":"Ryder.png","type":"image/png","storage":"gcs"}	\N	\N
926	1021	Trust_Logo_Images_translations	9	{"languages_code":{"code":"en"},"alt_text":"UPS","Trust_Logo_Images_id":4}	{"languages_code":{"code":"en"},"alt_text":"UPS","Trust_Logo_Images_id":4}	930	\N
927	1022	Trust_Logo_Images_translations	10	{"alt_text":"UPS","languages_code":{"code":"fr"},"Trust_Logo_Images_id":4}	{"alt_text":"UPS","languages_code":{"code":"fr"},"Trust_Logo_Images_id":4}	930	\N
928	1023	Trust_Logo_Images_translations	11	{"alt_text":"UPS","languages_code":{"code":"de"},"Trust_Logo_Images_id":4}	{"alt_text":"UPS","languages_code":{"code":"de"},"Trust_Logo_Images_id":4}	930	\N
929	1024	Trust_Logo_Images_translations	12	{"alt_text":"UPS","languages_code":{"code":"es"},"Trust_Logo_Images_id":4}	{"alt_text":"UPS","languages_code":{"code":"es"},"Trust_Logo_Images_id":4}	930	\N
931	1026	Trust_Logo_Images_translations	13	{"alt_text":"DB Schenker","languages_code":{"code":"en"},"Trust_Logo_Images_id":5}	{"alt_text":"DB Schenker","languages_code":{"code":"en"},"Trust_Logo_Images_id":5}	935	\N
932	1027	Trust_Logo_Images_translations	14	{"alt_text":"DB Schenker","languages_code":{"code":"fr"},"Trust_Logo_Images_id":5}	{"alt_text":"DB Schenker","languages_code":{"code":"fr"},"Trust_Logo_Images_id":5}	935	\N
933	1028	Trust_Logo_Images_translations	15	{"alt_text":"DB Schenker","languages_code":{"code":"de"},"Trust_Logo_Images_id":5}	{"alt_text":"DB Schenker","languages_code":{"code":"de"},"Trust_Logo_Images_id":5}	935	\N
934	1029	Trust_Logo_Images_translations	16	{"alt_text":"DB Schenker","languages_code":{"code":"es"},"Trust_Logo_Images_id":5}	{"alt_text":"DB Schenker","languages_code":{"code":"es"},"Trust_Logo_Images_id":5}	935	\N
936	1031	Trust_Logo_Images_translations	17	{"alt_text":"Ryder","languages_code":{"code":"en"},"Trust_Logo_Images_id":6}	{"alt_text":"Ryder","languages_code":{"code":"en"},"Trust_Logo_Images_id":6}	940	\N
937	1032	Trust_Logo_Images_translations	18	{"alt_text":"Ryder","languages_code":{"code":"fr"},"Trust_Logo_Images_id":6}	{"alt_text":"Ryder","languages_code":{"code":"fr"},"Trust_Logo_Images_id":6}	940	\N
938	1033	Trust_Logo_Images_translations	19	{"alt_text":"Ryder","languages_code":{"code":"de"},"Trust_Logo_Images_id":6}	{"alt_text":"Ryder","languages_code":{"code":"de"},"Trust_Logo_Images_id":6}	940	\N
939	1034	Trust_Logo_Images_translations	20	{"alt_text":"Ryder","languages_code":{"code":"es"},"Trust_Logo_Images_id":6}	{"alt_text":"Ryder","languages_code":{"code":"es"},"Trust_Logo_Images_id":6}	940	\N
941	1036	Trust_Logos	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T14:03:12.961Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:37:13.625Z","is_monochrome":true,"Monochrome_Color":"#BBBBBB","Enable_Links":true,"scroll_logos":true,"Logos":[3,4,5,6,2],"translations":[1,2,3,4]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:37:13.625Z"}	\N	\N
972	1067	Trust_Logo_Images_translations	32	{"alt_text":"Ceva Logistics","languages_code":{"code":"es"},"Trust_Logo_Images_id":9}	{"alt_text":"Ceva Logistics","languages_code":{"code":"es"},"Trust_Logo_Images_id":9}	973	\N
930	1025	Trust_Logo_Images	4	{"Label":"UPS","status":"published","Logo_Image":"18b14f63-1d2c-4f47-aebc-e4fd7a55df5e","href":"https://www.ups.com","translations":{"create":[{"languages_code":{"code":"en"},"alt_text":"UPS"},{"alt_text":"UPS","languages_code":{"code":"fr"}},{"alt_text":"UPS","languages_code":{"code":"de"}},{"alt_text":"UPS","languages_code":{"code":"es"}}],"update":[],"delete":[]},"sort":2,"section":1}	{"Label":"UPS","status":"published","Logo_Image":"18b14f63-1d2c-4f47-aebc-e4fd7a55df5e","href":"https://www.ups.com","translations":{"create":[{"languages_code":{"code":"en"},"alt_text":"UPS"},{"alt_text":"UPS","languages_code":{"code":"fr"}},{"alt_text":"UPS","languages_code":{"code":"de"}},{"alt_text":"UPS","languages_code":{"code":"es"}}],"update":[],"delete":[]},"sort":2,"section":1}	941	\N
935	1030	Trust_Logo_Images	5	{"Logo_Image":"6d0b105d-1845-4e73-9a8d-939e2c4406ce","status":"published","Label":"DB Schenker","translations":{"create":[{"alt_text":"DB Schenker","languages_code":{"code":"en"}},{"alt_text":"DB Schenker","languages_code":{"code":"fr"}},{"alt_text":"DB Schenker","languages_code":{"code":"de"}},{"alt_text":"DB Schenker","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"https://db.de","sort":3,"section":1}	{"Logo_Image":"6d0b105d-1845-4e73-9a8d-939e2c4406ce","status":"published","Label":"DB Schenker","translations":{"create":[{"alt_text":"DB Schenker","languages_code":{"code":"en"}},{"alt_text":"DB Schenker","languages_code":{"code":"fr"}},{"alt_text":"DB Schenker","languages_code":{"code":"de"}},{"alt_text":"DB Schenker","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"https://db.de","sort":3,"section":1}	941	\N
940	1035	Trust_Logo_Images	6	{"Label":"Ryder","status":"published","Logo_Image":"0874f072-3951-4a37-b07d-0efa9c4322b2","href":"https://Ryder.com","translations":{"create":[{"alt_text":"Ryder","languages_code":{"code":"en"}},{"alt_text":"Ryder","languages_code":{"code":"fr"}},{"alt_text":"Ryder","languages_code":{"code":"de"}},{"alt_text":"Ryder","languages_code":{"code":"es"}}],"update":[],"delete":[]},"sort":4,"section":1}	{"Label":"Ryder","status":"published","Logo_Image":"0874f072-3951-4a37-b07d-0efa9c4322b2","href":"https://Ryder.com","translations":{"create":[{"alt_text":"Ryder","languages_code":{"code":"en"}},{"alt_text":"Ryder","languages_code":{"code":"fr"}},{"alt_text":"Ryder","languages_code":{"code":"de"}},{"alt_text":"Ryder","languages_code":{"code":"es"}}],"update":[],"delete":[]},"sort":4,"section":1}	941	\N
942	1037	directus_files	370b1813-1783-4773-a4c8-e6a4ce6971fe	{"filename_download":"latest","storage":"gcs","type":"image/svg+xml","title":"Latest"}	{"filename_download":"latest","storage":"gcs","type":"image/svg+xml","title":"Latest"}	\N	\N
943	1038	directus_files	22a9f2ef-3eb5-46a2-bd0c-494fce784e75	{"filename_download":"Deutsche_Post_bw.svg","storage":"gcs","type":"image/svg+xml","title":"Deutsche Post Bw.svg"}	{"filename_download":"Deutsche_Post_bw.svg","storage":"gcs","type":"image/svg+xml","title":"Deutsche Post Bw.svg"}	\N	\N
944	1039	directus_files	1c7d9621-79f2-4833-8266-87c9c3282c55	{"filename_download":"XPO_Logistics_logo.svg","storage":"gcs","type":"image/svg+xml","title":"Xpo Logistics Logo.svg"}	{"filename_download":"XPO_Logistics_logo.svg","storage":"gcs","type":"image/svg+xml","title":"Xpo Logistics Logo.svg"}	\N	\N
945	1040	Trust_Logo_Images_translations	21	{"alt_text":"XPO Logistics","languages_code":{"code":"en"},"Trust_Logo_Images_id":7}	{"alt_text":"XPO Logistics","languages_code":{"code":"en"},"Trust_Logo_Images_id":7}	949	\N
946	1041	Trust_Logo_Images_translations	22	{"alt_text":"XPO Logistics","languages_code":{"code":"fr"},"Trust_Logo_Images_id":7}	{"alt_text":"XPO Logistics","languages_code":{"code":"fr"},"Trust_Logo_Images_id":7}	949	\N
947	1042	Trust_Logo_Images_translations	23	{"alt_text":"XPO Logistics","languages_code":{"code":"de"},"Trust_Logo_Images_id":7}	{"alt_text":"XPO Logistics","languages_code":{"code":"de"},"Trust_Logo_Images_id":7}	949	\N
948	1043	Trust_Logo_Images_translations	24	{"alt_text":"XPO Logistics","languages_code":{"code":"es"},"Trust_Logo_Images_id":7}	{"alt_text":"XPO Logistics","languages_code":{"code":"es"},"Trust_Logo_Images_id":7}	949	\N
950	1045	Trust_Logo_Images_translations	13	{"id":13,"Trust_Logo_Images_id":5,"languages_code":"en","alt_text":"FedEx"}	{"languages_code":"en","alt_text":"FedEx"}	954	\N
957	1052	Trust_Logo_Images_translations	11	{"id":11,"Trust_Logo_Images_id":4,"languages_code":"de","alt_text":"Deutsche Post"}	{"languages_code":"de","alt_text":"Deutsche Post"}	959	\N
958	1053	Trust_Logo_Images_translations	12	{"id":12,"Trust_Logo_Images_id":4,"languages_code":"es","alt_text":"Deutsche Post"}	{"languages_code":"es","alt_text":"Deutsche Post"}	959	\N
960	1055	Trust_Logos	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T14:03:12.961Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:44:42.512Z","is_monochrome":true,"Monochrome_Color":"#BBBBBB","Enable_Links":true,"scroll_logos":true,"Logos":[3,4,5,6,7,2],"translations":[1,2,3,4]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:44:42.512Z"}	\N	\N
949	1044	Trust_Logo_Images	7	{"Logo_Image":"1c7d9621-79f2-4833-8266-87c9c3282c55","Label":"XPO Logistics","translations":{"create":[{"alt_text":"XPO Logistics","languages_code":{"code":"en"}},{"alt_text":"XPO Logistics","languages_code":{"code":"fr"}},{"alt_text":"XPO Logistics","languages_code":{"code":"de"}},{"alt_text":"XPO Logistics","languages_code":{"code":"es"}}],"update":[],"delete":[]},"status":"published","href":"https://XPOLogistics.com","sort":5,"section":1}	{"Logo_Image":"1c7d9621-79f2-4833-8266-87c9c3282c55","Label":"XPO Logistics","translations":{"create":[{"alt_text":"XPO Logistics","languages_code":{"code":"en"}},{"alt_text":"XPO Logistics","languages_code":{"code":"fr"}},{"alt_text":"XPO Logistics","languages_code":{"code":"de"}},{"alt_text":"XPO Logistics","languages_code":{"code":"es"}}],"update":[],"delete":[]},"status":"published","href":"https://XPOLogistics.com","sort":5,"section":1}	960	\N
954	1049	Trust_Logo_Images	5	{"id":5,"status":"published","sort":3,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T15:37:13.661Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:44:42.553Z","section":1,"Logo_Image":"370b1813-1783-4773-a4c8-e6a4ce6971fe","href":"https://fedex.com","Label":"FedEx","translations":[13,14,15,16]}	{"Logo_Image":"370b1813-1783-4773-a4c8-e6a4ce6971fe","href":"https://fedex.com","Label":"FedEx","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:44:42.553Z"}	960	\N
959	1054	Trust_Logo_Images	4	{"id":4,"status":"published","sort":2,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T15:37:13.629Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:44:42.595Z","section":1,"Logo_Image":"22a9f2ef-3eb5-46a2-bd0c-494fce784e75","href":"https://www.ups.com","Label":"Deutsche Post","translations":[9,10,11,12]}	{"Logo_Image":"22a9f2ef-3eb5-46a2-bd0c-494fce784e75","Label":"Deutsche Post","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:44:42.595Z"}	960	\N
961	1056	directus_files	534613e9-de55-49fe-bba9-fe525dfddca0	{"filename_download":"CN_Railway_logo.svg","storage":"gcs","type":"image/svg+xml","title":"Cn Railway Logo.svg"}	{"filename_download":"CN_Railway_logo.svg","storage":"gcs","type":"image/svg+xml","title":"Cn Railway Logo.svg"}	\N	\N
962	1057	directus_files	dbf78878-f604-44e1-9186-7088c79289a3	{"title":"Idb4fz6g Dv 1757346520362","filename_download":"idb4fz6gDv_1757346520362.svg","type":"image/svg+xml","storage":"gcs"}	{"title":"Idb4fz6g Dv 1757346520362","filename_download":"idb4fz6gDv_1757346520362.svg","type":"image/svg+xml","storage":"gcs"}	\N	\N
963	1058	directus_files	0ebdfdd1-c2c8-41cd-8ae2-d62cb1b892f4	{"filename_download":"TNT_Logo.svg","storage":"gcs","type":"image/svg+xml","title":"Tnt Logo.svg"}	{"filename_download":"TNT_Logo.svg","storage":"gcs","type":"image/svg+xml","title":"Tnt Logo.svg"}	\N	\N
964	1059	Trust_Logo_Images_translations	25	{"alt_text":"CN Rail","languages_code":{"code":"en"},"Trust_Logo_Images_id":8}	{"alt_text":"CN Rail","languages_code":{"code":"en"},"Trust_Logo_Images_id":8}	968	\N
965	1060	Trust_Logo_Images_translations	26	{"alt_text":"CN Rail","languages_code":{"code":"fr"},"Trust_Logo_Images_id":8}	{"alt_text":"CN Rail","languages_code":{"code":"fr"},"Trust_Logo_Images_id":8}	968	\N
966	1061	Trust_Logo_Images_translations	27	{"alt_text":"CN Rail","languages_code":{"code":"de"},"Trust_Logo_Images_id":8}	{"alt_text":"CN Rail","languages_code":{"code":"de"},"Trust_Logo_Images_id":8}	968	\N
967	1062	Trust_Logo_Images_translations	28	{"alt_text":"CN Rail","languages_code":{"code":"es"},"Trust_Logo_Images_id":8}	{"alt_text":"CN Rail","languages_code":{"code":"es"},"Trust_Logo_Images_id":8}	968	\N
969	1064	Trust_Logo_Images_translations	29	{"alt_text":"Ceva Logistics","languages_code":{"code":"en"},"Trust_Logo_Images_id":9}	{"alt_text":"Ceva Logistics","languages_code":{"code":"en"},"Trust_Logo_Images_id":9}	973	\N
970	1065	Trust_Logo_Images_translations	30	{"alt_text":"Ceva Logistics","languages_code":{"code":"fr"},"Trust_Logo_Images_id":9}	{"alt_text":"Ceva Logistics","languages_code":{"code":"fr"},"Trust_Logo_Images_id":9}	973	\N
979	1074	Trust_Logos	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T14:03:12.961Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:51:49.024Z","is_monochrome":true,"Monochrome_Color":"#BBBBBB","Enable_Links":true,"scroll_logos":true,"Logos":[3,4,5,6,7,8,9,10,2],"translations":[1,2,3,4]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T15:51:49.024Z"}	\N	\N
968	1063	Trust_Logo_Images	8	{"Logo_Image":"534613e9-de55-49fe-bba9-fe525dfddca0","Label":"CN Rail","translations":{"create":[{"alt_text":"CN Rail","languages_code":{"code":"en"}},{"alt_text":"CN Rail","languages_code":{"code":"fr"}},{"alt_text":"CN Rail","languages_code":{"code":"de"}},{"alt_text":"CN Rail","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"https://cn.ca","status":"published","sort":6,"section":1}	{"Logo_Image":"534613e9-de55-49fe-bba9-fe525dfddca0","Label":"CN Rail","translations":{"create":[{"alt_text":"CN Rail","languages_code":{"code":"en"}},{"alt_text":"CN Rail","languages_code":{"code":"fr"}},{"alt_text":"CN Rail","languages_code":{"code":"de"}},{"alt_text":"CN Rail","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"https://cn.ca","status":"published","sort":6,"section":1}	979	\N
973	1068	Trust_Logo_Images	9	{"Logo_Image":"dbf78878-f604-44e1-9186-7088c79289a3","Label":"Ceva Logistics","status":"published","translations":{"create":[{"alt_text":"Ceva Logistics","languages_code":{"code":"en"}},{"alt_text":"Ceva Logistics","languages_code":{"code":"fr"}},{"alt_text":"Ceva Logistics","languages_code":{"code":"de"}},{"alt_text":"Ceva Logistics","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"https://www.cevalogistics.com","sort":7,"section":1}	{"Logo_Image":"dbf78878-f604-44e1-9186-7088c79289a3","Label":"Ceva Logistics","status":"published","translations":{"create":[{"alt_text":"Ceva Logistics","languages_code":{"code":"en"}},{"alt_text":"Ceva Logistics","languages_code":{"code":"fr"}},{"alt_text":"Ceva Logistics","languages_code":{"code":"de"}},{"alt_text":"Ceva Logistics","languages_code":{"code":"es"}}],"update":[],"delete":[]},"href":"https://www.cevalogistics.com","sort":7,"section":1}	979	\N
978	1073	Trust_Logo_Images	10	{"Label":"TNT","status":"published","Logo_Image":"0ebdfdd1-c2c8-41cd-8ae2-d62cb1b892f4","href":"https://www.tnt.com","translations":{"create":[{"alt_text":"TNT Express","languages_code":{"code":"en"}},{"alt_text":"TNT Express","languages_code":{"code":"fr"}},{"alt_text":"TNT Express","languages_code":{"code":"de"}},{"alt_text":"TNT Express","languages_code":{"code":"es"}}],"update":[],"delete":[]},"sort":8,"section":1}	{"Label":"TNT","status":"published","Logo_Image":"0ebdfdd1-c2c8-41cd-8ae2-d62cb1b892f4","href":"https://www.tnt.com","translations":{"create":[{"alt_text":"TNT Express","languages_code":{"code":"en"}},{"alt_text":"TNT Express","languages_code":{"code":"fr"}},{"alt_text":"TNT Express","languages_code":{"code":"de"}},{"alt_text":"TNT Express","languages_code":{"code":"es"}}],"update":[],"delete":[]},"sort":8,"section":1}	979	\N
980	1075	directus_fields	171	{"sort":13,"interface":"slider","special":null,"options":{"minValue":10,"maxValue":120,"stepInterval":1},"collection":"Trust_Logos","field":"scroll_speed"}	{"sort":13,"interface":"slider","special":null,"options":{"minValue":10,"maxValue":120,"stepInterval":1},"collection":"Trust_Logos","field":"scroll_speed"}	\N	\N
981	1076	directus_fields	125	{"id":125,"collection":"Trust_Logos","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"id","sort":1,"group":null}	\N	\N
982	1077	directus_fields	126	{"id":126,"collection":"Trust_Logos","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"status","sort":2,"group":null}	\N	\N
983	1078	directus_fields	127	{"id":127,"collection":"Trust_Logos","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"user_created","sort":3,"group":null}	\N	\N
984	1079	directus_fields	128	{"id":128,"collection":"Trust_Logos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"date_created","sort":4,"group":null}	\N	\N
985	1080	directus_fields	129	{"id":129,"collection":"Trust_Logos","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"user_updated","sort":5,"group":null}	\N	\N
986	1081	directus_fields	130	{"id":130,"collection":"Trust_Logos","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"date_updated","sort":6,"group":null}	\N	\N
987	1082	directus_fields	131	{"id":131,"collection":"Trust_Logos","field":"is_monochrome","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"is_monochrome","sort":7,"group":null}	\N	\N
988	1083	directus_fields	132	{"id":132,"collection":"Trust_Logos","field":"Monochrome_Color","special":null,"interface":"select-color","options":{"opacity":true,"presets":[{"name":"Light Gray","color":"#BBBBBB"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Monochrome_Color","sort":8,"group":null}	\N	\N
989	1084	directus_fields	133	{"id":133,"collection":"Trust_Logos","field":"Enable_Links","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Enable_Links","sort":9,"group":null}	\N	\N
990	1085	directus_fields	168	{"id":168,"collection":"Trust_Logos","field":"scroll_logos","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"scroll_logos","sort":10,"group":null}	\N	\N
991	1086	directus_fields	171	{"id":171,"collection":"Trust_Logos","field":"scroll_speed","special":null,"interface":"slider","options":{"minValue":10,"maxValue":120,"stepInterval":1},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"scroll_speed","sort":11,"group":null}	\N	\N
992	1087	directus_fields	134	{"id":134,"collection":"Trust_Logos","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"translations","sort":12,"group":null}	\N	\N
993	1088	directus_fields	147	{"id":147,"collection":"Trust_Logos","field":"Logos","special":["o2m"],"interface":"list-o2m","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{status}} {{Label}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Logos","sort":13,"group":null}	\N	\N
994	1089	directus_fields	171	{"id":171,"collection":"Trust_Logos","field":"scroll_speed","special":null,"interface":"slider","options":{"minValue":10,"maxValue":120,"stepInterval":1},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"scroll_speed","width":"half"}	\N	\N
995	1090	directus_fields	125	{"id":125,"collection":"Trust_Logos","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"id","sort":1,"group":null}	\N	\N
996	1091	directus_fields	126	{"id":126,"collection":"Trust_Logos","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"status","sort":2,"group":null}	\N	\N
997	1092	directus_fields	127	{"id":127,"collection":"Trust_Logos","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"user_created","sort":3,"group":null}	\N	\N
998	1093	directus_fields	128	{"id":128,"collection":"Trust_Logos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"date_created","sort":4,"group":null}	\N	\N
999	1094	directus_fields	129	{"id":129,"collection":"Trust_Logos","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"user_updated","sort":5,"group":null}	\N	\N
1000	1095	directus_fields	130	{"id":130,"collection":"Trust_Logos","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"date_updated","sort":6,"group":null}	\N	\N
1001	1096	directus_fields	131	{"id":131,"collection":"Trust_Logos","field":"is_monochrome","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"is_monochrome","sort":7,"group":null}	\N	\N
1002	1097	directus_fields	132	{"id":132,"collection":"Trust_Logos","field":"Monochrome_Color","special":null,"interface":"select-color","options":{"opacity":true,"presets":[{"name":"Light Gray","color":"#BBBBBB"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Monochrome_Color","sort":8,"group":null}	\N	\N
1003	1098	directus_fields	168	{"id":168,"collection":"Trust_Logos","field":"scroll_logos","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"scroll_logos","sort":9,"group":null}	\N	\N
1004	1099	directus_fields	171	{"id":171,"collection":"Trust_Logos","field":"scroll_speed","special":null,"interface":"slider","options":{"minValue":10,"maxValue":120,"stepInterval":1},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"scroll_speed","sort":10,"group":null}	\N	\N
1005	1100	directus_fields	133	{"id":133,"collection":"Trust_Logos","field":"Enable_Links","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Enable_Links","sort":11,"group":null}	\N	\N
1006	1101	directus_fields	134	{"id":134,"collection":"Trust_Logos","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en","defaultOpenSplitView":true},"display":"translations","display_options":{"languageField":"name","defaultLanguage":"en"},"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"translations","sort":12,"group":null}	\N	\N
1007	1102	directus_fields	147	{"id":147,"collection":"Trust_Logos","field":"Logos","special":["o2m"],"interface":"list-o2m","options":{"fields":["Logo_Image"],"sort":"sort","enableLink":true,"template":"{{status}} {{Label}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"Trust_Logos","field":"Logos","sort":13,"group":null}	\N	\N
1008	1103	directus_fields	172	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"map_animation"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"map_animation"}	\N	\N
1009	1104	directus_fields	173	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"map_animation"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"map_animation"}	\N	\N
1010	1105	directus_fields	174	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"map_animation"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"map_animation"}	\N	\N
1011	1106	directus_fields	175	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"map_animation"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"map_animation"}	\N	\N
1012	1107	directus_fields	176	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"map_animation"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"map_animation"}	\N	\N
1013	1108	directus_fields	177	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"map_animation"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"map_animation"}	\N	\N
1014	1109	directus_fields	178	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"map_animation"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"map_animation"}	\N	\N
1015	1110	directus_collections	map_animation	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"map_animation"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"map_animation"}	\N	\N
1031	1127	map_animation	1	{"start":1}	{"start":1}	\N	\N
1032	1128	directus_fields	185	{"id":185,"collection":"map_animation","field":"end_city","special":["m2m"],"interface":"list-m2m","options":{"enableCreate":false,"template":"{{Map_Cities_id.Name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"end_city","options":{"enableCreate":false,"template":"{{Map_Cities_id.Name}}"}}	\N	\N
1035	1131	map_animation	1	{"id":1,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T16:06:39.037Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:07:49.835Z","start":1,"end_city":[1,2]}	{"status":"published","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:07:49.835Z"}	\N	\N
1033	1129	map_animation_Map_Cities	1	{"map_animation_id":"1","Map_Cities_id":{"id":52}}	{"map_animation_id":"1","Map_Cities_id":{"id":52}}	1035	\N
1034	1130	map_animation_Map_Cities	2	{"map_animation_id":"1","Map_Cities_id":{"id":4}}	{"map_animation_id":"1","Map_Cities_id":{"id":4}}	1035	\N
1036	1132	directus_fields	189	{"sort":11,"interface":"input","special":null,"collection":"map_animation","field":"Name"}	{"sort":11,"interface":"input","special":null,"collection":"map_animation","field":"Name"}	\N	\N
1037	1133	directus_fields	172	{"id":172,"collection":"map_animation","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"id","sort":1,"group":null}	\N	\N
1038	1134	directus_fields	173	{"id":173,"collection":"map_animation","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"status","sort":2,"group":null}	\N	\N
1039	1135	directus_fields	189	{"id":189,"collection":"map_animation","field":"Name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"Name","sort":3,"group":null}	\N	\N
1040	1136	directus_fields	174	{"id":174,"collection":"map_animation","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"sort","sort":4,"group":null}	\N	\N
1041	1137	directus_fields	175	{"id":175,"collection":"map_animation","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"user_created","sort":5,"group":null}	\N	\N
1042	1138	directus_fields	176	{"id":176,"collection":"map_animation","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"date_created","sort":6,"group":null}	\N	\N
1043	1139	directus_fields	177	{"id":177,"collection":"map_animation","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"user_updated","sort":7,"group":null}	\N	\N
1044	1140	directus_fields	178	{"id":178,"collection":"map_animation","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"date_updated","sort":8,"group":null}	\N	\N
1045	1141	directus_fields	184	{"id":184,"collection":"map_animation","field":"start","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{Name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"start","sort":9,"group":null}	\N	\N
1046	1142	directus_fields	185	{"id":185,"collection":"map_animation","field":"end_city","special":["m2m"],"interface":"list-m2m","options":{"enableCreate":false,"template":"{{Map_Cities_id.Name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"end_city","sort":10,"group":null}	\N	\N
1047	1143	map_animation	1	{"id":1,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T16:06:39.037Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:08:37.599Z","start":1,"Name":"Detroit to Frankfurt, Cotonou","end_city":[1,2]}	{"Name":"Detroit to Frankfurt, Cotonou","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:08:37.599Z"}	\N	\N
1048	1144	map_animation_Map_Cities	3	{"map_animation_id":2,"Map_Cities_id":{"id":5}}	{"map_animation_id":2,"Map_Cities_id":{"id":5}}	1049	\N
1049	1145	map_animation	2	{"status":"published","Name":"Frankfurt to Hong Kong","start":52,"end_city":{"create":[{"map_animation_id":"+","Map_Cities_id":{"id":5}}],"update":[],"delete":[]}}	{"status":"published","Name":"Frankfurt to Hong Kong","start":52,"end_city":{"create":[{"map_animation_id":"+","Map_Cities_id":{"id":5}}],"update":[],"delete":[]}}	\N	\N
1050	1146	directus_fields	185	{"id":185,"collection":"map_animation","field":"end_city","special":["m2m"],"interface":"list-m2m","options":{"enableCreate":false,"template":"{{Map_Cities_id.Name}}","layout":"table","fields":["Map_Cities_id.Name"]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"end_city","options":{"enableCreate":false,"template":"{{Map_Cities_id.Name}}","layout":"table","fields":["Map_Cities_id.Name"]},"display":null}	\N	\N
1051	1147	directus_fields	185	{"id":185,"collection":"map_animation","field":"end_city","special":["m2m"],"interface":"list-m2m","options":{"enableCreate":false,"template":"{{Map_Cities_id.Name}}","layout":"table","fields":["Map_Cities_id.Name"]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"end_city","display":null}	\N	\N
1054	1150	map_animation	3	{"status":"published","Name":"Hong Kong to Tokyo, Sydney","start":5,"end_city":{"create":[{"map_animation_id":"+","Map_Cities_id":{"id":3}},{"map_animation_id":"+","Map_Cities_id":{"id":7}}],"update":[],"delete":[]}}	{"status":"published","Name":"Hong Kong to Tokyo, Sydney","start":5,"end_city":{"create":[{"map_animation_id":"+","Map_Cities_id":{"id":3}},{"map_animation_id":"+","Map_Cities_id":{"id":7}}],"update":[],"delete":[]}}	\N	\N
1052	1148	map_animation_Map_Cities	4	{"map_animation_id":3,"Map_Cities_id":{"id":3}}	{"map_animation_id":3,"Map_Cities_id":{"id":3}}	1054	\N
1053	1149	map_animation_Map_Cities	5	{"map_animation_id":3,"Map_Cities_id":{"id":7}}	{"map_animation_id":3,"Map_Cities_id":{"id":7}}	1054	\N
1055	1152	directus_fields	190	{"sort":8,"special":["o2m"],"interface":"list-o2m-tree-view","options":{"displayTemplate":"{{Name}}"},"collection":"hero","field":"map_animation"}	{"sort":8,"special":["o2m"],"interface":"list-o2m-tree-view","options":{"displayTemplate":"{{Name}}"},"collection":"hero","field":"map_animation"}	\N	\N
1056	1153	directus_fields	190	{"id":190,"collection":"hero","field":"map_animation","special":["o2m"],"interface":"presentation-links","options":{"displayTemplate":"{{Name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero","field":"map_animation","interface":"presentation-links"}	\N	\N
1057	1154	directus_collections	hero	{"collection":"hero","icon":"exclamation","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"singleton":false}	\N	\N
1058	1156	directus_fields	191	{"sort":8,"interface":"list-o2m","special":["o2m"],"options":{"template":"{{Name}}","sort":"sort"},"collection":"hero","field":"animations"}	{"sort":8,"interface":"list-o2m","special":["o2m"],"options":{"template":"{{Name}}","sort":"sort"},"collection":"hero","field":"animations"}	\N	\N
1059	1158	directus_fields	192	{"sort":11,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"enableSelect":false,"enableCreate":false},"collection":"map_animation","field":"hero"}	{"sort":11,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"enableSelect":false,"enableCreate":false},"collection":"map_animation","field":"hero"}	\N	\N
1060	1159	directus_fields	192	{"id":192,"collection":"map_animation","field":"hero","special":["m2o"],"interface":"select-dropdown-m2o","options":{"enableSelect":false,"enableCreate":false},"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"map_animation","field":"hero","readonly":false,"hidden":true}	\N	\N
1061	1160	directus_fields	193	{"sort":8,"special":["o2m"],"collection":"hero","field":"animations"}	{"sort":8,"special":["o2m"],"collection":"hero","field":"animations"}	\N	\N
1062	1161	directus_collections	map_animation	{"collection":"map_animation","icon":null,"note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"hidden":true}	\N	\N
1063	1162	directus_collections	hero	{"collection":"hero","icon":"exclamation","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Landing_Page","collapse":"open","preview_url":null,"versioning":false}	{"singleton":true}	\N	\N
1064	1163	directus_fields	193	{"id":193,"collection":"hero","field":"animations","special":["o2m"],"interface":"list-o2m","options":{"template":"{{Name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"hero","field":"animations","interface":"list-o2m","options":{"template":"{{Name}}"}}	\N	\N
1068	1167	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:20:35.653Z","translations":[1,2,3,4],"animations":[1,2,3]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:20:35.653Z"}	\N	\N
1065	1164	map_animation	1	{"id":1,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T16:06:39.037Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:20:35.657Z","start":1,"Name":"Detroit to Frankfurt, Cotonou","hero":1,"end_city":[1,2]}	{"hero":1,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:20:35.657Z"}	1068	\N
1066	1165	map_animation	2	{"id":2,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T16:09:15.268Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:20:35.667Z","start":52,"Name":"Frankfurt to Hong Kong","hero":1,"end_city":[3]}	{"hero":1,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:20:35.667Z"}	1068	\N
1067	1166	map_animation	3	{"id":3,"status":"published","sort":null,"user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T16:11:43.574Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:20:35.676Z","start":5,"Name":"Hong Kong to Tokyo, Sydney","hero":1,"end_city":[4,5]}	{"hero":1,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:20:35.676Z"}	1068	\N
1069	1173	directus_permissions	36	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"map_animation","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"map_animation","action":"read"}	\N	\N
1070	1174	directus_permissions	37	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"map_animation_Map_Cities","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"map_animation_Map_Cities","action":"read"}	\N	\N
1075	1180	hero	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T03:04:38.833Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:29:53.252Z","translations":[1,2,3,4],"animations":[1,2,3]}	{"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:29:53.252Z"}	\N	\N
1071	1176	hero_translations	1	{"id":1,"hero_id":1,"languages_code":"en","supporting_text":"Where growth-stage companies hire elite operators — and top talent lands their next big role.","heading":"The Supply Chain Talent Marketplace Built for","CTA":"Hire Top Talent Now","CTA2":"Start Here","heading_highlighted":"Speed & Precision","supporting_text2":"Are you a supply chain operator looking for your next role?"}	{"languages_code":"en","CTA":"Hire Top Talent Now"}	1075	\N
1072	1177	hero_translations	3	{"id":3,"hero_id":1,"languages_code":"fr","supporting_text":"Là où les entreprises en phase de croissance recrutent des opérateurs d’élite — et où les meilleurs talents décrochent leur prochain grand rôle.","heading":"Le Marché de Talents de la Chaîne d’Approvisionnement Conçu pour la ","CTA":"Recrutez les Meilleurs Talents Maintenant","CTA2":"Commencez Ici","heading_highlighted":"Rapidité et la Précision","supporting_text2":"Êtes-vous un opérateur de la chaîne d’approvisionnement à la recherche de votre prochain rôle ?"}	{"languages_code":"fr","CTA":"Recrutez les Meilleurs Talents Maintenant"}	1075	\N
1073	1178	hero_translations	4	{"id":4,"hero_id":1,"languages_code":"de","supporting_text":"Wo Wachstumsunternehmen Elite-Operatoren einstellen — und Top-Talente ihre nächste große Rolle finden.","heading":"Der Talentmarktplatz für Lieferketten — Entwickelt für ","CTA":"Top-Talente Jetzt Einstellen","CTA2":"Jetzt Los","heading_highlighted":"Schnelligkeit und Präzision","supporting_text2":"Sind Sie ein Supply-Chain-Operator auf der Suche nach Ihrer nächsten Rolle?"}	{"languages_code":"de","CTA":"Top-Talente Jetzt Einstellen"}	1075	\N
1074	1179	hero_translations	2	{"id":2,"hero_id":1,"languages_code":"es","supporting_text":"Donde las empresas en crecimiento contratan a operadores de élite — y el mejor talento consigue su próximo gran rol.","heading":"El Mercado de Talento en Cadena de Suministro Creado para la ","CTA":"Contrata al Mejor Talento Ahora","CTA2":"Comienza Aquí","heading_highlighted":"Velocidad y la Precisión","supporting_text2":"¿Eres un operador de cadena de suministro que busca su próximo rol?"}	{"languages_code":"es","CTA":"Contrata al Mejor Talento Ahora"}	1075	\N
1076	1181	Trust_Logos	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T14:03:12.961Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:37:51.135Z","is_monochrome":true,"Monochrome_Color":"#BBBBBB","Enable_Links":true,"scroll_logos":true,"scroll_speed":18,"translations":[1,2,3,4],"Logos":[3,4,5,6,7,8,9,10,2]}	{"scroll_speed":18,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:37:51.135Z"}	\N	\N
1077	1182	Trust_Logos	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T14:03:12.961Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:52:14.395Z","is_monochrome":true,"Monochrome_Color":"#BBBBBB","Enable_Links":true,"scroll_logos":true,"scroll_speed":120,"translations":[1,2,3,4],"Logos":[3,4,5,6,7,8,9,10,2]}	{"scroll_speed":120,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:52:14.395Z"}	\N	\N
1078	1183	Trust_Logos	1	{"id":1,"status":"published","user_created":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_created":"2025-09-08T14:03:12.961Z","user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:58:59.606Z","is_monochrome":true,"Monochrome_Color":"#BBBBBB","Enable_Links":true,"scroll_logos":true,"scroll_speed":21,"translations":[1,2,3,4],"Logos":[3,4,5,6,7,8,9,10,2]}	{"scroll_speed":21,"user_updated":"c5e8bb40-50e6-4421-a26e-e3f1f5736aa4","date_updated":"2025-09-08T16:58:59.606Z"}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
452c5584-65f7-4232-9b37-35cf01451390	Administrator	verified	$t:admin_description	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
wYIGA5V32r6eNjFrC_Imj1BD51Wm0FH71c35FbHbWQDXGQW03FhDQEx5yR0XKzhF	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 13:19:54.92-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	\N	http://10.0.20.3:8055	vKauufpZ9PwL84YcyjOYjYHvFlURAF19Ooatz4lirzRh71JrBdzSNFJK3nSezGM0
vKauufpZ9PwL84YcyjOYjYHvFlURAF19Ooatz4lirzRh71JrBdzSNFJK3nSezGM0	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-09 13:19:44.92-04	10.0.20.39	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0	\N	http://10.0.20.3:8055	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls, accepted_terms, project_id) FROM stdin;
1	Directus	\N	#6644FF	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	[{"type":"module","id":"content","enabled":true},{"type":"module","id":"visual","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"Documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true}]	\N	en-US	\N	\N	auto	\N	\N	\N	\N	\N	\N	\N	f	t	\N	\N	\N	t	01991ce6-7e37-7754-b267-d68f07c17098
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides, text_direction) FROM stdin;
c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	Admin	User	brad.a.johnson@gmail.com	$argon2id$v=19$m=65536,t=3,p=4$oy8LgU80i2jLjkOYPrK3GQ$fuVUiAmnncUCgeL4hwptum5zoCDtYeuki4l7HSbfTnw	\N	\N	\N	\N	\N	\N	\N	active	452c5584-65f7-4232-9b37-35cf01451390	\N	2025-09-08 13:19:44.93-04	/settings/project	default	\N	\N	t	\N	\N	\N	\N	\N	auto
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
\.


--
-- Data for Name: hero; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hero (id, status, user_created, date_created, user_updated, date_updated) FROM stdin;
1	published	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:04:38.833-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:29:53.252-04
\.


--
-- Data for Name: hero_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hero_translations (id, hero_id, languages_code, supporting_text, heading, "CTA", "CTA2", heading_highlighted, supporting_text2) FROM stdin;
1	1	en	Where growth-stage companies hire elite operators — and top talent lands their next big role.	The Supply Chain Talent Marketplace Built for	Hire Top Talent Now	Start Here	Speed & Precision	Are you a supply chain operator looking for your next role?
3	1	fr	Là où les entreprises en phase de croissance recrutent des opérateurs d’élite — et où les meilleurs talents décrochent leur prochain grand rôle.	Le Marché de Talents de la Chaîne d’Approvisionnement Conçu pour la 	Recrutez les Meilleurs Talents Maintenant	Commencez Ici	Rapidité et la Précision	Êtes-vous un opérateur de la chaîne d’approvisionnement à la recherche de votre prochain rôle ?
4	1	de	Wo Wachstumsunternehmen Elite-Operatoren einstellen — und Top-Talente ihre nächste große Rolle finden.	Der Talentmarktplatz für Lieferketten — Entwickelt für 	Top-Talente Jetzt Einstellen	Jetzt Los	Schnelligkeit und Präzision	Sind Sie ein Supply-Chain-Operator auf der Suche nach Ihrer nächsten Rolle?
2	1	es	Donde las empresas en crecimiento contratan a operadores de élite — y el mejor talento consigue su próximo gran rol.	El Mercado de Talento en Cadena de Suministro Creado para la 	Contrata al Mejor Talento Ahora	Comienza Aquí	Velocidad y la Precisión	¿Eres un operador de cadena de suministro que busca su próximo rol?
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.languages (code, name, direction) FROM stdin;
en	English	ltr
de	German	ltr
es	Spanish	ltr
fr	French	ltr
\.


--
-- Data for Name: map_animation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.map_animation (id, status, sort, user_created, date_created, user_updated, date_updated, start, "Name", hero) FROM stdin;
1	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:06:39.037-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:20:35.657-04	1	Detroit to Frankfurt, Cotonou	1
2	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:09:15.268-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:20:35.667-04	52	Frankfurt to Hong Kong	1
3	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:11:43.574-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-08 12:20:35.676-04	5	Hong Kong to Tokyo, Sydney	1
\.


--
-- Data for Name: map_animation_Map_Cities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."map_animation_Map_Cities" (id, map_animation_id, "Map_Cities_id") FROM stdin;
1	1	52
2	1	4
3	2	5
4	3	3
5	3	7
\.


--
-- Data for Name: navigation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.navigation (id, status, sort, user_created, date_created, user_updated, date_updated, location, href, "isButton", icon, parent) FROM stdin;
1	published	1	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:27:22.786-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:30:30.131-04	header	#companies	f	\N	\N
2	published	2	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:28:22.192-04	\N	\N	header	#candidates	f	\N	\N
3	published	4	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:00.471-04	\N	\N	header	#why-us	f	\N	\N
6	published	3	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:29:48.035-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:49:00.227-04	header	/jobs	f	manage_search	2
5	published	7	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:30:24.505-04	\N	\N	header	#get-started	t	\N	\N
4	published	6	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:29:38.591-04	\N	\N	header	#ai	f	\N	\N
7	published	5	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:40:05.826-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 22:49:14.606-04	header	/resume-builder	f	edit_document	2
\.


--
-- Data for Name: navigation_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.navigation_translations (id, navigation_id, languages_code, label, description) FROM stdin;
1	1	en	For Companies	\N
2	1	fr	Pour les Entreprises	\N
3	1	de	Für Unternehmen	\N
4	1	es	Para Empresas	\N
5	2	en	For Candidates	\N
6	2	fr	Pour les Candidats	\N
7	2	de	Für Kandidaten	\N
8	2	es	Para Candidatos	\N
9	3	en	Why Us	\N
10	3	fr	Pourquoi Nous	\N
11	3	de	Warum Wir	\N
12	3	es	Por Qué Nosotros	\N
13	4	en	Upskill AI	\N
14	4	fr	Monter en Compétences IA	\N
15	4	de	KI-Weiterbildung	\N
16	4	es	Capacítate en IA	\N
17	5	en	Get Started	\N
18	5	fr	Commencer	\N
19	5	de	Los	\N
20	5	es	Comenzar	\N
21	6	en	Job Search	Browse open positions and apply online.
22	6	fr	Recherche d’Emploi	Parcourez les offres et postulez en ligne.
23	6	de	Jobsuche	Stellenangebote durchsuchen und online bewerben.
24	6	es	Búsqueda de Empleo	Explora las vacantes y postúlate en línea.
25	7	en	Resume Builder	Create a professional resume in minutes
26	7	fr	Créateur de CV	Créez un CV professionnel en quelques minutes.
27	7	de	Lebenslauf-Generator	Erstellen Sie in wenigen Minuten einen professionellen Lebenslauf.
28	7	es	Creador de Currículum	Crea un currículum profesional en minutos.
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages (id, status, sort, user_created, date_created, user_updated, date_updated, slug, hero_image) FROM stdin;
2e499703-c9d0-4471-ba16-9604a64b37f1	published	\N	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 14:06:48.102-04	c5e8bb40-50e6-4421-a26e-e3f1f5736aa4	2025-09-07 23:14:37.092-04	test	\N
\.


--
-- Data for Name: pages_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_translations (id, pages_id, languages_code, title, hero_title, hero_subtitle, body) FROM stdin;
1	2e499703-c9d0-4471-ba16-9604a64b37f1	en	test	\N	\N	\N
2	2e499703-c9d0-4471-ba16-9604a64b37f1	fr	testfr	\N	\N	\N
3	2e499703-c9d0-4471-ba16-9604a64b37f1	de	pruefung	\N	\N	\N
4	2e499703-c9d0-4471-ba16-9604a64b37f1	es	examen	\N	\N	\N
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: Map_Cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Map_Cities_id_seq"', 124, true);


--
-- Name: Trust_Logo_Images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Trust_Logo_Images_id_seq"', 10, true);


--
-- Name: Trust_Logo_Images_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Trust_Logo_Images_translations_id_seq"', 36, true);


--
-- Name: Trust_Logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Trust_Logos_id_seq"', 1, true);


--
-- Name: Trust_Logos_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Trust_Logos_translations_id_seq"', 4, true);


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.company_id_seq', 1, true);


--
-- Name: company_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.company_translations_id_seq', 1, false);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 1183, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 193, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 37, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 9, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 57, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 1078, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hero_id_seq', 1, true);


--
-- Name: hero_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hero_translations_id_seq', 4, true);


--
-- Name: map_animation_Map_Cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."map_animation_Map_Cities_id_seq"', 5, true);


--
-- Name: map_animation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.map_animation_id_seq', 3, true);


--
-- Name: navigation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.navigation_id_seq', 7, true);


--
-- Name: navigation_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.navigation_translations_id_seq', 28, true);


--
-- Name: pages_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_translations_id_seq', 4, true);


--
-- Name: Map_Cities Map_Cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Map_Cities"
    ADD CONSTRAINT "Map_Cities_pkey" PRIMARY KEY (id);


--
-- Name: Trust_Logo_Images Trust_Logo_Images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logo_Images"
    ADD CONSTRAINT "Trust_Logo_Images_pkey" PRIMARY KEY (id);


--
-- Name: Trust_Logo_Images_translations Trust_Logo_Images_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logo_Images_translations"
    ADD CONSTRAINT "Trust_Logo_Images_translations_pkey" PRIMARY KEY (id);


--
-- Name: Trust_Logos Trust_Logos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logos"
    ADD CONSTRAINT "Trust_Logos_pkey" PRIMARY KEY (id);


--
-- Name: Trust_Logos_translations Trust_Logos_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logos_translations"
    ADD CONSTRAINT "Trust_Logos_translations_pkey" PRIMARY KEY (id);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: company_translations company_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_translations
    ADD CONSTRAINT company_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: hero hero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero
    ADD CONSTRAINT hero_pkey PRIMARY KEY (id);


--
-- Name: hero_translations hero_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero_translations
    ADD CONSTRAINT hero_translations_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (code);


--
-- Name: map_animation_Map_Cities map_animation_Map_Cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."map_animation_Map_Cities"
    ADD CONSTRAINT "map_animation_Map_Cities_pkey" PRIMARY KEY (id);


--
-- Name: map_animation map_animation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.map_animation
    ADD CONSTRAINT map_animation_pkey PRIMARY KEY (id);


--
-- Name: navigation navigation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.navigation
    ADD CONSTRAINT navigation_pkey PRIMARY KEY (id);


--
-- Name: navigation_translations navigation_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.navigation_translations
    ADD CONSTRAINT navigation_translations_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages pages_slug_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_slug_unique UNIQUE (slug);


--
-- Name: pages_translations pages_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_translations
    ADD CONSTRAINT pages_translations_pkey PRIMARY KEY (id);


--
-- Name: pages_slug_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_slug_index ON public.pages USING btree (slug);


--
-- Name: company company_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_favicon_foreign FOREIGN KEY (favicon) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: company company_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_logo_foreign FOREIGN KEY (logo) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: company_translations company_translations_company_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_translations
    ADD CONSTRAINT company_translations_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.company(id) ON DELETE SET NULL;


--
-- Name: company_translations company_translations_languages_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_translations
    ADD CONSTRAINT company_translations_languages_code_foreign FOREIGN KEY (languages_code) REFERENCES public.languages(code) ON DELETE SET NULL;


--
-- Name: company company_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: company company_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_webhooks directus_webhooks_migrated_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;


--
-- Name: hero_translations hero_translations_hero_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero_translations
    ADD CONSTRAINT hero_translations_hero_id_foreign FOREIGN KEY (hero_id) REFERENCES public.hero(id) ON DELETE SET NULL;


--
-- Name: hero_translations hero_translations_languages_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero_translations
    ADD CONSTRAINT hero_translations_languages_code_foreign FOREIGN KEY (languages_code) REFERENCES public.languages(code) ON DELETE SET NULL;


--
-- Name: hero hero_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero
    ADD CONSTRAINT hero_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: hero hero_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero
    ADD CONSTRAINT hero_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: map_animation map_animation_hero_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.map_animation
    ADD CONSTRAINT map_animation_hero_foreign FOREIGN KEY (hero) REFERENCES public.hero(id) ON DELETE SET NULL;


--
-- Name: map_animation_Map_Cities map_animation_map_cities_map_animation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."map_animation_Map_Cities"
    ADD CONSTRAINT map_animation_map_cities_map_animation_id_foreign FOREIGN KEY (map_animation_id) REFERENCES public.map_animation(id) ON DELETE SET NULL;


--
-- Name: map_animation_Map_Cities map_animation_map_cities_map_cities_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."map_animation_Map_Cities"
    ADD CONSTRAINT map_animation_map_cities_map_cities_id_foreign FOREIGN KEY ("Map_Cities_id") REFERENCES public."Map_Cities"(id) ON DELETE SET NULL;


--
-- Name: map_animation map_animation_start_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.map_animation
    ADD CONSTRAINT map_animation_start_foreign FOREIGN KEY (start) REFERENCES public."Map_Cities"(id) ON DELETE SET NULL;


--
-- Name: map_animation map_animation_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.map_animation
    ADD CONSTRAINT map_animation_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: map_animation map_animation_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.map_animation
    ADD CONSTRAINT map_animation_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: Map_Cities map_cities_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Map_Cities"
    ADD CONSTRAINT map_cities_parent_foreign FOREIGN KEY (parent) REFERENCES public.hero(id) ON DELETE SET NULL;


--
-- Name: Map_Cities map_cities_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Map_Cities"
    ADD CONSTRAINT map_cities_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: Map_Cities map_cities_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Map_Cities"
    ADD CONSTRAINT map_cities_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: navigation navigation_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.navigation
    ADD CONSTRAINT navigation_parent_foreign FOREIGN KEY (parent) REFERENCES public.navigation(id);


--
-- Name: navigation_translations navigation_translations_languages_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.navigation_translations
    ADD CONSTRAINT navigation_translations_languages_code_foreign FOREIGN KEY (languages_code) REFERENCES public.languages(code) ON DELETE SET NULL;


--
-- Name: navigation_translations navigation_translations_navigation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.navigation_translations
    ADD CONSTRAINT navigation_translations_navigation_id_foreign FOREIGN KEY (navigation_id) REFERENCES public.navigation(id) ON DELETE SET NULL;


--
-- Name: navigation navigation_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.navigation
    ADD CONSTRAINT navigation_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: navigation navigation_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.navigation
    ADD CONSTRAINT navigation_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: pages pages_hero_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_hero_image_foreign FOREIGN KEY (hero_image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: pages_translations pages_translations_languages_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_translations
    ADD CONSTRAINT pages_translations_languages_code_foreign FOREIGN KEY (languages_code) REFERENCES public.languages(code) ON DELETE SET NULL;


--
-- Name: pages_translations pages_translations_pages_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_translations
    ADD CONSTRAINT pages_translations_pages_id_foreign FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE SET NULL;


--
-- Name: pages pages_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: pages pages_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: Trust_Logo_Images trust_logo_images_logo_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logo_Images"
    ADD CONSTRAINT trust_logo_images_logo_image_foreign FOREIGN KEY ("Logo_Image") REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: Trust_Logo_Images trust_logo_images_section_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logo_Images"
    ADD CONSTRAINT trust_logo_images_section_foreign FOREIGN KEY (section) REFERENCES public."Trust_Logos"(id) ON DELETE SET NULL;


--
-- Name: Trust_Logo_Images_translations trust_logo_images_translations_languages_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logo_Images_translations"
    ADD CONSTRAINT trust_logo_images_translations_languages_code_foreign FOREIGN KEY (languages_code) REFERENCES public.languages(code) ON DELETE SET NULL;


--
-- Name: Trust_Logo_Images_translations trust_logo_images_translations_trust_logo_images_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logo_Images_translations"
    ADD CONSTRAINT trust_logo_images_translations_trust_logo_images_id_foreign FOREIGN KEY ("Trust_Logo_Images_id") REFERENCES public."Trust_Logo_Images"(id) ON DELETE SET NULL;


--
-- Name: Trust_Logo_Images trust_logo_images_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logo_Images"
    ADD CONSTRAINT trust_logo_images_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: Trust_Logo_Images trust_logo_images_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logo_Images"
    ADD CONSTRAINT trust_logo_images_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: Trust_Logos_translations trust_logos_translations_languages_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logos_translations"
    ADD CONSTRAINT trust_logos_translations_languages_code_foreign FOREIGN KEY (languages_code) REFERENCES public.languages(code) ON DELETE SET NULL;


--
-- Name: Trust_Logos_translations trust_logos_translations_trust_logos_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logos_translations"
    ADD CONSTRAINT trust_logos_translations_trust_logos_id_foreign FOREIGN KEY ("Trust_Logos_id") REFERENCES public."Trust_Logos"(id) ON DELETE SET NULL;


--
-- Name: Trust_Logos trust_logos_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logos"
    ADD CONSTRAINT trust_logos_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: Trust_Logos trust_logos_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Trust_Logos"
    ADD CONSTRAINT trust_logos_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict SCGEh4ESKYsBuPlwCbhAe1ChQbNFbp8eMYEPW2Szf3okna8XKPbdpbiWSz1KbzV

