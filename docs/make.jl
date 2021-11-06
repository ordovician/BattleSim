using BattleSim
using Documenter

DocMeta.setdocmeta!(BattleSim, :DocTestSetup, :(using BattleSim); recursive=true)

makedocs(;
    modules=[BattleSim],
    authors="Erik Engheim <erik.engheim@mac.com> and contributors",
    repo="https://github.com/ordovician/BattleSim.jl/blob/{commit}{path}#{line}",
    sitename="BattleSim.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
