#' @name nds_morph_compar
#' @title convert JPG to morphometrics files
#'
#' @param nodes dataframe of nodes
#' @param focus 'stack' or PCA
#' @param nb.h number of harmonics, by default = 15, uniquely for PCA
#'

library(Momocs)

nds_morph_compar <- function(nodes, focus = c("stack", "PCA"), nb.h = 15, out.dir = getwd()){
  # TODO: include LINES
  # focus  = "PCA"; out.dir
  nodes <- nodes[grep("POLYGON", nodes$geometry, value=F), ] # filter
  fac <- tibble::as_tibble(nodes[, c("site", "numero", "type")]) # attributes
  fac$id <- paste0(fac$site, ".", fac$numero)
  types.folders <- unique(nodes$type)
  for(a.ug.type.name in types.folders){
    # a.ug.type.name <- "oeil"
    # read JPG
    print(paste0("* read '", a.ug.type.name,"' typo"))
    jpgs <- list.files(paste0(out.dir, "/", a.ug.type.name), full.names=TRUE)
    coo <- Momocs::import_jpg(jpgs)
    min.len <- min(lengths(coo))/2
    # reduce nb of points to the lower value for outlines analysis
    for(i in 1:length(coo)){
      a.df <- as.data.frame(coo[i])
      ordered.sample <- sort(sample(nrow(a.df), min.len))
      a.df.sample <- a.df[ordered.sample, ]
      a.mat.sample <- cbind(a.df.sample[ , 1], a.df.sample[ , 2])
      coo[i] <- list(a.mat.sample)
    }
    fac.type <- fac[fac$type == a.ug.type.name, ]
    a.ug.type <- Out(coo, fac.type)
    ## export
    # panel
    out.d <- paste0(out.dir, "/", a.ug.type.name, "_panel.png")
    png(out.d,
        width = 7, height = 7, units = "cm", res = 300)
    panel(a.ug.type,
          fac="id", names=TRUE)
    dev.off()
    print(paste0("panel ", out.d))
    # focus <- focus[1]
    if(focus == "stack"){
      # export
      out.d <- paste0(out.dir, "/", a.ug.type.name, "_stack.png")
      png(out.d,
          width = 7, height = 7, units = "cm", res = 300)
      stack(a.ug.type,
            title = a.ug.type.name)
      dev.off()
      print(paste0("stack ", out.d))
    }
    if(focus == "PCA"){
      # export
      out.d <- paste0(out.dir, "/", a.ug.type.name, "_PCA.png")
      png(out.d,
          width = 7, height = 7, units = "cm", res = 300)
      ef.type <- efourier(a.ug.type, nb.h=10)
      PCA.type <- PCA(ef.type)
      plot(PCA.type)
      dev.off()
      print(paste0("PCA ", out.d))
    }
  }
}
