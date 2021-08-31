#' Resume geometry classes (POINTS, LINES, POLYGON) of all graphical units for each different object.
#' @name resume_geom
#' @description Create a contactsheet of decoration with information on graphical units (GUs) geometries:
#' eg., number of Polygons by types, number of Lines by types, etc.
#'
#' @param dataDir path of the folder storing folders of all decorations
#' @param nodes the 'nodes.csv' dataframe. By default dataDir/_out/nodes.csv
#' @param out.dir path of the output folder, also the name of the 'nodes.csv' folder. By default dataDir/_out
#' @param imgs.format accepted picture formats (see magick image_read)
#'
#'

# library(ggplot2)

resume_geom <- function(dataDir,
                        nodes = NA,
                        # nd.df.path = paste0(dataDir, "/_out/nodes.csv"),
                        out.dir = NA,
                        imgs.format = c(".jpg", ".png", ".gif", ".tiff", "tif")){
  # nodes <- read.csv2(nd.df.path)
  mytheme <- gridExtra::ttheme_default(base_size = 10,
                                       padding = grid::unit(c(1, 1), "mm"))
  linfo <- list()
  lDir <- list.dirs(path = dataDir, full.names = F, recursive = F)
  lDir <- lDir[!grepl("^_", lDir)] # not folder starting with '_*' (_out, _archives, etc.)
  for (site in lDir){
    # site <- "Pozzo delle Capre" ; site <- "Ain Ghazal"
    print (site)
    in.Dir <- paste0(dataDir, "/", site)
    in.Dir.img <- list.files(in.Dir)
    imgs <- unique(grep(paste(imgs.format, collapse="|"),
                        in.Dir.img, value=TRUE))
    if(length(imgs) > 0){
      for(j in 1:length(imgs)){
        # j <- 1
        a.img <- imgs[j]
        img <- unlist(strsplit(a.img, split = "\\.")) # split on "."
        # like "site" "decor" "image format"
        # img.site <- i # img[1]
        img.decor <- img[2]
        tit <- paste0(site, ".", img.decor)
        # abbrev
        tit.abb <- paste0(abbreviate(site, 2), ".",
                          abbreviate(img.decor, 3))
        # filter on nodes df to get basic statistics
        # image
        img.dec <- magick::image_read(paste0(in.Dir, "/", a.img))
        gg.img.dec <- magick::image_ggplot(img.dec)
        gg.img.dec <- gg.img.dec +
          ggplot2::theme(plot.subtitle = ggplot2::element_text(size = 10)) +
          ggplot2::ggtitle(tit) +
          ggplot2::labs(caption = tit.abb)
        # df
        nodes.nd <- nodes[nodes$site == site & nodes$decor == img.decor, ]
        if(nrow(nodes.nd) > 0){
          nodes.nd$geom <- NA
          nodes.nd[grep("POINT", nodes.nd$geometry, value = F), "geom"] <- "POINTS"
          nodes.nd[grep("LINE", nodes.nd$geometry, value = F), "geom"] <- "LINES"
          nodes.nd[grep("POLYGON", nodes.nd$geometry, value = F), "geom"] <- "POLYGS"
          # names(nodes.nd)[names(nodes.nd) == 'incmplt'] <- 'Incmpl'
          nodes.nd <- nodes.nd[, c("type", "geom")]
          nodes.nd.t <- table(nodes.nd)
          nodes.nd.df <- as.data.frame.matrix(nodes.nd.t)
          gb.nodes.nd <- gridExtra::tableGrob(nodes.nd.df, theme = mytheme)
        } else {
          # blank
          gb.nodes.nd <- ggplot2::ggplot() +
            ggplot2::geom_blank()
        }
        linfo[[length(linfo) + 1]] <- gg.img.dec
        linfo[[length(linfo) + 1]] <- gb.nodes.nd
      }
    }
  }
  library(gridExtra) # necessary ? see: https://stackoverflow.com/questions/38983179/do-call-a-function-in-r-without-loading-the-package
  g.all <- do.call("grid.arrange", c(linfo, ncol = 4)) # 8
  g.out <- paste0(out.dir, "/1_resume.png")
  ggplot2::ggsave(file = g.out,
                  g.all,
                  width = 15,
                  height = length(linfo)/2)
}
