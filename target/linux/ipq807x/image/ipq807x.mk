KERNEL_LOADADDR := 0x41208000

define Device/qcom_hk01
  DEVICE_TITLE := Qualcomm Hawkeye HK01
  DEVICE_DTS := qcom-ipq807x-hk01
  DEVICE_DTS_CONFIG=config@hk01
  SUPPORTED_DEVICES := qcom,ipq807x-hk01
  DEVICE_PACKAGES := ath11k-wifi-qcom-ipq8074
endef
TARGET_DEVICES += qcom_hk01

define Device/qcom_hk14
  DEVICE_TITLE := Qualcomm Hawkeye HK14
  DEVICE_DTS := qcom-ipq807x-hk14
  DEVICE_DTS_CONFIG=config@hk14
  SUPPORTED_DEVICES := qcom,ipq807x-hk14
  DEVICE_PACKAGES := ath11k-wifi-qcom-ipq8074 kmod-ath11k-pci ath11k-firmware-qcn9000
endef
TARGET_DEVICES += qcom_hk14

define Device/sercomm_wallaby
  DEVICE_TITLE := Sercomm Kiwi
  DEVICE_DTS := qcom-ipq807x-sercomm-wallaby
  DEVICE_DTS_CONFIG=config@hk09
  SUPPORTED_DEVICES := sercomm,wallaby
  DEVICE_PACKAGES := ath11k-wifi-sercomm-wallaby
endef
TARGET_DEVICES += sercomm_wallaby

define Device/cig_wf194
  DEVICE_TITLE := CIG WF194C
  DEVICE_DTS := qcom-ipq807x-wf194c
  DEVICE_DTS_CONFIG=config@hk01
  SUPPORTED_DEVICES := cig,wf194c
  DEVICE_PACKAGES := ath11k-wifi-cig-wf194c aq-fw-download uboot-envtools kmod-usb3 kmod-usb2
endef
TARGET_DEVICES += cig_wf194

define Device/edgecore_eap102
  DEVICE_TITLE := Edgecore EAP102
  DEVICE_DTS := qcom-ipq807x-eap102
  DEVICE_DTS_CONFIG=config@ac02
  SUPPORTED_DEVICES := edgecore,eap102
  DEVICE_PACKAGES := ath11k-wifi-edgecore-eap102 kmod-usb3 uboot-envtools
endef
TARGET_DEVICES += edgecore_eap102

define Device/tplink_ex227
  DEVICE_TITLE := TP-Link EX227
  DEVICE_DTS := qcom-ipq807x-ex227
  DEVICE_DTS_CONFIG=config@hk07
  SUPPORTED_DEVICES := tplink,ex227
  DEVICE_PACKAGES := ath11k-wifi-tplink-ex227
  IMAGES := sysupgrade.tar nand-factory.bin nand-factory.ubi
  IMAGE/sysupgrade.tar := sysupgrade-tar | append-metadata
  IMAGE/nand-factory.bin := append-ubi | qsdk-ipq-factory-nand
  IMAGE/nand-factory.ubi := append-ubi
endef
TARGET_DEVICES += tplink_ex227

define Device/tplink_ex447
  DEVICE_TITLE := TP-Link EX447
  DEVICE_DTS := qcom-ipq807x-ex447
  DEVICE_DTS_CONFIG=config@hk09
  SUPPORTED_DEVICES := tplink,ex447
  DEVICE_PACKAGES := ath11k-wifi-tplink-ex447
  IMAGES := sysupgrade.tar nand-factory.bin nand-factory.ubi
  IMAGE/sysupgrade.tar := sysupgrade-tar | append-metadata
  IMAGE/nand-factory.bin := append-ubi | qsdk-ipq-factory-nand
  IMAGE/nand-factory.ubi := append-ubi
endef
TARGET_DEVICES += tplink_ex447
