## Assignment Coursera Course Exploratory Data Analysis - Week1 
## Part 1 - Construct a histogram of Global active Power comsumption over the first two days 
## of February 2007


# set working dorectory
setwd("/media/suhail/A2E44376E4434BAB/R/courseradata")



#read the data
power <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE,na.strings="?",header=TRUE)

#subset to the required data
power_subset <- power[power$Date %in% c("1/2/2007","2/2/2007"),]


#convert date and time fields to date and time classes 
power_subset$Datetime <- strptime(paste(power_subset$Date,power_subset$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S")

# plot1 - Global active power frequency

# open a png file in the working directory
png(file="plot1.png")

#Create the plot and send it to the png file
hist(power_subset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=range(0:1200, 200))

dev.off()
