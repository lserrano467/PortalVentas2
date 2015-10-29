OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '909530802435619', 'e701bc7f5b0b11b0189d630087057fe3',
  {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end