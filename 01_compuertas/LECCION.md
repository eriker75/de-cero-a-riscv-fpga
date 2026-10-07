# Lección 01: bits, compuertas lógicas y tu primer módulo en Verilog

## 1. ¿Qué es un circuito digital?

Dentro de un chip solo hay **cables y transistores**. En un circuito digital cada cable puede estar en uno de dos estados:

| Voltaje | Significado | Se escribe |
|---|---|---|
| Bajo (≈ 0 V) | Falso / apagado | `0` |
| Alto (≈ 1,8 V, 3,3 V…) | Verdadero / encendido | `1` |

Cada uno de esos valores es un **bit**. Todo lo que hace una computadora (sumar, mostrar video, ejecutar programas) se construye combinando bits con unos bloques muy simples: las **compuertas lógicas**.

## 2. Las compuertas lógicas

Una compuerta recibe uno o más bits y produce un bit de salida, siguiendo una regla. Esa regla se escribe en una **tabla de verdad**, que lista todas las combinaciones posibles de entradas.

### NOT (inversor): "lo contrario"
| a | NOT a |
|---|---|
| 0 | 1 |
| 1 | 0 |

### AND: "las dos a la vez"
La salida es 1 **solo si todas** las entradas son 1. *Ejemplo: el carro arranca si tienes la llave Y pisas el freno.*

| a | b | a AND b |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

### OR: "al menos una"
La salida es 1 si **alguna** entrada es 1. *Ejemplo: la luz se enciende si presionas el interruptor de la puerta O el de la cama.*

| a | b | a OR b |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

### XOR (OR exclusivo): "son distintas"
La salida es 1 si las entradas son **diferentes**.

| a | b | a XOR b |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

### NAND: "NOT de AND"
Es simplemente lo contrario de AND. Dato curioso: **con solo compuertas NAND se puede construir cualquier circuito digital**, incluido un procesador completo.

> 💡 Con dos entradas hay 4 combinaciones (2²). Con 3 entradas hay 8 (2³). Con *n* entradas hay 2ⁿ.

## 3. ¿Qué es Verilog?

Verilog es un **lenguaje de descripción de hardware** (HDL). Parece un lenguaje de programación, pero hay una diferencia fundamental:

| Programa (Python, C) | Verilog |
|---|---|
| Instrucciones que se ejecutan **una tras otra** | Describe **cables y compuertas que existen todos a la vez** |
| Corre en un procesador | Se convierte en un circuito físico (en una FPGA o un chip) |

Cuando escribes `assign y = a & b;` no estás diciendo "calcula esto ahora". Estás diciendo **"conecta una compuerta AND entre a, b e y"**. Esa compuerta funciona siempre, todo el tiempo.

## 4. Tu primer módulo

Un **módulo** es un bloque de hardware con **pines** de entrada y salida, como un chip en una protoboard. Mira [`compuertas.v`](compuertas.v):

```verilog
module compuertas (
  input  wire a,       // pin de entrada a
  input  wire b,       // pin de entrada b
  output wire y_and,   // pin de salida
  ...
);
  assign y_and = a & b;   // conecta una compuerta AND
  ...
endmodule
```

- `module nombre ( ... ); ... endmodule`: define el bloque.
- `input` / `output`: la dirección de cada pin.
- `wire`: un **cable**.
- `assign`: conecta permanentemente la salida de una expresión a un cable.

### Operadores lógicos de un bit en Verilog
| Compuerta | Operador | Ejemplo |
|---|---|---|
| NOT | `~` | `~a` |
| AND | `&` | `a & b` |
| OR | `\|` | `a \| b` |
| XOR | `^` | `a ^ b` |
| NAND | `~( & )` | `~(a & b)` |

## 5. ¿Cómo sabemos que funciona? El testbench

Aún no tenemos placa, así que **simulamos**. Un **testbench** ([`tb_compuertas.v`](tb_compuertas.v)) es un módulo especial que:
1. Coloca el circuito a probar dentro de sí. A ese circuito se le llama **DUT** (*device under test*).
2. Le aplica entradas, como si movieras interruptores.
3. Muestra o comprueba las salidas.

Cosas nuevas que verás en el testbench (solo existen en simulación, no se convierten en hardware):
- `reg`: una variable a la que le podemos asignar valores desde el testbench.
- `initial begin ... end`: un bloque que se ejecuta **una vez** al iniciar la simulación.
- `#10`: espera 10 unidades de tiempo (aquí, 10 nanosegundos).
- `$display(...)`: imprime en la terminal, como `printf`.
- `$finish`: termina la simulación.

## 6. ¡Ejecútalo!

Desde esta carpeta:

```bash
make compuertas
```

Eso equivale a ejecutar:
```bash
iverilog -o build/compuertas tb_compuertas.v compuertas.v   # compila
vvp build/compuertas                                        # simula
```

Verás la tabla de verdad de todas las compuertas generada por tu circuito. **Compárala con las tablas de arriba.**

### Ver las señales como en un osciloscopio (opcional)
```bash
gtkwave compuertas.vcd
```
En el panel de la izquierda, haz clic en `tb_compuertas` y arrastra las señales al visor.

## 7. Experimenta

Antes de los ejercicios, rompe cosas a propósito:
1. En `compuertas.v`, cambia `a & b` por `a | b` en `y_and`. Vuelve a ejecutar. ¿Qué cambió?
2. Agrega una salida `y_nor` (NOT de OR). Tendrás que agregarla también en el testbench.

## 8. Ejercicios

### Ejercicio 1: medio sumador ([`ej1_medio_sumador.v`](ej1_medio_sumador.v))
Quieres sumar dos números de **un bit**: `a + b`. Los resultados posibles son 0, 1 o 2, y como 2 en binario es `10`, necesitas **dos** salidas:
- `suma`: el bit de la derecha del resultado.
- `acarreo`: el bit que "se lleva", como cuando en decimal 7 + 5 = 12 y "llevas 1".

| a | b | a + b (decimal) | acarreo | suma |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 2 | 1 | 0 |

**Pista:** compara la columna `suma` y la columna `acarreo` con las tablas de las compuertas de arriba. Cada una se parece **exactamente** a una compuerta.

```bash
make ej1
```

### Ejercicio 2: votación por mayoría ([`ej2_mayoria.v`](ej2_mayoria.v))
Tres jueces votan (1 = sí, 0 = no). La salida `aprobado` debe ser 1 si **al menos dos** jueces votan sí.

1. Escribe en papel la tabla de verdad completa (8 filas).
2. Piensa: "aprobado si (a y b) o (a y c) o …".
3. Escríbelo en Verilog con `&` y `|`.

```bash
make ej2
```

Cuando los dos ejercicios den **PASS**, ¡estás listo para la lección 02! 🎉

> 🤖 **Cómo usar la IA en esta lección:** pídele que te explique un concepto de otra forma o que te dé una pista, **no la solución**. Si te atascas más de 20 minutos, pide solo la siguiente pista.
