PROJECT = spi

all:
	quartus_sh --flow compile $(PROJECT)

clean:
	rm -rf output_files
	rm -rf db/
	rm -rf qdb/
	rm -rf incremental_db/
	rm -rf $(PROJECT).qpf
	rm -rf c5_pin_model_dump.txt
	rm -rf $(PROJECT)_assignment_defaults.qdf

