---
title: 'iconr: Analysis of Prehistoric Iconography with R'
tags:
 - Iconography
 - Prehistory
 - Graph Theory
 - GIS
authors:
 - name: Thomas Huet^[Custom footnotes for e.g. denoting who the corresponding author is can be included like this.]
  orcid: 0000-0002-1112-6122
  affiliation: "1, 2" # (Multiple affiliations must be quoted)
 - name: Jose M Pozo
  orcid: https://orcid.org/0000-0002-0759-3510
  affiliation: 2
 - name: Craig Alexander
  orcid: 0000-0001-7539-6415
  affiliation: 2
affiliations:
 - name: LabEx ARCHIMEDE, ANR-11-LABX-0032-01
  index: 1
 - name: Independent Researcher
  index: 2
date: 01 April 2021
bibliography: paper.bib
---

# Background

By definition, Prehistorical societies are characterized by the absence of a writing system. During, the largest part of human history, and everywhere in the world, symbolic expressions belong to illiterate societies which express themselves with rock-art paintings, pottery decorations, figurines and statuary, etc., and a lot of now disappeared carved woods, textile design, etc. These graphical expressions are the most significant part of the humankind's symbolism remaining. At the composition level, recognition of meaningful associations of signs and recurrent patterns indicate clearly the existence of social conventions in the way to display and to read these graphical syntax. Well-established and shared methods would necessarily facilitate a precise recording of the graphical content and open to possible cross-cultural comparisons at a large scale and over the long-term.

# Statement of need

Because of the inherent variability of ancient iconography, its study has led to considerable problems limiting drastically the possibility to draw a synthesis of humankind's symbolism at a large scale and over the long-term:

 + unexplicit spatial groupings of graphical units -- like graphical units grouped into *figures*, *figures* grouped into *patterns*, *patterns* grouped into *motives*, etc. -- with tedious number of groups
 + consistency, proximities and relationships between these groups are often implicit and not quantified. It is in particular graphical and spatial proximities between graphical units that are generally not quantified
 + studies develop proper descriptive vocabularies, singular relationships of grouping, idosyncratic methods at site-dependent or period-dependent scales
\end{itemize}

`iconr` is a R package designed to offer a greater normalization of quantitative indexes for iconography studies [@Alexander08; @HuetAlexander15; @Huet18a]. It is grounded in graph theory and spatial analysis to offer concepts and functions for modeling Prehistoric iconographic compositions and preparing for further analysis (clustering, typology tree, Harris diagram, etc.). The main principle of the `iconr` package is to consider any iconographic composition (here, 'decoration') as a geometric graph of graphical units. This geometric graph is also known as a planar graph or spatialized graph. Graphical units are decorated surfaces (`POLYGONS`) modeled as nodes (`POINTS`). When these graphical units are main nodes, and not attribute nodes, they share edges (`LINES`) with one another when their Voronoi cells share a border (*birel*: touches). Finally, 
 
 
<center>

![GIS view. The Late Bronze Age stelae from Solana de Cabañas (Exteremadura, Spain). 1. Original photograph (credits: Museo Arqueológico Nacional, Madrid); 2. Archaeological drawing of engraved parts (credits: @DiazGuardamino10); 3. Digitalisation/Polygonization of engraved parts (i.e., graphical units) and calcul of their their centroids (red points); 4. Voronoi diagram of each graphical units (*seeds*) and dula graph of Voronoi diagram (i.e., Delaunay triangulation); 5. Identification of graphical units' types](https://raw.githubusercontent.com/zoometh/iconr/master/doc/img/solana_voronoi.png)

</center> 

The `iconr` package only takes in charge the management of the geometric graphs (step 5 in the previous figure). Steps 1 to 4, for reasons of implementation, are not necessary: graph elements can be drawn directly on the decorated support drawing or photograph, preferably inside a GIS to make easier the calculation of nodes and edges coordinates. The `iconr` package allows to i) read data structures of nodes and edges (.tsv, .csv, .shp) and images (.jpg, .png, .tif, .gif, etc.), ii) plot nodes and edges separately, or together (geometric graph), over the decoration picture, iii) compare different decorations depending on common nodes or common edges. The package stable version is on the CRAN [@iconr], the latest development version is available from GitHub (https://github.com/zoometh/iconr), the package documentation is available at https://zoometh.github.io/iconr/.

# Example


```r
library(iconr)
par(mfrow=c(1, 2))
# Read imgs, nodes and edges dataframes
imgs <- read.table(system.file("extdata", "imgs.csv", package = "iconr"),
          sep=";", stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.csv", package = "iconr"),
          sep=";", stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.csv", package = "iconr"),
          sep=";", stringsAsFactors = FALSE)
lgrph <- list_dec(imgs, nodes, edges)
df.same_edges <- same_elements(lgrph, "type", "edges")
df.same_nodes<- same_elements(lgrph, "type", "nodes")
dist.nodes <- dist(as.matrix(df.same_nodes), method = "euclidean")
dist.edges <- dist(as.matrix(df.same_edges), method = "euclidean")
hc.nds <- hclust(dist.nodes, method = "ward.D")
hc.eds <- hclust(dist.edges, method = "ward.D") 
plot(hc.nds, main = "Common nodes", cex = .8)
plot(hc.eds, main = "Common edges", cex = .8)
```
<center>

![Results of the hierarchical clustering on the `iconr` decoration training dataset (five Late Bronze Age stelae) on common nodes (left) and common edges (right)](https://raw.githubusercontent.com/zoometh/iconr/master/doc/img/hc.png)

</center> 

# Acknowledgements

This  project was partly  supported  by  LabEx  ARCHIMEDE  from  “Investissement  d’Avenir”  program  ANR-11-LABX-0032-01.

# References
