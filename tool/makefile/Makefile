# source file
SOURCE  := $(wildcard *.c) $(wildcard *.cpp)
OBJS    := $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SOURCE)))

# target name
TARGET  := test

# compile and lib parameter
CC      := gcc
LIBS    := -lm
LDFLAGS :=
DEFINES := -DDBG_EN=1
DEFINES += -DLOG_USE_COLOR


DEFINES += -DDEV_RK3399
#DEFINES += -DDEV_X86
#DEFINES += -DDEV_NANO

# enable if support for old mesh v1.0, v1.1
DEFINES += -DMESH_V1_1
# enable if support for old mesh v1.2
DEFINES += -DMESH_V1_2
DEFINES += -DVERSION=\"$(VERSION)\"

INCLUDE := -I.
CFLAGS  := -g -Wall -w -O3 -pthread -std=c++11 $(DEFINES) $(INCLUDE)
VERSION := v1.0.4rc2
VERSION := $(shell echo $(VERSION)-0-g$(shell git rev-parse --short HEAD))
CFLAGS += -DVERSION=\"$(VERSION)\"
CXXFLAGS:= $(CFLAGS)

.PHONY : objs clean rebuild

all : $(TARGET)

objs : $(OBJS)

rebuild: clean all

clean :
	rm -rf *.so
	rm -rf *.o
	rm -rf $(TARGET)

$(TARGET) : $(OBJS)
	$(CC) $(CXXFLAGS) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)

