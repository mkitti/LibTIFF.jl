module LibTiff

using Libtiff_jll
export Libtiff_jll

using CEnum

const int8 = Int8

const uint8 = UInt8

const int16 = Int16

const uint16 = UInt16

const int32 = Int32

const uint32 = UInt32

const int64 = Int64

const uint64 = UInt64

const uint16_vap = Cint

struct TIFFHeaderCommon
    tiff_magic::UInt16
    tiff_version::UInt16
end

struct TIFFHeaderClassic
    tiff_magic::UInt16
    tiff_version::UInt16
    tiff_diroff::UInt32
end

struct TIFFHeaderBig
    tiff_magic::UInt16
    tiff_version::UInt16
    tiff_offsetsize::UInt16
    tiff_unused::UInt16
    tiff_diroff::UInt64
end

@cenum TIFFDataType::UInt32 begin
    TIFF_NOTYPE = 0
    TIFF_BYTE = 1
    TIFF_ASCII = 2
    TIFF_SHORT = 3
    TIFF_LONG = 4
    TIFF_RATIONAL = 5
    TIFF_SBYTE = 6
    TIFF_UNDEFINED = 7
    TIFF_SSHORT = 8
    TIFF_SLONG = 9
    TIFF_SRATIONAL = 10
    TIFF_FLOAT = 11
    TIFF_DOUBLE = 12
    TIFF_IFD = 13
    TIFF_LONG8 = 16
    TIFF_SLONG8 = 17
    TIFF_IFD8 = 18
end

const tmsize_t = Int64

mutable struct tiff end

const TIFF = tiff

const toff_t = UInt64

const ttag_t = UInt32

const tdir_t = UInt32

const tsample_t = UInt16

const tstrile_t = UInt32

const tstrip_t = tstrile_t

const ttile_t = tstrile_t

const tsize_t = tmsize_t

const tdata_t = Ptr{Cvoid}

const thandle_t = Ptr{Cvoid}

const TIFFRGBValue = Cuchar

struct TIFFDisplay
    d_mat::NTuple{3, NTuple{3, Cfloat}}
    d_YCR::Cfloat
    d_YCG::Cfloat
    d_YCB::Cfloat
    d_Vrwr::UInt32
    d_Vrwg::UInt32
    d_Vrwb::UInt32
    d_Y0R::Cfloat
    d_Y0G::Cfloat
    d_Y0B::Cfloat
    d_gammaR::Cfloat
    d_gammaG::Cfloat
    d_gammaB::Cfloat
end

struct TIFFYCbCrToRGB
    clamptab::Ptr{TIFFRGBValue}
    Cr_r_tab::Ptr{Cint}
    Cb_b_tab::Ptr{Cint}
    Cr_g_tab::Ptr{Int32}
    Cb_g_tab::Ptr{Int32}
    Y_tab::Ptr{Int32}
end

struct TIFFCIELabToRGB
    range::Cint
    rstep::Cfloat
    gstep::Cfloat
    bstep::Cfloat
    X0::Cfloat
    Y0::Cfloat
    Z0::Cfloat
    display::TIFFDisplay
    Yr2r::NTuple{1501, Cfloat}
    Yg2g::NTuple{1501, Cfloat}
    Yb2b::NTuple{1501, Cfloat}
end

struct var"##Ctag#313"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#313"}, f::Symbol)
    f === :any && return Ptr{Ptr{Cvoid}}(x + 0)
    f === :contig && return Ptr{tileContigRoutine}(x + 0)
    f === :separate && return Ptr{tileSeparateRoutine}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#313", f::Symbol)
    r = Ref{var"##Ctag#313"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#313"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#313"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct _TIFFRGBAImage
    data::NTuple{144, UInt8}
end

function Base.getproperty(x::Ptr{_TIFFRGBAImage}, f::Symbol)
    f === :tif && return Ptr{Ptr{TIFF}}(x + 0)
    f === :stoponerr && return Ptr{Cint}(x + 8)
    f === :isContig && return Ptr{Cint}(x + 12)
    f === :alpha && return Ptr{Cint}(x + 16)
    f === :width && return Ptr{UInt32}(x + 20)
    f === :height && return Ptr{UInt32}(x + 24)
    f === :bitspersample && return Ptr{UInt16}(x + 28)
    f === :samplesperpixel && return Ptr{UInt16}(x + 30)
    f === :orientation && return Ptr{UInt16}(x + 32)
    f === :req_orientation && return Ptr{UInt16}(x + 34)
    f === :photometric && return Ptr{UInt16}(x + 36)
    f === :redcmap && return Ptr{Ptr{UInt16}}(x + 40)
    f === :greencmap && return Ptr{Ptr{UInt16}}(x + 48)
    f === :bluecmap && return Ptr{Ptr{UInt16}}(x + 56)
    f === :get && return Ptr{Ptr{Cvoid}}(x + 64)
    f === :put && return Ptr{var"##Ctag#313"}(x + 72)
    f === :Map && return Ptr{Ptr{TIFFRGBValue}}(x + 80)
    f === :BWmap && return Ptr{Ptr{Ptr{UInt32}}}(x + 88)
    f === :PALmap && return Ptr{Ptr{Ptr{UInt32}}}(x + 96)
    f === :ycbcr && return Ptr{Ptr{TIFFYCbCrToRGB}}(x + 104)
    f === :cielab && return Ptr{Ptr{TIFFCIELabToRGB}}(x + 112)
    f === :UaToAa && return Ptr{Ptr{UInt8}}(x + 120)
    f === :Bitdepth16To8 && return Ptr{Ptr{UInt8}}(x + 128)
    f === :row_offset && return Ptr{Cint}(x + 136)
    f === :col_offset && return Ptr{Cint}(x + 140)
    return getfield(x, f)
end

function Base.getproperty(x::_TIFFRGBAImage, f::Symbol)
    r = Ref{_TIFFRGBAImage}(x)
    ptr = Base.unsafe_convert(Ptr{_TIFFRGBAImage}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{_TIFFRGBAImage}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const TIFFRGBAImage = _TIFFRGBAImage

# typedef void ( * tileContigRoutine ) ( TIFFRGBAImage * , uint32_t * , uint32_t , uint32_t , uint32_t , uint32_t , int32_t , int32_t , unsigned char * )
const tileContigRoutine = Ptr{Cvoid}

# typedef void ( * tileSeparateRoutine ) ( TIFFRGBAImage * , uint32_t * , uint32_t , uint32_t , uint32_t , uint32_t , int32_t , int32_t , unsigned char * , unsigned char * , unsigned char * , unsigned char * )
const tileSeparateRoutine = Ptr{Cvoid}

# typedef int ( * TIFFInitMethod ) ( TIFF * , int )
const TIFFInitMethod = Ptr{Cvoid}

struct TIFFCodec
    name::Ptr{Cchar}
    scheme::UInt16
    init::TIFFInitMethod
end

struct TIFFRational_t
    uNum::UInt32
    uDenom::UInt32
end

# typedef void ( * TIFFErrorHandler ) ( const char * , const char * , va_list )
const TIFFErrorHandler = Ptr{Cvoid}

# typedef void ( * TIFFErrorHandlerExt ) ( thandle_t , const char * , const char * , va_list )
const TIFFErrorHandlerExt = Ptr{Cvoid}

# typedef int ( * TIFFErrorHandlerExtR ) ( TIFF * , void * user_data , const char * , const char * , va_list )
const TIFFErrorHandlerExtR = Ptr{Cvoid}

# typedef tmsize_t ( * TIFFReadWriteProc ) ( thandle_t , void * , tmsize_t )
const TIFFReadWriteProc = Ptr{Cvoid}

# typedef toff_t ( * TIFFSeekProc ) ( thandle_t , toff_t , int )
const TIFFSeekProc = Ptr{Cvoid}

# typedef int ( * TIFFCloseProc ) ( thandle_t )
const TIFFCloseProc = Ptr{Cvoid}

# typedef toff_t ( * TIFFSizeProc ) ( thandle_t )
const TIFFSizeProc = Ptr{Cvoid}

# typedef int ( * TIFFMapFileProc ) ( thandle_t , void * * base , toff_t * size )
const TIFFMapFileProc = Ptr{Cvoid}

# typedef void ( * TIFFUnmapFileProc ) ( thandle_t , void * base , toff_t size )
const TIFFUnmapFileProc = Ptr{Cvoid}

# typedef void ( * TIFFExtendProc ) ( TIFF * )
const TIFFExtendProc = Ptr{Cvoid}

function TIFFGetVersion()
    ccall((:TIFFGetVersion, libtiff), Ptr{Cchar}, ())
end

function TIFFFindCODEC(arg1)
    ccall((:TIFFFindCODEC, libtiff), Ptr{TIFFCodec}, (UInt16,), arg1)
end

function TIFFRegisterCODEC(arg1, arg2, arg3)
    ccall((:TIFFRegisterCODEC, libtiff), Ptr{TIFFCodec}, (UInt16, Ptr{Cchar}, TIFFInitMethod), arg1, arg2, arg3)
end

function TIFFUnRegisterCODEC(arg1)
    ccall((:TIFFUnRegisterCODEC, libtiff), Cvoid, (Ptr{TIFFCodec},), arg1)
end

function TIFFIsCODECConfigured(arg1)
    ccall((:TIFFIsCODECConfigured, libtiff), Cint, (UInt16,), arg1)
end

function TIFFGetConfiguredCODECs()
    ccall((:TIFFGetConfiguredCODECs, libtiff), Ptr{TIFFCodec}, ())
end

function _TIFFmalloc(s)
    ccall((:_TIFFmalloc, libtiff), Ptr{Cvoid}, (tmsize_t,), s)
end

function _TIFFcalloc(nmemb, siz)
    ccall((:_TIFFcalloc, libtiff), Ptr{Cvoid}, (tmsize_t, tmsize_t), nmemb, siz)
end

function _TIFFrealloc(p, s)
    ccall((:_TIFFrealloc, libtiff), Ptr{Cvoid}, (Ptr{Cvoid}, tmsize_t), p, s)
end

function _TIFFmemset(p, v, c)
    ccall((:_TIFFmemset, libtiff), Cvoid, (Ptr{Cvoid}, Cint, tmsize_t), p, v, c)
end

function _TIFFmemcpy(d, s, c)
    ccall((:_TIFFmemcpy, libtiff), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, tmsize_t), d, s, c)
end

function _TIFFmemcmp(p1, p2, c)
    ccall((:_TIFFmemcmp, libtiff), Cint, (Ptr{Cvoid}, Ptr{Cvoid}, tmsize_t), p1, p2, c)
end

function _TIFFfree(p)
    ccall((:_TIFFfree, libtiff), Cvoid, (Ptr{Cvoid},), p)
end

function TIFFGetTagListCount(arg1)
    ccall((:TIFFGetTagListCount, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFGetTagListEntry(arg1, tag_index)
    ccall((:TIFFGetTagListEntry, libtiff), UInt32, (Ptr{TIFF}, Cint), arg1, tag_index)
end

mutable struct _TIFFField end

const TIFFField = _TIFFField

mutable struct _TIFFFieldArray end

const TIFFFieldArray = _TIFFFieldArray

function TIFFFindField(arg1, arg2, arg3)
    ccall((:TIFFFindField, libtiff), Ptr{TIFFField}, (Ptr{TIFF}, UInt32, TIFFDataType), arg1, arg2, arg3)
end

function TIFFFieldWithTag(arg1, arg2)
    ccall((:TIFFFieldWithTag, libtiff), Ptr{TIFFField}, (Ptr{TIFF}, UInt32), arg1, arg2)
end

function TIFFFieldWithName(arg1, arg2)
    ccall((:TIFFFieldWithName, libtiff), Ptr{TIFFField}, (Ptr{TIFF}, Ptr{Cchar}), arg1, arg2)
end

function TIFFFieldTag(arg1)
    ccall((:TIFFFieldTag, libtiff), UInt32, (Ptr{TIFFField},), arg1)
end

function TIFFFieldName(arg1)
    ccall((:TIFFFieldName, libtiff), Ptr{Cchar}, (Ptr{TIFFField},), arg1)
end

function TIFFFieldDataType(arg1)
    ccall((:TIFFFieldDataType, libtiff), TIFFDataType, (Ptr{TIFFField},), arg1)
end

function TIFFFieldPassCount(arg1)
    ccall((:TIFFFieldPassCount, libtiff), Cint, (Ptr{TIFFField},), arg1)
end

function TIFFFieldReadCount(arg1)
    ccall((:TIFFFieldReadCount, libtiff), Cint, (Ptr{TIFFField},), arg1)
end

function TIFFFieldWriteCount(arg1)
    ccall((:TIFFFieldWriteCount, libtiff), Cint, (Ptr{TIFFField},), arg1)
end

function TIFFFieldSetGetSize(arg1)
    ccall((:TIFFFieldSetGetSize, libtiff), Cint, (Ptr{TIFFField},), arg1)
end

function TIFFFieldSetGetCountSize(arg1)
    ccall((:TIFFFieldSetGetCountSize, libtiff), Cint, (Ptr{TIFFField},), arg1)
end

function TIFFFieldIsAnonymous(arg1)
    ccall((:TIFFFieldIsAnonymous, libtiff), Cint, (Ptr{TIFFField},), arg1)
end

# typedef int ( * TIFFVSetMethod ) ( TIFF * , uint32_t , va_list )
const TIFFVSetMethod = Ptr{Cvoid}

# typedef int ( * TIFFVGetMethod ) ( TIFF * , uint32_t , va_list )
const TIFFVGetMethod = Ptr{Cvoid}

# typedef void ( * TIFFPrintMethod ) ( TIFF * , FILE * , long )
const TIFFPrintMethod = Ptr{Cvoid}

struct TIFFTagMethods
    vsetfield::TIFFVSetMethod
    vgetfield::TIFFVGetMethod
    printdir::TIFFPrintMethod
end

function TIFFAccessTagMethods(arg1)
    ccall((:TIFFAccessTagMethods, libtiff), Ptr{TIFFTagMethods}, (Ptr{TIFF},), arg1)
end

function TIFFGetClientInfo(arg1, arg2)
    ccall((:TIFFGetClientInfo, libtiff), Ptr{Cvoid}, (Ptr{TIFF}, Ptr{Cchar}), arg1, arg2)
end

function TIFFSetClientInfo(arg1, arg2, arg3)
    ccall((:TIFFSetClientInfo, libtiff), Cvoid, (Ptr{TIFF}, Ptr{Cvoid}, Ptr{Cchar}), arg1, arg2, arg3)
end

function TIFFCleanup(tif)
    ccall((:TIFFCleanup, libtiff), Cvoid, (Ptr{TIFF},), tif)
end

function TIFFClose(tif)
    ccall((:TIFFClose, libtiff), Cvoid, (Ptr{TIFF},), tif)
end

function TIFFFlush(tif)
    ccall((:TIFFFlush, libtiff), Cint, (Ptr{TIFF},), tif)
end

function TIFFFlushData(tif)
    ccall((:TIFFFlushData, libtiff), Cint, (Ptr{TIFF},), tif)
end

function TIFFReadDirectory(tif)
    ccall((:TIFFReadDirectory, libtiff), Cint, (Ptr{TIFF},), tif)
end

function TIFFReadCustomDirectory(tif, diroff, infoarray)
    ccall((:TIFFReadCustomDirectory, libtiff), Cint, (Ptr{TIFF}, toff_t, Ptr{TIFFFieldArray}), tif, diroff, infoarray)
end

function TIFFReadEXIFDirectory(tif, diroff)
    ccall((:TIFFReadEXIFDirectory, libtiff), Cint, (Ptr{TIFF}, toff_t), tif, diroff)
end

function TIFFReadGPSDirectory(tif, diroff)
    ccall((:TIFFReadGPSDirectory, libtiff), Cint, (Ptr{TIFF}, toff_t), tif, diroff)
end

function TIFFScanlineSize64(tif)
    ccall((:TIFFScanlineSize64, libtiff), UInt64, (Ptr{TIFF},), tif)
end

function TIFFScanlineSize(tif)
    ccall((:TIFFScanlineSize, libtiff), tmsize_t, (Ptr{TIFF},), tif)
end

function TIFFRasterScanlineSize64(tif)
    ccall((:TIFFRasterScanlineSize64, libtiff), UInt64, (Ptr{TIFF},), tif)
end

function TIFFRasterScanlineSize(tif)
    ccall((:TIFFRasterScanlineSize, libtiff), tmsize_t, (Ptr{TIFF},), tif)
end

function TIFFStripSize64(tif)
    ccall((:TIFFStripSize64, libtiff), UInt64, (Ptr{TIFF},), tif)
end

function TIFFStripSize(tif)
    ccall((:TIFFStripSize, libtiff), tmsize_t, (Ptr{TIFF},), tif)
end

function TIFFRawStripSize64(tif, strip)
    ccall((:TIFFRawStripSize64, libtiff), UInt64, (Ptr{TIFF}, UInt32), tif, strip)
end

function TIFFRawStripSize(tif, strip)
    ccall((:TIFFRawStripSize, libtiff), tmsize_t, (Ptr{TIFF}, UInt32), tif, strip)
end

function TIFFVStripSize64(tif, nrows)
    ccall((:TIFFVStripSize64, libtiff), UInt64, (Ptr{TIFF}, UInt32), tif, nrows)
end

function TIFFVStripSize(tif, nrows)
    ccall((:TIFFVStripSize, libtiff), tmsize_t, (Ptr{TIFF}, UInt32), tif, nrows)
end

function TIFFTileRowSize64(tif)
    ccall((:TIFFTileRowSize64, libtiff), UInt64, (Ptr{TIFF},), tif)
end

function TIFFTileRowSize(tif)
    ccall((:TIFFTileRowSize, libtiff), tmsize_t, (Ptr{TIFF},), tif)
end

function TIFFTileSize64(tif)
    ccall((:TIFFTileSize64, libtiff), UInt64, (Ptr{TIFF},), tif)
end

function TIFFTileSize(tif)
    ccall((:TIFFTileSize, libtiff), tmsize_t, (Ptr{TIFF},), tif)
end

function TIFFVTileSize64(tif, nrows)
    ccall((:TIFFVTileSize64, libtiff), UInt64, (Ptr{TIFF}, UInt32), tif, nrows)
end

function TIFFVTileSize(tif, nrows)
    ccall((:TIFFVTileSize, libtiff), tmsize_t, (Ptr{TIFF}, UInt32), tif, nrows)
end

function TIFFDefaultStripSize(tif, request)
    ccall((:TIFFDefaultStripSize, libtiff), UInt32, (Ptr{TIFF}, UInt32), tif, request)
end

function TIFFDefaultTileSize(arg1, arg2, arg3)
    ccall((:TIFFDefaultTileSize, libtiff), Cvoid, (Ptr{TIFF}, Ptr{UInt32}, Ptr{UInt32}), arg1, arg2, arg3)
end

function TIFFFileno(arg1)
    ccall((:TIFFFileno, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFSetFileno(arg1, arg2)
    ccall((:TIFFSetFileno, libtiff), Cint, (Ptr{TIFF}, Cint), arg1, arg2)
end

function TIFFClientdata(arg1)
    ccall((:TIFFClientdata, libtiff), thandle_t, (Ptr{TIFF},), arg1)
end

function TIFFSetClientdata(arg1, arg2)
    ccall((:TIFFSetClientdata, libtiff), thandle_t, (Ptr{TIFF}, thandle_t), arg1, arg2)
end

function TIFFGetMode(arg1)
    ccall((:TIFFGetMode, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFSetMode(arg1, arg2)
    ccall((:TIFFSetMode, libtiff), Cint, (Ptr{TIFF}, Cint), arg1, arg2)
end

function TIFFIsTiled(arg1)
    ccall((:TIFFIsTiled, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFIsByteSwapped(arg1)
    ccall((:TIFFIsByteSwapped, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFIsUpSampled(arg1)
    ccall((:TIFFIsUpSampled, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFIsMSB2LSB(arg1)
    ccall((:TIFFIsMSB2LSB, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFIsBigEndian(arg1)
    ccall((:TIFFIsBigEndian, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFIsBigTIFF(arg1)
    ccall((:TIFFIsBigTIFF, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFGetReadProc(arg1)
    ccall((:TIFFGetReadProc, libtiff), TIFFReadWriteProc, (Ptr{TIFF},), arg1)
end

function TIFFGetWriteProc(arg1)
    ccall((:TIFFGetWriteProc, libtiff), TIFFReadWriteProc, (Ptr{TIFF},), arg1)
end

function TIFFGetSeekProc(arg1)
    ccall((:TIFFGetSeekProc, libtiff), TIFFSeekProc, (Ptr{TIFF},), arg1)
end

function TIFFGetCloseProc(arg1)
    ccall((:TIFFGetCloseProc, libtiff), TIFFCloseProc, (Ptr{TIFF},), arg1)
end

function TIFFGetSizeProc(arg1)
    ccall((:TIFFGetSizeProc, libtiff), TIFFSizeProc, (Ptr{TIFF},), arg1)
end

function TIFFGetMapFileProc(arg1)
    ccall((:TIFFGetMapFileProc, libtiff), TIFFMapFileProc, (Ptr{TIFF},), arg1)
end

function TIFFGetUnmapFileProc(arg1)
    ccall((:TIFFGetUnmapFileProc, libtiff), TIFFUnmapFileProc, (Ptr{TIFF},), arg1)
end

function TIFFCurrentRow(arg1)
    ccall((:TIFFCurrentRow, libtiff), UInt32, (Ptr{TIFF},), arg1)
end

function TIFFCurrentDirectory(arg1)
    ccall((:TIFFCurrentDirectory, libtiff), tdir_t, (Ptr{TIFF},), arg1)
end

function TIFFNumberOfDirectories(arg1)
    ccall((:TIFFNumberOfDirectories, libtiff), tdir_t, (Ptr{TIFF},), arg1)
end

function TIFFCurrentDirOffset(arg1)
    ccall((:TIFFCurrentDirOffset, libtiff), UInt64, (Ptr{TIFF},), arg1)
end

function TIFFCurrentStrip(arg1)
    ccall((:TIFFCurrentStrip, libtiff), UInt32, (Ptr{TIFF},), arg1)
end

function TIFFCurrentTile(tif)
    ccall((:TIFFCurrentTile, libtiff), UInt32, (Ptr{TIFF},), tif)
end

function TIFFReadBufferSetup(tif, bp, size)
    ccall((:TIFFReadBufferSetup, libtiff), Cint, (Ptr{TIFF}, Ptr{Cvoid}, tmsize_t), tif, bp, size)
end

function TIFFWriteBufferSetup(tif, bp, size)
    ccall((:TIFFWriteBufferSetup, libtiff), Cint, (Ptr{TIFF}, Ptr{Cvoid}, tmsize_t), tif, bp, size)
end

function TIFFSetupStrips(arg1)
    ccall((:TIFFSetupStrips, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFWriteCheck(arg1, arg2, arg3)
    ccall((:TIFFWriteCheck, libtiff), Cint, (Ptr{TIFF}, Cint, Ptr{Cchar}), arg1, arg2, arg3)
end

function TIFFFreeDirectory(arg1)
    ccall((:TIFFFreeDirectory, libtiff), Cvoid, (Ptr{TIFF},), arg1)
end

function TIFFCreateDirectory(arg1)
    ccall((:TIFFCreateDirectory, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFCreateCustomDirectory(arg1, arg2)
    ccall((:TIFFCreateCustomDirectory, libtiff), Cint, (Ptr{TIFF}, Ptr{TIFFFieldArray}), arg1, arg2)
end

function TIFFCreateEXIFDirectory(arg1)
    ccall((:TIFFCreateEXIFDirectory, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFCreateGPSDirectory(arg1)
    ccall((:TIFFCreateGPSDirectory, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFLastDirectory(arg1)
    ccall((:TIFFLastDirectory, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFSetDirectory(arg1, arg2)
    ccall((:TIFFSetDirectory, libtiff), Cint, (Ptr{TIFF}, tdir_t), arg1, arg2)
end

function TIFFSetSubDirectory(arg1, arg2)
    ccall((:TIFFSetSubDirectory, libtiff), Cint, (Ptr{TIFF}, UInt64), arg1, arg2)
end

function TIFFUnlinkDirectory(arg1, arg2)
    ccall((:TIFFUnlinkDirectory, libtiff), Cint, (Ptr{TIFF}, tdir_t), arg1, arg2)
end

function TIFFUnsetField(arg1, arg2)
    ccall((:TIFFUnsetField, libtiff), Cint, (Ptr{TIFF}, UInt32), arg1, arg2)
end

function TIFFWriteDirectory(arg1)
    ccall((:TIFFWriteDirectory, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFWriteCustomDirectory(arg1, arg2)
    ccall((:TIFFWriteCustomDirectory, libtiff), Cint, (Ptr{TIFF}, Ptr{UInt64}), arg1, arg2)
end

function TIFFCheckpointDirectory(arg1)
    ccall((:TIFFCheckpointDirectory, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFRewriteDirectory(arg1)
    ccall((:TIFFRewriteDirectory, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFDeferStrileArrayWriting(arg1)
    ccall((:TIFFDeferStrileArrayWriting, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFForceStrileArrayWriting(arg1)
    ccall((:TIFFForceStrileArrayWriting, libtiff), Cint, (Ptr{TIFF},), arg1)
end

function TIFFPrintDirectory(arg1, arg2, arg3)
    ccall((:TIFFPrintDirectory, libtiff), Cvoid, (Ptr{TIFF}, Ptr{Libc.FILE}, Clong), arg1, arg2, arg3)
end

function TIFFReadScanline(tif, buf, row, sample)
    ccall((:TIFFReadScanline, libtiff), Cint, (Ptr{TIFF}, Ptr{Cvoid}, UInt32, UInt16), tif, buf, row, sample)
end

function TIFFWriteScanline(tif, buf, row, sample)
    ccall((:TIFFWriteScanline, libtiff), Cint, (Ptr{TIFF}, Ptr{Cvoid}, UInt32, UInt16), tif, buf, row, sample)
end

function TIFFReadRGBAImage(arg1, arg2, arg3, arg4, arg5)
    ccall((:TIFFReadRGBAImage, libtiff), Cint, (Ptr{TIFF}, UInt32, UInt32, Ptr{UInt32}, Cint), arg1, arg2, arg3, arg4, arg5)
end

function TIFFReadRGBAImageOriented(arg1, arg2, arg3, arg4, arg5, arg6)
    ccall((:TIFFReadRGBAImageOriented, libtiff), Cint, (Ptr{TIFF}, UInt32, UInt32, Ptr{UInt32}, Cint, Cint), arg1, arg2, arg3, arg4, arg5, arg6)
end

function TIFFReadRGBAStrip(arg1, arg2, arg3)
    ccall((:TIFFReadRGBAStrip, libtiff), Cint, (Ptr{TIFF}, UInt32, Ptr{UInt32}), arg1, arg2, arg3)
end

function TIFFReadRGBATile(arg1, arg2, arg3, arg4)
    ccall((:TIFFReadRGBATile, libtiff), Cint, (Ptr{TIFF}, UInt32, UInt32, Ptr{UInt32}), arg1, arg2, arg3, arg4)
end

function TIFFReadRGBAStripExt(arg1, arg2, arg3, stop_on_error)
    ccall((:TIFFReadRGBAStripExt, libtiff), Cint, (Ptr{TIFF}, UInt32, Ptr{UInt32}, Cint), arg1, arg2, arg3, stop_on_error)
end

function TIFFReadRGBATileExt(arg1, arg2, arg3, arg4, stop_on_error)
    ccall((:TIFFReadRGBATileExt, libtiff), Cint, (Ptr{TIFF}, UInt32, UInt32, Ptr{UInt32}, Cint), arg1, arg2, arg3, arg4, stop_on_error)
end

function TIFFRGBAImageOK(arg1, arg2)
    ccall((:TIFFRGBAImageOK, libtiff), Cint, (Ptr{TIFF}, Ptr{Cchar}), arg1, arg2)
end

function TIFFRGBAImageBegin(arg1, arg2, arg3, arg4)
    ccall((:TIFFRGBAImageBegin, libtiff), Cint, (Ptr{TIFFRGBAImage}, Ptr{TIFF}, Cint, Ptr{Cchar}), arg1, arg2, arg3, arg4)
end

function TIFFRGBAImageGet(arg1, arg2, arg3, arg4)
    ccall((:TIFFRGBAImageGet, libtiff), Cint, (Ptr{TIFFRGBAImage}, Ptr{UInt32}, UInt32, UInt32), arg1, arg2, arg3, arg4)
end

function TIFFRGBAImageEnd(arg1)
    ccall((:TIFFRGBAImageEnd, libtiff), Cvoid, (Ptr{TIFFRGBAImage},), arg1)
end

function TIFFFileName(arg1)
    ccall((:TIFFFileName, libtiff), Ptr{Cchar}, (Ptr{TIFF},), arg1)
end

function TIFFSetFileName(arg1, arg2)
    ccall((:TIFFSetFileName, libtiff), Ptr{Cchar}, (Ptr{TIFF}, Ptr{Cchar}), arg1, arg2)
end

function TIFFSetErrorHandler(arg1)
    ccall((:TIFFSetErrorHandler, libtiff), TIFFErrorHandler, (TIFFErrorHandler,), arg1)
end

function TIFFSetErrorHandlerExt(arg1)
    ccall((:TIFFSetErrorHandlerExt, libtiff), TIFFErrorHandlerExt, (TIFFErrorHandlerExt,), arg1)
end

function TIFFSetWarningHandler(arg1)
    ccall((:TIFFSetWarningHandler, libtiff), TIFFErrorHandler, (TIFFErrorHandler,), arg1)
end

function TIFFSetWarningHandlerExt(arg1)
    ccall((:TIFFSetWarningHandlerExt, libtiff), TIFFErrorHandlerExt, (TIFFErrorHandlerExt,), arg1)
end

mutable struct TIFFOpenOptions end

function TIFFOpenOptionsAlloc()
    ccall((:TIFFOpenOptionsAlloc, libtiff), Ptr{TIFFOpenOptions}, ())
end

function TIFFOpenOptionsFree(arg1)
    ccall((:TIFFOpenOptionsFree, libtiff), Cvoid, (Ptr{TIFFOpenOptions},), arg1)
end

function TIFFOpenOptionsSetMaxSingleMemAlloc(opts, max_single_mem_alloc)
    ccall((:TIFFOpenOptionsSetMaxSingleMemAlloc, libtiff), Cvoid, (Ptr{TIFFOpenOptions}, tmsize_t), opts, max_single_mem_alloc)
end

function TIFFOpenOptionsSetErrorHandlerExtR(opts, handler, errorhandler_user_data)
    ccall((:TIFFOpenOptionsSetErrorHandlerExtR, libtiff), Cvoid, (Ptr{TIFFOpenOptions}, TIFFErrorHandlerExtR, Ptr{Cvoid}), opts, handler, errorhandler_user_data)
end

function TIFFOpenOptionsSetWarningHandlerExtR(opts, handler, warnhandler_user_data)
    ccall((:TIFFOpenOptionsSetWarningHandlerExtR, libtiff), Cvoid, (Ptr{TIFFOpenOptions}, TIFFErrorHandlerExtR, Ptr{Cvoid}), opts, handler, warnhandler_user_data)
end

function TIFFOpen(arg1, arg2)
    ccall((:TIFFOpen, libtiff), Ptr{TIFF}, (Ptr{Cchar}, Ptr{Cchar}), arg1, arg2)
end

function TIFFOpenExt(arg1, arg2, opts)
    ccall((:TIFFOpenExt, libtiff), Ptr{TIFF}, (Ptr{Cchar}, Ptr{Cchar}, Ptr{TIFFOpenOptions}), arg1, arg2, opts)
end

function TIFFFdOpen(arg1, arg2, arg3)
    ccall((:TIFFFdOpen, libtiff), Ptr{TIFF}, (Cint, Ptr{Cchar}, Ptr{Cchar}), arg1, arg2, arg3)
end

function TIFFFdOpenExt(arg1, arg2, arg3, opts)
    ccall((:TIFFFdOpenExt, libtiff), Ptr{TIFF}, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{TIFFOpenOptions}), arg1, arg2, arg3, opts)
end

function TIFFClientOpen(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
    ccall((:TIFFClientOpen, libtiff), Ptr{TIFF}, (Ptr{Cchar}, Ptr{Cchar}, thandle_t, TIFFReadWriteProc, TIFFReadWriteProc, TIFFSeekProc, TIFFCloseProc, TIFFSizeProc, TIFFMapFileProc, TIFFUnmapFileProc), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
end

function TIFFClientOpenExt(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, opts)
    ccall((:TIFFClientOpenExt, libtiff), Ptr{TIFF}, (Ptr{Cchar}, Ptr{Cchar}, thandle_t, TIFFReadWriteProc, TIFFReadWriteProc, TIFFSeekProc, TIFFCloseProc, TIFFSizeProc, TIFFMapFileProc, TIFFUnmapFileProc, Ptr{TIFFOpenOptions}), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, opts)
end

function TIFFSetTagExtender(arg1)
    ccall((:TIFFSetTagExtender, libtiff), TIFFExtendProc, (TIFFExtendProc,), arg1)
end

function TIFFComputeTile(tif, x, y, z, s)
    ccall((:TIFFComputeTile, libtiff), UInt32, (Ptr{TIFF}, UInt32, UInt32, UInt32, UInt16), tif, x, y, z, s)
end

function TIFFCheckTile(tif, x, y, z, s)
    ccall((:TIFFCheckTile, libtiff), Cint, (Ptr{TIFF}, UInt32, UInt32, UInt32, UInt16), tif, x, y, z, s)
end

function TIFFNumberOfTiles(arg1)
    ccall((:TIFFNumberOfTiles, libtiff), UInt32, (Ptr{TIFF},), arg1)
end

function TIFFReadTile(tif, buf, x, y, z, s)
    ccall((:TIFFReadTile, libtiff), tmsize_t, (Ptr{TIFF}, Ptr{Cvoid}, UInt32, UInt32, UInt32, UInt16), tif, buf, x, y, z, s)
end

function TIFFWriteTile(tif, buf, x, y, z, s)
    ccall((:TIFFWriteTile, libtiff), tmsize_t, (Ptr{TIFF}, Ptr{Cvoid}, UInt32, UInt32, UInt32, UInt16), tif, buf, x, y, z, s)
end

function TIFFComputeStrip(arg1, arg2, arg3)
    ccall((:TIFFComputeStrip, libtiff), UInt32, (Ptr{TIFF}, UInt32, UInt16), arg1, arg2, arg3)
end

function TIFFNumberOfStrips(arg1)
    ccall((:TIFFNumberOfStrips, libtiff), UInt32, (Ptr{TIFF},), arg1)
end

function TIFFReadEncodedStrip(tif, strip, buf, size)
    ccall((:TIFFReadEncodedStrip, libtiff), tmsize_t, (Ptr{TIFF}, UInt32, Ptr{Cvoid}, tmsize_t), tif, strip, buf, size)
end

function TIFFReadRawStrip(tif, strip, buf, size)
    ccall((:TIFFReadRawStrip, libtiff), tmsize_t, (Ptr{TIFF}, UInt32, Ptr{Cvoid}, tmsize_t), tif, strip, buf, size)
end

function TIFFReadEncodedTile(tif, tile, buf, size)
    ccall((:TIFFReadEncodedTile, libtiff), tmsize_t, (Ptr{TIFF}, UInt32, Ptr{Cvoid}, tmsize_t), tif, tile, buf, size)
end

function TIFFReadRawTile(tif, tile, buf, size)
    ccall((:TIFFReadRawTile, libtiff), tmsize_t, (Ptr{TIFF}, UInt32, Ptr{Cvoid}, tmsize_t), tif, tile, buf, size)
end

function TIFFReadFromUserBuffer(tif, strile, inbuf, insize, outbuf, outsize)
    ccall((:TIFFReadFromUserBuffer, libtiff), Cint, (Ptr{TIFF}, UInt32, Ptr{Cvoid}, tmsize_t, Ptr{Cvoid}, tmsize_t), tif, strile, inbuf, insize, outbuf, outsize)
end

function TIFFWriteEncodedStrip(tif, strip, data, cc)
    ccall((:TIFFWriteEncodedStrip, libtiff), tmsize_t, (Ptr{TIFF}, UInt32, Ptr{Cvoid}, tmsize_t), tif, strip, data, cc)
end

function TIFFWriteRawStrip(tif, strip, data, cc)
    ccall((:TIFFWriteRawStrip, libtiff), tmsize_t, (Ptr{TIFF}, UInt32, Ptr{Cvoid}, tmsize_t), tif, strip, data, cc)
end

function TIFFWriteEncodedTile(tif, tile, data, cc)
    ccall((:TIFFWriteEncodedTile, libtiff), tmsize_t, (Ptr{TIFF}, UInt32, Ptr{Cvoid}, tmsize_t), tif, tile, data, cc)
end

function TIFFWriteRawTile(tif, tile, data, cc)
    ccall((:TIFFWriteRawTile, libtiff), tmsize_t, (Ptr{TIFF}, UInt32, Ptr{Cvoid}, tmsize_t), tif, tile, data, cc)
end

function TIFFDataWidth(arg1)
    ccall((:TIFFDataWidth, libtiff), Cint, (TIFFDataType,), arg1)
end

function TIFFSetWriteOffset(tif, off)
    ccall((:TIFFSetWriteOffset, libtiff), Cvoid, (Ptr{TIFF}, toff_t), tif, off)
end

function TIFFSwabShort(arg1)
    ccall((:TIFFSwabShort, libtiff), Cvoid, (Ptr{UInt16},), arg1)
end

function TIFFSwabLong(arg1)
    ccall((:TIFFSwabLong, libtiff), Cvoid, (Ptr{UInt32},), arg1)
end

function TIFFSwabLong8(arg1)
    ccall((:TIFFSwabLong8, libtiff), Cvoid, (Ptr{UInt64},), arg1)
end

function TIFFSwabFloat(arg1)
    ccall((:TIFFSwabFloat, libtiff), Cvoid, (Ptr{Cfloat},), arg1)
end

function TIFFSwabDouble(arg1)
    ccall((:TIFFSwabDouble, libtiff), Cvoid, (Ptr{Cdouble},), arg1)
end

function TIFFSwabArrayOfShort(wp, n)
    ccall((:TIFFSwabArrayOfShort, libtiff), Cvoid, (Ptr{UInt16}, tmsize_t), wp, n)
end

function TIFFSwabArrayOfTriples(tp, n)
    ccall((:TIFFSwabArrayOfTriples, libtiff), Cvoid, (Ptr{UInt8}, tmsize_t), tp, n)
end

function TIFFSwabArrayOfLong(lp, n)
    ccall((:TIFFSwabArrayOfLong, libtiff), Cvoid, (Ptr{UInt32}, tmsize_t), lp, n)
end

function TIFFSwabArrayOfLong8(lp, n)
    ccall((:TIFFSwabArrayOfLong8, libtiff), Cvoid, (Ptr{UInt64}, tmsize_t), lp, n)
end

function TIFFSwabArrayOfFloat(fp, n)
    ccall((:TIFFSwabArrayOfFloat, libtiff), Cvoid, (Ptr{Cfloat}, tmsize_t), fp, n)
end

function TIFFSwabArrayOfDouble(dp, n)
    ccall((:TIFFSwabArrayOfDouble, libtiff), Cvoid, (Ptr{Cdouble}, tmsize_t), dp, n)
end

function TIFFReverseBits(cp, n)
    ccall((:TIFFReverseBits, libtiff), Cvoid, (Ptr{UInt8}, tmsize_t), cp, n)
end

function TIFFGetBitRevTable(arg1)
    ccall((:TIFFGetBitRevTable, libtiff), Ptr{Cuchar}, (Cint,), arg1)
end

function TIFFGetStrileOffset(tif, strile)
    ccall((:TIFFGetStrileOffset, libtiff), UInt64, (Ptr{TIFF}, UInt32), tif, strile)
end

function TIFFGetStrileByteCount(tif, strile)
    ccall((:TIFFGetStrileByteCount, libtiff), UInt64, (Ptr{TIFF}, UInt32), tif, strile)
end

function TIFFGetStrileOffsetWithErr(tif, strile, pbErr)
    ccall((:TIFFGetStrileOffsetWithErr, libtiff), UInt64, (Ptr{TIFF}, UInt32, Ptr{Cint}), tif, strile, pbErr)
end

function TIFFGetStrileByteCountWithErr(tif, strile, pbErr)
    ccall((:TIFFGetStrileByteCountWithErr, libtiff), UInt64, (Ptr{TIFF}, UInt32, Ptr{Cint}), tif, strile, pbErr)
end

function LogL16toY(arg1)
    ccall((:LogL16toY, libtiff), Cdouble, (Cint,), arg1)
end

function LogL10toY(arg1)
    ccall((:LogL10toY, libtiff), Cdouble, (Cint,), arg1)
end

function XYZtoRGB24(arg1, arg2)
    ccall((:XYZtoRGB24, libtiff), Cvoid, (Ptr{Cfloat}, Ptr{UInt8}), arg1, arg2)
end

function uv_decode(arg1, arg2, arg3)
    ccall((:uv_decode, libtiff), Cint, (Ptr{Cdouble}, Ptr{Cdouble}, Cint), arg1, arg2, arg3)
end

function LogLuv24toXYZ(arg1, arg2)
    ccall((:LogLuv24toXYZ, libtiff), Cvoid, (UInt32, Ptr{Cfloat}), arg1, arg2)
end

function LogLuv32toXYZ(arg1, arg2)
    ccall((:LogLuv32toXYZ, libtiff), Cvoid, (UInt32, Ptr{Cfloat}), arg1, arg2)
end

function LogL16fromY(arg1, arg2)
    ccall((:LogL16fromY, libtiff), Cint, (Cdouble, Cint), arg1, arg2)
end

function LogL10fromY(arg1, arg2)
    ccall((:LogL10fromY, libtiff), Cint, (Cdouble, Cint), arg1, arg2)
end

function uv_encode(arg1, arg2, arg3)
    ccall((:uv_encode, libtiff), Cint, (Cdouble, Cdouble, Cint), arg1, arg2, arg3)
end

function LogLuv24fromXYZ(arg1, arg2)
    ccall((:LogLuv24fromXYZ, libtiff), UInt32, (Ptr{Cfloat}, Cint), arg1, arg2)
end

function LogLuv32fromXYZ(arg1, arg2)
    ccall((:LogLuv32fromXYZ, libtiff), UInt32, (Ptr{Cfloat}, Cint), arg1, arg2)
end

function TIFFCIELabToRGBInit(arg1, arg2, arg3)
    ccall((:TIFFCIELabToRGBInit, libtiff), Cint, (Ptr{TIFFCIELabToRGB}, Ptr{TIFFDisplay}, Ptr{Cfloat}), arg1, arg2, arg3)
end

function TIFFCIELabToXYZ(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    ccall((:TIFFCIELabToXYZ, libtiff), Cvoid, (Ptr{TIFFCIELabToRGB}, UInt32, Int32, Int32, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}), arg1, arg2, arg3, arg4, arg5, arg6, arg7)
end

function TIFFXYZToRGB(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    ccall((:TIFFXYZToRGB, libtiff), Cvoid, (Ptr{TIFFCIELabToRGB}, Cfloat, Cfloat, Cfloat, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), arg1, arg2, arg3, arg4, arg5, arg6, arg7)
end

function TIFFYCbCrToRGBInit(arg1, arg2, arg3)
    ccall((:TIFFYCbCrToRGBInit, libtiff), Cint, (Ptr{TIFFYCbCrToRGB}, Ptr{Cfloat}, Ptr{Cfloat}), arg1, arg2, arg3)
end

function TIFFYCbCrtoRGB(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    ccall((:TIFFYCbCrtoRGB, libtiff), Cvoid, (Ptr{TIFFYCbCrToRGB}, UInt32, Int32, Int32, Ptr{UInt32}, Ptr{UInt32}, Ptr{UInt32}), arg1, arg2, arg3, arg4, arg5, arg6, arg7)
end

struct TIFFFieldInfo
    field_tag::ttag_t
    field_readcount::Cshort
    field_writecount::Cshort
    field_type::TIFFDataType
    field_bit::Cushort
    field_oktochange::Cuchar
    field_passcount::Cuchar
    field_name::Ptr{Cchar}
end

function TIFFMergeFieldInfo(arg1, arg2, arg3)
    ccall((:TIFFMergeFieldInfo, libtiff), Cint, (Ptr{TIFF}, Ptr{TIFFFieldInfo}, UInt32), arg1, arg2, arg3)
end

const TIFF_VERSION_CLASSIC = 42

const TIFF_VERSION_BIG = 43

const TIFF_BIGENDIAN = 0x4d4d

const TIFF_LITTLEENDIAN = 0x4949

const MDI_LITTLEENDIAN = 0x5045

const MDI_BIGENDIAN = 0x4550

# Skipping MacroDefinition: TIFF_GCC_DEPRECATED __attribute__ ( ( deprecated ) )

const TIFFTAG_SUBFILETYPE = 254

const FILETYPE_REDUCEDIMAGE = 0x01

const FILETYPE_PAGE = 0x02

const FILETYPE_MASK = 0x04

const TIFFTAG_OSUBFILETYPE = 255

const OFILETYPE_IMAGE = 1

const OFILETYPE_REDUCEDIMAGE = 2

const OFILETYPE_PAGE = 3

const TIFFTAG_IMAGEWIDTH = 256

const TIFFTAG_IMAGELENGTH = 257

const TIFFTAG_BITSPERSAMPLE = 258

const TIFFTAG_COMPRESSION = 259

const COMPRESSION_NONE = 1

const COMPRESSION_CCITTRLE = 2

const COMPRESSION_CCITTFAX3 = 3

const COMPRESSION_CCITT_T4 = 3

const COMPRESSION_CCITTFAX4 = 4

const COMPRESSION_CCITT_T6 = 4

const COMPRESSION_LZW = 5

const COMPRESSION_OJPEG = 6

const COMPRESSION_JPEG = 7

const COMPRESSION_T85 = 9

const COMPRESSION_T43 = 10

const COMPRESSION_NEXT = 32766

const COMPRESSION_CCITTRLEW = 32771

const COMPRESSION_PACKBITS = 32773

const COMPRESSION_THUNDERSCAN = 32809

const COMPRESSION_IT8CTPAD = 32895

const COMPRESSION_IT8LW = 32896

const COMPRESSION_IT8MP = 32897

const COMPRESSION_IT8BL = 32898

const COMPRESSION_PIXARFILM = 32908

const COMPRESSION_PIXARLOG = 32909

const COMPRESSION_DEFLATE = 32946

const COMPRESSION_ADOBE_DEFLATE = 8

const COMPRESSION_DCS = 32947

const COMPRESSION_JBIG = 34661

const COMPRESSION_SGILOG = 34676

const COMPRESSION_SGILOG24 = 34677

const COMPRESSION_JP2000 = 34712

const COMPRESSION_LERC = 34887

const COMPRESSION_LZMA = 34925

const COMPRESSION_ZSTD = 50000

const COMPRESSION_WEBP = 50001

const COMPRESSION_JXL = 50002

const TIFFTAG_PHOTOMETRIC = 262

const PHOTOMETRIC_MINISWHITE = 0

const PHOTOMETRIC_MINISBLACK = 1

const PHOTOMETRIC_RGB = 2

const PHOTOMETRIC_PALETTE = 3

const PHOTOMETRIC_MASK = 4

const PHOTOMETRIC_SEPARATED = 5

const PHOTOMETRIC_YCBCR = 6

const PHOTOMETRIC_CIELAB = 8

const PHOTOMETRIC_ICCLAB = 9

const PHOTOMETRIC_ITULAB = 10

const PHOTOMETRIC_CFA = 32803

const PHOTOMETRIC_LOGL = 32844

const PHOTOMETRIC_LOGLUV = 32845

const TIFFTAG_THRESHHOLDING = 263

const THRESHHOLD_BILEVEL = 1

const THRESHHOLD_HALFTONE = 2

const THRESHHOLD_ERRORDIFFUSE = 3

const TIFFTAG_CELLWIDTH = 264

const TIFFTAG_CELLLENGTH = 265

const TIFFTAG_FILLORDER = 266

const FILLORDER_MSB2LSB = 1

const FILLORDER_LSB2MSB = 2

const TIFFTAG_DOCUMENTNAME = 269

const TIFFTAG_IMAGEDESCRIPTION = 270

const TIFFTAG_MAKE = 271

const TIFFTAG_MODEL = 272

const TIFFTAG_STRIPOFFSETS = 273

const TIFFTAG_ORIENTATION = 274

const ORIENTATION_TOPLEFT = 1

const ORIENTATION_TOPRIGHT = 2

const ORIENTATION_BOTRIGHT = 3

const ORIENTATION_BOTLEFT = 4

const ORIENTATION_LEFTTOP = 5

const ORIENTATION_RIGHTTOP = 6

const ORIENTATION_RIGHTBOT = 7

const ORIENTATION_LEFTBOT = 8

const TIFFTAG_SAMPLESPERPIXEL = 277

const TIFFTAG_ROWSPERSTRIP = 278

const TIFFTAG_STRIPBYTECOUNTS = 279

const TIFFTAG_MINSAMPLEVALUE = 280

const TIFFTAG_MAXSAMPLEVALUE = 281

const TIFFTAG_XRESOLUTION = 282

const TIFFTAG_YRESOLUTION = 283

const TIFFTAG_PLANARCONFIG = 284

const PLANARCONFIG_CONTIG = 1

const PLANARCONFIG_SEPARATE = 2

const TIFFTAG_PAGENAME = 285

const TIFFTAG_XPOSITION = 286

const TIFFTAG_YPOSITION = 287

const TIFFTAG_FREEOFFSETS = 288

const TIFFTAG_FREEBYTECOUNTS = 289

const TIFFTAG_GRAYRESPONSEUNIT = 290

const GRAYRESPONSEUNIT_10S = 1

const GRAYRESPONSEUNIT_100S = 2

const GRAYRESPONSEUNIT_1000S = 3

const GRAYRESPONSEUNIT_10000S = 4

const GRAYRESPONSEUNIT_100000S = 5

const TIFFTAG_GRAYRESPONSECURVE = 291

const TIFFTAG_GROUP3OPTIONS = 292

const TIFFTAG_T4OPTIONS = 292

const GROUP3OPT_2DENCODING = 0x01

const GROUP3OPT_UNCOMPRESSED = 0x02

const GROUP3OPT_FILLBITS = 0x04

const TIFFTAG_GROUP4OPTIONS = 293

const TIFFTAG_T6OPTIONS = 293

const GROUP4OPT_UNCOMPRESSED = 0x02

const TIFFTAG_RESOLUTIONUNIT = 296

const RESUNIT_NONE = 1

const RESUNIT_INCH = 2

const RESUNIT_CENTIMETER = 3

const TIFFTAG_PAGENUMBER = 297

const TIFFTAG_COLORRESPONSEUNIT = 300

const COLORRESPONSEUNIT_10S = 1

const COLORRESPONSEUNIT_100S = 2

const COLORRESPONSEUNIT_1000S = 3

const COLORRESPONSEUNIT_10000S = 4

const COLORRESPONSEUNIT_100000S = 5

const TIFFTAG_TRANSFERFUNCTION = 301

const TIFFTAG_SOFTWARE = 305

const TIFFTAG_DATETIME = 306

const TIFFTAG_ARTIST = 315

const TIFFTAG_HOSTCOMPUTER = 316

const TIFFTAG_PREDICTOR = 317

const PREDICTOR_NONE = 1

const PREDICTOR_HORIZONTAL = 2

const PREDICTOR_FLOATINGPOINT = 3

const TIFFTAG_WHITEPOINT = 318

const TIFFTAG_PRIMARYCHROMATICITIES = 319

const TIFFTAG_COLORMAP = 320

const TIFFTAG_HALFTONEHINTS = 321

const TIFFTAG_TILEWIDTH = 322

const TIFFTAG_TILELENGTH = 323

const TIFFTAG_TILEOFFSETS = 324

const TIFFTAG_TILEBYTECOUNTS = 325

const TIFFTAG_BADFAXLINES = 326

const TIFFTAG_CLEANFAXDATA = 327

const CLEANFAXDATA_CLEAN = 0

const CLEANFAXDATA_REGENERATED = 1

const CLEANFAXDATA_UNCLEAN = 2

const TIFFTAG_CONSECUTIVEBADFAXLINES = 328

const TIFFTAG_SUBIFD = 330

const TIFFTAG_INKSET = 332

const INKSET_CMYK = 1

const INKSET_MULTIINK = 2

const TIFFTAG_INKNAMES = 333

const TIFFTAG_NUMBEROFINKS = 334

const TIFFTAG_DOTRANGE = 336

const TIFFTAG_TARGETPRINTER = 337

const TIFFTAG_EXTRASAMPLES = 338

const EXTRASAMPLE_UNSPECIFIED = 0

const EXTRASAMPLE_ASSOCALPHA = 1

const EXTRASAMPLE_UNASSALPHA = 2

const TIFFTAG_SAMPLEFORMAT = 339

const SAMPLEFORMAT_UINT = 1

const SAMPLEFORMAT_INT = 2

const SAMPLEFORMAT_IEEEFP = 3

const SAMPLEFORMAT_VOID = 4

const SAMPLEFORMAT_COMPLEXINT = 5

const SAMPLEFORMAT_COMPLEXIEEEFP = 6

const TIFFTAG_SMINSAMPLEVALUE = 340

const TIFFTAG_SMAXSAMPLEVALUE = 341

const TIFFTAG_CLIPPATH = 343

const TIFFTAG_XCLIPPATHUNITS = 344

const TIFFTAG_YCLIPPATHUNITS = 345

const TIFFTAG_INDEXED = 346

const TIFFTAG_JPEGTABLES = 347

const TIFFTAG_OPIPROXY = 351

const TIFFTAG_GLOBALPARAMETERSIFD = 400

const TIFFTAG_PROFILETYPE = 401

const PROFILETYPE_UNSPECIFIED = 0

const PROFILETYPE_G3_FAX = 1

const TIFFTAG_FAXPROFILE = 402

const FAXPROFILE_S = 1

const FAXPROFILE_F = 2

const FAXPROFILE_J = 3

const FAXPROFILE_C = 4

const FAXPROFILE_L = 5

const FAXPROFILE_M = 6

const TIFFTAG_CODINGMETHODS = 403

const CODINGMETHODS_T4_1D = 1 << 1

const CODINGMETHODS_T4_2D = 1 << 2

const CODINGMETHODS_T6 = 1 << 3

const CODINGMETHODS_T85 = 1 << 4

const CODINGMETHODS_T42 = 1 << 5

const CODINGMETHODS_T43 = 1 << 6

const TIFFTAG_VERSIONYEAR = 404

const TIFFTAG_MODENUMBER = 405

const TIFFTAG_DECODE = 433

const TIFFTAG_IMAGEBASECOLOR = 434

const TIFFTAG_T82OPTIONS = 435

const TIFFTAG_JPEGPROC = 512

const JPEGPROC_BASELINE = 1

const JPEGPROC_LOSSLESS = 14

const TIFFTAG_JPEGIFOFFSET = 513

const TIFFTAG_JPEGIFBYTECOUNT = 514

const TIFFTAG_JPEGRESTARTINTERVAL = 515

const TIFFTAG_JPEGLOSSLESSPREDICTORS = 517

const TIFFTAG_JPEGPOINTTRANSFORM = 518

const TIFFTAG_JPEGQTABLES = 519

const TIFFTAG_JPEGDCTABLES = 520

const TIFFTAG_JPEGACTABLES = 521

const TIFFTAG_YCBCRCOEFFICIENTS = 529

const TIFFTAG_YCBCRSUBSAMPLING = 530

const TIFFTAG_YCBCRPOSITIONING = 531

const YCBCRPOSITION_CENTERED = 1

const YCBCRPOSITION_COSITED = 2

const TIFFTAG_REFERENCEBLACKWHITE = 532

const TIFFTAG_STRIPROWCOUNTS = 559

const TIFFTAG_XMLPACKET = 700

const TIFFTAG_OPIIMAGEID = 32781

const TIFFTAG_TIFFANNOTATIONDATA = 32932

const TIFFTAG_REFPTS = 32953

const TIFFTAG_REGIONTACKPOINT = 32954

const TIFFTAG_REGIONWARPCORNERS = 32955

const TIFFTAG_REGIONAFFINE = 32956

const TIFFTAG_MATTEING = 32995

const TIFFTAG_DATATYPE = 32996

const TIFFTAG_IMAGEDEPTH = 32997

const TIFFTAG_TILEDEPTH = 32998

const TIFFTAG_PIXAR_IMAGEFULLWIDTH = 33300

const TIFFTAG_PIXAR_IMAGEFULLLENGTH = 33301

const TIFFTAG_PIXAR_TEXTUREFORMAT = 33302

const TIFFTAG_PIXAR_WRAPMODES = 33303

const TIFFTAG_PIXAR_FOVCOT = 33304

const TIFFTAG_PIXAR_MATRIX_WORLDTOSCREEN = 33305

const TIFFTAG_PIXAR_MATRIX_WORLDTOCAMERA = 33306

const TIFFTAG_WRITERSERIALNUMBER = 33405

const TIFFTAG_CFAREPEATPATTERNDIM = 33421

const TIFFTAG_CFAPATTERN = 33422

const TIFFTAG_BATTERYLEVEL = 33423

const TIFFTAG_COPYRIGHT = 33432

const TIFFTAG_MD_FILETAG = 33445

const TIFFTAG_MD_SCALEPIXEL = 33446

const TIFFTAG_MD_COLORTABLE = 33447

const TIFFTAG_MD_LABNAME = 33448

const TIFFTAG_MD_SAMPLEINFO = 33449

const TIFFTAG_MD_PREPDATE = 33450

const TIFFTAG_MD_PREPTIME = 33451

const TIFFTAG_MD_FILEUNITS = 33452

const TIFFTAG_RICHTIFFIPTC = 33723

const TIFFTAG_INGR_PACKET_DATA_TAG = 33918

const TIFFTAG_INGR_FLAG_REGISTERS = 33919

const TIFFTAG_IRASB_TRANSORMATION_MATRIX = 33920

const TIFFTAG_MODELTIEPOINTTAG = 33922

const TIFFTAG_IT8SITE = 34016

const TIFFTAG_IT8COLORSEQUENCE = 34017

const TIFFTAG_IT8HEADER = 34018

const TIFFTAG_IT8RASTERPADDING = 34019

const TIFFTAG_IT8BITSPERRUNLENGTH = 34020

const TIFFTAG_IT8BITSPEREXTENDEDRUNLENGTH = 34021

const TIFFTAG_IT8COLORTABLE = 34022

const TIFFTAG_IT8IMAGECOLORINDICATOR = 34023

const TIFFTAG_IT8BKGCOLORINDICATOR = 34024

const TIFFTAG_IT8IMAGECOLORVALUE = 34025

const TIFFTAG_IT8BKGCOLORVALUE = 34026

const TIFFTAG_IT8PIXELINTENSITYRANGE = 34027

const TIFFTAG_IT8TRANSPARENCYINDICATOR = 34028

const TIFFTAG_IT8COLORCHARACTERIZATION = 34029

const TIFFTAG_IT8HCUSAGE = 34030

const TIFFTAG_IT8TRAPINDICATOR = 34031

const TIFFTAG_IT8CMYKEQUIVALENT = 34032

const TIFFTAG_FRAMECOUNT = 34232

const TIFFTAG_MODELTRANSFORMATIONTAG = 34264

const TIFFTAG_PHOTOSHOP = 34377

const TIFFTAG_EXIFIFD = 34665

const TIFFTAG_ICCPROFILE = 34675

const TIFFTAG_IMAGELAYER = 34732

const TIFFTAG_JBIGOPTIONS = 34750

const TIFFTAG_GPSIFD = 34853

const TIFFTAG_FAXRECVPARAMS = 34908

const TIFFTAG_FAXSUBADDRESS = 34909

const TIFFTAG_FAXRECVTIME = 34910

const TIFFTAG_FAXDCS = 34911

const TIFFTAG_STONITS = 37439

const TIFFTAG_FEDEX_EDR = 34929

const TIFFTAG_IMAGESOURCEDATA = 37724

const TIFFTAG_INTEROPERABILITYIFD = 40965

const TIFFTAG_GDAL_METADATA = 42112

const TIFFTAG_GDAL_NODATA = 42113

const TIFFTAG_OCE_SCANJOB_DESCRIPTION = 50215

const TIFFTAG_OCE_APPLICATION_SELECTOR = 50216

const TIFFTAG_OCE_IDENTIFICATION_NUMBER = 50217

const TIFFTAG_OCE_IMAGELOGIC_CHARACTERISTICS = 50218

const TIFFTAG_LERC_PARAMETERS = 50674

const TIFFTAG_DNGVERSION = 50706

const TIFFTAG_DNGBACKWARDVERSION = 50707

const TIFFTAG_UNIQUECAMERAMODEL = 50708

const TIFFTAG_LOCALIZEDCAMERAMODEL = 50709

const TIFFTAG_CFAPLANECOLOR = 50710

const TIFFTAG_CFALAYOUT = 50711

const TIFFTAG_LINEARIZATIONTABLE = 50712

const TIFFTAG_BLACKLEVELREPEATDIM = 50713

const TIFFTAG_BLACKLEVEL = 50714

const TIFFTAG_BLACKLEVELDELTAH = 50715

const TIFFTAG_BLACKLEVELDELTAV = 50716

const TIFFTAG_WHITELEVEL = 50717

const TIFFTAG_DEFAULTSCALE = 50718

const TIFFTAG_DEFAULTCROPORIGIN = 50719

const TIFFTAG_DEFAULTCROPSIZE = 50720

const TIFFTAG_COLORMATRIX1 = 50721

const TIFFTAG_COLORMATRIX2 = 50722

const TIFFTAG_CAMERACALIBRATION1 = 50723

const TIFFTAG_CAMERACALIBRATION2 = 50724

const TIFFTAG_REDUCTIONMATRIX1 = 50725

const TIFFTAG_REDUCTIONMATRIX2 = 50726

const TIFFTAG_ANALOGBALANCE = 50727

const TIFFTAG_ASSHOTNEUTRAL = 50728

const TIFFTAG_ASSHOTWHITEXY = 50729

const TIFFTAG_BASELINEEXPOSURE = 50730

const TIFFTAG_BASELINENOISE = 50731

const TIFFTAG_BASELINESHARPNESS = 50732

const TIFFTAG_BAYERGREENSPLIT = 50733

const TIFFTAG_LINEARRESPONSELIMIT = 50734

const TIFFTAG_CAMERASERIALNUMBER = 50735

const TIFFTAG_LENSINFO = 50736

const TIFFTAG_CHROMABLURRADIUS = 50737

const TIFFTAG_ANTIALIASSTRENGTH = 50738

const TIFFTAG_SHADOWSCALE = 50739

const TIFFTAG_DNGPRIVATEDATA = 50740

const TIFFTAG_MAKERNOTESAFETY = 50741

const TIFFTAG_CALIBRATIONILLUMINANT1 = 50778

const TIFFTAG_CALIBRATIONILLUMINANT2 = 50779

const TIFFTAG_BESTQUALITYSCALE = 50780

const TIFFTAG_RAWDATAUNIQUEID = 50781

const TIFFTAG_ORIGINALRAWFILENAME = 50827

const TIFFTAG_ORIGINALRAWFILEDATA = 50828

const TIFFTAG_ACTIVEAREA = 50829

const TIFFTAG_MASKEDAREAS = 50830

const TIFFTAG_ASSHOTICCPROFILE = 50831

const TIFFTAG_ASSHOTPREPROFILEMATRIX = 50832

const TIFFTAG_CURRENTICCPROFILE = 50833

const TIFFTAG_CURRENTPREPROFILEMATRIX = 50834

const TIFFTAG_COLORIMETRICREFERENCE = 50879

const TIFFTAG_CAMERACALIBRATIONSIGNATURE = 50931

const TIFFTAG_PROFILECALIBRATIONSIGNATURE = 50932

const TIFFTAG_ASSHOTPROFILENAME = 50934

const TIFFTAG_NOISEREDUCTIONAPPLIED = 50935

const TIFFTAG_PROFILENAME = 50936

const TIFFTAG_PROFILEHUESATMAPDIMS = 50937

const TIFFTAG_PROFILEHUESATMAPDATA1 = 50938

const TIFFTAG_PROFILEHUESATMAPDATA2 = 50939

const TIFFTAG_PROFILETONECURVE = 50940

const TIFFTAG_PROFILEEMBEDPOLICY = 50941

const TIFFTAG_PROFILECOPYRIGHT = 50942

const TIFFTAG_FORWARDMATRIX1 = 50964

const TIFFTAG_FORWARDMATRIX2 = 50965

const TIFFTAG_PREVIEWAPPLICATIONNAME = 50966

const TIFFTAG_PREVIEWAPPLICATIONVERSION = 50967

const TIFFTAG_PREVIEWSETTINGSNAME = 50968

const TIFFTAG_PREVIEWSETTINGSDIGEST = 50969

const TIFFTAG_PREVIEWCOLORSPACE = 50970

const TIFFTAG_PREVIEWDATETIME = 50971

const TIFFTAG_RAWIMAGEDIGEST = 50972

const TIFFTAG_ORIGINALRAWFILEDIGEST = 50973

const TIFFTAG_SUBTILEBLOCKSIZE = 50974

const TIFFTAG_ROWINTERLEAVEFACTOR = 50975

const TIFFTAG_PROFILELOOKTABLEDIMS = 50981

const TIFFTAG_PROFILELOOKTABLEDATA = 50982

const TIFFTAG_OPCODELIST1 = 51008

const TIFFTAG_OPCODELIST2 = 51009

const TIFFTAG_OPCODELIST3 = 51022

const TIFFTAG_NOISEPROFILE = 51041

const TIFFTAG_DEFAULTUSERCROP = 51125

const TIFFTAG_DEFAULTBLACKRENDER = 51110

const TIFFTAG_BASELINEEXPOSUREOFFSET = 51109

const TIFFTAG_PROFILELOOKTABLEENCODING = 51108

const TIFFTAG_PROFILEHUESATMAPENCODING = 51107

const TIFFTAG_ORIGINALDEFAULTFINALSIZE = 51089

const TIFFTAG_ORIGINALBESTQUALITYFINALSIZE = 51090

const TIFFTAG_ORIGINALDEFAULTCROPSIZE = 51091

const TIFFTAG_NEWRAWIMAGEDIGEST = 51111

const TIFFTAG_RAWTOPREVIEWGAIN = 51112

const TIFFTAG_DEPTHFORMAT = 51177

const TIFFTAG_DEPTHNEAR = 51178

const TIFFTAG_DEPTHFAR = 51179

const TIFFTAG_DEPTHUNITS = 51180

const TIFFTAG_DEPTHMEASURETYPE = 51181

const TIFFTAG_ENHANCEPARAMS = 51182

const TIFFTAG_PROFILEGAINTABLEMAP = 52525

const TIFFTAG_SEMANTICNAME = 52526

const TIFFTAG_SEMANTICINSTANCEID = 52528

const TIFFTAG_MASKSUBAREA = 52536

const TIFFTAG_RGBTABLES = 52543

const TIFFTAG_CALIBRATIONILLUMINANT3 = 52529

const TIFFTAG_COLORMATRIX3 = 52531

const TIFFTAG_CAMERACALIBRATION3 = 52530

const TIFFTAG_REDUCTIONMATRIX3 = 52538

const TIFFTAG_PROFILEHUESATMAPDATA3 = 52537

const TIFFTAG_FORWARDMATRIX3 = 52532

const TIFFTAG_ILLUMINANTDATA1 = 52533

const TIFFTAG_ILLUMINANTDATA2 = 52534

const TIFFTAG_ILLUMINANTDATA3 = 53535

const TIFFTAG_EP_CFAREPEATPATTERNDIM = 33421

const TIFFTAG_EP_CFAPATTERN = 33422

const TIFFTAG_EP_BATTERYLEVEL = 33423

const TIFFTAG_EP_INTERLACE = 34857

const TIFFTAG_EP_IPTC_NAA = 33723

const TIFFTAG_EP_TIMEZONEOFFSET = 34858

const TIFFTAG_EP_SELFTIMERMODE = 34859

const TIFFTAG_EP_FLASHENERGY = 37387

const TIFFTAG_EP_SPATIALFREQUENCYRESPONSE = 37388

const TIFFTAG_EP_NOISE = 37389

const TIFFTAG_EP_FOCALPLANEXRESOLUTION = 37390

const TIFFTAG_EP_FOCALPLANEYRESOLUTION = 37391

const TIFFTAG_EP_FOCALPLANERESOLUTIONUNIT = 37392

const TIFFTAG_EP_IMAGENUMBER = 37393

const TIFFTAG_EP_SECURITYCLASSIFICATION = 37394

const TIFFTAG_EP_IMAGEHISTORY = 37395

const TIFFTAG_EP_EXPOSUREINDEX = 37397

const TIFFTAG_EP_STANDARDID = 37398

const TIFFTAG_EP_SENSINGMETHOD = 37399

const TIFFTAG_EP_EXPOSURETIME = 33434

const TIFFTAG_EP_FNUMBER = 33437

const TIFFTAG_EP_EXPOSUREPROGRAM = 34850

const TIFFTAG_EP_SPECTRALSENSITIVITY = 34852

const TIFFTAG_EP_ISOSPEEDRATINGS = 34855

const TIFFTAG_EP_OECF = 34856

const TIFFTAG_EP_DATETIMEORIGINAL = 36867

const TIFFTAG_EP_COMPRESSEDBITSPERPIXEL = 37122

const TIFFTAG_EP_SHUTTERSPEEDVALUE = 37377

const TIFFTAG_EP_APERTUREVALUE = 37378

const TIFFTAG_EP_BRIGHTNESSVALUE = 37379

const TIFFTAG_EP_EXPOSUREBIASVALUE = 37380

const TIFFTAG_EP_MAXAPERTUREVALUE = 37381

const TIFFTAG_EP_SUBJECTDISTANCE = 37382

const TIFFTAG_EP_METERINGMODE = 37383

const TIFFTAG_EP_LIGHTSOURCE = 37384

const TIFFTAG_EP_FLASH = 37385

const TIFFTAG_EP_FOCALLENGTH = 37386

const TIFFTAG_EP_SUBJECTLOCATION = 37396

const TIFFTAG_RPCCOEFFICIENT = 50844

const TIFFTAG_ALIAS_LAYER_METADATA = 50784

const TIFFTAG_TIFF_RSID = 50908

const TIFFTAG_GEO_METADATA = 50909

const TIFFTAG_EXTRACAMERAPROFILES = 50933

const TIFFTAG_DCSHUESHIFTVALUES = 65535

const TIFFTAG_FAXMODE = 65536

const FAXMODE_CLASSIC = 0x0000

const FAXMODE_NORTC = 0x0001

const FAXMODE_NOEOL = 0x0002

const FAXMODE_BYTEALIGN = 0x0004

const FAXMODE_WORDALIGN = 0x0008

const FAXMODE_CLASSF = FAXMODE_NORTC

const TIFFTAG_JPEGQUALITY = 65537

const TIFFTAG_JPEGCOLORMODE = 65538

const JPEGCOLORMODE_RAW = 0x0000

const JPEGCOLORMODE_RGB = 0x0001

const TIFFTAG_JPEGTABLESMODE = 65539

const JPEGTABLESMODE_QUANT = 0x0001

const JPEGTABLESMODE_HUFF = 0x0002

const TIFFTAG_FAXFILLFUNC = 65540

const TIFFTAG_PIXARLOGDATAFMT = 65549

const PIXARLOGDATAFMT_8BIT = 0

const PIXARLOGDATAFMT_8BITABGR = 1

const PIXARLOGDATAFMT_11BITLOG = 2

const PIXARLOGDATAFMT_12BITPICIO = 3

const PIXARLOGDATAFMT_16BIT = 4

const PIXARLOGDATAFMT_FLOAT = 5

const TIFFTAG_DCSIMAGERTYPE = 65550

const DCSIMAGERMODEL_M3 = 0

const DCSIMAGERMODEL_M5 = 1

const DCSIMAGERMODEL_M6 = 2

const DCSIMAGERFILTER_IR = 0

const DCSIMAGERFILTER_MONO = 1

const DCSIMAGERFILTER_CFA = 2

const DCSIMAGERFILTER_OTHER = 3

const TIFFTAG_DCSINTERPMODE = 65551

const DCSINTERPMODE_NORMAL = 0x00

const DCSINTERPMODE_PREVIEW = 0x01

const TIFFTAG_DCSBALANCEARRAY = 65552

const TIFFTAG_DCSCORRECTMATRIX = 65553

const TIFFTAG_DCSGAMMA = 65554

const TIFFTAG_DCSTOESHOULDERPTS = 65555

const TIFFTAG_DCSCALIBRATIONFD = 65556

const TIFFTAG_ZIPQUALITY = 65557

const TIFFTAG_PIXARLOGQUALITY = 65558

const TIFFTAG_DCSCLIPRECTANGLE = 65559

const TIFFTAG_SGILOGDATAFMT = 65560

const SGILOGDATAFMT_FLOAT = 0

const SGILOGDATAFMT_16BIT = 1

const SGILOGDATAFMT_RAW = 2

const SGILOGDATAFMT_8BIT = 3

const TIFFTAG_SGILOGENCODE = 65561

const SGILOGENCODE_NODITHER = 0

const SGILOGENCODE_RANDITHER = 1

const TIFFTAG_LZMAPRESET = 65562

const TIFFTAG_PERSAMPLE = 65563

const PERSAMPLE_MERGED = 0

const PERSAMPLE_MULTI = 1

const TIFFTAG_ZSTD_LEVEL = 65564

const TIFFTAG_LERC_VERSION = 65565

const LERC_VERSION_2_4 = 4

const TIFFTAG_LERC_ADD_COMPRESSION = 65566

const LERC_ADD_COMPRESSION_NONE = 0

const LERC_ADD_COMPRESSION_DEFLATE = 1

const LERC_ADD_COMPRESSION_ZSTD = 2

const TIFFTAG_LERC_MAXZERROR = 65567

const TIFFTAG_WEBP_LEVEL = 65568

const TIFFTAG_WEBP_LOSSLESS = 65569

const TIFFTAG_DEFLATE_SUBCODEC = 65570

const DEFLATE_SUBCODEC_ZLIB = 0

const DEFLATE_SUBCODEC_LIBDEFLATE = 1

const EXIFTAG_EXPOSURETIME = 33434

const EXIFTAG_FNUMBER = 33437

const EXIFTAG_EXPOSUREPROGRAM = 34850

const EXIFTAG_SPECTRALSENSITIVITY = 34852

const EXIFTAG_ISOSPEEDRATINGS = 34855

const EXIFTAG_PHOTOGRAPHICSENSITIVITY = 34855

const EXIFTAG_OECF = 34856

const EXIFTAG_EXIFVERSION = 36864

const EXIFTAG_DATETIMEORIGINAL = 36867

const EXIFTAG_DATETIMEDIGITIZED = 36868

const EXIFTAG_COMPONENTSCONFIGURATION = 37121

const EXIFTAG_COMPRESSEDBITSPERPIXEL = 37122

const EXIFTAG_SHUTTERSPEEDVALUE = 37377

const EXIFTAG_APERTUREVALUE = 37378

const EXIFTAG_BRIGHTNESSVALUE = 37379

const EXIFTAG_EXPOSUREBIASVALUE = 37380

const EXIFTAG_MAXAPERTUREVALUE = 37381

const EXIFTAG_SUBJECTDISTANCE = 37382

const EXIFTAG_METERINGMODE = 37383

const EXIFTAG_LIGHTSOURCE = 37384

const EXIFTAG_FLASH = 37385

const EXIFTAG_FOCALLENGTH = 37386

const EXIFTAG_SUBJECTAREA = 37396

const EXIFTAG_MAKERNOTE = 37500

const EXIFTAG_USERCOMMENT = 37510

const EXIFTAG_SUBSECTIME = 37520

const EXIFTAG_SUBSECTIMEORIGINAL = 37521

const EXIFTAG_SUBSECTIMEDIGITIZED = 37522

const EXIFTAG_FLASHPIXVERSION = 40960

const EXIFTAG_COLORSPACE = 40961

const EXIFTAG_PIXELXDIMENSION = 40962

const EXIFTAG_PIXELYDIMENSION = 40963

const EXIFTAG_RELATEDSOUNDFILE = 40964

const EXIFTAG_FLASHENERGY = 41483

const EXIFTAG_SPATIALFREQUENCYRESPONSE = 41484

const EXIFTAG_FOCALPLANEXRESOLUTION = 41486

const EXIFTAG_FOCALPLANEYRESOLUTION = 41487

const EXIFTAG_FOCALPLANERESOLUTIONUNIT = 41488

const EXIFTAG_SUBJECTLOCATION = 41492

const EXIFTAG_EXPOSUREINDEX = 41493

const EXIFTAG_SENSINGMETHOD = 41495

const EXIFTAG_FILESOURCE = 41728

const EXIFTAG_SCENETYPE = 41729

const EXIFTAG_CFAPATTERN = 41730

const EXIFTAG_CUSTOMRENDERED = 41985

const EXIFTAG_EXPOSUREMODE = 41986

const EXIFTAG_WHITEBALANCE = 41987

const EXIFTAG_DIGITALZOOMRATIO = 41988

const EXIFTAG_FOCALLENGTHIN35MMFILM = 41989

const EXIFTAG_SCENECAPTURETYPE = 41990

const EXIFTAG_GAINCONTROL = 41991

const EXIFTAG_CONTRAST = 41992

const EXIFTAG_SATURATION = 41993

const EXIFTAG_SHARPNESS = 41994

const EXIFTAG_DEVICESETTINGDESCRIPTION = 41995

const EXIFTAG_SUBJECTDISTANCERANGE = 41996

const EXIFTAG_IMAGEUNIQUEID = 42016

const EXIFTAG_SENSITIVITYTYPE = 34864

const EXIFTAG_STANDARDOUTPUTSENSITIVITY = 34865

const EXIFTAG_RECOMMENDEDEXPOSUREINDEX = 34866

const EXIFTAG_ISOSPEED = 34867

const EXIFTAG_ISOSPEEDLATITUDEYYY = 34868

const EXIFTAG_ISOSPEEDLATITUDEZZZ = 34869

const EXIFTAG_OFFSETTIME = 36880

const EXIFTAG_OFFSETTIMEORIGINAL = 36881

const EXIFTAG_OFFSETTIMEDIGITIZED = 36882

const EXIFTAG_TEMPERATURE = 37888

const EXIFTAG_HUMIDITY = 37889

const EXIFTAG_PRESSURE = 37890

const EXIFTAG_WATERDEPTH = 37891

const EXIFTAG_ACCELERATION = 37892

const EXIFTAG_CAMERAELEVATIONANGLE = 37893

const EXIFTAG_CAMERAOWNERNAME = 42032

const EXIFTAG_BODYSERIALNUMBER = 42033

const EXIFTAG_LENSSPECIFICATION = 42034

const EXIFTAG_LENSMAKE = 42035

const EXIFTAG_LENSMODEL = 42036

const EXIFTAG_LENSSERIALNUMBER = 42037

const EXIFTAG_GAMMA = 42240

const EXIFTAG_COMPOSITEIMAGE = 42080

const EXIFTAG_SOURCEIMAGENUMBEROFCOMPOSITEIMAGE = 42081

const EXIFTAG_SOURCEEXPOSURETIMESOFCOMPOSITEIMAGE = 42082

const GPSTAG_VERSIONID = 0

const GPSTAG_LATITUDEREF = 1

const GPSTAG_LATITUDE = 2

const GPSTAG_LONGITUDEREF = 3

const GPSTAG_LONGITUDE = 4

const GPSTAG_ALTITUDEREF = 5

const GPSTAG_ALTITUDE = 6

const GPSTAG_TIMESTAMP = 7

const GPSTAG_SATELLITES = 8

const GPSTAG_STATUS = 9

const GPSTAG_MEASUREMODE = 10

const GPSTAG_DOP = 11

const GPSTAG_SPEEDREF = 12

const GPSTAG_SPEED = 13

const GPSTAG_TRACKREF = 14

const GPSTAG_TRACK = 15

const GPSTAG_IMGDIRECTIONREF = 16

const GPSTAG_IMGDIRECTION = 17

const GPSTAG_MAPDATUM = 18

const GPSTAG_DESTLATITUDEREF = 19

const GPSTAG_DESTLATITUDE = 20

const GPSTAG_DESTLONGITUDEREF = 21

const GPSTAG_DESTLONGITUDE = 22

const GPSTAG_DESTBEARINGREF = 23

const GPSTAG_DESTBEARING = 24

const GPSTAG_DESTDISTANCEREF = 25

const GPSTAG_DESTDISTANCE = 26

const GPSTAG_PROCESSINGMETHOD = 27

const GPSTAG_AREAINFORMATION = 28

const GPSTAG_DATESTAMP = 29

const GPSTAG_DIFFERENTIAL = 30

const GPSTAG_GPSHPOSITIONINGERROR = 31

const TIFF_SSIZE_T = int64_t

const HAVE_IEEEFP = 1

const HOST_FILLORDER = FILLORDER_LSB2MSB

const HOST_BIGENDIAN = 0

const CCITT_SUPPORT = 1

const JPEG_SUPPORT = 1

const LERC_SUPPORT = 1

const LOGLUV_SUPPORT = 1

const LZW_SUPPORT = 1

const NEXT_SUPPORT = 1

const OJPEG_SUPPORT = 1

const PACKBITS_SUPPORT = 1

const PIXARLOG_SUPPORT = 1

const THUNDER_SUPPORT = 1

const ZIP_SUPPORT = 1

const STRIPCHOP_DEFAULT = TIFF_STRIPCHOP

const SUBIFD_SUPPORT = 1

const DEFAULT_EXTRASAMPLE_AS_ALPHA = 1

const CHECK_JPEG_YCBCR_SUBSAMPLING = 1

const MDI_SUPPORT = 1

const TIFF_TMSIZE_T_MAX = tmsize_t(SIZE_MAX >> 1)

const TIFFPRINT_NONE = 0x00

const TIFFPRINT_STRIPS = 0x01

const TIFFPRINT_CURVES = 0x02

const TIFFPRINT_COLORMAP = 0x04

const TIFFPRINT_JPEGQTABLES = 0x0100

const TIFFPRINT_JPEGACTABLES = 0x0200

const TIFFPRINT_JPEGDCTABLES = 0x0200

const D65_X0 = Float32(95.047)

const D65_Y0 = Float32(100.0)

const D65_Z0 = Float32(108.8827)

const D50_X0 = Float32(96.425)

const D50_Y0 = Float32(100.0)

const D50_Z0 = Float32(82.468)

const CIELABTORGB_TABLE_RANGE = 1500

const LOGLUV_PUBLIC = 1

const TIFF_ANY = TIFF_NOTYPE

const TIFF_VARIABLE = -1

const TIFF_SPP = -2

const TIFF_VARIABLE2 = -3

const FIELD_CUSTOM = 65

const U_NEU = 0.210526316

const V_NEU = 0.473684211

const UVSCALE = 410.0

const TIFFLIB_VERSION_STR = "LIBTIFF, Version 4.5.1\nCopyright (c) 1988-1996 Sam Leffler\nCopyright (c) 1991-1996 Silicon Graphics, Inc."

const TIFFLIB_VERSION = 20230609

const TIFFLIB_MAJOR_VERSION = 4

const TIFFLIB_MINOR_VERSION = 5

const TIFFLIB_MICRO_VERSION = 1

end # module
