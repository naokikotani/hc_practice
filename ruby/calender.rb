require 'optparse'
require 'date'

options = { month: nil }
WEEKDAYS = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
SPACES = ['                  ', '', '   ', '      ', '         ', '            ', '               '].freeze

OptionParser.new do |opts|
  opts.on('-m [MONTH]', Integer) {|m| options[:month] = m }
end.parse!

month = options[:month] || Date.today.month

unless month.between?(1, 12)
  puts "#{month} is neither a month number (1..12) nor a name"
  exit
end

def format_days(days_ary, remainder)
  days_ary.map do |day|
    if day % 7 == remainder
      "#{day.to_s.rjust(2)}\n"
    else
      "#{day.to_s.rjust(2)} "
    end
  end.join()
end

beginning_of_month = Date.new(2023, month, 1)
days_ary = (1..beginning_of_month.next_month.prev_day.day).to_a

calender = SPACES[beginning_of_month.wday] + format_days(days_ary, (8 - beginning_of_month.wday) % 7)

result = "   #{beginning_of_month.strftime("%B")} 2023
#{['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'].join(' ')}
#{calender}
"

puts result
