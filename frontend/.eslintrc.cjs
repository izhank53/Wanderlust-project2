module.exports = {
  root: true,
  env: {
    browser: true,
    es2020: true,
  },

  parser: "@typescript-eslint/parser",

  parserOptions: {
    project: "./tsconfig.eslint.json",
    tsconfigRootDir: __dirname,
  },

  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended-type-checked",
    "plugin:react-hooks/recommended",
    "plugin:@typescript-eslint/stylistic-type-checked",
    "prettier",
  ],

  plugins: ["react-refresh"],

  ignorePatterns: ["dist", ".eslintrc.cjs"],

  rules: {
    "react-refresh/only-export-components": [
      "warn",
      { allowConstantExport: true },
    ],
  },
};