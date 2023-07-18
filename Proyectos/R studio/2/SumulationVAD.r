p_X <- function(x)
    {
    if (x %in% 0:3)
        ans <-(choose(5, 3-x)*choose(3,x))/choose(8,3)
    else
        ans <- 0
    ans
    }

R_X = 0:3

plot(R_X, sapply(R_X, p_X))

F_X <- function(x){
    acum = 0
    if (x>= 0 & x<=3) 
        acum <- sum(sapply(0:x, p_X))
    if (x>3)
        acum <-1
    acum
}

F_X(2.4)

x <- seq(-3,6, length = 1000)
acumulada <- sapply(x, F_X)


plot(x, acumulada, ylim = c(-0.05,1.05), cex=0.1)

for (x in R_X)
    {
    text(x,F_X(x), "[")
    text(x,F_X(x-0.01), ")")
}

sample(R_X, 1, prob = sapply(R_X, p_X))

set.seed(1234)

n_rep = seq(10,100000, length = 100)

simulacion <- rep(NA, 100)


for (i in 1:100)
{
    simulacion[i] <- mean(replicate(n_rep[i], sample(R_X, 1, prob = sapply(R_X, p_X))))
}


plot(n_rep, simulacion)
abline(h=63/56,col="red")


