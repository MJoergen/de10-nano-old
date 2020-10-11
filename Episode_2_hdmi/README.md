# Episode 2: HDMI video output

In this episode we expand on the previous episode and make a simple design that
generates a nice pattern on the HDMI video output.

## The design
First of all, the DE10 Nano board contains an ADV7513 chip that converts from
VGA to HDMI. In other words, the FPGA itself needs only to provide a
VGA-compatible output, and the extra chip on the board will then convert the
VGA signals to a HDMI output.

There exist plenty of tutorials on generating a VGA output, so I'll just
briefly go over the design. I've chosen to move all the video output to a separate
directory called `hdmi`. Furthermore, I've removed the LED and switches from
the previous episode, as we won't be needing them anymore.

### `top.vhd`

In the following, I'll walk you through the top level file [top.vhd](top.vhd).
We start by examining the port declarations:

```
entity top is
   port (
      fpga_clk1_50_i : in  std_logic;        -- 50 MHz clock input
      hdmi_tx_clk_o  : out std_logic;        -- 25 MHz clock output
      hdmi_tx_de_o   : out std_logic;
      hdmi_tx_d_o    : out std_logic_vector(23 downto 0);
      hdmi_tx_hs_o   : out std_logic;
      hdmi_tx_vs_o   : out std_logic
   );
end entity top;
```

The port names I've chosen to (closely) match the names used in the [DE10 Nano
board
schematic](https://software.intel.com/content/dam/develop/external/us/en/documents/de10-nano-schematic-711128.pdf),
with the only change being that I've appended `_i` or `_o` if the port is input
or output respectively.

The first thing to consider is clock signals. The DE10 Nano board delivers a 50
MHz clock signal to the FPGA logic `fpga_clk1_50_i`.

The HDMI chip can work with several different resolutions, but in this design
I'll be using a 640x480 @ 60 Hz resolution. This requires a clock of 25.2 MHz.
It turns out that the video chip will work correctly even with a 25.0 MHz, so we'll
go with that for now, since it is easier. In a later episode we'll change to
the more accurate 25.2 Mhz clock frequency.

The top level file generates the 25 MHz clock using a simple clock divider. Then
the HDMI controller is instantiated, and the HDMI clock output is connected.

### `hdmi/hdmi_counters.vhd`
This small file generates the pixel X and Y counters, where X counts from 0 to
799, and Y counts from 0 to 524. The range of values for X and Y is slightly
larger than 640x480, but that is how VGA signals are meant to be. The values
are taken from
[http://caxapa.ru/thumbs/361638/DMTv1r11.pdf](http://caxapa.ru/thumbs/361638/DMTv1r11.pdf).


### `hdmi/hdmi_output.vhd`
This file generates the actual HDMI output signals based on the current pixel X
and Y coordinates.

The signals generated by this block are:

```
hdmi_tx_de_o : out std_logic;
hdmi_tx_d_o  : out std_logic_vector(23 downto 0);
hdmi_tx_hs_o : out std_logic;
hdmi_tx_vs_o : out std_logic
```

The signal `hdmi_tx_d_o` contains the 24-bit RGB color of the current pixel.
The remaining signals, `hdmi_tx_de_o`, `hdmi_tx_hs_o`. and `hdmi_tx_vs_o`,
provide synchronization information to the HDMI chip.

The actual color is determined by this line:

```
hdmi_tx_d_o  <= pixel_x_i & pixel_y_i & pixel_y_i(3 downto 0);
```

There is nothing magical about this assignment. Really, you could provide any
combination of bits based on the pixel counters. The one I chose here is
completely arbitrary.

### `hdmi/hdmi.vhd`
This small file just instantiates the two previous files and provides a nice
clean interface to the top level module `top.vhd`.


## Changes to the scripts
First of all, we have to provide the clocking information to the Quartus tool,
specifically to its Timing Analyzer.

### `top.sdc`
This file contains all the timing constraints and clock information.

The command `create_clock` gives information about the incoming 50 MHz clock.

The command `create_generated_clock` is needed to instruct the Quartus tool
about the manually generated clock. In particular, the tool is not able to
infer the generated frequency, so this has to be stated explicitly with the
argument `-divide_by 2`.

The command `derive_clock_uncertainty` I'm not sure about, but I believe is
necessary as soon as multiple clocks are present.

### `top.qsf`
First thing is we've disabled `MUX_RESTRUCTURE` (the default value is AUTO).
Apparently this is necessary in order to close timing. I don't know why.

After that we've added the three new source files:

```
set_global_assignment -name VHDL_FILE hdmi/hdmi.vhd
set_global_assignment -name VHDL_FILE hdmi/hdmi_counters.vhd
set_global_assignment -name VHDL_FILE hdmi/hdmi_output.vhd
```

And then we've updated the pin assignments. These are taken from the [DE10 Nano
board
schematic](https://software.intel.com/content/dam/develop/external/us/en/documents/de10-nano-schematic-711128.pdf).

## Testing
To start the build simply type the command:

```
make
```

Once the build is finished, you can program the FPGA with the generated bitstream.

Then you should be able to connect the DE10 Nano board to a HDMI monitor and see
a beautiful (?) pattern on the screen!
