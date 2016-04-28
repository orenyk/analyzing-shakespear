require "net/http"

class Downloader
  BASE_URL = "http://www.ibiblio.org/xml/examples/shakespeare/*.xml"

  def initialize(play_str)
    @url = BASE_URL.gsub("*", play_str)
  end

  def download
    Net::HTTP.get(URI.parse(@url))
  end
end
