require 'rails_helper'

RSpec.describe User, type: :model do
  # Relacao com Messages
  it { should have_many(:sent_messages).dependent(:destroy) }
  it { should have_many(:received_messages).dependent(:destroy) }
  # Testes de validacao 
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:encrypted_password) }
  it { should validate_presence_of(:name) }
end
