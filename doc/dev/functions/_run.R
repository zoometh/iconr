# library(sf)
library(Momocs)
library(iconr)
library(dplyr)

dataDir <- system.file("extdata", package = "iconr")
dataDir <- "C:/Users/Thomas Huet/Documents/R/win-library/4.1/iconr/extdata"
nd.df.path <- conv_shp_to_wkt(dataDir = dataDir)
nodes <- read.csv(nd.df.path, sep = ";")
conv_wkt_to_jpg(nodes = nodes)
# morph_nds_compar(nodes, focus = c("panel"))
ldist <- morph_nds_compar(nodes, focus = c("dist"))
morph_aggregate(nodes = nodes, ldist = ldist, aggr = "type")

####

## Set data folder
dataDir <- system.file("extdata", package = "iconr")
## Decoration to be plotted
site <- g$site
decor <- g$decor

plot_dec_grph(nodes = nodes,
              edges = edges,
              imgs = imgs,
              site = g$site,
              decor = g$decor,
              dir = dataDir)

## Read nodes, edges, and decorations
nds.df <- read_nds(site, decor, dataDir)
eds.df <- read_eds(site, decor, dataDir)
imgs <- read.table(paste0(dataDir, "/imgs.tsv"),
                   sep="\t", stringsAsFactors = FALSE)
plot_dec_grph(nds.df,
              eds.df,
              imgs,
              g$site,
              g$decor,
              dir = dataDir,
              lbl.size = 0.4,
              nd.var = "type")


############## gmm ####################

jpgs <- list.files("C:/Rprojects/iconr/doc/dev/gmm/epees", full.names = TRUE)
coo <- Momocs::import_jpg(jpgs)
out <- Momocs::Out(coo)
# panel
Momocs::panel(out)
# stack
out %>%
  coo_center %>%
  coo_scale %>%
  coo_slidedirection("up") %T>%
  print() %>%
  stack()

########### list decor ###########################

library(RPostgreSQL)
library(stringr)
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv,
                 dbname="mailhac_9",
                 host="localhost",
                 port=5432,
                 user="postgres",
                 password="postgres")
sqll <- "SELECT site, numero, img FROM objets where famille LIKE 'stele bouclier'"
df.objects <- dbGetQuery(con,sqll)
dbDisconnect(con)

mycsv <- data.frame(site = character(),
                    decor = character())

# df.objects <- head(df.objects)
df <- str_split(df.objects$img, pattern = "\\\\")
for(i in seq(1, length(df))){
  a.site <- str_replace_all(df[[i]][3], "%20", " ")
  a.decor <- str_replace_all(df[[i]][4], "%20", " ")
  mycsv1 <- data.frame(site = a.site,
                      decor = a.decor)
  mycsv <- rbind(mycsv, mycsv1)
}

write.table(mycsv, "C:/Rprojects/iconr/doc/dev/temp_list.csv", row.names = F, sep = ";")


########### hc #####################################

dataDir <- system.file("extdata", package = "iconr")

imgs_path <- paste0(dataDir, "/imgs.tsv")
nodes_path <- paste0(dataDir, "/nodes.tsv")
edges_path <- paste0(dataDir, "/edges.tsv")
imgs <- read.table(imgs_path, sep="\t", stringsAsFactors = FALSE)
nodes <- read.table(nodes_path, sep="\t", stringsAsFactors = FALSE)
edges <- read.table(edges_path, sep="\t", stringsAsFactors = FALSE)
lgrph <- list_dec(imgs, nodes, edges)

par(mfrow=c(1, 2))
df.same_edges <- same_elements(lgrph, "type", "edges")
df.same_nodes<- same_elements(lgrph, "type", "nodes")
dist.nodes <- dist(as.matrix(df.same_nodes), method = "euclidean")
dist.edges <- dist(as.matrix(df.same_edges), method = "euclidean")
hc.nds <- hclust(dist.nodes, method = "ward.D")
hc.eds <- hclust(dist.edges, method = "ward.D")

plot(hc.nds, main = "Common nodes", cex = .8)
plot(hc.eds, main = "Common edges", cex = .8)

library(dendextend)
oldpar <- par(no.readonly = TRUE)
on.exit(par(oldpar))
par(mfrow=c(1, 2))
dend.nds <- as.dendrogram(hc.nds)
dend.eds <- as.dendrogram(hc.eds)
png("C:/Rprojects/iconr/doc/img/hc_compar.png", width = 700, units = "px")
dendlist(dend.nds, dend.eds) %>%
  untangle(method = "step1side") %>%
  tanglegram(columns_width = c(6, 1, 6),
             main_left = "Common nodes",
             main_right = "Common edges",
             lab.cex = 1.3,
             cex_main = 1.5,
             highlight_branches_lwd = F)
dev.off()

imgs_path <- paste0(dataDir, "/imgs.tsv")
imgs <- read.table(imgs_path, sep="\t", stringsAsFactors = FALSE)
knitr::kable(imgs) %>%
  kableExtra::kable_styling(full_width = FALSE, position = "center", font_size=12)


########### metadata ##############################

# cf. Python file

########## shape analysis ##########################

dataDir <- "C:/Rprojects/eamena-arches-dev/projects/caravanserail"
nodes <- conv_geojson_to_wkt(dataDir = dataDir)
conv_wkt_to_jpg(nodes = nodes,
                ids = "site",
                dataDir = dataDir,
                out.dir = "_out")

# dataDir <- "C:/Rprojects/eamena-arches-dev/projects/caravanserail"
# out.dirPath <- paste0(dataDir, "/_out")
# geojson.path <- "C:/Rprojects/eamenaR/inst/extdata/caravanserail_polygon.geojson"
# dir.create(file.path(out.dirPath), showWarnings = FALSE)
# ea.geojson <- geojsonsf::geojson_sf(geojson.path)
# ea.geojson.polygon <- ea.geojson[sf::st_geometry_type(ea.geojson$geometry) == "POLYGON" | sf::st_geometry_type(ea.geojson$geometry) == "MULTIPOLYGON", ]
# # all multi
# ea.geojson.polygon$geometry <- sf::st_cast(ea.geojson.polygon$geometry, "POLYGON")
# # conform to iconr format
# df <- data.frame(site = ea.geojson.polygon[["EAMENA ID"]],
#                  decor = rep("crvn", nrow(ea.geojson.polygon)),
#                  id = rep(1, nrow(ea.geojson.polygon)),
#                  type = rep("caravanserail", nrow(ea.geojson.polygon)),
#                  technlg = rep("-", nrow(ea.geojson.polygon)),
#                  incmplt = rep(0, nrow(ea.geojson.polygon)),
#                  geometry = sf::st_as_text(ea.geojson.polygon$geometry))
# df <- head(df, 50)
# nd.df.path <- paste0(out.dirPath, "/nodes.csv")
# utils::write.csv2(df, nd.df.path, row.names = FALSE)
# print(paste0("nodes dataframe (n = ", nrow(df), ") exported to: '", nd.df.path, "'"))

########### wkt to jpg ##############################

# nodes <- read.csv(nd.df.path, sep = ";")
conv_wkt_to_jpg(nodes = nodes,
                ids = "site",
                dataDir = dataDir,
                out.dir = "_out")
dist <- morph_nds_compar(nodes = nodes,
                         cex = .5,
                         lwd = .5,
                         colored = FALSE,
                         dataDir = dataDir,
                         out.dir = "_out")
mbrshp <- morph_nds_group(nodes = nodes,
                          nb.centers = 2,
                          dataDir = dataDir,
                          out.dir = "_out")
