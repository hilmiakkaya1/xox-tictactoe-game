lotto_numbers = (1..49).to_a.sample(6)

lotto_numbers.sort!

puts "Sizin için seçilen rastgele 6 adet sayı:"
puts lotto_numbers.join(', ')
