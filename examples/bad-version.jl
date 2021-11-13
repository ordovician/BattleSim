struct Archer
    name::String
    health::Int
    arrows::Int
end

struct Pikeman
    name::String
    health::Int
end

struct Knight
    name::String
    health::Int
    mounted::Bool
end

function iswinner(a, b)
    if typeof(a) == Archer
        typeof(b) == Pikeman
    elseif typeof(a) == Pikeman
        typeof(b) == Knight
    elseif typeof(a) == Knight
        typeof(b) == Archer
    end
end

function battle(a, b)
    if iswinner(a, b)
        println(a.name, " defeated ", b.name)    
    elseif iswinner(b, a)
        println(b.name, " defeated ", a.name)    
    else
        println(a.name, " and ", b.name, " destroyed each other")
    end
end