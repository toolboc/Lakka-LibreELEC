################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="desmume"
PKG_VERSION="71fcf52"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/desmume"
PKG_URL="https://github.com/libretro/desmume/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="libretro wrapper for desmume NDS emulator."
PKG_LONGDESC="libretro wrapper for desmume NDS emulator."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  if [ "$ARCH" == "arm" ]; then
    make -C desmume platform=armv LDFLAGS="$LDFLAGS -lpthread" # DESMUME_JIT_ARM=1
  else
    make -C desmume LDFLAGS="$LDFLAGS -lpthread"
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp desmume/desmume_libretro.so $INSTALL/usr/lib/libretro/
}
