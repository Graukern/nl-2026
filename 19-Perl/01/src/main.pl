use strict;
use warnings;

# 1. Базовый пример
my $language = "Perl";
print "$language\n";

# 2. 
print "Hello, Perl!\n";

# 3. Пример обработки текста (закомментирован, чтобы скрипт не зависал в ожидании ввода из stdin)
# while (<>) {
#     print if /error/i;
# }

# 4. Регулярные выражения
my $text = "Error: file not found";
if ($text =~ /error/i) {
    print "Найдена ошибка\n";  
}

# 5. Типы данных
my $name = "Alice";
my @numbers = (10, 20, 30);
my %user = (
    name => "Alice",
);

# 6. Операции со строками и числами
my $a = "10";
my $b = 5;
print $a + $b, "\n";  # 15
print $a . $b, "\n";  # 105

# 7. Преобразование типов
my $text_val = "42";
my $number = $text_val + 8;
my $string = "$number";
print $number, "\n";  # 50
print $string, "\n";  # "50"

# 8. Области видимости
my $x = 10;
{
    my $x = 20;
    print $x, "\n";  # 20
}
print $x, "\n";      # 10

# 10. Функции
sub add {
    my ($a, $b) = @_;
    return $a + $b;
}
my $result = add(2, 3);
print $result, "\n";  # 5

# 11. Рекурсия (факториал)
sub factorial {
    my ($n) = @_;
    return 1 if $n <= 1;
    return $n * factorial($n - 1);
}
print factorial(5), "\n"; # 120

# 12. Замыкания
sub make_adder {
    my $n = shift;
    return sub {
        return $_[0] + $n;
    };
}
my $add5 = make_adder(5);
print $add5->(3), "\n"; # 8