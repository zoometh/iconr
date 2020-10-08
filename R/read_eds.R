read_eds <- function(site, decor, doss = getwd(), edges = "edges", nodes = "nodes", 
    dev = ".tsv") {
    eds.shp.coords <- data.frame(xa = numeric(0), ya = numeric(0), xb = numeric(0), 
        yb = numeric(0))
    eds.file <- paste0(doss, "/", edges, dev)
    nds.file <- paste0(doss, "/", nodes, dev)
    if (file.exists(eds.file) & file.exists(nds.file)) {
        if (dev == ".tsv" | dev == ".csv") {
            # choice: tsv or csv read nodes to get coordinates
            if (dev == ".tsv") {
                nds.df <- read_nds(doss = doss, site = site, decor = decor, 
                  nodes = "nodes", dev = ".tsv")
                eds.df <- utils::read.table(file = paste0(doss, "/", edges, 
                  dev), sep = "\t", header = TRUE)
            }
            if (dev == ".csv") {
                nds.df <- read_nds(doss = doss, site = site, decor = decor, 
                  nodes = "nodes", dev = ".tsv")
                eds.df <- utils::read.table(file = paste0(doss, "/", edges, 
                  dev), sep = ";", header = TRUE)
            }
            eds.df <- eds.df[eds.df[, "site"] == site & eds.df[, "decor"] == 
                decor, ]
            # get coordinates from nodes
            for (a.edge in 1:nrow(eds.df)) {
                nd.a <- eds.df[a.edge, "a"]
                nd.b <- eds.df[a.edge, "b"]
                xa <- nds.df[nds.df[, "id"] == nd.a, "x"]
                ya <- nds.df[nds.df[, "id"] == nd.a, "y"]
                xb <- nds.df[nds.df[, "id"] == nd.b, "x"]
                yb <- nds.df[nds.df[, "id"] == nd.b, "y"]
                eds.shp.coords[nrow(eds.shp.coords) + 1, ] <- c(xa, ya, 
                  xb, yb)
            }
            eds.df <- cbind(eds.df, eds.shp.coords)
        }
        if (dev == ".shp") {
            # choice: shapefile
            nds.df <- read_nds(doss = doss, site = site, decor = decor, 
                nodes = "nodes", dev = ".shp")
            eds.shp <- rgdal::readOGR(dsn = doss, layer = edges, verbose = F)
            # extract edges coordinates
            coords.eds <- lapply(methods::slot(eds.shp, "lines"), function(x) lapply(methods::slot(x, 
                "Lines"), function(y) methods::slot(y, "coords")))
            # loop to get coordinates and fill df
            for (a.edge in 1:length(coords.eds)) {
                a.df <- coords.eds[[a.edge]][[1]]
                xa <- a.df[1, 1]
                ya <- a.df[1, 2]
                xb <- a.df[2, 1]
                yb <- a.df[2, 2]
                eds.shp.coords[nrow(eds.shp.coords) + 1, ] <- c(xa, ya, 
                  xb, yb)
            }
            eds.df <- eds.shp@data
            eds.df <- cbind(eds.df, eds.shp.coords)
            eds.df <- eds.df[eds.df[, "site"] == site & eds.df[, "decor"] == 
                decor, ]
        }
    } else {
        stop(paste0("No file called ", eds.file, " and/or ", nds.file))
    }
    return(eds.df)
}
