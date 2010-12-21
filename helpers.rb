class Bits
  helpers do
    def error_messages
      capture_haml { haml_tag :div, @message } if @message
    end

    def chart
      if @graph
        capture_haml do
          haml_tag :div do
            haml_tag :img, :src => @graph.path, :alt => 'chart'
          end
        end
      end
    end
  end
end