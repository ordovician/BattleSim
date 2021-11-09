using BattleSim

white = Knight("Lancelot", 34)
black = Knight("Moriaen", 36)
green = Archer("Robin Hood", 28)

shoot!(green)
shoot!(white)    # knikghts cannot shoot arrows
dismount!(green) # archers cannot dismount, as they have no horses
dismount!(black)