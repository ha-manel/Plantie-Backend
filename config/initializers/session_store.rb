if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, {
    :key => '_your_app_name',
    :domain => :all,
    :same_site => :none,
    :secure => :true,
    :tld_length => 2
  }
else
  Rails.application.config.session_store :cookie_store, key: '_plantie_backend'
end