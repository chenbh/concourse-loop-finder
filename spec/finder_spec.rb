require_relative '../lib/finder.rb'
require_relative '../lib/reader.rb'

describe Finder do
  subject do
    Finder.new Reader.new
  end

  it 'identifies a loop' do
    expect(subject.find('spec/loop.yml')).to be true
  end

  it 'identifies a no-loop' do
    expect(subject.find('spec/no-loop.yml')).to be false
  end

  it 'identifies a longer loop' do
    expect(subject.find('spec/long-loop.yml')).to be true
  end
end
