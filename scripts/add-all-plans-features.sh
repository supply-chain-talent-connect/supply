#!/bin/bash

# Directus API endpoint
API_URL="http://10.0.20.3:8055"

# Function to create a plan feature with translations
create_feature_with_translations() {
  local feature_en="$1"
  local feature_fr="$2"
  local feature_de="$3"
  local feature_es="$4"
  
  # Create the plan feature with all_plans_include=1 (links to pricing_section)
  response=$(curl -s -X POST "$API_URL/items/plan_features" \
    -H "Content-Type: application/json" \
    -d "{
      \"status\": \"published\",
      \"display\": true,
      \"strikethrough\": false,
      \"all_plans_include\": 1,
      \"pricing_packages\": null
    }")
  
  # Extract the created feature ID
  feature_id=$(echo "$response" | jq -r '.data.id')
  
  if [ "$feature_id" != "null" ] && [ -n "$feature_id" ]; then
    echo "Created feature ID: $feature_id"
    
    # Add English translation
    curl -s -X POST "$API_URL/items/plan_features_translations" \
      -H "Content-Type: application/json" \
      -d "{
        \"plan_features_id\": $feature_id,
        \"languages_code\": \"en\",
        \"feature\": \"$feature_en\"
      }" > /dev/null
    
    # Add French translation
    curl -s -X POST "$API_URL/items/plan_features_translations" \
      -H "Content-Type: application/json" \
      -d "{
        \"plan_features_id\": $feature_id,
        \"languages_code\": \"fr\",
        \"feature\": \"$feature_fr\"
      }" > /dev/null
    
    # Add German translation
    curl -s -X POST "$API_URL/items/plan_features_translations" \
      -H "Content-Type: application/json" \
      -d "{
        \"plan_features_id\": $feature_id,
        \"languages_code\": \"de\",
        \"feature\": \"$feature_de\"
      }" > /dev/null
    
    # Add Spanish translation
    curl -s -X POST "$API_URL/items/plan_features_translations" \
      -H "Content-Type: application/json" \
      -d "{
        \"plan_features_id\": $feature_id,
        \"languages_code\": \"es\",
        \"feature\": \"$feature_es\"
      }" > /dev/null
    
    echo "  ✓ Added translations for: $feature_en"
  else
    echo "  ✗ Failed to create feature: $feature_en"
    echo "Response: $response"
  fi
}

echo "Adding 'All Plans Include' features..."
echo

# 1. Money-back guarantee
create_feature_with_translations \
  "30-day money-back guarantee" \
  "Garantie de remboursement de 30 jours" \
  "30-Tage-Geld-zurück-Garantie" \
  "Garantía de devolución de 30 días"

# 2. SSL Security
create_feature_with_translations \
  "SSL encryption & data protection" \
  "Chiffrement SSL et protection des données" \
  "SSL-Verschlüsselung & Datenschutz" \
  "Cifrado SSL y protección de datos"

# 3. Free updates
create_feature_with_translations \
  "Free updates & new features" \
  "Mises à jour gratuites et nouvelles fonctionnalités" \
  "Kostenlose Updates & neue Funktionen" \
  "Actualizaciones gratuitas y nuevas funciones"

# 4. Cancel anytime
create_feature_with_translations \
  "Cancel anytime, no questions asked" \
  "Annulez à tout moment, sans question" \
  "Jederzeit kündbar, ohne Fragen" \
  "Cancela cuando quieras, sin preguntas"

echo
echo "Done! All features have been added."