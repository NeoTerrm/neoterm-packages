TERMUX_PKG_HOMEPAGE=https://github.com/yudai/gotty
TERMUX_PKG_DESCRIPTION="Share your terminal as a web application"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.0.0-alpha.3
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/yudai/gotty/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=897b4ad9fd6cf9f148566757c613a6aec2e86e90616b9d987e663490b5bdd9d7

termux_step_make() {
	termux_setup_golang

	export GOPATH=$TERMUX_PKG_BUILDDIR
	mkdir -p "$GOPATH"/src/github.com/yudai
	ln -sf "$TERMUX_PKG_SRCDIR" "$GOPATH"/src/github.com/yudai/gotty

	cd "$GOPATH"/src/github.com/yudai/gotty
	rm -rf vendor
	go mod init
	go get
	go build
}

termux_step_make_install() {
	install -Dm700 \
		"$GOPATH"/src/github.com/yudai/gotty/gotty \
		"$TERMUX_PREFIX"/bin/
}
