class Bubble

  def initialize args
    @name       = args[:name]
    @path       = args[:path]
    @line_count = args[:line_count]
  end

  def to_json options={}
    self.as_d3_hash.to_json
  end

  def as_d3_hash
    { name: @name, path: @path, value: @line_count }
  end

end
