// Lección 01: compuertas lógicas básicas.
// Este módulo es como un chip con 2 entradas y 5 salidas.
// Cada "assign" conecta una compuerta que funciona todo el tiempo y en paralelo.

module compuertas (
  input  wire a,
  input  wire b,
  output wire y_not_a,  // NOT a
  output wire y_and,    // a AND b
  output wire y_or,     // a OR b
  output wire y_xor,    // a XOR b
  output wire y_nand    // a NAND b
);

  assign y_not_a = ~a;
  assign y_and   = a & b;
  assign y_or    = a | b;
  assign y_xor   = a ^ b;
  assign y_nand  = ~(a & b);

endmodule
