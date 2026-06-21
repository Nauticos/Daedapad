# rules.mk - common make rules for small C projects
# Usage: include rules.mk or copy into your Makefile

CC ?= gcc
AR ?= ar
RANLIB ?= ranlib
STRIP ?= strip
PREFIX ?= /usr/local
DESTDIR ?=

CFLAGS ?= -O2 -Wall -Wextra -g
CPPFLAGS ?=
LDFLAGS ?=
LIBS ?=

SRC := $(wildcard *.c)
OBJ := $(patsubst %.c,%.o,$(SRC))
DEPS := $(OBJ:.o=.d)

TARGET ?= app

.PHONY: all clean install
all: $(TARGET)

-include $(DEPS)

# Compile with automatic dependency generation
%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MP -c $< -o $@

$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

install: $(TARGET)
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 0755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)

clean:
	rm -f $(OBJ) $(DEPS) $(TARGET)

# Optional: strip the binary for smaller install
strip: $(TARGET)
	$(STRIP) $(TARGET)

# End of rules.mk
