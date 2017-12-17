class ApplicationController < ActionController::API
  # Incluindo helpers para lidar com os retornos das requests
  include Response
  include ExceptionHandler
end
