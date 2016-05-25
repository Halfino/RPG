#################################################################################################################
#Main soubor hry "no_name_yet".                                                                                 #
#Vytvoril Onehalf                                                                                               #
#Popis: Textove ruby RPG zalozene na pravidlech Draciho Doupete.V planu mam vytvorit celkem komplexni textovku. #
#Stav: Class Warrior, Bestiar pomoci CSV, obchod se zbranemi a brnenim, lvl system done                         #
#zbyva: pribeh, questy, prodej veci z batohu, snad loot , opotrebeni, slozitejsi soubojovy system (uvidim),     #
#       Odpocinek(HP recovery), co mne jeste napadne                                                            #
#################################################################################################################

require_relative "bojovnik"
require_relative "dice"
require_relative "bestiar"
require_relative "obchod"
require_relative "souboj"
require_relative "lvlSystem"

puts "Vitej ve hre Seru na tebe. Hra je zalozena na pravidlech Draciho doupete.
V aktualni verzi si muzes vytvorit pouze bojovnika tridy valecnik.
Zadej jmeno postavy: "đ

warrior = Bojovnik.new(gets.strip)

p warrior
p warrior.bonusy["b_sila"]

moucha = Potvora.new(rand(1..2))
p moucha
souboj = Souboj.new(warrior, moucha)đđ
souboj.boj
p warrior
warrior.xp += 50
levling = Leveling.new(warrior)
levling.experience
levling.rozdel
warrior.gold = 100
obchod = Obchod_zbrane.new(warrior).obchoduj
obchod = Obchod_zbroj.new(warrior).obchoduj

p warrior
moucha = Potvora.new(1)
souboj = Souboj.new(warrior, moucha).boj
p warrior
