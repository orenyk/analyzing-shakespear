require './lib/downloader'
require './lib/parser'
require './lib/counter'
require './lib/printer'

play = Downloader.new("macbeth").download
speeches = Parser.new(play: play).parse
Printer.new(counts: Counter.new(speeches: speeches).count).print
