### FISHING GROUNDS ###

# IRWESIO

irwesio.fill = "#1F78B4"
irwesio.outline=darken(irwesio.fill, amount=0.2)

# IREASIO

ireasio.fill = darken(irwesio.fill, amount = 0.4)
ireasio.outline=darken(ireasio.fill, amount=0.2)

### FISHING GROUNDS methods

fishing_ground_colors = data.table(FISHING_GROUND_CODE = character(), FILL = character(), OUTLINE = character())
fishing_ground_colors = rbind(fishing_ground_colors, list("IRWESIO", irwesio.fill, irwesio.outline))
fishing_ground_colors = rbind(fishing_ground_colors, list("IREASIO", ireasio.fill, ireasio.outline))

#'Returns the fill / outline colors for a given fishing ground code (one among \code{IRWESIO}, \code{IREASIO})
#'@param fishing_ground_code A fishing ground code
#'@return a one-row data frame with three columns: \code{FISHING_GROUND_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_fishing_ground = function(fishing_ground_code = "IRWESIO") {
  return (fishing_ground_colors[fishing_ground_colors$FISHING_GROUND_CODE == fishing_ground_code, ])
}

#'Returns the fill color (as an RGB string) for a given fishing ground code (one among \code{IRWESIO}, \code{IREASIO})
#'@param fishing_ground_code A fishing ground code
#'@return a string representing the RGB code of the fill color for the given fishing ground
#'@export
fill_for_fishing_ground = function(fishing_ground_code = "IRWESIO") {
  return (colors_for_fishing_ground(fishing_ground_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given fishing ground code (one among \code{IRWESIO}, \code{IREASIO})
#'@param fishery_group_code A fishing ground code
#'@return a string representing the RGB code of the outline color for the given fishing ground
#'@export
outline_for_fishing_ground = function(fishing_ground_code = "IRWESIO") {
  return (colors_for_fishing_ground(fishing_ground_code)$OUTLINE)
}

#'Returns the fill / outline colors for the fishing grounds found within a data set
#'@param data A data set with a \code{FISHING_GROUND_CODE} column
#'@return a multiple rows data frame with three columns: \code{FISHING_GROUND_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
fishing_ground_colors_for = function(data) {
  return (fishing_ground_colors[FISHING_GROUND_CODE %in% unique(data$FISHING_GROUND_CODE), ])
}

#'Returns the fill / outline colors for all fishing grounds
#'@return a multiple rows data frame with three columns: \code{FISHING_GROUND_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_fishing_ground_colors = function() {
  return (fishing_ground_colors)
}
