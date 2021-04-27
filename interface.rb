require 'csv'

FILENAME = 'gifts.txt'
CSV_OPTIONS = { col_sep: ',', quote_char: '"', headers: :first_row }


gifts = []

def list(gifts)
  puts "-" * 40
  gifts.each_with_index do |gift, index|
    puts "#{index + 1} - #{gift}"
  end
  puts "-" * 40
end

def add(gifts)
  puts "Add a new gift:"
  gift = gets.chomp
  gifts << gift
  list(gifts)
end

def delete(gifts)
  list(gifts)
  puts "Enter gift index to delete: "
  index = gets.chomp.to_i - 1
  gifts.delete_at(index)
  list(gifts)
end

# 1. Welcome
puts "Welcome"
loop do
  # 2. Display menu (list / add / delete / mark )
  puts "Which action [list|add|delete|quit]?"
  # 3. Get user action
  action = gets.chomp
  # 4. Perform the right action
  case action
  when "list"
    list(gifts)
  when "add"
    add(gifts)
  when "delete"
    delete(gifts)
  when "quit"
    break
  else
    puts "comando nao e valido"
  end
end
puts "good bye"
