class Printer
  def initialize(counts:, output: $stdout)
    @counts = counts.sort_by { |s, c| c }.reverse!
    @output = output
  end

  def print
    @counts.each { |s, c| @output.puts("#{c} #{s.capitalize}") }
  end
end
