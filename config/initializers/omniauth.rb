OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '284609678023-dtr418nge6h3ekv7q300eiplvtch61cc.apps.googleusercontent.com', 'YSjCDtGoYHT3A4OdL8JJ3D8B' 


end