#soubor tridy bojovnika

require_relative "dice"
class Bojovnik
  attr_accessor :sila,:obratnost, :odolnost, :inteligence, :charisma, :max_hp, :hp, :xp, :level, :gold, :skill_p
  attr_accessor :batoh, :zbran, :armor
  attr_reader :jmeno
  def initialize (jmeno)
    @jmeno = jmeno
    @sila = sila_new
    @obratnost = obratnost_new
    @odolnost = odolnost_new
    @inteligence = intelifence_new
    @charisma = charisma_new
    @xp = 0
    @max_hp = maxim_hp
    @hp = @max_hp
    @level = 1
    @gold = 0
    @skill_p = 0
    @batoh = []
    @zbran = nil
    @armor = nil
  end

  def sila_new
    k_sila = Kostka_6.new.hod_6
    sila_new = 12 + k_sila
    return sila_new
  end

  def odolnost_new
    k_odolnost = Kostka_6.new.hod_6
    odolnost_new = 12 + k_odolnost
    return odolnost_new
  end

  def obratnost_new
    k_obratnost = Kostka_6.new.hod_6
    obratnost_new = 8 + k_obratnost
    return obratnost_new
  end

  def intelifence_new
    k_inteligence = Kostka_6.new.hod_6
    inteligence_new = 9 + k_inteligence
    return inteligence_new
  end

  def charisma_new
    k_char = Kostka_6.new.hod_6
    k_char2 = Kostka_6.new.hod_6
    k_char3 = Kostka_6.new.hod_6
    charisma_new = k_char + k_char2 + k_char3 - 1
    return charisma_new
  end

  def bonusy
    @bonusy = {}
    case @sila                             # bonus Sila
      when 1
        bonus_sila = - 5
      when 2..3
        bonus_sila = - 4
      when 4..5
        bonus_sila = - 3
      when 6..7
        bonus_sila = - 2
      when 8..9
        bonus_sila = - 1
      when 10..12
        bonus_sila = 0
      when 13..14
        bonus_sila = 1
      when 15..16
        bonus_sila = 2
      when 17..18
        bonus_sila = 3
      when 19..20
        bonus_sila = 4
      when 21..100
        bonus_sila = 5
    end
    case @obratnost                        # bonus Obratnost
      when 1
        bonus_obratnost = - 5
      when 2..3
        bonus_obratnost = - 4
      when 4..5
        bonus_obratnost = - 3
      when 6..7
        bonus_obratnost = - 2
      when 8..9
        bonus_obratnost = - 1
      when 10..12
        bonus_obratnost = 0
      when 13..14
        bonus_obratnost = 1
      when 15..16
        bonus_obratnost = 2
      when 17..18
        bonus_obratnost = 3
      when 19..20
        bonus_obratnost = 4
      when 21..100
        bonus_obratnost = 5
    end                          # rozhodnuti o bonusu Obratnosti
    case @odolnost                         # bonus Odolnost
      when 1
        bonus_odolnost = - 5
      when 2..3
        bonus_odolnost = - 4
      when 4..5
        bonus_odolnost = - 3
      when 6..7
        bonus_odolnost = - 2
      when 8..9
        bonus_odolnost = - 1
      when 10..12
        bonus_odolnost = 0
      when 13..14
        bonus_odolnost = 1
      when 15..16
        bonus_odolnost = 2
      when 17..18
        bonus_odolnost = 3
      when 19..20
        bonus_odolnost = 4
      when 21..100
        bonus_odolnost = 5
    end                          # rozhodnuti o bonusu Odolnosti
    case @inteligence                      # bonus Inteligence
      when 1
        bonus_inteligence = - 5
      when 2..3
        bonus_inteligence = - 4
      when 4..5
        bonus_inteligence = - 3
      when 6..7
        bonus_inteligence = - 2
      when 8..9
        bonus_inteligence = - 1
      when 10..12
        bonus_inteligence = 0
      when 13..14
        bonus_inteligence = 1
      when 15..16
        bonus_inteligence = 2
      when 17..18
        bonus_inteligence = 3
      when 19..20
        bonus_inteligence = 4
      when 21..100
        bonus_inteligence = 5
    end                          # rozhodnuti o bonusu Inteligence
    case @charisma
      when 1
        bonus_charisma = - 5
      when 2..3
        bonus_charisma = - 4
      when 4..5
        bonus_charisma = - 3
      when 6..7
        bonus_charisma = - 2
      when 8..9
        bonus_charisma = - 1
      when 10..12
        bonus_charisma = 0
      when 13..14
        bonus_charisma = 1
      when 15..16
        bonus_charisma = 2
      when 17..18
        bonus_charisma = 3
      when 19..20
        bonus_charisma = 4
      when 21..100
        bonus_charisma = 5
    end                          # rozhodnuti o bonusu Charisma
    @bonusy = {"b_sila" => bonus_sila, "b_obratnost" => bonus_obratnost , "b_odolnost" => bonus_odolnost, "b_intel" => bonus_inteligence, "b_char" => bonus_charisma}
  end

  def maxim_hp
    max_hp = @odolnost + bonusy["b_odolnost"]
    return max_hp
  end
end
