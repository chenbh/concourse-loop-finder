require 'yaml'

class Reader
  def read_jobs(path)
    begin
      obj = YAML.load_file path
    rescue
      puts "couldn't read #{path}"
      exit 1
    end
    flat_jobs = obj['jobs'].map { |y| flat_job(y) }
    jobs = flat_jobs .map { |name, _| Job.new name }
    jobs.each do |j|
      _, passed = flat_jobs.find { |n, _| n == j.name }
      j.passed = passed.map { |n| jobs.find { |ej| ej.name == n } }
    end
    jobs
  end

  def flat_job(yaml)
    name = yaml['name']
    plan = yaml['plan'] || []
    passed = plan.flat_map { |s| s['passed'] }.compact
    [name, passed]
  end
end

class Job
  attr_accessor :name, :passed

  def initialize(name)
    @name = name
  end
end
