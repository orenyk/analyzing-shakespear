require "spec_helper.rb"
require "./lib/macbeth_analyzer.rb"

RSpec.describe MacbethAnalyzer do
  context "DEFAULT_SOURCE" do
    it "is equal to the ibiblio URL" do
      expect(MacbethAnalyzer::DEFAULT_SOURCE).to \
        eq("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml")
    end
  end

  context "#run" do
    before(:all) { @dummy_play = File.read("./spec/fixtures/dummy_play.xml") }

    it "returns a hash of speaker names to their line counts" do
      m = MacbethAnalyzer.new(@dummy_play)
      out = m.run

      expect(out["Player 1"]).to eq(2)
      expect(out["Player 2"]).to eq(2)
    end

    it "does not process the 'ALL' speaker" do
      m = MacbethAnalyzer.new(@dummy_play)
      out = m.run

      expect(out["ALL"]).to be_nil
    end
  end
end
