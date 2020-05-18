p <- c(1,2,3,4)
o <- c(3,4,5)

# 벡터의 연산
o+p; p+o
o-p; p-o
o*p; p*o
o/p; p/o
o%%p; p%%o

# 집합
union(o,p); union(p,o)         # 합집합
setdiff(o,p); setdiff(p,o)     # 차집합
intersect(o,p); intersect(p,o) # 교집합

# 행렬(=matrix / 자료형은 벡터임 / 벡터를 여러 개 합친 형태)
matrix(p)
mat <- matrix(p)  # matrix(행렬)은 defualt값은 column부터 채워짐
mat               
# 결과값이 4열로 출력됨 (4 * 1 matrix 생성)

mat1 <- matrix(p, nrow = 2) # matrix(행렬)을 2행으로 만들어라!
mat1                        
# 결과값이 2행 2열로 출력됨 (2 * 2 matrix를 열부터 채운 후 생성) 

mat1 <- matrix(p, nrow = 2, byrow = T) 
mat1

# mat1 matrix에서 3만 출력하시오.
mat1[1,2]

# mat1 matrix에서 4만 출력하시오.
mat1[2,2]

# 행 또는 열값 출력하기
# 1행의 값을 출력하시오.
mat1[1,]

# 2행의 값을 출력하시오.
mat1[2,]

# 1열의 값을 출력하시오.
mat1[,1]

# 2열의 값을 출력하시오.
mat1[,2]

# matrix를 출력하기 결과는 아래 명령어2개는 동일한 결과 출력은 얻는다.
mat1[,]
mat1

## dataframe
# vextor로부터 DataFame 생성
No. <- c(1,2,3,4)
name <- c('Apple', 'Peach', 'Banana', 'Grape')
Price <- c(500,200,100,50)
Qty <- c(5,2,4,7)

sales <- data.frame(No., name, Price, Qty)
sales

View(sales) # View 함수의 'V'는 대문자/View 함수로 깔끔하게 볼수 있다.

sales[2]
sales[c(2)]
sales[0,2]
sales[2,0]
sales[,2]
sales[2,]

sales$Price


sales[2,0]
sales[,2]
sales[2,]


## 문제
# 1번째 행과 2번째 행을 출력하시오.
sales[1,]; sales[2,]
sales[1:2,]
sales[c(1,2),]


## 특정 조건에 맞는 행/열 출력
# subset함수 : subset(원본데이터, 조건)

# 특정 조건의 행(row) 출력
subset(sales, Qty > 3)
subset(sales, name == 'Apple')
subset(sales, Price >=300)

# 특정 조건의 열(column) 출력
subset(sales, Price >=100, select = name)
subset(sales, Qty >= 2, select = -Price)

## 문제
# Qty가 3개 이상인 행에서 Name과 Price만 출력하시오.
subset(sales, Qty >= 3, select = c(name, Price))




## Text Mining
# KoNLP 패키지 설치
install.packages("KoNLP")



