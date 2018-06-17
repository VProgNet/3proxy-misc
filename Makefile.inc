#
# 3 proxy common Makefile
#

all:
	$(TYPECOMMAND) $(MAKEFILE) > src/Makefile.var
	@cd src && $(MAKE)
