# Ley de los grandes números

#Caso Bernoulli
n <- 100000;
p = 0.3;
means <- c();
S <- 0;
for(i in 1:n){
  S <- S + rbinom(1, size = 1, prob = p);
  m <- S/i;
  means[i] <- m;
}

plot(1:n, means, type = "l")

plot(1:n, abs(means-p), type = "l", log = "y")

sq <- c();
for(i in 1:n){
  sq[i] <- 1/sqrt(i);
}

lines(1:n, sq, col = "red")

# Aplicación: Integración con Monte Carlo

#generamos n uniformes en el [0,pi/2].
u <- runif(1000, min = 0, max = pi/2)
h <- sin(u)
mean(h)*pi/2

# No ejemplo: Paradoja de San Petersburgo

n <- 100000;
means <- c();
S <- 0;
g <- rgeom(n, prob = 0.5)
for(i in 1:n){
  S <- S + 2^g[i]-10;
  m <- S/i;
  means[i] <- m;
}

#s <- seq(from = 1, to = n, by = 100)
plot(1:n, means, type = "l")

# Teorema Central del Límite

# Caso Uniforme
n <- 30
S <- rep(0, times = 100000)
for(i in 1:n){
u <- runif(100000, min = -1, max = 1)
S <- S + u;
}
hist(S, breaks = 30, probability = TRUE)
t <- seq(from = -3*sqrt(n/3), to = 3*sqrt(n/3),length.out = 100)
dfn <- dnorm(t, mean = 0, sd = sqrt(n/3))
lines(t,dfn, col = 'red')


# Caso Exponencial
n <- 100
lambda = 1
S <- rep(0, times = 100000)
for(i in 1:n){
  x <- rexp(100000, rate = lambda)
  S <- S + x;
}
hist(S, breaks = 20, probability = TRUE)
l <- n/lambda - 3*sqrt(n)/lambda;
u <- n/lambda + 3*sqrt(n)/lambda;
t <- seq(from = l, to = u,length.out = 100)
dfn <- dnorm(t, mean = n/lambda , sd =sqrt(n)/lambda)
lines(t,dfn, col = 'red')

dfg <- dgamma(t,rate = lambda, shape = n)
lines(t,dfg, col = 'blue')
