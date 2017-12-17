module ControllerSpecHelper
  # Helper para facilitar geração do JWT nos testes
  TEST_HMAC_SECRET='iMHcCAQEEID45cirN2vdEhKDr2sc4JT3UZMd8yGp1ZJf7p6XOAXcSoAoGCCqGSM49AwEHoUQDQgAEl1/24GW/M1mN8mHitshp/A03SesZHuIfTYKcgXxyZnyqwuZPn3G6Eh5iCVJzQ130cwX7tMRK98I8jSngOWkxBw=='
 
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      "Authorization" => token_generator(user.id),
      "Content-Type" => "application/json"
    }
  end

  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json"
    }
  end
end
