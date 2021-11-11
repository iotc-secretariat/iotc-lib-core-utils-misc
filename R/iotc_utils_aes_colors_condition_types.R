### CONDITION TYPES ###

## ALIVE

ct.alive.fill = "green"
ct.alive.outline = darken(ct.alive.fill, amount = 0.2)

## STUNNED

ct.stunned.fill = "purple"
ct.stunned.outline = darken(ct.stunned.fill, amount = 0.2)

## UNKNOWN

ct.unknown.fill = "gray"
ct.unknown.outline = darken(ct.unknown.fill, amount = 0.2)

## DEAD

ct.dead.fill = "red"
ct.dead.outline = darken(ct.dead.fill, amount = 0.2)

### UNCLASSIFIED (NA)

ct.uncl.fill = "grey"
ct.uncl.outline = darken(ct.uncl.fill, amount = 0.2)

### CONDITIONS methods

condition_type_colors = data.table(CONDITION_TYPE_CODE = character(), FILL = character(), OUTLINE = character())
condition_type_colors = rbind(condition_type_colors, list("ALIVE",   ct.alive.fill,   ct.alive.outline))
condition_type_colors = rbind(condition_type_colors, list("STUNNED", ct.stunned.fill, ct.stunned.outline))
condition_type_colors = rbind(condition_type_colors, list("DEAD",    ct.dead.fill,    ct.dead.outline))
condition_type_colors = rbind(condition_type_colors, list("UNKNOWN", ct.unknown.fill, ct.unknown.outline))
condition_type_colors = rbind(condition_type_colors, list("UNCL",    ct.uncl.fill,    ct.uncl.outline))

#'Returns the fill / outline colors for a given condition type code
#'@param CONDITION_TYPE_CODE A condition type code
#'@return a one-row data frame with three columns: \code{CONDITION_TYPE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_condition_type = function(condition_type_code = "ALIVE") {
  return (condition_type_colors[condition_type_colors$CONDITION_TYPE_CODE == condition_type_code, ])
}

#'Returns the fill color (as an RGB string) for a given condition type code
#'@param CONDITION_TYPE_CODE A condition type code
#'@return a string representing the RGB code of the fill color for the given condition
#'@export
fill_for_condition_type = function(condition_type_code = "ALIVE") {
  return (colors_for_condition_type(condition_type_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given condition type code
#'@param CONDITION_TYPE_CODE A condition type code
#'@return a string representing the RGB code of the outline color for the given condition
#'@export
outline_for_condition_type = function(condition_type_code = "ALIVE") {
  return (colors_for_condition_type(condition_type_code)$OUTLINE)
}

#'Returns the fill / outline colors for the condition types found within a data set
#'@param data A data set with a \code{CONDITION_TYPE_CODE} column
#'@return a multiple rows data frame with three columns: \code{CONDITION_TYPE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
condition_type_colors_for = function(data) {
  return (condition_type_colors[CONDITION_TYPE_CODE %in% unique(data$CONDITION_TYPE_CODE), ])
}

#'Returns the fill / outline colors for all condition types
#'@return a multiple rows data frame with three columns: \code{CONDITION_TYPE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_condition_type_colors = function() {
  return (condition_type_colors)
}
