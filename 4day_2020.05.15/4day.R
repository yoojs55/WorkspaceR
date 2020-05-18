
# 1. Review
#
# 변수명 / 표준입력 / 표준출력
#
# 변수명 부여방식
numberValue <- 1                   # camael 표기법
str_value <- "R Language"          # snake 표기법
booleanvalue <- TRUE               # 일반 표기법     (이건 쓰지말자 헷갈린다.)
                                   # 헝가리형 표기법 (첫글차가 대문자로 표기 : 예전에는 많이 사용)


# 표준 출력 장치에 출력
#
# print() : 하나만 출력 가능하고, 자동 줄바꿈('\n', 자동 개행)
numberValue; print( numberValue )
str_value; print( str_value )
booleanvalue; print( booleanvalue )

# cat() : 여러 내용을 출력할 수 있고, 자동 줄바꿈이 일어나지 않는 표준 출력장치에 출력하는 함수
#
# 제어 문자 : 화면에 출력되지 않고, 기능을 수행하는 문자
#           : 모든 언어 프로그램이 제어문자는 비슷하다.
# '\n' : 개행 문자(줄바꿈)           (무조건 작은따옴표 안에 작성해야 한다.)
# '\t' : tab 문자 (4칸?? 띄워쓰기)   (무조건 작은따옴표 안에 작성해야 한다.)
#
cat( 'String : ', str_value, '\n' )
cat( 'Boolean value : ', booleanvalue, '\n' )
print( '------------------------------------' )
cat( 'Numeric number : ', numberValue, '\t' ,
     'String : ', str_value, '\t' ,
     'Boolean value : ', booleanvalue, '\n' ) # <- \n을 지운 후 아랫줄 cat( 'test' )와 함께 실행해 볼rjt
cat( 'test' )

# 표준 입력 장치로 부터 입력
#
# scan() : 표준 입력 장치로 부터 입력 받는 함수
# readline() : 표준 입력 장치로 부터 받는 함수 (data type은 문자로 받아온다.)
# edit() : 표준 입력 장치로 부터 표형식으로 입력받는 함수
#
# 출력(output, print) : memory 내용을 output device출력
#                     : 지정하지 않을 시, 표준 출력 장치에 결과 출력
# 입력(input)         : input device에서 memory로 전송하여 기억
# 표준 입력 : stdin / 표준 출력 : stdout / 표준 Error 표시 : stderr

inputData <- scan()   # scan()는 빈줄이 입력될때까지 숫자만 입력 가능 (문자입력X)
class( inputData )
inputData

inputData <- scan( what = character() )
class( inputData )
inputData
# scan()의 문자입력 시, what = character() 입력할 것

inputData <- readline( 'input data -> ' )
class( inputData )
inputData
# readline() 함수는 숫자/문자 모두 입력 가능하지만, 입력한 숫자/문자는 문자로 인식함
# 그러므로 추후 연산을 위해서는 as.integer / as numeric함수로 변환하여 연산해야함

number1 <- readline( 'input number : ' )
number2 <- readline( 'input number : ' )
result <- number1 + number2
result

# (방법1) 
number1 <- readline( 'input number : ' )
number2 <- readline( 'input number : ' )
result <- as.numeric(number1) + as.numeric(number2)
# result <- as.integer(number1) + as.integer(number2)
result

# (방법2) as.integer / as numeric 함수로 변환
as.numeric(number1) + as.numeric(number2)
as.integer(number1) + as.integer(number2)

#
# 실습 문제 : 두 수를 입력 받아서 다음과 같이 출력하시오.
#
# 입력 : input number1 : [ 10 ]
#      : input number2 : [ 5 ] 
#
# 출력결과 : 10 + 5  = 15
#            10 - 5  = 5
#            10 * 5  = 50
#            10 / 5  = 2
#            10 %% 5 = 0
#
#
number1 <- readline( 'input number : ' )   # readline() : 문자 형태로 저장(숫자 X)
number2 <- readline( 'input number : ' )

cat( ' 10 + 5  = ', as.numeric( number1 ) + as.numeric( number2 ), '\n',
     '10 - 5  = ', as.numeric( number1 ) - as.numeric( number2 ), '\n',
     '10 * 5  = ', as.numeric( number1 ) * as.numeric( number2 ), '\n',
     '10 / 5  = ', as.numeric( number1 ) / as.numeric( number2 ), '\n',
     '10 %% 5  = ', as.numeric( number1 ) %% as.numeric( number2 ), '\n')



# 2.1 Algorithm 이해
#
# Algorithm(=Logic) : 문제를 해결하기 위한 일처리 순서
#
# Algorithm 요건
#  1. 입력 : 반드시 0개 이상의 입력이 있어야 한다.(꼭 있어야 되는 것은 아니다)
#  2. 출력 : 반드시 1개 이상의 출력이 있어야 한다.
#  3. 유한성 : 반드시 끝낼 수 있어야 한다.
#  4. 효과성 : 효과적인 방법으로 정의되어야 한다.
#  5. 명확성 : 명확한 방법으로 정의되어야 한다.
#
#
# 컴퓨터 프로그램의 구조
#  - 순차 구조 : 시작부터 끝날때 까지 차례대로 수행
#  - 선택 구조 : 조건에 따라 처리 방향을 바꾸어서 진행
#  - 반복 구조 : 조건이 만족하는동안 동일한 내용을 반복 수행
#
# 컴퓨터 프로그램은 알고리즘에 기반으로 기억장소 원리와
#                   순차/선택/반복 구조를 조합하여 작성한다.
#
# 선택 구조 종류
#  - 단순 선택 구조
#  - 양자 선택 구조
#  - 다중 선택 구조
#  - 중첩 선택 구조
#
# 1. 단순 선택 구조
job.type <- 'B'
bonus <- 0
if ( job.type == 'A') {
     bonus <- 200
}
cat( 'job type : ', job.type, '\t\tbonus', bonus )
# {}(=중괄호) => code block ( code 집합 )


# 2. 양자 택일 구조
job.type <- 'B'
bonus <- 0
if ( job.type == 'A') {
        bonus <- 200
} else {
        bonus <- 100
}
cat( 'job type : ', job.type, '\t\tbonus', bonus )
# else는 줄바꿈을 하면 안된다.(= 구동되지 않음 / 문법이므로 외워라!!!!!)

# 3. 다중 선택 구조 
#    : 여러 조건 중 만족하는 결과를 출력
score <- 50
if ( score >= 90 ) {
        grade <- 'A'
} else if ( score >= 80 ) {
        grade <- 'B'
} else if ( score >= 70 ) {
        grade <- 'C'
} else if ( score >= 60 ) {
        grade <- 'D'
} else {
        grade <- 'F'
} 
cat( 'score : ', score, '\t\tgrade : ', grade)


# 4. 중첩 선택 구조 - 좋은 코딩방법은 아니다!! (복잡하다)
a <- 2
b <- 1
c <- 3
if ( a > b ) {
        if ( a > c ){
                if ( b > C ) {
                mid <-  b; min <-  c
                } else{
                  mid <-  c; min <-  b
                }
        } else if ( c > b ) {
          max <- c; mid <- a; min <- b
        }
} else if ( b > c ) {
        max <- b
        if ( a > C ) {
                mid <- a; min <- c
        } else {
                mid <- c; min <- a
        }
}
cat( 'max : ', max, '\tmid : ', mid, '\tmin : ', min)

#-------------------------------------------------------

number <- 10
remainder <- number %% 2

if( remainder == 0 ) {
        oddeven <- '짝수'
} else {
        oddeven <- '홀수'
}
cat( 'number : ', number, '는 ', oddeven, '이다.')

#-------------------------------------------------

a <- 5
b <- 20

if ( a > 5 & b > 5 ) {
        cat ( a, ' > 5 and ', b, ' > 5' )
} else {
        cat ( a, ' <= 5 or ', b, ' > 5' )
}

#---------------(max값 출력)----------------------

a <- 8; b <- 5; c <- 10; max <- a
if ( b > max ) { max <- b }
if ( c > max ) { max <- c }
cat( 'a = ', a, 'b = ', b, 'c = ', c, 'max = ', max )

#---------------(min값 출력)----------------------

a <- 8; b <- 5; c <- 10; min <- a
if ( b < min ) { min <- b }
if ( c < min ) { min <- c }
cat( 'a = ', a, 'b = ', b, 'c = ', c, 'min = ', min )

#---------------(실습문제1)----------------------
# 문제 : 하나의 숫자를 입력받아 짝수있지 홀수 인지 출력
odd <- as.numeric( readline( 'input number : ' ) )
if ( odd %% 2 == 0 ) { cat( odd, ' 은/는 짝수입니다.')} else {cat( odd, ' 는 홀수입니다.')}

#---------------(실습문제2)----------------------
# 문제 : 하나의 숫자를 입력받아 3의 배수이면 '3의 배수'
#        5의 배수이면 '5의 배수'
#        3, 5의 배수가 아니면 '3, 5의 배수가 아닙니다.' 출력
# (방법1)
number35 <- as.numeric( readline( 'input number : ' ) )

if ( number35 %% 3 == 0 ) {
        cat( number35, ' 은/는 3의 배수입니다.' )
} else if( number35 %% 5 == 0 ){
        cat( number35, ' 은/는 5의 배수입니다.' )
} else { cat( number35, ' 은/는 3, 5의 배수가 아닙니다.' ) }

# (방법2) --------------------------------------------------
number35 <- as.numeric( readline( 'input number : ' ) )
multiple3 = number35 %% 3 == 0
multiple5 = number35 %% 5 == 0
if ( multiple3 ) {
        cat( number35, ' 은/는 3의 배수입니다.' )
} else if( multiple5 ) {
        cat( number35, ' 은/는 5의 배수입니다.' )
} else { cat( number35, ' 은/는 3, 5의 배수가 아닙니다.' ) }


#
# 2.3 반복 구조
#
# 반복 구조 : 조건이 만족하는 동안 동일한 내용을 반복 수행
#
# 1. 반복 횟수가 정해진 경우 : for
# 2. 반복 횟수가 정해지지 않은 경우 : while
#
# for문 : for ([반복제어변수] in [반복 범위]) {}
for ( i in 1:10 ) {
        print( '*' )
}

for ( i in 1:10 ) {
        cat( i, ' ' )
}

multiple = 2
for ( i in 2:9 ) {
        cat( multiple, ' * ', i, ' = ', multiple * i, '\n' )
}


for ( i in 2:9 ) {
        for ( j in 1:9 ) {
                multiple = i * j
                cat( multiple, '\t' )
        }
        cat( '\n' )     
}


#
# 반복 제어 변수 초기화
# While (반복 제어 변수 조건 검사){
#    반복 제어 변수 값 변경
# }
#
i <-  1 # 반복 제어 변수 초기화
while ( i <= 10 ) { # 반복 제어 변수 조건 검사, 참인동안 반복
        print( '*' )
        i <- i + 2  #반복 제어 변수 값, 누적
}
#---------------------------------------------------

i <- 2
while ( i <= 9 ) {
        j <- 1
        while ( j <= 9 ) {
                multiple = i * j
                cat( multiple, '\t' )
                j <- j + 1
        }
        cat( '\n' )
        i <- i + 1
}



#
# 2.4 함수
#
# 함수(function) : 단위 기능을 수행하는 코드 집합
#
# 함수 종류
#   - 내장 함수        : R에 미리 내장된 함수(기본 함수)
#   - 3rd party 함수   : 제 3자가 작성하여 배포한 함수
#   - 사용자 정의 함수 : 사용자가 직접 정의한 함수
#
# 함수 형식
# 
# 함수 정의
#    함수이름(명) <- function( 인수목록 ) {
#                    함수 내용에 해당하는 코드 집합
#                     return ( return값 )
# }
#
#
# 함수 호출
#    함수명(인수목록)
#

# 함수 정의---------------------------------------------
multiple <- function( x ) {
        for ( i in 1:9 ) {
                multiple <- x * i
                cat( x, ' * ', i, ' = ', multiple, '\n' )
        }
        # return()
}

# 함수 호출
multiple( 2 )




# 함수 정의---------------------------------------------
mymax <- function( x, y ){
        num.max <- x
        if ( y > num.max ) {
                num.max <- y
        }
        return( num.max )
}

# 함수 호출
mymax( 5, 6 )


a <- 10; b <- 5; c <- 8
max <- mymax( a, b ); max <- mymax( max, c )
max

# return값이 여러개인 함수
#-------------(list 함수 사용-결과 값이 문자열임)---------------------
myCalc <- function( x, y ){
        add <- x + y
        sub <- x - y
        mul <- x * y
        div <- x / y
        rem <- x %% y
        
        return( list( ret.add = add, ret.sub = sub, ret.mul = mul,
                      ret.div = div, ret.rem = rem ) )
}
result <- myCalc( 10, 5)
cat( '10 + 5 = ', result$ret.add, '\n' )
cat( '10 - 5 = ', result$ret.sub, '\n' )
cat( '10 * 5 = ', result$ret.mul, '\n' )
cat( '10 / 5 = ', result$ret.div, '\n' )
cat( '10 %% 5 = ', result$ret.rem, '\n' )

#-------------(벡터형 : 결과 값이 숫자형)------------------------------------

myCalc2 <- function( x, y ){
        result <- c( x + y, x - y, x * y, x / y, x %% y )
        return( result )
}

myCalc2( 10, 5 )

# 교재 77~86p 금일 진행 내용이므로 참조할 것
# 주말에 46~88p 내용 복습 할 것
