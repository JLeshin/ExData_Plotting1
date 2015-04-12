
B<-read.table('Insert Local File Extension For Electric Power Consumption Here',sep=";")
B[,1]<-as.character(B[,1])
M<-B[B$V1=='1/2/2007'| B$V1=='2/2/2007',]
b<-sapply(B[1,c(1:9)],as.character)
colnames(M)<-b
png(file='plot1.png')
with(M, hist(as.numeric(as.character(Global_active_power)), col='red',main='Global Active Power',
             xlab='Global Active Power (kilowatts)'))
dev.off()