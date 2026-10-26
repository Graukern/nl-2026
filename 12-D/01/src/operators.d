import std.stdio;

void main()
{
    int sum = 7 + 3;
    int division = 7 / 3;
    double exact = cast(double) 7 / 3;
    bool result = (sum > 8) && (division == 2);

    writeln(sum, " / ", division);
    writeln(exact);
    writeln(result);
}
