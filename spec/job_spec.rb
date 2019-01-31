require_relative '../lib/job.rb'

describe Job do
  it 'correctly ignores things without a passed' do
    j = Job.new(
      {'name' => 'name',
       'plan' => [
         {'get' => 'foo', 'passed' => ['bar']},
         {'task' => 'baz'}
      ]
    })
    expect(j.passed).to eq ['bar']
  end

  it 'handles things with no plan' do
    j = Job.new('name' => 'name')
    expect(j.passed).to eq []
  end
end
