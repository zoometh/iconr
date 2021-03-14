---
title: 'Analysis of Prehistoric Iconography with the R package iconr'
tags:
  - Iconography
  - Prehistory
  - Graph Theory
  - GIS
authors:
  - name: Thomas Huet
    orcid: 0000-0002-1112-6122
    affiliation: 1
  - name: Jose M Pozo
    orcid: 0000-0002-0759-3510
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

By definition, prehistorical societies are characterized by the absence of a writing system. During, the largest part of human history, and everywhere in the world, symbolic expressions belong mostly to illiterate societies which express themselves with rock-art paintings, pottery decorations, figurines, statuary, etc., and a lot of now disappeared carved woods, textile design, etc. These graphical expressions are the most significant remaining part of humankind's symbolism. At the composition level, the presence of recurrent patterns of signs (i.e., graphical syntax) in meaningful associations indicates the existence of social conventions in the way to display and to read these expressions. Well-established and shared methods to record and study these graphical contents would open the possibility of cross-cultural comparisons at a large scale and over the long-term.

# Statement of need

The inherent variability of ancient iconography has led to considerable problems in its study, drastically limiting the possibility to draw a synthesis of graphic expressions at a large scale and over the long-term:

 + Spatial proximities between the graphic units are not precisely quantified. Graphical units are attached to sub-areas of the support (e.g. upper part of a rock, neck of a pottery, centre of a stele).
 + Groupings -- like graphical units grouped into *figures*, *figures* grouped into *patterns*, *patterns* grouped into *motives*, etc. -- are not self-explanatory and introduce a tedious number of groups and hinder their systematic analysis.
 + Relationships and similarities between these groups are often not self-explanatory and unquantified.
 + Descriptive vocabularies and methods of analysis are site-dependent or period-dependent.

`iconr` is an R package designed to offer a greater normalization of quantitative indexes for iconography studies [@Alexander08; @Huet18a]. It is grounded in graph theory and spatial analysis to offer concepts and functions for modeling prehistoric iconographic compositions and preparing them for further analysis (clustering, typology tree, Harris diagram, etc.). The main principle of the `iconr` package is to consider any iconographic composition (here, 'decoration') as a geometric graph of graphical units. Geometric graphs are also known as *planar graphs* or *spatialized graphs*. Graphical units are decorated surfaces (`POLYGONS`) modeled as nodes (`POINTS`). Separable graphical units showing a main graphical content (e.g. an anthropomorphic figure) are considered as *main* nodes. Graphical units showing a specification of a *main* node (e.g. a sword handed by this anthropomorphic figure) are considered as *attribute* nodes. Each pair of *main* nodes that one thinks contemporary that share a border (*birel*: touches) of their Voronoi cells, are connected by an undirected edge (`LINES`).
  
  
<center>

![GIS view. The Late Bronze Age stele from Solana de Cabañas (Extremadura, Spain). 1. Original photograph (credits: Museo Arqueológico Nacional, Madrid); 2. Archaeological drawing of engraved parts [credits: @DiazGuardamino10]; 3. Digitalization/Polygonization of engraved parts (i.e., graphical units) and calculation of their their centroids (red points); 4. Voronoi diagram of each graphical unit (*seed*) and dual graph of the Voronoi diagram (i.e., Delaunay triangulation); 5. Identification of graphical units' types](https://raw.githubusercontent.com/zoometh/iconr/master/doc/img/solana_voronoi.png)

</center> 

# Overview

The `iconr` package takes in charge of the geometric graphs management (step 5 in the previous figure). Steps 1 to 4 do not need to be included in the package since efficient implementations already exist: graph elements can be drawn directly on the decorated support drawing or photograph, preferably inside a GIS to make easier the calculation of nodes and edges coordinates. The `iconr` package allows the user to i) read data structures of nodes and edges (.tsv, .csv, .shp) and images (.jpg, .png, .tif, .gif, etc.), ii) plot nodes and edges separately, or together (geometric graph), over the decoration picture, iii) compare different decorations depending on common nodes or common edges. The package stable version is on the CRAN [@iconr]; the latest development version is available from GitHub (https://github.com/zoometh/iconr); the package documentation is available at https://zoometh.github.io/iconr/.

# Examples

## Read

Read the nodes of the Cerro Muriano 1 stele (Andalusia, Spain) with the function [`read_nds()`](https://zoometh.github.io/iconr/reference/read_nds.html).

```r
library(iconr)
dataDir <- system.file("extdata", package = "iconr")
site <- "Cerro Muriano"
decor <- "Cerro Muriano 1"
read_nds(site, decor, dataDir)
```
```
##            site           decor id          type        x         y
## 1 Cerro Muriano Cerro Muriano 1  1    personnage 349.8148 -298.3244
## 2 Cerro Muriano Cerro Muriano 1  2        casque 349.8148 -243.9851
## 3 Cerro Muriano Cerro Muriano 1  3         lance 238.4637 -298.3244
## 4 Cerro Muriano Cerro Muriano 1  4      bouclier 446.0222 -381.1697
## 5 Cerro Muriano Cerro Muriano 1  5        peigne 283.0041 -358.0086
## 6 Cerro Muriano Cerro Muriano 1  7 sexe_masculin 342.6884 -427.4917
## 7 Cerro Muriano Cerro Muriano 1  8    lingot_pdb 451.1489 -237.4782
```

## Plot

Plot the Cerro Muriano 1 stele decoration graph with the function [`plot_dec_grph()`](https://zoometh.github.io/iconr/reference/plot_dec_grph.html).

```r
plot_dec_grph(nds.df, eds.df, imgs,
              site, decor, dataDir)
```

<center>

![R view. Cerro Muriano 1 decoration graph. Between two *main* nodes, *normal* edges are shown as plain lines. Between a *main* node and an *attribute* node, *attribute* edges are shown as dotted lines drawing [credits: @DiazGuardamino10]](https://raw.githubusercontent.com/zoometh/iconr/master/doc/img/cm1.png){width=350px}

</center> 

## Compare

Compare and classify the `iconr` decoration training dataset according to pairwise comparisons between decorations based on their common nodes and common edges; functions [`list_dec()`](https://zoometh.github.io/iconr/reference/list_dec.html) and [`same_elements()`](https://zoometh.github.io/iconr/reference/same_elements.html).

```r
imgs <- read.table(file.path(dataDir, "imgs.csv"), sep=";")
nodes <- read.table(file.path(dataDir, "nodes.csv"), sep=";")
edges <- read.table(file.path(dataDir, "edges.csv"), sep=";")
lgrph <- list_dec(imgs, nodes, edges)
df.same_edges <- same_elements(lgrph, "type", "edges")
df.same_nodes<- same_elements(lgrph, "type", "nodes")
dist.nodes <- dist(df.same_nodes, method = "euclidean")
dist.edges <- dist(df.same_edges, method = "euclidean")
hc.nds <- hclust(dist.nodes, method = "ward.D")
hc.eds <- hclust(dist.edges, method = "ward.D") 
par(mfrow=c(1, 2))
plot(hc.nds, main = "Common nodes", cex = .8)
plot(hc.eds, main = "Common edges", cex = .8)
```
<center>

![Results of the hierarchical clustering on the `iconr` decoration training dataset (five Late Bronze Age stelae) on common nodes (left) and common edges (right)](https://raw.githubusercontent.com/zoometh/iconr/master/doc/img/hc.png)

</center> 

# Acknowledgements

This  project was partly  supported  by  LabEx  ARCHIMEDE  from  “Investissement  d’Avenir”  program  ANR-11-LABX-0032-01.

# References
