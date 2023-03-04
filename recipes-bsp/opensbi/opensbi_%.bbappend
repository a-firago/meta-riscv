FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Support fdt drivers for AE350
SRCREV:ae350-ax45mp = "22f38ee6c658a660083aa45c4ec6c72f66a17260"

BRANCH:visionfive2 = "JH7110_VisionFive2_devel"
SRC_URI:visionfive2 = " \
	git://github.com/starfive-tech/opensbi.git;protocol=https;branch=${BRANCH} \
	file://visionfive2-uboot-fit-image.its \
	"

# tag VF2_v2.10.4
SRCREV:visionfive2 = "ced60104df4f835e1d6bd0697b38394de64e301a"

DEPENDS:visionfive2:append = " u-boot-tools-native dtc-native"

do_deploy:append:visionfive2() {
	install -m 0644 ${WORKDIR}/visionfive2-uboot-fit-image.its ${DEPLOYDIR}/visionfive2-uboot-fit-image.its
	cd ${DEPLOYDIR}
	mkimage -f visionfive2-uboot-fit-image.its -A riscv -O u-boot -T firmware visionfive2_fw_payload.img
}
