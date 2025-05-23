% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/iotc_utils_aes_colors_species_02_category.R
\name{species_category_colors_for}
\alias{species_category_colors_for}
\title{Returns the fill / outline colors for the species categories found within a data set}
\usage{
species_category_colors_for(data)
}
\arguments{
\item{data}{A data set with a \code{SPECIES_CATEGORY_CODE} column}
}
\value{
a multiple rows data frame with three columns: \code{SPECIES_CATEGORY_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
}
\description{
Returns the fill / outline colors for the species categories found within a data set
}
