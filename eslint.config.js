import js from '@eslint/js'
import globals from 'globals'
import reactHooks from 'eslint-plugin-react-hooks'
import reactRefresh from 'eslint-plugin-react-refresh'
import tseslint from 'typescript-eslint'
import i18next from 'eslint-plugin-i18next'

export default tseslint.config(
  { ignores: ['dist', 'src/generated/**', '.claude/**', 'public/**'] },
  {
    extends: [js.configs.recommended, ...tseslint.configs.recommended],
    files: ['**/*.{ts,tsx}'],
    languageOptions: {
      ecmaVersion: 2020,
      globals: globals.browser,
    },
    plugins: {
      'react-hooks': reactHooks,
      'react-refresh': reactRefresh,
      'i18next': i18next,
    },
    rules: {
      ...reactHooks.configs.recommended.rules,
      'react-refresh/only-export-components': [
        'warn',
        { allowConstantExport: true },
      ],
      
      // TypeScript rules - practical, not anal
      '@typescript-eslint/no-explicit-any': 'warn',
      '@typescript-eslint/no-unused-vars': ['warn', { 
        argsIgnorePattern: '^_',
        varsIgnorePattern: '^_'
      }],
      
      // i18n rules - THIS IS IMPORTANT!
      'i18next/no-literal-string': ['error', {
        markupOnly: false,
        ignoreAttribute: [
          'data-testid', 'to', 'href', 'name', 'type', 'id',
          'className', 'size', 'variant', 'color', 'position',
          'order', 'cols', 'spacing', 'mt', 'mb', 'ml', 'mr',
          'radius', 'leftSection', 'rightSection'
        ],
        ignore: [
          '^[A-Z][A-Z0-9_-]*$',  // Constants
          '^[0-9]+$',            // Numbers
          '^[./#-]',             // Paths
        ],
      }],
      
      // General rules
      'no-console': ['warn', { allow: ['warn', 'error'] }],
      'no-debugger': 'warn',
    },
  },
)
