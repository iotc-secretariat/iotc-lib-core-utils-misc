### IUCN status ###

# EXTINCTION RISK

# EX
IUCN.ex.fill = "black"
IUCN.ex.outline = darken(IUCN.ex.fill, amount = 0.2)

# EW
IUCN.ew.fill = "deeppink4"
IUCN.ew.outline = darken(IUCN.ew.fill, amount = 0.2)

# RE
IUCN.re.fill = "darkorchid"
IUCN.re.outline = darken(IUCN.re.fill, amount = 0.2)

# Threatened categories

#CR
IUCN.cr.fill = "red"
IUCN.cr.outline = darken(IUCN.cr.fill, amount = 0.2)

#EN
IUCN.en.fill = "orange"
IUCN.en.outline = darken(IUCN.en.fill, amount = 0.2)

#VU
IUCN.vu.fill = "yellow"
IUCN.vu.outline = darken(IUCN.vu.fill, amount = 0.2)

# Other

#NT
IUCN.nt.fill = "greenyellow"
IUCN.nt.outline = darken(IUCN.nt.fill, amount = 0.2)

#LC
IUCN.lc.fill = "green"
IUCN.lc.outline = darken(IUCN.lc.fill, amount = 0.2)

#DD
IUCN.dd.fill = "azure3"
IUCN.dd.outline = darken(IUCN.dd.fill, amount = 0.2)

#NA
IUCN.na.fill = "cornsilk3"
IUCN.na.outline = darken(IUCN.na.fill, amount = 0.2)

#NE
IUCN.ne.fill = "white"
IUCN.ne.outline = darken(IUCN.ne.fill, amount = 0.2)

### UNCLASSIFIED (NA)

IUCN.uncl.fill = "grey"
IUCN.uncl.outline = darken(IUCN.uncl.fill, amount = 0.2)

### IUCN status methods

IUCN_colors = data.table(IUCN_STATUS_CODE = character(), FILL = character(), OUTLINE = character())
IUCN_colors = rbind(IUCN_colors, list("EX", IUCN.ex.fill, IUCN.ex.outline))
IUCN_colors = rbind(IUCN_colors, list("EW", IUCN.ew.fill, IUCN.ew.outline))
IUCN_colors = rbind(IUCN_colors, list("RE", IUCN.re.fill, IUCN.re.outline))

IUCN_colors = rbind(IUCN_colors, list("CR", IUCN.cr.fill, IUCN.cr.outline))
IUCN_colors = rbind(IUCN_colors, list("EN", IUCN.en.fill, IUCN.en.outline))
IUCN_colors = rbind(IUCN_colors, list("VU", IUCN.vu.fill, IUCN.vu.outline))

IUCN_colors = rbind(IUCN_colors, list("NT", IUCN.nt.fill, IUCN.nt.outline))
IUCN_colors = rbind(IUCN_colors, list("LC", IUCN.lc.fill, IUCN.lc.outline))

IUCN_colors = rbind(IUCN_colors, list("DD", IUCN.dd.fill, IUCN.dd.outline))

IUCN_colors = rbind(IUCN_colors, list("NA", IUCN.na.fill, IUCN.na.outline))

IUCN_colors = rbind(IUCN_colors, list("NE", IUCN.ne.fill, IUCN.ne.outline))

IUCN_colors = rbind(IUCN_colors, list("UNCL", IUCN.uncl.fill, IUCN.uncl.outline))

#'Returns the fill / outline colors for a given IUCN status code
#'@param IUCN_STATUS_CODE A IUCN status code
#'@return a one-row data frame with three columns: \code{IUCN_STATUS_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_IUCN_status = function(IUCN_STATUS_CODE = "EN") {
  return (IUCN_colors[IUCN_colors$IUCN_STATUS_CODE == IUCN_STATUS_CODE, ])
}

#'Returns the fill color (as an RGB string) for a given IUCN status code
#'@param IUCN_STATUS_CODE A IUCN status code
#'@return a string representing the RGB code of the fill color for the given fate
#'@export
fill_for_IUCN_status = function(IUCN_STATUS_CODE = "EN") {
  return (colors_for_IUCN_status(IUCN_STATUS_CODE)$FILL)
}

#'Returns the outline color (as an RGB string) for a given IUCN status code
#'@param IUCN_STATUS_CODE A IUCN status code
#'@return a string representing the RGB code of the outline color for the given fate
#'@export
outline_for_IUCN_status = function(IUCN_STATUS_CODE = "EN") {
  return (colors_for_IUCN_status(IUCN_STATUS_CODE)$OUTLINE)
}

#'Returns the fill / outline colors for the IUCN status codes found within a data set
#'@param data A data set with a \code{IUCN_STATUS_CODE} column
#'@return a multiple rows data frame with three columns: \code{IUCN_STATUS_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
IUCN_colors_for = function(data) {
  return (IUCN_colors[IUCN_STATUS_CODE %in% unique(data$IUCN_STATUS_CODE), ])
}

#'Returns the fill / outline colors for all IUCN status codes
#'@return a multiple rows data frame with three columns: \code{IUCN_STATUS_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_IUCN_colors = function() {
  return (IUCN_colors)
}
