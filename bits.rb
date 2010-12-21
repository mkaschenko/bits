class Bits < Sinatra::Base
  get '/' do
    haml :index
  end

  post '/' do
    if valid_probability?
      simulator = Simulator.new(params['probability'])
      results = simulator.do
      @graph = Graph.new(results)
    end
    haml :index  
  end
end