require 'rails_helper'

RSpec.describe Message, type: :model do
  # Relacao com User (sender / recipient)
  it { should belong_to(:sender) }
  it { should belong_to(:recipient) }
  # Testes de validacao 
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:sender_id) }
  it { should validate_presence_of(:recipient_id) }
  it { should validate_presence_of(:is_read) }
  it { should validate_presence_of(:is_archived) }
end
