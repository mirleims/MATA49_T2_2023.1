//  Erick Suzuart, Paloma Arize

#include <stdio.h>
#include <time.h>

extern unsigned int fatorial_asm(unsigned int n);
extern unsigned int fatorial_c(unsigned int n);

int main()
{
    unsigned int n;
    printf("Digite um número: ");
    scanf("%u", &n);

    // cronômetros para medir o tempo de execução
    clock_t start, end;

    // Versão em assembly
    start = clock();
    unsigned int result = fatorial_asm(n);
    end = clock();

    printf("Tempo da versão em assembly ");
    printf("%lu ns\n", (end - start) * 100000000 / CLOCKS_PER_SEC);
    printf("Fatorial de %u: %u\n", n, result);

    // Versão em C
    start = clock();
    result = fatorial_c(n);
    end = clock();

    printf("Tempo da versão em C ");
    printf("%lu ns\n", (end - start) * 100000000 / CLOCKS_PER_SEC);
    printf("Fatorial de %u: %u\n", n, result);

    return 0;
}
