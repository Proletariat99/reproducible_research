Reproducible Research - Peer Assignment 1
========================================================

Reading and Cleaning Data
---------
This code grabs the file and gets rid of incomplete records (i.e. records with any N/A values)


```r
setwd("~/Google Drive/dev/R/coursera/reproducible_research/")
activity_filename <- "./data/activity.csv"
act <- read.csv(activity_filename)
act2 <- act[complete.cases(act), ]
act3 <- split(act2, act2$date, drop = TRUE)
head(act2)
```

```
##     steps       date interval
## 289     0 2012-10-02        0
## 290     0 2012-10-02        5
## 291     0 2012-10-02       10
## 292     0 2012-10-02       15
## 293     0 2012-10-02       20
## 294     0 2012-10-02       25
```


Daily Mean
------------
This code calculates the mean # of steps taken per day by taking the split data sets and looping over them to sum the steps per day and then append to a list, then take the mean & median of the list



```r
daily_steps <- vector()
for (date in act3) {
    daily_steps <- append(daily_steps, as.numeric(sum(date$steps)))
}
myhist <- hist(daily_steps)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

```r
daily_mean <- mean(daily_steps)
daily_median <- median(daily_steps)
print(paste("mean steps daily is ", as.character(daily_mean)))
```

```
## [1] "mean steps daily is  10766.1886792453"
```

```r
print(paste("median of daily steps is ", as.character(daily_median)))
```

```
## [1] "median of daily steps is  10765"
```

Interval Steps
------------
And now we're apparently plotting the total number of steps across all days by interval:

```r
act4 <- split(act2, act2$interval, drop = TRUE)

interval_steps <- vector()
for (interval in act4) {
    interval_steps <- append(interval_steps, sum(interval$steps))
}

plot(interval_steps, type = "l")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

```r

print(paste("The interval with the most steps is interval #", as.character(which.max(interval_steps))))
```

```
## [1] "The interval with the most steps is interval # 104"
```


Inputing Missing Values
-----------------
Calculating the total # of complete cases - the total # of cases:

```r
total_count <- length(act$date)
temp <- act[complete.cases(act), ]
complete_count <- length(temp$date)
no_of_na <- total_count - complete_count
print(no_of_na)
```

```
## [1] 2304
```




