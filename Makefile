THEOS_DEVICE_IP=192.168.1.110
THEOS_DEVICE_PORT=22

TARGET := iphone:clang:latest:12.2
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = StatusTimeFormatter

StatusTimeFormatter_FILES = $(shell find Sources/StatusTimeFormatter -name '*.swift') $(shell find Sources/StatusTimeFormatterC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
StatusTimeFormatter_SWIFTFLAGS = -ISources/StatusTimeFormatterC/include
StatusTimeFormatter_CFLAGS = -fobjc-arc -ISources/StatusTimeFormatterC/include

include $(THEOS_MAKE_PATH)/tweak.mk
