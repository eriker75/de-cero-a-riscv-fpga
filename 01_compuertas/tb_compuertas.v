// Testbench de la lección 01.
// Prueba todas las combinaciones de a y b e imprime la tabla de verdad.
`timescale 1ns/1ps

module tb_compuertas;

  // Entradas del circuito: "reg" porque el testbench les asigna valores.
  reg a, b;

  // Salidas del circuito: "wire" porque solo las observamos.
  wire y_not_a, y_and, y_or, y_xor, y_nand;

  // Instanciamos (colocamos) el circuito a probar: el DUT.
  // .pin_del_modulo(cable_del_testbench)
  compuertas dut (
    .a      (a),
    .b      (b),
    .y_not_a(y_not_a),
    .y_and  (y_and),
    .y_or   (y_or),
    .y_xor  (y_xor),
    .y_nand (y_nand)
  );

  integer i;

  initial begin
    // Guarda las señales para verlas en GTKWave.
    $dumpfile("compuertas.vcd");
    $dumpvars(0, tb_compuertas);

    $display("");
    $display(" a b | NOTa AND OR XOR NAND");
    $display("-----+---------------------");

    // Recorremos las 4 combinaciones: 00, 01, 10, 11.
    for (i = 0; i < 4; i = i + 1) begin
      {a, b} = i[1:0];   // {a, b} junta dos bits: el bit 1 de i va a 'a' y el bit 0 a 'b'.
      #10;               // esperamos 10 ns para que las salidas se actualicen
      $display(" %b %b |   %b   %b   %b   %b    %b",
               a, b, y_not_a, y_and, y_or, y_xor, y_nand);
    end

    $display("");
    $finish;
  end

endmodule
