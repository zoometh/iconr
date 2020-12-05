list_compar <- function(lgrph, nds.var = "type",
                        verbose = FALSE) {
  # Get the vertex names of each graph of the graph list.
  ldec.comp <- utils::combn(1:length(lgrph), 2)  # all pairwise comparisons
  if (verbose) {
    print(paste0("there is ", ncol(ldec.comp), " pairwise comparisons to compute"))
  }
  grphAllcompar <- list()
  for (dec in 1:ncol(ldec.comp)) {
    idx.g <- ldec.comp[, dec]
    if (verbose) {
      tit <- paste0("compare decorations '", lgrph[[idx.g[1]]]$name,
                    "' and '", lgrph[[idx.g[2]]]$name, "'")
      print(paste0("    ", dec, ") ", tit))
    }
    grph <- decorr::eds_compar(lgrph[idx.g], nds.var)
    grph <- decorr::nds_compar(grph, nds.var)
    attributes(grph)$nds.var <- nds.var
    grphAllcompar[[dec]] <- grph
  }
  return(grphAllcompar)
}

nds_compar <- function(grphs, nds.var = "type") {
  g.nds <- lapply(grphs, function(x) named_nodes(x, nds.var))
  common.nodes <- intersect(g.nds[[1]], g.nds[[2]])
  for (i in 1:2) {
    igraph::V(grphs[[i]])$comm <- as.numeric(g.nds[[i]] %in% common.nodes)
  }
  return(grphs)
}

eds_compar <- function(grphs, nds.var = "type") {
  g.eds <- lapply(grphs, function(x) named_edges(x, nds.var))
  common.edges <- intersect(g.eds[[1]], g.eds[[2]])
  for (i in 1:2) {
    igraph::E(grphs[[i]])$comm <- as.numeric(g.eds[[i]] %in% common.edges)
  }
  return(grphs)
}

named_edges <- function(grph, nds.var = "type",
                        directed.types = c(">", "+")) {
  # grph <- lgrph[[5]] ; nds.var = "type" ; directed.types = c(">", "+")
  grph.eds <- igraph::as_data_frame(grph)[, c("from", "type", "to")]
  grph.nds <- igraph::as_data_frame(grph, "vertices")
  grph.eds[c("from", "to")] <-
    grph.nds[unlist(grph.eds[c("from", "to")]), nds.var]
  if (!igraph::is_directed(grph)) {
    directed.eds = grph.eds$type %in% directed.types
    grph.eds[!directed.eds, c("from","to")] <-
      t(apply(grph.eds[!directed.eds, c("from","to")], 1, sort))
    # infix <- "--"
    infix <- "-"
  } else {
    # infix <- "->"
    infix <- "-"
  }
  edges <- apply(grph.eds, 1, paste0, collapse = infix)
  return(disambiguate_duplicates(edges))
}

named_nodes <- function(grph, nds.var = "type") {
  nodes <- igraph::vertex_attr(grph, nds.var)
  return(disambiguate_duplicates(nodes))
}

disambiguate_duplicates <- function(x, marker = "#") {
  while(any(dup <- duplicated(x))) {
    x[dup] <- paste0(x[dup], marker)
  }
  return(x)
}
