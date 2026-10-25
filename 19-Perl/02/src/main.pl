#!/usr/bin/env perl
use strict;
use warnings;

# ==============================================================================
# 01. Flow Control: Conditions (Слайд 1, 2, 3)
# ==============================================================================

# Пример из титульного слайда (Слайд 1)
sub check_validity {
    my ($valid) = @_;
    if ($valid) {
        # process_data();
        print "Data processed successfully\n";
    } else {
        die "Invalid input";
    }
}

# Условия if / elsif / else (Слайд 2)
my $score = 85;
if ($score >= 90) {
    print "Excellent\n";
} elsif ($score >= 60) {
    print "Passed\n";
} else {
    print "Failed\n";
}

# Модификаторы условий, unless и тернарный оператор (Слайд 3)
my $age = 20;
print "Adult\n" if $age >= 18;

my $value = 10;
die "Invalid value\n" unless $value > 0;

my $status = "ok";
my $message = $status eq "ok" ? "Success" : "Error";


# ==============================================================================
# 02. Flow Control: Loops & Iterators (Слайды 4, 5)
# ==============================================================================

# Цикл while (Слайд 4)
my $i = 1;
while ($i <= 3) {
    print "$i\n";
    $i++;
}

# Цикл for по диапазону (Слайд 4)
for my $n (1..3) {
    print "$n\n";
}

# Итератор foreach с оператором next (Слайд 5)
my @numbers = (1, 2, 3, 4, 5);
foreach my $n (@numbers) {
    next if $n % 2 == 0;
    print "$n\n";
}


# ==============================================================================
# 03. Flow Control: Blocks & Scoping (Слайд 6)
# ==============================================================================

my $x = 10;
{
    my $x = 20;
    print "$x\n"; # 20
}
print "$x\n";     # 10


# ==============================================================================
# 04. Error Handling: Exceptions, Eval & Preconditions (Слайды 7, 8, 9)
# ==============================================================================

# Использование die и warn при работе с файлами (Слайд 7)
# (Закомментировано, чтобы не вызывать ошибку отсутствия файла при запуске)
=kw
my $file = "data.txt";
open my $fh, "<", $file or die "Cannot open $file: $!";
warn "File is empty\n" if -z $file;
close $fh;
=cut

# Перехват ошибок через eval (Слайд 8)
my $result = eval {
    die "Calculation failed\n";
    42;
};

if ($@) {
    warn "Error: $@";
} else {
    print "$result\n";
}

# Проверка предусловий в функции (Слайд 9)
sub divide {
    my ($dividend, $divisor) = @_;
    die "Division by zero\n" if $divisor == 0;
    return $dividend / $divisor;
}

print divide(10, 2), "\n";

# Автоматический тест с Test::More (Слайд 9)
# use Test::More tests => 1;
# is(divide(10, 2), 5, "division works");


# ==============================================================================
# 05. Packages, Modules & Exporter (Слайды 10, 11, 12)
# ==============================================================================

# Объявление пакета MathTools с поддержкой Exporter (Слайды 10-12)
package MathTools;
use strict;
use warnings;
use Exporter 'import';

our @EXPORT_OK = qw(square);

sub square {
    my ($x) = @_;
    return $x * $x;
}

1; # Возвращает истинное значение при загрузке пакета/модуля

# Использование пакета из другого пространства имён (Слайды 10-12)
package main;

# Прямой вызов через полное имя (Слайды 10, 11)
print MathTools::square(4), "\n";

# Использование экспортируемой функции (Слайд 12)
# MathTools->import('square');
# print square(4), "\n";


# ==============================================================================
# 06. Integration Example (Слайд 13)
# ==============================================================================

# Фрагмент, объединяющий условия, ошибки и модули (Слайд 13)
sub integration_demo {
    my $input = $ARGV[0] // "5"; # значение по умолчанию для демонстрации

    my $res = eval {
        die "Not a number\n" unless $input =~ /^-?\d+$/;
        MathTools::square($input);
    };

    if ($@) {
        warn "Error: $@";
    } else {
        print "Result: $res\n";
    }
}

integration_demo();