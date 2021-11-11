### RAISING ###

# OS

ra.os.fill = "#1F78B4"
ra.os.outline=darken(ra.os.fill, amount=0.2)

# SD

ra.sd.fill = darken(ra.os.fill, amount = 0.4)
ra.sd.outline=darken(ra.sd.fill, amount=0.2)

# UNCL
ra.uncl.fill = "grey"
ra.uncl.outline = darken(ra.uncl.fill, amount = 0.2)

### RAISING methods

raising_colors = data.table(RAISE_CODE = character(), FILL = character(), OUTLINE = character())
raising_colors = rbind(raising_colors, list("OS", ra.os.fill, ra.os.outline))
raising_colors = rbind(raising_colors, list("SD", ra.sd.fill, ra.sd.outline))
raising_colors = rbind(raising_colors, list("UNCL", ra.uncl.fill, ra.uncl.outline))

#'Returns the fill / outline colors for a given raise code (one among \code{OS}, \code{SD})
#'@param RAISE_CODE A raise code
#'@return a one-row data frame with three columns: \code{RAISE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_raising = function(RAISE_CODE = "OS") {
  return (raising_colors[raising_colors$RAISE_CODE == RAISE_CODE, ])
}

#'Returns the fill color (as an RGB string) for a given raise code (one among \code{OS}, \code{SD})
#'@param RAISE_CODE A raise code
#'@return a string representing the RGB code of the fill color for the given raise code
#'@export
fill_for_raising = function(RAISE_CODE = "OS") {
  return (colors_for_raising(RAISE_CODE)$FILL)
}

#'Returns the outline color (as an RGB string) for a given raise code (one among \code{OS}, \code{SD})
#'@param fishery_group_code A raise code
#'@return a string representing the RGB code of the outline color for the given raise code
#'@export
outline_for_raising = function(RAISE_CODE = "OS") {
  return (colors_for_raising(RAISE_CODE)$OUTLINE)
}

#'Returns the fill / outline colors for the raise codes found within a data set
#'@param data A data set with a \code{RAISE_CODE} column
#'@return a multiple rows data frame with three columns: \code{RAISE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
raising_colors_for = function(data) {
  return (raising_colors[RAISE_CODE %in% unique(data$RAISE_CODE), ])
}

#'Returns the fill / outline colors for all raise codes
#'@return a multiple rows data frame with three columns: \code{RAISE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_raising_colors = function() {
  return (raising_colors)
}
