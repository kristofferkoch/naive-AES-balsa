### Balsa Makefile
### Created: Thu Oct  1 20:22:48 CEST 2009
### By: koch@i7 (Linux)
### With balsa-make-makefile version: 3.5.1
### Command: balsa-make-makefile -b -p /home/koch/balsa/naive-AES-balsa

### Must use a Bourne shell
SHELL = /bin/sh

### Programs
BALSAC = balsa-c
BALSAMAKETEST = balsa-make-test -b
BALSAMAKEIMPLTEST = balsa-make-impl-test -b
BALSAMAKEBUILTIN = balsa-make-builtin-lib
BALSASIMIMPL = balsa-sim-impl -b
BALSANETLIST = balsa-netlist
BREEZESIM = breeze-sim
BREEZESIMCTRL = breeze-sim-ctrl
GTKWAVE = gtkwave
MAKE = make
RM = rm -f
RM_R = rm -rf
LN_S = ln -s

### Options
# -- BALSAIMPORTPATH defined by user
BALSACOPTS_COMPLETE = -b $(BALSAIMPORTPATH) $(BALSACOPTS)
BALSANETLISTOPTS = $(BALSAIMPORTPATH)

### Implementation technology

### Test fixture simulation variables test-sbox-run variables
SIMARGS_test_sbox_run = 

### Test fixture simulation variables mixcolumns-test variables
SIMARGS_mixcolumns_test = 

### Test fixture simulation variables test1 variables
SIMARGS_test1 = 

### Test fixture simulation variables multest variables
SIMARGS_multest = 

### Test fixture simulation variables aes-simpletest variables
SIMARGS_aes_simpletest = 

### User defined variables
BALSAIMPORTPATH = -I . 

### Suffix rules
.SUFFIXES: .balsa .breeze .ps

.breeze.ps:
	breeze2ps $*
.balsa.breeze:
	$(BALSAC) $(BALSACOPTS_COMPLETE) $*

all: test-sbox.breeze shiftrow.breeze sbox.breeze mixcolumns.breeze mixcolumn.breeze inversion.breeze gfmul.breeze gfdouble.breeze gf4.breeze affine.breeze aes.breeze addkey.breeze 
### Balsa rules
aes.breeze: sbox.breeze shiftrow.breeze mixcolumn.breeze gfdouble.breeze
gfmul.breeze: gfdouble.breeze
inversion.breeze: gf4.breeze
mixcolumn.breeze: gfdouble.breeze
mixcolumns.breeze: mixcolumn.breeze
sbox.breeze: affine.breeze inversion.breeze
test-sbox.breeze: sbox.breeze

### Test harness rules
test-test-sbox-run.balsa: test-sbox.breeze Project
	$(BALSAMAKETEST) $(BALSAIMPORTPATH) -p . test-sbox-run

sim-pre-test-sbox-run: test-test-sbox-run.breeze

sim-test-sbox-run: sim-pre-test-sbox-run
	$(BREEZESIM) $(BALSAIMPORTPATH) $(SIMARGS_test-sbox-run) test-test-sbox-run

sim-win-test-sbox-run: sim-pre-test-sbox-run
	$(BREEZESIMCTRL) $(BALSAIMPORTPATH) $(SIMARGS_test-sbox-run) test-test-sbox-run

test-mixcolumns-test.balsa: mixcolumns.breeze Project
	$(BALSAMAKETEST) $(BALSAIMPORTPATH) -p . mixcolumns-test

sim-pre-mixcolumns-test: test-mixcolumns-test.breeze

sim-mixcolumns-test: sim-pre-mixcolumns-test
	$(BREEZESIM) $(BALSAIMPORTPATH) $(SIMARGS_mixcolumns-test) test-mixcolumns-test

sim-win-mixcolumns-test: sim-pre-mixcolumns-test
	$(BREEZESIMCTRL) $(BALSAIMPORTPATH) $(SIMARGS_mixcolumns-test) test-mixcolumns-test

test-test1.balsa: mixcolumn.breeze Project
	$(BALSAMAKETEST) $(BALSAIMPORTPATH) -p . test1

sim-pre-test1: test-test1.breeze

sim-test1: sim-pre-test1
	$(BREEZESIM) $(BALSAIMPORTPATH) $(SIMARGS_test1) test-test1

sim-win-test1: sim-pre-test1
	$(BREEZESIMCTRL) $(BALSAIMPORTPATH) $(SIMARGS_test1) test-test1

test-multest.balsa: gfmul.breeze Project
	$(BALSAMAKETEST) $(BALSAIMPORTPATH) -p . multest

sim-pre-multest: test-multest.breeze

sim-multest: sim-pre-multest
	$(BREEZESIM) $(BALSAIMPORTPATH) $(SIMARGS_multest) test-multest

sim-win-multest: sim-pre-multest
	$(BREEZESIMCTRL) $(BALSAIMPORTPATH) $(SIMARGS_multest) test-multest

test-aes-simpletest.balsa: aes.breeze Project
	$(BALSAMAKETEST) $(BALSAIMPORTPATH) -p . aes-simpletest

sim-pre-aes-simpletest: test-aes-simpletest.breeze

sim-aes-simpletest: sim-pre-aes-simpletest
	$(BREEZESIM) $(BALSAIMPORTPATH) $(SIMARGS_aes-simpletest) test-aes-simpletest

sim-win-aes-simpletest: sim-pre-aes-simpletest
	$(BREEZESIMCTRL) $(BALSAIMPORTPATH) $(SIMARGS_aes-simpletest) test-aes-simpletest

### Implementation rules
### Implementation simulations
### Miscellaneous rules
.PHONY: sim-pre-aes-simpletest sim-aes-simpletest sim-win-aes-simpletest
.PHONY: sim-pre-multest sim-multest sim-win-multest
.PHONY: sim-pre-test1 sim-test1 sim-win-test1
.PHONY: sim-pre-mixcolumns-test sim-mixcolumns-test sim-win-mixcolumns-test
.PHONY: sim-pre-test-sbox-run sim-test-sbox-run sim-win-test-sbox-run
.PHONY: depend clean very-clean ps cost help

depend:
	balsa-make-makefile -b -p /home/koch/balsa/naive-AES-balsa

clean:
	$(RM)
	$(RM) addkey.breeze aes.breeze affine.breeze gf4.breeze gfdouble.breeze gfmul.breeze inversion.breeze mixcolumn.breeze mixcolumns.breeze sbox.breeze shiftrow.breeze test-sbox.breeze
	$(RM) addkey.ps aes.ps affine.ps gf4.ps gfdouble.ps gfmul.ps inversion.ps mixcolumn.ps mixcolumns.ps sbox.ps shiftrow.ps test-sbox.ps
	$(RM) test-test-sbox-run.breeze
	$(RM) test-mixcolumns-test.breeze
	$(RM) test-test1.breeze
	$(RM) test-multest.breeze
	$(RM) test-aes-simpletest.breeze

very-clean: clean
	$(RM)
	$(RM) test-test-sbox-run.balsa
	$(RM) test-mixcolumns-test.balsa
	$(RM) test-test1.balsa
	$(RM) test-multest.balsa
	$(RM) test-aes-simpletest.balsa
	$(RM) test-test-sbox-run.hhh
	$(RM) test-mixcolumns-test.hhh
	$(RM) test-test1.hhh
	$(RM) test-multest.hhh
	$(RM) test-aes-simpletest.hhh
	$(RM_R) .libs

ps: test-sbox.ps shiftrow.ps sbox.ps mixcolumns.ps mixcolumn.ps inversion.ps gfmul.ps gfdouble.ps gf4.ps affine.ps aes.ps addkey.ps

cost: test-sbox.breeze shiftrow.breeze sbox.breeze mixcolumns.breeze mixcolumn.breeze inversion.breeze gfmul.breeze gfdouble.breeze gf4.breeze affine.breeze aes.breeze addkey.breeze
	breeze-cost test-sbox.breeze
	breeze-cost shiftrow.breeze
	breeze-cost sbox.breeze
	breeze-cost mixcolumns.breeze
	breeze-cost mixcolumn.breeze
	breeze-cost inversion.breeze
	breeze-cost gfmul.breeze
	breeze-cost gfdouble.breeze
	breeze-cost gf4.breeze
	breeze-cost affine.breeze
	breeze-cost aes.breeze
	breeze-cost addkey.breeze

help:
	@echo 'Target                                       Meaning'
	@echo '-------------------------------------------- ---------------------------------------------------'
	@echo 'clean                                        Remove auto-generated files (except test harnesses)'
	@echo 'cost                                         Estimate Breeze block costs'
	@echo 'ps                                           Generate PostScript graphs for a Breeze files'
	@echo 'sim-aes-simpletest, sim-win-aes-simpletest   Simulate procedure aes in block [aes]'
	@echo 'sim-mixcolumns-test, sim-win-mixcolumns-test Simulate procedure mixcolumns in block [mixcolumns]'
	@echo 'sim-multest, sim-win-multest                 Simulate procedure gfmul in block [gfmul]'
	@echo 'sim-test-sbox-run, sim-win-test-sbox-run     Simulate procedure balsa1 in block [test-sbox]'
	@echo 'sim-test1, sim-win-test1                     Simulate procedure mixcolumn in block [mixcolumn]'
	@echo 'suffix rule .breeze                          Compile Balsa to Breeze'
	@echo 'suffix rule .ps                              Generate a PostScript graph of a Breeze file'
	@echo 'very-clean                                   Remove all auto-generated files'
	@echo

