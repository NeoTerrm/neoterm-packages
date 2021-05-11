Cross notes
===========

Goal: cross AdoptOpenJDK8 with X11 support.

Thanks for AdoptOpenJDK group porting non-mobile branch to aarch64 devices.

Thanks for termux's community porting so much underlying libraries such as
libx11, openssl, fontconfig, freetype, etc.

Thanks AOF-DEV team for [porting it to android](https://github.com/AOF-Dev/openjdk-jdk8u-aarch64-android).

What I have done is just making the repo compatible with clang and higher version of NDK toolchain.

Use of unstable package(s)
==========================

- `cups` from `termux/unstable-packages`

Use of deprecated package(s)
============================

- `alsa-lib`, to be removed in the future

