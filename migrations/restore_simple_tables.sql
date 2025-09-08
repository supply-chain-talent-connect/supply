-- Simple restore of custom tables for testing migration

-- Create Map_Cities table
CREATE TABLE public."Map_Cities" (
    id integer PRIMARY KEY,
    status character varying(255) DEFAULT 'draft',
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    parent integer,
    "Name" character varying(255)
);

-- Create Trust_Logos table
CREATE TABLE public."Trust_Logos" (
    id integer PRIMARY KEY,
    status character varying(255) DEFAULT 'draft',
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

-- Create Trust_Logo_Images table
CREATE TABLE public."Trust_Logo_Images" (
    id integer PRIMARY KEY,
    status character varying(255) DEFAULT 'draft',
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

-- Create Trust_Logo_Images_translations table
CREATE TABLE public."Trust_Logo_Images_translations" (
    id integer PRIMARY KEY,
    "Trust_Logo_Images_id" integer,
    languages_code character varying(255),
    alt_text character varying(255)
);

-- Create Trust_Logos_translations table
CREATE TABLE public."Trust_Logos_translations" (
    id integer PRIMARY KEY,
    "Trust_Logos_id" integer,
    languages_code character varying(255),
    "Intro_Text" character varying(255)
);

-- Create map_animation_Map_Cities junction table
CREATE TABLE public."map_animation_Map_Cities" (
    id integer PRIMARY KEY,
    map_animation_id integer,
    "Map_Cities_id" integer
);

-- Create sequences
CREATE SEQUENCE public."Map_Cities_id_seq" OWNED BY public."Map_Cities".id;
CREATE SEQUENCE public."Trust_Logos_id_seq" OWNED BY public."Trust_Logos".id;
CREATE SEQUENCE public."Trust_Logo_Images_id_seq" OWNED BY public."Trust_Logo_Images".id;
CREATE SEQUENCE public."Trust_Logo_Images_translations_id_seq" OWNED BY public."Trust_Logo_Images_translations".id;
CREATE SEQUENCE public."Trust_Logos_translations_id_seq" OWNED BY public."Trust_Logos_translations".id;
CREATE SEQUENCE public."map_animation_Map_Cities_id_seq" OWNED BY public."map_animation_Map_Cities".id;

-- Set sequence defaults
ALTER TABLE public."Map_Cities" ALTER COLUMN id SET DEFAULT nextval('public."Map_Cities_id_seq"'::regclass);
ALTER TABLE public."Trust_Logos" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logos_id_seq"'::regclass);
ALTER TABLE public."Trust_Logo_Images" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logo_Images_id_seq"'::regclass);
ALTER TABLE public."Trust_Logo_Images_translations" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logo_Images_translations_id_seq"'::regclass);
ALTER TABLE public."Trust_Logos_translations" ALTER COLUMN id SET DEFAULT nextval('public."Trust_Logos_translations_id_seq"'::regclass);
ALTER TABLE public."map_animation_Map_Cities" ALTER COLUMN id SET DEFAULT nextval('public."map_animation_Map_Cities_id_seq"'::regclass);

-- Add constraints with capitalized names
ALTER TABLE public."Map_Cities" ADD CONSTRAINT "Map_Cities_user_created_foreign" FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
ALTER TABLE public."Map_Cities" ADD CONSTRAINT "Map_Cities_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
ALTER TABLE public."Trust_Logos" ADD CONSTRAINT "Trust_Logos_user_created_foreign" FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
ALTER TABLE public."Trust_Logos" ADD CONSTRAINT "Trust_Logos_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
ALTER TABLE public."Trust_Logo_Images" ADD CONSTRAINT "Trust_Logo_Images_user_created_foreign" FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
ALTER TABLE public."Trust_Logo_Images" ADD CONSTRAINT "Trust_Logo_Images_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
ALTER TABLE public."Trust_Logo_Images" ADD CONSTRAINT "Trust_Logo_Images_Logo_Image_foreign" FOREIGN KEY ("Logo_Image") REFERENCES public.directus_files(id) ON DELETE SET NULL;
ALTER TABLE public."Trust_Logo_Images" ADD CONSTRAINT "trust_logo_images_section_foreign" FOREIGN KEY (section) REFERENCES public."Trust_Logos"(id) ON DELETE SET NULL;
ALTER TABLE public."Trust_Logo_Images_translations" ADD CONSTRAINT "trust_logo_images_translations_trust_logo_images_id_foreign" FOREIGN KEY ("Trust_Logo_Images_id") REFERENCES public."Trust_Logo_Images"(id) ON DELETE SET NULL;
ALTER TABLE public."Trust_Logos_translations" ADD CONSTRAINT "trust_logos_translations_trust_logos_id_foreign" FOREIGN KEY ("Trust_Logos_id") REFERENCES public."Trust_Logos"(id) ON DELETE SET NULL;
ALTER TABLE public."map_animation_Map_Cities" ADD CONSTRAINT "map_animation_map_cities_map_cities_id_foreign" FOREIGN KEY ("Map_Cities_id") REFERENCES public."Map_Cities"(id) ON DELETE SET NULL;