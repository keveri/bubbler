require "bubbler/version"
require "bubbler/bubble_data_collector"
require "bubbler/page"

module Bubbler

  def self.create_html_file args
    File.write("index.html", html(args))
  end

  def self.html args
    graphs = graphs_from_config(args[:config])
    Page.html(graphs: graphs, file: "index.html", template: args[:template])
  end
  
  def self.json args
    graphs_from_config(args[:config]).to_json
  end

  private

  def self.graphs_from_config config
    config["graphs"].map do |g|
      BubbleDataCollector.new_from_json(g, config["app_folder"]).create_graph
    end
  end

end
