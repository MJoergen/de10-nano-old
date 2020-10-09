
namespace eval spi_spi_slave_to_avalon_mm_master_bridge_0 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries spi_slave_to_avalon_mm_master_bridge_1911  1
    dict set libraries spi_spi_slave_to_avalon_mm_master_bridge_0 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/SPISlaveToAvalonMasterBridge.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_packets_to_master_inst_for_spichain.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_st_bytes_to_packets_inst_for_spichain.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_st_packets_to_bytes_inst_for_spichain.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/channel_adapter_btop_for_spichain.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/channel_adapter_ptob_for_spichain.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/spislave_inst_for_spichain.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"                         
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_packets_to_master.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_st_bytes_to_packets.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_st_packets_to_bytes.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/spiphyslave.v"]\"  -work spi_slave_to_avalon_mm_master_bridge_1911"                                        
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/spi_spi_slave_to_avalon_mm_master_bridge_0.v"]\"  -work spi_spi_slave_to_avalon_mm_master_bridge_0"                                                         
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
}
