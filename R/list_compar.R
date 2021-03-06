#' @export
list_compar <- function(lgrph, nd.var = "type",
                        verbose = FALSE) {
  # Get the vertex names of each graph of the graph list.
  # lgrph <- c(1,4)
  ldec.comp <- utils::combn(seq_len(length(lgrph)), 2)
  if (verbose) {
    print(paste0("there is ", ncol(ldec.comp),
                 " pairwise comparisons to compute"))
  }
  grphAllcompar <- list()
  for (dec in seq_len(ncol(ldec.comp))) {
    idx.g <- ldec.comp[, dec]
    if (verbose) {
      tit <- paste0("compare decorations '", lgrph[[idx.g[1]]]$name,
                    "' and '", lgrph[[idx.g[2]]]$name, "'")
      print(paste0("    ", dec, ") ", tit))
    }
    grph <- eds_compar(lgrph[idx.g], nd.var)
    grph <- nds_compar(grph, nd.var)
    attributes(grph)$nd.var <- nd.var
    grphAllcompar[[dec]] <- grph
  }
  return(grphAllcompar)
}

#' @export
nds_compar <- function(grphs, nd.var = "type") {
  g.nds <- lapply(grphs, function(x) iconr::named_elements(x, "nodes", nd.var))
  common.nodes <- intersect(g.nds[[1]], g.nds[[2]])
  for (i in 1:2) {
    igraph::V(grphs[[i]])$comm <- as.numeric(g.nds[[i]] %in% common.nodes)
  }
  return(grphs)
}

#' @export
eds_compar <- function(grphs, nd.var = "type") {
  g.eds <- lapply(grphs, function(x) iconr::named_elements(x, "edges", nd.var))
  common.edges <- intersect(g.eds[[1]], g.eds[[2]])
  for (i in 1:2) {
    igraph::E(grphs[[i]])$comm <- as.numeric(g.eds[[i]] %in% common.edges)
  }
  return(grphs)
}
