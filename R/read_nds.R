read_nds <- function(site, decor, doss = getwd(), nodes = "nodes", dev = ".tsv") {
    nds.file <- paste0(doss, "/", nodes, dev)
    if (file.exists(nds.file)) {
        if (dev == ".tsv") {
            nds.df <- utils::read.table(file = nds.file, sep = "\t", header = TRUE)
        }
        if (dev == ".csv") {
            nds.df <- utils::read.table(file = nds.file, sep = ";", header = TRUE)
        }
        if (dev == ".shp") {
            nds.shp <- rgdal::readOGR(dsn = doss, layer = nodes, verbose = FALSE)
            names(nds.shp@coords) <- c("x", "y")
            nds.df <- cbind(nds.shp@data, nds.shp@coords)
        }
        nds.df <- nds.df[ nds.df$site == site &
                          nds.df$decor == decor, ]
    } else {
        stop(paste0("No file called ", nds.file))
    }
    return(nds.df)
}
