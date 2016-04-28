require "printer"
require "stringio"

describe Printer do
  it "prints out the line counts to the assigned output" do
    output = double("output")
    allow(output).to receive(:puts)
    counts = { "John" => 2, "Jane" => 1 }
    printer = Printer.new(counts: counts, output: output)

    printer.print

    expect(output).to have_received(:puts).with("John\t2")
    expect(output).to have_received(:puts).with("Jane\t1")
  end
end
