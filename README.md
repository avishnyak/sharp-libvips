# Forked precompiled libvips

This repo is for a precompiled version of libvips that includes libimagequant for better PNG support
when using `sharp` and mozjpeg for better JPEG encoding.

Install Instructions:
* Set ENV Variable `npm_config_sharp_libvips_binary_host=https://github.com/avishnyak/sharp-libvips/releases/download`
* Run `npm install` or `yarn install`

Currently compiled and tested against linux-x64 and linux-musl only.  Let me know if you need any of the other flavors.

The base URL can be overridden using the
`npm_config_sharp_libvips_binary_host` environment variable.

https://sharp.pixelplumbing.com/install#custom-prebuilt-binaries

# Testing

I run the entire `sharp` test suite against the pre-built binaries in the following distros:

|Image|Node Version|
|--|--|
|Debian Buster|Node 10|
|Debian Stretch|Node 10|
|Ubuntu Bionic|Node 10|
|Ubuntu Focal|Node 10|
|CentOS 7|Node 10|
|Arch (latest)|Node 10|
|Alpine 3.11|Node 12|

# Contributions

Please make contributions upstream at https://github.com/lovell/sharp-libvips.

## Licences

These scripts are licensed under the terms of the [Apache 2.0 Licence](LICENSE).

The shared libraries contained in the tarballs are distributed under
the terms of [various licences](THIRD-PARTY-NOTICES.md), one of which is GPL.
