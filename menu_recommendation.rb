# frozen_string_literal: true

class MenuRecommendation
  attr_accessor :main_dishes, :side_dishes, :staple_food, :entrees

  def initialize
    @staple_food = {
      '1' => '米',
      '2' => '麺',
      '3' => 'パン'
    }

    @main_dishes = {
      '米' => %w[寿司 カレー 親子丼 白米 焼き鳥丼 天ぷら丼],
      '麺' => %w[ラーメン パスタ うどん ざるそば 焼きそば 坦々麺],
      'パン' => %w[サンドイッチ トースト ハンバーガー フレンチトースト ホットドッグ エッグベネディクト]
    }

    @side_dishes = {
      '米' => %w[ひじきの煮物 おひたし 厚焼き卵 漬物 わかめスープ 高菜],
      '麺' => %w[ギョーザ 餃子 春巻き 冷やしトマト キムチ ベビーリーフサラダ],
      'パン' => %w[ポテトサラダ コールスロー オニオンスープ グリル野菜 ベーコンエッグ フルーツ]
    }

    @entrees = {
      '米' => %w[サラダ ミソスープ 鳥の唐揚げ 揚げ出し豆腐 刺身 お吸い物],
      '麺' => %w[サラダ 和風スープ 春巻き エビチリ 揚げパン 肉じゃが],
      'パン' => %w[サラダ クリームスープ フライドチキン スクランブルエッグ チーズプレート ローストビーフ]
    }
  end

  def ask_staple_food
    puts "主食を選択してください\n\n1: 米\n2: 麺\n3: パン\n\n入力を受け付けています:"
    user_input = gets.chomp
    until @staple_food.keys.include?(user_input)
      puts '入力は 1, 2, 3 のどれかを選択してください'
      user_input = gets.chomp
    end
    @staple_food[user_input]
  end

  def recommend_menu(staple)
    main = @main_dishes[staple].sample
    side = @side_dishes[staple].sample
    entree = @entrees[staple].sample
    puts "\n今日の献立:\nメイン: #{main}\n主菜: #{entree}\n副菜: #{side}"
    feedback(staple)
  end

  def feedback(staple)
    puts "\nこの献立に満足しましたか?\n1: 満足\n2: 他にする"
    user_feedback = gets.chomp
    while user_feedback != '1' && user_feedback != '2'
      puts '入力は 1 または 2 を選択してください'
      user_feedback = gets.chomp
    end
    if user_feedback == '2'
      recommend_menu(staple)
    else
      puts "\nお役に立ててうれしいです。良い食事を！"
    end
  end
end

menu = MenuRecommendation.new
staple = menu.ask_staple_food
menu.recommend_menu(staple)
