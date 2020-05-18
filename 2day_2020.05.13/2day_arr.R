#
# 2일차 R Script 실습
#

# 1. 값을 이용한 계산
class(3)    # class() : () 안에 입력된 data의 유형 출력
class(5)
3+5
print(3+5)  # print() : () 안에 입력된 data의 결과 출력 / 변수명만 실행하여도 print()함수와 동일한 결과 출력

# 표준 출력 장치 : 일반적인 출력 장치라고 하며, 장치를 지정하지 않아도 자동으로 사용되는 장치를 의미함
#
# stdout(표준 출력 장치) : 모니터
# stdin(표준 입력 장치)  : 키보드
# stderr(표준 error 표시장치) : 모니터
#

print( 10 + 5 )     # 덧셈
print( 10 - 5 )     # 뺄셈
print( 10 * 5 )     # 곱셈
print( 10 / 5 )     # 나눗셈
print( 10 %% 5 )    # 나머지
print( 10 ^ 5 )     # 제곱
print( 10 % 5 )     # 잘못된 연산 %는 기호로 연산 자체를 할 수 없다.
       
#
# 변수(variable) - 통상 의미있는 이름을 부여한다.
#                - 메모리 영역에 대한 이름
#                - 값을 저장하는 메모리 영역

number1 <- 10
number2 <- 8
print( number1 + number2 ); number1 + number2
print( number1 - number2 ); number1 - number2
print( number1 * number2 ); number1 * number2
print( number1 / number2 ); number1 / number2
print( number1 %% number2 ); number1 %% number2
print( number1 ^ number2 ); number1 ^ number2

#
# 산술 연산 함수
#
log( 10 ) + 5        # 로그 함수
sqrt( 25 )           # 제곱근 함수
max( 5, 3, 2 )       # 최대값 함수
min( 5, 3, 2 )       # 최소값 함수
abs( -5 )            # 절대값 함수
factorial( 5 )       # 팩토리얼 함수
sin( pi / 2 )        # 삼각함수(sin)
cos( pi / 2 )        # 삼각함수(cos)
tan( pi / 2 )        # 삼각함수(tan)

var1 <- 10             # var1(변수)에 10을 저장하시오. -> 변수 생성
var2 <- 50             # var2(변수)에 50을 저장하시오. -> 변수 생성
var3 <- 15 * 25        # var3(변수)에 15 * 5를 저장하시오. -> 변수 생성
var4 <- var1 / var2    # var4(변수)에 var1(변수) / var2(변수)를 저장하시오. ->변수 생성
var5 <- 10 * 9         # var5(변수)에 10 * 9를 저장하시오. -> 변수 생성
print( var1 ); var1    # var1(변수)의 결과를 출력하시오.
print( var2 ); var2
print( var3 ); var3
print( var4 ); var4
print( var5 ); var5

#
# 자료형태(data type) : 값에 대한 형태
#
number <- 10           # number(변수)에 10(숫자)을 저장하시오. -> 변수 생성
string <- 'R Script'   # string(변수)에 'R Script'(문자)를 저장하시오. -> 변수 생성 ("R Script" <- 사용 가능)
boolean <- TRUE        # boolean(변수)에 TRUE(논리)를 저장하시오. -> 변수 생성 (논리는 대문자로만 작성)
temp <- NULL           # temp(변수)에 NULL(논리)를 저장하시오. -> 변수 생성 (논리는 대문자로만 작성)

# str() : 변수의 내용(type, 값) 확인 함수
class( number ); str( number )
class( string ); str( string )
class( boolean ); str( boolean )
class( temp ); str( temp )

# NA : 결측치(= missing value)
missing <- NA
missing

class( missing ); str( missing )

# '10' -> 영숫자 : 10(숫자)이 아니고, '10'('10' / '일공')이 된다.('' / ""  <- 둘 다 사용 가능)
chrnum <- '10'
chrnum

class( chrnum ); str( chrnum )

# is.함수 : 확인 함수 -> 결과 논리값(TRUE / FALSE의 논리값으로 결과 출력)
number <- 150
chanum <- '10'

class( number )
is.numeric( number )

class( chanum )
is.numeric( chanum )

is.character( number )
is.character( chanum )

# as.함수 : '형 변환(숫자 <-> 문자)' 함수
result <- number + as.numeric( chanum )  # as.numeric() : 문자 data -> 숫자data 변환
class( result ); str( result )
print( result )
as.character( 10 )
# vector(벡터) : 동일 자료형 값의 집합
#              : 1차원 배열, '열의 집합' 이라고도 한다.
# c() : connect의 약자로 벡터 생성 함수 (벡터의 값을 구성하기 위해서는 c()함수로 구성해 주어야 한다.)
vector1 <- c( 1, 3, 5, 7, 9 )
vector2 <- c( 'hello', 'world', 'R Script' )
vector3 <- c( TRUE, FALSE, TRUE, TRUE)

# vector 함수 구성 시, 숫자 + 문자를 같이 구성하면, 숫자를 문자로 변환(암묵적 변환(implcit))한다.
vector4 <- c( 1, 3, 'hello', TRUE )

class( vector1 ); str( vector1 ); print( vector1 )
class( vector2 ); str( vector2 ); print( vector2 )
class( vector3 ); str( vector3 ); print( vector3 )
class( vector4 ); str( vector4 ); print( vector4 )

# 연속값을 저장하는 벡터
vector5 <- 1:10
vector6 <- c( 1, 2, 3, 4, 5:10 )

print( vector5 ); print( vector6 )

# 논리값의 숫자data의 유형
vector_tc <- c( 1, 2, TRUE, FALSE )               # TRUE = 1 / FALSE = 0
class( vector_tc ); str( vector_tc ); vector_tc

# seq 함수 ( seq = Sequence )
vector7 <- seq( 1, 10, 3 )                 # seq( x, y, z ) -> z만큼씩 변화로 x~y까지 나열
vector9 <- seq( 1, 101, by = 3 )            # seq( x, y, z ) = seq( x, y, by = z )
vector8 <- seq( 0.1, 1.0, 0.1 )       
vector9 <- seq( 1, 100, length.out = 4 )    # length.out = z => z만큼의 간격으로 1~100 까지 나열  

# rep 함수 ( rep = repeat )
vector10 <- rep( 1, time = 5 )               # rep( x, y, time = z ) -> x~y까지 z번 반복
vector11 <- rep( 1:5, time = 3 )            
vector12 <- rep( c( 1, 5, 9 ), time = 3 )    # 1, 5, 9를 z번 반복

vector7; vector8; vector9; vector10; vector11; vector12

# vector 원소값에 이름 지정
score <- c( 90, 85, 70 )
score
names( score )
names( score ) <- c( 'hong', 'kim', 'lee' ) 
names( score )
score

# names() 함수는 변수의 벡터 원소의 갯수의 수만큼 이름을 지정해야 한다.(원하는 결과 출력X)
score <- c( 90, 85, 70 )
score
names( score )
names( score ) <- c( 'hong', 'kim', 'lee', 'yoo' )
names( score )
score

# length() : vector 길이 (vector 요소 갯수 출력)
length( score )

# vector 요소 읽기
# [] -> 요소 입력, () -> 함수 입력
score[ 1 ]
score[ 2 ]
score[ 'kim' ]

# vector 요소 쓰기
score[ 1 ] <- 55
score

score[ 'lee' ] <- 77    # naems() 함수로 이름을 지정한 경우에만 가능능
score

# vector 요소 한번에 여러개 읽기
v <- c( 1, 4, 3, 7, 8 )
v[ c( 1, 3, 5 ) ]
v[ 1:3 ]
v[ seq( 1, 5, 2)]        # seq( x, y, z ) -> z만큼씩 변화로 x~y까지 나열이므로, [ 1, 4, 3, 7, 8] 중 1, 3, 5번 원소를 결과갑으로 출력 
v[ -2 ]                  # [ 1, 4, 3, 7, 8] 중 2번 원소만 제외하고 결과값 전부 출력
v[ -c(3:5) ]; v[ -3:-5 ] 

v[ c( 1, 3, 5 ) ] <- 5   # v변수 원소 중 1, 3, 5번 원소 값을 5로 변경
v
v [-2 ] <- 100           # v변수 원소 중 2번 원소 값을 제외한 원소 전부를 100로 변경
v

# vector 간의 연산 -> vector간의 길이(=data 갯수)가 동일해야 가능
x <- c( 1, 2, 3 )
y <- c( 4, 5, 6 )

x + y       
x - y
x * y
x / y
x %% y
x ^ y

# vector에 적용 가능한 함수
v <- c( 1:10 )
v

sum( v )                         # 합계
sum( 2 * v )
mean( v )                        # 평균
mean( 1:5 )
mean( c( 1:5 ) )
mean( v[ 1:5 ] )
median( v )                      # 중앙값
median( 1:5 )
median( c( 1:5 ) )
median( v[ 1:5 ] )
max( v )                         # 최대값
max( 1:5 )
max( c( 1:5 ) )
max( v[ 1:5 ] )
min( v )                         # 최소값
min( 1:5 )
min( c( 1:5 ) )
min( v[ 1:5 ] )
sort( v )                        # 정렬(defualt = 오름차순)
sort( v, decreasing = FALSE )    # (decreasing = FALSE) 오름차순
sort( v, decreasing = TRUE )     # (decreasing = TRUE) 내림차순
sort( v[1:5] )                       
sort( v[1:5], decreasing = FALSE )   
sort( v[1:5], decreasing = TRUE )    
range( v )                       # 값의범위 (최소값 ~ 최대값)
range( v[ 1:7 ] )
var( v )                         # 분산
sd( v )                          # 표준편차

avg <- sum( v ) / length( v )    # mean() 함수와 결과 동일
avg

# 관계 / 논리연산 => TRUE / FALSE로 결과값 출력
# 관계 연산자 : >, >=(> =), <, <=(< =), ==(= =), !=(! =) 
# 논리 연산자 : &&, &(AND), ||, |(OR), !(NOT)
number1 <- 10
number2 <- 19
number3 <- 3

number1 > number2
number1 >= number2

( number1 > number2 ) & ( number1 > number3 )   # 논리 연산 : AND
( number1 > number2 ) && ( number1 > number3 )  # 논리 연산 : AND

( number1 > number2 ) | ( number1 > number3 )   # 논리 연산 : OR
( number1 > number2 ) || ( number1 > number3 )  # 논리 연산 : OR

# 관계 연사자를 vector에 적용
v <- 1:10
v

v >= 5
v[ v > 5 ]
sum( v > 4 )
# v > 4 결과값 = FALSE(0) FALSE(0) FALSE(0) FALSE(0) TRUE(1) TRUE(1) TRUE(1) TRUE(1) TRUE(1) TRUE(1)
# TRUE = 1 / FALSE = 0 이므로, 1+1+1+1+1+1 = 6의 결과값이 출력
v == 5
# = 은 2개를 사용할 것('= =') / = 을 절대로 하나를 사용하면 안됨!!!!!!

condition <- v > 6 & v < 8
condition      # 관계 연산자는 결과값을 TRUE / FALSE로 출력
v[condition]   # 그러므로 숫자로 결과값을 보고 싶으면, [] <- 요소 읽기인 대괄호를 사용한다.


# 금일 벡터 교육은 교재 62~65p 까지의 내용임
# 66p부터는 안함
