read_nds <- function(site, decor, doss = getwd(), nodes = "nodes", dev = ".tsv") {
    # site = "Cerro Muriano"; decor = "Cerro Muriano 1"; dev = ".shp"; doss=dataDir
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
            # names(nds.shp@coords) <- c("x", "y")
            # nds.df <- cbind(nds.shp@data, nds.shp@coords)
            # nds.df <- nds.df[ , c("site", "decor", "id", "type", "x", "y")]
        }
        nds.df <- nds.df[ nds.df$site == site &
                          nds.df$decor == decor, ]
    } else {
        stop(paste0("No file called ", nds.file))
    }
    return(nds.df)
}
#
# nds.df <- read_nds(site = sit, decor = dec, dev = ".shp",
#                    doss = system.file("extdata", package = "decorr"))
# nds.df
