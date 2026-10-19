// negative/generic_fail.zig — намеренная ошибка компиляции, НЕ входит в общий прогон
// Запуск: zig test negative/generic_fail.zig  (ожидается ошибка компиляции)
const std = @import("std");

// Слайд 23: ограничения через comptime.
fn requireInteger(comptime T: type) void {
    switch (@typeInfo(T)) {
        .int => {},
        else => @compileError(
            "T must be an integer type"),
    }
}

comptime { requireInteger(u32); }
// requireInteger(f32) даст ошибку компиляции.

// Скелет: показываем диагностическое сообщение компилятора.
comptime { requireInteger(f32); }
