# FFmpegKit fork: audio only edition with all audio filters alongside `bs2b` + reduced size of binaries

This repository is a fork of a [FFmpegKit](https://github.com/arthenica/ffmpeg-kit). The main idea of a fork is to create a fast and reproducible way to build a custom FFmpeg binaries for Android with such options:

- Audio only codecs, muxers/demuxers, parsers and filters;
- Everything else (video related for ex.) - removed;
- Enabled an audio effect/filter - "bs2b" (very useful for listening with headphones) - to do that we have added a library libbs2b and successfully built that all together.

## How to build:

```bash
git clone https://github.com/Kyborg2011/ffmpeg-kit-audio-edition.git
git submodule update --init --recursive
# Change "/path/to/android/ndk/26.1.10909125" to your real full path:
export ANDROID_NDK_ROOT="/path/to/android/ndk/26.1.10909125"
# Change "/path/to/android/ndk/26.1.10909125" to your real full path:
export ANDROID_SDK_ROOT="/path/to/android/sdk"
./custom-build.sh
```

## Final FFmpeg build config in current edition:
```
External libraries:
jni                     libilbc                 zlib
libbs2b                 mediacodec

External libraries providing hardware acceleration:
v4l2_m2m

Libraries:
avcodec                 avformat                swresample
avfilter                avutil

Programs:

Enabled decoders:
aac                     mpc7                    pcm_s8
aac_latm                mpc8                    pcm_s8_planar
ac3                     opus                    pcm_sga
alac                    pcm_alaw                pcm_u16be
als                     pcm_bluray              pcm_u16le
ape                     pcm_dvd                 pcm_u24be
atrac1                  pcm_f16le               pcm_u24le
atrac3                  pcm_f24le               pcm_u32be
dsd_lsbf                pcm_f32be               pcm_u32le
dsd_lsbf_planar         pcm_f32le               pcm_u8
dsd_msbf                pcm_f64be               pcm_vidc
dsd_msbf_planar         pcm_f64le               ra_144
eac3                    pcm_lxf                 ra_288
flac                    pcm_mulaw               ralf
gsm                     pcm_s16be               shorten
gsm_ms                  pcm_s16be_planar        tak
mjpeg                   pcm_s16le               truehd
mp1                     pcm_s16le_planar        tta
mp1float                pcm_s24be               vorbis
mp2                     pcm_s24daud             wavpack
mp2float                pcm_s24le               wmalossless
mp3                     pcm_s24le_planar        wmapro
mp3adu                  pcm_s32be               wmav1
mp3adufloat             pcm_s32le               wmav2
mp3float                pcm_s32le_planar        wmavoice
mp3on4                  pcm_s64be
mp3on4float             pcm_s64le

Enabled encoders:

Enabled hwaccels:

Enabled parsers:
aac                     flac                    vorbis
aac_latm                gsm                     vp3
ac3                     mlp                     vp8
cook                    mpegaudio
dca                     tak

Enabled demuxers:
aac                     mpc                     pcm_u16be
ac3                     mpc8                    pcm_u16le
aiff                    ogg                     pcm_u24be
ape                     pcm_alaw                pcm_u24le
asf                     pcm_f32be               pcm_u32be
au                      pcm_f32le               pcm_u32le
avi                     pcm_f64be               pcm_u8
dsf                     pcm_f64le               pcm_vidc
dts                     pcm_mulaw               rm
flac                    pcm_s16be               shorten
flv                     pcm_s16le               tak
image2                  pcm_s24be               truehd
m4v                     pcm_s24le               tta
matroska                pcm_s32be               wav
mov                     pcm_s32le               wv
mp3                     pcm_s8                  xwma

Enabled muxers:

Enabled protocols:
async                   gopher                  rtmp
cache                   hls                     rtmpt
concat                  http                    rtp
concatf                 httpproxy               srtp
crypto                  icecast                 subfile
data                    md5                     tcp
fd                      mmsh                    tee
ffrtmphttp              mmst                    udp
file                    pipe                    udplite
ftp                     prompeg                 unix

Enabled filters:
acompressor             aiir                    dialoguenhance
acrossfade              alimiter                dynaudnorm
acrossover              anequalizer             equalizer
adeclick                anlmdn                  extrastereo
adeclip                 aphaser                 firequalizer
adelay                  aphaseshift             haas
adenorm                 apulsator               headphone
adrc                    aresample               loudnorm
adynamicequalizer       aspectralstats          pan
adynamicsmooth          astats                  replaygain
aecho                   asubboost               silencedetect
afade                   atempo                  silenceremove
afftdn                  atilt                   speechnorm
afftfilt                bs2b                    stereotools
afir                    channelmap              stereowiden
aformat                 chorus                  superequalizer
afreqshift              compand                 vibrato
afwtdn                  crossfeed               virtualbass
agate                   deesser
```