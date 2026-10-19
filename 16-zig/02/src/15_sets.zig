// 15_sets.zig — множества: HashMap(K, void), EnumSet, StaticBitSet
// Запуск: zig test 15_sets.zig   /   zig run 15_sets.zig
//
// ВАЖНО: код дословный, как в конспекте (§34, §35). В Zig 0.17.0 методов
// initEmpty() у EnumSet и StaticBitSet уже нет (используйте .init(.{}) и
// .empty), поэтому этот файл не компилируется — это расхождение слайда
// с реальным API. Проверяйте на negative/ и остальных примерах.
const std = @import("std");

fn demo() !void {
    // Слайд 34: множество через HashMap(K, void).
    var set = std.AutoHashMap(u32, void)
        .init(std.testing.allocator);
    defer set.deinit();

    try set.put(7, {});
    try set.put(7, {});
    try set.put(9, {});
    try std.testing.expectEqual(
        @as(u32, 2), set.count());
    _ = set.remove(7);

    std.debug.print("set.count={d}\n", .{set.count()});

    // Слайд 35: EnumSet и битовые множества.
    const Color = enum { red, green, blue };
    var colors = std.EnumSet(Color).initEmpty();
    colors.insert(.red);
    colors.insert(.blue);
    try std.testing.expect(colors.contains(.red));

    var bits = std.StaticBitSet(64).initEmpty();
    bits.set(5);
    try std.testing.expect(bits.isSet(5));

    std.debug.print("contains(red)={}, isSet(5)={}\n",
        .{ colors.contains(.red), bits.isSet(5) });
}

pub fn main() !void {
    try demo();
}

test "множества: §34 и §35 конспекта" {
    try demo();
}
