class Finder
  def initialize(reader)
    @reader = reader
  end

  def find(path)
    jobs = @reader.read_jobs(path)
    first_loop = jobs
                 .map { |j| in_loop?(j, []) }
                 .reject(&:empty?)
                 .first || []
    first_loop.reverse
  end

  def in_loop?(job, visited)
    return [] if job.passed.empty?
    return [job.name] if visited.include? job.name

    visited.push job.name
    looped_jobs = job
                  .passed
                  .map { |p| in_loop?(p, visited) }
                  .reject(&:empty?)
                  .first
    if looped_jobs.nil?
      []
    else
      looped_jobs.push job.name
    end
  end
end
