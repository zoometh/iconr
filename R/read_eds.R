#' Read Edges of a Decoration
#' @name read_eds
#'
#' @description Read edges' information from a file including all edges and extract edges of one decoration. Accepted formats are tab separated values ('tsv'), semicolon separated values ('csv'), or shapefile ('shp').
#'
#' @param site name of the site.
#' @param decor name of the decoration.
#' @param dir path to the working folder, by default it is the working directory.
#' @param edges name of the edges file (a dataframe or a shapefile).
#' @param nodes name of the nodes file (a dataframe or a shapefile).
#' @param format file extension indicating a file format from 'tsv' (tab separated values), 'csv' (semicolon separated values) or 'shp' (shapefile). For 'tsv' and 'csv', the files must include node coordinates (\code{nodes$x}, \code{nodes$y}).
#'
#' @details subset the dataframe of edges depending on 'site' and 'decor'.
#'
#' @return Dataframe of graph edges, including at least the columns "site", "decor", "a", "b", "xa", "ya", "xb", "yb", with values for each edge (row).
#'
#'
#' @examples
#'
#' ## Set data folder
#' dataDir <- system.file("extdata", package = "iconr")
#'
#' # Read .tsv file
#' eds.df <- read_eds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
#'                    dir = dataDir, edges = "edges", format = "tsv")
#' eds.df
#' ## Dataframe of edges
#'
#' # Read shapefile
#' eds.df <- read_eds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
#'                    dir = dataDir, edges = "edges", format = "shp")
#' eds.df
#' ## Dataframe of edges
#'
#' @export
read_eds <- function(site, decor, dir = getwd(),
                     edges = "edges", nodes = "nodes",
                     format = "tsv") {
  `%>%` <- dplyr::`%>%` # used to not load dplyr
  mandatory.columns <- c("site", "decor", "a", "b", "xa", "ya", "xb", "yb")
  eds.shp.coords <- data.frame(xa = numeric(0), ya = numeric(0),
                               xb = numeric(0), yb = numeric(0))
  eds.file <- paste0(dir, "/", edges, ".", format)
  nds.file <- paste0(dir, "/", nodes, ".", format)
  if (file.exists(eds.file) & file.exists(nds.file)) {
    if (format == "tsv" | format == "csv") {
      # choice: tsv or csv read nodes to get coordinates
      nds.df <- read_nds(dir = dir, site = site, decor = decor,
                         nodes = nodes, format = format)
      sep <- c(tsv = "\t", csv = ";")
      eds.df <- utils::read.table(file = eds.file, sep = sep[format],
                                  header = TRUE, stringsAsFactors = FALSE)
      eds.df <- eds.df[eds.df$site  == site &
                         eds.df$decor == decor, ]
      # get coordinates from nodes
      for (a.edge in seq_len(nrow(eds.df))) {
        nd.a <- which(nds.df$id == eds.df$a[a.edge])
        nd.b <- which(nds.df$id == eds.df$b[a.edge])
        a.df <- nds.df[c(nd.a, nd.b), c("x", "y")]
        eds.shp.coords[a.edge, ] <- as.numeric(t(a.df))
      }
      eds.df <- cbind(eds.df, eds.shp.coords)
    }
    if (format == "shp") {
      # choice: shapefile
      eds.shp <- sf::st_read(paste0(dir, "/", edges, ".shp"), quiet = TRUE)
      eds.shp <- eds.shp[eds.shp$site == site & eds.shp$decor == decor, ]
      # collect coordinates
      eds.coord <- sf::st_coordinates(eds.shp)
      eds.coord <- as.data.frame(eds.coord)
      names(eds.coord)[names(eds.coord) == 'L1'] <- 'line'
      eds.coord.a <-
        eds.coord %>%
        dplyr::group_by(line) %>%
        dplyr::filter(dplyr::row_number() == 1)
      eds.coord.a <- as.data.frame(eds.coord.a)
      names(eds.coord.a)[names(eds.coord.a) == 'X'] <- 'xa'
      names(eds.coord.a)[names(eds.coord.a) == 'Y'] <- 'ya'
      eds.coord.b <-
        eds.coord %>%
        dplyr::group_by(line) %>%
        dplyr::filter(dplyr::row_number() == 2)
      eds.coord.b <- as.data.frame(eds.coord.b)
      names(eds.coord.b)[names(eds.coord.b) == 'X'] <- 'xb'
      names(eds.coord.b)[names(eds.coord.b) == 'Y'] <- 'yb'
      eds.coord.a$line <- eds.coord.b$line <- NULL
      # merge with site decor data
      eds.df <- as.data.frame(eds.shp)
      eds.df$geometry <- NULL
      eds.df <- cbind(eds.df, eds.coord.a, eds.coord.b)
    }
  } else {
    stop(paste0("No file called ", eds.file, " and/or ", nds.file))
  }
  if (any(!mandatory.columns %in% colnames(eds.df))) {
    stop(paste0("Not all the mandatory columns are present: ",
                paste(mandatory.columns, collapse = ", ")))
  }
  return(eds.df)
}



