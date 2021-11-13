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

iswinner(a::Archer, b::Pikeman) = true
iswinner(a::Archer, b::Knight) = false
iswinner(a::Knight, b::Pikeman) = false

function iswinner(a, b)
    if typeof(a) == typeof(b)
        false
    else
        !iswinner(b, a)
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