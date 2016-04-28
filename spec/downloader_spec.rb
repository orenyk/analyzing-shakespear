require "downloader.rb"

describe Downloader do
  it "downloads a copy of the desired Shakespeare file" do
    body = "<xml></xml>"
    stub_request(:get, "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml").
      to_return(body: body)
    downloader = Downloader.new("macbeth")

    expect(downloader.download).to eq(body)
  end
end
