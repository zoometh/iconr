#' @export
read_nds <- function(site, decor,
                     dir = getwd(), nodes = "nodes", format = "tsv") {
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
