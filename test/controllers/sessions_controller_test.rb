require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  test "should get create" do
    get sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sessions_destroy_url
    assert_response :success
  end

>>>>>>> dfc2eac867d7be703f16c18d955701245c404f6c
end
