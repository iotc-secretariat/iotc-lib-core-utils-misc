### BAR CHART COLOURS: CONDITIONS ###

## ALIVE

# A0

co.a0.fill = "green"
co.a0.outline = darken(co.a0.fill, amount = 0.2)

# A1

co.a1.fill = darken(co.a0.fill, amount = 0.2)
co.a1.outline = darken(co.a1.fill, amount = 0.2)

# A2

co.a2.fill = darken(co.a1.fill, amount = 0.2)
co.a2.outline = darken(co.a2.fill, amount = 0.2)

# A3

co.a3.fill = darken(co.a2.fill, amount = 0.2)
co.a3.outline = darken(co.a3.fill, amount = 0.2)

# AU

co.au.fill = darken(co.a3.fill, amount = 0.2)
co.au.outline = darken(co.au.fill, amount = 0.2)

## STUNNED

co.s.fill = "purple"
co.s.outline = darken(co.s.fill, amount = 0.2)

## UNKNOWN

co.u.fill = "gray"
co.u.outline = darken(co.u.fill, amount = 0.2)

## DEAD

co.d.fill = "red"
co.d.outline = darken(co.d.fill, amount = 0.2)

### UNCLASSIFIED (NA)

co.uncl.fill = "grey"
co.uncl.outline = darken(co.uncl.fill, amount = 0.2)

### CONDITIONS methods

condition_colors = data.table(CONDITION_CODE = character(), FILL = character(), OUTLINE = character())
condition_colors = rbind(condition_colors, list("A0", co.a0.fill, co.a0.outline))
condition_colors = rbind(condition_colors, list("A1", co.a1.fill, co.a1.outline))
condition_colors = rbind(condition_colors, list("A2", co.a2.fill, co.a2.outline))
condition_colors = rbind(condition_colors, list("A3", co.a3.fill, co.a3.outline))
condition_colors = rbind(condition_colors, list("AU", co.au.fill, co.au.outline))

condition_colors = rbind(condition_colors, list("S", co.s.fill, co.s.outline))
condition_colors = rbind(condition_colors, list("U", co.u.fill, co.u.outline))
condition_colors = rbind(condition_colors, list("D", co.d.fill, co.d.outline))

condition_colors = rbind(condition_colors, list("UNCL", co.uncl.fill, co.uncl.outline))

#'Returns the fill / outline colors for a given condition code
#'@param CONDITION_CODE A condition code
#'@return a one-row data frame with three columns: \code{CONDITION_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_condition = function(CONDITION_CODE = "AU") {
  return (condition_colors[condition_colors$CONDITION_CODE == CONDITION_CODE, ])
}

#'Returns the fill color (as an RGB string) for a given condition code
#'@param CONDITION_CODE A condition code
#'@return a string representing the RGB code of the fill color for the given condition
#'@export
fill_for_condition = function(CONDITION_CODE = "AU") {
  return (colors_for_condition(CONDITION_CODE)$FILL)
}

#'Returns the outline color (as an RGB string) for a given condition code
#'@param CONDITION_CODE A condition code
#'@return a string representing the RGB code of the outline color for the given condition
#'@export
outline_for_condition = function(CONDITION_CODE = "AU") {
  return (colors_for_condition(CONDITION_CODE)$OUTLINE)
}

#'Returns the fill / outline colors for the conditions found within a data set
#'@param data A data set with a \code{CONDITION_CODE} column
#'@return a multiple rows data frame with three columns: \code{CONDITION_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
condition_colors_for = function(data) {
  return (condition_colors[CONDITION_CODE %in% unique(data$CONDITION_CODE), ])
}

#'Returns the fill / outline colors for all conditions
#'@return a multiple rows data frame with three columns: \code{CONDITION_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_condition_colors = function() {
  return (condition_colors)
}
