#' Read Nodes of a Decoration
#' @name read_nds
#'
#' @description Read nodes' information from a file including all nodes and extract nodes of one decoration. Accepted formats are tab separated values ('tsv'), semicolon separated values ('csv'), or shapefile ('shp').
#'
#' @param site name of the site.
#' @param decor name of the decoration.
#' @param dir path to the working folder, by default it is the working directory.
#' @param nodes name of the nodes file (a dataframe or a shapefile).
#' @param format   file extension indicating a file format from 'tsv' (tab separated values), 'csv' (semicolon separated values) or 'shp' (shapefile). For 'tsv' and 'csv', the files must include node coordinates (\code{nodes$x}, \code{nodes$y}).
#'
#'
#' @return Dataframe of graph nodes, including at least the columns "site", "decor", "id", "x", "y", with values for each node (row).
#'
#'
#' @examples
#'
#' # Set data folder
#' dataDir <- system.file("extdata", package = "iconr")
#'
#' # Read dataframe of nodes
#' nds.df <- read_nds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
#'                    dir = dataDir, format = "tsv")
#'
#' # Read shapefile of nodes
#' nds.df <- read_nds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
#'                    dir = dataDir, format = "shp")
#'
#' @export
read_nds <- function(site, decor,
                     dir = getwd(), nodes = "nodes", format = "tsv") {
    # TODO: read WKT (POLYGONS, etc.)
    mandatory.columns <- c("site", "decor", "id", "x", "y")
    nds.file <- paste0(dir, "/", nodes, ".", format)
    if (file.exists(nds.file)) {
        if (format == "tsv") {
            nds.df <- utils::read.table(file = nds.file, sep = "\t",
                                        header = TRUE, stringsAsFactors = FALSE)
        }
        if (format == "csv") {
            nds.df <- utils::read.table(file = nds.file, sep = ";",
                                        header = TRUE, stringsAsFactors = FALSE)
        }
        if (format == "shp") {
            nds.shp <- rgdal::readOGR(dsn = dir, layer = nodes, verbose = FALSE)
            nds.df <- nds.shp@data
            nds.df$x <- nds.shp@coords[ , 1]
            nds.df$y <- nds.shp@coords[ , 2]
        }
        nds.df <- nds.df[ nds.df$site == site &
                          nds.df$decor == decor, ]
    } else {
        stop(paste0("No file called ", nds.file))
    }
    if (any(!mandatory.columns %in% colnames(nds.df))) {
        stop(paste0("Not all the mandatory columns are present: ",
                    paste(mandatory.columns, collapse = ", ")))
    }
    return(nds.df)
}
