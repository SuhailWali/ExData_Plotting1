## Assignment Coursera Course Exploratory Data Analysis - Week1 
## Part 2 - Construct a line plot of Global Active power consumption over the two days of february 2007


# set working dorectory
setwd("/media/suhail/A2E44376E4434BAB/R/courseradata")



#read the data
power <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE,na.strings="?",header=TRUE)

#subset to the required data
power_subset <- power[power$Date %in% c("1/2/2007","2/2/2007"),]


#convert date and time fields to date and time classes 
power_subset$Datetime <- strptime(paste(power_subset$Date,power_subset$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")

# plot2 - Global active power consumption over the two days of february 2007

# open a png file in the working directory
png(file="plot2.png")

#Create the plot and send it to the png file
plot(power_subset$Datetime,power_subset$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts")

dev.off()
