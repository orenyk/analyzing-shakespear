require "parser"
require "support/fake_macbeth"

describe Parser do
  it "parses out speakers and speeches from an XML file" do
    speeches = [Speech.new(speaker: "john", lines: ["Hello", "My name is"])]
    play = FakeMacbeth.generate(speeches: speeches)
    parser = Parser.new(play: play)

    result = parser.parse

    expect(result["john"]).to eq(["Hello", "My name is"])
  end

  it "works with multiple speeches for the same speaker" do
    speeches = [Speech.new(speaker: "john", lines: ["My first speech"]),
                Speech.new(speaker: "john", lines: ["Speech 2", "Line 2"])]
    play = FakeMacbeth.generate(speeches: speeches)
    parser = Parser.new(play: play)

    result = parser.parse

    expect(result["john"]).to eq(["My first speech", "Speech 2", "Line 2"])
  end

  it "skips speeches by 'ALL'" do
    speeches = [Speech.new(speaker: "ALL", lines: ["This line is ignored"])]
    play = FakeMacbeth.generate(speeches: speeches)
    parser = Parser.new(play: play)

    result = parser.parse

    expect(result["ALL"]).to be_nil
  end

  it "downcases the speaker name" do
    speeches = [Speech.new(speaker: "John", lines: ["Hello"])]
    play = FakeMacbeth.generate(speeches: speeches)
    parser = Parser.new(play: play)

    result = parser.parse

    expect(result["john"]).to eq(["Hello"])
  end

  class Speech
    attr_accessor :speaker, :lines
    def initialize(speaker:, lines:)
      @speaker = speaker
      @lines = lines
    end
  end
end
