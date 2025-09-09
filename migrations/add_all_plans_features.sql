-- Add "All Plans Include" features with multilingual support
BEGIN;

-- Feature 1: Money-back guarantee
INSERT INTO plan_features (status, display, strikethrough, all_plans_include, pricing_packages, sort)
VALUES ('published', true, false, 1, NULL, 1);

-- Get the ID of the feature we just inserted
DO $$
DECLARE
    feature_id INTEGER;
BEGIN
    SELECT currval('plan_features_id_seq') INTO feature_id;
    
    -- Insert translations for money-back guarantee
    INSERT INTO plan_features_translations (plan_features_id, languages_code, feature) VALUES
    (feature_id, 'en', '30-day money-back guarantee'),
    (feature_id, 'fr', 'Garantie de remboursement de 30 jours'),
    (feature_id, 'de', '30-Tage-Geld-zurück-Garantie'),
    (feature_id, 'es', 'Garantía de devolución de 30 días');
END $$;

-- Feature 2: SSL Security
INSERT INTO plan_features (status, display, strikethrough, all_plans_include, pricing_packages, sort)
VALUES ('published', true, false, 1, NULL, 2);

DO $$
DECLARE
    feature_id INTEGER;
BEGIN
    SELECT currval('plan_features_id_seq') INTO feature_id;
    
    INSERT INTO plan_features_translations (plan_features_id, languages_code, feature) VALUES
    (feature_id, 'en', 'SSL encryption & data protection'),
    (feature_id, 'fr', 'Chiffrement SSL et protection des données'),
    (feature_id, 'de', 'SSL-Verschlüsselung & Datenschutz'),
    (feature_id, 'es', 'Cifrado SSL y protección de datos');
END $$;

-- Feature 3: Free updates
INSERT INTO plan_features (status, display, strikethrough, all_plans_include, pricing_packages, sort)
VALUES ('published', true, false, 1, NULL, 3);

DO $$
DECLARE
    feature_id INTEGER;
BEGIN
    SELECT currval('plan_features_id_seq') INTO feature_id;
    
    INSERT INTO plan_features_translations (plan_features_id, languages_code, feature) VALUES
    (feature_id, 'en', 'Free updates & new features'),
    (feature_id, 'fr', 'Mises à jour gratuites et nouvelles fonctionnalités'),
    (feature_id, 'de', 'Kostenlose Updates & neue Funktionen'),
    (feature_id, 'es', 'Actualizaciones gratuitas y nuevas funciones');
END $$;

-- Feature 4: Cancel anytime
INSERT INTO plan_features (status, display, strikethrough, all_plans_include, pricing_packages, sort)
VALUES ('published', true, false, 1, NULL, 4);

DO $$
DECLARE
    feature_id INTEGER;
BEGIN
    SELECT currval('plan_features_id_seq') INTO feature_id;
    
    INSERT INTO plan_features_translations (plan_features_id, languages_code, feature) VALUES
    (feature_id, 'en', 'Cancel anytime, no questions asked'),
    (feature_id, 'fr', 'Annulez à tout moment, sans question'),
    (feature_id, 'de', 'Jederzeit kündbar, ohne Fragen'),
    (feature_id, 'es', 'Cancela cuando quieras, sin preguntas');
END $$;

COMMIT;

-- Verify the data was inserted
SELECT 
    pf.id,
    pf.all_plans_include,
    pft.languages_code,
    pft.feature
FROM plan_features pf
JOIN plan_features_translations pft ON pf.id = pft.plan_features_id
WHERE pf.all_plans_include = 1
ORDER BY pf.sort, pft.languages_code;