#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
OFS=$IFS
IFS="
"
/Library/Developer/CommandLineTools/usr/bin/ld     -framework Cocoa      -order_file /Users/josephbarbier/Desktop/compile-lifelihood/compilation/newSetUp/lib/x86_64-darwin/symbol_order.fpc -multiply_defined suppress -L. -o /Users/josephbarbier/Desktop/compile-lifelihood/compilation/newSetUp/lib/x86_64-darwin/lifelihoodC2023 `cat /Users/josephbarbier/Desktop/compile-lifelihood/compilation/newSetUp/lib/x86_64-darwin/link25268.res` -filelist /Users/josephbarbier/Desktop/compile-lifelihood/compilation/newSetUp/lib/x86_64-darwin/linkfiles25268.res
if [ $? != 0 ]; then DoExitLink ; fi
IFS=$OFS