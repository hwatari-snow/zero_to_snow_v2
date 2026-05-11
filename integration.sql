-- 1. API Integration（認証なし / Publicリポジトリ用）
USE ROLE accountadmin;

CREATE OR REPLACE API INTEGRATION zero_to_snow_git_api
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/hwatari-snow')
  ENABLED = TRUE;

-- 2. Git Repository を作成（tb_101 内に配置）
USE DATABASE tb_101;

CREATE OR REPLACE GIT REPOSITORY tb_101.public.zero_to_snow_v2
  API_INTEGRATION = zero_to_snow_git_api
  ORIGIN = 'https://github.com/hwatari-snow/Zero_to_Snow_v2.git';

-- 3. リモートからフェッチ
ALTER GIT REPOSITORY tb_101.public.zero_to_snow_v2 FETCH;

-- 4. 中身を確認
SHOW GIT BRANCHES IN tb_101.public.zero_to_snow_v2;

-- ファイル一覧（mainブランチ）
LS @tb_101.public.zero_to_snow_v2/branches/main/;
