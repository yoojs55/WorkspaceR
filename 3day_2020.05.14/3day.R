#
# vector
#
v <- 1:10
v

v > 5
all( v > 5 )      # 벡터의 모든 요소가 조건에 만족하는가?
any( v > 5 )      # 벡터의 요소 중 조건에 만족하는게 있는가?

head( v )         # 처음부터 일정 개수 ( default : 6개 )
tail( v )         # 끝에서부터 일정개수 ( default : 6개 )
head( v, 3 )      # head( v, z )는 벡터( v )에서 처음부터 z 갯수만큼 출력
tail( v, 3 )      # tail( v, z )는 벡터( v )에서 끝에서부터 z 갯수만큼 출력

# 
# 집합( set ) ; 중복 데이터가 없는 벡터
# 교과서 66p 참조

x <- c( 1, 2, 3 )
y <- c( 3, 4, 5 )
z <- c( 3, 1, 2 )

union( x, y )        # 합집합
intersect( x, y )    # 교집합
setdiff( x, y )      # 차집합 
setdiff( y, x )      # 차집합
setequal( x, y )     # 동일한 요소가 있는가 확인 (교과서에 없는 함수)

#
# 2.1 List
#
# List : 동일 자료형, 다른 자료형을 저장할 수 있는 벡터
#
# list() : List 생성함수
#          요소는 key(이름) = value(값) 형식이다.
v <- c( 90, 85, 70 ,84 )
l <- list( name = 'hong', age = 30, status = TRUE, score = v )
l
l[ 1 ]
l[ 4 ]
l[[ 1 ]]
l[[ 4 ]][ 1 ] # 해석 : 벡터 l의 4번째 요소의 첫번째 값을 가져온다.
# [] => 해당 요소를 전부(key, value)가져옴 / [[]] => 해당 요소 중 값(value)만 가져옴

l$name
l$score
# 잘사용 하진 않는다.
# $ => 이름으로 접근할때 사용한다.



#
# 2.2 factor ( 범주형, categorical )
#
# factor형 : 문자의 형태로 저장되며 범위를 갖는 값을 저장하는 data type
# factor() : 팩터형 벡터 생성 함수
# 굉장히 자주 쓰인다.(실무에서 엑셀 / 문서 정리를 일정한 값형태로 작성하기 때문)
# 외부데이터를 불러올 때, R에서 주로 factor형 자료로 변환하여 준다.
# 
bt <- c( 'A', 'B', 'B', 'O', 'AB', 'A' )   #문자형 벡터
bt.factor <- factor( bt )

bt
bt.factor

gender <- c( '남', '여', '여', '남', '남', '여', '여', '남' )
gender.factor <- factor( gender )

gender
gender.factor

bt[ 3 ]
bt.factor[ 3 ]

gender[ 5 ]
gender.factor[ 5 ]

levels( bt.factor )
levels( gender.factor )

as.integer( bt.factor )
as.integer( gender.factor )

gender.factor[ 5 ]
gender.factor[ 5 ] <- '중' # 기존 data의 구성과 다른 값으 입력(수정)되지 않는다.
gender.factor
# warning (경고) : 감당 가능 / 무조건 발생하는 상황이 아님
# Error (에러) : 아주 피곤해진다...

#
# 2.3 matrix
#
# matrix( 행렬, 2차원 배열 ) : 동일 자료형의 데이터를 저장하는 벡터 집합
# row( 행 ), obsevation( 관측값 ), data
# column( 열 ), variable( 변수 )
#
matrix( 1:20, nrow = 4 )
z <- matrix( 1:20, nrow = 4 )   # 열(column) 부터 채웠기 때문에 = 열우선 방식
z                               # default 값 : 열 채움
class ( z )
str( z )
dim( z )                        # dim ( =Dimension ) : 차원 

z <- matrix( 1:20, nrow = 4, ncol = 5 )            # 열(column) 부터 채웠기 때문에 = 열우선 방식
z

z <- matrix( 1:20, nrow = 4, ncol = 5, byrow = T )  # 행(row) 부터 채웠기 때문에 = 행우선 방식 ( byrow = T 추가 )
z

x <- 1:4
y <- 5:8
z <- matrix( 1:20, nrow = 4, ncol = 5 )
z

m1 <- cbind( x, y )       # bind(=연결) / cbind = column(열) + bind(=연결) / x와 y의 인수를 변수로 봐야함
m1
m2 <- rbind( x, y )       # bind(=연결) / rbind = row(열) + bind(=연결) / x와 y의 인수를 관측치(=data)로 봐야함
m2

m3 <- rbind( m2, x )
m3

m4 <- cbind( z, x )
m4

#
# matrix에서 cell의 값 읽기
#
z[ 2, 3 ]             # 2행 3열 data 출력
z[ 1, 4 ]             # 1행 4열 data 출력
z[ 2, ]               # 2행 전체 data 출력
z[ 3, ]               # 3행 전체 data 출력
z[ , c( 1, 4)]        # 4행 전체 1, 4열 data 출력
z[ 2, 1:3 ]           # 2행의 1~3열 data 출력
z[ 2, c( 1, 2, 3 )]   # 2행의 1~3열 data 출력 ( 위 결과와 동일 )

#
# matrix 행/열에 이름 지정
#
score <- matrix( c( 90, 85, 69, 78, 
                    85, 96, 49, 95,
                    90, 80, 70, 70), nrow = 4, ncol = 3, byrow = T ) # 행(row) 부터 채웠기 때문에 = 행우선 방식 ( byrow = T 추가 )
score

######
score <- matrix( c( 90, 85, 69, 78, 
                    85, 96, 49, 95,
                    90, 80, 70, 70), nrow = 4, ncol = 3 )            # 열(column) 부터 채웠기 때문에 = 열우선 방식
score


rownames( score ) <- c( 'hong', 'kim', 'lee', 'yoo' )    # 행이름
colnames( score ) <- c( 'english', 'math', 'science ')   # 열이름
score

score[ 'hong', 'math']
score[ 'kim', c( 'math', 'science' ) ]
score[ 'lee',  ]
score[ , 'english' ]

rownames( score )
colnames( score )
colnames( score )[ 2 ]

c <- colnames( score )
c[ 2 ]


#
# 2.4 data frame
# data frame : matrix와 동일한 구조를 갖으며 자료형에 구애받지 않고 저장하는 matrix
#  *** 변수(column)의 data가 다를수도 있다.
# data.frame() : data frame을 생성하는 함수
#
city <- c('seoul', 'busan', 'deajeon' ) # 문자 벡터
rank <- c( 1, 2, 3 )
city.info <- data.frame( city, rank )   # 숫자 벡터
city.info

class( city.info )
str( city.info )   # 3 obs.(3행) of  2 variables(2열) 
dim( city.info )



name <- c( 'hong', 'kim', 'lee' )
age <- c( 22, 20, 25 )
gender <- factor( c( 'M', 'F', 'M' ) )
blood.type <- factor( c( 'A', 'O', 'B' ) )

person.info <- data.frame( name, age, gender, blood.type )
person.info

str( person.info )

#
# data frame 요소 읽기
#
city.info[ 1, 1 ]
city.info[ 1, ]
city.info[ , 1 ]
city.info[ city.info$city == 'seoul', ]
city.info[ , 'rank' ]

person2.info <- data.frame( name = c('hong', 'kim', 'lee' ),
                            age = c( 22, 20, 25 ),
                            gender = factor( c( 'M', 'F', 'M' ) ),
                            blood = factor( c( 'A', 'O', 'B' ) ) )
person2.info

person.info$name
person.info[ person.info$name == 'hong', ]
person.info[ person.info$name == 'hong', c( 'name', 'age' ) ] 
person.info[ person.info$name == 'hong', c( 1, 2 ) ]          # c( 'name', 'age' ) = c( 1, 2 )

data()   # 연습용 data set을 제공하여준다. ( 해당 data set의 설명은 help창에서 'data명'으로 검색하여 참조 )

iris
head( iris )
tail( iris )

class( iris )
str( iris )
dim( iris )

iris[ , c( 1:2 ) ]
iris[ , c( 1, 3, 5 ) ]
iris[ , c( 'Sepal.Length', 'Species' ) ]
iris[ 1:5, ]
iris[ 1:5, c( 1, 3 ) ]

#
# matrix / data.frame에서 사용하는 함수
#
class( state.x77 )
class( iris )

dim( state.x77 )
dim( iris )

str( state.x77 )
str( iris )


nrow( state.x77 ) # nrow() : 행 갯수 출력
nrow( iris )

ncol( state.x77 ) # ncol() : 열 갯수 출력
ncol( iris )

head( state.x77 )
head( iris )

tail( state.x77 )
tail( iris )

unique( iris[ , 5 ] )  # uniqie() : 중복된 데이터를 배제하고 출력 (문자열 data or factor type의 data를 볼때 유용함)

table( iris[ , 5 ] )                       # table() : 도수분포표 / 막대그래프로 작성 / factor type에 유리함
table( person.info[ , 'blood.type' ] )
table( person.info[ , 'gender' ] )

#
# matrix / data frame 산술 연산 함수
#
rowMeans( iris[ , -5 ] )
colSums( iris[ , -5 ] ); apply( iris[ , 1:4 ], 2, sum )     # 열(row)별 합
colMeans( iris[ , -5 ] ); apply( iris[ , 1:4 ], 2, mean )   # 열(row)별 평균
rowSums( iris[ , -5 ] ); apply( iris[ , -5 ], 1, sum )      # 행(column)별 합
rowMeans( iris[ , -5 ] ); apply( iris[ , 1:4 ], 2, mean )   # 행(column)별 평균
apply( iris[ , -5 ], 2, median )                            # 열(row)별 중앙값

sx <- state.x77
head( sx )
sx.t <- t( sx )       # t() : 행(row)과 열(column)을 바꾼다. (= 전치 함수)
head( sx.t )

# 조건에 맞는 행(row)과 열(column) 추출( data frame만 가능 ) / (matrix는 사용 불가능)
subset( iris, Species == 'setosa' )
subset( iris, Sepal.Length > 5.0 & Sepal.Width > 4.0 )

subset( iris, Sepal.Length > 5.0 & Sepal.Width > 4.0 )[ , c( 2, 4 ) ]

#
# matrix / data frame 산술연산
#

m1 <- matrix( 1:20, 4, 5 )
m1
m2 <- matrix( 21:40, 4, 5 )
m2

2 * m1
m1 * 2
m2 - 5
2 * m1 + 3 * m2
m1 * 2 + m2 * 3

m1 + m2
m1 - m2
m1 / m2
m1 * m2

#
# matrix를 data frame으로, data frame을 matrix로 변환
#
st <- data.frame( state.x77 )    # matrix를 data frame으로 변환
class( st )
str( st )
dim( st )

iris.m <- as.matrix( iris )      # data frame을 matrix로 변환
class( iris.m )
str( iris.m )
dim( iris.m )

# data type 확인 함수
is.matrix( state.x77 )
is.matrix( st )
is.matrix( iris.m )
is.data.frame( st )
is.data.frame( iris )
is.data.frame( iris.m )

# R Data type : 숫자, 문자, 논리, factor, NULL, NA

# R Data 저장(memory)
#     : 변수
#   - 1차원 배열
#     : vector
#     : list
#   - 2차원 배열 
#     : matrix
#     : data frame


# 
# 2.5 파일 읽기 / 쓰기
# 
# csv file 내용 읽어서 data frame 생성
#
setwd( "D:\\R_work\\4day_2020.05.15")
air <- read.csv( 'airquality.csv', header = T )    # header = T 면, 제목줄을 데이터로 활용하지 않는다.
air

air2 <- read.csv( 'airquality.csv', header = F )   # header = F 면, 제목줄을 데이터로 활용한다.
air2

# 파일을 읽지 못하는 경우, air <- read.csv( D:\\R_work\\airquality.csv, header = T ) 경로를 직접 지정해준다.

class( air )
class( air2 )

str( air )
str( air2 )

dim( air )
dim( air2 )

air
air2
