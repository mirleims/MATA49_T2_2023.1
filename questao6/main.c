// Autoria: Erick Suzart Souza, 2023

#include <stdio.h>
#include <time.h>

extern unsigned fibonacci_asm(unsigned n);
extern unsigned fibonacci_c(unsigned n);

unsigned long get_nanoseconds(clock_t start, clock_t end)
{
    return (end - start) * 100000000 / CLOCKS_PER_SEC;
}

int main()
{
    unsigned n;
    printf("Digite um número: ");
    scanf("%u", &n);

    // cronômetros para medir o tempo de execução
    clock_t start, end;

    // Versão em assembly
    start = clock();
    unsigned result = fibonacci_asm(n);
    end = clock();

    printf("Tempo da versão em assembly ");
    printf("%lu ns\n", get_nanoseconds(start, end));
    printf("Fibonacci de %u: %u\n", n, result);

    // Versão em C
    start = clock();
    result = fibonacci_c(n);
    end = clock();

    printf("Tempo da versão em C ");
    printf("%lu ns\n", get_nanoseconds(start, end));
    printf("Fibonacci de %u: %u\n", n, result);

    return 0;
}
