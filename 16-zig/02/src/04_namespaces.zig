// 04_namespaces.zig — пространство имен через контейнерный тип
// Запуск: zig run 04_namespaces.zig   /   zig test 04_namespaces.zig
const std = @import("std");

const Units = struct {
    pub const scale: u32 = 1000;

    pub fn toBase(x: u32) u32 {
        return x * scale;
    }
};

// Здесь struct используется как пространство имен,
// создавать экземпляр Units не требуется.
const result = Units.toBase(3);

pub fn main() !void {
    std.debug.print("Units.toBase(3)={d}\n", .{result});
    std.debug.print("Units.scale={d}\n", .{Units.scale});
}

test "namespace через struct" {
    try std.testing.expectEqual(@as(u32, 3000), Units.toBase(3));
    try std.testing.expectEqual(@as(u32, 1000), Units.scale);
}
