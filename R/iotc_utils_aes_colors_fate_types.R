### FATE TYPES ###

# RETAINED

ft.retained.fill = "green"
ft.retained.outline = darken(ft.retained.fill, amount = 0.2)

# ESCAPED

ft.escaped.fill = "orange"
ft.escaped.outline = darken(ft.escaped.fill, amount = 0.2)

# DISCARDED

ft.discarded.fill = "red"
ft.discarded.outline = darken(ft.discarded.fill, amount = 0.2)

### UNCLASSIFIED (NA)

ft.uncl.fill = "grey"
ft.uncl.outline = darken(ft.uncl.fill, amount = 0.2)

### FATE TYPES methods

fate_type_colors = data.table(FATE_TYPE_CODE = character(), FILL = character(), OUTLINE = character())
fate_type_colors = rbind(fate_type_colors, list("RETAINED",  ft.retained.fill,  ft.retained.outline))
fate_type_colors = rbind(fate_type_colors, list("ESCAPED",   ft.escaped.fill,   ft.escaped.outline))
fate_type_colors = rbind(fate_type_colors, list("DISCARDED", ft.discarded.fill, ft.discarded.outline))
fate_type_colors = rbind(fate_type_colors, list("UNCL",      ft.uncl.fill,      ft.uncl.outline))

#'Returns the fill / outline colors for a given fate type code
#'@param fate_type_code A fate type code
#'@return a one-row data frame with three columns: \code{fate_type_code}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_fate_type = function(fate_type_code = "RETAINED") {
  return (fate_type_colors[fate_type_colors$FATE_TYPE_CODE == fate_type_code, ])
}

#'Returns the fill color (as an RGB string) for a given fate type code
#'@param fate_type_code A fate type code
#'@return a string representing the RGB code of the fill color for the given fate type
#'@export
fill_for_fate_type = function(fate_type_code = "RETAINED") {
  return (colors_for_fate_type(fate_type_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given fate type code
#'@param fate_type_code A fate type code
#'@return a string representing the RGB code of the outline color for the given fate type
#'@export
outline_for_fate_type = function(fate_type_code = "RETAINED") {
  return (colors_for_fate_type(fate_type_code)$OUTLINE)
}

#'Returns the fill / outline colors for the fate types found within a data set
#'@param data A data set with a \code{fate_type_code} column
#'@return a multiple rows data frame with three columns: \code{fate_type_code}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
fate_type_colors_for = function(data) {
  return (fate_type_colors[FATE_TYPE_CODE %in% unique(data$FATE_TYPE_CODE), ])
}

#'Returns the fill / outline colors for all fate types
#'@return a multiple rows data frame with three columns: \code{fate_type_code}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_fate_type_colors = function() {
  return (fate_type_colors)
}
