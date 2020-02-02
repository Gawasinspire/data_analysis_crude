data0<-read.csv("DAT_MT_WTIUSD_M1_2011.csv")
data1 = data0
some_date = data1$Date
data1$date2 = month(as.POSIXlt(some_date,format="%Y.%m.%d"))
data2<-data1[1:nrow(data1),]
length(data0)
library(lubridate)
some_date <- data2$Date
data2$date2 =day(as.POSIXlt(some_date,format="%Y.%m.%d"))
data2$date2
#write.csv(data2, file = "foo.csv", row.names = FALSE)
set.seed(8)
a=1
for(i in 1:nrow(data2)){
#print(data1$date2[i])
  if(data2$date2[i] !=  data2$date2[i+1]){a=a+1}
  #print(data2$date2[i])
  #print(i)
  #print("a")
  data2$working_day[i]=a
  #print(a)
  
}
data2$minutes <- sapply(strsplit(as.character(data2$Time),":"), `[`, 2)

write.csv(data2, file = "foo.csv", row.names = FALSE)
data2$date2[11]
