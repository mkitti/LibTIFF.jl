using LibTiff
using Documenter

DocMeta.setdocmeta!(LibTiff, :DocTestSetup, :(using LibTiff); recursive=true)

makedocs(;
    modules=[LibTiff],
    authors="Mark Kittisopikul <markkitt@gmail.com> and contributors",
    repo="https://github.com/mkitti/LibTiff.jl/blob/{commit}{path}#{line}",
    sitename="LibTiff.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mkitti.github.io/LibTiff.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mkitti/LibTiff.jl",
    devbranch="main",
)
