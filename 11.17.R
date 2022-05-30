setwd('c:/data')
df<-read.csv('충주시set.csv')

#주차환경만족도 상관관계
x<-cor(df$민원수,df$주차환경만족도,use='complete.obs',method='pearson')

#교통시설문제점주차장비율
y<-cor(df$민원수,df$교통시설문제점주자창비율,use='complete.obs',method='pearson')

#한세대당 주차장면적
z<-cor(df$민원수,df$X1인당주차장면적,use='complete.obs',method='pearson')

df1<-data.frame(c('주차환경만족도','교통시설문제점설문_주차장응답비율','한 세대당 주차장 면적'),
                c(x,y,z))

colnames(df1)<-c("변수","상관계수")

#상관계수 절대값의 합
f<-abs(x)+abs(y)+abs(z)

#각 가중치
f.x<-x/f
f.y<-y/f
f.z<-z/f
df1$가중치<-c(f.x,f.y,f.z)

#가중치를 곱한 각 변수 값
df$주차환경만족도.가중치<-df$주차환경만족도*f.x
df$교통시설문제점주자창비율.가중치<-df$교통시설문제점주자창비율*f.y
df$X1인당주차장면적.가중치<-df$X1인당주차장면적*f.z

#최종점수
df$score<-rowSums(df[,c(8:10)])

write.csv(df,"충주불법추자최종.csv")
df2<-df[,c('지역','score')]

