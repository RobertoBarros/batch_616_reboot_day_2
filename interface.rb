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
    puts "Lista de presentes"
  when "add"
    puts "adicionar presentes"
  when "delete"
    puts "deletando presente"
  when "quit"
    puts "good bye"
    break
  else
    puts "comando nao e valido"
  end
end
