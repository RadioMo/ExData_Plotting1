    
      # load data, partial dataset
      # Feb 1 starts at row 66638
      # Feb 2 ends at row 69518
      # Read in 2880 lines started at row 66638
      
      # read in col names
      mydata_cols = read.table("household_power_consumption.txt",sep=";",
                          header=TRUE, nrows=1)[1,]
      
      # read in data
      
      mydata = read.table("household_power_consumption.txt",sep=";",
                          header=FALSE, skip=66637,na.strings="?",nrows=2880)
      
      # set colnames of data to literate variable names
      colnames(mydata) <- colnames(mydata_cols)
      
      # convert date field into Date class
      #mydata$Date <- as.Date(mydata$Date,format="%d/%m/%Y")
      
      # combine date and time into a single field
      mydata$Date_Time <- paste(as.Date(mydata$Date,format="%d/%m/%Y"),mydata$Time,sep=" ")
      
      # convert into a time format
      mydata$Date_Time <- strptime(mydata$Date_Time,format="%Y-%m-%d %H:%M:%S")
          
      # Plot 3
      # open graphics device 
      png("plot3.png",width = 480, height = 480, units = "px") 
      
      # create plot 3
      mydate <- mydata$Date_Time
      sub1 <- mydata$Sub_metering_1
      sub2 <- mydata$Sub_metering_2
      sub3 <- mydata$Sub_metering_3
      plot(mydate,sub1,type="n",xlab="",ylab="Energy sub metering")
      lines(mydate,sub1,col="black")
      lines(mydate,sub2,col="red")
      lines(mydate,sub3,col="blue")
      legend(x="topright",y=NULL,
             c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
             lwd = c(2.5,2.5,2.5),col=c("black","red","blue"))
      
      # close device
      dev.off()
     