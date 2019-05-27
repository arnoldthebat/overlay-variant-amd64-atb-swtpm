# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
inherit eutils unpacker

DESCRIPTION="SW TPM Deployment"
HOMEPAGE="https://github.com/arnoldthebat/chromefy"

SRC_URI="https://github.com/arnoldthebat/chromefy/blob/master/swtpm.tar"

LICENSE="GPL-2"
KEYWORDS="-* amd64 x86"

SLOT="0" 

# src_unpack() {
# 	unpack ${A}
# }

# src_prepare() { 
#     default 
# }

src_install() {
	insinto /usr/sbin
    doins swtpm* || die "doins failed"

    insinto /usr/lib64/
    doins libtpm* || die "doins failed"
    doins libswtpm* || die "doins failed"
}

# EAPI=6 
# inherit eutils unpacker 
# MY_PN=${PN%%-bin} 
# MY_P=${MY_PN}-${PV} 
# SRC_URI="http://download2.gluonhq.com/${PN}/${PV}/install/linux/${MY_P}.deb" 
# KEYWORDS="amd64" 
# DESCRIPTION="Gluon Scene Builder" 
# HOMEPAGE="http://gluonhq.com/products/scene-builder/" 

# IUSE="" 
# LICENSE="BSD" 
# QA_PREBUILT="*" 
# DEPEND="" 
# RDEPEND="${DEPEND}" 
# S="${WORKDIR}/opt" 
# src_unpack() { 
#     unpack_deb ${A} 
# } 
# src_prepare() { 
#     default 
# } 
# src_install() { 
#     local NAME=SceneBuilder 
#     insinto /opt 
#     doins -r . 
#     fperms +x /opt/${NAME}/${NAME}  /opt/${NAME}/runtime/lib/jexec 
#     dosym /opt/${NAME}/${NAME} /usr/bin/${MY_PN} 
#     dosym /opt/${NAME}/${NAME}.desktop /usr/share/applications/${MY_PN}.desktop 
#     dosym /opt/${NAME}/${NAME}.png /usr/share/pixmaps/${MY_PN}.png 
# }
