require 'date'

return puts "#{ARGV[2]} is neither a month number (1..12) nor a name" unless ARGV[2].to_i.between?(1, 12) || ARGV[2] == nil

beginning_of_month = ARGV[2] == nil ? Date.new(2023, Date.today.month, 1) : Date.new(2023, ARGV[2].to_i, 1)
ending_of_month = ARGV[2] == nil ? Date.new(2023, Date.today.month, -1) : Date.new(2023, ARGV[2].to_i, -1)
days_ary = (1..ending_of_month.day).to_a

def date_formatting(days_ary, remainder)
  result = days_ary.map do |day|
    if day % 7 == remainder
      day.to_s.length == 1 ? " #{day}\n" : "#{day}\n"
    elsif day.to_s.length == 1
      " #{day} "
    else
      "#{day} "
    end
  end

  result.join()
end

case beginning_of_month.wday
when 0
  hoge = "                  " + date_formatting(days_ary, 1)
when 1
  hoge = "" + date_formatting(days_ary, 0)
when 2
  hoge = "   " + date_formatting(days_ary, 6)
when 3
  hoge = "      " + date_formatting(days_ary, 5)
when 4
  hoge = "         " + date_formatting(days_ary, 4)
when 5
  hoge = "            " + date_formatting(days_ary, 3)
when 6
  hoge = "               " + date_formatting(days_ary, 2)
else
  return
end

result = "   #{beginning_of_month.strftime("%B")} 2023
Mo Tu We Th Fr Sa Su
#{hoge}
"

puts(result)