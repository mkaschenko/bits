class Graph
  def initialize(results)
    @graph = Gruff::Line.new
    set_options!
    prepare_results(results)
    @graph.write(@image_path)
  end

  def path
    @image_path.sub('public', '')
  end

  private

  def set_options!
    @graph.minimum_value = 0                # минимальное значение по оси Y
    @graph.maximum_value = 100              # максимальное значение по оси Y
    @graph.x_axis_label = 'Длина кадра'     # название по оси X 
    @graph_name = 'Производительность, %'   # название графика
    @image_path = 'public/images/chart.png' # путь к графику
  end
  
  def prepare_results(results)
    data = results.map(&:last)
    @graph.data(@graph_name, data)
    labels = {}
    results.each_with_index { |pair, index| labels[index] = pair.first.to_s if pair.first % 10 == 0 }
    @graph.labels = labels
  end
end