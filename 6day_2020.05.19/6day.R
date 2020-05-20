# 
# 6일차
# 0. Open
# 1. Review
# 2. Topic
#   2.1 다중변수 자료 탐색
#   2.2 상관분석
#   2.3 자료 탐색 실습(EDA)
# 3. Q & A
# 4. Next
# 5. close
# 

# 1. Review

# 2. 

# 2.1 다중변수 자료 탐색
#   - 다중변수(다변량) 자료는 변수가 2개 이상인 자료
#   - 다중변수 자료는 2차원 형태, matrix나, data frame에 저장하여 분석
#   - 다중변수 자료에서 변수는 열(column), 개별 관측값들이 행(row)fh rntjd
#
# 산점도(satter plot) : 2개의 변수로 구성된 자료의 분포를 알아보는
#                       그래프 관측값들의 분포를 2개의 변수 사이에
#                       관계를 파악할 수 있는 기법
#
#   - 산점도는 두 변수의 데이터 분포를 나타내는 것이기 때문에 두 개의 변수에 대한 자료가 필요
#   - 산점도는 관측값들의 분포를 보면서 두 변수 사이의 관련성을 확인하는게에 사용

str( mtcars )
wt <- mtcars$wt
wt
mpg <- mtcars$mpg
mpg


# 이변량 산점도 그리기

# plot( ) : 산점도 그리는 함수

# 방법1
plot( wt,                    # x축에 배치할 변수명 기입
      mpg,                   # y축에 배치할 변수명 기입
      main = 'wt-mpg graph',
      xlab = 'weight',
      ylab = 'mpg',
      col = 'red',
      pch = 20 )             # 'pch = 19' 모양을 결정 ( 1=원, 2=세모, 19=점 등 / 숫자 0~25번까지 있음 / help로 찾아 볼수 있음)

# 방법2
plot( mtcars$mpg,
      mtcars$wt,
      main = 'mpg-wt graph',
      xlab = 'mpg',
      ylab = 'weight',
      col = 'red',
      pch = 20 )

# 방법3
plot( mtcars[ , c( 'wt', 'mpg')],  # c( 'wt', 'mpg' ) => x축은 'wt', y축은 'mpg'
      main = 'mpg-wt graph',       # c( 'mpg', 'wt' ) => x축은 'mpg', y축은 'wt'
      xlab = 'mpg',
      ylab = 'weight',
      col = 'red',
      pch = 20 )

# 방법4
plot( mpg ~ wt,                    # 'mpg ~ wt' => x축은 'wt', y축은 'mpg'
      data = mtcars,               # 'data = mtcars' => 데이터 지정
      main = 'mpg-wt graph',       
      xlab = 'mpg',
      ylab = 'weight',
      col = 'red',
      pch = 20 )


# 다변량에 대한 산점도 : 다변량 = 변수 2개 이상
#   - pairs( )는 여러 개의 변수에 대해 짝지어진 산점도 작성
#   - 다중 산점도는 대각선을 기준으로 오른쪽 위의 산점도들과 왼쪽 아래의 산점도들이 대칭을 이룬다.
#     ( 동일한 산점도인데 x축과y축이 바뀌어 있다.)
#   - 다중 산점도는 여러 변수들 간의 추세를 한눈에 파악할 수 있다.

vars <- c( 'mpg', 'disp', 'drat', 'wt')
target <- mtcars[ , vars ]
head( target )

pairs( target, main = 'multi plot' )   # 방법 1

plot( target, main = 'multi plot1' )   # 방법 2


#   - 두 개의 변수에 대한 산점도를 작성할 때 그룹 정보를 알고 있다면 작성시, 각 그룹별 관측값에 대해
#     서로 다른색과 점의 모양으로 표시할 수 있다.
#   - 두 변수 간의 관계뿐만 아니라 그룹 간의 관계도 파악할 수 있다.
#
View( iris )
iris.2 <- iris[ , 3:4 ]
point <- as.numeric( iris$Species )
point

color <- c( 'black', 'green', 'gray' )   # 여기서 컬러 지정수는 iris$Species levels 수만큼 지정해 준다.

plot( iris.2,
      main = 'iris plot',
      pch = c( point ),
      col = color[ point ] )

# 2.2 상관분석
#   - 두 변수간의 관계를 분석시 추세의 모양이 선의 형태를 갖는 것을 선형적 관계라 표현한다.
#   - 선형적 관계는 강한 선형적 관계가 있고, 약한 선형적 관계가 있다.
#   - 상관분석(correlation analysis)
#      : 얼마나 선형성을 보이는지 수칙상으로 나타내는 방법
#   - 상관계수(correlation coefficient)는 선형성의 정도를 나타내는 척도
#   - 상관계수 r의 성질
#      : -1 <= r <=1
#      : r > 0 : 양의 상관계수(x가 증가하면, y도 증가한다.)
#      : r < 0 : 음의 상관관계(x가 증가하면, y는 감소한다.)
#      : r이 1이나 -1에 가까울수록 x, y의 상관성이 높다.
#
#   - 상관계수 값이 1이나 -1에 가까울수록 관측값들의 분포가 직선에 가까워진다.

beers <- c( 5, 2, 9, 8, 3, 7, 3, 5, 3, 5 )
bal <- c( 0.1, 0.03, 0.19, 0.12, 0.04, 0.0095, 0.07, 0.06, 0.02, 0.05 )

tbl <- data.frame( beers, bal )
tbl

plot( bal ~ beers ,
      data = tbl )

res <- lm( bal ~ beers,  # lm( ) : 회귀식의 a, b를 구해주는 함수( y = ax + b)
           data = tbl)

abline( res )            # 회귀선을 삽입하는 함수

cor( beers, bal )        # 상관계수를 구하는 함수

#-------------------------------------------------------------------
par( mfrow = c( 1, 2 ) )             # par( ) : 그래프를 나누어 출력하는 함수 => 그래프를 1 * 2로 출력하라.

plot( wt~mpg,
      data = mtcars,
      main = '중량-연비 그래프',
      xlab = '중량',
      ylab = '연비',
      col = 'red',
      pch = 20 )

res <- lm( wt~mpg, data = mtcars )  # lm( ) : 회귀식의 a, b를 구해주는 함수( y = ax + b)
abline( res )                       # 회귀선을 삽입하는 함수

plot( drat~wt,
      data = mtcars,
      main = '리어액슬기어비-중량 그래프',
      col = 'red',
      pch = 20 )

res <- lm( drat~wt, data = mtcars)
abline( res )
par( mfrow = c( 1, 1 ) )

cor( mtcars$wt, mtcars$mpg )
cor( mtcars$drat, mtcars$wt )
cor( iris[ , 1:4 ] )


# 시계열 자료( times series data ) : 시간의 변화에 따라 자료를 수집하는 경우
#                                    (ex. 연도별 매출액, 주식 등)
#
# 선그래프 : 다중변수 자료의 변수 중 하나가 연월일과 같이 시간을 나타내는 값을 갖는 경우
#            x축을 시간축으로 하여 시간의 변화에 따른 자료 증감추이를 확인할 때 사용

month <- 1:12
late <- c( 5, 8, 7, 9, 4, 6, 12, 13, 8, 6, 6, 12)

plot( month,                    # x data
      late,                     # y data
      main = '지각생 통계',     # 제목
      type = 'o',               # 그래프 종류 ( l, b, s, o 등)
      lty = 3,                  # 선의 종류
      lwd = 1,                  # 선의 굵기
      col = 'gray',             # 선 색 (선 색을 지정하지 않을시 변수를 입력안하면 됨)
      xlab = 'month',           # x축 레이블
      ylab = 'late cnt')        # y축 레이블
                     
             
month <- 1:12
late1 <- c( 5, 8, 7, 9, 4, 6, 12, 13, 8, 6, 6, 4)              
late2 <- c( 4, 6, 5, 8, 7, 8, 10, 11, 6, 5, 7, 3)

plot( month,                    # x data
      late,                     # y data
      main = '지각생 통계',     # 제목
      type = 'b',               # 그래프 종류 ( l, b, s, o 등)
      lty = 1,                  # 선의 종류
      lwd = 1,                  # 선의 굵기
      col = 'red',              # 선 색 (선 색을 지정하지 않을시 변수를 입력안하면 됨)
      ylim = c( 1, 15 ),        # y축의 데이터 수치 범위를 지정, (xlim( ) : 축의 데이터 수치 범위를 지정터 )
      xlab = 'month',           # x축 레이블
      ylab = 'Late cnt')        # y축 레이블

lines( month, late2, type = 'b', col = 'blue' )  # lines( ) : 기존 선그래프에 선을 추가 할 때 사용
## 지금 까지의 그래프 출력은 R의 기본 그래프 기능을 활용한 내용임
## 추후 ggplot패키지를 활용하여 조금 더 이쁜 그래프를 그려 보도록 할 것이다.
## ggplot은 입력해야 하는 인수값이 많다.(어려울 수 있다.)


# 2.3 자료 탐색 실습 (EDA)
#

#
# 1. 분석 대상 데이터셋 준비
#

# Boston Housing 데이터셋 활용
install.packages( 'mlbench' )        # R에서 제공하지 않는 data set을 제공하여 주는 패키지

library( mlbench )
data( "BostonHousing" )
myds <- BostonHousing[ , c( 'crim', 'rm', 'dis', 'tax', 'medv' ) ]

myds
class( myds )
dim( myds )
str( myds )
head( myds )
table( grp )

#
# 필요한 변수 추가 - 선택적으로 수행
#
# crim : 지역1인당 범죄율
# rm   : 주택 1가구당 방의 개수
# dis  : 보스턴 고용 센터 5개까지의 가중 거리
# tax  : USD 10,000당 완전 가치 재산세율
# medv : USD 1000의 자가 주택의 중간 값

grp <- c()
for( i in 1 : nrow( myds ) ){
   if( myds$medv[ i ] >= 25.0 ){
      grp[ i ] <- 'H'
   } else if( myds$medv[ i ] <= 17.0 ){
      grp[ i ] <- 'L'
   } else {
      grp[ i ] <- 'M'
   }
}

grp <- factor( grp )
grp <- factor( grp, levels = c( 'H', 'M', 'L' ) )

myds <- data.frame( myds, grp )
myds

#
# 3. data set 형태와 기본적인 내용 파악
#
# 4. 히스토그램을 이용한 관측값 분포 확인
par( mfrow = c( 2, 3 ) )
for ( i in 1:5) {
   hist( myds[ , i ], main = colnames( myds )[ i ], col = 'yellow' )
}
par( mfrow = c( 1, 1) )

#
# 5. 상자 그래프에 의한 관측값 분포 확인
#
par( mfrow = c( 2, 3 ) )
for ( i in 1:5){
   boxplot( myds[ , i ], main = colnames( myds )[ i ] )
}
par( mfrow = c( 1, 1 ) )

#
# 6. 그룹별 관측값 분포 확인
#
boxplot( myds$crim ~ myds$grp, main = "1인당 범죄율" )
boxplot( myds$rm ~ myds$grp, main = '방의 개수' )

#
# 7. 다중 산점도를 이용한 변수간 상관관계 확인
#
pairs( myds[ , -6] )


#
# 8. 그룹 정보를 포함한 변수 간 상관관계 확인
point <- as.integer( myds$grp )
color <- c( 'red', ' green', 'blue' )
pairs( myds[ , -6 ],
       pch = point,
       col = color[ point ] )

#
# 9. 변수간 상관 계수 확인
cor( myds[ , -6 ] )

## 실습
# '도로교통공단_시도_시군구별_월별_교통사고(2018)'을 이용한 EDA 실습
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

table( tra_ac[ , 1:3])

boxplot( tra_ac$'발생건수' ~ tra_ac$'월', main = '2018년 월별 사고 발생 건수' )


plot( tra_ac$'월',                    # x data
      tra_ac$'발생건수',                     # y data
      main = '월별 사고 발생 건수',     # 제목
      type = 'l',               # 그래프 종류 ( l, b, s, o 등)
      lty = 1,                  # 선의 종류
      lwd = 1,                  # 선의 굵기
      xlab = 'month',
      ylab = 'freq')




