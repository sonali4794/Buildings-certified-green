library("mosaic")
library("tidyverse")

head(s550)

plot_scatter = ggplot(s550) + geom_point(aes(x=mileage, y=price, alpha=0.01)) + 
  labs (x="Mileage", y="Price", title="1501 Mercedes S-Class S550") +
  facet_wrap(~ year, nrow = 3)

plot_scatter

