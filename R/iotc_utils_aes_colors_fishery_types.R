### FISHERY TYPES ###

# Artisanal
art.fill = rgb(186, 228, 178, alpha=255, max=255)
art.outline = darken(art.fill, amount=0.2)

# Industrial
ind.fill = darken(rgb(189, 215, 231, alpha=255, max=255), amount=0.2)
ind.outline = darken(ind.fill, amount=0.2)

fishery_type_colors = data.table(FISHERY_TYPE_CODE = character(), FILL = character(), OUTLINE = character())
fishery_type_colors = rbind(fishery_type_colors, list("ART", art.fill, art.outline))
fishery_type_colors = rbind(fishery_type_colors, list("IND", ind.fill, ind.outline))

#'Returns the fill / outline colors for a given fishery type code (one among \code{ART} and \code{IND})
#'@param fishery_type_code A fishery type code
#'@return a one-row data frame with three columns: \code{FISHERY_TYPE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_fishery_type = function(fishery_type_code = "ART") {
  return (fishery_type_colors[fishery_type_colors$FISHERY_TYPE_CODE == fishery_type_code, ])
}

#'Returns the fill color (as an RGB string) for a given fishery type code (one among \code{ART} and \code{IND})
#'@param fishery_type_code A fishery type code
#'@return a string representing the RGB code of the fill color for the given fishery type
#'@export
fill_for_fishery_type = function(fishery_type_code = "ART") {
  return (colors_for_fishery_type(fishery_type_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given fishery type code (one among \code{ART} and \code{IND})
#'@param fishery_type_code A fishery type code
#'@return a string representing the RGB code of the outline color for the given fishery type
#'@export
outline_for_fishery_type = function(fishery_type_code = "ART") {
  return (colors_for_fishery_type(fishery_type_code)$OUTLINE)
}

#'Returns the fill / outline colors for the fishery types found within a data set
#'@param data A data set with a \code{FISHERY_TYPE_CODE} column
#'@return a multiple rows data frame with three columns: \code{FISHERY_TYPE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
fishery_type_colors_for = function(data) {
  fishery_types = unique(data$FISHERY_TYPE_CODE)
  return (fishery_type_colors[fishery_type_colors$FISHERY_TYPE_CODE %in% fishery_types,])
}

#'Returns the fill / outline colors for all fishery types
#'@return a multiple rows data frame with three columns: \code{FISHERY_TYPE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_fishery_type_colors = function() {
  return (fishery_type_colors)
}

