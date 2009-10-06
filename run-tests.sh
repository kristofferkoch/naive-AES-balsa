#!/bin/sh
##
## run-tests.sh
## 
## Made by Kristoffer Ellersgaard Koch
## Login   <koch@i7>
## 
## Started on  Thu Oct  1 14:29:00 2009 Kristoffer Ellersgaard Koch
## Last update Thu Oct  1 14:29:00 2009 Kristoffer Ellersgaard Koch
##

((make || true) && \
 (breeze-sim test-inv4 | grep "TEST PASSED") &&
 (breeze-sim test-mixcolumn | grep "TEST PASSED") &&
 (breeze-sim test-mul4 | grep "TEST PASSED") &&
 (breeze-sim test-sbox | grep "TEST PASSED")
) || exit 1