class Frame
  RANDOM_MIDDLE = 0.5

  def initialize(probability, length)
    @probability = probability
    @length      = length
    @bad_bits    = 0 
  end

  def simulate!
    half_probability = @probability / 2
    interval = (RANDOM_MIDDLE - half_probability)..(RANDOM_MIDDLE + half_probability)
    @length.times { @bad_bits += 1 if interval.include? rand }
  end

  def bad?
    @bad_bits > 1
  end
end
