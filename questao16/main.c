#include <stdio.h>

extern float somar(float n1, float n2);
extern float subtrair(float n1, float n2);
extern float multiplicar(float n1, float n2);
extern float dividir(float n1, float n2);


int main() {
    float num1, num2;
    // int operacao;

    printf("Digite o primeiro número: ");
    scanf("%f", &num1);

    printf("Digite o segundo número: ");
    scanf("%f", &num2);
    printf("A soma entre num1 e num2 é: %f\n", somar(num1, num2));

    // printf("Escolha a operação:\n");
    // printf("1 - Soma\n");
    // printf("2 - Subtração\n");
    // printf("3 - Multiplicação\n");
    // printf("4 - Divisão\n");
    // printf("Digite o número correspondente à operação desejada: ");
    // scanf("%d", &operacao);

    // switch (operacao) {
    //     case 1:
    //         printf("Resultado: %.2f\n", num1 + num2);
    //         break;
    //     case 2:
    //         printf("Resultado: %.2f\n", num1 - num2);
    //         break;
    //     case 3:
    //         printf("Resultado: %.2f\n", num1 * num2);
    //         break;
    //     case 4:
    //         if (num2 != 0) {
    //             printf("Resultado: %.2f\n", num1 / num2);
    //         } else {
    //             printf("Erro: divisão por zero\n");
    //         }
    //         break;
    //     default:
    //         printf("Operação inválida\n");
    //         break;
    // }

    return 0;
}
