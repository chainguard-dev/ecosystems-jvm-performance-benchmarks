#
#  JVM Performance Benchmarks
#
#  Copyright (C) 2019 - 2022 Ionut Balosin
#  Website: www.ionutbalosin.com
#  Twitter: @ionutbalosin
#
#  Co-author: Florin Blanaru
#  Twitter: @gigiblender
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

loadLibrary <- function(name) {
  if (!require(name, character.only = TRUE)) {
    install.packages(name)
    library(name, character.only = TRUE)
  }
}

# Load the necessary libraries
loadLibrary("ggplot2")
loadLibrary("svglite")
loadLibrary("styler")
loadLibrary("plyr")

# apply styles to all R and/or Rmd files in the directory
style_dir()

# use a large positive value like 999 to prevent the scientific notation
options(scipen = 999)

# Read the CSV results from file
readJmhCsvResults <- function(file_path) {
  result <- data.frame()

  tryCatch(
    {
      result <- read.csv(file_path, sep = ",", header = TRUE)
    },
    warning = function(w) {
      print(paste("Warning while reading from", file_path, sep = " "))
    },
    error = function(e) {
      print(paste("Error while reading from", file_path, sep = " "))
    }
  )

  result
}

# Write the CSV results to file
writeJmhCsvResults <- function(path, file, data) {
  tryCatch(
    {
      write.table(data, paste(path, file, sep = "/"), sep = ",")
    },
    warning = function(w) {
      print(paste("Warning while writing to", path, sep = " "))
    },
    error = function(e) {
      print(paste("Error while writing from", path, sep = " "))
    }
  )
}
