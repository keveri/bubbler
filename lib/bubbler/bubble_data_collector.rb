require_relative "bubble_graph"

class BubbleDataCollector

  def initialize args
    @group     = args[:group]
    @path      = args[:path]
    @match     = args[:match]
    @recursive = args.fetch(:recursive, false)
  end

  def self.new_from_json json, base_path
    base_path << '/' if base_path[-1] != '/'
    new(group: json["group"], path: base_path + json["path"],
        match: json["match"], recursive: json["recursive"])
  end

  def create_graph
    files = collect_files(@path, @match, @recursive)
    bubbles = create_bubbles_from_files(files, @path)
    BubbleGraph.new(name: @group, data: bubbles)
  end

  private

  def create_bubbles_from_files files, path
    files.map do |f|
      lc = count_lines(path + f)
      Bubble.new(name: File.basename(f), path: f, line_count: lc)
    end
  end

  def collect_files path, match, recursive
    finder = recursive ? "**/#{match}" : match
    Dir.chdir(path) { Dir[finder] }
  end

  def count_lines file
    %x{sed -n '=' #{file} | wc -l}.to_i
  end
end
