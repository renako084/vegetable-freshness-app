# 正規の野菜名リスト以外かつstocksから参照されていないデータを削除
valid_names = [
  "にんじん", "たまねぎ", "じゃがいも", "ブロッコリー", "ほうれん草",
  "トマト", "きゅうり", "ピーマン", "なす", "キャベツ",
  "レタス", "もやし", "ごぼう", "れんこん", "さつまいも",
  "かぼちゃ", "白菜", "大根", "長ねぎ", "にんにく"
]
Vegetable.where.not(name: valid_names)
         .where.not(id: Stock.select(:vegetable_id))
         .destroy_all
vegetables = [
  { name: "にんじん", shelf_life_days: 14 },
  { name: "たまねぎ", shelf_life_days: 30 },
  { name: "じゃがいも", shelf_life_days: 30 },
  { name: "ブロッコリー", shelf_life_days: 5 },
  { name: "ほうれん草", shelf_life_days: 4 },
  { name: "トマト", shelf_life_days: 7 },
  { name: "きゅうり", shelf_life_days: 5 },
  { name: "ピーマン", shelf_life_days: 7 },
  { name: "なす", shelf_life_days: 5 },
  { name: "キャベツ", shelf_life_days: 14 },
  { name: "レタス", shelf_life_days: 5 },
  { name: "もやし", shelf_life_days: 3 },
  { name: "ごぼう", shelf_life_days: 14 },
  { name: "れんこん", shelf_life_days: 7 },
  { name: "さつまいも", shelf_life_days: 30 },
  { name: "かぼちゃ", shelf_life_days: 30 },
  { name: "白菜", shelf_life_days: 14 },
  { name: "大根", shelf_life_days: 14 },
  { name: "長ねぎ", shelf_life_days: 7 },
  { name: "にんにく", shelf_life_days: 30 },
]

vegetables.each do |v|
  Vegetable.find_or_create_by(name: v[:name]) do |vegetable|
    vegetable.shelf_life_days = v[:shelf_life_days]
  end
end

puts "野菜マスターデータを#{vegetables.count}件登録しました"