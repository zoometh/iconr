library(RPostgreSQL)
# devtools::install_github("briatte/ggnet")
library(ggnet)
library(network)
library(sna)
library(ggplot2)

drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv,
                 dbname="mailhac_9",
                 host="localhost",
                 port=5432,
                 user="postgres",
                 password="postgres")
sqll <- "select distinct table_noeuds.type, objets.famille
from table_noeuds, objets
where table_noeuds.decor = objets.numero and table_noeuds.site = objets.site
and objets.iconr = 1
order by type"
famille.themes <- dbGetQuery(con, sqll)
famille.themes$famille <- toupper(famille.themes$famille)
famille.themes2 <- dplyr::inner_join(famille.themes, famille.themes, by = "type")[,-2]
famille.themes3 <- apply(famille.themes2, 2, as.character) #AuthorID as character will become vertex ID
famille.themes4 <- ggnet2(famille.themes, label = TRUE)
ggsave(famille.themes4
#################
bip = data.frame(event1 = c(1, 2, 1, 0),
                 event2 = c(0, 0, 3, 0),
                 event3 = c(1, 1, 0, 4),
                 row.names = letters[1:4])
bip = network(bip,
              matrix.type = "bipartite",
              ignore.eval = FALSE)
ggnet2(famille.themes, label = TRUE)
# set colors for each mode
col = c("actor" = "grey", "event" = "gold")
# detect and color the mode
ggnet2(bip, color = "mode", palette = col, label = TRUE)
#################

#################
test1 <- data.frame(ThreadID = c(659289, 432269, 572531, 659289),
                    AuthorID = c(193537, 136196, 170305, 32359))
test2 <- dplyr::inner_join(test1, test1, by = "ThreadID")[,-1]
test3 <- apply(test2, 2, as.character) #AuthorID as character will become vertex ID
test.network <- network(test3, directed = FALSE)
as.sociomatrix(test.network)
as.edgelist(test.network)
plot(test.network, label = test.network%v%"vertex.names")
#################
