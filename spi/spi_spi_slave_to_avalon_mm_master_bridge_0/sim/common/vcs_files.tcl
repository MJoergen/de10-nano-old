
namespace eval spi_spi_slave_to_avalon_mm_master_bridge_0 {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    dict set design_files "SPISlaveToAvalonMasterBridge.v"                        "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/SPISlaveToAvalonMasterBridge.v"                       
    dict set design_files "altera_avalon_packets_to_master_inst_for_spichain.v"   "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_packets_to_master_inst_for_spichain.v"  
    dict set design_files "altera_avalon_st_bytes_to_packets_inst_for_spichain.v" "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_st_bytes_to_packets_inst_for_spichain.v"
    dict set design_files "altera_avalon_st_packets_to_bytes_inst_for_spichain.v" "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_st_packets_to_bytes_inst_for_spichain.v"
    dict set design_files "channel_adapter_btop_for_spichain.v"                   "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/channel_adapter_btop_for_spichain.v"                  
    dict set design_files "channel_adapter_ptob_for_spichain.v"                   "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/channel_adapter_ptob_for_spichain.v"                  
    dict set design_files "spislave_inst_for_spichain.v"                          "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/spislave_inst_for_spichain.v"                         
    dict set design_files "altera_avalon_packets_to_master.v"                     "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_packets_to_master.v"                    
    dict set design_files "altera_avalon_st_bytes_to_packets.v"                   "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_st_bytes_to_packets.v"                  
    dict set design_files "altera_avalon_st_packets_to_bytes.v"                   "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/altera_avalon_st_packets_to_bytes.v"                  
    dict set design_files "spiphyslave.v"                                         "$QSYS_SIMDIR/../spi_slave_to_avalon_mm_master_bridge_1911/sim/spiphyslave.v"                                        
    dict set design_files "spi_spi_slave_to_avalon_mm_master_bridge_0.v"          "$QSYS_SIMDIR/spi_spi_slave_to_avalon_mm_master_bridge_0.v"                                                          
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
  
  
}
