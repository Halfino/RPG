#Soubor logiky dobrodruzstvi, ci questu.
class Quest
  attr_reader :nazev ,:zadani
  def initialize(nazev, zadani)
    @nazev = nazev
    @zadani = zadani
  end

  def uvod
    File.open(@zadani, "w") do |file|

    end
  end
end