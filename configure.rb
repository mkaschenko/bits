class Bits
  configure do
    require 'helpers'
    Dir.glob('lib/*.*').each { |file| require file }
  end
end
