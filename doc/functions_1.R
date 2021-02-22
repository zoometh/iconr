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

if (grp.thm.ths){
  # graph of all types GUs
  # + imgs
  signes.path <- "D:/Projet Art Rupestre/decors/ug/signes/"
  sqll <- "select pere as from, fils as to from typologie"
  thm.ths.eds <- dbGetQuery(con, sqll)
  peres <- unique(thm.ths.eds$from)
  fils <- unique(thm.ths.eds$to)
  vx <- sort(unique(fils, peres))
  # vx_plus <- setdiff(c(peres, fils), vx) # had lonely nodes
  vx <- sort(c(vx, "u")) # add root
  thm.ths.nds <- data.frame(name=vx,
                            img=paste0(signes.path, vx, ".jpg"))
  g <- graph_from_data_frame(thm.ths.eds,
                             directed=TRUE,
                             vertices= thm.ths.nds)
  # V(g)$name
  # V(g)$img
  # UMs
  d.search.um <- bfs(g,"um",
                  neimode="out",
                  unreachable=FALSE)
  nds.rm.ums <- na.omit(d.search.um$order)$name
  # UPs
  d.search.up <- bfs(g,"up",
                     neimode="out",
                     unreachable=FALSE)
  nds.rm.ups <- na.omit(d.search.up$order)$name
  # rm
  g <- delete.vertices(g, c(nds.rm.ups,nds.rm.ums))

  # thm.ths.nds <- unique(c(unique(thm.ths.eds$pere), unique(thm.ths.eds$fils))
  dbDisconnect(con)
  urls <- paste0(signes.path, V(g)$name, ".jpg")
  # url <- gsub(" ", replacement = "%20", x = url)
  # readJPEG(urls[1])
  img <- list()
  # img <- list(rep(as.raster(readJPEG(paste0(signes.path, "zz_img.jpg"))), length(urls)))
  # ct <- 0
  # as.raster(image_scale(image_read(urls[i]), "100"))
  sz.out <- 100 # to resize
  for(i in 1:length(urls)) {
    # i <- 217
    # by default
    img[[length(img)+1]] <- as.raster(image_scale(image_read(paste0(signes.path, "zz_img.jpg")), sz.out))
    tryCatch(img[[length(img)]] <- as.raster(image_scale(image_read(urls[i]), sz.out)),
             # warning = function(w) {print(paste("WARNING image", basename(url)));
             #   NaN},
             error = function(e) {
               # ct <- ct+1
               print(paste0(i, ". NO image: '", basename(urls[i]), "' -> 'zz_img.jpg'"))
               # img[[length(img)+1]] <- as.raster(readJPEG(paste0(signes.path, "zz_img.jpg")))
             })
  }
  length(img)
  # a.img <- img[[1]]
  # plot(a.img)
  # you need to set the seed as the layout function is an
  # iterative process and not deterministic
  set.seed(1)
  l <- layout.norm(layout.fruchterman.reingold(g),
                   xmin=-1, xmax=1, ymin=-1, ymax=1)
  png(paste0(path.iconr, 'doc/img/typology_gu.png'),
      height=40, width=40, units = "cm",
      res = 300)
  par(mar=rep(0,4))
  plot.igraph(g, layout=l,
              vertex.size=0, vertex.shape="square", # vertex.color="#00000000",
              vertex.frame.color="#00000000", vertex.label=V(g)$name,
              vertex.label.cex= 0.2, vertex.label.color = "black",
              vertex.label.family="Helvetica",
              vertex.label.dist = 0.3, # label.degree=pi/2,
              edge.arrow.size = 0.2, width = 0.5)
  # plotting of the images
  # 1:nrow(l)
  for(i in 1:nrow(l)) {
    # rasterImage(img[[i]], l[i, 1], l[i, 2], l[i, 1], l[i, 2])
    rasterImage(img[[i]], l[i, 1]-0.01, l[i, 2]-0.01, l[i, 1]+0.01, l[i, 2]+0.01)
  }
  dev.off()

  V(g)$raster <- rasters[V(g)$img]

  plot(gg2, layout=layout.star, vertex.shape="raster",
       vertex.label=V(gg2)$name, margin=.2,
       vertex.size=10, vertex.size2=20,
       vertex.label.dist=2, vertex.label.degree=0)
}

url <- paste0("http://pngimg.com/upload/cat_PNG", 1632:1635, ".png")
mapply(download.file, url, basename(url))
img <- lapply( basename(url), png::readPNG)

if (grp.family.thm){
  # graph of shared GUs between families
  setwd("C:/Users/supernova/Dropbox/My PC (supernova-pc)/Documents/iconr")
  sqll <- "select distinct table_noeuds.type, objets.famille
from table_noeuds, objets
where table_noeuds.decor = objets.numero and table_noeuds.site = objets.site
and objets.iconr = 1
order by type"
  famille.themes <- dbGetQuery(con, sqll)
  dbDisconnect(con)
  famille.themes$famille <- toupper(famille.themes$famille)
  famille.themes2 <- dplyr::inner_join(famille.themes, famille.themes, by = "type")[,-2]
  famille.themes3 <- apply(famille.themes2, 2, as.character) #AuthorID as character will become vertex ID
  famille.themes4 <- ggnet2(famille.themes, label = TRUE)
  ggsave("doc/img/famille_thm.png", famille.themes4)
  famille.themes4
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
