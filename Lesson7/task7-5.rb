# encoding: utf-8

shop_list = ["масло", "молоко", "хлопья", "картошка", "курица", "помидоры"]

puts "Нужно купить: \n#{shop_list}"

until shop_list.empty? do
  puts "\nЧто вы купили?"

  buy = gets.chomp.strip.downcase

  until shop_list.include?(buy)
    puts "Такого товара нет в списке!"
    buy = gets.chomp.strip.downcase
  end

  shop_list.delete(buy)

  puts "\nНужно еще купить: \n#{shop_list}" unless shop_list.empty?
end

puts "\nВы купили всё."
