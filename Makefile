ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HAMAVIP
HAMAVIP_FILES = Tweak.xm
HAMAVIP_CFLAGS = -fobjc-arc
HAMAVIP_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
