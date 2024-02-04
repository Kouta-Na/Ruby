require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# １か２以外の時、再入力
while memo_type != 1 && memo_type != 2
  p "１か２を入力してください"
  memo_type = gets.to_i
end

puts "拡張子を除いたファイルを入力してください"
file_name = gets.chomp

p "メモしたい内容を記入してください"
p "完了したらCtr + Dをおします"

#新規作成
if memo_type == 1
  CSV.open("#{file_name}.csv", "w", force_quotes: true) do |output|
    text = STDIN.read
    output << ["#{text}"]  
  end
#編集；追記
elsif memo_type == 2
  CSV.open("#{file_name}.csv", "a", force_quotes: true) do |output|
    text = STDIN.read
    output << ["#{text}"]  
  end

end

