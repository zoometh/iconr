library(igraph)
library(visNetwork)
library(dplyr)
library(httr)


#' @name plot_nds_typo
#' @title return the subgraph of the typological tree for parents ("in") or child ("out") of a considered node
#'
#' @param typo.url the path of the folder storing the edges, i.e. the whole typological tree, and the images
#' @param typo.tree the name of the edges file
#' @param tree.nd the node considered in the tree
#' @param tree.mode extract the subtree of 'tree.nd' parents ("in"), or the subtree of 'tree.nd' child ("out")
#' @param vis if TRUE, plot visNetwork graph (i.e. interactive), else plot ggplot graph
#'
#'
plot_nds_typo <- function(typo.url, typo.tree, tree.nd, tree.mode, vis = FALSE){
  # tree.nd <- "figuratif" ; tree.mode <- "out" ; vis <- T
  ### TODO:
  ##- test if tree.nd exists in tree.all:
  # df2 <- as.vector(as.matrix(tree.all))
  # unique(df2)
  ##-multi-lingusim
  # to english, spanish, etc.
  tree.all <- read.table(paste0(typo.url, typo.tree), sep = "\t", header = T)
  g <- igraph::graph_from_data_frame(tree.all, directed = TRUE)
  # subset
  sg <- igraph::subcomponent(g, tree.nd, mode = tree.mode)
  g.typ.ugs <- igraph::induced_subgraph(g, sg)
  if(!vis){
    print ("igraph")
    # classical plot
    urls <- paste0(typo.url, V(g.typ.ugs)$name, ".jpg")
    sz.out <- 100 # to resize
    for(i in 1:length(urls)) {
      # i <- 20  ; 217
      # by default
      V(g.typ.ugs)[i]$img <- paste0(typo.url, "zz_img.jpg") # by default
      tryCatch(
        {
          # image exists
          a.image <- as.raster(magick::image_scale(magick::image_read(urls[i]), sz.out))
          V(g.typ.ugs)[i]$img <- urls[i]
        },
        # warning = function(w) {print(paste("WARNING image", basename(url)));
        #   NaN},
        error = function(e) {
          print(paste0(i, ". ug in 'typo' but not in 'image': '", basename(urls[i]), "' -> 'zz_img.jpg'"))
        })
    }
  }
  if(vis){
    print ("visNetwork")
    tree.all <- igraph::as_data_frame(g.typ.ugs, what = "edges")
    nds.typo <- sort(unique(c(tree.all$from, tree.all$to)))
    nds.typo <- data.frame(id = nds.typo,
                           shape = c("image"),
                           label = nds.typo
    )
    ## images
    # distant
    req <- GET("https://api.github.com/repos/zoometh/iconr/git/trees/master?recursive=1")
    stop_for_status(req)
    filelist <- unlist(lapply(content(req)$tree, "[", "path"), use.names = F)
    nds.img.ls <- grep("doc/ugs/", filelist, value = TRUE, fixed = TRUE)
    nds.img.ls <- gsub("doc/ugs/", "", nds.img.ls) # rm path
    # nds.img.ls <- list.files(ugs.path) # local
    nds.img.jpg <- nds.img.ls[grepl('jpg$', nds.img.ls)] # only jpg
    nds.img.id <- gsub(".jpg", "", nds.img.jpg) # rm jpg
    nds.img <- data.frame(id = nds.img.id,
                          image = paste0(typo.url, nds.img.id, ".jpg")
    )
    nodes.typo <- merge(nds.typo, nds.img, by="id", all.x = T)
    nodes.typo$image[is.na(nodes.typo$image)] <- paste0(typo.url, "zz_img.png")
    root.blob <- "https://github.com/zoometh/iconr/blob/master/doc/ugs/"
    nodes.typo$title <- paste0('<a target="_blank" href = "',
                               paste0(root.blob, nodes.typo$id, ".jpg"),'">',
                               paste0(root.blob, nodes.typo$id, ".jpg"),'</a>')
    # tit <- "<img src='https://raw.github.com/zoometh/iconr/master/logo/iconr_logo.png' width='60px' align='right'/> Graphical units typology"
    tit <- "<a href='https://github.com/zoometh/iconr#readme'><img src='https://raw.github.com/zoometh/iconr/master/logo/iconr_logo.png' width='60px' align='right'/></a> Graphical units typology"
    subtit <- paste0("  - <b>root</b>: ", tree.nd, "<br>",
                     "  - <b>nb nodes</b>: ", nrow(nodes.typo)
    )
    g.typ.ugs <- visNetwork(nodes.typo,
                            tree.all,
                            main = list(text = tit,
                                        style = "font-family:Arial;color:#000000;font-size:25px;text-align:left;"),
                            submain = list(text = subtit,
                                           style = "font-family:Arial;color:#000000;font-size:15px;text-align:left;"),
                            height = "1000px",
                            width = "1000px") %>%
      visNodes(shapeProperties = list(useBorderWithImage = TRUE),
               brokenImage=paste0(typo.url, "zz_img.png") # usefull ?
      )
  }
  return(g.typ.ugs)
}

# url <-'https://raw.github.com/zoometh/iconr/master/doc/ugs/_typology.tsv'
# tree.all <- read.table(url, sep = "\t")
typo.url <-'https://raw.github.com/zoometh/iconr/master/doc/ugs/'
typo.tree <-'_typology.tsv'
vis <- T
g <- plot_nds_typo(typo.url,
                   typo.tree,
                   tree.nd = "chat",
                   tree.mode = "in",
                   vis = vis)
g

########################################"
# Plot / save
if(vis == T){
  g
  visSave(g,
          file = paste0('docs/articles/img/typo_gu_', tree.nd,'.html'),
          selfcontained = TRUE,
          background = "white")
}

if(vis == F){
  set.seed(1)
  l <- layout.norm(layout.reingold.tilford(g),
                   xmin = -1, xmax = 1, ymin = -1, ymax = 1)
  # l <- layout.reingold.tilford(g) # do not work
  lay.r <- (-l[, 2:1]) # rotate
  png(paste0('doc/img/typo_gu_', tree.nd,'.png'),
      height = 7, width = 7, units = "cm",
      res = 300)
  par(mar=c(0, 0, 0, 3)) # margin on the right
  plot.igraph(g,
              layout = lay.r,
              vertex.size = 0,
              vertex.shape = "square", # vertex.color="#00000000",
              vertex.frame.color ="#00000000",
              vertex.label = NA,
              # vertex.label = V(g)$name,
              vertex.label.cex = 0.2,
              vertex.label.color = "black",
              vertex.label.family ="Helvetica",
              vertex.label.dist = 5, # label.degree=pi/2,
              edge.arrow.size = 0,
              edge. = 0,
              width = 0.05)
  # plotting of the images
  # 1:nrow(l)
  buff.rast <- 0.06
  buff.text <- 0.1
  for(i in 1:nrow(lay.r)) {
    # rasterImage(img[[i]], l[i, 1], l[i, 2], l[i, 1], l[i, 2])
    a.image <- as.raster(magick::image_scale(magick::image_read(V(g)[i]$img), sz.out))
    rasterImage(a.image,
                # rasterImage(img[[i]],
                lay.r[i, 1] - buff.rast,
                lay.r[i, 2] - buff.rast,
                lay.r[i, 1] + buff.rast,
                lay.r[i, 2] + buff.rast)
    text(lay.r[i, 1] + buff.text,
         lay.r[i, 2],
         labels = V(g)$name[i],
         adj = 0,
         cex = .3)
  }
  dev.off()
}

