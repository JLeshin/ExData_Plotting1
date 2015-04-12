
B<-read.table('Insert Local File Extension For Electric Power Consumption Here',sep=";")
B[,1]<-as.character(B[,1])
M<-B[B$V1=='1/2/2007'| B$V1=='2/2/2007',]
X<-M
X$Date<-as.character(X$Date)
x<-paste(X$Date,X$Time)
y<-strptime(x, "%Y-%m-%d %H:%M:%S")
m<-cbind(y,M[3:length(M)])

png(file="plot3.png")
s1<-as.numeric(as.character(m[,6]))
s2<-as.numeric(as.character(m[,7]))
s3<-as.numeric(as.character(m[,8]))
plot(m$y,s1,xlab="",ylab="Energy sub metering",type="l",col="purple")
lines(m$y,s2,col='salmon')
lines(m$y,s3,col='blue')
legend('topright',col=c('purple','salmon','blue'),lty=c(1,1,1),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()