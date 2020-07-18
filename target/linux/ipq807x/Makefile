include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=ipq807x
BOARDNAME:=Qualcomm Atheros AX
SUBTARGETS:=ipq807x ipq60xx
FEATURES:=squashfs ramdisk nand pcie usb
KERNELNAME:=Image dtbs
CPU_TYPE:=cortex-a7

KERNEL_PATCHVER:=4.4
KERNEL_NAME_SUFFIX=-qsdk-10fd7d14853b7020b804acae690c8acec5d954ce

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += kmod-qca-nss-dp kmod-qca-ssdk swconfig \
	kmod-qca-nss-drv \
	kmod-usb-phy-ipq807x kmod-usb-dwc3-of-simple \
	kmod-ath11k-ahb kmod-qrtr_mproc wpad \
	kmod-gpio-button-hotplug \
	qca-thermald-10.4 qca-ssdk-shell kmod-qca-nss-drv-bridge-mgr

$(eval $(call BuildTarget))
