
ag = aggregate(total~hr, bikeshare, mean)
ag
data.frame(ag$total)

lineplot = ggplot(ag) + geom_line(aes(x=hr, y=total)) +
labs (x="Hour of the day", y="Average bike rentals", title="Avg bike rentals with respective to every hour")
lineplot

ag1 = aggregate(total~hr+workingday, bikeshare, mean)
ag1

lineplot1 = ggplot(ag1) + geom_line(aes(x=hr, y=total)) +
  labs (x="Hour of the day", y="Average bike rentals", title="Avg bike rentals with respective to every hour")+
facet_wrap(~workingday, nrow = 2)
lineplot1

ag2 = bikeshare %>% filter(hr == 8)
ag2n = aggregate(total~weathersit+workingday, ag2, mean)


lineplot2 = ggplot(ag2n) + geom_line(aes(x=weathersit, y=total)) +
  labs (x="Hour of the day", y="Average bike rentals", title="Avg bike rentals with respective to every hour")+
  facet_wrap(~workingday, nrow = 2)
lineplot2


