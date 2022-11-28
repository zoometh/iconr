[![CRAN status](https://www.r-pkg.org/badges/version/iconr)](https://CRAN.R-project.org/package=iconr)
[![status](https://joss.theoj.org/papers/e68e041e66a613918f76bf43db3f8b02/status.svg)](https://joss.theoj.org/papers/e68e041e66a613918f76bf43db3f8b02)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4767529.svg)](https://doi.org/10.5281/zenodo.4767529)
[![R-CMD-check](https://github.com/zoometh/iconr/workflows/R-CMD-check/badge.svg)](https://github.com/zoometh/iconr/actions) [![Build Status](https://travis-ci.org/zoometh/iconr.svg?branch=master)](https://travis-ci.org/zoometh/iconr)
          
# ***iconr*** package <br> modeling Prehistoric iconography <img src="logo/iconr_logo.png" width='100px' align="right"/>
> Created by [Thomas Huet](mailto:thomashuet7@gmail.com), [Jose M Pozo](mailto:josmpozo@gmail.com), [Craig Alexander](mailto:craiga304@gmail.com)
  
The R package ***iconr*** is grounded in graph theory, spatial analysis ([composition analysis](#iconr-stable-version-the-analysis-of-compositions)), and shape analysis ([geometric morphometric](#iconr-development-version-the-analysis-of-compositions-and-geometric-morphometry)) to offer concepts and functions for modeling Prehistoric iconographic compositions and preparing for further analysis (clustering, typology tree, Harris diagram, etc.). The package purpose is to contribute to cross-cultural comparison through a greater normalization of quantitative analysis.

The theoretical background is as follows: some objects can have a decoration, and a decoration is composed of graphical units (GUs). The whole decoration is considered as a graph and can be analyzed with Graph Theory and compared to other graphs (ie, decorations). As favored [GIS entry](https://zoometh.github.io/iconr/articles/gis.html), GIS indexes can also be used. 

See: how to [contribute](.github/CONTRIBUTING.md) to the next package release, and how to [report an issue](https://github.com/zoometh/iconr/issues) using the [issue template](.github/ISSUE_TEMPLATE.md).
  
## ***iconr*** stable version: the Analysis of Compositions

The ***iconr*** v. 0.1.0 stable version can be installed from the CRAN

```
install.packages("iconr")
```

The v. 0.1.0 allows the analysis of compositions

<center>
  
![](doc/img/solana_voronoi.png){width=800px}
  
</center>
  

Photograph of Solana de Cabañas (Extremadura, Spain) Late Bronze Age stele[^1] [**1**]. Graphical units (GUs) drawing [**2**]. Each GU is recorded with a vertex (POINT) [**3**], and each contiguous vertex (Voronoi cell) is linked with an edge [**4**, **5**]. 

### Overview of the functions for the analysis of compositions

The ***iconr*** v. 0.1.0 functions' descriptions and examples are available on this [website](https://zoometh.github.io/iconr/articles/index.html). 

#### Plot a decoration

Set data folder, select the decoration to be plotted, read files of nodes, edges, and images and plot a decoration

```
dataDir <- system.file("extdata", package = "iconr")
site <- "Brozas" ; decor <- "Brozas"
nds.df <- read_nds(site, decor, dataDir)
eds.df <- read_eds(site, decor, dataDir)
imgs <- read.table(paste0(dataDir, "/imgs.tsv"),
                   sep="\t", stringsAsFactors = FALSE)
plot_dec_grph(nds.df, eds.df, imgs,
              site, decor,
              dir = dataDir,
              lbl.size = 0.4,
              nd.var = "type")
```
  
  
<img src="doc/img/plot_dec_graph.png" align="center"/>
  
#### Common edges

Common edges between pairs of decorations allow to measure the similarities in their composition. Common edges are more accurate than common nodes (see also, [nds_compar()](https://zoometh.github.io/iconr/reference/list_compar.html) and [eds_compar()](https://zoometh.github.io/iconr/reference/list_compar.html))
For example, we plot common edges shared by the three first decorations of the training dataset with the [plot_compar()](https://zoometh.github.io/iconr/reference/plot_compar.html) function 

```
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "iconr"),
                   sep="\t", stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "iconr"),
                    sep="\t", stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "iconr"),
                    sep="\t", stringsAsFactors = FALSE)
lgrph <- list_dec(imgs, nodes, edges)
g.compar <- list_compar(lgrph, nd.var="type")
plot_compar(g.compar, c(1, 2, 3), 
            focus = "edges",
            nd.size = c(0.5, 1.5),
            ed.width = c(1, 2.5),
            dir = dataDir,
            img.format = "png")
```

  
<img src="doc/img/_compar_eds_1_2.png" align="center"/>
<img src="doc/img/_compar_eds_1_3.png" align="center"/>
<img src="doc/img/_compar_eds_2_3.png" align="center"/>

The same result, but in the form of a coincidence matrix, can be obtained with the function [same_elements()](https://zoometh.github.io/iconr/reference/same_elements.html)

## ***iconr*** development version: the Analysis of Compositions and Geometric Morphometry

The ***iconr*** latest version, or development version v. 0.1.1, handle graphical units with POLYGON geometries to perform Geometric Morphometry measurements (GMM). This development version can be downloaded from GitHub

```
devtools::install_github("zoometh/iconr")
```

### Geometric Morphometry measurements' functions overview

The ***iconr*** v. 0.1.1 functions are named `morph_*` (morphology) and `conv_*` (conversions). Find their documentation directly on R (eg, `?morph_nds_compar`). They are performed with the [R package Momocs](https://momx.github.io/Momocs/)

#### Compare GUs' shapes

The [sample dataset](https://github.com/zoometh/iconr/tree/master/doc/datasets/PPN) is composed on 5 decorated objects, belonging from 4 sites of the Near-East Pre-Pottery Neolithic:


<font size="2" align="left">
<table style="width:100%">
	<tr align="center">
		<td>
				<img src="doc/datasets/PPN/Ain Ghazal/Ain Ghazal.stat_2_gref.jpg" width='150px' />
		</td><td>
				<img src="doc/datasets/PPN/Ain Ghazal/Ain Ghazal.stat_5_gref.jpg" width='150px' />
		</td><td>
				<img src="doc/datasets/PPN/Jericho/Jericho.tete_afe_gref.jpg" width='150px' />
		</td><td>
				<img src="doc/datasets/PPN/Kfar Hahoresh/Kfar Hahoresh.crane_afg.jpg" width='150px' />
		</td><td>
				<img src="doc/datasets/PPN/Qarassa/Qarassa.figurine__wx.jpg" width='150px' />
		</td>
	</tr><tr>
			  <th style="padding:5px">Ain Ghazal, statue 2, cache 2</th>
		    <th style="padding:5px">Ain Ghazal, statue 5, cache 2</th>
		    <th style="padding:5px">Jericho, statue A, cache 195</th>
		    <th style="padding:5px">Kfar Hahoresh, modelled skull</th>
		    <th style="padding:5px">Qarassa, bone wand</th>
	</tr>
	</table>
</font>

The graphical units 'faces' ('*visages*'), 'eyes' ('*oeils*'), and 'mouths' ('*bouches*') are drawn in a GIS

<p align="center">
  <img alt="img-name" src="doc/img/gis_gmm.png" width="700">
</p>


#### Resume the GUs geometries

After downloading the PPNB dataset, set 'PPN' as the current working directory (`setwd("*my_path*/PPN"")`), read and convert the 'nodes.csv' Well-Known Text geometries to JPG, and resume information

```
nodes <- read.csv2("*my_path*/PPN/_out/nodes.csv")
conv_wkt_to_jpg(nodes = nodes)
morph_resume(dataDir = "*my_path*/PPN",
             nodes = nodes)
```
  
<img src="doc/img/1_resume.png" align="center"/>

#### Compare the different types of GUs

Stack the countours of 'faces' ('*visages*'), 'eyes' ('*oeils*'), and 'mouths' ('*bouches*')

```
conv_wkt_to_jpg(nodes = nodes)
nodes <- read.csv2("*my_path*/PPN/_out/nodes.csv")
conv_wkt_to_jpg(nodes = nodes)
morph_resume(dataDir = "*my_path*/PPN",
             nodes = nodes)
```

<p align="center">
  <img alt="img-name" src="doc/img/visage_compar_stack.png" width="350">
  <br>
  <img alt="img-name" src="doc/img/oeil_compar_stack.png" width="350">
  <br>
  <img alt="img-name" src="doc/img/bouche_compar_stack.png" width="350">
  <br>
</p>


## Citation

Use the canonical form to cite the package (`citation("iconr")`):
```
@Manual{Huet21pckg,
  title = {iconr: Graphical and Spatial Analysis for Prehistoric Iconography},
  author = {Thomas Huet and Jose Pozo},
  year = {2021},
  note = {R package version 0.1.0},
  url = {https://CRAN.R-project.org/package=iconr},
}
```

The ***iconr*** v. 0.1.0 package has also been published in the [Journal of Open Source Software](https://joss.theoj.org/papers/10.21105/joss.03191) under this BibTex reference:

```
@article{Huet21joss,
  doi = {10.21105/joss.03191},
  url = {https://doi.org/10.21105/joss.03191},
  year = {2021},
  publisher = {The Open Journal},
  volume = {6},
  number = {61},
  pages = {3191},
  author = {Thomas Huet and Jose M. Pozo and Craig Alexander},
  title = {Analysis of Prehistoric Iconography with the R package iconr},
  journal = {Journal of Open Source Software}
}
```


## Next release

### Typology of GUs

***iconr*** aims to use a hierarchical _thesaurus_ (tree-like) with controlled vocabularies for GUs' typology . Identity between GU name and value must be unique (URL). See for example the [whole typological tree](https://zoometh.github.io/iconr/articles/img/typo_gu_ug.html):

<center>
   
[![](doc/img/typology_gu.png)](https://zoometh.github.io/iconr/articles/img/typo_gu_ug.html)
  
</center>
  
  
Or these different subtrees: [geometric](https://zoometh.github.io/iconr/articles/img/typo_gu_geometrique.html), [figurative](https://zoometh.github.io/iconr/articles/img/typo_gu_figuratif.html), [zoomorphic](https://zoometh.github.io/iconr/articles/img/typo_gu_zoomorphe.html), 
[technomorphic](https://zoometh.github.io/iconr/articles/img/typo_gu_technomorphe.html), or [anthropomorphic](https://zoometh.github.io/iconr/articles/img/typo_gu_anthropomorphe.html). Such a structure should also be used for other fields than the GU type (eg, 'technique'). Multi-linguism equivalences -- starting with English --, metadata insertion (EXIF) and standardization of the vocabulary (Dublin Core, CIDOC-CRM) is needed

### Superimpositions

The *diachronic* edge `->-` allows to register the superimposition. The next ***iconr*** will integrate an on-the-fly function allowing to create Harris matrices of GUs when such an edge exists. For example here, the Ibahernando stele shows a Latin writing overlaping a spear and a shield representations

<p align="center">
  <img alt="img-name" src="doc/img/ibahernando.png" width="500">
</p>

### Magic wand

The selection of a colored continuous range can be done from a POINT coordinates (x, y) overlapping this colored range (ie. a GU displayed in black on white background). The next ***iconr*** will integrate a function allowing to extract automatically the shape *behind* the POINTS

<p align="center">
  <img alt="img-name" src="doc/img/solana_magic_wand.png" width="250">
</p>

[^1]: credits Museo Arqueologico de Madrid