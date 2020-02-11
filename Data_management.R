##### DATA MANAGEMENT. #########################################################

# rm(list = ls())

##### File management and importation. #########################################

library("dplyr")

FileNames <- dir("All_matrices")

MatrixNames <- FileNames %>% 
  gsub(pattern = ".nex", replacement = "", x = .) %>% 
  gsub(pattern = "_", replacement = " ", x = .)

# Import the matrices with Claddis.

library("Claddis")

x <- 0

for (i in seq_along(FileNames)) {
  
  tryCatch(ReadMorphNexus(paste0("All_matrices/", FileNames[i])),
           
           error = function (err) {
             
             x <<- append(x = x, values = i)
             
           },
           
           finally = next)
  
}

x <- x[-1]

x
