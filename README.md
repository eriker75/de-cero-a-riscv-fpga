# De cero a RISC-V en FPGA

Ruta de aprendizaje de Verilog y diseño digital, desde cero hasta proyectos de portafolio: UART, VGA y un procesador RISC-V.

## Documentos

- [Orientación de carrera](docs/orientacion_carrera.md): qué estudiar, dónde, sueldos, cómo emigrar y cómo entrar a la industria de chips.
- [Introducción al diseño de chips](docs/intro_diseno_de_chips.md): qué hace cada especialidad (RTL, verificación, diseño físico, analógico, RF, FPGA).

## Cómo funciona cada lección

Cada carpeta tiene:
- `LECCION.md`: la teoría explicada desde cero. **Léela primero.**
- Archivos `.v`: código de ejemplo para leer, ejecutar y modificar.
- `tb_*.v`: *testbenches*, programas que prueban el circuito.
- **Ejercicios**: archivos con `TODO` que debes completar. El testbench te dice si los hiciste bien (`PASS`) o no (`FAIL`).

## Herramientas (Mac)

```bash
brew install icarus-verilog   # simulador de Verilog
brew install --cask gtkwave   # visor de señales (opcional al principio)
```

## Ruta completa

| Fase | Lección | Tema | Meta |
|---|---|---|---|
| **1. Fundamentos** | 01 | Bits, compuertas lógicas y tu primer módulo en Verilog | Entender qué es un circuito digital |
| | 02 | Números binarios y sumadores | Construir un sumador de 4 bits |
| | 03 | Multiplexores, decodificadores, `always @(*)` y `case` | Construir una ALU sencilla |
| **2. Circuitos con memoria** | 04 | El reloj y los flip-flops | Entender qué es "secuencial" |
| | 05 | Registros y contadores | Hacer un contador y un divisor de reloj |
| | 06 | Máquinas de estados (FSM) | Diseñar un semáforo y una cerradura con clave |
| **3. Hardware real** | 07 | La FPGA: encender un LED, botones y antirrebote | Tu diseño funcionando en la placa |
| | 08 | Displays de 7 segmentos y multiplexado | Mostrar números |
| **4. Proyectos de portafolio** | 09 | ⭐ **UART** | La FPGA conversa con tu computadora |
| | 10 | ⭐ **Controlador VGA / HDMI** | Dibujar en un monitor (y hacer un Pong) |
| | 11 | Memorias (RAM/ROM) | Guardar datos y programas |
| | 12 | Una CPU de 8 bits inventada por ti | Entender cómo funciona un procesador |
| | 13 | ⭐⭐ **RISC-V de un ciclo** | Un procesador real que ejecuta programas |
| | 14 | RISC-V segmentado (*pipelined*) | Rendimiento de procesador "de verdad" |
| | 15 | ⭐⭐ **Mini SoC**: RISC-V + UART + VGA | El proyecto estrella del CV |

> Regla de oro: **no avances hasta que todos los ejercicios de la lección den `PASS`.**
