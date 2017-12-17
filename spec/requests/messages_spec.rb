require 'rails_helper'

RSpec.describe 'Message API', type: :request do
  # Inicializacao
  let!(:user) { create(:user) }
  let!(:messages) { create_list(:message, 10) }
  let(:message_id) { messages.first.id }

  # Testes de listagem de mensagens
  describe 'GET /messages' do

    before { get '/messages' }

    it 'retorna lista de mensagens' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10) # verificar se e necessario
    end

    it 'retorna status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Testes de aquisicao de dados de uma mensagem
  describe 'GET /messages/:id' do
    before { get "/messages/#{message_id}" }

    context 'se a mensagem existe no banco' do
      it 'deve ser retornada a mensagem' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(message_id)
      end

      it 'retorna status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'se a mensagem não existe no banco' do
      # mock de id de mensagem inexistente para o teste
      let(:message_id) { 2345678 }

      it 'retorna status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'retorna "Mensagem não encontrada"' do
        expect(response.body).to match(/Mensagem não encontrada/)
      end
    end
  end

  # Testes de criação de mensagem 
  describe 'POST /messages' do
    # validação de payload
    let(:valid_attributes) { { title: 'Lorem Ipsum', created_by: '1' } }

    context 'se o payload é válido' do
      before { post '/messages', params: valid_attributes }

      it 'cria mensagem' do
        expect(json['title']).to eq('Lorem Ipsum')
      end

      it 'retorna status 201 (CREATED)' do
        expect(response).to have_http_status(201)
      end
    end

    context 'se o payload é inválido' do
      before { post '/messages', params: { title: 'SPAM' } }

      it 'returna status code 422 (UNPROCESSABLE ENTITY)' do
        expect(response).to have_http_status(422)
      end

      it 'returna "Falha de validação: Mensagem em branco."' do
        expect(response.body)
          .to match(/Falha de validação: Mensagem em branco./)
      end
    end
  end

  # Testes de atualização de mensagem 
  describe 'PUT /messages/:id' do
    let(:valid_attributes) { { is_read: true } }

    context 'se a mensagem existe no banco' do
      before { put "/messages/#{message_id}", params: valid_attributes }

      it 'atualiza a mensagem como lida' do
        expect(response.body).to be_empty
      end

      # Retorno de edição como status 204
      # conforme recomendação: https://httpstatuses.com/204
      it 'retorna status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    let(:valid_attributes) { { is_archived: true } }

    context 'se a mensagem existe no banco' do
      before { put "/messages/#{message_id}", params: valid_attributes }

      it 'atualiza a mensagem como arquivada' do
        expect(response.body).to be_empty
      end

      # Retorno de edição como status 204
      # conforme recomendação: https://httpstatuses.com/204
      it 'retorna status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'se a mensagem não existe no banco' do
      # mock de id de mensagem inexistente para o teste
      let(:message_id) { 2345678 }

      it 'retorna status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'retorna "Mensagem não encontrada"' do
        expect(response.body).to match(/Mensagem não encontrada/)
      end
    end
  end
end
