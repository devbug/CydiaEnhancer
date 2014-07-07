PACKAGE_VERSION = 1.0

include theos/makefiles/common.mk

TWEAK_NAME = SimulatedKeyEvents
SimulatedKeyEvents_FILES = Tweak.xm
SimulatedKeyEvents_FRAMEWORKS = CoreFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MobileCydia"
