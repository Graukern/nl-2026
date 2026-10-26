import std.stdio;

void main()
{
    int value = 10;
    {
        int local = 5;
        writeln(value + local);
    }
    // local за пределами блока недоступна
    writeln(value);
}
