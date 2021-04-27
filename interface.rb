gifts = %w[perfume carro café\ oppa celular relógio viagem meia]

def list(gifts)
  gifts.each_with_index do |gift, index|
    puts "#{index + 1} - #{gift}"
   end 
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
    puts "adicionar presentes"
  when "delete"
    puts "deletando presente"
  when "quit"
    break
  else
    puts "comando nao e valido"
  end
end
puts "good bye"
