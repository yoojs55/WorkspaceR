#
# 유종선 / 20200518
#

# 문1) 
# 어떤 학급의 성별이 다음과 같을 때 주어진 문제를 해결하기 위한 R 코드를 작성하시오.

# F F F M M F F F M M

# 1. 위의 자료를 gender 벡터에 저장하시오.
gender <- c( 'F', 'F', 'F', 'M', 'M', 'F', 'F', 'F', 'M', 'M' )

# 2. gender에 있는 값들에 대해 도수분포표를 작성하여 출력하시오.
table( gender )  # 빈도수 계산 함수

# 3. gender에 있는 값들에 대해 막대그래프를 작성하여 출력하시오.
barplot( table( gender ), main = '남/여 구성',
         xlab = 'gender', ylab = 'freq',
         col = colors )

# 4. gender에 있는 값들에 대해 원그래프를 작성하여 출력하시오.
pie( table( gender ), main = '남/여 구성',
     col = colors )


# 문2)
# 좋아하는 계절에 대한 조사 결과가 다음과 같을 때 주어진 문제를 해결하기 위한 R 코드를 작성하시오.

# 여름 겨울 봄 가을 여름 가을 겨울 여름 여름 가을

# 1. 위의 자료를 season 벡터에 저장하시오.
season <- c( '여름', '겨울', '봄', '가을', '여름', '가을', '겨울', '여름', '여름', '가을' )
    
# 2. season에 있는 값들에 대해 도수분포표를 작성하여 출력하시오.
table( season )

# 3. season에 있는 값들에 대해 막대그래프를 작성하여 출력하시오.
barplot( table( season ), main = 'favorite season',
         xlab = 'season', ylab = 'freq',
         col = colors )

# 4. season에 있는 값들에 대해 원그래프를 작성하여 출력하시오.
pie( table( season ), main = 'favorite season',
     col = colors )

# 문3)
# 학생 A의 과목별 성적이 다음과 같을 때 각 문제를 해결하기 위한 R 코드를 작성하시오.

# KOR  ENG ATH HIST SOC MUSIC BIO EARTH PHY ART
#  90 	85 	73 	80 	 85  65    78  50    68  96

# 1. 위 데이터를 score 벡터에 저장하시오(과목명은 데이터 이름으로 저장).
score <- c( 90, 85, 73, 80, 85, 65, 78, 50, 68, 96 )
score
names( score ) <- c( 'KOR', 'ENG', 'ATH', 'HIST', 'SOC', 'MUSIC', 'BIO', 'EARTH', 'PHY', 'ART' )
names( score )


# 2. score 벡터의 내용을 출력하시오.
score

# 3. 전체 성적의 평균과 중앙값을 각각 구하시오.
mean( score )
median( score )

# 4. 전체 성적의 표준편차를 출력하시오.
sd( score )

# 5. 가장 성적이 높은 과목의 이름을 출력하시오.
names( score[ score == max(score) ] )                      # 방법 1

which( score == max( score ) )                             # 방법 2

df_sc <- data.frame( score )                               # (틀린 방법)
df_sc
rownames( subset( df_sc, score == max( df_sc$score ) ) )

max.score <- max( df_sc$score )                            # (틀린 방법)
rownames( subset( df_sc, score == max.score ) )

# 6. 성적에 대한 상자그림을 작성하고, 이상치에 해당하는 과목이 있으면 출력하시오.
boxplot( score, main = '과목별 점수' )
boxplot.stats( score )$out

# 7. 다음 조건을 만족하는 위 성적에 대한 히스토그램을 작성하시오.
#    (그래프 제목: 학생 성적, 막대의 색: 보라색)
hist( score, main = '학생 성적',
      xlab = 'score', ylab = 'freq',
      col = 'purple' )

# 문4)
# R에서 제공하는 mtcars 데이터셋에 대해 다음 문제를 해결하기 위한 R코드를 작성하시오.
data( mtcars )
class( mtcars )
View( mtcars )
# 1. 중량(wt)의 평균값, 중앙값, 절사평균값(절사범위: 15%), 표준편차를 각각 구하시오.
mean( mtcars$wt )
median( mtcars$wt )
mean( mtcars$wt, trim = 0.15 )   
sd( mtcars$wt )

# 2. 중량(wt)에 대해 summary( ) 함수의 적용 결과를 출력하시오.
summary( mtcars$wt )

# 3. 실린더수(cyl)에 대해 도수분포표를 출력하시오.
table( mtcars$cyl )

# 4. 앞에서 구한 도수분포표를 막대그래프로 출력하시오.
barplot( table( mtcars$cyl ), main = 'Cylinder configuration',
         xlab = 'Cylinder', ylab = 'freq',
         col = colors )

# 5. 중량(wt)의 히스토그램을 출력하시오.
hist( mtcars$wt, main = 'Type of weight',
      xlab = 'weight', ylab = 'freq',
      col = colors )

# 6. 중량(wt)에 대해 상자그림을 출력하시오.
#    (단, 상자그림으로부터 관찰할 수 있는정보를 함께 출력하시오.)
boxplot( mtcars$wt )               # 방법 1       
boxplot.stats( mtcars$wt )

boxplot( mtcars$wt ) 
boxplot.stats( mtcars$wt )$stats   # 방법 2
boxplot.stats( mtcars$wt )$n
boxplot.stats( mtcars$wt )$conf
boxplot.stats( mtcars$wt )$out

# 7. 배기량(disp)에 대한 상자그림을 출력하시오.
#    (단, 상자그림으로부터 관찰할 수 있는 정보를 함께 출력하시오.)
boxplot( mtcars$disp )               # 방법 1
boxplot.stats( mtcars$disp )   

boxplot( mtcars$disp )               # 방법 2
boxplot.stats( mtcars$disp )$stats   
boxplot.stats( mtcars$disp )$n
boxplot.stats( mtcars$disp )$conf
boxplot.stats( mtcars$disp )$out

# 8. 기어수(gear)를 그룹 정보로 하여 연비(mpg) 자료에 대해 상자그림을 작성작성하고,
#    각 그룹의 상자그림을 비교하여 관찰할 수 있는 것이 무엇인지 나타내시오.
boxplot( mpg~gear,
         data = mtcars,
         main = 'gear per mpg')
# 기어가 낮을 수록 연비가 좋고 기어가 높을수록 연비가 가장 낮을 것으로 예상했으나, 
# 예상과 다르게 4단 일때가 가장 좋은 연비임을 알 수 있었고,
# 4단 기어 자동차 중에서도 연비가 좋은 차와 나쁜차의 폭이 큰 것을 알 수 있다.
# 4단 기어 자동차 다음으로 5단 기어, 3단기어 순으로 연비가 좋은 것을 알수 있으며,
# 자동차의 연비는 기어의 높고 낮음이 아니고 적정 기어 수 일 때,
# 최대의 연비(= 효율)을 발휘하는 것을 알 수 있다.