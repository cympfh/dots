#!/usr/bin/ruby

require 'json'

#
# helpers
#

def write(obj)
  STDOUT.puts JSON.dump(obj) + ","
  STDOUT.flush
end

def curl(url)
  `timeout 2 curl -s "#{url}"`.chomp
end

Color = {
  red:    '#ff0000',
  pink:   '#ffdddd',
  yellow: '#ffff00',
  orange: '#ff9020',
  white:  '#ffffff',
  gray:   '#888888',
  blue:   '#aaffff',
  background: '#303030',
}

#
# main commands
#

def get_memo
  memopath = '/tmp/memo'
  if File.exists? memopath
    File.open(memopath).read.chomp.gsub(/[\r\n]/, ' ')
  end
end

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
  response = curl "http://api.openweathermap.org/data/2.5/weather?id=1850147&appid=cc78d27e7519b67719a1121d90e67426"
  return '' if response == ''
  w = JSON.parse response
  icon = tenki_icon(w['weather'][0]['main'])
  "#{icon} #{k2c(w['main']['temp'])}°C #{w['main']['pressure']}hPa"
end

def get_battery
  return ["", false] if `which acpi`.chomp == ""
  battery_icons = ['', '', '', '', '']
  result = `acpi`.chomp
  remain = result.match(/[0-9]*%/)[0].to_i
  icon = battery_icons[ [remain, 99].min / 20 ]
  is_charging = result.match(/Charging/)
  ["#{icon} #{remain}%", is_charging]
end

def get_core_temp
  icon = ''
  temp = `sensors | grep "Core 0" | grep -o '+[0-9\.]*' | head -1 | sed 's/\+//g'`.chomp
  "#{icon} #{temp}°C"
end

#
# JSON streaming
#

puts <<EOM
{"version": 1}
[[],
EOM

memo = nil
date = ""
tenki = ""
battery = ""
is_charging = false
core_temp = ""

separator = {separator: true, separator_block_width: 20}

cx = 0
loop do
  cx = (cx + 1) % 100000
  columns = []

  if cx % 5 == 3
    memo = get_memo
  end
  if memo != nil
    columns << {full_text: "[#{memo}]", color: Color[:yellow]}.merge(separator)
  end

  if cx % 300 == 1
    tenki = get_tenki
  end
  columns << {full_text: tenki, color: Color[:gray]}.merge(separator)

  if cx % 10 == 2
    battery, is_charging = get_battery
  end
  columns << {full_text: battery, color: is_charging ? Color[:yellow] : Color[:orange]}.merge(separator)

  if cx % 10 == 4
    core_temp = get_core_temp
  end
  columns << {full_text: core_temp, color: Color[:red]}.merge(separator)

  date = get_date
  columns << {full_text: date, color: Color[:gray]}.merge(separator)

  write columns
  sleep 1
end
