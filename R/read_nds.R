read_nds <- function(site, decor, doss = getwd(), nodes = "nodes", dev = ".tsv") {
    nds.file <- paste0(doss, "/", nodes, dev)
    if (file.exists(nds.file)) {
        if (dev == ".tsv") {
            nds.df <- utils::read.table(file = paste0(doss, "/", nodes, 
                dev), sep = "\t", header = TRUE)
        }
        if (dev == ".csv") {
            nds.df <- utils::read.table(file = paste0(doss, "/", nodes, 
                dev), sep = ";", header = TRUE)
        }
        if (dev == ".shp") {
            nds.shp <- rgdal::readOGR(dsn = doss, layer = nodes, verbose = F)
            nds.shp.coords <- nds.shp@coords
            colnames(nds.shp.coords) <- c("x", "y")
            nds.df <- nds.shp@data
            nds.df <- cbind(nds.df, nds.shp.coords)
            nds.df <- nds.df[nds.df[, "site"] == site & nds.df[, "decor"] == 
                decor, ]
        }
        nds.df <- nds.df[nds.df[, "site"] == site & nds.df[, "decor"] == 
            decor, ]
    } else {
        stop(paste0("No file called ", nds.file))
    }
    return(nds.df)
}
