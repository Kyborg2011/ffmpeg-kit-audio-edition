# FFmpegKit fork — Audio only edition with bs2b audio filter + reduced size of binaries

This repository is a fork of a [FFmpegKit](https://github.com/arthenica/ffmpeg-kit). The main idea of a fork is to create a fast and reproducible way to build a custom FFmpeg binaries with such options:

- Audio ONLY codecs, muxers/demuxers, parsers and filters;
- Everything else (video related for ex.) - removed;
- Enabled an audio effect/filter - "bs2b" (very useful for listening with headphones) - to do that we have added an LGPL licenced library libbs2b and successfully built that all together.

### To make your build the only steps you need to do:

```bash
# Firstly you need to change ANDROID_SDK_ROOT and ANDROID_NDK_ROOT vars in custom-build.sh file according to your settings. And then do:

chmod +x ./custom-build.sh
./custom-build.sh
```