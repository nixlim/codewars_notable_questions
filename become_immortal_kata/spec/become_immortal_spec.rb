require 'become_immortal'

describe 'Becoming immortal means' do
  it 'XORing the column and the row numbers' do
    expect(nim_addition(7,14)).to eq(9)
  end
end