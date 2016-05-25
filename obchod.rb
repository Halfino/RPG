#soubor trid zbrani, armoru a dvou obchodu s obojim zbozim. Optimalizace by bodla.
require "Nokogiri"

class Zbran
  attr_reader :jmeno, :sila, :cena
  def initialize(jmeno, sila, cena)
    @jmeno = jmeno
    @sila = sila
    @cena = cena
  end
end

class Armor
  attr_reader :jmeno, :obrana, :cena
  def initialize(jmeno, obrana, cena)
    @jmeno = jmeno
    @obrana = obrana
    @cena = cena
  end
end

class Obchod_zbrane
  attr_reader :weapon, :jmeno, :id, :sila, :cena
  def initialize(valecnik)
    @valecnik = valecnik
    @weapon = []
    File.open("zbrane.xml", "r") do |file|              #nacteni XML
      doc = Nokogiri::XML::Document.parse(file)
      doc.root.xpath("zbran").each do |zbran|
        @jmeno = zbran.at_xpath("jmeno").content
        @sila = zbran.at_xpath("sila").content.to_i
        @cena = zbran.at_xpath("cena").content.to_i
        @weapon <<  Zbran.new(@jmeno, @sila, @cena)     #vytvoreni pole zbrani z dat z XML
      end
    end
  end

  #metoda samotneho obchodovani se zbranemi
  def obchoduj
    @weapon.length.times do |i|
      puts "#{i + 1}) Jmeno:#{@weapon[i].jmeno},Sila #{@weapon[i].sila}, cena:#{@weapon[i].cena}"
    end
    puts "Vyber si zbran k nakupu. Mas momentalne #{@valecnik.gold} zlatych. Pro ukonceni stiskni enter"
    volba = gets.to_i
    while volba != 0
      if @valecnik.gold < @weapon[volba - 1].cena
        puts "Na nakup #{@weapon[volba - 1].jmeno} nemas dostatek penez. Vyber si jinou zbran. Pro ukonceni obchodovani stiskni enter"
        volba = gets.to_i
      else
        @valecnik.zbran = @weapon[volba - 1]
        @valecnik.gold -= @weapon[volba - 1].cena
        puts "Koupil jsi #{@valecnik.zbran.jmeno}."
        break
      end
    end
  end
end



class Obchod_zbroj
  def initialize(valecnik)
    @valecnik = valecnik
    @armor = []
    File.open("armor.xml", "r") do |file|                     #nacteni XML
      doc = Nokogiri::XML::Document.parse(file)
      doc.root.xpath("armor").each do |armor|
        @jmeno = armor.at_xpath("jmeno").content
        @obrana = armor.at_xpath("obrana").content.to_i
        @cena = armor.at_xpath("cena").content.to_i
        @armor <<  Armor.new(@jmeno, @obrana, @cena)          #vytvoreni pole objektu armoru z nacteneho XML
      end
    end
  end

  #metoda samotneho obchodovani se zbroji
  def obchoduj
    @armor.length.times do |i|
      puts "#{i + 1}) Jmeno:#{@armor[i].jmeno},Obrana: #{@armor[i].obrana}, cena:#{@armor[i].cena}"
    end
    puts "Vyber si zbran k nakupu. Mas momentalne #{@valecnik.gold} zlatych. Pro ukonceni stiskni enter"
    volba = gets.to_i
    while volba != 0
      if @valecnik.gold < @armor[volba - 1].cena
        puts "Na nakup #{@armor[volba - 1].jmeno} nemas dostatek penez. Vyber si jinou zbran. Pro ukonceni obchodovani stiskni enter"
        volba = gets.to_i
      else
        @valecnik.armor = @armor[volba - 1]
        @valecnik.gold -= @armor[volba - 1].cena
        puts "Koupil jsi #{@valecnik.armor.jmeno}."
        break
      end
    end
  end
end