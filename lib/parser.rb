require "nokogiri"

class Parser
  def initialize(play:)
    @play = play
  end

  def parse
    xml = Nokogiri::XML(@play)
    xml.xpath("//SPEECH").each_with_object({}) do |speech, output|
      speaker = speech.css("SPEAKER/text()").to_s
      next if speaker == "ALL"
      output[speaker.downcase] ||= []
      speech.css("LINE").map { |l| output[speaker.downcase] << l.text }
    end
  end
end
