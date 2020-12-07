#' @export
read_eds <- function(site, decor, doss = getwd(),
                     edges = "edges", nodes = "nodes",
                     dev = ".tsv") {
    mandatory.columns <- c("site", "decor", "a", "b", "xa", "ya", "xb", "yb")
    eds.shp.coords <- data.frame(xa = numeric(0), ya = numeric(0),
                                 xb = numeric(0), yb = numeric(0))
    eds.file <- paste0(doss, "/", edges, dev)
    nds.file <- paste0(doss, "/", nodes, dev)
    if (file.exists(eds.file) & file.exists(nds.file)) {
        if (dev == ".tsv" | dev == ".csv") {
            # choice: tsv or csv read nodes to get coordinates
            nds.df <- read_nds(doss = doss, site = site, decor = decor,
                               nodes = nodes, dev = dev)
            sep=c(.tsv = "\t", .csv = ";")
            eds.df <- utils::read.table(file = eds.file, sep = sep[dev], header = TRUE,
                                        stringsAsFactors = FALSE)
            eds.df <- eds.df[eds.df$site  == site &
                             eds.df$decor == decor, ]
            # get coordinates from nodes
            for (a.edge in 1:nrow(eds.df)) {
                nd.a <- which(nds.df$id == eds.df$a[a.edge])
                nd.b <- which(nds.df$id == eds.df$b[a.edge])
                a.df = nds.df[c(nd.a, nd.b), c("x", "y")]
                eds.shp.coords[a.edge, ] <- as.numeric(t(a.df))
            }
            eds.df <- cbind(eds.df, eds.shp.coords)
        }
        if (dev == ".shp") {
            # choice: shapefile
            eds.shp <- rgdal::readOGR(dsn = doss, layer = edges, verbose = FALSE)
            eds.shp <- eds.shp[eds.shp@data$site  == site &
                               eds.shp@data$decor == decor, ]
            # extract edges coordinates
            coords.eds <- lapply(eds.shp@lines,
                                 function(x) x@Lines[[1]]@coords)
            # loop to get coordinates and fill df
            for (a.edge in 1:length(coords.eds)) {
                a.df <- coords.eds[[a.edge]][1:2, 1:2]
                eds.shp.coords[a.edge, ] <- as.numeric(t(a.df))
            }
            eds.df <- cbind(eds.shp@data, eds.shp.coords)
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
