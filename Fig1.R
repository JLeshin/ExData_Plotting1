hist(as.numeric(as.character(M$Global_active_power)), col='red')

B<-read.table(,sep=";")
C<-B
C[,1]<-as.character(C[,1])
M<-C[C$V1=='1/2/2007'| C$V1=='2/2/2007',]
b<-sapply(B[1,c(1:9)],as.character)
colnames(M)<-b
#Figure1
with(M, hist(as.numeric(as.character(Global_active_power)), col='red',main='Global Active Power',
     xlab='Global Active Power (kilowatts)'))

M$Date<-dmy(M$Date)

#Figure2

> X<-M
> X$Date<-as.character(X$Date)
> x<-paste(X$Date,X$Time)
> y<-strptime(x, "%Y-%m-%d %H:%M:%S")
m<-cbind(y,M[3:length(M)])
num<-as.numeric(as.character(m[,2]))

png(file="plot2.png")
plot(m$y,num,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()

#Figure 3
png(file="plot3.png")
s1<-as.numeric(as.character(m[,6]))
s2<-as.numeric(as.character(m[,7]))
s3<-as.numeric(as.character(m[,8]))
plot(m$y,s1,xlab="",ylab="Energy sub metering",type="l",col="purple")
lines(m$y,s2,col='salmon')
lines(m$y,s3,col='blue')
legend('topright',col=c('purple','salmon','blue'),lty=c(1,1,1),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()

#Figure 4
png(file="plot4.png")
par(mfrow=c(2,2))
plot(m$y,num,xlab="",ylab="Global Active Power",type="l")
volt<-as.numeric(as.character(m$Voltage))
plot(m$y,volt,xlab="datetime",ylab="Voltage",type="l")
plot(m$y,s1,xlab="",ylab="Energy sub metering",type="l",col="purple")
lines(m$y,s2,col='salmon')
lines(m$y,s3,col='blue')
legend('topright',col=c('purple','salmon','blue'),lty=c(1,1,1),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
plot(m$y,GRP,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
