# -*- coding: utf-8 -*-
"""
Created on Mon Jul 28 21:09:44 2014

@author: Steve
"""
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy import stats

plt.close('all')

test = np.matrix('2 3;5 4')

RBn = 24
QBn = 12
WRn = 36
TEn = 12

#Names of top 24 RBs in order of Yahoo adp as of 7/28/14
RB = ['J.Charles','L.McCoy','A.Peterson','E.Lacy','M.Forte',
      'M.Lynch','M.Ball','L.Bell','A.Foster','D.Murray',
      'G.Bernard','Z.Stacy','A.Morris','D.Martin','R.Mathews',
      'A.Ellington','C.Spiller','R.Bush','F.Gore','R.Jennings',
      'T.Gerhart','B.Sankey','C.Johnson','S.Vereen']

#Names of top 12 QBs in order of Yahoo adp as of 7/29/14
QB = ['P.Manning','D.Brees','A.Rodgers','M.Stafford','C.Newton',
      'A.Luck','M.Ryan','R.Griffin','N.Foles','T.Brady',
      'T.Romo','R.Wilson']
      
#Names of top 36 WRs in order of Yahoo adp as of 7/29/14
WR = ['C.Johnson','D.Thomas','D.Bryant','A.Green','B.Marshall',
      'J.Jones','A.Jefferey','J.Nelson','A.Brown','K.Allen',
      'R.Cobb','V.Jackson','L.Fitzgerald','W.Welker','V.Cruz',
      'A.Johnson','P.Garcon','P.Harvin','D.Jackson','M.Crabtree',
      'C.Patterson','R.White','T.Hilton','M.Floyd','J.Edelman',
      'T.Smith','J.Maclin','K.Wright','M.Colston','G.Tate',
      'E.Decker','R.Wayne','T.Williams','M.Wallace','E.Sanders',
      'A.Boldin']

#Names of top 12 TEs in order of Yahoo adp as of 7/29/14
#I'm manually switching Gronk and Davis since Gronk's ADP is skyrocketing and will soon surpass Vernon's
TE = ['J.Graham','J.Thomas','R.Gronkowski','V.Davis','J.Cameron',
      'J.Witten','G.Olsen','D.Pitta','K.Rudolph','J.Reed',
      'Z.Ertz','M.Bennett']
      

#ADP of RB's on Yahoo as of 7/28/14
RBadp = [1.3,2.4,3.2,4.9,6.4,
         7.6,10.5,17.0,18.2,20.2,
         23.0,23.7,27.0,28.7,38.3,
         39.2,42.0,51.7,59.6,67.1,
         73.9,74.8,83.3,88.8]

#ADP of QB's on Yahoo as of 7/29/14
QBadp = [10.4,17.0,20.2,47.0,51.1,
         51.9,57.0,60.9,68.4,68.5,
         86.3,93.8]
         
#ADP of QB's on Yahoo as of 7/29/14
WRadp = [6.5,11.2,13.3,13.3,15.7,
         19.4,21.9,24.2,26.6,30.1,
         31.4,34.0,34.0,36.5,38.4,
         38.6,39.3,44.1,44.5,44.6,
         45.2,46.2,52.8,58.6,59.9,
         62.7,71.6,79.3,82.3,90.2,
         91.6,94.4,94.6,99.1,99.4,
         107.4]
         
#ADP of TE's on Yahoo as of 7/29/14
TEadp = [8.3,32.0,45.8,41.9,55.3,
         60.4,62.9,69.2,80.9,102.5,
         106.7,116.1]

#Yahoo's projected fantasy points from RBs in order of ADP
RBfp = [261,221,255,217,236,
        203,195,182,213,219,
        199,192,179,177,155,
        188,156,134,164,167,
        167,169,145,158]

#Yahoo's projected fantasy points from QBs in order of ADP
QBfp = [413,372,346,319,282,
        308,312,304,343,323,
        310,273]

#Yahoo's projected fantasy points from WRs in order of ADP
WRfp = [223,205,209,190,193,
        196,175,186,185,159,
        155,143,164,158,145,
        155,154,138,135,128,
        149,146,139,138,148,
        145,121,134,144,116,
        127,121,142,132,129,
        103]

#Yahoo's projected fantasy points from TEs in order of ADP
TEfp = [182,135,151,98,110,
        131,118,99,96,99,
        90,104]

#zScoring my projected fantasy point data.       
zRBfp = stats.zscore(RBfp)
zQBfp = stats.zscore(QBfp)
zWRfp = stats.zscore(WRfp)
zTEfp = stats.zscore(TEfp)

         
#************************Plotting************************         

plot = 1
if plot == 1:    #code to shut off plot     
    #Creating a plot of RB zscores.
    plt.figure('RunningBacks')
    pos = np.arange(len(zRBfp))
    indRB = np.arange(RBn)
    plt.title('Projected FP zScores for top 24 RBs')
    plt.barh(indRB,zRBfp,color='r')
    plt.xlabel('z scores')
    ticks = plt.yticks(pos+.4,RB)
    plt.grid(axis = 'y',color = 'black',linestyle = ':')
    plt.ylim(0,RBn)
    plt.xlim(-3,3)

plot = 1
if plot == 1:    #code to shut off plot    
    #Creating a plot of QB zscores.
    plt.figure('Quarterbacks')
    pos = np.arange(len(zQBfp))
    indQB = np.arange(QBn)
    plt.title('Projected FP zScores for top 12 QBs')
    plt.barh(indQB,zQBfp,color='b')
    plt.xlabel('z scores')
    ticks = plt.yticks(pos+.4,QB)
    plt.grid(axis = 'y',color = 'black',linestyle = ':')
    plt.ylim(0,QBn)
    plt.xlim(-3,3)

plot = 1
if plot == 1:    #code to shut off plot    
    #Creating a plot of WR zscores.
    plt.figure('Wide Receivers')
    pos = np.arange(len(zWRfp))
    indWR = np.arange(WRn)
    plt.title('Projected FP zScores for top 36 WRs')
    plt.barh(indWR,zWRfp,color='g')
    plt.xlabel('z scores')
    ticks = plt.yticks(pos+.4,WR)
    plt.grid(axis = 'y',color = 'black',linestyle = ':')
    plt.ylim(0,WRn)
    plt.xlim(-3,3)

plot = 1
if plot == 1:    #code to shut off plot    
    #Creating a plot of TE zscores.
    plt.figure('Tight Ends')
    pos = np.arange(len(zTEfp))
    indTE = np.arange(TEn)
    plt.title('Projected FP zScores for top 12 TEs')
    plt.barh(indTE,zTEfp,color='y')
    plt.xlabel('z scores')
    ticks = plt.yticks(pos+.4,TE)
    plt.grid(axis = 'y',color = 'black',linestyle = ':')
    plt.ylim(0,TEn)
    plt.xlim(-3,3)

#************************* Making sense of the stats*****************

plot = 1
if plot == 1:    #code to shut off plot    
    #Top pick zscores.
    zTopPick = [zRBfp[0],zQBfp[0],zWRfp[0],zTEfp[0]]
    players = [RB[0],QB[0],WR[0],TE[0]]
    n = 4
    plt.figure('TopPicks')
    pos = np.arange(n)
    ind = np.arange(n)
    plt.title('Projected FP zScores for Top at each position')
    plt.barh(ind,zTopPick,color='r')
    plt.xlabel('z scores')
    ticks = plt.yticks(pos+.4,players)
    plt.grid(axis = 'y',color = 'black',linestyle = ':')
    plt.xlim(2,2.5)


#Top 25% fantasy points.
TopRBs = np.mean(RBfp[0:RBn/4])
TopQBs = np.mean(QBfp[0:QBn/4])
TopWRs = np.mean(WRfp[0:WRn/4])
TopTEs = np.mean(TEfp[0:TEn/4])
#bottom 25% fantasy points.
BottomRBs = np.mean(RBfp[18:RBn])
BottomQBs = np.mean(QBfp[9:QBn])
BottomWRs = np.mean(WRfp[27:WRn])
BottomTEs = np.mean(TEfp[9:TEn])

print BottomQBs,TopQBs
print QBfp[0:QBn/4],RBfp[RBn/4:RBn/2]

#second 25% fantasy points.
SecondRBs = np.mean(RBfp[RBn/4:RBn/2])
SecondQBs = np.mean(QBfp[QBn/4:QBn/2])
SecondWRs = np.mean(WRfp[WRn/4:WRn/2])
SecondTEs = np.mean(TEfp[TEn/4:TEn/2])
#calculation representing the difference between the mean fantasy points of the top 25% and bottom 25% of starting players at each position.
TopvsBottomRB = BottomRBs/TopRBs
TopvsBottomQB = BottomQBs/TopQBs
TopvsBottomWR = BottomWRs/TopWRs
TopvsBottomTE = BottomTEs/TopTEs
#calculation representing the difference between the mean fantasy points of the top 25% and second 25% of starting players at each position.
TopvsSecondRB = SecondRBs/TopRBs
TopvsSecondQB = SecondQBs/TopQBs
TopvsSecondWR = SecondWRs/TopWRs
TopvsSecondTE = SecondTEs/TopTEs

plot = 1
if plot == 1:    #code to shut off plot    
    #plots the top vs Bott0m 25% of each position. Each number represents a ratio of the top-bottom zscore 
    zTopvsBottom = [TopvsBottomRB,TopvsBottomQB,TopvsBottomWR,TopvsBottomTE]
    players = ['RB','QB','WR','TE']
    n = 4
    plt.figure('Top vs. Bottom')
    pos = np.arange(n)
    ind = np.arange(n)
    plt.title('Ratio of projected mean fantasy points for Top vs. Bottom at each position')
    plt.barh(ind,zTopvsBottom,color='r')
    plt.xlabel('how many Top 25% FPs can the bottom 25% account for')
    ticks = plt.yticks(pos+.4,players)
    plt.grid(axis = 'y',color = 'black',linestyle = ':')
    plt.xlim(0,1)

plot = 1
if plot == 1:    #code to shut off plot    
    #looking at the top 25% vs. the next 25%.
    zTopvsBottom = [TopvsSecondRB,TopvsSecondQB,TopvsSecondWR,TopvsSecondTE]
    players = ['RB','QB','WR','TE']
    n = 4
    plt.figure('Top vs. Second')
    pos = np.arange(n)
    ind = np.arange(n)
    plt.title('Ratio of projected mean fantasy points for Top vs. Second 25% at each position')
    plt.barh(ind,zTopvsBottom,color='r')
    plt.xlabel('how many Top 25% FPs can the second 25% account for')
    ticks = plt.yticks(pos+.4,players)
    plt.grid(axis = 'y',color = 'black',linestyle = ':')
    plt.xlim(0,1)
#
