DESCRIPTION = "spl_tool is a jh7110 signature tool used to generate spl header information and generate u-boot-spl.bin.normal.out."
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=e6dc25dc2418b8831c906d43809d8336"
SECTION = "BSP"

SRCREV = "8c5acc4e5eb7e4ad012463b05a5e3dbbfed1c38d"
SRC_URI = "git://github.com/starfive-tech/Tools;protocol=https;branch=master"

inherit native

S = "${WORKDIR}/git/spl_tool"

do_compile () {
    cd ${S}
    oe_runmake clean
    oe_runmake
}

do_install () {
    cd ${S}
    install -d ${D}${bindir}
    install -m 0755 spl_tool ${D}${bindir}/spl_tool
}

BBCLASSEXTEND = "native"
