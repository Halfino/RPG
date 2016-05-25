#level system a rozdeleni dovednostnich bodu

class Leveling
  def initialize(valecnik)
    @valecnik = valecnik
  end

  def experience
    case @valecnik.xp
      when 0..44
        puts "Momentalne mas #{@valecnik.xp} zkusenosti. Pro postup na dalsi uroven ti zbyva #{45 - @valecnik.xp} zkusenosti."
      when 45..90
        if @valecnik.level < 2
          puts "Gratulujeme, postoupil jsi na 2. uroven. Pro postup na dalsi uroven potrebujes jeste #{91 - @valecnik.xp} zkusenosti."
          puts "Obdrzel jsi 2 body dovednosti k rozdeleni"
          @valecnik.skill_p = 2
          if @valecnik.hp < @valecnik.max_hp
            puts "Tve zivoty byly plne obnoveny"
            @valecnik.hp = @valecnik.max_hp
          end
          @valecnik.level = 2
        else
          puts "Momentalne mas #{@valecnik.xp} zkusenosti. Pro postup na dalsi uroven ti zbyva #{91 - @valecnik.xp} zkusenosti."
        end
      when 91..182
        if @valecnik.level < 3
          puts "Gratulujeme, postoupil jsi na 3. uroven. Pro postup na dalsi uroven potrebujes jeste #{183 - @valecnik.xp} zkusenosti."
          if @valecnik.hp < @valecnik.max_hp
            puts "Tve zivoty byly plne obnoveny"
            @valecnik.hp = @valecnik.max_hp
          end
          puts "Obdrzel jsi 2 body dovednosti k rozdeleni"
          @valecnik.skill_p = @valecnik.skill_p + 2
          @valecnik.level = 3
        else
          puts "Momentalne mas #{@valecnik.xp} zkusenosti. Pro postup na dalsi uroven ti zbyva ziskat #{183 - @valecnik.xp} zkusenosti."
        end
      when 183..367
        if @valecnik.level < 4
          puts "Gratulujeme, postoupil jsi na 4. uroven. Pro postup na dalsi uroven potrebujes jeste #{368 - @valecnik.xp} zkusenosti."
          if @valecnik.hp < @valecnik.max_hp
            puts "Tve zivoty byly plne obnoveny"
            @valecnik.hp = @valecnik.max_hp
          end
          puts "Obdrzel jsi 2 body dovednosti k rozdeleni"
          @valecnik.skill_p = @valecnik.skill_p + 2
          @valecnik.level = 4
        else
          puts "Momentalne mas #{@valecnik.xp} zkusenosti. Pro postup na dalsi uroven potrebujes jeste #{368 - @valecnik.xp} zkusenosti."
        end

    end
  end

  def rozdel
    while @valecnik.skill_p > 0
      puts "Mas momentalne #{@valecnik.skill_p} bodu k rozdeleni."
      puts "Zvol si, do jakeho atributu chces vlozit jeden bod."
      puts "1) Sila"
      puts "2) Obratnost"
      puts "3) Odolnost"
      puts "4) Iteligence"
      puts "5) Charisma"
      volim = gets.to_i
      case volim
        when 1
          @valecnik.sila = @valecnik.sila + 1
          @valecnik.skill_p -= 1
          puts "Vlozil si jeden bod do sily. Tva sila je nyni #{@valecnik.sila} bodu."
        when 2
          @valecnik.obratnost = @valecnik.obratnost + 1
          @valecnik.skill_p -= 1
          puts "Vlozil si jeden bod do obratnosti. Tva obratnost je nyni #{@valecnik.obratnost} bodu."
        when 3
          @valecnik.odolnost = @valecnik.odolnost + 1
          @valecnik.skill_p -= 1
          puts "Vlozil si jeden bod do odolnosti. Tva odolnost je nyni #{@valecnik.odolnost} bodu."
        when 4
          @valecnik.inteligence = @valecnik.inteligence + 1
          @valecnik.skill_p -= 1
          puts "Vlozil jsi jeden bod do inteligence. Tva inteligence je nyni #{@valecnik.inteligence} bodu."
        when 5
          @valecnik.charisma = @valecnik.charisma + 1
          @valecnik.skill_p -= 1
          puts "Vlozil jsi jeden bod do charisma. Tve charisma je nyni #{@valecnik.charisma} bodu."
        else
          puts "Neplatna volba. Zkus to znovu."
          sleep(2)
      end
    end
    @valecnik.bonusy
    @valecnik.max_hp = @valecnik.maxim_hp
    @valecnik.hp = @valecnik.max_hp
  end
end #rozdeleni bodu do atributu