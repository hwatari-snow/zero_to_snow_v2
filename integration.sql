-- 1. API Integration（認証なし / Publicリポジトリ用）
USE ROLE accountadmin;

CREATE OR REPLACE API INTEGRATION zero_to_snow_git_api
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/hwatari-snow')
  ENABLED = TRUE;

-- 2. Git Repository を作成（learning 内に配置）
USE DATABASE snowflake_learning_db;
create schema public;

CREATE OR REPLACE GIT REPOSITORY snowflake_learning_db.public.zero_to_snow_v2
  API_INTEGRATION = zero_to_snow_git_api
  ORIGIN = 'https://github.com/hwatari-snow/Zero_to_Snow_v2.git';
