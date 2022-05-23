### Species WP

species_wps_colors = data.table(SPECIES_WP_CODE = character(), FILL = character(), OUTLINE = character())

## Neritic tunas
wp.neri.fill = rgb(250, 192, 144, alpha=255, max=255)
wp.neri.outline = darken(wp.neri.fill, amount = 0.2)

## Temperate tunas
wp.temp.fill = rgb(215, 228, 189, alpha=255, max=255)
wp.temp.outline = darken(wp.temp.fill, amount = 0.2)

## Billfish
wp.bill.fill = rgb(179, 162, 199, alpha=255, max=255)
wp.bill.outline = darken(wp.bill.fill, amount = 0.2)

## Ecosystems and bycatch
wp.byct.fill = darken("turquoise" , 0.2)
wp.byct.outline = darken(wp.byct.fill, amount = 0.2)

## Tropical
wp.trop.fill = darken(rgb(185, 205, 229, alpha=255, max=255), amount = 0.2)
wp.trop.outline = darken(wp.trop.fill, amount = 0.2)

# UNCLassified
wp.uncl.fill = "grey"
wp.uncl.outline = darken(wp.uncl.fill, amount = 0.2)

species_wps_colors = rbind(species_wps_colors, list(WP_NERI, wp.neri.fill, wp.neri.outline))
species_wps_colors = rbind(species_wps_colors, list(WP_TEMP, wp.temp.fill, wp.temp.outline))
species_wps_colors = rbind(species_wps_colors, list(WP_BILL, wp.bill.fill, wp.bill.outline))
species_wps_colors = rbind(species_wps_colors, list(WP_BYCT, wp.byct.fill, wp.byct.outline))
species_wps_colors = rbind(species_wps_colors, list(WP_TROP, wp.trop.fill, wp.trop.outline))
species_wps_colors = rbind(species_wps_colors, list(WP_UNCL, wp.uncl.fill, wp.uncl.outline))

#'Returns the fill / outline colors for a given species WP code (one among \code{BILL}, \code{TEMP}, \code{TROP}, \code{NERI}, \code{BYCT} and \code{OTHR})
#'@param species_wp_code A species WP code
#'@return a one-row data frame with three columns: \code{SPECIES_WP_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_species_wp = function(species_wp_code = WP_TROP) {
  return (species_wps_colors[species_wps_colors$SPECIES_WP_CODE == species_wp_code, ])
}

#'Returns the fill color (as an RGB string) for a given species WP code (one among \code{BILL}, \code{TEMP}, \code{TROP}, \code{NERI}, \code{BYCT} and \code{OTHR})
#'@param species_wp_code A species WP code
#'@return a string representing the RGB code of the fill color for the given species WP
#'@export
fill_for_species_wp = function(species_wp_code = WP_TROP) {
  return (colors_for_species_wp(species_wp_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given species WP code (one among \code{BILL}, \code{TEMP}, \code{TROP}, \code{NERI}, \code{BYCT} and \code{OTHR})
#'@param species_wp_code A species WP code
#'@return a string representing the RGB code of the outline color for the given species WP
#'@export
outline_for_species_wp = function(species_wp_code = WP_TROP) {
  return (colors_for_species_wp(species_wp_code)$OUTLINE)
}

#'Returns the fill / outline colors for the species WPs found within a data set
#'@param data A data set with a \code{SPECIES_WP_CODE} column
#'@return a multiple rows data frame with three columns: \code{SPECIES_WP_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
species_wp_colors_for = function(data) {
  return (species_wps_colors[species_wps_colors$SPECIES_WP_CODE %in% unique(data$SPECIES_WP_CODE),])
}

#'Returns the fill / outline colors for all species WPs
#'@return a multiple rows data frame with three columns: \code{SPECIES_WP_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_species_wp_colors = function() {
  return (species_wps_colors)
}
