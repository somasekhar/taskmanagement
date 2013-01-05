OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :facebook, '129153737232382', '94c02a3b980a69edbb66d767bd5034bd'
    provider :google, '289303544917.apps.googleusercontent.com', 'EonZskS619qP3H0N1eAfwcuI'

  elsif Rails.env.production?

    provider :facebook, '515137038508039', 'ab5616d8408978574190dfae7232a348'
    provider :google, '52163848959.apps.googleusercontent.com', 'MfmwdeqdXaTUH1s91hBn-vsW'

  end
end