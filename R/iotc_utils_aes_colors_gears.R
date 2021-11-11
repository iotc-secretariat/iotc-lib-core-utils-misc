#Also used by iotc_utils_aes_color_species, which is invoked later
AES_COLORS_CACHE = new.env(hash = TRUE)

### Species WP, gear group and gear colors ###

ge.uncl.fill = "grey"
ge.uncl.outline = darken(ge.uncl.fill, amount = 0.2)

gear_colors = data.table(GEAR_CODE = character(), FILL = character(), OUTLINE = character())
gear_colors = rbind(gear_colors, list("UNCL", ge.uncl.fill, ge.uncl.outline))

#'Resets the cached gear colors table
#'@export
reset_gear_colors = function() {
  gear_colors = data.table(GEAR_CODE = character(), FILL = character(), OUTLINE = character())
  gear_colors = rbind(gear_colors, list("UNCL", ge.uncl.fill, ge.uncl.outline))

  invisible(
    cache_get_or_set(
      AES_COLORS_CACHE,
      cache_key_root("GEARS"),
      gear_colors
    )
  )
}

#'Return the cached gear colors table
#'@export
cached_gear_colors = function() {
  return(cache_get(
    AES_COLORS_CACHE,
    cache_key_root("GEARS")
  ))
}

#'Return the cached gear colors table
#'@export
update_cached_gear_colors = function(gear_colors) {
  return(
    cache_set(
      AES_COLORS_CACHE,
      cache_key_root("GEARS"),
      gear_colors
    )
  )
}

#'Adds a new gear color configuration
#'@param gear_code A gear code
#'@param fill Its fill color
#'@param outline Its outline color
#'@export
add_gear_colors = function(gear_code, fill, outline = darken(fill, 0.2)) {
  gear_colors = cached_gear_colors()[GEAR_CODE != gear_code]

  update_cached_gear_colors(
    rbind(gear_colors, list(gear_code, fill, outline))
  )
}

# The gear_colors table cannot be initialized here, as the actual gear should be read from the DB so as to be as dynamic as possible.
# The initialization is deferred and delegated to the iotc.base.common.plots package

#'Returns the fill / outline colors for a given gear code (one among the 16 IOTC gear codes)
#'@param gear_code A gear code
#'@return a one-row data frame with three columns: \code{GEAR_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_gear = function(gear_code = "PS") {
  gear_colors = cached_gear_colors()

  return (gear_colors[gear_colors$GEAR_CODE == gear_code, ])
}

#'Returns the fill color (as an RGB string) for a given gear code
#'@param gear_code A gear code
#'@return a string representing the RGB code of the fill color for the given gear
#'@export
fill_for_gear = function(gear_code = "PS") {
  return (colors_for_gear(gear_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given gear code
#'@param gear_code A gear code
#'@return a string representing the RGB code of the outline color for the given gear
#'@export
outline_for_gear = function(gear_code = "PS") {
  return (colors_for_gear(gear_code)$OUTLINE)
}

#'Returns the fill / outline colors for the gear found within a data set
#'@param data A data set with a \code{GEAR_CODE} column
#'@return a multiple rows data frame with three columns: \code{GEAR_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
gear_colors_for = function(data) {
  gear_colors = cached_gear_colors()

  gear = unique(data$GEAR_CODE)
  return (gear_colors[gear_colors$GEAR_CODE %in% gear,])
}

#'Returns the fill / outline colors for the 16 IOTC gear
#'@return a multiple rows data frame with three columns: \code{GEAR_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_gear_colors = function() {
  gear_colors = cached_gear_colors()

  return (gear_colors)
}

reset_gear_colors()
