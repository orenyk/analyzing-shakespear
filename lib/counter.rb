class Counter
  def initialize(speeches:)
    @speeches = speeches
  end

  def count
    @speeches.reduce({}) { |c, (k, v)| c.merge( k => v.length) }
  end
end
