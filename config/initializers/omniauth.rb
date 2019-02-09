Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'c9cf3b36a5a64fb7891d', 'be8cfab5bcd735fd33c0023806f9a0b42fec8a46'
end
