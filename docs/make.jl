using LibTIFF
using Documenter

DocMeta.setdocmeta!(LibTIFF, :DocTestSetup, :(using LibTIFF); recursive=true)

makedocs(;
    modules=[LibTIFF],
    authors="Mark Kittisopikul <markkitt@gmail.com> and contributors",
    repo="https://github.com/mkitti/LibTIFF.jl/blob/{commit}{path}#{line}",
    sitename="LibTIFF.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mkitti.github.io/LibTIFF.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mkitti/LibTIFF.jl",
    devbranch="main",
)
