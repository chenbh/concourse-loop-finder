require_relative '../lib/finder.rb'
require_relative '../lib/reader.rb'

describe Finder do
  subject do
    Finder.new Reader.new
  end

  it 'identifies a loop' do
    expect(subject.find('spec/fixtures/loop.yml'))
      .to eq %w[job job]
  end

  it 'identifies a no-loop' do
    expect(subject.find('spec/fixtures/no-loop.yml'))
      .to eq []
  end

  it 'identifies a longer loop' do
    expect(subject.find('spec/fixtures/long-loop.yml'))
      .to eq %w[job job2 job]
  end

  it 'identifies a longer loop with extra' do
    expect(subject.find('spec/fixtures/loop-with-extra.yml'))
      .to eq %w[job job2 job]
  end
end
