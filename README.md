# Forked precompiled libvips

This repo is for a precompiled version of libvips that includes libimagequant for better PNG support
when using `sharp`.

Install Instructions:
* Set ENV Variable `SHARP_DIST_BASE_URL=https://github.com/avishnyak/sharp-libvips/releases/download/v8.9.0`
* Run `npm install` or `yarn install`

Currently compiled and tested against linux-x64 (non-musl) only.  Let me know if you need any of the other flavors.

# Contributions

Please make contributions upstream at https://github.com/lovell/sharp-libvips.

## Licences

The shared libraries contained in the tarballs
are distributed under the terms of
[various licences](https://github.com/lovell/sharp-libvips/blob/master/THIRD-PARTY-NOTICES.md), one of which is GPL.