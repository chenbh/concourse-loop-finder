class Finder
  def initialize(reader)
    @reader = reader
  end

  def find(path)
    jobs = @reader.read_jobs(path)
    jobs[0].passed.include? jobs[0].name
  end

  def in_loop?(job)
  end
end
