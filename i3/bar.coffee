#!/usr/bin/env coffee

fs   = require 'fs'
http = require 'http'
{exec} = require 'child_process'
HOME = process.env.HOME

Color =
  red:    '#ff0000'
  pink:   '#ffdddd'
  yellow: '#ffff00'
  orange: '#ff9020'
  white:  '#ffffff'
  gray:   '#888888'
  blue:   '#aaffff'

futa = (x) -> if x < 10 then ('0' + x) else x

ofday = (w) ->
  ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][w]

date = ->
  now = new Date()
  y   = now.getFullYear()
  m   = futa now.getMonth() + 1
  d   = futa now.getDate()
  w   = ofday now.getDay()
  hr  = futa now.getHours()
  min = futa now.getMinutes()
  sec = futa now.getSeconds()
  "#{y}/#{m}/#{d}(#{w}) #{hr}:#{min}:#{sec}"

battery = do ->
  time = 0
  result = ''
  color = Color.yellow
  plug = ""

  ->
    if (not result) or (++time % 10 == 0)
      exec 'acpi', (err, ou) ->
        return if err
        remain = parseInt ou.match(/(\d+)%/)[1], 10
        remaining_time = ou.match(/\d\d:\d\d:\d\d/)
        is_charging = ou.indexOf('Charging') isnt -1
        colr = switch
          when is_charging then Color.yellow
          when remain > 14 then Color.orange
          else Color.red
        result = if is_charging or (remain is 100) or (remaining_time is null)
          "#{plug} #{remain}%"
        else
          "#{plug} #{remain}% #{remaining_time}"
        color = colr
    [result, color]

k2c = (k) -> (Math.floor (k - 273.15) * 10) / 10

tenki_icon = (msg) ->
  switch msg
    when 'Rain'   then ' '
    when 'Clouds' then ' '
    when 'Sun'    then ' '
    when 'Clear'  then ' '
    else msg

tenki = do ->
  result = ''
  time = 0
  # url = 'http://api.openweathermap.org/data/2.5/weather?q=Takarazuka,jp'
  # openweathermap
  #   My account is cympfh:h********
  #   and my API key is cc78d27e7519b67719a1121d90e67426
  #   below url contains "example" API key
  url = 'http://api.openweathermap.org/data/2.5/weather?id=1850147&appid=bd82977b86bf27fb59a04b61b657fb6f'
  update = ->
    http.get url, (res) ->
      data = ''
      res.on 'error', (->)
      res.on 'data', (frag) -> data += frag
      res.on 'end', ->
        try
          w = JSON.parse data
        catch
          return
        fs.writeFileSync '/tmp/w.json', data
        result = tenki_icon(w.weather[0].main) + " " + k2c(w.main.temp) + "°C " + w.main.pressure + "hPa"
  ->
    time = (time + 1) % 600
    if (result is '') or (time is 0)
      do update
    return result

process.on 'uncaughtException', (->)

cal = do ->
  time = 0
  CALENDAR_HOME = "#{HOME}/Dropbox/calendar/"
  icon = ""
  result = ''
  update = ->
    c = "cd #{CALENDAR_HOME}; calendar -A22 | grep -v \\* | sort -R | head -n1"
    exec c, (err, out) ->
      throw err if err
      result = out.trim().replace(/\t/g, ' ')
  ->
    if (not result) or (time is 0)
      do update
    time = (time + 1) % 30
    "#{icon}  #{result}"

twitter = do ->
  time = -1
  res = "@twitter"
  twurl = "#{HOME}/Tools/twurl/bin/twurl"
  ->
    time = (time + 1) % 8
    if time is 0
      exec "#{twurl} accounts | grep -B1 default | head -1", (err, out) ->
        throw err if err
        res = '@' + out.trim()
    return res

do ->
  console.log '{"version":1}'
  console.log '['
  console.log '[],'

  show = (text, col = Color.gray, others={}) ->
    ret =
      full_text: text
      color: col
      separator: false
    for key of others
      ret[key] = others[key]
    return ret

  iter = (interval) ->
    line = []
    #line.push show cal(), Color.white, {min_width:1000}
    line.push show tenki()
    # line.push show ' '
    do ->
      res = battery()
      if res[1]
        line.push show res[0], res[1]
        # line.push show ' '
    line.push show date(), Color.white
    # line.push show ' '
    line.push show twitter(), Color.blue

    console.log '%j,', line
    setTimeout iter, interval, interval

  iter 1000

