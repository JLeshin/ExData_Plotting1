

B<-read.table('Insert Local File Extension For Electric Power Consumption Here',sep=";")
B[,1]<-as.character(B[,1])
M<-B[B$V1=='1/2/2007'| B$V1=='2/2/2007',]
X<-M
X$Date<-as.character(X$Date)
x<-paste(X$Date,X$Time)
y<-strptime(x, "%Y-%m-%d %H:%M:%S")
m<-cbind(y,M[3:length(M)])
num<-as.numeric(as.character(m[,2]))

png(file="plot2.png")
plot(m$y,num,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()