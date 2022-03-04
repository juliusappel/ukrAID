Hcaptcha.configure do |config|
  config.site_key = 'HCAPTCHA_PUBLIC_SITE_KEY'
  config.secret_key = 'HACAPTCHA_SECRET_KEY'
  # optional, default value = https://hcaptcha.com/siteverify
  config.verify_url = 'VERIFY_URL'
  # optional, default value = https://hcaptcha.com/1/api.js
  # config.api_script_url = 'API_SCRIPT_URL'
end
