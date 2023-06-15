//  Erick Suzuart, Paloma Arize

unsigned int fatorial_c(unsigned int n)
{
    // Casos base: 0! = 1! = 1
    unsigned int dp[2] = {1, 1};

    for (unsigned int i = 1; i <= n; i++)
        // Calcula o fatorial de i e armazena em dp[i % 2]
        dp[i % 2] = i * dp[(i - 1) % 2];

    // Retorna o valor do fatorial de n armazenado em dp[n % 2]
    return dp[n % 2];
}
