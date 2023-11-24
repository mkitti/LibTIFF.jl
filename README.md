# LibTIFF.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://mkitti.github.io/LibTIFF.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://mkitti.github.io/LibTIFF.jl/dev/)
[![Build Status](https://github.com/mkitti/LibTIFF.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/mkitti/LibTIFF.jl/actions/workflows/CI.yml?query=branch%3Amain)

LibTIFF.jl is a Julia wrapper around [libtiff](http://www.libtiff.org/). LibTIFF.jl was generated using [Clang.jl](https://github.com/JuliaInterop/Clang.jl) using headers from [Libtiff_jll.jl](https://github.com/JuliaBinaryWrappers/Libtiff_jll.jl).

This is meant to be low-level wrapper around the libtiff C interface. See the [libtiff documentation](http://www.libtiff.org/libtiff.html) for comprehensive usage information.

## Installation

```
using Pkg
Pkg.add("https://github.com/mkitti/LibTIFF.jl")
```

## Example Usage

```julia
julia> using LibTIFF

julia> function read_float32_tiff(filepath)
           tif = TIFFOpen(filepath, "r")
           _length = TIFFGetField(tif, TIFFTAG_IMAGELENGTH, Int32)
           _width = TIFFGetField(tif, TIFFTAG_IMAGEWIDTH, Int32)
           _rowsperstrip = TIFFGetField(tif, TIFFTAG_ROWSPERSTRIP, Int32)
           _bitspersample = TIFFGetField(tif, TIFFTAG_BITSPERSAMPLE, Int32)
           _samplesformat = TIFFGetField(tif, TIFFTAG_SAMPLEFORMAT, Int8)
           @info "Image fields" _length _width _rowsperstrip _bitspersample _samplesformat
           image = Matrix{Float32}(undef, _width, _length)
           for (i,col) in zip(0:_length÷_rowsperstrip, eachcol(image))
               TIFFReadEncodedStrip(tif, i, pointer(col), -1)
           end
           TIFFClose(tif)
           image = permutedims(image, (2,1))
           return image
       end
read_float32_tiff (generic function with 1 method)
```

## Alternatives

* [TiffImages.jl](https://tamasnagy.com/TiffImages.jl/stable/) - Pure-Julia implementation of a TIFF reader
* [GMT.jl](https://github.com/GenericMappingTools/GMT.jl) - `gmtread` can read tiff files
* [ImageMagick.jl](https://github.com/JuliaIO/ImageMagick.jl) - Wrapper around the open source image editing suite
* [pglock/LIBTIFF.JL](https://github.com/pglock/LIBTIFF.jl) - Older package that has not been updated for five years or more.
