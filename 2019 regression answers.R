
#Q1)
#independent variable
age <- c(18,17,18,20,22,23,22,25,31,40,33,36,20,48,55,61,59,48,43,50,33,25,59,48,31,40,55,61,18,17)


#dependent variable
time <- c(69,71,79,70,78,64,74,69,62,60,59,66,67,68,63,60,61,56,66,56,72,77,61,59,68,65,62,72,74,65)


#Q2)
plot(age,time,pch=21,col="blue",bg="red")
#data spread is top to bottom so relationship is negative. 
#using this plot we can not say it is weak, moderate or strong one.  

#Q3)
#calculate correlation
cor(age,time)

cor.test(age,time)   # Pearson's product-moment correlation
# cor =  -0.6009837 
# p- value = 0.0004448
#so, we can conclude that the relationship is moderate negative.
#because -0.7 < -0.6009837 < -0.3 


#-----------  Do Hypothesis

#Ho : correlation = 0 vs H1 : correlation != 0 
# p- value = 0.0004448
# in significance level = 0.05 > P value(0.0004448)
# reject Ho. that's mean ho != 0 at 5% significance level. 

  ##### perfect answer

    #rejection region:
      #reject ho, if p-value is less than alfa.

    # conclusion
      # p- value = 0.0004448
      # at 5% significance level p-value is less than alfa, so at 5% significance level we reject Ho.
      # hence at 5% significance level we have enough evidence to conclude that have a correlation between age and time. 

#04)
#-----------  Fit a model
  model <- lm(time~age)


  coef(model)    
  #Intercept = beta note hat , another parameter is beta one hat
  #beta note hat = 75.338955(75.339)  beta one hat =  -0.248298(-0.2483)
  #model is,
  # Y hat(time) = beta note hat + beta one hat * X hat(age) 
  # Y hat(time) = 75.339  -0.2483 * X hat(age) 

  #Interpret the estimated model parameters.
  #for 1 unit increase in age Y hat decrease by 0.2483 units. 
  

#05)
anova(model)
#p- value = 0.0004448   
#ho: b1 = 0(no linear relationship) vs h1: b1 != 0(linear relationship)
#significance level = 0.05
#Rejection region: p-value is less than alfa reject ho
#conclusion
#p- value = 0.0004448
# at 5% significance level p-value is less than alfa, so at 5% significance level we reject Ho.
# hence at 5% significance level we have enough evidence to conclude that have a linear relationship between age and time. 


#06)

par(mfrow=c(1,1))
plot(model)  

#Residuals vs fitted model 
  #assumption : variable has linear relationship(cannot see a pattern)
  #conclusion : The points are randomly distributed and no patterns. So, assumption is satisfied. Therefore, there is linear relationship between two variable

#normal Q-Q 
  #assumption : error terms are normally distributed(must see a diagonal)
  #in here we can't tell exactly our data is normally distributed or not.
  #so we do shapiro-wilks test

  shapiro.test(time)
  #p-value = 0.5613

  #ho : residuals are normally distributed vs h1:  residuals are not normally distributed
  #significance level = 0.05
  #Rejection region: p-value is less than alfa reject ho
  #conclusion
  #p-value = 0.5613
  # at 5% significance level p-value is greater than alfa, so at 5% significance level we can't reject Ho.
  # hence at 5% significance level we have enough evidence to conclude that error terms are normally distributed. 




#Scale-location
  #Assumption: variance is constant(cannot see a pattern)
  #Conclusion:
    #The points are randomly distributed and no patterns. So, assumption is satisfied.Therefore, variance is constant.
#residuals vs leverage
  #Checking the outliers.(cannot see a pattern)

  
  
#07)
#to find r squared value 
  summary(model)
#r squared value = 0.3612
  #model accuracy = 36.12%











