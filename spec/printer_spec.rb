require "printer"
require "stringio"

describe Printer do
  it "prints out the line counts to the assigned output" do
    output = StringIO.new
    counts = { "John" => 2, "Jane" => 1 }
    printer = Printer.new(counts: counts, output: output)

    printer.print
    output.seek(-100, IO::SEEK_END)

    expect(output.readline).to eq("John\t2")
  end
end
