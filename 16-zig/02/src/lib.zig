// lib.zig — §19: файл публикует только реэкспортируемые имена.
// Запуск: используется как модуль mylib (см. build.zig и 19_public_api.zig)
// lib.zig
const impl = @import("internal/stack.zig");

pub const Stack = impl.Stack;
pub const version = "1.0.0";
