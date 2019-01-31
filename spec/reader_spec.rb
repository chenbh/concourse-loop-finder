require_relative '../lib/reader.rb'

describe Reader do
  subject do
    Reader.new
  end
  describe 'reading loop.yml' do
    let :result do
      subject.read_jobs('spec/loop.yml')
    end

    it 'reads the correct number of jobs' do
      expect(result.length).to eq 1
    end

    describe 'first job' do
      let :job do
        result.first
      end

      it 'parses the name for the job' do
        expect(job.name).to eq 'job'
      end

      it 'parses the passed constraints for the job' do
        expect(job.passed).to eq [job]
      end
    end
  end
  describe 'reading no-loop.yml' do
    let :result do
      subject.read_jobs('spec/no-loop.yml')
    end

    it 'reads the correct number of jobs' do
      expect(result.length).to eq 2
    end

    describe 'first job' do
      let :job do
        result.first
      end

      it 'parses the name for the job' do
        expect(job.name).to eq 'job'
      end

      it 'parses the passed constraints for the job' do
        expect(job.passed).to eq []
      end
    end

    describe 'second job' do
      let :job do
        result[1]
      end

      it 'parses the name for the job' do
        expect(job.name).to eq 'other-job'
      end

      it 'parses the passed constraints for the job' do
        expect(job.passed).to eq [result[0]]
      end
    end
  end
end
