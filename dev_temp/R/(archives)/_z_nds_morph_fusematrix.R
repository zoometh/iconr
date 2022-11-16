library(dplyr)
library(Momocs)
library(analogue)

# # some morphometrics on 'hearts'
# pca <- hearts %>% fgProcrustes(tol=1) %>%
#   coo_slide(ldk=1) %>% efourier(norm=FALSE) %>% PCA()
#


source(paste0(getwd(), "/R/morph_nds_compar.R")) # to add in 'iconr'
ldist <- morph_nds_compar(nodes, focus = "dist")
d1 <- unlist(ldist[[1]]) # n = 10, oeil
d2 <- unlist(ldist[[2]]) # n = 4, tete
d3 <- unlist(ldist[[3]]) # n = 5, bouche
#
# write.xlsx(as.matrix(d1), paste0(dataDir, "/d1.xlsx"))
# write.xlsx(as.matrix(d2), paste0(dataDir, "/d2.xlsx"))
# write.xlsx(as.matrix(d3), paste0(dataDir, "/d3.xlsx"))

df <- as.data.frame(as.matrix(d1))
ldecors <- sapply(strsplit(rownames(df), "\\."), "[[", 2)
df$dec <- ldecors
df.agg <- aggregate(df[, 1:nrow(df)-1], list(df$dec), mean)
tdf.agg <- as.data.frame(t(df.agg))
colnames(tdf.agg) <- tdf.agg[1, ] # colnames = decorations
tdf.agg <- tdf.agg[-1, ]
tdf.agg[, 1:ncol(tdf.agg)] <- sapply(tdf.agg[, 1:ncol(tdf.agg)], as.numeric) # character -> num
# sapply(tdf.agg, class)
ldecors <- sapply(strsplit(rownames(tdf.agg), "\\."), "[[", 2)
tdf.agg$dec <- ldecors
tdf.agg <- aggregate(tdf.agg[, 1:ncol(tdf.agg)-1], list(tdf.agg$dec), mean)
rownames(tdf.agg) <- tdf.agg[, 1] # rownames = decorations
tdf.agg <- tdf.agg[ , -1]
diag(tdf.agg) <- 0

# View(df)
# get the decoration name (second element in a list of list)
# df2$decor <- sapply(strsplit(rownames(df2), "\\."), "[[", 2)
# unique decors
l.uniq.dec <- unique(sapply(strsplit(rownames(df), "\\."), "[[", 2))
sqmatrix <- matrix( , nrow = length(l.uniq.dec),
                    ncol = length(l.uniq.dec))
ddecors <- as.data.frame(sqmatrix)
colnames(ddecors) <- row.names(ddecors) <- l.uniq.dec

for(a.dec in 1:length(ldecors)){
  # i <- 1
  a.dec <- ldecors[i]
  print(a.dec)
  matches.df <- sapply(a.dec, function(x) grep(x,row.names(df)))
  matches <- matches.df[, 1] # get indexes of matches
  aggregate(df[, matches], list(d$Name), mean)
  # rows
  a.dec.df.r <- df[matches, ]
  a.dec.mean.r <- as.numeric(colMeans(a.dec.df.r))
  duplic <- a.dec.mean.r[duplicated(a.dec.mean.r)]# all symetrical value around 0 are delete
  a.dec.mean.r.diag <- replace(a.dec.mean.r, a.dec.mean.r == duplic, 0)
  for(a.match in matches){
    df[a.match, ] <- a.dec.mean.r.diag # duplicate mean on same decor rows
  }
  df <- df[!duplicated(df), ] # rm one row
  # columns
  a.dec.df.c <- df[ , matches]
  a.dec.mean.c <- as.numeric(rowMeans(a.dec.df.c))
  df[ , matches] <- NULL # delete ancient columns
  df[ , a.dec] <- a.dec.mean.c # add new columns
  # duplic <- a.dec.mean.c[duplicated(a.dec.mean.c)]# all symetrical value around 0 are delete
  # a.dec.mean.c.diag <- replace(a.dec.mean.c, a.dec.mean.c == duplic, 0)
  # for(a.match in matches){
  #   df[, a.match] <- a.dec.mean.c # duplicate mean on same decor rows
  # }
  # df <- df[,!duplicated(df)] # rm one row
  #
  # others.col.row.values <- a.dec.mean.r[!a.dec.mean.r == duplic]
  # a.dec.mean.r %>%
  #   filter(n() == 1)
  # others.col.row.names <-
  # ddecors[, a.dec]
}


df2.agg <- aggregate(d[, 3:4], list(d$Name), mean)

df2 %>%
  group_by(decor) %>%
  summarise_at(funs(mean(., na.rm=TRUE)))
df2 %>%
  group_by(decor) %>%
  summarize(Mean = mean())

rownames(m2)

# fuse
all.d <- fuse(d1, d2, d3, weights = c(1/3, 1/3, 1/3))
d.mds <- isoMDS(all.d)
plot(d.mds$points,
     type = "n") # points not visible
text(d.mds$points,
     labels = as.character(rownames(d.mds$points)))

