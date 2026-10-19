// internal/stack.zig — скелет: реализация, которую lib.zig прячет от потребителя.
// Stack возвращен тем же файлом, где объявлен (10_stack.zig), чтобы не
// дублировать код конспекта.
pub const Stack = @import("../10_stack.zig").Stack;
