FINALPACKAGE = 1

export TARGET = iphone:14.4
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.4.sdk
export ADDITIONAL_CFLAGS = -DTHEOS_LEAN_AND_MEAN -fobjc-arc

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HalFiPadSB HalFiPadUI

HalFiPadSB_FILES = TweakSB.xm
HalFiPadUI_FILES = TweakUI.xm
HalFiPadUI_LIBRARIES = MobileGestalt

ARCHS = arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += HalFiPadPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "sbreload"