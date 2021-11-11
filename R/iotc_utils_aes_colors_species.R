### Species WP, species group and species colors ###
sp.uncl.fill = "grey"
sp.uncl.outline = darken(sp.uncl.fill, amount = 0.2)

species_colors = data.table(SPECIES_CODE = character(), FILL = character(), OUTLINE = character())
species_colors = rbind(species_colors, list("UNCL", sp.uncl.fill, sp.uncl.outline))

#'Resets the cached species colors table
#'@export
reset_species_colors = function() {
  species_colors = data.table(SPECIES_CODE = character(), FILL = character(), OUTLINE = character())
  species_colors = rbind(species_colors, list("UNCL", sp.uncl.fill, sp.uncl.outline))

  invisible(
    cache_get_or_set(
      AES_COLORS_CACHE,
      cache_key_root("SPECIES"),
      species_colors
    )
  )
}

#'Return the cached species colors table
#'@export
cached_species_colors = function() {
  return(cache_get(
    AES_COLORS_CACHE,
    cache_key_root("SPECIES")
  ))
}

#'Return the cached species colors table
#'@export
update_cached_species_colors = function(species_colors) {
  return(
    cache_set(
      AES_COLORS_CACHE,
      cache_key_root("SPECIES"),
      species_colors
    )
  )
}

#'Adds a new species color configuration
#'@param species_code A species code
#'@param fill Its fill color
#'@param outline Its outline color
#'@export
add_species_colors = function(species_code, fill, outline = darken(fill, 0.2)) {
  species_colors = cached_species_colors()[SPECIES_CODE != species_code]

  update_cached_species_colors(
    rbind(species_colors, list(species_code, fill, outline))
  )
}

# The species_colors table cannot be initialized here, as the actual species should be read from the DB so as to be as dynamic as possible.
# The initialization is deferred and delegated to the iotc.base.common.plots package

#'Returns the fill / outline colors for a given species code (one among the 16 IOTC species codes)
#'@param species_code A species code
#'@return a one-row data frame with three columns: \code{SPECIES_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_species = function(species_code = "YFT") {
  species_colors = cached_species_colors()

  return (species_colors[species_colors$SPECIES_CODE == species_code, ])
}

#'Returns the fill color (as an RGB string) for a given species code (one among the 16 IOTC species codes)
#'@param species_code A species code
#'@return a string representing the RGB code of the fill color for the given species
#'@export
fill_for_species = function(species_code = "YFT") {
  return (colors_for_species(species_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given species code (one among the 16 IOTC species codes)
#'@param species_code A species code
#'@return a string representing the RGB code of the outline color for the given species
#'@export
outline_for_species = function(species_code = "YFT") {
  return (colors_for_species(species_code)$OUTLINE)
}

#'Returns the fill / outline colors for the species found within a data set
#'@param data A data set with a \code{SPECIES_CODE} column
#'@return a multiple rows data frame with three columns: \code{SPECIES_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
species_colors_for = function(data) {
  species_colors = cached_species_colors()

  species = unique(data$SPECIES_CODE)
  return (species_colors[species_colors$SPECIES_CODE %in% species,])
}

#'Returns the fill / outline colors for the 16 IOTC species
#'@return a multiple rows data frame with three columns: \code{SPECIES_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_species_colors = function() {
  species_colors = cached_species_colors()

  return (species_colors)
}

reset_species_colors()
