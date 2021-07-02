. /lib/functions/system.sh

qca_do_upgrade() {
        local tar_file="$1"

        local board_dir=$(tar tf $tar_file | grep -m 1 '^sysupgrade-.*/$')
        board_dir=${board_dir%/}
	local dev=$(find_mtd_chardev "0:HLOS")

        tar Oxf $tar_file ${board_dir}/kernel | mtd write - ${dev}

        if [ -n "$UPGRADE_BACKUP" ]; then
                tar Oxf $tar_file ${board_dir}/root | mtd -j "$UPGRADE_BACKUP" write - rootfs
        else
                tar Oxf $tar_file ${board_dir}/root | mtd write - rootfs
        fi
}

platform_check_image() {
	local magic_long="$(get_magic_long "$1")"
	board=$(board_name)
	case $board in
	cig,wf188|\
	cig,wf188n|\
	cig,wf194c|\
	edgecore,eap101|\
	edgecore,eap102|\
	tplink,ex227|\
	tplink,ex447|\
	qcom,ipq6018-cp01|\
	qcom,ipq807x-hk01|\
	qcom,ipq807x-hk14)
		[ "$magic_long" = "73797375" ] && return 0
		;;
	esac
	return 1
}

platform_do_upgrade() {
	CI_UBIPART="rootfs"
	CI_ROOTPART="ubi_rootfs"
	CI_IPQ807X=1

	board=$(board_name)
	case $board in
	cig,wf188)
		qca_do_upgrade $1
		;;
	cig,wf188n|\
	cig,wf194c|\
	qcom,ipq6018-cp01|\
	qcom,ipq807x-hk01|\
	qcom,ipq807x-hk14|\
	tplink,ex447|\
	tplink,ex227)
		nand_upgrade_tar "$1"
		;;
	edgecore,eap102|\
	edgecore,eap101)
		CI_UBIPART="rootfs1"
		nand_upgrade_tar "$1"
		;;
	esac
}
