class Printer
  def initialize(counts:, output: $stdout)
    @counts = counts
    @output = output
  end

  def print
    @counts.each { |speaker, count| puts(@output, "#{speaker}\t#{count}") }
  end
end
