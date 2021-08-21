class GamesController

  def battle(**params)
    brave = params[:brave]
    monster = params[:monster]

    EXP_CONSTANT = 2
    GOLD_CONSTANT = 3

    loop do
      @brave.attack(@monster)
      break if battle_end?
      @monster.attack(@brave)
      break if battle_end?
    end

    if battle_result
      result = calculate_of_exp_and_gold
      puts "#{@brave.name}はたたかいに勝った"
      puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
    else
      puts "#{@brave.name}はたたかいに負けた"
      puts "目の前が真っ暗になった"
    end
  end

  private

    def build_characters(**params)
      @brave = params[:brave]
      @monster = params[:monster]
    end

    def battle_end?
      character.hp < 0
    end

    def battle_result
      @brave.hp < 0
    end

    def calculate_of_exp_and_gold
      exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
      gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
      result = {exp: exp, gold: gold}

      result
    end
end
