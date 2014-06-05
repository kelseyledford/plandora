OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '510296792432654', '61aced647e53604fcfbff79002cc5488', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end