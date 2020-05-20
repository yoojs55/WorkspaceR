# 
# 7일차
# 0. Open
# 1. Review
# 2. Topic
#   2.1 데이터 전처리 이해
#   2.2 결측치 처리
#   2.3 특이값 처리
#   2.4 데이터 가공
# 3. Q & A
# 4. Next
# 5. close



# 1. Review


# 2. Topic

# 2.1 데이터 전처리 이해
#
# 데이터 전처리( data preprocessing )
#   - 초기에 확보한 데이터를 정제하고 가공해서 분석에 적합한(=용이한) 데이터를 확보하는 과정
#
# 데이터 전처리는 전체 분석과정 중에서 매우 오랜 시간을 소요되기 때문에 이를 효과적으로
# 처리하는 방법을 알고 적용하는 것이 중요

# 데이터 전처리 내용
#   - 결측치 처리 : 값이 없는 경우 (= NA)
#   - 특이값 처리 : 값은 있으나 값이 문제에 맞지 않는 경우
#   - 데이터 가공 : raw data에는 없는 내용을 추가, 변형

# 2.2 결측값 처리
#
# 결측치(= 결측값, missing value)
#   - 데이터를 수집하고 저장하는 과정에서 저장할 값을 얻지 못하는 경우 발생
#   - R에서는 NA로 표기
# 

# 결측치 종류 
#   1. 완전 무작위 결측(MCAR, missing completely at random)
#      : 어떤 변수 상에 결측치가 관측된 또는 관측되지 않은 다른 변수와 아무 연관이 없는 경우
#   2. 무작위 결측( MAR, missing at random)
#      : 어떤 변수 상에 결측치가 관측된 다른 변수와 연관되어 있지만 그자체의 비관측된 값들과는
#       연관이 없는 경우
#   3. 비 무작위 결측(NMAR, not missing at missing)
#      : 어떤 변수의 결측치가 완전 무작위 결측, 무작위 결측이 아니라며, 비 무작위 결측에 해당
# ** 대부분 1~2번이 대부분이며, 3번'은 처리하기가 애매해 진다.

# 결측치 처리 방법
#   1. 결측치를 제거하거나 제외한 다음 데이터를 분석 한다.
#   2. 결측치를 추정 적당한 값으로 치환 후 데이터를 분석한다.
#   3. 시뮬레이션을 사용한 다중대체 방법 
#      - 다중대체( MI, Multiple Imputation) => 많이 복잡하다.(본 강의에서 학습 X )
#         : 결측치에 대한 반복 시뮬레이션에 기반한 접근법
#         : 복잡한 결측치 문제를 다루는데 사용하는 방법
# ** 대부분  1번 방법을 사용 / 최근 3번 방법은 실무에서 많이 사용함


# 벡터(vector)에 대한 결측치 처리
#
# R에서는 결측치를 NA로 표기
# NA는 숫자형, 문자형, 논리형, 값 어디에나 결측치를 나타내는 용도로 사용
#
# 결측치 특성과 존재 여부 확인
z <- c( 1, 2, 3, NA, 5, NA, 8 )
sum( z )                       # data에 NA가 한 개라도 존재하면 연산이 되지 않는다.
is.na( z )                     # NA 여부 확인
sum( is.na( z ) )              # NA 갯수 확인
sum( z, na.rm = TRUE )         # NA를 제외한 합계 계산

# 결측치 대체 제거 및 제거
z1 <- c( 1, 2, 3, NA, NA, 8 )
z2 <- c( 5, 8, 1, NA, 3, NA, 7 )
z1[ is.na( z1 ) ] <- 0             # NA를 0으로 대체
z1

z3 <- as.vector( na.omit( z2 ) )   # NA를 제거하고 새로운 vector 생성
z3                                 # na.omit( z2 )함수 확인


#
# 매트릭스와 데이터프레임 결측치 처리
#
x <- iris
x[ 1, 2 ] <- NA
x[ 1, 3 ] <- NA
x[ 2, 3 ] <- NA
x[ 3, 4 ] <- NA
head( x )

# 데이터프레임 결측치 확인
#
# data frame 열(column)의 결측치 확인
# for문 이용
for( i in 1:ncol( x ) ) {               # 방법 1
    this.na <- is.na( x[ i ] )
    cat( colnames( x )[ i ], '\t', sum( this.na ), '\n' )
}

# apply( ) 함수 이용
col_na <- function( y ) {
    return( sum( is.na( y ) ) )
}

na.count <- apply( x, 2, FUN = col_na ) # 방법 2  
na.count                                # apply( x, 2, col_na ) 동일 결과 출력 / apply( 데이터명, 방향(1,2), 적용할 함수... )

rm(col_na)

# data frame 행(row)의 결측치 확인
rowSums( is.na( x ) )              # 관측치별 NA 개수
sum( rowSums( is.na( x ) ) > 0 )   # NA가 포함된 관측치 개수
sum( is.na( x ) )                  # data set 전체에서의 NA 개수

mean( is.na( x ) )       # 결측치의 비중
mean( is.na( iris ) )


# 결측치 처리를 위해 사용하는 외부 패키지
install.packages( "mice" )
library( mice )

result <- md.pattern( x ) # 결측치 처리를 위한 '결측치' 유형 및 확인 함수
result
# 0은 결측치 / 1은 미결측치

write.csv( result, "md_iris.csv", row.names = T )  # 분석 결과를 파일로 저장하는 방법
md.pattern( iris )
md.pattern( x )

# 결측치 탐색을 위한 상관관계 분석
result.cor <- as.data.frame( abs( is.na( x ) ) )
result.cor
result.cor.final <- result.cor[ which( apply( result.cor, 2, sum ) > 0 ) ]
cor( result.cor.final )     
# 결측치가 있는 변수들에 대한 상관관계 분석
# 결측치를 처리할때 상관분석을 해본 후 결정


#결측치를 가진 변수와 모든 변수와의 상관관계 분석
result.cor.full <- cor( result.cor,
                        result.cor.final,
                        use = 'pairwise.complete.obs') 
result.cor.full
# use = 'pairwise.complete.obs' 기법 지정(아래 url 참조)
# http://bwlewis.github.io/covar/missing.html


# data frame의 결측치 제거
#   - complete.cases( ) : data set에서 NA를 포함하지 않은 완전한(complete) 행을 찾는 함수
head( x )
x[ !complete.cases( x ), ]
y <- x[ complete.cases( x ), ]
head( y )

# * 결측치가 많은 data set인 경우, 결측치가 포하된 관측치(=row)을 모두 제거해 버리면 실제로 남아 있는 관측치(=row)가 별로 
#   없을 수 있으므로 분석이 어려운 경우가 생긴다.

# * 위와 같은 경우, 만약 결측치가 특정 변수(열)에 모여있다면 해당 변수(=column)만 제거한 후 분석하는 것도 하나의 방법이다.

# * 결측치가 여러 변수(column)에 흩어져 있는 경우에는 결측치를 적당한 값으로 추정하여 대체한 후 분석할 수 있다.
#   - 결측치를 추정값으로 대체하여 분성할 경우, 분석의 신뢰도가 떨어질수 있으나, 아무런 분석을 못하는것 보다 나은 방법이 될 수 있다.


# 2.3 특이값 처리
#
# 특이값( outlier, 이상치 ) : 정상적이라고 생각되는 데이터의 분포 범위 밖에 위치하는 값들, 입력 오류나 실제 특이값일수도 있다.
#                             특이값의 성질은 제조공정의 불량품 선별, 은행 거래 시스템의 사기 거래 탐지할 때 사용되기도 한다.
#
# 데이터 분석시 특이값을 포함한 채 편균 등의 계산을 하면 전체 데이터 양상 파악에 왜곡을 가져올 수 있으므로 분석시 제외하는 경우가 많다.
#
# data set에 특이값이 포함되어 있는지 여부 조사 방법
#  1. 논리적으로 있을 수 없는 값이 있는지 찾는다. 특별한 방법이 없기 때문에 분석자가 각 변수의 특성을 이해한 후 특이값 탐색
#  2. 상식을 벗어난 값이 있는지 찾는다.
#  3. 상자 그래프를 통해 찾는다.


# 특이값 찾기

# 상자그래프를 이용한 특이값 찾기
st <- data.frame( state.x77 )
boxplot( st$Income )
boxplot.stats( st$Income )$out

# 특이값의 처리 - 특이값 포함 관측치(=row) 제거 
#
# 일반적으로 특이값 포함 관측치(=row) 제거는 특이값을 NA로 바꾸고, NA를 포함한 행을 제거하는 방식으로 진행
#

out.val <- boxplot.stats( st$Income )$out     # 특이값 검출
st$Income[ st$Income %in% out.val] <- NA      # NA로 대체 ( %in% -> 벡터에서 포함 데이터 검색하라!)
head( st )

newdata <- st[ complete.cases( st ), ]        # NA 포함행 제거
head( newdata )














