### QUARTERS ###

# Q1
q1.fill = "green"
q1.outline = darken(q1.fill, amount = 0.2)

# Q2
q2.fill    = darken(q1.fill, amount = 0.2)
q2.outline = darken(q2.fill, amount = 0.2)

# Q3
q3.fill    = darken(q2.fill, amount = 0.2)
q3.outline = darken(q3.fill, amount = 0.2)

# Q4
q4.fill    = darken(q3.fill, amount = 0.2)
q4.outline = darken(q4.fill, amount = 0.2)

### UNCLASSIFIED (NA)

qUncl.fill    = "grey"
qUncl.outline = darken(qUncl.fill, amount = 0.2)

### FATES methods

quarter_colors = data.table(QUARTER = character(), FILL = character(), OUTLINE = character())
quarter_colors = rbind(quarter_colors, list("Q1", q1.fill, q1.outline))
quarter_colors = rbind(quarter_colors, list("Q2", q2.fill, q2.outline))
quarter_colors = rbind(quarter_colors, list("Q3", q3.fill, q3.outline))
quarter_colors = rbind(quarter_colors, list("Q4", q4.fill, q4.outline))

quarter_colors = rbind(quarter_colors, list("UNCL", qUncl.fill, qUncl.outline))

#'Returns the fill / outline colors for a given quarter
#'@param quarter_code A quarter
#'@return a one-row data frame with three columns: \code{QUARTER}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_quarter = function(quarter_code = "Q1") {
  return (quarter_colors[quarter_colors$QUARTER == quarter_code, ])
}

#'Returns the fill color (as an RGB string) for a given quarter
#'@param quarter_code A quarter
#'@return a string representing the RGB code of the fill color for the given quarter
#'@export
fill_for_quarter = function(quarter_code = "Q1") {
  return (colors_for_quarter(quarter_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given quarter
#'@param quarter_code A quarter
#'@return a string representing the RGB code of the outline color for the given quarter
#'@export
outline_for_quarter = function(quarter_code = "Q1") {
  return (colors_for_quarter(quarter_code)$OUTLINE)
}

#'Returns the fill / outline colors for the quarters found within a data set
#'@param data A data set with a \code{QUARTER} column
#'@return a multiple rows data frame with three columns: \code{QUARTER}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
quarter_colors_for = function(data) {
  return (copy(quarter_colors[QUARTER %in% unique(data$QUARTER), ]))
}

#'Returns the fill / outline colors for all quarters
#'@return a multiple rows data frame with three columns: \code{QUARTER}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_quarter_colors = function() {
  return (copy(quarter_colors))
}
