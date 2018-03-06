require 'smalrubot'

#Arudino Sensor Input Lib
#Button1, Button2
#Tilt, Sound, Light
class Controller
    def initialize(board)
      @board = board
    end

    #Button1
    def get_sw1
        return @board.digital_read(5)
    end

    #Button2
    def get_sw2
        return @board.digital_read(6)
    end

    #Tilt Sensor
    def get_tilt
        return @board.analog_read(3)
    end

    #Sound Sensor
    def get_sound
        return @board.analog_read(2)
    end

    #Light Sensor
    def get_light
        return @board.analog_read(1)
    end

    def get_input
        if (@board.digital_read(5) | @board.digital_read(6)) != 0 then
            return true
        else
            return false
        end
    end

    def secret_input
        if @board.digital_read(5) == 1 &&  @board.digital_read(6) == 1 then
            return true
        else
            return false
        end
    end
end
