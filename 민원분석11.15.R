############################################3
install.packages("rJava")

Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jdk1.8.0_102")

install.packages(c('hash','tau','Sejong','RSQLite','devtools','bit','rex','lazyeval',
                   'htmlwidgets','crosstalk','promises','later','sessioninfo','xopen',
                   'bit64','blob','DBI','memoise','plogr','covr','DT','rcmcheck','rversions'),
                 type = 'binary')

install.packages("Sejong")
install.packages('KoNLP')
library(KoNLP)
useNIADic()

z<-extractNoun('관리비를 10월 30일 까지 아래 계좌로 입금해 주시길 바랍니다.');z
z
######################################################
#데이터 세팅

setwd('c:/data')

df<-read.csv('민원1212.csv')

##1
a<-extractNoun(as.vector(df[,1]))
words_1<-unlist(a)
wordcount_1<-table(words_1)
wordcount_1

##2
b<-extractNoun(as.vector(df[,2]))
words_2<-unlist(b)
wordcount_2<-table(words_2)
x<-data.frame(wordcount_2)
