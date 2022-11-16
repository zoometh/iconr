#' Convert Pg geometries to 'iconr' geometries
#' @name conv_pg_to_iconr
#'
#' @description Convert the graphical units (GUs) geometries stored in PostgreSQL into iconr format.
#'
#' @param Pg.param
#' @param Pg.param
#' @return Decoration's images and dataframe
#'
#' @examples
#' @export
conv_pg_to_iconr <- function(dataDir = tempdir(),
                             Pg.param = NA,
                             sqll.obj = NA,
                             sqll.ug.pts = NA,
                             sqll.edges = NA){
  dir.create(dataDir, showWarnings = FALSE) # create 'dataDir' folder if not exist
  dir.create(file.path(dataDir, "/_out"), showWarnings = FALSE) # create 'out' folder if not exist
  # read Pg
  # library("RPostgreSQL") # necessary ??
  drv <- DBI::dbDriver(Pg.param[[1]])
  con <- RPostgres::dbConnect(drv,
                              dbname = Pg.param[[2]],
                              host = Pg.param[[3]],
                              port = Pg.param[[4]],
                              user = Pg.param[[5]],
                              password = Pg.param[[6]])
  objets <- RPostgreSQL::dbGetQuery(con, sqll.obj.)
  # rm objets without imgs
  objets <- objets[objets$img != '', ]
  row.names(objets) <- 1:nrow(objets)
  ## IMAGES
  imgs <- data.frame(idf = character(0),
                     site = character(0),
                     decor = character(0),
                     img = character(0))
  nodes <- data.frame(site = character(0),
                      decor = character(0),
                      id = numeric(0),
                      type = character(0),
                      x = numeric(0),
                      y = numeric(0))
  edges <- data.frame(site = character(0),
                      decor = character(0),
                      a = numeric(0),
                      b = numeric(0),
                      type = character(0))
  for(i in 1:nrow(objets)){
    # loop through objects
    # i <- 1
    a.site <- objets[i, "site"]
    a.decor <- objets[i, "numero"]
    a.img <- objets[i, "img"]
    # object folder
    dir.create(file.path(dataDir, a.site),
               showWarnings = FALSE)
    # get the image name
    a.img.decomp <- unlist(stringr::str_split(a.img, "\\\\"))
    a.img.short <- a.img.decomp[length(a.img.decomp)] # the image
    a.img.short.f <- paste0(a.site, ".", a.decor)
    a.img.short.ext <- unlist(stringr::str_split(a.img.short, "\\."))[2]
    a.img <- gsub("%20", " ", a.img)
    f.copied <- file.copy(from = a.img,
                          to = paste0(dataDir, "/",
                                      a.site, "/",
                                      a.img.short.f, ".",
                                      a.img.short.ext))
    imgs <- rbind(imgs, c(i, a.site, a.decor, paste0(a.img.short.f, ".",
                                                     a.img.short.ext)))
    ## UGs & EDGES
    if(!is.na(sqll.ug.pts)){
      a.ugs <- RPostgreSQL::dbGetQuery(con, sqll.ug.pts)
      nodes <- rbind(a.ugs, nodes)
    }
    if(!is.na(sqll.ug.pts)){
      ## EDGES
      a.edges <- RPostgreSQL::dbGetQuery(con, sqll.edges)
      edges <- rbind(a.edges, edges)
    }
  }
  colnames(imgs) <- c("idf", "site", "decor", "img")
  write.csv2(imgs,
             paste0(dataDir, "/", a.site, "/imgs.csv"),
             row.names = FALSE, dec = ".")
  write.table(nodes,
              paste0(dataDir, "/", a.site, "/nodes.csv"),
              row.names = FALSE, sep = ";", dec = ".")
  edges$type[is.na(edges$type)] <- "="
  write.table(edges,
              paste0(dataDir, "/", a.site, "/edges.csv"),
              row.names = FALSE, sep = ";", dec = ".")
  DBI::dbDisconnect(con)
}
