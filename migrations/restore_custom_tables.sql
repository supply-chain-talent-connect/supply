-- Restore custom tables with capitalized names for testing migration script

BEGIN;

-- Create Map_Cities table
CREATE TABLE IF NOT EXISTS public."Map_Cities" (
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

-- Create sequence for Map_Cities
CREATE SEQUENCE IF NOT EXISTS public."Map_Cities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public."Map_Cities_id_seq" OWNED BY public."Map_Cities".id;
ALTER TABLE ONLY public."Map_Cities" ALTER COLUMN id SET DEFAULT nextval('public."Map_Cities_id_seq"'::regclass);

-- Create Trust_Logos table
CREATE TABLE IF NOT EXISTS public."Trust_Logos" (
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
    scroll_speed integer DEFAULT 50
);

-- Create sequence for Trust_Logos
CREATE SEQUENCE IF NOT EXISTS public."Trust_Logos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public."Trust_Logos_id_seq" OWNED BY public."Trust_Logos".id;
ALTER TABLE ONLY public."Trust_Logos" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logos_id_seq"'::regclass);

-- Create Trust_Logo_Images table
CREATE TABLE IF NOT EXISTS public."Trust_Logo_Images" (
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

-- Create sequence for Trust_Logo_Images
CREATE SEQUENCE IF NOT EXISTS public."Trust_Logo_Images_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public."Trust_Logo_Images_id_seq" OWNED BY public."Trust_Logo_Images".id;
ALTER TABLE ONLY public."Trust_Logo_Images" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logo_Images_id_seq"'::regclass);

-- Create Trust_Logo_Images_translations table
CREATE TABLE IF NOT EXISTS public."Trust_Logo_Images_translations" (
    id integer NOT NULL,
    "Trust_Logo_Images_id" integer,
    languages_code character varying(255),
    alt_text character varying(255)
);

-- Create sequence for Trust_Logo_Images_translations
CREATE SEQUENCE IF NOT EXISTS public."Trust_Logo_Images_translations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public."Trust_Logo_Images_translations_id_seq" OWNED BY public."Trust_Logo_Images_translations".id;
ALTER TABLE ONLY public."Trust_Logo_Images_translations" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logo_Images_translations_id_seq"'::regclass);

-- Create Trust_Logos_translations table
CREATE TABLE IF NOT EXISTS public."Trust_Logos_translations" (
    id integer NOT NULL,
    "Trust_Logos_id" integer,
    languages_code character varying(255),
    "Intro_Text" character varying(255)
);

-- Create sequence for Trust_Logos_translations
CREATE SEQUENCE IF NOT EXISTS public."Trust_Logos_translations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public."Trust_Logos_translations_id_seq" OWNED BY public."Trust_Logos_translations".id;
ALTER TABLE ONLY public."Trust_Logos_translations" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logos_translations_id_seq"'::regclass);

-- Create map_animation table
CREATE TABLE IF NOT EXISTS public.map_animation (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    start integer
);

-- Create sequence for map_animation
CREATE SEQUENCE IF NOT EXISTS public.map_animation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.map_animation_id_seq OWNED BY public.map_animation.id;
ALTER TABLE ONLY public.map_animation ALTER COLUMN id SET DEFAULT nextval('public.map_animation_id_seq'::regclass);

-- Create map_animation_Map_Cities junction table
CREATE TABLE IF NOT EXISTS public."map_animation_Map_Cities" (
    id integer NOT NULL,
    map_animation_id integer,
    "Map_Cities_id" integer
);

-- Create sequence for map_animation_Map_Cities
CREATE SEQUENCE IF NOT EXISTS public."map_animation_Map_Cities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public."map_animation_Map_Cities_id_seq" OWNED BY public."map_animation_Map_Cities".id;
ALTER TABLE ONLY public."map_animation_Map_Cities" ALTER COLUMN id SET DEFAULT nextval('public."map_animation_Map_Cities_id_seq"'::regclass);

-- Add primary keys
ALTER TABLE ONLY public."Map_Cities" ADD CONSTRAINT "Map_Cities_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Trust_Logos" ADD CONSTRAINT "Trust_Logos_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Trust_Logo_Images" ADD CONSTRAINT "Trust_Logo_Images_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Trust_Logo_Images_translations" ADD CONSTRAINT "Trust_Logo_Images_translations_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Trust_Logos_translations" ADD CONSTRAINT "Trust_Logos_translations_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."map_animation_Map_Cities" ADD CONSTRAINT "map_animation_Map_Cities_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public.map_animation ADD CONSTRAINT map_animation_pkey PRIMARY KEY (id);

-- Add foreign key constraints (only if directus_users exists)
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'directus_users') THEN
        ALTER TABLE public."Map_Cities" ADD CONSTRAINT "Map_Cities_user_created_foreign" FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
        ALTER TABLE public."Map_Cities" ADD CONSTRAINT "Map_Cities_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
        ALTER TABLE public."Trust_Logos" ADD CONSTRAINT "Trust_Logos_user_created_foreign" FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
        ALTER TABLE public."Trust_Logos" ADD CONSTRAINT "Trust_Logos_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
        ALTER TABLE public."Trust_Logo_Images" ADD CONSTRAINT "Trust_Logo_Images_user_created_foreign" FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
        ALTER TABLE public."Trust_Logo_Images" ADD CONSTRAINT "Trust_Logo_Images_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
    END IF;
END $$;

-- Add other foreign key constraints
ALTER TABLE public."map_animation_Map_Cities" ADD CONSTRAINT "map_animation_map_cities_map_cities_id_foreign" FOREIGN KEY ("Map_Cities_id") REFERENCES public."Map_Cities"(id) ON DELETE SET NULL;
ALTER TABLE public.map_animation ADD CONSTRAINT "map_animation_start_foreign" FOREIGN KEY (start) REFERENCES public."Map_Cities"(id) ON DELETE SET NULL;
ALTER TABLE public."Trust_Logo_Images" ADD CONSTRAINT "trust_logo_images_section_foreign" FOREIGN KEY (section) REFERENCES public."Trust_Logos"(id) ON DELETE SET NULL;
ALTER TABLE public."Trust_Logo_Images_translations" ADD CONSTRAINT "trust_logo_images_translations_trust_logo_images_id_foreign" FOREIGN KEY ("Trust_Logo_Images_id") REFERENCES public."Trust_Logo_Images"(id) ON DELETE SET NULL;
ALTER TABLE public."Trust_Logos_translations" ADD CONSTRAINT "trust_logos_translations_trust_logos_id_foreign" FOREIGN KEY ("Trust_Logos_id") REFERENCES public."Trust_Logos"(id) ON DELETE SET NULL;

-- Add file foreign key constraint (only if directus_files exists)
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'directus_files') THEN
        ALTER TABLE public."Trust_Logo_Images" ADD CONSTRAINT "Trust_Logo_Images_Logo_Image_foreign" FOREIGN KEY ("Logo_Image") REFERENCES public.directus_files(id) ON DELETE SET NULL;
    END IF;
END $$;

-- Insert some test data into Directus collections metadata
INSERT INTO public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) 
VALUES 
('Map_Cities', NULL, NULL, NULL, false, false, NULL, 'status', true, 'archived', 'draft', 'sort', 'all', NULL, NULL, NULL, NULL, 'open', NULL, false),
('Trust_Logos', 'typo3', NULL, NULL, false, true, NULL, 'status', true, 'archived', 'draft', NULL, 'all', NULL, NULL, 2, 'Landing_Page', 'open', NULL, false),
('Trust_Logo_Images', 'typo3', NULL, NULL, true, false, NULL, 'status', true, 'archived', 'draft', 'sort', 'all', NULL, NULL, 1, 'Trust_Logos', 'open', NULL, false),
('Trust_Logo_Images_translations', 'import_export', NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, 6, NULL, 'open', NULL, false),
('Trust_Logos_translations', 'import_export', NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, 5, NULL, 'open', NULL, false),
('map_animation_Map_Cities', 'import_export', NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open', NULL, false)
ON CONFLICT (collection) DO NOTHING;

COMMIT;