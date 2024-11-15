require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is valid with valid attributes' do
    # si se necesita algun dato se
    user = User.create(email: 'john@example.com')
    event = Event.new(eventName: 'scissors', level: 'basic', descripcion: 'it`s for anyone', exhibitor: nil,
                      date: Date.today, user: user)
    expect(event).to be_valid
  end

  it 'is valid with valid attributes' do
    # si se necesita algun dato se
    user = User.create(email: 'john@example.com')
    event = Event.new(eventName: nil, level: nil, descripcion: nil, exhibitor: nil,
                      date: nil, user: nil)
    expect(event).to_not be_valid
  end
end
