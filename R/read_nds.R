#' @export
read_nds <- function(site, decor, doss = getwd(), nodes = "nodes", dev = ".tsv") {
    mandatory.columns <- c("site", "decor", "id", "x", "y")
    nds.file <- paste0(doss, "/", nodes, dev)
    if (file.exists(nds.file)) {
        if (dev == ".tsv") {
            nds.df <- utils::read.table(file = nds.file, sep = "\t", header = TRUE,
                                        stringsAsFactors = FALSE)
        }
        if (dev == ".csv") {
            nds.df <- utils::read.table(file = nds.file, sep = ";", header = TRUE,
                                        stringsAsFactors = FALSE)
        }
        if (dev == ".shp") {
            nds.shp <- rgdal::readOGR(dsn = doss, layer = nodes, verbose = FALSE)
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
