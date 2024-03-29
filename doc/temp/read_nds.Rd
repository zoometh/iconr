% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_nds.R
\name{read_nds}
\alias{read_nds}
\title{Read Nodes of a Decoration}
\usage{
read_nds(site, decor, dir = getwd(), nodes = "nodes", format = "tsv")
}
\arguments{
\item{site}{name of the site.}

\item{decor}{name of the decoration.}

\item{dir}{path to the working folder, by default it is the working directory.}

\item{nodes}{name of the nodes file (a dataframe or a shapefile).}

\item{format}{file extension indicating a file format from 'tsv' (tab separated values), 'csv' (semicolon separated values) or 'shp' (shapefile). For 'tsv' and 'csv', the files must include node coordinates (\code{nodes$x}, \code{nodes$y}).}
}
\value{
Dataframe of graph nodes, including at least the columns "site", "decor", "id", "x", "y", with values for each node (row).
}
\description{
Read nodes' information from a file including all nodes and extract nodes of one decoration. Accepted formats are tab separated values ('tsv'), semicolon separated values ('csv'), or shapefile ('shp').
}
\examples{

# Set data folder
dataDir <- system.file("extdata", package = "iconr")

# Read dataframe of nodes
nds.df <- read_nds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                   dir = dataDir, format = "tsv")

# Read shapefile of nodes
nds.df <- read_nds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                   dir = dataDir, format = "shp")

}
