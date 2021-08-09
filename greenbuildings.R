library("tidyverse")

head(greenbuildings)
lowoccu_green = greenbuildings %>% 
  filter(leasing_rate <= 10 | green_rating ==1)
lowoccu_green
 mean_lowoccu_green = mean(lowoccu_green$Rent)
 mean_lowoccu_green

 lowoccu_notgreen = greenbuildings %>% 
   filter(leasing_rate <= 10 | green_rating ==0)
 lowoccu_green
 mean_lowoccu_notgreen = mean(lowoccu_notgreen$Rent)
 mean_lowoccu_notgreen
 
 green = greenbuildings %>% 
   filter(leasing_rate >= 10 | green_rating ==1)
 green
 mean_green = mean(green$Rent)
 mean_green
 
 notgreen = greenbuildings %>% 
   filter(leasing_rate >= 10 | green_rating ==0)
 green
 mean_notgreen = mean(notgreen$Rent)
 mean_notgreen
 
 y1 = c(mean_lowoccu_green, mean_green)
 x1 = c("Leasing rate less than 10%","Leasing rate more than 10%")
 greens = data.frame(x1,y1)
 greens
 y2 = c(mean_lowoccu_notgreen, mean_notgreen)
 x2 =  c("Leasing rate less than 10%","Leasing rate more than 10%")
 nongreens = data_frame(x2,y2)
 nongreens
 
 #error calculation if mean or median is taken as reference
 
 green_mean = sqrt(sum((mean(green$Rent)-green$Rent)^2)/nrow(green))
 green_med = sqrt(sum((median(green$Rent)-green$Rent)^2)/nrow(green))
 
 notgreen_mean = sqrt(sum((mean(notgreen$Rent)-notgreen$Rent)^2)/nrow(notgreen))
 notgreen_med = sqrt(sum((median(notgreen$Rent)-notgreen$Rent)^2)/nrow(notgreen))
 
 error_data = greenbuildings %>% mutate(meanerr = (mean(greenbuildings$Rent)-greenbuildings$Rent),
                                        mederr = (median(greenbuildings$Rent)-greenbuildings$Rent))
 
error_green = error_data %>% filter(greenbuildings$green_rating == 1)
error_notgreen = error_data %>% filter(greenbuildings$green_rating == 0)

ggplot(error_green) + geom_histogram(aes(meanerr), binwidth = 1) + labs (x = "Error", y = "Occurences", title = "Error if mean used for green buildings")
 
ggplot(error_green) + geom_histogram(aes(mederr), binwidth = 1) + labs (x = "Error", y = "Occurences", title = "Error if median used for non-green buildings")

ggplot(error_notgreen) + geom_histogram(aes(meanerr), binwidth = 1) + labs (x = "Error", y = "Occurences", title = "Error if mean used for green buildings")

ggplot(error_notgreen) + geom_histogram(aes(mederr), binwidth = 1) + labs (x = "Error", y = "Occurences", title = "Error if median used for non-green buildings")

plot_buildingsize = ggplot(greenbuildings)+ geom_point(aes(x=stories,y=size))
plot_buildingsize

lrmodel = lm(size ~ stories, data=greenbuildings)

predict(model, data.frame(stories=15))
 