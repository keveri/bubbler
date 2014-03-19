require_relative "bubble"

class BubbleGraph
  attr_reader :name, :data

  def initialize args
    @name = args[:name]
    @data = args[:data]
  end

  def to_json options={}
    self.as_d3_hash.to_json
  end

  def as_d3_hash
    { children: @data }
  end

end
