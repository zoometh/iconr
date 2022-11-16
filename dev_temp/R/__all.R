options(warn = -1)

Pg.param. <- list("PostgreSQL",
                  "mailhac_9",
                  "localhost",
                  5432,
                  "postgres",
                  "postgres")
dataPath <- "F:/Collaborations et concours/Colloques, seminaires, articles/210906 EAA/"

############################# Composition Analysis ####################################
source(paste0(getwd(), "/R/_x_sqll_iconr.R")) # load sqll on decorations for Compositions
dataDir <- paste0(dataPath, "analyseA")
source(paste0(getwd(), "/R/conv_pg_to_iconr.R"))
conv_pg_to_iconr(dataDir = dataDir,
                 Pg.param = Pg.param.,
                 sqll.obj = sqll.obj.,
                 sqll.ug.pts = sqll.ug.pts.,
                 sqll.edges = sqll.edges.) # only iconr Points
source(paste0(getwd(), "/R/read_nds.R")) # load sqll on decorations for Compositions
site <- "Catal Huyuk"
decor <- "p_taureau_rouge_aeh"
nds.df <- read_nds(site = site,
                   decor = decor,
                   dir = paste0(dataDir, "/Catal Huyuk"),
                   format = "csv")
nds.df$x <- as.numeric(nds.df$x)
nds.df$y <- as.numeric(nds.df$y)
sapply(nds.df, class) # x, y : numeric
# edges <- read.csv2(paste0(dataDir, "/Catal Huyuk/edges.csv"))
# edges$xa <- edges$ya <- edges$xb <- edges$yb <- NA
# write.csv2(edges, paste0(dataDir, "/Catal Huyuk/edges.csv"))
source(paste0(getwd(), "/R/read_eds.R")) # load sqll on decorations for Compositions
eds.df <- read_eds(site = site,
                   decor = decor,
                   dir = paste0(dataDir, "/Catal Huyuk"),
                   edges = "edges",
                   nodes = "nodes",
                   format = "csv")
# eds.df <- eds.df[is.na(eds.df$type), "="]
sapply(eds.df, class) # x, y : numeric

imgs <- read.table(paste0(dataDir, "/Catal Huyuk/imgs.csv"),
                   sep=";", stringsAsFactors = FALSE, header = T)
# rm(plot_dec_grph)
# source(paste0(getwd(), "/R/plot_dec_grph.R")) # load sqll on decorations for Compositions
plot_dec_grph(nodes = nds.df,
              edges = eds.df,
              imgs = imgs,
              site = site,
              decor = decor,
              dir = dir,
              lbl.size = 0.4,
              nd.size = 0.5,
              ed.lwd = 0.7,
              nd.color = 'orange',
              lbl.color = 'orange',
              nd.var = "id",
              img.format= "png")

########################## Shape Analysis ########################################
dataDir <- paste0(dataPath, "analyseB")
source(paste0(getwd(), "/R/_x_sqll_polyg.R")) # load sqll on decorations for Shape ANalysis
# Pg -> .shp
source(paste0(getwd(), "/R/conv_pg_to_shp.R"))
conv_pg_to_shp(dataDir = dataDir,
               Pg.param = Pg.param.,
               sqll.obj = sqll.obj.,
               sqll.ug.polyg = sqll.ug.polyg.) # only Polygon
# .shp -> WKT
source(paste0(getwd(), "/R/conv_shp_to_wkt.R"))
# dataDir <- "F:/Collaborations et concours/Colloques, seminaires, articles/210906 EAA/analyse"
# dataDir <- "F:/Collaborations et concours/Colloques, seminaires, articles/210906 EAA/analyse2"
# out.dir <- paste0(dataDir, "/_out")
nd.df.path <- conv_shp_to_wkt(dataDir = dataDir)
nodes <- read.csv2(nd.df.path)
# nodes <- read.csv2("F:/Collaborations et concours/Colloques, seminaires, articles/210906 EAA/analyseB/_out/nodes.csv")
# # temp
# nodes$abb <- NA
# nodes$abb <- ifelse(nodes$decor == 'stat_2_gref', paste0('AG.2.', nodes$id),
#                     ifelse(nodes$decor == 'stat_5_gref', paste0('AG.5.', nodes$id),
#                            ifelse(nodes$decor == 'crane_afg', paste0('KfH.', nodes$id),
#                                   ifelse(nodes$decor == 'tete_afe_gref', paste0('JER.', nodes$id),
#                                          ifelse(nodes$decor == 'figurine__wx', paste0('QAR.', nodes$id), NA)))))
# nodes$abb <- paste0(abbreviate(nodes$site, 2), ".",
#                     abbreviate(nodes$decor, 3), ".",
#                     nodes$id)
# WKT -> .jpg
source(paste0(getwd(), "/R/conv_wkt_to_jpg.R"))
conv_wkt_to_jpg(nodes = nodes)
# compar shapes with Momocs
source(paste0(getwd(), "/R/morph_nds_compar.R"))
ldist <- morph_nds_compar(nodes, focus = "dist")
source(paste0(getwd(), "/R/morph_aggregate_1.R"))
morph_aggregate(nodes = nodes,
                ldist = ldist,
                aggr = "type")
# resume basic stats
source(paste0(getwd(), "/R/morph_resume.R")) # info resume
morph_resume(dataDir = dataDir,
             nodes = nodes)
# compar
source(paste0(getwd(), "/R/morph_nds_compar.R"))
morph_nds_compar(nodes = nodes,
                 focus = c("stack"))
                 # focus = c("stack", "panel", "PCA"))

# classify 1) dendrog to see nb of clust
# gu.types <- "oeil"
# TODO: add nb.centers for each different type (... gu.types <- unique(nodes$type) ...)
source(paste0(getwd(), "/R/morph_nds_group.R")) # to add in 'iconr'
stats <- morph_nds_group(nodes)
kmean <- morph_nds_group(nodes,
                         # gu.types = gu.types,
                         focus  = "kmeans",
                         nb.centers = 1,
                         out.data = "plot")
# classify 2) resume (map, dendro, meanshapes, etc.)
source(paste0(getwd(), "/R/_x_nds_morph_classif_resume.R")) # not to add in 'iconr'
mbrshp <- nds_morph_group(nodes,
                          gu.types = gu.types,
                          focus  = "kmeans",
                          nb.centers = 3,
                          out.data = "mbrshp")


# spatialize
path.coords <- paste0(dataDir, "/coords_sites.csv")
nds_morph_classif_resume(nodes, gu.types, mbrshp, path.coords, out.data = "all")







