FW_DEVICE_IP = 192.168.1.9
ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 3.0
SDKVERSION = 7.0

include theos/makefiles/common.mk

TWEAK_NAME = CydiaEnhancer
CydiaEnhancer_FILES = Tweak.xm
CydiaEnhancer_FRAMEWORKS = CoreFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Cydia"

ri:: remoteinstall
remoteinstall:: all internal-remoteinstall after-remoteinstall
internal-remoteinstall::
	scp -P 22 "$(FW_PROJECT_DIR)/$(THEOS_OBJ_DIR_NAME)/$(TWEAK_NAME).dylib" root@$(FW_DEVICE_IP):
	scp -P 22 "$(FW_PROJECT_DIR)/$(TWEAK_NAME).plist" root@$(FW_DEVICE_IP):
	ssh root@$(FW_DEVICE_IP) "mv $(TWEAK_NAME).* /Library/MobileSubstrate/DynamicLibraries/"
after-remoteinstall::
	ssh root@$(FW_DEVICE_IP) "killall -9 Cydia"

