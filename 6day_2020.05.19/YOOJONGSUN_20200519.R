#
# 유종선 / 20200519
#

# 문1)
# 다음은 직장인 10명의 수입과 교육받은 기간을 조사한 자료이다. 산점도와 상관계수를 구하고, 
# 수입과 교육기간 사이에 어떤 상관관계가 있는지 설명하시오.

# 수입 	   121 99 41 35 40 29 35 24 50 60
# 교육기간 19  20 16 16 18 12 14 12 16 17
income <- c( 121, 99, 41, 35, 40, 29, 35, 24, 50, 60 )
edu <- c( 19, 20, 16, 16, 18, 12, 14, 12, 16, 17)
in_edu <- data.frame( income, edu )
View( in_edu )

par( mfrow = c( 1, 2 ) )
boxplot( income, main = 'income' ); boxplot( edu, main = 'edu' )
par( mfrow = c( 1, 1 ) )

plot( edu ~ income,                 
      data = in_edu,                     
      main = 'income-edu graph',
      xlab = 'income',
      ylab = 'edu',
      col = 'black',
      pch = 19 )

res <- lm( edu ~ income,  # lm( ) : 회귀식의 a, b를 구해주는 함수( y = ax + b)
           data = in_edu)

abline( res )            # 회귀선을 삽입하는 함수

cor( edu, income )        # 상관계수를 구하는 함수
 
# 데이터의 이상치를 확인하기 위해 boxplot을 통하여 확인한 결과,
# '수입'의 data에서 이상치 2개가 발견 되었으며,
# '수입'과 '교육' 사이의 상관계수는 '0.7929108'의 강한 양의 상관 관계가 있음을 알 수 있다.
# 이는 교육기간이 많을수록 수입이 증가하는 결과를 알수 있다.



# 문2)
# 다음은 대학생 10명의 성적과 주당 TV 시청시간을 조사한 자료이다. 산점도와 상관계수를 구하고, 
# 성적과 TV 시청시간 사이에 어떤 상관관계가 있는지 설명하시오.

# 성적     77.5 60 50 95 55 85 72.5 80 92.5 87.5
# 시청시간 14   10 20  7 25  9 15   13  4   21

grade <- c( 77.5, 60, 50, 95, 55, 85, 72.5, 80, 92.5, 87.5 )
watch <- c( 14, 10, 20, 7, 25, 9, 15, 13, 4, 21)
g_w<- data.frame( grade, watch )
g_w
View( g_w )

par( mfrow = c( 1, 2 ) )
boxplot( grade, main = 'grade' ); boxplot( watch, main = 'watch' )
par( mfrow = c( 1, 1 ) )

plot( watch ~ grade,                 
      data = g_w,                     
      main = 'grade-watch graph',
      xlab = 'grade',
      ylab = 'watch',
      col = 'black',
      pch = 19 )

res1 <- lm( watch ~ grade,  # lm( ) : 회귀식의 a, b를 구해주는 함수( y = ax + b)
            data = g_w )

abline( res1 )               # 회귀선을 삽입하는 함수

cor( watch, grade )          # 상관계수를 구하는 함수

# 데이터의 이상치를 확인하기 위해 boxplot을 통하여 확인한 결과,
# 이상치의 데이터가 확인되지 않았으며,
# '성적'과 '시청시간' 사이의 상관계수는 '-0.6283671'의 음의 상관 관계가 있음을 알 수 있다.
# 이는 시청시간이 많을수록 성적이 감소하는 결과를 알 수 있다.


# 문3) 
# R에서 제공하는 mtcars 데이터셋에서 mpg와 다른 변수들 간의 상관계수를 구하시오.
# 어느 변수가 mpg와 가장 상관성이 높은지 산점도와 함께 설명하시오.
class( mtcars )
dim( mtcars )
View( mtcars )

cor( mtcars )
cor( mtcars )[ 'mpg', ]

plot( mtcars$wt ~ mtcars$mpg,                 
      data = mtcars,                     
      main = 'mpg-wt graph',
      xlab = 'wt',
      ylab = 'mpg',
      col = 'black',
      pch = 19 )

res2 <- lm( wt ~ mpg,  
            data = mtcars )

abline( res2 )
# cor( mtcars )[ 'mpg', ]를 통해 상관계수를 확인한 결과,
# wt와의 상관관계가 '-0.8676594'가장 상관관계임을 알수 있다.
# 이를 통하여, 무게가 증가함에 있어서 연비가 줄어드는 결과를 알 수 있다.


# 문4)
# 다음은 2015년부터 2026년도까지의 예상 인구수 추계자료이다. 연도를 x축으로 하여 선그래프를 작성하시오.

# 연도		총인구 (천명)		연도		총인구 (천명)
# 2015		51014		   		2021		52123
# 2016		51245			   	2022		52261
# 2017		51446			   	2023		52388
# 2018		51635		   		2024		52504
# 2019		51811			   	2025		52609
# 2020		51973			   	2026		52704

year <- 2015:2026
pop <- c( 51014, 51245, 51446, 51635, 51811, 51973, 52123, 52261, 52388, 52504, 52609, 52704 )

plot( year,                     # x data
      pop,                      # y data
      main = '예상 인구수',     # 제목
      type = 'b',               # 그래프 종류 ( l, b, s, o 등)
      lty = 1,                  # 선의 종류
      lwd = 3,                  # 선의 굵기
      col = 'red',              # 선 색 (선 색을 지정하지 않을시 변수를 입력안하면 됨)
      xlab = 'year',            # x축 레이블
      ylab = 'pop')             # y축 레이블

# 문5)
# 도로교통공단 시도 시군구별 월별 교통사고.csv 파일에 대한 EDA를 수행하시오

setwd( "D:\\R_work\\6day_2020.05.19")
tra_ac <- read.csv( '도로교통공단_시도_시군구별_월별_교통사고(2018).csv', header = T )    # header = T 면, 제목줄을 데이터로 활용하지 않는다.
tra_ac

class( tra_ac )
str( tra_ac )
dim( tra_ac )
View( tra_ac )

par( mfrow = c( 1, 2 ) )
boxplot( tra_ac$'발생건수' ~ tra_ac$'시도', main = "2018년 시도별 사고 발생 건수" )
boxplot( tra_ac$'발생건수' ~ tra_ac$'월', main = '2018년 월별 사고 발생 건수' )
par( mfrow = c( 1, 1 ) )

boxplot( tra_ac$발생건수~tra_ac$시군구, main = '2018년 시군구별 사고발생건수' )

pairs( tra_ac[ , c(4:9) ],
       pch = 20 )

cor( tra_ac[ , c(4:9) ] )

boxplot( tra_ac$'발생건수' ~ tra_ac$'월', main = '2018년 월별 사고 발생 건수' )

