# Forked precompiled libvips

This repo is for a precompiled version of libvips that includes libimagequant for better PNG support
when using `sharp`.

Install Instructions:
* Set ENV Variable `SHARP_DIST_BASE_URL=https://github.com/avishnyak/sharp-libvips/releases/download/v8.7.4`
* Run `npm install` or `yarn install`

# Contributions

Please make contributions upstream at https://github.com/lovell/sharp-libvips.

## Licences

These scripts are licensed under the terms of the
[Apache 2.0 Licence](https://github.com/lovell/sharp-libvips/blob/master/LICENSE).

The shared libraries contained in the tarballs
are distributed under the terms of the following licences.
Note: Some of the licenses are GPL.  Please use the upstream
binaries if this is a problem for your project.

Use of libraries under the terms of the LGPLv3 is via the
"any later version" clause of the LGPLv2 or LGPLv2.1.

| Library       | Used under the terms of                                                                                  |
|---------------|----------------------------------------------------------------------------------------------------------|
| cairo         | Mozilla Public License 2.0                                                                               |
| expat         | MIT Licence                                                                                              |
| fontconfig    | [fontconfig Licence](https://cgit.freedesktop.org/fontconfig/tree/COPYING) (BSD-like)                    |
| freetype      | [freetype Licence](http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/docs/FTL.TXT) (BSD-like) |
| fribidi       | LGPLv3                                                                                                   |
| gettext       | LGPLv3                                                                                                   |
| giflib        | MIT Licence                                                                                              |
| glib          | LGPLv3                                                                                                   |
| harfbuzz      | MIT Licence                                                                                              |
| lcms          | MIT Licence                                                                                              |
| libcroco      | LGPLv3                                                                                                   |
| libexif       | LGPLv3                                                                                                   |
| libffi        | MIT Licence                                                                                              |
| libgsf        | LGPLv3                                                                                                   |
| libjpeg-turbo | [zlib License, IJG License](https://github.com/libjpeg-turbo/libjpeg-turbo/blob/master/LICENSE.md)       |
| libpng        | [libpng License](http://www.libpng.org/pub/png/src/libpng-LICENSE.txt)                                   |
| librsvg       | LGPLv3                                                                                                   |
| libtiff       | [libtiff License](http://www.libtiff.org/misc.html) (BSD-like)                                           |
| libuuid       | New BSD License                                                                                          |
| libvips       | LGPLv3                                                                                                   |
| libwebp       | New BSD License                                                                                          |
| libxml2       | MIT Licence                                                                                              |
| pango         | LGPLv3                                                                                                   |
| pixman        | MIT Licence                                                                                              |
| zlib          | [zlib Licence](https://github.com/madler/zlib/blob/master/zlib.h)                                        |
| libimagequant | [GPLv3](https://github.com/ImageOptim/libimagequant/blob/master/COPYRIGHT)                                        |
