// build.zig — шаги сборки и публикуемые модули (Zig 0.17.0)
// Запуск: zig build run-module / zig build run-package / zig build run-all / zig build test-all
const std = @import("std");

// В build.zig:
// Хелпер — только чтобы поместить дословные строки §17 конспекта
// рядом с объявлением root (см. build() ниже).
fn addPkgmath(b: *std.Build, root: *std.Build.Module) void {
    const dep = b.dependency("math_pkg", .{});
    root.addImport("pkgmath", dep.module("math"));
}

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // --- §16: именованный импорт модуля (дословно) -------------
    const lib = b.createModule(.{
        .root_source_file = b.path("modules/math.zig"),
        .target = target,
    });
    const root = b.createModule(.{
        .root_source_file = b.path("06_module.zig"),
        .target = target,
    });
    root.addImport("mathlib", lib);

    // В 06_module.zig:
    // const math = @import("mathlib");
    // (здесь закомментировано: строка выполняется в 06_module.zig,
    // у build.zig нет импорта mathlib — см. README)

    const module_exe = b.addExecutable(.{
        .name = "module-demo",
        .root_module = root,
    });
    const run_module = b.addRunArtifact(module_exe);
    const step_module = b.step("run-module",
        "Запуск 06_module.zig с импортом mathlib");
    step_module.dependOn(&run_module.step);

    // --- §17: пакет и build.zig.zon ----------------------------
    // Локальная path-зависимость (deps/math_pkg) без сети.
    const package_root = b.createModule(.{
        .root_source_file = b.path("07_package.zig"),
        .target = target,
        .optimize = optimize,
    });
    package_root.addImport("mathlib", lib);
    addPkgmath(b, package_root);

    // --- §19: публичный интерфейс модуля ------------------------
    // mylib — lib.zig, который реэкспортирует только Stack и version.
    const mylib = b.createModule(.{
        .root_source_file = b.path("lib.zig"),
        .target = target,
        .optimize = optimize,
    });
    const public_root = b.createModule(.{
        .root_source_file = b.path("19_public_api.zig"),
        .target = target,
        .optimize = optimize,
    });
    public_root.addImport("mylib", mylib);

    const public_exe = b.addExecutable(.{
        .name = "public-api-demo",
        .root_module = public_root,
    });
    const run_public = b.addRunArtifact(public_exe);
    const step_public = b.step("run-public",
        "Запуск 19_public_api.zig с импортом mylib");
    step_public.dependOn(&run_public.step);

    const package_exe = b.addExecutable(.{
        .name = "package-demo",
        .root_module = package_root,
    });
    const run_package = b.addRunArtifact(package_exe);
    const step_package = b.step("run-package",
        "Запуск 07_package.zig с импортами mathlib и pkgmath");
    step_package.dependOn(&run_package.step);

    // --- Скелет: общий прогон успешных демонстраций ------------
    // Подряд, а не параллельно: порядок вывода соответствует
    // порядку разделов конспекта. 15_sets.zig и negative/ исключены.
    const run_all = b.step("run-all",
        "Запуск всех успешных демонстраций подряд (кроме 15_sets.zig и negative/)");

    const all_files = [_][]const u8{
        "01_errors.zig",
        "02_cleanup.zig",
        "03_assert.zig",
        "04_namespaces.zig",
        "05_import.zig",
        "06_module.zig",
        "07_package.zig",
        "08_export.zig",
        "09_generics.zig",
        "10_stack.zig",
        "11_arrays.zig",
        "12_arraylist.zig",
        "13_maps.zig",
        "14_stringmap.zig",
        "16_wordcount.zig",
        "19_public_api.zig",
    };

    var prev: ?*std.Build.Step = null;
    for (all_files) |path| {
        const mod = makeModule(b, path, lib, mylib, target, optimize);
        const exe = b.addExecutable(.{
            .name = path[0 .. path.len - 4],
            .root_module = mod,
        });
        const cmd = b.addRunArtifact(exe);
        if (prev) |p| cmd.step.dependOn(p);
        prev = &cmd.step;
    }
    if (prev) |p| run_all.dependOn(p);

    // --- Скелет: общий прогон тестов ---------------------------
    const test_all = b.step("test-all",
        "Прогон тестов всех примеров (кроме 15_sets.zig и negative/)");

    var prev_test: ?*std.Build.Step = null;
    for (all_files) |path| {
        const mod = makeModule(b, path, lib, mylib, target, optimize);
        const t = b.addTest(.{ .root_module = mod });
        const run_t = b.addRunArtifact(t);
        if (prev_test) |p| run_t.step.dependOn(p);
        prev_test = &run_t.step;
    }
    if (prev_test) |p| test_all.dependOn(p);
}

// Скелет: модуль файла примера: импорты для 06/07/19, libc для 08.
fn makeModule(
    b: *std.Build,
    path: []const u8,
    lib: *std.Build.Module,
    mylib: *std.Build.Module,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
) *std.Build.Module {
    const mod = b.createModule(.{
        .root_source_file = b.path(path),
        .target = target,
        .optimize = optimize,
    });
    // 08_export.zig вызывает extern abs → нужен libc.
    if (std.mem.eql(u8, path, "08_export.zig")) {
        mod.link_libc = true;
    }
    if (std.mem.eql(u8, path, "06_module.zig") or
        std.mem.eql(u8, path, "07_package.zig"))
    {
        mod.addImport("mathlib", lib);
    }
    if (std.mem.eql(u8, path, "07_package.zig")) {
        addPkgmath(b, mod);
    }
    // Потребитель публичного интерфейса mylib (§19).
    if (std.mem.eql(u8, path, "19_public_api.zig")) {
        mod.addImport("mylib", mylib);
    }
    return mod;
}
