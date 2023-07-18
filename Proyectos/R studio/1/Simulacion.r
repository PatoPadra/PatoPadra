set.seed(1234)
n_rep = 10000
mean(replicate(n_rep, sum(sample(6, 2, replace = TRUE))%%2==0))

casos_totales = 0
casos_favorables = 0

for (dado1 in 1:6)
{
    for (dado2 in 1:6)
    {
        casos_totales = casos_totales +1
        if ((dado1 + dado2)%%2==0)
        {
            casos_favorables = casos_favorables + 1
        }
    }
}

casos_favorables/casos_totales

n<-30
sample(1:n)

fixed_points <- function(vector)
{
    fixed_points = 0
    for (i in 1:length(vector))
    {
        if (vector[i]==i)
            {
            fixed_points <- fixed_points +  1
            }
    }
    return (fixed_points)
}

set.seed(1234)

for (n_rep in c(10, 100, 500, 1000, 5000, 10000, 50000, 100000, 500000, 1000000, 5000000))
{
    print(mean(replicate(n_rep, fixed_points(sample(1:n))==0)))
}

Mejor guardamos las distintas simulaciones en un vector


set.seed(1234)

n_rep = c(10, 100, 500, 1000, 5000, 10000, 50000, 100000, 500000, 1000000, 5000000)

simulacion <- rep(NA, length(n_rep))

for (i in 1:length(n_rep))
{
    simulacion[i] <- (mean(replicate(n_rep[i],fixed_points(sample(1:n))==0)))
}

simulacion

plot(log(n_rep), simulacion)

1/exp(1)


