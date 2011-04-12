require 'rubygems'
require 'serialport'

class Car
  attr_accessor :device, :serial_port, :speed

  def initialize(device, speed = 115200)
    @device = device
    @speed = speed
  end

  def drive x,y
    range = -70..70
    x = x.to_i
    y = y.to_i

    x = (x < 0 && x < range.begin) ? -70 : x
    x = (x > 0 && x > range.end)   ?  70 : x

    y = (y < 0 && y < range.begin) ? -70 : y
    y = (y > 0 && y > range.end)   ?  70 : y

    puts [x,y].inspect
    #serial_port.write "X#{x}Y#{y}$"
    serial_port.write "$X#{x}Z"
    serial_port.write "$Y#{y}Z"
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
    @serial_port = SerialPort.new(device, @speed)
  end

  def multiplier
    1
  end
end

if __FILE__ == $0
  c = Car.new('/dev/rfcomm0')
end
