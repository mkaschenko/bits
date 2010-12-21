class Bits
  def valid_probability?
    @message = if params['probability'].empty?
      'Укажите вероятность'
    elsif (params['probability'] =~ /(^0(\.\d+)?$)|(^1(\.0+)?$)/).nil?
      'Вероятность должна быть 0 ≤ P ≤ 1'
    else
      ''
    end
    @message.empty?
  end
end