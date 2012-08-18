# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-devel/crossdev/crossdev-99999999.ebuild,v 1.6 2012/02/28 00:19:36 vapier Exp $

EAPI="4"

if [[ ${PV} == "999999999" ]] ; then
	EGIT_REPO_URI="git://github.com/StealthAsimov/crossdev-fork.git"
	inherit git-2
	SRC_URI=""
	#KEYWORDS=""
fi

DESCRIPTION="Gentoo Cross-toolchain generator"
HOMEPAGE="http://www.gentoo.org/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=sys-apps/portage-2.1
	app-shells/bash
	!sys-devel/crossdev-wrappers"
DEPEND="app-arch/xz-utils"

src_install() {
	default
	if [[ "${PV}" == "999999999" ]] ; then
		sed -i "s:@CDEVPV@:${EGIT_VERSION}:" "${ED}"/usr/bin/crossdev || die
	fi
}
