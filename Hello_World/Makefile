PROJECT = hello_world
FAMILY  = "Cyclone V"
PART    = 5CSEBA6U23I7
SOURCE  = hello_world.vhd

all:
	quartus_map $(PROJECT) --source=$(SOURCE) --family=$(FAMILY)
	quartus_fit $(PROJECT) --part=$(PART)
	quartus_asm $(PROJECT)
	quartus_sta $(PROJECT)

clean:
	rm -rf c5_pin_model_dump.txt
	rm -rf db/
	rm -rf hello_world.asm.rpt
	rm -rf hello_world.fit.rpt
	rm -rf hello_world.fit.summary
	rm -rf hello_world.flow.rpt
	rm -rf hello_world.jdi
	rm -rf hello_world.map.rpt
	rm -rf hello_world.map.summary
	rm -rf hello_world.pin
	rm -rf hello_world.qpf
	rm -rf hello_world.sld
	rm -rf hello_world.sof
	rm -rf hello_world.sta.rpt
	rm -rf hello_world.sta.summary
	rm -rf incremental_db/

