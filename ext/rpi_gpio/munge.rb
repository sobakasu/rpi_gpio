class RpiSourceMunger
  SUBSTITUTIONS = [
    [/PyErr_SetString\(PyExc_RuntimeError/, "rb_raise(rb_eRuntimeError"],
    [/PyErr_SetString\(PyExc_ValueError/, "rb_raise(rb_eArgError"],
    ['#include "Python.h"', '#include "ruby.h"'],
    ["Module not imported correctly!", "gem not imported correctly!"],
    ["Please set pin numbering mode using GPIO.setmode(GPIO.BOARD) or GPIO.setmode(GPIO.BCM)",
     "Please set pin numbering mode using RPi::GPIO.set_numbering(:board) or RPi::GPIO.set_numbering(:bcm)"],
    [/Original code by Ben Croston.*Copyright \(c\) \d+\-\d+ Nick Lowery\n*/m, ""],
    [/(Copyright \(c\) \d+\-\d+ Ben Croston)/m, Proc.new { |m, match| m.copyright_text + "\n#{match}" }],
  ]

  attr_reader :path

  def initialize(path:)
    @path = path
  end

  def call
    source_files.each do |file|
      code = File.read(file)
      SUBSTITUTIONS.each do |orig, replace|
        code.gsub!(orig) { |match| replace.is_a?(Proc) ? replace.call(self, match) : replace }
      end
      File.write(file, code)
    end

    remove_python_code
  end

  def remove_python_code
    %w[constants.c
       constants.h
       event_gpio.c
       event_gpio.h
       py_gpio.c
       py_pwm.c
       py_pwm.h
     ].map { |i| File.join(path, i) }.each do |file|
       FileUtils.rm(file) if File.exist?(file) 
     end
  end

  def source_files
    Dir.glob(File.join(path, "*.[ch]"))
  end

  def copyright_text
    File.read(File.join(path, "copyright.txt"))
  end
end

