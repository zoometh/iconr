library(archdata)
library(fmsb)

data(EWBurials)

# Library

# Create data: note in High school for Jonathan:
data <- as.data.frame(matrix( sample( 2:20 , 10 , replace=T) , ncol=10))
colnames(data) <- c("math" , "english" , "biology" , "music" , "R-coding", "data-viz" , "french" , "physic", "statistic", "sport" )

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data <- rbind(rep(20,10) , rep(0,10) , data)

# Check your data, it has to look like this!
# head(data)

# The default radar chart 
radarchart(data)

df <- as.data.frame(t(as.data.frame(table(EWBurials$Direction))))
missing.dir <- setdiff(1:360, as.numeric(df[1,]))
colnames(df) <- df[1,]
df <- df[2,]
df <- cbind(df,  setNames(rep(list(0), length(missing.dir)), missing.dir))
col.ord <- as.character(1:360)
df <- df[ , col.ord] # reorder
vals <- df[1, ]
df[1, ] <- rep(3, ncol(df))
df[2, ] <- rep(0, ncol(df))
df[3, ] <- vals

radarchart(df)
