// Autoria: Erick Suzart Souza, 2023

unsigned fibonacci_c(unsigned n)
{
    unsigned a = 1, b = 1, c = 0;

    if (n == 1 || n == 2)
        return 1;

    for (unsigned i = 3; i <= n; i++)
    {
        c = a + b;
        a = b;
        b = c;
    }

    return c;
}