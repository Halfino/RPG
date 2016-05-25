#soubor tridy nestvury. Vyuziti CSV.
require "CSV"
require_relative "dice"
class Potvora
  attr_reader :jmeno, :zivotaschopnost, :ut_cislo, :obr_cislo, :odolnost, :xp, :goldy, :id
  attr_accessor :zivoty
  FILE_BESTIE = "bestiar.csv"
  def initialize (id)
    CSV.open(FILE_BESTIE, "r", {:headers => true}) do |csv|
      csv.each do |line|
        arguments = line
        if arguments[0].to_i == id
          @jmeno = arguments[1]
          @zivotaschopnost = arguments[2].to_i
          @ut_cislo = arguments[3].to_i
          @obr_cilso = arguments[4].to_i
          @odolnost = arguments[5].to_i
          @zivoty = zivoty_new
          @xp = arguments[6].to_i
          @goldy = arguments[8].to_i
        end
      end
    end
  end

  def zivoty_new
    zivoty_new = 0
    @zivotaschopnost.times do
      hod = Kostka_10.new.hod_10
      zivoty_new += hod
      return zivoty_new
    end
  end
end
