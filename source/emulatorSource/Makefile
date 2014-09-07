#simple root level makefile by Father Nitwit

all:
	$(MAKE) -C utils
	$(MAKE) -C eqlaunch
	$(MAKE) -C EMuShareMem
	$(MAKE) -C world
	$(MAKE) -C zone
#	$(MAKE) -C mailserver
#	$(MAKE) -C chatserver
#	$(MAKE) -C ucs


clean:
	$(MAKE) -C utils clean
	$(MAKE) -C eqlaunch clean
	$(MAKE) -C EMuShareMem clean
	$(MAKE) -C world clean
	$(MAKE) -C zone clean
#	$(MAKE) -C mailserver clean
#	$(MAKE) -C chatserver clean
#	$(MAKE) -C ucs clean


depend:
#	$(MAKE) -C EMuShareMem depend
	$(MAKE) -C eqlaunch depend
	$(MAKE) -C world depend
	$(MAKE) -C zone depend
#	$(MAKE) -C mailserver depend
#	$(MAKE) -C chatserver depend
#	$(MAKE) -C ucs depend
#	$(MAKE) -C utils depend
