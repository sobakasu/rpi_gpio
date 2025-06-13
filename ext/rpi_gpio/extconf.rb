require 'mkmf'

$LOAD_PATH.unshift(File.expand_path(__dir__))
require 'munge'

puts "munging source"
RpiSourceMunger.new(path: File.expand_path(__dir__)).call
create_makefile 'rpi_gpio/rpi_gpio'
