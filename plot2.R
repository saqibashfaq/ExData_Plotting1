plot2<-function()
{
  #read and prepare the data from the current working directory.
  options(warn=-1)
  print("loading the selected data for 1/2/2007 and 2/2/2007 only")
  inputdata<-fread('household_power_consumption.txt',na.strings="?")[Date=='1/2/2007'|Date=='2/2/2007' ]
  Date_Time<-strptime(paste(inputdata$Date,inputdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
  inputdata<-cbind(inputdata,data.frame(Date_Time))
  print("data load is completed. New field Date_Time added to the data frame")
  print("Setting up png device for the graph printing...")
  png(filename = "plot2.png",
      width = 480, height = 480)
  #hist(as.numeric(inputdata$Global_active_power), main="Global Active Power", xlab="Global Active Power(kilowatts)",ylab="Frequency", col="red")
  plot(x=inputdata$Date_Time,y=inputdata$Global_active_power, type="l",ylab="Gobal Active Power(Killowatts)",xlab="",main="")
  dev.off()
  print("The Printing is completed. Device Turned off...")
  return (inputdata)
}