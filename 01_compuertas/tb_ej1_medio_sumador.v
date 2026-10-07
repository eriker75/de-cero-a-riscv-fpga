// Testbench autocomprobable del ejercicio 1.
// Compara tu circuito con el resultado aritmético de a + b.
`timescale 1ns/1ps

module tb_ej1_medio_sumador;

  reg  a, b;
  wire suma, acarreo;
  reg  [1:0] esperado;   // 2 bits: {acarreo, suma}
  integer i, errores;

  medio_sumador dut (.a(a), .b(b), .suma(suma), .acarreo(acarreo));

  initial begin
    errores = 0;
    $display("");
    $display(" a b | acarreo suma | esperado");
    for (i = 0; i < 4; i = i + 1) begin
      {a, b} = i[1:0];
      #10;
      esperado = {1'b0, a} + {1'b0, b};
      $display(" %b %b |    %b      %b   |   %b %b  %s",
               a, b, acarreo, suma, esperado[1], esperado[0],
               ({acarreo, suma} === esperado) ? "ok" : "<-- MAL");
      if ({acarreo, suma} !== esperado) errores = errores + 1;
    end
    $display("");
    if (errores == 0) $display("PASS: ¡medio sumador correcto!");
    else              $display("FAIL: %0d fila(s) incorrecta(s). Revisa la pista en LECCION.md", errores);
    $display("");
    $finish;
  end

endmodule
