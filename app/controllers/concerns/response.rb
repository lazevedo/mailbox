module Response
  # Pequeno helper para retornar 200 OK
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
