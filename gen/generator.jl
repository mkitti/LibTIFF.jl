using Clang.Generators
using Libtiff_jll

cd(@__DIR__)

include_dir = normpath(Libtiff_jll.artifact_dir, "include")

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$include_dir")

headers = [joinpath(include_dir, header) for header in readdir(include_dir) if endswith(header, ".h")]
ctx = create_context(headers, args, options)

build!(ctx)
