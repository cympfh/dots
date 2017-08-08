#!/usr/bin/ruby

require 'json'

#
# helpers
#

def write(obj)
  STDOUT.puts JSON.dump(obj) + ","
  STDOUT.flush
end

Color = {
  red:    '#ff0000',
  pink:   '#ffdddd',
  yellow: '#ffff00',
  orange: '#ff9020',
  white:  '#ffffff',
  gray:   '#888888',
  blue:   '#aaffff'
}

#
# main commands
#

def get_date
  `LANG=en date "+%Y-%m-%d(%a)%H:%M"`.chomp
end

def get_tenki
  def k2c(k)
    ((k - 273.15).floor * 10) / 10
  end
  def tenki_icon(msg)
    case msg
    when 'Rain'   then ' '
    when 'Clouds' then ' '
    when 'Sun'    then ' '
    when 'Clear'  then ' '
    else msg
    end
  end
  # openweathermap
  #   My account is cympfh:h********
  #   and my API key is cc78d27e7519b67719a1121d90e67426
  #   below url contains "example" API key
  w = JSON.parse `curl -s "http://api.openweathermap.org/data/2.5/weather?id=1850147&appid=cc78d27e7519b67719a1121d90e67426"`.chomp
  "#{tenki_icon(w['weather'][0]['main'])}  #{k2c(w['main']['temp'])}°C #{w['main']['pressure']}hPa"
end

def get_battery
  battery_icons = ['', '', '', '', '']
  result = `acpi`.chomp
  remain = result.match(/[0-9]*%/)[0].to_i
  icon = battery_icons[ [remain, 99].min / 20 ]
  is_charging = result.match(/Charging/)
  ["#{icon} #{remain}%", is_charging]
end

#
# JSON streaming
#

puts <<EOM
{"version": 1}
[[],
EOM

date = ""
tenki = ""
battery = ""
is_charging = false

cx = 0
loop do
  cx = (cx + 1) % 100000

  columns = []

  if cx % 300 == 1
    tenki = get_tenki
  end
  columns << {full_text: tenki, color: Color[:gray], separator: false}

  if cx % 10 == 2
    battery, is_charging = get_battery
  end
  columns << {full_text: battery, color: is_charging ? Color[:yellow] : Color[:orange], separator: false}

  date = get_date
  columns << {full_text: date, color: Color[:gray], separator: false}

  write columns
  sleep 1
end
