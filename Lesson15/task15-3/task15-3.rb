 # encoding: utf-8

class Sensor
  private
  def self.get_temp
  end

  def self.temp_over99?
  end

  def self.overheat?
  end

  def self.signalize
    #beep-beep
  end
end

class Controller
  def initialize
    @button_pushed = button_pushed?
    @overheat = Sensor.overheat?
  end

  def button_push
    abort "Button already pushed" if self.button_pushed?

    @button_pushed = true
    @overheat = Sensor.overheat?

    unless @overheat
      Heater.start_heating
      until sleep 3; Sensor.temp_over99?
        self.button_release
        Heater.stop_heating
      end
    else
      self.button_release
      Sensor.get_temp
      Sensor.signalize
    end
  end

  def button_release
    @button_pushed = false
  end

  def button_pushed?
    @button_pushed
  end
end

class Heater
  private
  def self.start_heating
  end

  def self.stop_heating
  end
end
