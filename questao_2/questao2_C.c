/*  ALUNO: REYNAN DA SILVA DIAS PAIVA
    N° MATRICULA: 221115751
*/
#include <stdio.h>
#include <math.h>

float media_aritmetica(float a, float b, float c) {
    return ((a + b + c) / 3);
}

float media_geometrica(float a, float b, float c) {
    return pow((a * b * c), (1.0 / 3.0));
}

float media_harmonica(float a, float b, float c) {
    return (3.0 / ((1.0 / a) + (1.0 / b) + (1.0 / c)));
}

int main() {
    float a, b, c;
    
    printf("Digite o primeiro número: ");
    scanf("%f", &a);
    
    printf("Digite o segundo número: ");
    scanf("%f", &b);
    
    printf("Digite o terceiro número: ");
    scanf("%f", &c);
    
    printf("A média aritmética é: %.2f\n", media_aritmetica(a, b, c));
    printf("A média geométrica é: %.2f\n", media_geometrica(a, b, c));
    printf("A média harmônica é: %.2f\n", media_harmonica(a, b, c));
    
    return 0;
}
