class Simulator
  MIN_FRAME_LENGTH    = 48  # минимальная длина кадра
  MAX_FRAME_LENGTH    = 100 # максимальная длина кадра
  WINDOW_SIZE         = 10  # размер окна
  QUANTITY_FRAMES     = 55  # количество кадров для эксперимента
  SERVICE_INFORMATION = 48  # служебная часть кадра

  def initialize(probability)
    @probability = probability.to_f
    @results     = []
  end

  def do
    (MIN_FRAME_LENGTH..MAX_FRAME_LENGTH).each do |length|
      sent_frames = 0
      good_frames = 0

      begin
        counter = 0
        bad_frame_number = nil

        WINDOW_SIZE.times do
          frame = Frame.new(@probability, length)
          frame.simulate!
          counter += 1
          sent_frames += 1
          bad_frame_number ||= counter if frame.bad?
          break if sent_frames == QUANTITY_FRAMES
        end

        good_frames += bad_frame_number ? bad_frame_number - 1 : counter
      end until sent_frames == QUANTITY_FRAMES
      @results << [length, (length - SERVICE_INFORMATION) * good_frames * 100 / (length * sent_frames)]
    end

    @results
  end
end