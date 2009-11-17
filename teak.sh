RUNTIME=`teak-config`/share/teak/runtime/verilog

teak --latches a1 --gates -q all -O -t balsa test-simple && \
cver +define+HAS_GO +define+HAS_DONE +define+DUT=teak_balsa \
	${RUNTIME}/top.v ${RUNTIME}/example.v ${RUNTIME}/runtime.v \
	test-simple.v
