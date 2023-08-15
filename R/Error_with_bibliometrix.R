##Error with rownames
library(tidyverse)
library(bibliometrix)
path <- paste0(here::here(),"/data/bibliometrix_data")

files<-list.files(path = path, pattern="*).bib", full.names = TRUE)

M1 <- convert2df(files, dbsource = "wos", format = "bibtex")

files2<-list.files(path = path, pattern="*.csv", full.names = TRUE)

M2 <- convert2df(files2, dbsource = "lens", format = "csv")

M <- mergeDbSources(M1, M2, remove.duplicated=TRUE)

A <- cocMatrix(M, Field = "SO", sep = ";")
row.names(M)
any(duplicated(rownames(M)))
class(M)
class(M2)



