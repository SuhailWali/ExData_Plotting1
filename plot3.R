## Assignment Coursera Course Exploratory Data Analysis - Week1 
## Part 3 - Construct a line plot of Energy sub-metering over the two days of february 2007


# set working dorectory
setwd("/media/suhail/A2E44376E4434BAB/R/courseradata")



#read the data
power <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE,na.strings="?",header=TRUE)

#subset to the required data
power_subset <- power[power$Date %in% c("1/2/2007","2/2/2007"),]


#convert date and time fields to date and time classes 
power_subset$Datetime <- strptime(paste(power_subset$Date,power_subset$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")

# plot3 - Energy submetering for the two days of february 2007

# open a png file in the working directory
png(file="plot3.png")

#Create the plot and send it to the png file
with(power_subset , plot(Datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(power_subset , lines(Datetime,Sub_metering_2,type="l",col="red"))
with(power_subset , lines(Datetime,Sub_metering_3,type="l",col="blue"))
legend("topright", lty=c(1,1,1),  pch=c(NA,NA,NA), col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
