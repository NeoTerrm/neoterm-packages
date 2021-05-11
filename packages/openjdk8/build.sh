TERMUX_PKG_HOMEPAGE=https://github.com/AdoptOpenJDK/openjdk-aarch64-jdk8u
TERMUX_PKG_DESCRIPTION="The Community and code behind the Build Farm which produces high quality, FREE OpenJDK (Java) binaries."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Kiva Oyama <imkiva@islovely.icu>"
_UPDATE_VERSION=272
TERMUX_PKG_VERSION=8u$_UPDATE_VERSION
_GIT_COMMIT=6dedca2b6f779eb86fffca1f2882e251163c20d4
TERMUX_PKG_SRCURL=https://github.com/AdoptOpenJDK/openjdk-aarch64-jdk8u/archive/${_GIT_COMMIT}.tar.gz
TERMUX_PKG_SHA256=7a24b0e813a231ec0a120007373d349e998afb3abed6294ced71ed6912bd87f3
TERMUX_PKG_DEPENDS="freetype, cups, fontconfig, libffi, alsa-lib, ca-certificates-java, libx11, libxt, libxrender, libxext"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS=(
--x-includes=$TERMUX_PREFIX/include
--x-libraries=$TERMUX_PREFIX/lib
--with-alsa=$TERMUX_PREFIX
--with-freetype-include=$TERMUX_PREFIX/include/freetype2
--with-freetype-lib=$TERMUX_PREFIX/lib
--with-cups=$TERMUX_PREFIX
--with-fontconfig=$TERMUX_PREFIX
--openjdk-target=$TERMUX_HOST_PLATFORM
--with-jvm-variants=server
--with-debug-level=release
--with-toolchain-type=clang
--with-devkit=$TERMUX_STANDALONE_TOOLCHAIN
--disable-headful
--disable-debug-symbols
--disable-zip-debug-info
--with-native-debug-symbols=none
--with-user-release-suffix=imkiva
--with-update-version=$_UPDATE_VERSION
--with-build-number=b${TERMUX_PKG_REVISION:-0}
BUILD_CXX=clang++
)

termux_step_configure() {
    if [[ "$TERMUX_PKG_QUICK_REBUILD" != "true" ]]; then
        $TERMUX_PKG_SRCDIR/configure \
            --prefix=$TERMUX_PREFIX \
	    --sbindir=$TERMUX_PREFIX/bin \
	    --libdir=$TERMUX_PREFIX/lib \
	    "${TERMUX_PKG_EXTRA_CONFIGURE_ARGS[@]}"
    fi
}

termux_step_make() {
    echo 'Prepare to make, press enter'
    #read
}

