require "printer"
require "stringio"

describe Printer do
  it "prints out the line counts to the assigned output" do
    output = double("output")
    allow(output).to receive(:puts)
    counts = { "john" => 2, "jane" => 1 }
    printer = Printer.new(counts: counts, output: output)

    printer.print

    expect(output).to have_received(:puts).with("2 John")
    expect(output).to have_received(:puts).with("1 Jane")
  end
end
