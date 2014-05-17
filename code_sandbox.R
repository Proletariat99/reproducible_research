
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