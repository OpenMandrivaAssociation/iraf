#!/bin/bash -v
wget ftp://iraf.noao.edu/iraf/v216/PCIX/iraf-src.tar.gz
mkdir -p iraf
tar xzf iraf-src.tar.gz -C iraf
find -name "*.cygwin" | xargs rm -rf 
find -name "*.freebsd" | xargs rm -rf 
find -name "*.ipad" | xargs rm -rf 
find -name "*.sunos" | xargs rm -rf 
find -name "*.macintel" | xargs rm -rf 
find -name "*.macosx" | xargs rm -rf 
find -name "*.solaris" | xargs rm -rf 
find -name ".*" -and -not -name "." -and -not -name ".." \
-and -not -name ".*.def" |xargs rm -rf 
find \( -name "*.a" -or \
  -name "*.e" -or \
  -name "*.o" -or \
  -name "*.cache" -or \
  -name "*.bak" -or \
  -name "*.orig" \) -delete

#remove finished docs
find \( -name "*.ps" -or \
   -name "*.pdf" \) -delete
rm -rf tags
rm -rf iraf/unix/shlib
rm -rf iraf/unix/sun
rm -rf iraf/unix/mc68000
rm -rf iraf/pkg/ecl/readline iraf/pkg/vocl/readline

# Keep copy of cfitsio in libsamp for now
rm -rf iraf/vendor/cfitsio
rm -rf iraf/pkg/tbtables/cfitsio

rm -rf iraf/vendor/voclient/common/curl*
rm -rf iraf/vendor/voclient/include/curl
rm -rf iraf/vendor/voclient/common/expat*
rm -rf iraf/vendor/voclient/libsamp/libxrpc/curl
rm -rf iraf/vendor/voclient/libsamp/libxrpc/include/curl
rm -rf iraf/vendor/voclient/libsamp/libxrpc/curl-*/*
rm -rf iraf/vendor/voclient/libsamp/libxrpc/xmlrpc-c
rm -rf iraf/vendor/voclient/libsamp/libxrpc/xmlrpc-c-*/*
rm -rf iraf/vendor/voclient/libsamp/libxrpc/share



# remove most of f2c but keep the f2c.h as the stock f2c.h 
# is different from fedoras
rm -rf iraf/unix/f2c/lib*
rm -rf iraf/unix/f2c/src
rm -rf iraf/unix/f2c/ms*
rm -rf iraf/unix/bin.*/f2c*

rm -rf iraf/sys/vops/ak/*.x
rm -rf iraf/vendor/voclient/include/
rm -f iraf/vendor/voclient/voclient/config.status
rm -f iraf/vendor/voclient/voclient/config/config.guess
rm -f iraf/vendor/voclient/voclient/config/config.sub
rm -f iraf/vendor/voclient/libsamp/cfitsio/config.status

#rm -rf iraf/unix/boot/xyacc
tar  cJf iraf-src.tar.xz -C iraf .

rm -rf iraf
