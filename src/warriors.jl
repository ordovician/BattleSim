export Warrior
export Archer, Knight, Pikeman

abstract type Warrior end

mutable struct Archer <: Warrior
    name::String
    health::Int
    arrows::Int
end

mutable struct Pikeman <: Warrior
    name::String
    health::Int
end

mutable struct Knight <: Warrior
    name::String
    health::Int
end


function Archer(name::AbstractString, health::Integer)
    archer = Archer(name, health, 0)
    resupply!(archer)
    archer
end

"""
    resupply!(archer::Archer)
Ressuply the archer with arrows.
"""
function resupply!(archer::Archer)
    archer.arrows = 24
end


"""
    battle!(a::Warrior, b::Warrior)
Display the outcome of warrior `a` attacking warrior `b`
"""
function battle!(a::Warrior, b::Warrior)
    attack!(a, b)
    if a.health == 0 && b.health == 0
        println(a.name, " and ", b.name, " destroyed each other")
    elseif a.health == 0
        println(b.name, " defeated ", a.name)
    else
        println(a.name, " defeated ", b.name)
    end
end

"""
    attack!(a::Archer, b::Pikeman)
Because pikemen move slowly they cannot easily get away from the rain of
arrows and thus take significant damage.
"""
function attack!(a::Archer, b::Pikeman)
    if a.arrows > 0
        damage = 4 + rand(1:6)
        b.health = max(b.health - damage, 0)
        a.arrows -= 1
    end
    a.health, b.health
end

"""
    attack!(a::Archer, b::Knight)
Archers cannot do a lot of damage to knights as 
they can easily move away from the arrow rain and have good armor.
"""
function attack!(a::Archer, b::Knight)
    if a.arrows > 0
        damage = rand(1:6)
        b.health = max(b.health - damage, 0)
        a.arrows -= 1
    end
    a.health, b.health
end

"""
    attack!(a::Archer, b::Archer)
Archers can do a fair amount of damage on other archers as 
the archers don't have good armor to protect them.
"""
function attack!(a::Archer, b::Archer)
    if a.arrows > 0
        damage = 6 + rand(1:6)
        b.health = max(b.health - damage, 0)
        a.arrows -= 1
    end
    a.health, b.health
end

"""
    attack!(a::Pikeman, b::Archer)
It is hard for pikemen to attack archers are they move slowly. Thus
only when lucky do they succeed in causing some injury.
"""
function attack!(a::Pikeman, b::Archer)
   if rand(1:6) >= 5
       b.health -= max(b.health - 2, 0)
   end
   a.health, b.health
end

"""
    attack!(a::Pikeman, b::Pikeman)
Pikemen vs pikemen attacks were generally avoided as 
they tended to get  brutal and with heavy causualties. 
It is hard to escape such a close encounter once it begins.
"""
function attack!(a::Pikeman, b::Pikeman)
    for _ in 1:3 
        a.health = max(a.health - rand(1:6), 0)        
        b.health = max(b.health - rand(1:6), 0)
        
        if a.health > 0 && b.health > 0
            break
        end
    end
    a.health, b.health
end

"""
    attack!(a::Pikeman, b::Knight)
Due to the superior mobility of knights, a pikeman cannot easily engage a
knight which does not choose to attack.
"""
function attack!(a::Pikeman, b::Knight)
    if rand(1:6) >= 6
        b.health -= max(b.health - 1, 0)
    end
    a.health, b.health
end

"""
    attack!(a::Knight, b::Archer)
Archers attacked by knights would suffer heavy losses as they have poor
armor.
"""
function attack!(a::Knight, b::Archer)
    damage = 8 + 2*rand(1:6)
    b.health = max(b.health - damage, 0)
    a.health, b.health  
end

"""
    attack!(a::Knight, b::Pikeman)
Unless they are lucky, knights will suffer heavy losses if attacking pikemen.
"""
function attack!(a::Knight, b::Pikeman)
    damage = rand(1:6)
    b.health = max(b.health - damage, 0)
    damage = 3*rand(1:6)
    a.health = max(b.health - damage, 0)
    
    a.health, b.health
end

"""
    attack!(a::Knight, b::Knight)
Knights vs knights is evenly matched and both have a fairly good chance of
disengaging so casualties are not that high.
"""
function attack!(a::Knight, b::Knight)
    a.health -= max(a.health - rand(1:6), 0)
    b.health -= max(b.health - rand(1:6), 0)
    a.health, b.health
end