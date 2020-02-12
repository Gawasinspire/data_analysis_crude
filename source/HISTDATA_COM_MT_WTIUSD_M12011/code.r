library(lubridate)
#data0<-read.csv("DAT_MT_WTIUSD_M1_2011.csv")

a=0
data1 = data0
some_date = data1$Date
data2<-data1[1:nrow(data1),]
length(data0)
some_date <- data2$Date
data2$date2 =day(as.POSIXlt(some_date,format="%Y.%m.%d"))
data2$date2
#write.csv(data2, file = "foo.csv", row.names = FALSE)
set.seed(12)
a=1
start_time <- Sys.time()

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
data2$days <- weekdays(anytime::anydate(data2$Date))
end_time <- Sys.time()
end_time - start_time

data3<- data2[41:nrow(data2),]
head(data3)
tail(data3)
library(dplyr)
#for(a in nrows(data3)/60){
#    data4[a]= data3[1*a:60*a,]
#}


typeof(data2$minutes)
write.csv(data3, file = "foo.csv", row.names = FALSE)
datas<-filter(data3, data3$working_day == "3")
qplot(datas$Time,datas$close,geom = "auto")

data6<-read.csv("foo.csv")
getwd()
setwd("/home/simple/data/git/data_analysis_crude/source/HISTDATA_COM_MT_WTIUSD_M12011/plots/")
library(ggplot2)  
library(dplyr)
#plot(datas$Time,datas$close,type="b")
start_time<-Sys.time()
for(i in 1:310){
n<-paste(i)  
datas<-filter(data6, data6$working_day == n) 
nam <- paste("day",i,".jpg",sep ="")
jpeg(nam)
plot(datas$Time,datas$close,type="b", main = mytitle)
dev.off()
}
end_time<-Sys.time()
print(end_time-start_time)

setwd("/home/simple/data/git/data_analysis_crude/source/HISTDATA_COM_MT_WTIUSD_M12011/")
