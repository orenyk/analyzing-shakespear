require "counter"

describe Counter do
  it "counts the number of lines for each speaker" do
    speeches = { "John" => ["Line 1", "Line 2"],
                 "Jane" => ["Only one line"] }
    counter = Counter.new(speeches: speeches)

    result = counter.count

    expect(result["John"]).to eq(2)
    expect(result["Jane"]).to eq(1)
  end
end
