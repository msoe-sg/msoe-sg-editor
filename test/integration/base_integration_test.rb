class BaseIntegrationTest < ActionDispatch::IntegrationTest 
  OmniAuth.config.test_mode = true
end
