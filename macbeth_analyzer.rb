require "./lib/macbeth_analyzer.rb"

MacbethAnalyzer.new.run.each do |speaker, count|
  puts "#{count} #{speaker}"
end
