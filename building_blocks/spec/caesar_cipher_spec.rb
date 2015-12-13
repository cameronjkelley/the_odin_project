require 'spec_helper.rb'

describe "caesar_cipher" do 
  it "shifts a lowrecase letter" do 
    expect(caesar_cipher('a', 2)).to eq 'c'
  end

  it "shifts an uppercase letter" do 
    expect(caesar_cipher('A', 2)).to eq 'C'
  end

  it "shifts a word" do 
    expect(caesar_cipher('test', 2)).to eq 'vguv'
  end

  it "wraps after z" do 
    expect(caesar_cipher('z', 2)).to eq 'b'
  end

  it "preserves white space" do 
    expect(caesar_cipher('a test file', 2)).to eq 'c vguv hkng'
  end
end