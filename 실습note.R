R.version
install.packages('forecast')
install.packages('TSA')

library(forecast)
library(TSA)

#time series object
ts(1:10, frequency = 4, start=c(2021, 2)) 

dd <- matrix( c(1342, 1442, 1252, 1343, 	
                1425, 1362, 1256, 1272,
                1243, 1359, 1412, 1253,					
                1201, 1478, 1322, 1406,
                1254, 1289, 1497, 1208))
dd.ts <- ts(data=dd, start=c(2016, 1), frequency=4)
dd.ts


## 우연변동 시계열
random1 = matrix( c(1342, 1442, 1252, 1343, 	
                    1425, 1362, 1256, 1272,                  
                    1243, 1359, 1412, 1253,					
                    1201, 1478, 1322, 1406,
                    1254, 1289, 1497, 1208) )

random1.ts = ts(data=random1, start=c(2016, 1), frequency = 4)
random1.ts
plot(random1.ts, main = 'Random Variation Time Series')


## 계절변동 시계열 (seasonality 계절) 
season1.ts <- ts(data=season1 <- matrix(c(1142, 1242, 1452, 1543, 
                                          1125, 1262, 1456, 1572, 
                                          1143, 1269, 1462, 1553, 
                                          1121, 1258, 1472, 1546, 
                                          1154, 1249, 1477, 1548)), s=c(2016, 1), f=4)
season1.ts
plot(season1.ts, main = 'Seasonal Variation Time Series')

##
## 추세변동 시계열

trend1.ts <- ts(trend1 <- c(1142, 1242, 1252, 1343, 
                            1225, 1562, 1356, 1572, 
                            1343, 1459, 1412, 1453, 
                            1401, 1478, 1322, 1606, 
                            1554, 1589, 1597, 1408), c(2016, 1), f=4)
plot(trend1.ts, main = 'Trend Variation Time Series')


## 계절적 추세변동 시계열
st1.ts <- ts(data = st1 <- c(1142, 1242, 1452, 1543, 
                             1225, 1362, 1556, 1672, 
                             1343, 1459, 1662, 1753, 
                             1421, 1558, 1772, 1846, 
                             1554, 1649, 1877, 1948), c(2016, 1), f=4)
plot(st1.ts, main = 'Seasonal-Trend Variation Time Series')



par(mfrow = c(2,1))
plot(random1.ts, main = 'Random Variation Time Series')
plot(season1.ts, main = 'Seasonal Variation Time Series')
plot(trend1.ts, main = 'Trend Variation Time Series')
plot(st1.ts, main = 'Seasonal-Trend Variation Time Series')

#month plot
monthplot(random1.ts, main="EDA: Random Variation Series", xlab="Quarter: 2016-2020", ylab="Sales") # 분기별로 모은 값 
monthplot(trend1.ts, main="EDA: Trend Variation Series", xlab="Quarter: 2016-2020", ylab="Sales") # 횡으로 그려진 직선은 평균값



