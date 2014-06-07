plot3<-function()
{
  #read and prepare the data from the current working directory.
  options(warn=-1)
  print("loading the selected data for 1/2/2007 and 2/2/2007 only")
  inputdata<-fread('household_power_consumption.txt',na.strings="?")[Date=='1/2/2007'|Date=='2/2/2007' ]
  Date_Time<-strptime(paste(inputdata$Date,inputdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
  inputdata<-cbind(inputdata,data.frame(Date_Time))
  print("data load is completed. New field Date_Time added to the data frame")
  print("Setting up png device for the graph printing...")
  png(filename = "plot3.png",
      width = 480, height = 480)
  plot(x=inputdata$Date_Time,y=inputdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
 lines(x=inputdata$Date_Time,y=inputdata$Sub_metering_1,col="black")
 lines(x=inputdata$Date_Time,y=inputdata$Sub_metering_2,col="red")
 lines(x=inputdata$Date_Time,y=inputdata$Sub_metering_3,col="blue")
 legend("topright",col = c("black","red","blue"),lty=1,legend=c("Sub_Metring_1","Sub_Metring_2","Sub_Metring_3"))
 dev.off()
 print("The Printing is completed. Device Turned off...")
  return (inputdata)
}