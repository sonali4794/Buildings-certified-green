library("mosaic")
library("tidyverse")

head(creatinine)

plot_scatter = ggplot(creatinine) + geom_point(aes(x=age, y=creatclear)) + 
  labs (x="Patient's Age", y="Creatinine Clearance Rate", title="Creatinine Levels")
plot_scatter

lrmodel = lm(creatclear ~ age , data=creatinine)
lrmodel
c = coef(lrmodel)[1]
c
m = coef(lrmodel)[2]
m
lrplot = plot_scatter + geom_abline(data = creatinine, mapping=aes(slope=m, intercept=c, color="red"))
lrplot 

predict(lrmodel, data.frame(age=55))

a1 = predict(lrmodel, data.frame(age=40))
a1
a2 = predict(lrmodel, data.frame(age=60))
a2
std_error_40yrold = a1 - 135
std_error_40yrold
std_error_60yrold = a2 - 112
std_error_60yrold