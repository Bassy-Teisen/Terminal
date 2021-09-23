require 'timers'

timers = Timers::Group.new

five_second_timer = timers.after(5) { puts "Take five" }

every_five_seconds = timers.every(5) { puts "Another 5 seconds" }

loop { timers.wait }