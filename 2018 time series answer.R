install.packages("fpp")
library(fpp)
?fpp()


plot(usmelec)

install.packages("forecast")
library(forecast)
?forecast()


logdif <- log(usmelec)



Acf(logdif,100)
?Acf()



#Q3

frequency(logdif)
seasonaldif <- diff(logdif,12)
Acf(seasonaldif)


#Q4

#H0 : Seasonally differenced log series is stationary vs. 
#H1: Seasonally differenced log series is not stationary

#this is kpss test

install.packages("tseries")
library(tseries)

kpss.test(seasonaldif)

#p-value = 0.04728
#at 5% significance level p value is less than alfa.  reject ho.
#at 5% significance level there are enough evidence to conclude that Seasonally differenced log series is not stationary

#Q5

#H0 : Seasonally differenced log series is stationary vs. 
#H1: Seasonally differenced log series is not stationary

lag1diff <- diff(seasonaldif,1)
kpss.test(lag1diff)
#p-value = 0.1
#at 5% significance level p value is greater than alfa. reject ho.
#at 5% significance level there are enough evidence to conclude that Seasonally differenced log series is stationary.

#Q6
Acf(lag1diff,100)
pacf(lag1diff,100)

#Q7

model1 <- Arima(logdif,order=c(2,1,0),seasonal=c(0,1,1))
summary(model1)
#AIC=-1901.99

model2 <- Arima(logdif,order=c(0,1,3),seasonal=c(0,1,1))
summary(model2)
#AIC=-1931.29

model3 <- Arima(logdif,order=c(0,1,3),seasonal=c(1,1,0))
summary(model3)
#AIC=-1815.35

# Model2 has the lowest AIC value-1931.29. Therefore, it is the best model




?forecast()


























