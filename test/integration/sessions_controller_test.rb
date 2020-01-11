class SessionsControllerTest < BaseIntegrationTest
  test 'create should create a user given the omniauth information and store the user in the session' do 
    # Arrange
    mock_request = Request.new
    mock_request.env = {
      "omniauth.auth": {
        'uid': 1,
        'info': {
            'name': 'Andy'
        }
      }
    }

    SessionsController.any_instance.expects(:request).returns(mock_request).at_least_once

    # Act
    get '/auth/google_oauth2/callback'

    # Assert
    user = Marshal.load session[:user]
    assert_equal 1, user.id
    assert_equal 'Andy', user.name
    assert_redirected_to '/'
  end
end
