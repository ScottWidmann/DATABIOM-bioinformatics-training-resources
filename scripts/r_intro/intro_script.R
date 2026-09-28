# My first script

1+1


cells <- c(1, 2, 3, 4)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE, dimnames=list(rnames, cnames))


wave <- c(700, 520, 475, 200)
light <- c("Red", "Green", "Blue", "Ultraviolet")
vis <- c(TRUE, TRUE, TRUE, FALSE)
mydf <- data.frame(wave, light, vis)
names(mydf) <- c("Wavelength", "Color", "Visible")


write.table(mymatrix, "mymatrix.txt", sep = "\t", quote=FALSE)
write.csv(mydf, "mydf.csv", row.names = FALSE, quote = FALSE)



# Download the UCI Heart Disease (Cleveland) dataset directly rather than
# bundling a copy of third-party data in this repository.
# Source: UCI Machine Learning Repository, "Heart Disease" dataset, Cleveland database.
# https://archive.ics.uci.edu/dataset/45/heart+disease
# Citation: Janosi, A., Steinbrunn, W., Pfisterer, M., & Detrano, R. (1988).
#           Heart Disease [Dataset]. UCI Machine Learning Repository.
col_names <- c("age", "sex", "cp", "trestbps", "chol", "fbs", "restecg",
               "thalach", "exang", "oldpeak", "slope", "ca", "thal", "num")
data_url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"
download.file(data_url, destfile = "processed.cleveland.data.csv")

mycsv <- read.csv("processed.cleveland.data.csv", header = FALSE,
                   col.names = col_names, na.strings = "?")
head(mycsv)

library(tidyverse)
mycsv <- read_csv(data_url, col_names = col_names, na = "?")
head(mycsv)

#Summary stats
summary(mycsv)

#Using the pipe operator ( %>% )
mycsv %>% summary()

#Drop missing values and get summary stats
mycsv %>% drop_na() %>% summary()

#Drop NAs and create a new variable
mycsv_noNAs <- mycsv %>% drop_na()
mycsv_noNAs
mycsv 

#Install DESeq2 Package via BiocManager
BiocManager::install("DESeq2")

library(DESeq2)
