puts "じゃんけん..."

def janken_loop
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  
  jankens = ["グー","チョキ","パー","戦わない"]
  play_select= gets.to_i #じゃんけんー自分側
  opponent_select = rand(3) #じゃんけんー相手側
  
  puts "ホイ！"
  puts "---------------"
  puts "あなた:#{jankens[play_select]}を出しました"
  puts "相手：#{jankens[opponent_select]}を出しました"
  puts "---------------"
  
  #じゃんけんー勝敗判定
  @facing_over_there_side = "" #あっち向いてほいの立場
  
  if play_select == opponent_select then
    puts "あいこで..."
    return true
  elsif  (play_select == 0 && opponent_select == 1) || (play_select == 1 && opponent_select == 2) || (play_select == 2 && opponent_select == 0) then
    @facing_over_there_side = "win"
    return false
  else
    @facing_over_there_side = "lose"
    return false
  end
  
end

#あっち向いてホイ
def facing_over_there
  puts "あっち向いて〜"
  puts "0(上)1(下)2(左)3(右)"
  directions = ["上","下","左","右"]
  play_select = gets.to_i #あっち向いてほいー自分側
  opponent_select = rand(4) #あっち向いてほいー相手側
  puts "ホイ！"
  puts "---------------"
  puts "あなた：#{directions[play_select]}"
  puts "相手：#{directions[opponent_select]}"
  puts "---------------"
  
  if @facing_over_there_side == "win" then
    if play_select == opponent_select then
      puts "あなたの勝ちです"
      return false
    else
      puts "じゃんけん..."
      return true
    end
     
  elsif @facing_over_there_side == "lose" then
    if play_select == opponent_select then
      puts "あなたの負けです"
      return false
    else
      puts "じゃんけん..."
      return true
    end
    
  end
  
end

#じゃんけんとあっち向いてほいの両方に勝つ又は負けるまで繰り返す
settlement = true
while settlement do
  #じゃんけんの勝敗が決まるまで繰り返す
  next_facing_over_there = true
  while next_facing_over_there do
    next_facing_over_there = janken_loop
  end
  
  #あっち向いてほい
  settlement = facing_over_there
  
end