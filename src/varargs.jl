function TIFFGetField(tif, tag, val::Base.RefValue{T}) where T
    ccall((:TIFFGetField, libtiff), Cint, (Ptr{TIFF}, UInt32, Ref{T}), tif, tag, val)
end

function TIFFGetField(tif, tag, type::Type{T}) where T
    val = Ref{T}()
    status = TIFFGetField(tif, tag, val)
    if status != 1
        error("TIFFGetField threw an error for tag $tag with type $T")
    end
    return val[]
end

function TIFFGetFieldDefaulted(tif, tag, val::Base.RefValue{T}) where T
    ccall((:TIFFGetFieldDefaulted, libtiff), Cint, (Ptr{TIFF}, UInt32, Ref{T}), tif, tag, val)
end

function TIFFGetFieldDefaulted(tif, tag, type::Type{T}) where T
    val = Ref{T}()
    status = TIFFGetFieldDefaulted(tif, tag, val)
    if status != 1
        error("TIFFGetFieldDefaulted threw an error for tag $tag with type $T")
    end
    return val[]
end

for T in (UInt16, UInt32, Cint, Float32, Cstring)
    @eval function TIFFSetField(tif, tag, val::$T)
        ccall((:TIFFSetField, libtiff), Cint, (Ptr{TIFF}, UInt32, $T), tif, tag, val)
    end
end

function TIFFSetField(tif, tag, val::AbstractString)
    ccall((:TIFFSetField, libtiff), Cint, (Ptr{TIFF}, UInt32, Cstring), tif, tag, val)
end
