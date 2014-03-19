require "mustache"
require_relative "default_template"

class Page < Mustache
  attr_reader :names, :graphs
  
  def initialize args
    @names    = graph_names(args[:graphs])
    @graphs   = graph_data(args[:graphs])
  end

  def self.html args
    page = new(args)
    page.template = find_template(args.fetch(:template, "default"))
    page.render
  end

  private

  def graph_names graphs
    graphs.map { |g| { text: g.name.upcase, id: g.name } }
  end

  def graph_data graphs
    graphs.map { |g| { name: g.name, json: g.to_json } }
  end

  def self.find_template template
    template == "default" ? default_template : template
  end

  def self.default_template
    DEFAULT_TEMPLATE
  end

end
