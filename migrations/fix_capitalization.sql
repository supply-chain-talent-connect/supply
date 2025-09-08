-- ============================================
-- Fix Capitalized Collection Names and Fields
-- Migration Script for Directus Database
-- ============================================
-- Run this script to convert all capitalized collection names and field names to lowercase
-- Make sure to backup your database before running this script!

BEGIN;

-- ============================================
-- STEP 1: RENAME TABLES
-- ============================================

-- Rename main collections
ALTER TABLE public."Map_Cities" RENAME TO map_cities;
ALTER TABLE public."Trust_Logos" RENAME TO trust_logos;
ALTER TABLE public."Trust_Logo_Images" RENAME TO trust_logo_images;
ALTER TABLE public."Trust_Logo_Images_translations" RENAME TO trust_logo_images_translations;
ALTER TABLE public."Trust_Logos_translations" RENAME TO trust_logos_translations;
ALTER TABLE public."map_animation_Map_Cities" RENAME TO map_animation_map_cities;

-- ============================================
-- STEP 2: RENAME COLUMNS
-- ============================================

-- Fix Map_Cities columns
ALTER TABLE public.map_cities RENAME COLUMN "Name" TO name;

-- Fix Trust_Logo_Images columns  
ALTER TABLE public.trust_logo_images RENAME COLUMN "Logo_Image" TO logo_image;

-- Fix Trust_Logos columns
ALTER TABLE public.trust_logos RENAME COLUMN "Monochrome_Color" TO monochrome_color;
ALTER TABLE public.trust_logos RENAME COLUMN "Enable_Links" TO enable_links;

-- Fix junction table columns
ALTER TABLE public.map_animation_map_cities RENAME COLUMN "Map_Cities_id" TO map_cities_id;

-- Fix translation table foreign key columns
ALTER TABLE public.trust_logo_images_translations RENAME COLUMN "Trust_Logo_Images_id" TO trust_logo_images_id;
ALTER TABLE public.trust_logos_translations RENAME COLUMN "Trust_Logos_id" TO trust_logos_id;
ALTER TABLE public.trust_logos_translations RENAME COLUMN "Intro_Text" TO intro_text;

-- ============================================
-- STEP 3: RENAME SEQUENCES (if they exist)
-- ============================================

DO $$
BEGIN
    -- Rename sequences if they exist
    IF EXISTS (SELECT 1 FROM pg_class WHERE relname = 'Map_Cities_id_seq') THEN
        ALTER SEQUENCE public."Map_Cities_id_seq" RENAME TO map_cities_id_seq;
        ALTER SEQUENCE public.map_cities_id_seq OWNED BY public.map_cities.id;
    END IF;
    
    IF EXISTS (SELECT 1 FROM pg_class WHERE relname = 'Trust_Logos_id_seq') THEN
        ALTER SEQUENCE public."Trust_Logos_id_seq" RENAME TO trust_logos_id_seq;
        ALTER SEQUENCE public.trust_logos_id_seq OWNED BY public.trust_logos.id;
    END IF;
    
    IF EXISTS (SELECT 1 FROM pg_class WHERE relname = 'Trust_Logo_Images_id_seq') THEN
        ALTER SEQUENCE public."Trust_Logo_Images_id_seq" RENAME TO trust_logo_images_id_seq;
        ALTER SEQUENCE public.trust_logo_images_id_seq OWNED BY public.trust_logo_images.id;
    END IF;
    
    IF EXISTS (SELECT 1 FROM pg_class WHERE relname = 'Trust_Logo_Images_translations_id_seq') THEN
        ALTER SEQUENCE public."Trust_Logo_Images_translations_id_seq" RENAME TO trust_logo_images_translations_id_seq;
        ALTER SEQUENCE public.trust_logo_images_translations_id_seq OWNED BY public.trust_logo_images_translations.id;
    END IF;
    
    IF EXISTS (SELECT 1 FROM pg_class WHERE relname = 'Trust_Logos_translations_id_seq') THEN
        ALTER SEQUENCE public."Trust_Logos_translations_id_seq" RENAME TO trust_logos_translations_id_seq;
        ALTER SEQUENCE public.trust_logos_translations_id_seq OWNED BY public.trust_logos_translations.id;
    END IF;
    
    IF EXISTS (SELECT 1 FROM pg_class WHERE relname = 'map_animation_Map_Cities_id_seq') THEN
        ALTER SEQUENCE public."map_animation_Map_Cities_id_seq" RENAME TO map_animation_map_cities_id_seq;
        ALTER SEQUENCE public.map_animation_map_cities_id_seq OWNED BY public.map_animation_map_cities.id;
    END IF;
END $$;

-- ============================================
-- STEP 4: RENAME CONSTRAINTS (if they exist)
-- ============================================

DO $$
DECLARE
    r RECORD;
BEGIN
    -- Rename primary key constraints if they exist
    FOR r IN (SELECT conname FROM pg_constraint WHERE conname IN (
        'Map_Cities_pkey', 'Trust_Logos_pkey', 'Trust_Logo_Images_pkey',
        'Trust_Logo_Images_translations_pkey', 'Trust_Logos_translations_pkey',
        'map_animation_Map_Cities_pkey'
    )) LOOP
        CASE r.conname
            WHEN 'Map_Cities_pkey' THEN
                ALTER TABLE public.map_cities RENAME CONSTRAINT "Map_Cities_pkey" TO map_cities_pkey;
            WHEN 'Trust_Logos_pkey' THEN
                ALTER TABLE public.trust_logos RENAME CONSTRAINT "Trust_Logos_pkey" TO trust_logos_pkey;
            WHEN 'Trust_Logo_Images_pkey' THEN
                ALTER TABLE public.trust_logo_images RENAME CONSTRAINT "Trust_Logo_Images_pkey" TO trust_logo_images_pkey;
            WHEN 'Trust_Logo_Images_translations_pkey' THEN
                ALTER TABLE public.trust_logo_images_translations RENAME CONSTRAINT "Trust_Logo_Images_translations_pkey" TO trust_logo_images_translations_pkey;
            WHEN 'Trust_Logos_translations_pkey' THEN
                ALTER TABLE public.trust_logos_translations RENAME CONSTRAINT "Trust_Logos_translations_pkey" TO trust_logos_translations_pkey;
            WHEN 'map_animation_Map_Cities_pkey' THEN
                ALTER TABLE public.map_animation_map_cities RENAME CONSTRAINT "map_animation_Map_Cities_pkey" TO map_animation_map_cities_pkey;
        END CASE;
    END LOOP;
    
    -- Rename foreign key constraints if they exist
    FOR r IN (SELECT conname FROM pg_constraint WHERE conname IN (
        'map_animation_map_cities_map_cities_id_foreign', 'map_animation_start_foreign',
        'trust_logo_images_section_foreign', 'trust_logo_images_translations_trust_logo_images_id_foreign',
        'trust_logos_translations_trust_logos_id_foreign', 'Map_Cities_user_created_foreign',
        'Map_Cities_user_updated_foreign', 'Trust_Logos_user_created_foreign',
        'Trust_Logos_user_updated_foreign', 'Trust_Logo_Images_user_created_foreign',
        'Trust_Logo_Images_user_updated_foreign', 'Trust_Logo_Images_Logo_Image_foreign'
    )) LOOP
        -- These already have correct names or will be handled by table renaming
        NULL;
    END LOOP;
END $$;

-- ============================================
-- STEP 5: UPDATE DIRECTUS METADATA - COLLECTIONS
-- ============================================

-- Update collection names
UPDATE public.directus_collections SET collection = 'map_cities' WHERE collection = 'Map_Cities';
UPDATE public.directus_collections SET collection = 'trust_logos' WHERE collection = 'Trust_Logos';
UPDATE public.directus_collections SET collection = 'trust_logo_images' WHERE collection = 'Trust_Logo_Images';
UPDATE public.directus_collections SET collection = 'trust_logo_images_translations' WHERE collection = 'Trust_Logo_Images_translations';
UPDATE public.directus_collections SET collection = 'trust_logos_translations' WHERE collection = 'Trust_Logos_translations';
UPDATE public.directus_collections SET collection = 'map_animation_map_cities' WHERE collection = 'map_animation_Map_Cities';

-- Update group names
UPDATE public.directus_collections SET "group" = 'landing_page' WHERE "group" = 'Landing_Page';
UPDATE public.directus_collections SET "group" = 'general_settings' WHERE "group" = 'General_Settings';
UPDATE public.directus_collections SET "group" = 'menus' WHERE "group" = 'Menus';

-- Update parent collection references
UPDATE public.directus_collections SET "group" = 'trust_logos' WHERE "group" = 'Trust_Logos';

-- ============================================
-- STEP 6: UPDATE DIRECTUS METADATA - FIELDS
-- ============================================

-- Update collection references in fields
UPDATE public.directus_fields SET collection = 'map_cities' WHERE collection = 'Map_Cities';
UPDATE public.directus_fields SET collection = 'trust_logos' WHERE collection = 'Trust_Logos';
UPDATE public.directus_fields SET collection = 'trust_logo_images' WHERE collection = 'Trust_Logo_Images';
UPDATE public.directus_fields SET collection = 'trust_logo_images_translations' WHERE collection = 'Trust_Logo_Images_translations';
UPDATE public.directus_fields SET collection = 'trust_logos_translations' WHERE collection = 'Trust_Logos_translations';
UPDATE public.directus_fields SET collection = 'map_animation_map_cities' WHERE collection = 'map_animation_Map_Cities';

-- Update field names
UPDATE public.directus_fields SET field = 'name' WHERE collection = 'map_cities' AND field = 'Name';
UPDATE public.directus_fields SET field = 'logo_image' WHERE collection = 'trust_logo_images' AND field = 'Logo_Image';
UPDATE public.directus_fields SET field = 'monochrome_color' WHERE collection = 'trust_logos' AND field = 'Monochrome_Color';
UPDATE public.directus_fields SET field = 'enable_links' WHERE collection = 'trust_logos' AND field = 'Enable_Links';
UPDATE public.directus_fields SET field = 'map_cities_id' WHERE collection = 'map_animation_map_cities' AND field = 'Map_Cities_id';
UPDATE public.directus_fields SET field = 'trust_logo_images_id' WHERE collection = 'trust_logo_images_translations' AND field = 'Trust_Logo_Images_id';
UPDATE public.directus_fields SET field = 'trust_logos_id' WHERE collection = 'trust_logos_translations' AND field = 'Trust_Logos_id';
UPDATE public.directus_fields SET field = 'intro_text' WHERE collection = 'trust_logos_translations' AND field = 'Intro_Text';

-- Update field references in options (JSON fields)
UPDATE public.directus_fields 
SET options = REPLACE(options::text, '"Map_Cities_id.Name"', '"map_cities_id.name"')::json
WHERE options::text LIKE '%Map_Cities_id.Name%';

UPDATE public.directus_fields 
SET options = REPLACE(options::text, 'Trust_Logos', 'trust_logos')::json
WHERE options::text LIKE '%Trust_Logos%';

UPDATE public.directus_fields 
SET options = REPLACE(options::text, 'Logo_Image', 'logo_image')::json
WHERE options::text LIKE '%Logo_Image%' AND collection = 'trust_logos';

-- ============================================
-- STEP 7: UPDATE DIRECTUS METADATA - RELATIONS
-- ============================================

-- Update many_collection references
UPDATE public.directus_relations SET many_collection = 'map_cities' WHERE many_collection = 'Map_Cities';
UPDATE public.directus_relations SET many_collection = 'trust_logos' WHERE many_collection = 'Trust_Logos';
UPDATE public.directus_relations SET many_collection = 'trust_logo_images' WHERE many_collection = 'Trust_Logo_Images';
UPDATE public.directus_relations SET many_collection = 'trust_logo_images_translations' WHERE many_collection = 'Trust_Logo_Images_translations';
UPDATE public.directus_relations SET many_collection = 'trust_logos_translations' WHERE many_collection = 'Trust_Logos_translations';
UPDATE public.directus_relations SET many_collection = 'map_animation_map_cities' WHERE many_collection = 'map_animation_Map_Cities';

-- Update one_collection references
UPDATE public.directus_relations SET one_collection = 'map_cities' WHERE one_collection = 'Map_Cities';
UPDATE public.directus_relations SET one_collection = 'trust_logos' WHERE one_collection = 'Trust_Logos';
UPDATE public.directus_relations SET one_collection = 'trust_logo_images' WHERE one_collection = 'Trust_Logo_Images';
UPDATE public.directus_relations SET one_collection = 'trust_logo_images_translations' WHERE one_collection = 'Trust_Logo_Images_translations';
UPDATE public.directus_relations SET one_collection = 'trust_logos_translations' WHERE one_collection = 'Trust_Logos_translations';

-- Update many_field references
UPDATE public.directus_relations SET many_field = 'map_cities_id' WHERE many_field = 'Map_Cities_id';
UPDATE public.directus_relations SET many_field = 'trust_logo_images_id' WHERE many_field = 'Trust_Logo_Images_id';
UPDATE public.directus_relations SET many_field = 'trust_logos_id' WHERE many_field = 'Trust_Logos_id';
UPDATE public.directus_relations SET many_field = 'logo_image' WHERE many_collection = 'trust_logo_images' AND many_field = 'Logo_Image';

-- Update one_field references (for O2M relationships)
UPDATE public.directus_relations SET one_field = 'logos' WHERE one_collection = 'trust_logos' AND one_field = 'Logos';

-- Update junction_field references
UPDATE public.directus_relations SET junction_field = 'trust_logos_id' WHERE junction_field = 'Trust_Logos_id';
UPDATE public.directus_relations SET junction_field = 'trust_logo_images_id' WHERE junction_field = 'Trust_Logo_Images_id';

-- ============================================
-- STEP 8: UPDATE DIRECTUS METADATA - PERMISSIONS
-- ============================================

UPDATE public.directus_permissions SET collection = 'map_cities' WHERE collection = 'Map_Cities';
UPDATE public.directus_permissions SET collection = 'trust_logos' WHERE collection = 'Trust_Logos';
UPDATE public.directus_permissions SET collection = 'trust_logo_images' WHERE collection = 'Trust_Logo_Images';
UPDATE public.directus_permissions SET collection = 'trust_logo_images_translations' WHERE collection = 'Trust_Logo_Images_translations';
UPDATE public.directus_permissions SET collection = 'trust_logos_translations' WHERE collection = 'Trust_Logos_translations';
UPDATE public.directus_permissions SET collection = 'map_animation_map_cities' WHERE collection = 'map_animation_Map_Cities';

-- ============================================
-- STEP 9: UPDATE DIRECTUS METADATA - PRESETS
-- ============================================

UPDATE public.directus_presets SET collection = 'map_cities' WHERE collection = 'Map_Cities';
UPDATE public.directus_presets SET collection = 'trust_logos' WHERE collection = 'Trust_Logos';
UPDATE public.directus_presets SET collection = 'trust_logo_images' WHERE collection = 'Trust_Logo_Images';
UPDATE public.directus_presets SET collection = 'trust_logo_images_translations' WHERE collection = 'Trust_Logo_Images_translations';
UPDATE public.directus_presets SET collection = 'trust_logos_translations' WHERE collection = 'Trust_Logos_translations';
UPDATE public.directus_presets SET collection = 'map_animation_map_cities' WHERE collection = 'map_animation_Map_Cities';

-- ============================================
-- STEP 10: UPDATE DIRECTUS METADATA - ACTIVITY
-- ============================================

UPDATE public.directus_activity SET collection = 'map_cities' WHERE collection = 'Map_Cities';
UPDATE public.directus_activity SET collection = 'trust_logos' WHERE collection = 'Trust_Logos';
UPDATE public.directus_activity SET collection = 'trust_logo_images' WHERE collection = 'Trust_Logo_Images';
UPDATE public.directus_activity SET collection = 'trust_logo_images_translations' WHERE collection = 'Trust_Logo_Images_translations';
UPDATE public.directus_activity SET collection = 'trust_logos_translations' WHERE collection = 'Trust_Logos_translations';
UPDATE public.directus_activity SET collection = 'map_animation_map_cities' WHERE collection = 'map_animation_Map_Cities';

-- ============================================
-- STEP 11: UPDATE DIRECTUS METADATA - REVISIONS
-- ============================================

UPDATE public.directus_revisions SET collection = 'map_cities' WHERE collection = 'Map_Cities';
UPDATE public.directus_revisions SET collection = 'trust_logos' WHERE collection = 'Trust_Logos';
UPDATE public.directus_revisions SET collection = 'trust_logo_images' WHERE collection = 'Trust_Logo_Images';
UPDATE public.directus_revisions SET collection = 'trust_logo_images_translations' WHERE collection = 'Trust_Logo_Images_translations';
UPDATE public.directus_revisions SET collection = 'trust_logos_translations' WHERE collection = 'Trust_Logos_translations';
UPDATE public.directus_revisions SET collection = 'map_animation_map_cities' WHERE collection = 'map_animation_Map_Cities';

COMMIT;

-- ============================================
-- VERIFICATION QUERIES
-- ============================================
-- Run these after the migration to verify success:

-- Check renamed tables exist
-- SELECT table_name FROM information_schema.tables 
-- WHERE table_schema = 'public' 
-- AND table_name IN ('map_cities', 'trust_logos', 'trust_logo_images', 
--                    'trust_logo_images_translations', 'trust_logos_translations', 
--                    'map_animation_map_cities');

-- Check old tables don't exist
-- SELECT table_name FROM information_schema.tables 
-- WHERE table_schema = 'public' 
-- AND table_name IN ('Map_Cities', 'Trust_Logos', 'Trust_Logo_Images',
--                    'Trust_Logo_Images_translations', 'Trust_Logos_translations',
--                    'map_animation_Map_Cities');

-- Check Directus collections are updated
-- SELECT collection FROM directus_collections 
-- WHERE collection IN ('map_cities', 'trust_logos', 'trust_logo_images');

-- Check column names are lowercase
-- SELECT column_name FROM information_schema.columns 
-- WHERE table_schema = 'public' 
-- AND table_name IN ('map_cities', 'trust_logos', 'trust_logo_images')
-- AND column_name ~ '[A-Z]';