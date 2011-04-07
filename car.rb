require 'rubygems'
require 'serialport'

class Car
  attr_accessor :device, :serial_port

  def initialize(device)
    @device = device
  end
  
  def drive x,y
    range = -100..100
    x = x.to_i
    y = y.to_i

    x = (x < 0 && x < range.begin) ? -100 : x
    x = (x > 0 && x > range.end)   ?  100 : x

    y = (y < 0 && y < range.begin) ? -100 : y
    y = (y > 0 && y > range.end)   ?  100 : y

    puts [x,y].inspect
    #serial_port.write "X#{x}Y#{y}$"
    serial_port.write "$X#{x * 3}Z"
    serial_port.write "$Y#{y * 3}Z"
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
    @serial_port = SerialPort.new('/dev/tty.usbserial-A700dY3T', 115200)
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
