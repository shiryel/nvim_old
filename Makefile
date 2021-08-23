get_files = $(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call get_files,$d/,$2))
files = $(call get_files,fnl,*.fnl)
lua_files = $(patsubst fnl/%.fnl,lua/%.lua,$(files))

$(info Files: ${lua_files})

#
# Goals
#

.PHONY: build clear rebuild
.DEFAULT_GOAL: build

build: init.lua $(lua_files)

clear:
	rm init.lua
	rm -r lua/

rebuild: clear build

#
# Files
#

lua/%.lua: fnl/%.fnl
	mkdir -p `dirname $@`
	fennel --compile $< > $@

init.lua: init.fnl
	fennel --compile $< > $@
