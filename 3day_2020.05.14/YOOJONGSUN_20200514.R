#
# 유종선 / 20200514
#

# 문1)

# >score
#           m  f
#     [1,] 10 21
#     [2,] 40 60
#     [3,] 60 70
#     [4,] 20 30

# 1. 위와 같은 내용의 matrix score를 생성
# 방법 1
score <- matrix( c( 10, 21,
                    40, 60,
                    60, 70,
                    20, 30 ), nrow = 4, ncol = 2, byrow = T )
score

# 방법 2
score <- matrix( c( 10, 21,
                    40, 60,
                    60, 70,
                    20, 30 ), 4, 2, byrow = T )
score

# 방법 3
score <- matrix( c( 10, 40,
                    60, 20,
                    21, 60,
                    70, 30 ), nrow = 4, ncol = 2 )
score

# 방법 4

score <- array( c( 10, 40,
                   60, 20,
                   21, 60,
                   70, 30 ), dim = c( 4, 2 ) )
score

# 방법 5
score <- matrix( c( 10, 40,
                    60, 20,
                    21, 60,
                    70, 30 ), 4, 2 )
score


# 2. score의 열 이름을 각각 male, female로 바꾸시오
colnames( score ) <- c( 'Male', 'Female' )   # 열이름
score

# 3. 2행에 있는 모든 값을 출력
score[ 2, ]

# 4. female의 모든 값을 출력
score[ , 2 ]
score[ , c( 2 ) ]

# 5. 3행 2열의 값을 출력
score[ 3, 2 ]
score[ 3, c( 2 ) ]


# 문2) R에서 제공하는 state.x77 데이터셋을 이용하여 작성

# 1. state.x77을 변환하여 st에 data frame으로 작성
st <- data.frame( state.x77 )
class( st )    #  data.frame( state.x77 ) 즉, st의 자료 유형 파악 (matrix -> data frame)
str( st )      #  data.frame( state.x77 ) 즉, st의 자료 유형 파악 (matrix -> data frame) / data frame 구성 파악
dim( st )      #  data.frame( state.x77 ) 즉, st의 자료 유형 파악 (matrix -> data frame) / 행과 열의 갯수 파악
 
# 2. st의 내용을 출력
st

# 3. st의 열 이름 출력
colnames( st )
names( st )

# 4. st의 행 이름 출력
row.names( st )
rownames( st )

# 5. st의 행의 개수와 열의 개수 출력
dim( st )
nrow( st ); ncol( st )

# 6. st의 요약 정보 출력
str( st )
summary( st )
# 각 variable에 대한 요약된 데이터 정보 보기
# variable이 수치 데이터의 경우 min, 1Q, median, mean, 3Q, max, NA의 개수 등의 정보 출력

# 7. st의 행별 합계와 평균 출력
rowSums( st )               # 행별 합계 (rowSums 함수 사용)
rowMeans( st )              # 행별 평균 (rowMeans 함수 사용)
apply( st[ , ], 1, sum )    # 행별 합계 (apply 함수 사용)
apply( st[ , ], 1, mean )   # 행별 평균 (apply 함수 사용)

# 8. st의 열별 합계와 평균 출력
colSums( st )               # 열별 합계 (colSums 함수 사용)
colMeans( st )              # 열별 합계 (colMeans 함수 사용)
apply( st[ , ], 2, sum )    # 행별 합계 (apply 함수 사용)
apply( st[ , ], 2, mean )   # 행별 평균 (apply 함수 사용)

#  9. Florida 주의 모든 정보 출력
subset( st )[ 9, ]
subset( st )[ c( 9 ), ]

# 10. 50개 주의 수입(Income) 정보만 출력
subset( st )[ , 2 ]
subset( st )[ , c( 2 ) ]

# 11. Texas 주의 면적(Area)을 출력
subset( st )[ 43, 8 ]
subset( st )[ c( 43 ), c( 8 ) ]

# 12. Ohio 주의 인구(Population)와 수입(Income) 출력
subset( st )[ 'Ohio', c( 'Population', 'Income' ) ]
subset( st )[ 35, 1:2 ]
subset( st )[ c( 35 ), c( 1, 2 ) ]

# 13. 인구가 5,000 이상인 주의 데이터만 출력
subset( st, Population >= 5000 )[ , 1 ]
subset( st, Population >= 5000 )[ , c( 1 ) ]

# 14. 수입이 4,500 이상인 주의 인구, 수입, 면적을 출력
subset( st, Income >= 4500 )[ , c(1, 2, 8) ]

# 15. 수입이 4,500 이상인 주는 몇 개인지 출력
nrow( subset( st, Income >= 4500 ) )

# 16. 전체 면적(Area)이 100,000 이상이고, 결빙일수(Frost)가 120 이상인 주의 정보 출력
subset( st, Area >= 100000 & Frost >=120 )

# 17. 인구(Population)가 2,000 미만이고, 범죄율(Murder)이 12미만인 주의 정보 출력
subset( st, Population < 2000 & Murder < 12 )

# 18. 문맹률(Illiteracy)이 2.0 이상인 주의 평균 수입은 얼마인지 출력
mean( subset( st, Illiteracy >= 2.0 )[ , 2 ] )

# 19. 문맹률(Illiteracy)이 2.0 미만인 주와 2.0 이상인 주의 평균 수입의 차이 출력
mean( subset( st, Illiteracy < 2.0 )[ , 2 ] ) - mean( subset( st, Illiteracy >= 2.0 )[ , 2 ] )

# 20. 기대수명(Life Exp)이 가장 높은 주는 어디인지 출력
subset( st, Life.Exp == 73.6 )  #하다하다 안되서 데이터 보고 직접 수치를 넣어 작성함...

# 21. Pennsylvania 주보다 수입(Income)이 높은 주들 출력
# 잘 모르겠습니다.


# 문3) R에서 제공하는 mtcars 데이터셋은 자동차 모델에 대한 제원 정보를 담고 있다.
data( mtcars )

# 1. 이 데이터셋의 자료구조 출력
class( mtcars )

# 2. 이 데이터셋의 행의 개수와 열의 개수 출력
dim( mtcars )

# 3. 이 데이터셋 열들의 자료형 출력
subset( mtcars )

# 4. 연비(mpg)가 가장 좋은 자동차 모델 출력
# 잘 모르겠습니다.

# 5. gear가 4인 자동차 모델 중 연비가 가장 낮은 모델 출력
# 잘 모르겠습니다.

# 6. Honda Civic의 연비(mpg)와 gear 수 출력
mtcars[ 'Honda Civic', c( 1, 10 ) ]

# 7. Pontiac Firebird 보다 연비가 좋은 자동차 모델 출력
# 잘 모르겠습니다.

# 8. 자동차 모델들의 평균 연비 출력
mean( mtcars[ , 1 ] )

# 9. gear의 수 종류 출력
mtcars[ , 10 ]              # gear열(변수)의 전체 데이터 출력
unique( mtcars[ , 10 ] )    # gear열(변수)의 중복데이터를 제외한 데이터 출력
