class SessionsControllerTest < BaseIntegrationTest
  test 'create should create a user given the omniauth information and store the user in the session' do 
    # Arrange
    OmniAuth.config.add_mock(:google_oauth2, {
      'uid': 1,
      'info': {
        'name': 'Andy',
        'email': 'sample@gmail.com'
      } 
    })
    
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    
    # Act
    get '/auth/google_oauth2/callback'

    # Assert
    user = Marshal.load session[:user]
    assert_equal 1, user.id
    assert_equal 'Andy', user.name
    assert_equal 'sample@gmail.com', user.email
    assert_redirected_to '/'
  end
end
