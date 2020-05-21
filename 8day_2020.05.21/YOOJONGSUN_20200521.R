#
# 유종선 / 20200521
#

# 문1)
# R에서 제공하는 mtcars 데이터셋에서 gear(기어의 수)에 대해 ggplot으로 막대그래프를 작성하시오.
# 단, 제목과 x축 레이블은 ‘기어의 수’, y축 레이블은 ‘빈도수’로 나타내시오.
library( ggplot2 )
ggplot( mtcars, aes( gear )) +     
    geom_bar( stat = 'count',             
              width = 0.4,                   
              fill = 'grey24') +
    ggtitle( "number of gaer") +
    theme( plot.title = element_text( size = 20,
                                      face = 'bold',
                                      colour = 'grey24' ),
           axis.text = element_text(size=15,face="bold", color = 'grey24' ),
           axis.title = element_text(size=20,face="bold", color = 'grey24')) +
    labs( x = 'gear', y = 'freq' )


# 문2)
# R에서 제공하는 mtcars 데이터셋에서 cyl(실린더의 수)에 대해 막대 색이 초록색인 막대그래프를 ggplot으로 작성하시오.
ggplot( mtcars, aes( cyl )) +     
    geom_bar( stat = 'count',             
              width = 0.4,                   
              fill = 'green') +
    theme( axis.text = element_text(size=15,face="bold", color = 'grey24' ),
           axis.title = element_text(size=20,face="bold", color = 'grey24') )


#문3) 
# R에서 제공하는 mtcars 데이터셋에서 mpg(연비)에 대해 구간 간격이 5.0인 히스토그램을 ggplot으로 작성하시오.
ggplot( mtcars, aes( x = mpg ) ) +
    geom_histogram( fill = 'grey24',
                    binwidth = 0.7 ) + 
    ggtitle( "mpg histogram" )+
    theme( plot.title = element_text( size = 20,
                                      face = 'bold',
                                      colour = 'grey24' ),
           axis.text = element_text(size=15,face="bold", color = 'grey24' ),
           axis.title = element_text(size=20,face="bold", color = 'grey24'))


# 문4)
# R에서 제공하는 trees 데이터셋의 Girth(나무 둘레)에 대해 ggplot으로 히스토그램을 작성하시오.
# 여기에서는 히스토그램의 제목, x축 레이블, y축 레이블을 한글로 표시하시오.
# (구간 간격은 3.0, 막대의 색은 steelblue로 한다.)
ggplot( trees, aes( x = Girth ) ) +
    geom_histogram( fill = 'steelblue',
                    binwidth = 0.7 ) + 
    ggtitle( "나무둘레 히스토그램" )+
    theme( plot.title = element_text( size = 20,
                                      face = 'bold',
                                      colour = 'steelblue' ),
           axis.text = element_text(size=15, color = 'steelblue' ),
           axis.title = element_text(size=20, face="bold", color = 'steelblue' )) +
    labs( x = '나무둘레', y = '빈도수' ) + 
    scale_x_continuous(breaks = c(7,10,13,16,19,22))

# 문5)
# R에서 제공하는 mtcars 데이터셋에서 mpg(연비)를 x축으로 하고, wt(중량)를 y축으로 하는 산점도를 ggplot으로 작성하시오. 
# (단, 점의 색은 gear의수에 따라 다르게 표시한다.)
ggplot( data = mtcars, aes( x = mpg,
                          y = wt,
                          color = gear ) ) +
    geom_point( size = 3 ) + 
    ggtitle( 'Scatterplot of fuel economy and weight' ) + 
    theme( plot.title = element_text( size = 15,
                                      face = 'bold',
                                      colour = 'grey24'),
           axis.text = element_text(size=15,face="bold", color = 'grey24' ),
           axis.title = element_text(size=20,face="bold", color = 'grey24'),
           legend.position = c(0.9, 0.8),
           legend.title = element_text(color = "grey24", size = 12, face = "bold"),
           legend.text = element_text(color = "grey24", size = 12, face = "bold"))

# 문6)
# R에서 제공하는 mtcars 데이터셋에서 mpg(연비)에 대해 ggplot으로 상자그림을 작성하되, 
# cyl(실린더 수)에 따라 그룹을 나누어 작성하시오.
as.fac <- as.factor( mtcars$cyl )

ggplot( mtcars, aes( y = mpg,
                     fill = as.fac ) ) +
    theme( plot.title = element_text( size = 20,
                                      face = 'bold',
                                      colour = 'grey24'),
           axis.text = element_text(size=15,face="bold", color = 'grey24' ),
           axis.title = element_text(size=20,face="bold", color = 'grey24'),
           legend.position = 'top',
           legend.title = element_text(color = "grey24", size = 20, face = "bold"),
           legend.text = element_text(color = "grey24", size = 20, face = "bold") ) +
    geom_boxplot()

# 문7) 
# 다음은 2015년부터 2026년도까지의 예상 인구수 추계 자료이다. 
# 연도를 x축으로하여 ggplot으로 선그래프를 작성하시오.

# 연도    총인구 (천명)      연도      총인구 (천명)
# 2015      51014            2021      52123
# 2016      51245            2022      52261
# 2017      51446            2023      52388
# 2018      51635            2024      52504
# 2019      51811            2025      52609
# 2020      51973            2026      52704   

year <- 2015:2026
population <- c( 51014, 51245, 51446, 51635, 51811, 51973, 52123, 52261, 52388, 52504, 52609, 52704 )
frame <- data.frame( year, population )

ggplot( frame, aes( x = year, y = population ) ) +
    ggtitle( '[year - population] graph' ) + 
    theme( plot.title = element_text( size = 15, face = 'bold', colour = 'grey24'),
           axis.text = element_text(size=15,face="bold", color = 'grey24' ),
           axis.title = element_text(size=20,face="bold", color = 'grey24')) +
    geom_line( col = 'red' )
        
    
