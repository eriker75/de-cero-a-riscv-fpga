# Lección 01: comandos de simulación
.PHONY: compuertas ej1 ej2 clean

compuertas:
	@mkdir -p build
	iverilog -o build/compuertas tb_compuertas.v compuertas.v
	vvp build/compuertas

ej1:
	@mkdir -p build
	iverilog -o build/ej1 tb_ej1_medio_sumador.v ej1_medio_sumador.v
	vvp build/ej1

ej2:
	@mkdir -p build
	iverilog -o build/ej2 tb_ej2_mayoria.v ej2_mayoria.v
	vvp build/ej2

clean:
	rm -rf build *.vcd
