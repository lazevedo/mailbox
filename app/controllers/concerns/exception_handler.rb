module ExceptionHandler
  extend ActiveSupport::Concern

  # Helper para tratar exceções  
  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      # Retorna 422 quando 415 e 400 não se aplicam, i.e,
      # content type correto e sintaxe correta mas o payload 
      # não atende validações da aplicação
      json_response({ message: e.message }, :unprocessable_entity)
    end
  end
end
