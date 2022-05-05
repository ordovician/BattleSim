"""
    wins_and_losses(create_warrior::Type{<:Warrior}, create_opponent::Type{<:Warrior})

Compute number of times `warror` wins against `opponent`. Why is this useful?
Because there is a lot of randomness involved one type of warrior may not always
win over another in a single match. Hence we run numerous battles because.

Whatever warrior has the best odds of winning will have more wins when running
numerous battles.
"""
function wins_and_losses(createwarrior::Type{<:Warrior}, createopponent::Type{<:Warrior})
   wins = 0
   losses = 0

   for _ in 1:150
       warrior = createwarrior("warrior", 30)
       opponent = createopponent("opponent", 30)
       
       while true
          attack!(warrior, opponent)
          
          if opponent.health <= 0
              wins += 1
              break
          end          
          
          attack!(opponent, warrior)
          if warrior.health <= 0
              losses += 1 
              break
          end
       end
        
   end   
   
   wins, losses 
end
