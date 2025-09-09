-- Add "All Plans Include" features with multilingual support
-- Using explicit IDs to avoid issues with sequences

-- Feature 1: Money-back guarantee
INSERT INTO plan_features (id, status, display, strikethrough, all_plans_include, pricing_packages, sort)
VALUES (4, 'published', true, false, 1, NULL, 1);

INSERT INTO plan_features_translations (plan_features_id, languages_code, feature) VALUES
(4, 'en', '30-day money-back guarantee'),
(4, 'fr', 'Garantie de remboursement de 30 jours'),
(4, 'de', '30-Tage-Geld-zurück-Garantie'),
(4, 'es', 'Garantía de devolución de 30 días');

-- Feature 2: SSL Security
INSERT INTO plan_features (id, status, display, strikethrough, all_plans_include, pricing_packages, sort)
VALUES (5, 'published', true, false, 1, NULL, 2);

INSERT INTO plan_features_translations (plan_features_id, languages_code, feature) VALUES
(5, 'en', 'SSL encryption & data protection'),
(5, 'fr', 'Chiffrement SSL et protection des données'),
(5, 'de', 'SSL-Verschlüsselung & Datenschutz'),
(5, 'es', 'Cifrado SSL y protección de datos');

-- Feature 3: Free updates
INSERT INTO plan_features (id, status, display, strikethrough, all_plans_include, pricing_packages, sort)
VALUES (6, 'published', true, false, 1, NULL, 3);

INSERT INTO plan_features_translations (plan_features_id, languages_code, feature) VALUES
(6, 'en', 'Free updates & new features'),
(6, 'fr', 'Mises à jour gratuites et nouvelles fonctionnalités'),
(6, 'de', 'Kostenlose Updates & neue Funktionen'),
(6, 'es', 'Actualizaciones gratuitas y nuevas funciones');

-- Feature 4: Cancel anytime
INSERT INTO plan_features (id, status, display, strikethrough, all_plans_include, pricing_packages, sort)
VALUES (7, 'published', true, false, 1, NULL, 4);

INSERT INTO plan_features_translations (plan_features_id, languages_code, feature) VALUES
(7, 'en', 'Cancel anytime, no questions asked'),
(7, 'fr', 'Annulez à tout moment, sans question'),
(7, 'de', 'Jederzeit kündbar, ohne Fragen'),
(7, 'es', 'Cancela cuando quieras, sin preguntas');

-- Reset the sequence
SELECT setval('plan_features_id_seq', (SELECT MAX(id) FROM plan_features));