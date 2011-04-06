require 'rubygems'
require 'serialport'

class Car
  attr_accessor :device, :serial_port

  def initialize(device)
    @device = device
  end

  def forward
    serial_port.write "i" * multiplier
  end

  def backward
    serial_port.write "k" * multiplier
  end

  def left
    serial_port.write "j" * multiplier
  end

  def right
    serial_port.write "l" * multiplier
  end

  def serial_port
    @serial_port ||= SerialPort.new(@device, 115200)
  end

  def multiplier
    3
  end
end

if __FILE__ == $0
  c = Car.new('/dev/rfcomm0')
  10.times do
    c.forward
  end
  10.times do
    c.backward
  end
  10.times do
    c.left
  end
  10.times do
    c.right
  end
end
