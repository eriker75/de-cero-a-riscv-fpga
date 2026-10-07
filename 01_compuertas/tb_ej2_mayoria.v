// Testbench autocomprobable del ejercicio 2.
// Cuenta cuántos votos "sí" hay y compara con la salida de tu circuito.
`timescale 1ns/1ps

module tb_ej2_mayoria;

  reg  a, b, c;
  wire aprobado;
  reg  esperado;
  integer i, errores;

  mayoria dut (.a(a), .b(b), .c(c), .aprobado(aprobado));

  initial begin
    errores = 0;
    $display("");
    $display(" a b c | aprobado | esperado");
    for (i = 0; i < 8; i = i + 1) begin
      {a, b, c} = i[2:0];
      #10;
      esperado = ((a + b + c) >= 2);
      $display(" %b %b %b |    %b     |    %b     %s",
               a, b, c, aprobado, esperado,
               (aprobado === esperado) ? "ok" : "<-- MAL");
      if (aprobado !== esperado) errores = errores + 1;
    end
    $display("");
    if (errores == 0) $display("PASS: ¡votación por mayoría correcta!");
    else              $display("FAIL: %0d fila(s) incorrecta(s). Escribe la tabla de verdad en papel primero.", errores);
    $display("");
    $finish;
  end

endmodule
