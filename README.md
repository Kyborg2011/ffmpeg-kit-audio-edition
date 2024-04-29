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