#Distribuci�n generadora de los datos: N(0,1)
real_mu <- 0
real_sigma2 <- 1

# 1 muestra:
n <- 20
xi <- rnorm(n, real_mu, sqrt(real_sigma2))

estim_mu <- mean(xi) #Estim M y MV

# Mi mejor (?) estimaci�n de real_mu es:
estim_mu

# Mi IC para mu es:
a <- estim_mu-qnorm(0.975, 0, 1)*sqrt(real_sigma2/n)
b <- estim_mu+qnorm(0.975, 0, 1)*sqrt(real_sigma2/n)

IC <- cbind(a,b)
IC

# Supongamos que pudi�ramos tomar muchas muestras de esta distribuci�n
# Muchas muestras, estimaciones e IC de nivel 0.95 para mu
# �En cu�ntos de esos IC "capturar�amos" al verdadero mu?
N <- 100
estims_mu <- c()
IC <- matrix(0, nrow=N, ncol=3)

for (i in 1:N){
  xi <- rnorm(n, real_mu, sqrt(real_sigma2))
  
  estims_mu[i] <- mean(xi)
  
  # Mi IC para mu
  a <- mean(xi)-qnorm(0.975, 0, 1)*sqrt(real_sigma2/n)
  b <- mean(xi)+qnorm(0.975, 0, 1)*sqrt(real_sigma2/n)
  
  IC[i,] <- cbind(a,b, a<real_mu & real_mu<b)
}
estims_mu
IC

mean(IC[,3])

# Podemos usar el 1-alpha/2 o el alpha/2 pero hay que indicar si es cola izquierda 
# (lower, por default esto es TRUE) o cola derecha (especificar lower.tail = FALSE). 
qnorm(0.995, 0, 1)
qnorm(0.005, 0, 1, lower.tail = FALSE)

# Extra: percentil de la Gamma(15, 1/2) = Chi(30)
qgamma(1-(0.1/2), shape = 15, scale = 1/(1/2))
qchisq(1-(0.1/2), 2*15)

qgamma((0.1/2), shape = 15, scale = 1/(1/2))
qchisq((0.1/2), 2*15)