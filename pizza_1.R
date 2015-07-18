# To get started we're load the training data and convert it from JSON to a DataFrame
library(rjson)

setwd('/Users/jean-marc/Downloads/kaggle_pizza')
json <- fromJSON(file='train.json')

# Helper functions for converting the JSON data to a dataframe
process_cell <- function(cell) {
  if (is.null(cell) || length(cell) == 0) {
    return(NA)
  }
  if (length(cell)>1) {
    return(paste(cell, collapse='; '))    
  }
  return(cell)
}
process_row <- function(row) unlist(lapply(row, process_cell))

train <- as.data.frame(do.call("rbind", lapply(json, process_row)))

head(train)

# It's yours to take from here!

# new comment