import std.stdio;

void main()
{
    int age = 19;
    double average = 4.75;
    auto name = "Anna";
    immutable int passingScore = 3;

    writeln(name, ": ", average);
    writeln(age >= 18 && average >= passingScore);
}
