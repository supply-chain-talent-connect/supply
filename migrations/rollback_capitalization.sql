-- ============================================
-- ROLLBACK Script for Capitalization Fix
-- ============================================
-- Run this script if you need to revert the capitalization fixes
-- This will restore the original capitalized collection and field names

BEGIN;

-- ============================================
-- STEP 1: REVERT DIRECTUS METADATA - ACTIVITY & REVISIONS
-- ============================================

UPDATE public.directus_revisions SET collection = 'Map_Cities' WHERE collection = 'map_cities';
UPDATE public.directus_revisions SET collection = 'Trust_Logos' WHERE collection = 'trust_logos';
UPDATE public.directus_revisions SET collection = 'Trust_Logo_Images' WHERE collection = 'trust_logo_images';
UPDATE public.directus_revisions SET collection = 'Trust_Logo_Images_translations' WHERE collection = 'trust_logo_images_translations';
UPDATE public.directus_revisions SET collection = 'Trust_Logos_translations' WHERE collection = 'trust_logos_translations';
UPDATE public.directus_revisions SET collection = 'map_animation_Map_Cities' WHERE collection = 'map_animation_map_cities';

UPDATE public.directus_activity SET collection = 'Map_Cities' WHERE collection = 'map_cities';
UPDATE public.directus_activity SET collection = 'Trust_Logos' WHERE collection = 'trust_logos';
UPDATE public.directus_activity SET collection = 'Trust_Logo_Images' WHERE collection = 'trust_logo_images';
UPDATE public.directus_activity SET collection = 'Trust_Logo_Images_translations' WHERE collection = 'trust_logo_images_translations';
UPDATE public.directus_activity SET collection = 'Trust_Logos_translations' WHERE collection = 'trust_logos_translations';
UPDATE public.directus_activity SET collection = 'map_animation_Map_Cities' WHERE collection = 'map_animation_map_cities';

-- ============================================
-- STEP 2: REVERT DIRECTUS METADATA - PRESETS & PERMISSIONS
-- ============================================

UPDATE public.directus_presets SET collection = 'Map_Cities' WHERE collection = 'map_cities';
UPDATE public.directus_presets SET collection = 'Trust_Logos' WHERE collection = 'trust_logos';
UPDATE public.directus_presets SET collection = 'Trust_Logo_Images' WHERE collection = 'trust_logo_images';
UPDATE public.directus_presets SET collection = 'Trust_Logo_Images_translations' WHERE collection = 'trust_logo_images_translations';
UPDATE public.directus_presets SET collection = 'Trust_Logos_translations' WHERE collection = 'trust_logos_translations';
UPDATE public.directus_presets SET collection = 'map_animation_Map_Cities' WHERE collection = 'map_animation_map_cities';

UPDATE public.directus_permissions SET collection = 'Map_Cities' WHERE collection = 'map_cities';
UPDATE public.directus_permissions SET collection = 'Trust_Logos' WHERE collection = 'trust_logos';
UPDATE public.directus_permissions SET collection = 'Trust_Logo_Images' WHERE collection = 'trust_logo_images';
UPDATE public.directus_permissions SET collection = 'Trust_Logo_Images_translations' WHERE collection = 'trust_logo_images_translations';
UPDATE public.directus_permissions SET collection = 'Trust_Logos_translations' WHERE collection = 'trust_logos_translations';
UPDATE public.directus_permissions SET collection = 'map_animation_Map_Cities' WHERE collection = 'map_animation_map_cities';

-- ============================================
-- STEP 3: REVERT DIRECTUS METADATA - RELATIONS
-- ============================================

-- Revert one_field references (for O2M relationships)
UPDATE public.directus_relations SET one_field = 'Logos' WHERE one_collection = 'Trust_Logos' AND one_field = 'logos';

-- Revert many_field references
UPDATE public.directus_relations SET many_field = 'Logo_Image' WHERE many_collection = 'Trust_Logo_Images' AND many_field = 'logo_image';
UPDATE public.directus_relations SET many_field = 'Trust_Logos_id' WHERE many_field = 'trust_logos_id';
UPDATE public.directus_relations SET many_field = 'Trust_Logo_Images_id' WHERE many_field = 'trust_logo_images_id';
UPDATE public.directus_relations SET many_field = 'Map_Cities_id' WHERE many_field = 'map_cities_id';

-- Revert one_collection references
UPDATE public.directus_relations SET one_collection = 'Trust_Logos_translations' WHERE one_collection = 'trust_logos_translations';
UPDATE public.directus_relations SET one_collection = 'Trust_Logo_Images_translations' WHERE one_collection = 'trust_logo_images_translations';
UPDATE public.directus_relations SET one_collection = 'Trust_Logo_Images' WHERE one_collection = 'trust_logo_images';
UPDATE public.directus_relations SET one_collection = 'Trust_Logos' WHERE one_collection = 'trust_logos';
UPDATE public.directus_relations SET one_collection = 'Map_Cities' WHERE one_collection = 'map_cities';

-- Revert many_collection references
UPDATE public.directus_relations SET many_collection = 'map_animation_Map_Cities' WHERE many_collection = 'map_animation_map_cities';
UPDATE public.directus_relations SET many_collection = 'Trust_Logos_translations' WHERE many_collection = 'trust_logos_translations';
UPDATE public.directus_relations SET many_collection = 'Trust_Logo_Images_translations' WHERE many_collection = 'trust_logo_images_translations';
UPDATE public.directus_relations SET many_collection = 'Trust_Logo_Images' WHERE many_collection = 'trust_logo_images';
UPDATE public.directus_relations SET many_collection = 'Trust_Logos' WHERE many_collection = 'trust_logos';
UPDATE public.directus_relations SET many_collection = 'Map_Cities' WHERE many_collection = 'map_cities';

-- Revert junction_field references
UPDATE public.directus_relations SET junction_field = 'Trust_Logo_Images_id' WHERE junction_field = 'trust_logo_images_id';
UPDATE public.directus_relations SET junction_field = 'Trust_Logos_id' WHERE junction_field = 'trust_logos_id';

-- ============================================
-- STEP 4: REVERT DIRECTUS METADATA - FIELDS
-- ============================================

-- Revert field names
UPDATE public.directus_fields SET field = 'Intro_Text' WHERE collection = 'Trust_Logos_translations' AND field = 'intro_text';
UPDATE public.directus_fields SET field = 'Trust_Logos_id' WHERE collection = 'Trust_Logos_translations' AND field = 'trust_logos_id';
UPDATE public.directus_fields SET field = 'Trust_Logo_Images_id' WHERE collection = 'Trust_Logo_Images_translations' AND field = 'trust_logo_images_id';
UPDATE public.directus_fields SET field = 'Map_Cities_id' WHERE collection = 'map_animation_Map_Cities' AND field = 'map_cities_id';
UPDATE public.directus_fields SET field = 'Enable_Links' WHERE collection = 'Trust_Logos' AND field = 'enable_links';
UPDATE public.directus_fields SET field = 'Monochrome_Color' WHERE collection = 'Trust_Logos' AND field = 'monochrome_color';
UPDATE public.directus_fields SET field = 'Logo_Image' WHERE collection = 'Trust_Logo_Images' AND field = 'logo_image';
UPDATE public.directus_fields SET field = 'Name' WHERE collection = 'Map_Cities' AND field = 'name';

-- Revert collection references in fields
UPDATE public.directus_fields SET collection = 'map_animation_Map_Cities' WHERE collection = 'map_animation_map_cities';
UPDATE public.directus_fields SET collection = 'Trust_Logos_translations' WHERE collection = 'trust_logos_translations';
UPDATE public.directus_fields SET collection = 'Trust_Logo_Images_translations' WHERE collection = 'trust_logo_images_translations';
UPDATE public.directus_fields SET collection = 'Trust_Logo_Images' WHERE collection = 'trust_logo_images';
UPDATE public.directus_fields SET collection = 'Trust_Logos' WHERE collection = 'trust_logos';
UPDATE public.directus_fields SET collection = 'Map_Cities' WHERE collection = 'map_cities';

-- Revert field references in options (JSON fields)
UPDATE public.directus_fields 
SET options = REPLACE(options::text, '"map_cities_id.name"', '"Map_Cities_id.Name"')::json
WHERE options::text LIKE '%map_cities_id.name%';

UPDATE public.directus_fields 
SET options = REPLACE(options::text, 'trust_logos', 'Trust_Logos')::json
WHERE options::text LIKE '%trust_logos%';

UPDATE public.directus_fields 
SET options = REPLACE(options::text, 'logo_image', 'Logo_Image')::json
WHERE options::text LIKE '%logo_image%' AND collection = 'Trust_Logos';

-- ============================================
-- STEP 5: REVERT DIRECTUS METADATA - COLLECTIONS
-- ============================================

-- Revert parent collection references
UPDATE public.directus_collections SET "group" = 'Trust_Logos' WHERE "group" = 'trust_logos';

-- Revert group names
UPDATE public.directus_collections SET "group" = 'Menus' WHERE "group" = 'menus';
UPDATE public.directus_collections SET "group" = 'General_Settings' WHERE "group" = 'general_settings';
UPDATE public.directus_collections SET "group" = 'Landing_Page' WHERE "group" = 'landing_page';

-- Revert collection names
UPDATE public.directus_collections SET collection = 'map_animation_Map_Cities' WHERE collection = 'map_animation_map_cities';
UPDATE public.directus_collections SET collection = 'Trust_Logos_translations' WHERE collection = 'trust_logos_translations';
UPDATE public.directus_collections SET collection = 'Trust_Logo_Images_translations' WHERE collection = 'trust_logo_images_translations';
UPDATE public.directus_collections SET collection = 'Trust_Logo_Images' WHERE collection = 'trust_logo_images';
UPDATE public.directus_collections SET collection = 'Trust_Logos' WHERE collection = 'trust_logos';
UPDATE public.directus_collections SET collection = 'Map_Cities' WHERE collection = 'map_cities';

-- ============================================
-- STEP 6: REVERT CONSTRAINTS
-- ============================================

-- File foreign key constraint
ALTER TABLE public.trust_logo_images RENAME CONSTRAINT trust_logo_images_logo_image_foreign TO "Trust_Logo_Images_Logo_Image_foreign";

-- User foreign key constraints
ALTER TABLE public.trust_logo_images RENAME CONSTRAINT trust_logo_images_user_updated_foreign TO "Trust_Logo_Images_user_updated_foreign";
ALTER TABLE public.trust_logo_images RENAME CONSTRAINT trust_logo_images_user_created_foreign TO "Trust_Logo_Images_user_created_foreign";
ALTER TABLE public.trust_logos RENAME CONSTRAINT trust_logos_user_updated_foreign TO "Trust_Logos_user_updated_foreign";
ALTER TABLE public.trust_logos RENAME CONSTRAINT trust_logos_user_created_foreign TO "Trust_Logos_user_created_foreign";
ALTER TABLE public.map_cities RENAME CONSTRAINT map_cities_user_updated_foreign TO "Map_Cities_user_updated_foreign";
ALTER TABLE public.map_cities RENAME CONSTRAINT map_cities_user_created_foreign TO "Map_Cities_user_created_foreign";

-- Foreign key constraints
ALTER TABLE public.trust_logos_translations RENAME CONSTRAINT trust_logos_translations_trust_logos_id_foreign TO "trust_logos_translations_trust_logos_id_foreign";
ALTER TABLE public.trust_logo_images_translations RENAME CONSTRAINT trust_logo_images_translations_trust_logo_images_id_foreign TO "trust_logo_images_translations_trust_logo_images_id_foreign";
ALTER TABLE public.trust_logo_images RENAME CONSTRAINT trust_logo_images_section_foreign TO "trust_logo_images_section_foreign";
ALTER TABLE public.map_animation RENAME CONSTRAINT map_animation_start_foreign TO "map_animation_start_foreign";
ALTER TABLE public.map_animation_map_cities RENAME CONSTRAINT map_animation_map_cities_map_cities_id_foreign TO "map_animation_map_cities_map_cities_id_foreign";

-- Primary key constraints
ALTER TABLE public.map_animation_map_cities RENAME CONSTRAINT map_animation_map_cities_pkey TO "map_animation_Map_Cities_pkey";
ALTER TABLE public.trust_logos_translations RENAME CONSTRAINT trust_logos_translations_pkey TO "Trust_Logos_translations_pkey";
ALTER TABLE public.trust_logo_images_translations RENAME CONSTRAINT trust_logo_images_translations_pkey TO "Trust_Logo_Images_translations_pkey";
ALTER TABLE public.trust_logo_images RENAME CONSTRAINT trust_logo_images_pkey TO "Trust_Logo_Images_pkey";
ALTER TABLE public.trust_logos RENAME CONSTRAINT trust_logos_pkey TO "Trust_Logos_pkey";
ALTER TABLE public.map_cities RENAME CONSTRAINT map_cities_pkey TO "Map_Cities_pkey";

-- ============================================
-- STEP 7: REVERT SEQUENCES
-- ============================================

ALTER SEQUENCE public.map_animation_map_cities_id_seq RENAME TO "map_animation_Map_Cities_id_seq";
ALTER SEQUENCE public.trust_logos_translations_id_seq RENAME TO "Trust_Logos_translations_id_seq";
ALTER SEQUENCE public.trust_logo_images_translations_id_seq RENAME TO "Trust_Logo_Images_translations_id_seq";
ALTER SEQUENCE public.trust_logo_images_id_seq RENAME TO "Trust_Logo_Images_id_seq";
ALTER SEQUENCE public.trust_logos_id_seq RENAME TO "Trust_Logos_id_seq";
ALTER SEQUENCE public.map_cities_id_seq RENAME TO "Map_Cities_id_seq";

-- Update sequence ownership
ALTER SEQUENCE public."map_animation_Map_Cities_id_seq" OWNED BY public."map_animation_Map_Cities".id;
ALTER SEQUENCE public."Trust_Logos_translations_id_seq" OWNED BY public."Trust_Logos_translations".id;
ALTER SEQUENCE public."Trust_Logo_Images_translations_id_seq" OWNED BY public."Trust_Logo_Images_translations".id;
ALTER SEQUENCE public."Trust_Logo_Images_id_seq" OWNED BY public."Trust_Logo_Images".id;
ALTER SEQUENCE public."Trust_Logos_id_seq" OWNED BY public."Trust_Logos".id;
ALTER SEQUENCE public."Map_Cities_id_seq" OWNED BY public."Map_Cities".id;

-- ============================================
-- STEP 8: REVERT COLUMNS
-- ============================================

-- Revert translation table foreign key columns
ALTER TABLE public.trust_logos_translations RENAME COLUMN intro_text TO "Intro_Text";
ALTER TABLE public.trust_logos_translations RENAME COLUMN trust_logos_id TO "Trust_Logos_id";
ALTER TABLE public.trust_logo_images_translations RENAME COLUMN trust_logo_images_id TO "Trust_Logo_Images_id";

-- Revert junction table columns
ALTER TABLE public.map_animation_map_cities RENAME COLUMN map_cities_id TO "Map_Cities_id";

-- Revert Trust_Logos columns
ALTER TABLE public.trust_logos RENAME COLUMN enable_links TO "Enable_Links";
ALTER TABLE public.trust_logos RENAME COLUMN monochrome_color TO "Monochrome_Color";

-- Revert Trust_Logo_Images columns  
ALTER TABLE public.trust_logo_images RENAME COLUMN logo_image TO "Logo_Image";

-- Revert Map_Cities columns
ALTER TABLE public.map_cities RENAME COLUMN name TO "Name";

-- ============================================
-- STEP 9: REVERT TABLES
-- ============================================

-- Rename main collections back to capitalized versions
ALTER TABLE public.map_animation_map_cities RENAME TO "map_animation_Map_Cities";
ALTER TABLE public.trust_logos_translations RENAME TO "Trust_Logos_translations";
ALTER TABLE public.trust_logo_images_translations RENAME TO "Trust_Logo_Images_translations";
ALTER TABLE public.trust_logo_images RENAME TO "Trust_Logo_Images";
ALTER TABLE public.trust_logos RENAME TO "Trust_Logos";
ALTER TABLE public.map_cities RENAME TO "Map_Cities";

COMMIT;

-- ============================================
-- VERIFICATION QUERIES
-- ============================================
-- Run these after the rollback to verify success:

-- Check capitalized tables exist
-- SELECT table_name FROM information_schema.tables 
-- WHERE table_schema = 'public' 
-- AND table_name IN ('Map_Cities', 'Trust_Logos', 'Trust_Logo_Images',
--                    'Trust_Logo_Images_translations', 'Trust_Logos_translations',
--                    'map_animation_Map_Cities');

-- Check lowercase tables don't exist
-- SELECT table_name FROM information_schema.tables 
-- WHERE table_schema = 'public' 
-- AND table_name IN ('map_cities', 'trust_logos', 'trust_logo_images', 
--                    'trust_logo_images_translations', 'trust_logos_translations', 
--                    'map_animation_map_cities');

-- Check Directus collections are reverted
-- SELECT collection FROM directus_collections 
-- WHERE collection IN ('Map_Cities', 'Trust_Logos', 'Trust_Logo_Images');