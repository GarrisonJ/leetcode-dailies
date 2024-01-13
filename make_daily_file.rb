require 'date'

current_date = Date.today.strftime('%d-%m-%Y')

arguments = ARGV.join(' ')

filename = "#{current_date} #{arguments}.rb"

puts filename

File.open(filename, 'w') {}
