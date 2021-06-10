library(RPostgreSQL)
# devtools::install_github("briatte/ggnet")
library(ggnet)
library(network)
library(sna)
library(ggplot2)
library(igraph)
library(jpeg)
library(magick)

path.iconr <- "C:/Users/supernova/Dropbox/My PC (supernova-pc)/Documents/iconr/"

grp.family.thm <- F
grp.thm.ths <- T

drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv,
                 dbname="mailhac_9",
                 host="localhost",
                 port=5432,
                 user="postgres",
                 password="postgres")

if (grp.family.thm){
  # graph of shared GUs between families, return a graph image of connected themes
  setwd("C:/Users/supernova/Dropbox/My PC (supernova-pc)/Documents/iconr")
  sqll <- "select distinct table_noeuds.type, objets.famille
from table_noeuds, objets
where table_noeuds.decor = objets.numero and table_noeuds.site = objets.site
and objets.iconr = 1
order by type"
  famille.themes <- dbGetQuery(con, sqll)
  dbDisconnect(con)
  famille.themes$famille <- toupper(famille.themes$famille)
  nds.famille <- unique(famille.themes$famille)
  nds.famille.color <- rep("gold", length(nds.famille))
  nds.thm <- unique(famille.themes$type)
  nds.thm.color <- rep("grey", length(nds.thm))
  thm.ths.nds <- data.frame(name=c(nds.famille, nds.thm),
                            color=c(nds.famille.color, nds.thm.color))
  g <- graph_from_data_frame(famille.themes,
                             directed=F,
                             vertices= thm.ths.nds)
  png("doc/img/famille_thm.png",
      height=7, width=7, units = "cm",
      res = 300)
  par(mar=rep(0, 4))
  plot(g, vertex.label.cex= 0.3,
       vertex.frame.color=NA,
       vertex.label.color = "black",
       vertex.label.family="Helvetica",
       vertex.size=10)
  dev.off()
  #
  # famille.themes$famille <- toupper(famille.themes$famille)
  # famille.themes2 <- dplyr::inner_join(famille.themes, famille.themes, by = "type")[,-2]
  # famille.themes3 <- apply(famille.themes2, 2, as.character) #AuthorID as character will become vertex ID
  # famille.themes4 <- ggnet2(famille.themes, label = TRUE)
  ggsave("doc/img/famille_thm.png", famille.themes4)
  # thm.ths.nds <- data.frame(name=vx,
  #                           img=paste0(signes.path, vx, ".jpg"))
  thm.ths.nds <- data.frame(name=vx,
                            img=paste0(signes.path, vx, ".jpg"))
  g <- graph_from_data_frame(thm.ths.eds,
                             directed=TRUE,
                             vertices= thm.ths.nds)

}
#
# # TODO: color differently
# #################
# bip = data.frame(event1 = c(1, 2, 1, 0),
#                  event2 = c(0, 0, 3, 0),
#                  event3 = c(1, 1, 0, 4),
#                  row.names = letters[1:4])
# bip = network(bip,
#               matrix.type = "bipartite",
#               ignore.eval = FALSE)
# ggnet2(famille.themes, label = TRUE)
# # set colors for each mode
# col = c("actor" = "grey", "event" = "gold")
# # detect and color the mode
# ggnet2(bip, color = "mode", palette = col, label = TRUE)
# #################
#
# #################
# test1 <- data.frame(ThreadID = c(659289, 432269, 572531, 659289),
#                     AuthorID = c(193537, 136196, 170305, 32359))
# test2 <- dplyr::inner_join(test1, test1, by = "ThreadID")[,-1]
# test3 <- apply(test2, 2, as.character) #AuthorID as character will become vertex ID
# test.network <- network(test3, directed = FALSE)
# as.sociomatrix(test.network)
# as.edgelist(test.network)
# plot(test.network, label = test.network%v%"vertex.names")
# #################
