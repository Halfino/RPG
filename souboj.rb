#soubojovy system
require_relative "dice"

class Souboj
  def initialize(valecnik, bestie)
    @valecnik = valecnik
    @potvora = bestie
  end

  def boj
    puts "potkal jsi nestvuru #{@potvora.jmeno}, ktera ma #{@potvora.zivoty} zivotu. Nyni se rozhodne, kdo bude utocit prvni."
    hody_6 = Kostka_6.new
    inc_val = hody_6.hod_6
    inc_pot = hody_6.hod_6
    # vyreseni stejne iniciativy opetovnym hodem.
    while inc_pot == inc_val
      inc_pot = hody_6.hod_6
      inc_val = hody_6.hod_6
    end
    if @valecnik.zbran != nil
    ut_cislo_val = @valecnik.bonusy["b_sila"] + @valecnik.zbran.sila
    else
      ut_cislo_val = @valecnik.bonusy["b_sila"]
    end
    if @valecnik.armor != nil
    obr_cislo_val = @valecnik.bonusy["b_odolnost"] + @valecnik.armor.obrana
    else
      obr_cislo_val = @valecnik.bonusy["b_odolnost"]
    end
    if inc_pot < inc_val
      # valecnik utoci prvni
      puts "Mas vice stesti a zacinas utocit"
      sleep(2)
      while (@valecnik.hp > 0 && @potvora.zivoty > 0)
        # Hodnota utoku valecnika
        #ut_cislo_val = @valecnik.bonus[0] + @valecnik.zbran.sila.to_i
        hod_utok_val = hody_6.hod_6
        hod_utok_celk = hod_utok_val
        while hod_utok_val == 6
          hod_utok_val = hody_6.hod_6
          hod_utok_celk = hod_utok_celk + hod_utok_val
        end
        utok_val = ut_cislo_val + hod_utok_celk

        # Hodnota obrany nestvury
        hod_obrana_nes = hody_6.hod_6
        hod_obrana_nescelk = hod_obrana_nes
        while hod_obrana_nes == 6
          hod_obrana_nes = hody_6.hod_6
          hod_obrana_nescelk = hod_obrana_nescelk + hod_obrana_nes
        end
        obrana_nes = hod_obrana_nescelk + @potvora.obr_cislo.to_i
        #provedeni utoku valecnika
        rozdil_utok = utok_val.to_i - obrana_nes.to_i

        if rozdil_utok > 0
          @potvora.zivoty = @potvora.zivoty - rozdil_utok
          if @potvora.zivoty < 1
            @valecnik.gold += @potvora.goldy
            puts "#{@potvora.jmeno} byl(a) zasazena za #{rozdil_utok} zivotu a je zabit(a). Ziskal jsi #{@potvora.xp} zkusenosti a #{@potvora.goldy} zlatych."
            puts "Po ukonceni souoje ti zbyva #{@valecnik.hp} zivotu z #{@valecnik.max_hp} moznych."
            @valecnik.xp = @valecnik.xp + @potvora.xp
            sleep(3)
            break
          end
          puts "Zasahl jsi #{@potvora.jmeno} za #{rozdil_utok} zivotu. #{@potvora.jmeno} ma nyni #{@potvora.zivoty} zivotu."
          sleep(2)
        else
          puts "#{@potvora.jmeno} si nezasahl."
          sleep(2)
        end
        #hod na obranu valecnika
        #obr_cislo_val = @valecnik.bonus[2] + @valecnik.armor.obrana.to_i
        hod_obr_val = hody_6.hod_6
        hod_obr_vcelk = hod_obr_val
        while hod_obr_val == 6
          hod_obr_val = hody_6.hod_6
          hod_obr_vcelk = hod_obr_vcelk + hod_obr_val
        end
        obr_val = obr_cislo_val + hod_obr_vcelk

        #hod na utok potvory
        ut_cislo_nes = @potvora.ut_cislo
        hod_utok_nes = hody_6.hod_6
        hod_utok_ncelk = hod_utok_nes
        while hod_utok_nes == 6
          hod_utok_nes = hody_6.hod_6
          hod_utok_ncelk = hod_utok_ncelk + hod_utok_nes
        end
        utok_nes = hod_utok_ncelk + ut_cislo_nes

        #provedeni utoku nestvury (pouze jedna akce za kolo)
        rozdil_obrana = utok_nes - obr_val
        if rozdil_obrana > 0
          @valecnik.hp = @valecnik.hp - rozdil_obrana
          if @valecnik.hp < 1
            puts "Obdrzel jsi #{rozdil_obrana} bodu poskozeni a byl si zabit. Hra pro tebe konci."
            exit
          end
          puts "#{@potvora.jmeno} te zasahl(a) s dal(a) ti #{rozdil_obrana} poskozeni. Mas nyni #{@valecnik.hp} z #{@valecnik.max_hp} zivotu."
          sleep(2)
        else
          puts "#{@potvora.jmeno} te nezasahl(a)."
          sleep(2)
        end
      end
    elsif inc_pot > inc_val
      # potvora utoci prvni
      puts "#{@potvora.jmeno} se vzpamatoval(a) drive a utoci prvni."
      sleep(2)
      while (@valecnik.hp > 0 && @potvora.zivoty > 0)
        #hod na obranu valecnika
        #obr_cislo_val = @valecnik.bonus[2]
        hod_obr_val = hody_6.hod_6
        hod_obr_vcelk = hod_obr_val
        while hod_obr_val == 6
          hod_obr_val = hody_6.hod_6
          hod_obr_vcelk = hod_obr_vcelk + hod_obr_val
        end
        obr_val = obr_cislo_val + hod_obr_vcelk

        #hod na utok potvory
        ut_cislo_nes = @potvora.ut_cislo
        hod_utok_nes = hody_6.hod_6
        hod_utok_ncelk = hod_utok_nes
        while hod_utok_nes == 6
          hod_utok_nes = hody_6.hod_6
          hod_utok_ncelk = hod_utok_ncelk + hod_utok_nes
        end
        utok_nes = hod_utok_ncelk + ut_cislo_nes

        #provedeni utoku nestvury (pouze jedna akce za kolo)
        rozdil_obrana = utok_nes - obr_val
        if rozdil_obrana > 0
          @valecnik.hp = @valecnik.hp - rozdil_obrana
          if @valecnik.hp < 1
            puts "Obdrzel jsi #{rozdil_obrana} bodu poskozeni a byl si zabit. Hra pro tebe konci."
            exit
          end
          puts "#{@potvora.jmeno} te zasahl(a) a dala ti #{rozdil_obrana} poskozeni. Mas nyni #{@valecnik.hp} z #{@valecnik.max_hp}zivotu."
          sleep(2)
        else
          puts "#{@potvora.jmeno} te nezasahl(a)."
          sleep(2)
        end
        # Hodnota utoku valecnika
        #ut_cislo_val = @valecnik.bonus[0]
        hod_utok_val = hody_6.hod_6
        hod_utok_celk = hod_utok_val
        while hod_utok_val == 6
          hod_utok_val = hody_6.hod_6
          hod_utok_celk = hod_utok_celk + hod_utok_val
        end
        utok_val = ut_cislo_val + hod_utok_celk

        # Hodnota obrany nestvury
        hod_obrana_nes = hody_6.hod_6
        hod_obrana_nescelk = hod_obrana_nes
        while hod_obrana_nes == 6
          hod_obrana_nes = hody_6.hod_6
          hod_obrana_nescelk = hod_obrana_nescelk + hod_obrana_nes
        end
        obrana_nes = hod_obrana_nescelk + @potvora.obr_cislo.to_i
        #provedeni utoku valecnika
        rozdil_utok = utok_val.to_i - obrana_nes.to_i

        if rozdil_utok > 0
          @potvora.zivoty = @potvora.zivoty - rozdil_utok
          if @potvora.zivoty < 1
            @valecnik.gold += @potvora.goldy
            puts "#{@potvora.jmeno} byl(a) zasazena za #{rozdil_utok} zivotu a je zabit(a). Ziskal jsi #{@potvora.xp} zkusenosti a #{@potvora.goldy} zlatych."
            puts "Po ukonceni souoje ti zbyva #{@valecnik.hp} zivotu z #{@valecnik.max_hp} moznych."
            @valecnik.xp = @valecnik.xp + @potvora.xp
            sleep(2)
            break
          end
          puts "Zasahl jsi #{@potvora.jmeno} za #{rozdil_utok} zivotu. #{@potvora.jmeno} ma nyni #{@potvora.zivoty} zivotu."
          sleep(2)
        else
          puts "#{@potvora.jmeno} si nezasahl."
          sleep(2)
        end
      end
    else
    end
  end
end