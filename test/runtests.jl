using BattleSim
using Test

include("testutil.jl")

@testset "All tests" begin

@testset "Arrow depletion" begin
    archer = Archer("Robin Hood", 28)

    arrows = archer.arrows
    resupply!(archer)
    @test arrows == archer.arrows
    
    shoot!(archer)

    @test arrows > archer.arrows

    arrows = archer.arrows
    resupply!(archer)

    @test archer.arrows > arrows
end

@testset "Archer attack" begin
    archer = Archer("Robin Hood", 28)
    piky = Pikeman("Swiss Guard", 32)
    
    archer_health = archer.health
    piky_health = piky.health
    
    for _ in 1:4
        attack!(archer, piky)
    end
    
    @test archer_health == archer.health
    @test piky_health > piky.health
end


@testset "Archer vs Knight" begin

    # Since this is not deterministic we have to rely on the fact that
    # if this is coded correctly knights should statistically speaking
    # win more often.
    
    wins, losses =  wins_and_losses(Knight, Archer)
    @test wins > losses
    
    wins, losses =  wins_and_losses(Archer, Knight)
    @test wins < losses
end

@testset "Pikman vs Knight" begin  
    wins, losses =  wins_and_losses(Knight, Pikeman)
    @test wins < losses
    
    wins, losses =  wins_and_losses(Pikeman, Knight)
    @test wins > losses
end

@testset "Archer vs Pikeman" begin    
    wins, losses =  wins_and_losses(Archer, Pikeman)
    @test wins > losses
    
    wins, losses =  wins_and_losses(Pikeman, Archer)
    @test wins < losses
end


end
