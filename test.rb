puts "Lütfen adınızı ve soyadınızı giriniz: "
adsoyad = gets.to_s

puts "Lütfen doğum tarihinizi 'gün,ay,yıl' şeklinde giriniz: "
girdi = gets.chomp

gun, ay, yil = girdi.split(".")
t = Time.local(yil, ay, gun)
simdi = Time.now

fark = simdi - t
kac_gun_oldu = (fark/86400).round
yas = (kac_gun_oldu/365).round

case
    when t.sunday?    then gun = "Pazar"
    when t.monday?    then gun = "Pazartesi"
    when t.tuesday?   then gun = "Sali"
    when t.wednesday? then gun = "Çarşamba"
    when t.thursday?  then gun = "Perşembe"
    when t.friday?    then gun = "Cuma"
    when t.saturday?  then gun = "Cumartesi"
    else      gun = "Böyle bir gün yoktur"

end

puts "Merhaba #{adsoyad}"
puts "Sen doğalı tam #{kac_gun_oldu} gün geçti"
puts "Yaşın şuan #{yas} ve #{gun} günü doğdun."