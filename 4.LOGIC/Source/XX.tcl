# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Fri Sep 21 16:44:05 2018
# Designs open: 1
#   Sim: simv
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: sfp_add_sub_test.f2s
#   Wave.1: 97 signals
#   Group count = 4
#   Group add_sub signal count = 46
#   Group std2slf_a signal count = 12
#   Group std2slf_b signal count = 12
#   Group f2s signal count = 27
# End_DVE_Session_Save_Info

# DVE version: L-2016.06_Full64
# DVE build date: May 24 2016 21:01:02


#<Session mode="Full" path="/home/liyong/Source/MachineLearning/4.LOGIC/SXY.srcs/XX.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set -value 100ns

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{4 29} {1863 1028}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 371]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 371
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 370} {height 714} {dock_state left} {dock_on_new_line true} {child_hier_colhier 314} {child_hier_coltype 82} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 315]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 315
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 739
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 314} {height 714} {dock_state left} {dock_on_new_line true} {child_data_colvariable 219} {child_data_colvalue 12} {child_data_coltype 111} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 179]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value -1
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 179
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 295} {height 178} {dock_state bottom} {dock_on_new_line true}}
set DriverLoad.1 [gui_create_window -type DriverLoad -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line false -dock_extent 179]
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_width -value_type integer -value 150
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_height -value_type integer -value 179
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DriverLoad.1} {{left 0} {top 0} {width 1563} {height 178} {dock_state bottom} {dock_on_new_line false}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings


# Create and position top-level window: TopLevel.2

if {![gui_exist_window -window TopLevel.2]} {
    set TopLevel.2 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.2 TopLevel.2
}
gui_show_window -window ${TopLevel.2} -show_state maximized -rect {{60 78} {1979 1101}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.2}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 557} {child_wave_right 1357} {child_wave_colname 276} {child_wave_colvalue 277} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}
gui_update_statusbar_target_frame ${TopLevel.2}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{ -a vcs.log +v2k +libext+.vlib+.v+.sv+.svh+.vhd -ucligui}}
gui_set_env SIMSETUP::SIMEXE {simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {simv}] } {
gui_sim_run Ucli -exe simv -args { -a vcs.log +v2k +libext+.vlib+.v+.sv+.svh+.vhd -ucligui} -dir ../SXY.srcs -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
gui_set_precision 1ns
gui_set_time_units 1ns
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {sfp_add_sub_test.f2s}
gui_load_child_values {sfp_add_sub_test.std2slf_a}
gui_load_child_values {sfp_add_sub_test.std2slf_b}


set _session_group_1 add_sub
gui_sg_create "$_session_group_1"
set add_sub "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { sfp_add_sub_test.add_sub.i_clk sfp_add_sub_test.add_sub.i_da sfp_add_sub_test.add_sub.i_db sfp_add_sub_test.add_sub.i_mode sfp_add_sub_test.add_sub.i_req sfp_add_sub_test.add_sub.i_rst sfp_add_sub_test.add_sub.o_do sfp_add_sub_test.add_sub.o_vld sfp_add_sub_test.add_sub.p1_exp_a_pre sfp_add_sub_test.add_sub.p1_fra_a_pre sfp_add_sub_test.add_sub.p1_exp_b_pre sfp_add_sub_test.add_sub.p1_fra_b_pre sfp_add_sub_test.add_sub.p1_vld sfp_add_sub_test.add_sub.p1_exp_a sfp_add_sub_test.add_sub.p1_fra_a sfp_add_sub_test.add_sub.p1_exp_b sfp_add_sub_test.add_sub.p1_fra_b sfp_add_sub_test.add_sub.p1_ge sfp_add_sub_test.add_sub.p1_mode sfp_add_sub_test.add_sub.p2_vld sfp_add_sub_test.add_sub.p2_mode sfp_add_sub_test.add_sub.p2_fra_a sfp_add_sub_test.add_sub.p2_fra_b sfp_add_sub_test.add_sub.p2_exp_val sfp_add_sub_test.add_sub.p2_ge sfp_add_sub_test.add_sub.p2_exp_shift sfp_add_sub_test.add_sub.p3_vld sfp_add_sub_test.add_sub.p3_mode sfp_add_sub_test.add_sub.p3_exp_val sfp_add_sub_test.add_sub.p3_fra_a sfp_add_sub_test.add_sub.p3_fra_b sfp_add_sub_test.add_sub.p4_vld sfp_add_sub_test.add_sub.p4_exp_val sfp_add_sub_test.add_sub.p4_fra_val sfp_add_sub_test.add_sub.p5_vld sfp_add_sub_test.add_sub.p5_exp_val sfp_add_sub_test.add_sub.p5_fra_val sfp_add_sub_test.add_sub.p5_clv sfp_add_sub_test.add_sub.p6_vld sfp_add_sub_test.add_sub.p6_exp_val sfp_add_sub_test.add_sub.p6_fra_val sfp_add_sub_test.add_sub.p6_shift_vld sfp_add_sub_test.add_sub.p6_clv sfp_add_sub_test.add_sub.p7_exp_val sfp_add_sub_test.add_sub.p7_fra_val sfp_add_sub_test.add_sub.p7_vld }
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p1_fra_a_pre}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p1_fra_a_pre}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p1_fra_b_pre}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p1_fra_b_pre}
gui_set_radix -radix {decimal} -signals {Sim:sfp_add_sub_test.add_sub.p1_exp_a}
gui_set_radix -radix {unsigned} -signals {Sim:sfp_add_sub_test.add_sub.p1_exp_a}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p1_fra_a}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p1_fra_a}
gui_set_radix -radix {decimal} -signals {Sim:sfp_add_sub_test.add_sub.p1_exp_b}
gui_set_radix -radix {unsigned} -signals {Sim:sfp_add_sub_test.add_sub.p1_exp_b}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p1_fra_b}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p1_fra_b}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p2_fra_a}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p2_fra_a}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p2_fra_b}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p2_fra_b}
gui_set_radix -radix {decimal} -signals {Sim:sfp_add_sub_test.add_sub.p2_exp_val}
gui_set_radix -radix {unsigned} -signals {Sim:sfp_add_sub_test.add_sub.p2_exp_val}
gui_set_radix -radix {decimal} -signals {Sim:sfp_add_sub_test.add_sub.p2_exp_shift}
gui_set_radix -radix {unsigned} -signals {Sim:sfp_add_sub_test.add_sub.p2_exp_shift}
gui_set_radix -radix {decimal} -signals {Sim:sfp_add_sub_test.add_sub.p3_exp_val}
gui_set_radix -radix {unsigned} -signals {Sim:sfp_add_sub_test.add_sub.p3_exp_val}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p3_fra_a}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p3_fra_a}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p3_fra_b}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p3_fra_b}
gui_set_radix -radix {decimal} -signals {Sim:sfp_add_sub_test.add_sub.p4_exp_val}
gui_set_radix -radix {unsigned} -signals {Sim:sfp_add_sub_test.add_sub.p4_exp_val}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p4_fra_val}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p4_fra_val}
gui_set_radix -radix {decimal} -signals {Sim:sfp_add_sub_test.add_sub.p5_exp_val}
gui_set_radix -radix {unsigned} -signals {Sim:sfp_add_sub_test.add_sub.p5_exp_val}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p5_fra_val}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p5_fra_val}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p5_clv}
gui_set_radix -radix {unsigned} -signals {Sim:sfp_add_sub_test.add_sub.p5_clv}
gui_set_radix -radix {decimal} -signals {Sim:sfp_add_sub_test.add_sub.p6_exp_val}
gui_set_radix -radix {unsigned} -signals {Sim:sfp_add_sub_test.add_sub.p6_exp_val}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.add_sub.p6_fra_val}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.add_sub.p6_fra_val}

set _session_group_2 std2slf_a
gui_sg_create "$_session_group_2"
set std2slf_a "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { sfp_add_sub_test.std2slf_a.i_clk sfp_add_sub_test.std2slf_a.i_dat sfp_add_sub_test.std2slf_a.i_req sfp_add_sub_test.std2slf_a.i_rst sfp_add_sub_test.std2slf_a.o_dat sfp_add_sub_test.std2slf_a.o_vld sfp_add_sub_test.std2slf_a.p1_exp sfp_add_sub_test.std2slf_a.p1_exp_pre sfp_add_sub_test.std2slf_a.p1_fra sfp_add_sub_test.std2slf_a.p1_fra_pre sfp_add_sub_test.std2slf_a.p1_sig_pre sfp_add_sub_test.std2slf_a.p1_vld }

set _session_group_3 std2slf_b
gui_sg_create "$_session_group_3"
set std2slf_b "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { sfp_add_sub_test.std2slf_b.i_clk sfp_add_sub_test.std2slf_b.i_dat sfp_add_sub_test.std2slf_b.i_req sfp_add_sub_test.std2slf_b.i_rst sfp_add_sub_test.std2slf_b.o_dat sfp_add_sub_test.std2slf_b.o_vld sfp_add_sub_test.std2slf_b.p1_exp sfp_add_sub_test.std2slf_b.p1_exp_pre sfp_add_sub_test.std2slf_b.p1_fra sfp_add_sub_test.std2slf_b.p1_fra_pre sfp_add_sub_test.std2slf_b.p1_sig_pre sfp_add_sub_test.std2slf_b.p1_vld }

set _session_group_4 f2s
gui_sg_create "$_session_group_4"
set f2s "$_session_group_4"

gui_sg_addsignal -group "$_session_group_4" { sfp_add_sub_test.f2s.i_clk sfp_add_sub_test.f2s.i_rst sfp_add_sub_test.f2s.i_req sfp_add_sub_test.f2s.i_dat sfp_add_sub_test.f2s.p1_exp_pre sfp_add_sub_test.f2s.p1_fra_pre sfp_add_sub_test.f2s.p1_vld sfp_add_sub_test.f2s.p1_exp sfp_add_sub_test.f2s.p1_fra sfp_add_sub_test.f2s.p1_sig sfp_add_sub_test.f2s.p2_exp sfp_add_sub_test.f2s.p2_fra sfp_add_sub_test.f2s.p2_shift sfp_add_sub_test.f2s.p2_sig sfp_add_sub_test.f2s.p2_vld sfp_add_sub_test.f2s.p2_zero sfp_add_sub_test.f2s.p3_exp sfp_add_sub_test.f2s.p3_fra sfp_add_sub_test.f2s.p3_shift sfp_add_sub_test.f2s.p3_sig sfp_add_sub_test.f2s.p3_vld sfp_add_sub_test.f2s.p4_exp sfp_add_sub_test.f2s.p4_fra sfp_add_sub_test.f2s.p4_sig sfp_add_sub_test.f2s.p4_vld sfp_add_sub_test.f2s.o_vld sfp_add_sub_test.f2s.o_dat }
gui_set_radix -radix {decimal} -signals {Sim:sfp_add_sub_test.f2s.p1_exp_pre}
gui_set_radix -radix {unsigned} -signals {Sim:sfp_add_sub_test.f2s.p1_exp_pre}
gui_set_radix -radix {hex} -signals {Sim:sfp_add_sub_test.f2s.p1_fra_pre}
gui_set_radix -radix {twosComplement} -signals {Sim:sfp_add_sub_test.f2s.p1_fra_pre}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 44



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_expand -id ${Hier.1} sfp_add_sub_test}
catch {gui_list_select -id ${Hier.1} {sfp_add_sub_test.add_sub}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {sfp_add_sub_test.std2slf_b}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# DriverLoad 'DriverLoad.1'
gui_get_drivers -session -id ${DriverLoad.1} -signal {sfp_add_sub_test.add_sub.p6_exp_val[8:0]} -time 745 -starttime 752
gui_get_drivers -session -id ${DriverLoad.1} -signal {sfp_add_sub_test.f2s.p3_shift[4:0]} -time 0 -starttime 44

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active sfp_add_sub_test.f2s sfp_slf2std.v
gui_view_scroll -id ${Source.1} -vertical -set 1530
gui_src_set_reusable -id ${Source.1}

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 91 221
gui_list_add_group -id ${Wave.1} -after {New Group} {std2slf_a}
gui_list_add_group -id ${Wave.1} -after {New Group} {std2slf_b}
gui_list_add_group -id ${Wave.1} -after {New Group} {add_sub}
gui_list_add_group -id ${Wave.1} -after {New Group} {f2s}
gui_list_collapse -id ${Wave.1} std2slf_a
gui_list_collapse -id ${Wave.1} std2slf_b
gui_list_select -id ${Wave.1} {sfp_add_sub_test.f2s.p3_shift }
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group add_sub  -item {sfp_add_sub_test.add_sub.p6_clv[4:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 44
gui_view_scroll -id ${Wave.1} -vertical -set 1149
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
}
#</Session>

