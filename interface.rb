require 'csv'

FILENAME = 'gifts.csv'
CSV_OPTIONS = { col_sep: ',', quote_char: '"', headers: :first_row }


gifts = []

def save(gifts)
  CSV.open(FILENAME, 'wb', CSV_OPTIONS) do |csv| #WB APAGA O ARQUIVO, salvando novamente.
    # We had headers to the CSV
    csv << ['name', 'bought']
    #TODO: store each gift
    gifts.each do |gift|
      csv << [gift[:name], gift[:bought]]
    end
  end
end

def load(gifts)
  CSV.foreach(FILENAME, CSV_OPTIONS) do |row|
    # TODO: build new gift from information stored in each row
    name = row['name']
    bought = row['bought'] == 'true'
    gifts << {name: name, bought: bought}
  end
end

def list(gifts)
  puts "-" * 40
  gifts.each_with_index do |gift, index|
    mark = gift[:bought] ? "[X]" : "[ ]" 
    puts "#{index + 1} - #{mark} #{gift[:name]}"
  end
  puts "-" * 40
end

def add(gifts)
  puts "Add a new gift:"
  name = gets.chomp
  gifts << {name: name, bought: false}
  save(gifts) #salvar todos os dados adicionados pelo usuario a lista.
  list(gifts)
end

def delete(gifts)
  list(gifts)
  puts "Enter gift index to delete: "
  index = gets.chomp.to_i - 1
  gifts.delete_at(index)
  save(gifts)
  list(gifts)
end

def mark(gifts)
  list(gifts)
  puts "Enter gift index to mark: "
  index = gets.chomp.to_i - 1
  gift = gifts[index]
  gift[:bought] = true
  save(gifts)
  list(gifts)
end

load(gifts) #carregar todos os dados salvos, sem o load sua lista permanecera vazia.
# 1. Welcome
puts "Welcome"
loop do
  # 2. Display menu (list / add / delete / mark )
  puts "Which action [list|add|delete|mark|quit]?"
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
  when "mark"
    mark(gifts)
  when "quit"
    break
  else
    puts "comando nao e valido"
  end
end
puts "good bye"
