// 07_package.zig — потребитель пакета: два именованных импорта
// mathlib  -> modules/math.zig (модуль этого проекта)
// pkgmath  -> модуль "math" из path-зависимости deps/math_pkg
// Запуск: zig build run-package
const std = @import("std");

const math = @import("mathlib");
const pkg = @import("pkgmath");

pub fn main() !void {
    std.debug.print("mathlib.square(7)={d}\n", .{math.square(7)});
    std.debug.print("pkgmath.cube(3)={d}\n", .{pkg.cube(3)});
}

test "имя зависимости, имя модуля и имя импорта могут различаться" {
    try std.testing.expectEqual(@as(i32, 49), math.square(7));
    try std.testing.expectEqual(@as(i32, 27), pkg.cube(3));
}
