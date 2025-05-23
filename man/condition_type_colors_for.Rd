% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/iotc_utils_aes_colors_condition_types.R
\name{condition_type_colors_for}
\alias{condition_type_colors_for}
\title{Returns the fill / outline colors for the condition types found within a data set}
\usage{
condition_type_colors_for(data)
}
\arguments{
\item{data}{A data set with a \code{CONDITION_TYPE_CODE} column}
}
\value{
a multiple rows data frame with three columns: \code{CONDITION_TYPE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
}
\description{
Returns the fill / outline colors for the condition types found within a data set
}
