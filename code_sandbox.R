
setwd("~/Google Drive/dev/R/coursera/reproducible_research/")
activity_filename <- "./data/activity.csv"
act <- read.csv(activity_filename)
act2 <- act[complete.cases(act),]
act3 <- split(act2, act2$date, drop=TRUE)
daily_steps <- vector()
for(date in act3){
  daily_steps <- append(daily_steps, sum(date$steps))
}

daily_mean <- mean(daily_steps)
daily_median <- median(daily_steps)
print(daily_mean)
print(daily_median)

hist(daily_steps)

act4 <- split(act2, act2$interval, drop=TRUE)

interval_steps <- vector()
for(interval in act4){
  interval_steps <- append(interval_steps, sum(interval$steps))
}

plot(interval_steps, type="l")