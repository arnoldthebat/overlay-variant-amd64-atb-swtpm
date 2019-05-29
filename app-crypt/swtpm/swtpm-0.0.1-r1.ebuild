# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
inherit eutils

DESCRIPTION="SW TPM Deployment"
HOMEPAGE="https://github.com/arnoldthebat/chromefy"

# SRC_URI="https://github.com/arnoldthebat/chromefy/blob/master/swtpm.tar"

CROS_WORKON_REPO="https://github.com/arnoldthebat"
CROS_WORKON_PROJECT="chromefy"
CROS_WORKON_EGIT_BRANCH="master"
CROS_WORKON_BLACKLIST="1"
CROS_WORKON_COMMIT="507b906ab2149f763894e8c363f31bf29b268d29"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit git-2 cros-workon

LICENSE="GPL-2"
KEYWORDS="-* amd64 x86"

RESTRICT="mirror"

SLOT="0" 

# src_unpack() {
#     einfo "WorkDir: ${WORKDIR}"
# 	# unpack swtpm-0.0.1/swtpm.tar
# }

# src_prepare() { 
#     default
# }

src_install() {

	insinto /usr/sbin
    doins swtpm* || die "doins failed"

    insinto /usr/lib64/
    doins libtpms.* || die "doins failed"
    doins libswtpm* || die "doins failed"

    ln -snvf libswtpm_libtpms.so.0.0.0 libswtpm_libtpms.so.0
    ln -snvf libswtpm_libtpms.so.0 libswtpm_libtpms.so
    ln -snvf libtpms.so.0.6.0 libtpms.so.0
    ln -snvf libtpms.so.0 libtpms.so
    ln -snvf libtpm_unseal.so.1.0.0 libtpm_unseal.so.1
    ln -snvf libtpm_unseal.so.1 libtpm_unseal.so

    insinto /etc/init/
    doins _vtpm.conf
}
