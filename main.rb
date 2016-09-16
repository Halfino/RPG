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
Zadej jmeno postavy: "

warrior = Bojovnik.new(gets.strip)
puts "Vitej. Tve atributy jsou nasledujici:"
warrior.report

moucha = Potvora.new(rand(1..2))

souboj = Souboj.new(warrior, moucha)
souboj.boj

warrior.xp += 50
levling = Leveling.new(warrior)
levling.experience
levling.rozdel
warrior.gold = 100
warrior.report
obchod = Obchod_zbrane.new(warrior).obchoduj
obchod = Obchod_zbroj.new(warrior).obchoduj


moucha = Potvora.new(1)
souboj = Souboj.new(warrior, moucha).boj

