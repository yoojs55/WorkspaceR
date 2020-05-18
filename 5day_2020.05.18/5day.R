#
#
#
# 0. Open
# 1. Review
# 2. Topic
#   2.1 txt / excel 파일 읽기
#   2.2 자료의 종류
#   2.3 단일 변수 범주형 자료 탐색
#   2.4 단일 변수 연속형 자료 탐색
# 3. Q & A
# 4. Next
# 5. Close
#
# 1. Review
#


# EDA(Exploratory Data Analysis) 탐색적 데이터 분석
#  1. 문제 정의 
#  2. 자료 수집
#  3. 자료 전처리
#  4. 자료 탐색(EDA)


# git hub 사용법 (잠깐 강의!!)
#   - push : 파일 upload
#   - pull : 파일 download
#   - clone : 복사
#
#   - push or pull error 발생 -> git hub 홈페이지에서 강제로 파일 upload
#     -> 컴퓨터에 저장된 디렉토리를 삭제 -> git hub 홈페이지에서 강제로 upload한 파일을 컴퓨터로 download


# setwd( ) 함수 => Directory 변경함수 / setwd( 'Directory 경로' )
#               =>  \ 사용시, \\처럼 2개 사용 
#               =>  / 사용시, /처럼 1개 사용 
setwd( "D:\\R_work\\4day_2020.05.15")
setwd( "D:/R_work/4day_2020.05.15")
df <- read.table( file = 'airquality.txt,', header = T )

# 데이터 읽어 오는데 오류가 발생하여, excel파일 읽기 부터 시작함
# JDK ( Java Development Kit )
# JRE ( Java Runtime Environment )

# 변수 이름 : JAVA_HOME (변수 이름은 항상 대문자)
# 변수 값 : C:\Java\jdk1.8.0_251
# prth 선택 -> 새로만들기 -> %JAVA_HOME%\bin -> 맨위로 이동
# CMD 실행 -> C:\Users\SUN>java -version 입력 후 enter 하면 아래의 메세지가 출력되면 정상 세팅 완료!!
# java version "1.8.0_251"
# Java(TM) SE Runtime Environment (build 1.8.0_251-b08)
# Java HotSpot(TM) 64-Bit Server VM (build 25.251-b08, mixed mode)
    


######### Excel 파일 읽기
#
# Excel 파일 읽기용 패키지
# 최초 한번만 설치
install.packages( "xlsx" )     # Excel 파일 읽기 패키지 ( "xlsx" 처럼 큰따옴표만 사용해야 한다. )
install.packages( "rJava" )    # Java 실행 패키지
# 위 과정을 진행하여도 설치만 끝났을 뿐, 사용할 준비는 안되어 있는 상태임

# 기본 패키지 외에 설치된 패키지 실행
# 사용하기전 library 함수로 불러와야 한다.(= library load)
# 왠만하면 library 함수를 스크립트에서 작성하여 불러와라(내역관리)
library( rJava ) # library( rJava )을 먼저 실행 후 library( xlsx ) 실행해야 한다.(Excel 구축 언어가 Java이기 때문이다.)
library( xlsx )

setwd( "D:\\R_work\\4day_2020.05.15")             # 불러올 파일 저장 경로 설정
df.xlsx <- read.xlsx( file = "airquality.xlsx", 
                      sheetIndex = 1,
                      encoding = "UTF-8")

df.xlsx
class( df.xlsx )
str( df.xlsx )
head( df.xlsx )
tail( df.xlsx )

score <- c( 76, 84, 69, 50, 95, 6, 85, 71, 88, 84 )
which( score == 69 )
which( score >= 85 )
max( score )
which.max( score )
min( score )
which.min( score >= 60 )

idx <- which( score >= 60 )
score[ idx ] <- 61
score

idx <- which( score >= 60 )
score[ idx ] <- 61
score

idx <- which( df.xlsx[ , 1:2 ] == "NA", arr.ind = TRUE )
idx
# arr.ind = TRUE : 해당 조건의 행/열 값을 확일 할때






    
