
# (C) 2001-2018 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 18.1 625 linux 2018.09.30.10:30:02

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     ip_fft_mfcc
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level shell script that compiles Altera simulation libraries
# and the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "ncsim.sh", and modify text as directed.
# 
# You can also modify the simulation flow to suit your needs. Set the
# following variables to 1 to disable their corresponding processes:
# - SKIP_FILE_COPY: skip copying ROM/RAM initialization files
# - SKIP_DEV_COM: skip compiling the Quartus EDA simulation library
# - SKIP_COM: skip compiling Quartus-generated IP simulation files
# - SKIP_ELAB and SKIP_SIM: skip elaboration and simulation
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator. In this case, you must also copy the generated files
# # "cds.lib" and "hdl.var" - plus the directory "cds_libs" if generated - 
# # into the location from which you launch the simulator, or incorporate
# # into any existing library setup.
# #
# # Run Quartus-generated IP simulation script once to compile Quartus EDA
# # simulation libraries and Quartus-generated IP simulation files, and copy
# # any ROM/RAM initialization files to the simulation directory.
# # - If necessary, specify any compilation options:
# #   USER_DEFINED_COMPILE_OPTIONS
# #   USER_DEFINED_VHDL_COMPILE_OPTIONS applied to vhdl compiler
# #   USER_DEFINED_VERILOG_COMPILE_OPTIONS applied to verilog compiler
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1 \
# USER_DEFINED_COMPILE_OPTIONS=<compilation options for your design> \
# USER_DEFINED_VHDL_COMPILE_OPTIONS=<VHDL compilation options for your design> \
# USER_DEFINED_VERILOG_COMPILE_OPTIONS=<Verilog compilation options for your design> \
# QSYS_SIMDIR=<script generation output directory>
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the IP script)
# #
# ncvlog <compilation options> <design and testbench files>
# #
# # TOP_LEVEL_NAME is used in this script to set the top-level simulation or
# # testbench module/entity name.
# #
# # Run the IP script again to elaborate and simulate the top level:
# # - Specify TOP_LEVEL_NAME and USER_DEFINED_ELAB_OPTIONS.
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME=<simulation top> \
# USER_DEFINED_ELAB_OPTIONS=<elaboration options for your design> \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If ip_fft_mfcc is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 18.1 625 linux 2018.09.30.10:30:02
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="ip_fft_mfcc"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="/TDA/Intel/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `ncsim -version` != *"ncsim(64)"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/fft_ii_0/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/stratixiv_hssi_ver/
mkdir -p ./libraries/stratixiv_pcie_hip_ver/
mkdir -p ./libraries/stratixiv_ver/
mkdir -p ./libraries/altera/
mkdir -p ./libraries/lpm/
mkdir -p ./libraries/sgate/
mkdir -p ./libraries/altera_mf/
mkdir -p ./libraries/altera_lnsim/
mkdir -p ./libraries/stratixiv_hssi/
mkdir -p ./libraries/stratixiv_pcie_hip/
mkdir -p ./libraries/stratixiv/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/ip_fft_mfcc_fft_ii_0_opt_twi1.hex ./
  cp -f $QSYS_SIMDIR/submodules/ip_fft_mfcc_fft_ii_0_opt_twr4.hex ./
  cp -f $QSYS_SIMDIR/submodules/ip_fft_mfcc_fft_ii_0_opt_twr1.hex ./
  cp -f $QSYS_SIMDIR/submodules/ip_fft_mfcc_fft_ii_0_opt_twi2.hex ./
  cp -f $QSYS_SIMDIR/submodules/ip_fft_mfcc_fft_ii_0_opt_twr2.hex ./
  cp -f $QSYS_SIMDIR/submodules/ip_fft_mfcc_fft_ii_0_opt_twi3.hex ./
  cp -f $QSYS_SIMDIR/submodules/ip_fft_mfcc_fft_ii_0_opt_twr3.hex ./
  cp -f $QSYS_SIMDIR/submodules/ip_fft_mfcc_fft_ii_0_opt_twi4.hex ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"               -work altera_ver            
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                        -work lpm_ver               
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                           -work sgate_ver             
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                       -work altera_mf_ver         
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_hssi_atoms.v"            -work stratixiv_hssi_ver    
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_pcie_hip_atoms.v"        -work stratixiv_pcie_hip_ver
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_atoms.v"                 -work stratixiv_ver         
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"         -work altera                
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"     -work altera                
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"        -work altera                
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"     -work altera                
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd"  -work altera                
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"             -work altera                
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                       -work lpm                   
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                      -work lpm                   
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                    -work sgate                 
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                         -work sgate                 
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"          -work altera_mf             
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                     -work altera_mf             
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                   -work altera_lnsim          
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"       -work altera_lnsim          
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_hssi_components.vhd"     -work stratixiv_hssi        
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_hssi_atoms.vhd"          -work stratixiv_hssi        
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_pcie_hip_components.vhd" -work stratixiv_pcie_hip    
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_pcie_hip_atoms.vhd"      -work stratixiv_pcie_hip    
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_atoms.vhd"               -work stratixiv             
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/stratixiv_components.vhd"          -work stratixiv             
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/auk_dspip_text_pkg.vhd"                                -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/auk_dspip_math_pkg.vhd"                                -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/auk_dspip_lib_pkg.vhd"                                 -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_avalon_streaming_block_sink.vhd"     -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_avalon_streaming_block_source.vhd"   -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/auk_dspip_roundsat.vhd"                                -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/apn_fft_mult_can.vhd"                          -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/cadence/apn_fft_mult_cpx_1825.v"                       -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/apn_fft_mult_cpx.vhd"                          -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/hyper_opt_OFF_pkg.vhd"                         -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/altera_fft_mult_add.vhd"                       -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/altera_fft_dual_port_rom.vhd"                  -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_fft_pkg.vhd"                               -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/altera_fft_single_port_rom.vhd"                -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/altera_fft_dual_port_ram.vhd"                  -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/cadence/hyper_pipeline_interface.v"                    -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/cadence/counter_module.sv"                             -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_lib_pkg.vhd"                  -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_cma_adder_fp.vhd"             -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_top.vhd"                      -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_cma_bfi_fp.vhd"               -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_bit_reverse_reverse_carry_adder.vhd" -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_core.vhd"                     -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_enable_control.vhd"           -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_bit_reverse_addr_control.vhd"        -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_twrom.vhd"                    -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_bfii.vhd"                     -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_stg_pipe.vhd"                 -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_adder_fp.vhd"                 -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_bfi.vhd"                      -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_stage.vhd"                    -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_addsub.vhd"                   -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_cma_fp.vhd"                   -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_cma.vhd"                      -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_delay.vhd"                    -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_bit_reverse_core.vhd"                -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_bf_control.vhd"               -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_stg_out_pipe.vhd"             -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QSYS_SIMDIR/submodules/cadence/auk_dspip_r22sdf_counter.vhd"                  -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ip_fft_mfcc_fft_ii_0.sv"                               -work fft_ii_0 -cdslib ./cds_libs/fft_ii_0.cds.lib
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/ip_fft_mfcc.v"                                                                                                      
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  export GENERIC_PARAM_COMPAT_CHECK=1
  ncelab -access +w+r+c -namemap_mixgen $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
