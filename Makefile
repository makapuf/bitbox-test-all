PROJECTS = $(shell git submodule status | cut -d " " -f 3) 
ALLCLEAN = $(patsubst %,%-clean,$(PROJECTS))

export BITBOX = $(shell pwd)/bitbox

.PHONY: $(PROJECTS)
.PHONY: stable-clean $(ALLCLEAN) ubuntudeps haikudeps

$(info $(PROJECTS))

all: $(PROJECTS)

$(PROJECTS):
	$(info "-------------------------------------------------------")
	$(info $@)
	$(info "-------------------------------------------------------")
	$(info "")
	$(MAKE) -C $@ # can fail

allclean: $(ALLCLEAN)

$(ALLCLEAN):
	$(MAKE) -C $(patsubst %-clean,%,$@) clean

test_allemu: $(PROJECTS)
	for prg in $(PROJECTS);do echo "\n\n **** Testing $$prg\n\n"; cd $$prg && ./*_emu --quiet; cd .. ; done

haikudeps:
	pkgman install arm_none_eabi_gcc_x86 arm_none_eabi_newlib_x86 arm_none_eabi_binutils_x86 \
	libsdl_x86_devel ncurses_x86_devel mpc_x86 make python_imaging gws
	echo "Remember to run \"setarch x86\" before compiling!"

ubuntudeps: 
	apt install build-essential gcc-arm-none-eabi python libsdl1.2-dev 
	pip install pillow
	arm-none-eabi-gcc --version
	gcc --version

