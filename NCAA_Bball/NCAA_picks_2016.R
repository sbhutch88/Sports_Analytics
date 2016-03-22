#This file will source and plot some stats to provide information comparing the computer's
#picks to the humans picks for the NCAA tournament in 2016.

#Model predictions come from http://projects.fivethirtyeight.com/2016-march-madness-predictions/
#Actual pick percentages come from http://games.espn.go.com/tournament-challenge-bracket/2016/en/whopickedwhom
setwd('C:/Users/Steve/Documents/Sports_Analyses/NCAA Tournament')
library('d3heatmap')
library('ggplot2')

NCAA_picks <- read.csv("CBB_picks.csv")
NCAA_picks <- NCAA_picks[1:64,]#Not sure why there are NULLs but this should remove them.

teams <- data.frame(NCAA_picks$Team) 

NCAA_picks$E8 <- as.numeric(as.character(NCAA_picks$E8)) #not sure why it's not numeric, but this fixes it.

#because I have the computer's as a decimal.
NCAA_picks$Comp_R32 <- NCAA_picks$Comp_R32*100
NCAA_picks$Comp_S16 <- NCAA_picks$Comp_S16*100
NCAA_picks$Comp_E8 <- NCAA_picks$Comp_E8*100
NCAA_picks$Comp_F4 <- NCAA_picks$Comp_F4*100
NCAA_picks$Comp_NatChamp <- NCAA_picks$Comp_NatChamp*100
NCAA_picks$Comp_Winner <- NCAA_picks$Comp_Winner*100


pick_value <- data.frame("Round 32"=NCAA_picks$Comp_R32-NCAA_picks$R32,
                         "Sweet 16"=NCAA_picks$Comp_S16-NCAA_picks$S16,
                         "Elite 8" =NCAA_picks$Comp_E8-NCAA_picks$E8,
                         "Final 4" =NCAA_picks$Comp_F4-NCAA_picks$F4,
                         "Championship Game"=NCAA_picks$Comp_NatChamp-NCAA_picks$NatChamp,
                         "National Champion"=NCAA_picks$Comp_Winner-NCAA_picks$Winner)


pick_value_matrix <- data.matrix(pick_value)



#############Heat Maps
#pick_value_heatmap <- heatmap(pick_value_matrix,Rowv=NA, Colv=NA, col = cm.colors(256), scale="column", margins=c(6,69))
#colors = scales::col_quantile("YlOrRd", NULL, 5), #for discrete colors
pick_value_heatmap_continuous <- d3heatmap(pick_value_matrix,scale = "column", dendrogram = "none", colors="Blues",
                                labRow = teams$NCAA_picks.Team,xaxis_height = 200,yaxis_width=500,xaxis_font_size = 10,yaxis_font_size = 8,
                                height = 600,width=600)
pick_value_heatmap_discrete <- d3heatmap(pick_value_matrix,scale = "column", dendrogram = "none", colors = scales::col_quantile("YlOrRd", NULL, 5),
                                           labRow = teams$NCAA_picks.Team,xaxis_height = 200,yaxis_width=500,xaxis_font_size = 10,yaxis_font_size = 8,
                                           height = 600,width=600)


#############Plots

#Round 32
Rd32 <- data.frame(teams,NCAA_picks$Bracket,pick_value$Round.32,row.names=teams$NCAA_picks.Team)
Rd32 <- Rd32[order(Rd32$pick_value.Round.32),]
Rd32_plot <- ggplot(data = Rd32, aes(reorder(x = NCAA_picks.Team,pick_value.Round.32),y = pick_value.Round.32))

Rd32_plot + geom_bar(stat="identity",aes(fill=NCAA_picks.Bracket)) + coord_flip() + 
  labs(title="Pick Value - odds to advance to Round 32") + ylab("Computer picks percentage - Actual ESPN picks percentage") + xlab("Teams")

#Sweet 16
Rd16 <- data.frame(teams,NCAA_picks$Bracket,pick_value$Sweet.16,row.names=teams$NCAA_picks.Team)
Rd16 <- Rd16[order(Rd16$pick_value.Sweet.16),]
Rd16_plot <- ggplot(data = Rd16, aes(reorder(x = NCAA_picks.Team,pick_value.Sweet.16),y = pick_value.Sweet.16))

Rd16_plot + geom_bar(stat="identity",aes(fill=NCAA_picks.Bracket)) + coord_flip() + 
  labs(title="Pick Value - odds to advance to Sweet 16") + ylab("Computer picks percentage - Actual ESPN picks percentage") + xlab("Teams")

#Elite 8
Rd8 <- data.frame(teams,NCAA_picks$Bracket,pick_value$Elite.8,row.names=teams$NCAA_picks.Team)
Rd8 <- Rd8[order(Rd8$pick_value.Elite.8),]
Rd8_plot <- ggplot(data = Rd8, aes(reorder(x = NCAA_picks.Team,pick_value.Elite.8),y = pick_value.Elite.8))

Rd8_plot + geom_bar(stat="identity",aes(fill=NCAA_picks.Bracket)) + coord_flip() + 
  labs(title="Pick Value - odds to advance to Elite 8") + ylab("Computer picks percentage - Actual ESPN picks percentage") + xlab("Teams")

#Final 4
Rd4 <- data.frame(teams,NCAA_picks$Bracket,pick_value$Final.4,row.names=teams$NCAA_picks.Team)
Rd4 <- Rd4[order(Rd4$pick_value.Final.4),]
Rd4_plot <- ggplot(data = Rd4, aes(reorder(x = NCAA_picks.Team,pick_value.Final.4),y = pick_value.Final.4))

Rd4_plot + geom_bar(stat="identity",aes(fill=NCAA_picks.Bracket)) + coord_flip() + 
  labs(title="Pick Value - odds to advance to Final 4") + ylab("Computer picks percentage - Actual ESPN picks percentage")+ xlab("Teams")

#Championship game
Rd2 <- data.frame(teams,NCAA_picks$Bracket,pick_value$Championship.Game,row.names=teams$NCAA_picks.Team)
Rd2 <- Rd2[order(Rd2$pick_value.Championship.Game),]
Rd2_plot <- ggplot(data = Rd2, aes(reorder(x = NCAA_picks.Team,pick_value.Championship.Game),y = pick_value.Championship.Game))

Rd2_plot + geom_bar(stat="identity",aes(fill=NCAA_picks.Bracket)) + coord_flip() + 
  labs(title="Pick Value - odds to advance to Championship Game") + ylab("Computer picks percentage - Actual ESPN picks percentage")+ xlab("Teams")


#Championship game
Rd1 <- data.frame(teams,NCAA_picks$Bracket,pick_value$National.Champion,row.names=teams$NCAA_picks.Team)
Rd1 <- Rd1[order(Rd1$pick_value.National.Champion),]
Rd1_plot <- ggplot(data = Rd1, aes(reorder(x = NCAA_picks.Team,pick_value.National.Champion),y = pick_value.National.Champion))

Rd1_plot + geom_bar(stat="identity",aes(fill=NCAA_picks.Bracket)) + coord_flip() + 
  labs(title="Pick Value - odds to win the National Championship") + ylab("Computer picks percentage - Actual ESPN picks percentage")+ xlab("Teams")
