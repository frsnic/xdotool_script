# 開心水族箱 撿垃圾腳本

top = [
  [800, 290],
  [830, 290
  [860, 290],
  [890, 290],
  [920, 290],
  [940, 290],
]

bottom = [
  [ 940, 820],
  [ 970, 820],
  [1030, 820],
  [1090, 820],
  [1150, 820],
  #[1210, 820],
]
people_wait_sec = 5

next_serie = [1230, 860]
up_serie = [900, 860]
total_serie = 8

get = [1250, 750]
get_time = 5

home = [880, 820]
discard = [1270, 740]
discard_point = [980, 640]

next_page = [1250, 840]
total_page = 11

def click(point, wait_sec = 2, delay_sec = nil)
  x = point[0]
  y = point[1]
  # puts "click #{x} #{y}"
  %x(xdotool mousemove #{x} #{y})
  unless delay_sec
    %x(xdotool click 1)
  else
    %x(xdotool mousedown 1)
    sleep delay_sec
    %x(xdotool mouseup 1)
  end
  %x(xdotool mousemove 50 220) # terminal
  sleep wait_sec
end

total_page.times do |page|
  total_serie.times do |serie|
    bottom.each do |people|
      click people, people_wait_sec
      top.each do |box|
        click box
        get_time.times do |g|
          click get, 1
        end
      end
    end
    click home, people_wait_sec
    click discard
    click discard_point
    click next_serie, 1, 0.25
    puts serie
  end
  puts "next_page"
  click next_page
  click up_serie, 1, 1
end
