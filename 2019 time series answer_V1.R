install.packages("fpp")
library(fpp)

install.packages("astsa")
library(astsa)

#Q1
plot(birth)

start(birth)
end(birth)

length(birth)

frequency(birth)



#Q2
#partition dataset into training dataset
training <- window(ts(birth),1,300)

Box.test(training)

#convert partition dataset into time series
training <- ts(training,frequency = 12,start = c(1948,1))
training


#partition dataset into testing dataset
testing <- window(ts(birth),301,373)

#convert partition dataset into time series
testing <- ts(testing,frequency = 12,start = c(1973,1))
?ts
testing


#Q3

install.packages("forecast")
library(forecast)

Acf(training,80)
pacf(training,80)


#Q4

frequency(training)
seasonal_Diff <- diff(training,12)
Acf(seasonal_Diff,80)


#Q5

lag1 <- diff(seasonal_Diff,1)

Acf(lag1,80)

#Q6
#to check stationary we use kpss test

#ho: data are stationary    vs h1: data are not stationary

install.packages("tseries")
library(tseries)

kpss.test(lag1)
#p-value = 0.1
#at 5% significant level p > alfa, so do not reject ho.
#at 5% significant level we have enough evidence to conclude that data are stationary.

#Q7

pacf(lag1,80)

#Q8

log_Diff <- log(training)
plot(log_Diff)


library(forecast)
model1 <- Arima(log_Diff,order=c(0,1,1),seasonal=c(0,1,0))
summary(model1)
#ACI value = -1257.1

model2 <- Arima(log_Diff,order = c(0,1,2), seasonal=c(0,1,1))
summary(model2)
#ACI value = -1375.59

model3 <- Arima(log_Diff,order = c(0,1,2), seasonal = c(1,1,0))
summary(model3)
#ACI value = -1323.24


#minimum ACI value is -1375.59 
#so it is the best model.  


















