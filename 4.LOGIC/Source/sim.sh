#!/bin/bash

if [ -f "simv" ]; then
    rm -f simv
fi

if [ -d "simv.daidir" ]; then
    rm -rf simv.daidir
fi

if [ -d "csrc*" ]; then
    rm -rf csrc*
fi

vcs -full64 -timescale=1ns/1ns \
    -l vcs.log -parallel+sva+tgl \
    -notice -LDFLAGS -Wl,--no-as-needed \
    -debug_all -gui -R -line \
    -line -debug_all +v2k +libext+.vlib+.v+.sv+.svh+.vhd \
    -P $NOVAS_HOME/share/PLI/VCS/linux64/novas.tab \
       $NOVAS_HOME/share/PLI/VCS/linux64/pli.a \
    -cc gcc -cpp g++ -ld g++ -Xcombo=0x11 \
    -f vcs.args
