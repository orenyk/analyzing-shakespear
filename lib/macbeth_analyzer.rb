require "nokogiri"
require "open-uri"

class MacbethAnalyzer
  DEFAULT_SOURCE = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
  attr_reader :source

  def initialize(source = open(DEFAULT_SOURCE))
    @source = source
  end

  def run
    doc = Nokogiri::XML(@source)
    out = {}

    doc.xpath("//SPEECH").each_with_object(out) do |speech, hash|
      speaker = speech.css("SPEAKER/text()").to_s
      next if speaker == "ALL"

      hash[speaker] = hash[speaker] || 0
      speech.css("LINE").each { |_| hash[speaker] += 1 }
    end
  end
end
