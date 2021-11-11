### Species categories

species_categories_colors = data.table(SPECIES_CATEGORY_CODE = character(), FILL = character(), OUTLINE = character())

### BILLFISH species category
sc.billfish.fill = sg.billfish.fill
sc.billfish.outline = darken(sc.billfish.fill, amount = 0.2)

### SEERFISH species group
sc.seerfish.fill = sg.seerfish.fill
sc.seerfish.outline = darken(sc.seerfish.fill, amount = 0.2)

### NERITIC species category
sc.neritic.fill = wp.neri.fill
sc.neritic.outline = darken(sc.neritic.fill, amount = 0.2)

### TEMPERATE species category
sc.temperate.fill = wp.temp.fill
sc.temperate.outline = darken(sc.temperate.fill, amount = 0.2)

### TROPICAL species category
sc.tropical.fill = wp.trop.fill
sc.tropical.outline = darken(sc.tropical.fill, amount = 0.2)

### TUNAS NEI species category
sc.tunas.fill = "blue"
sc.tunas.outline = darken(sc.tunas.fill, amount = 0.2)

### SHARKS species category
sc.sharks.fill = sg.sharks.fill
sc.sharks.outline = darken(sc.sharks.fill, amount = 0.2)

### RAYS species category
sc.rays.fill = "purple"
sc.rays.outline = darken(sc.rays.fill, amount = 0.2)

### SEABIRDS species category
sc.seabirds.fill = "yellow"
sc.seabirds.outline = darken(sc.seabirds.fill, amount = 0.2)

### TURTLES species category
sc.turtles.fill = "green"
sc.turtles.outline = darken(sc.turtles.fill, amount = 0.2)

### CETACEANS species category
sc.cetaceans.fill = "pink"
sc.cetaceans.outline = darken(sc.cetaceans.fill, amount = 0.2)

### OTHERS species group
sc.others.fill = "grey"
sc.others.outline = darken(sc.others.fill, amount = 0.2)

species_categories_colors = rbind(species_categories_colors, list(SC_BILLFISH, sc.billfish.fill, sc.billfish.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_SEERFISH, sc.seerfish.fill, sc.seerfish.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_NERITIC,  sc.neritic.fill,  sc.neritic.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_TEMPERATE,sc.temperate.fill,sc.temperate.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_TROPICAL, sc.tropical.fill, sc.tropical.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_TUNAS_NEI,sc.tunas.fill,    sc.tunas.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_SHARKS,   sc.sharks.fill,   sc.sharks.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_RAYS,     sc.rays.fill,     sc.rays.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_SEABIRDS, sc.seabirds.fill, sc.seabirds.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_TURTLES,  sc.turtles.fill,  sc.turtles.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_CETACEANS,sc.cetaceans.fill,sc.cetaceans.outline))
species_categories_colors = rbind(species_categories_colors, list(SC_OTHERS,   sc.others.fill,   sc.others.outline))

#'Returns the fill / outline colors for a given species category code (one among \code{BILLFISH}, \code{SEERFISH}, \code{NERITIC}, \code{TEMPERATE}, \code{TROPICAL}, \code{TUNAS_NEI}, \code{SHARKS}, \code{RAYS}, \code{SEABIRDS}, \code{TURTLES}, \code{CETACEANS}, \code{OTHERS})
#'@param species_category_code A species category code
#'@return a one-row data frame with three columns: \code{SPECIES_CATEGORY_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_species_category = function(species_category_code = SC_TROPICAL) {
  return (species_categories_colors[species_categories_colors$SPECIES_CATEGORY_CODE == species_category_code, ])
}

#'Returns the fill color (as an RGB string) for a given species category code (one among \code{BILLFISH}, \code{SEERFISH}, \code{NERITIC}, \code{TEMPERATE}, \code{TROPICAL}, \code{TUNAS_NEI}, \code{SHARKS}, \code{RAYS}, \code{SEABIRDS}, \code{TURTLES}, \code{CETACEANS}, \code{OTHERS})
#'@param species_category_code A species category code
#'@return a string representing the RGB code of the fill color for the given species category
#'@export
fill_for_species_category = function(species_category_code = SC_TROPICAL) {
  return (colors_for_species_category(species_category_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given species category code (one among \code{BILLFISH}, \code{SEERFISH}, \code{NERITIC}, \code{TEMPERATE}, \code{TROPICAL}, \code{TUNAS_NEI}, \code{SHARKS}, \code{RAYS}, \code{SEABIRDS}, \code{TURTLES}, \code{CETACEANS}, \code{OTHERS})
#'@param species_category_code A species category code
#'@return a string representing the RGB code of the outline color for the given species category
#'@export
outline_for_species_category = function(species_category_code = SC_TROPICAL) {
  return (colors_for_species_category(species_category_code)$OUTLINE)
}

#'Returns the fill / outline colors for the species categories found within a data set
#'@param data A data set with a \code{SPECIES_CATEGORY_CODE} column
#'@return a multiple rows data frame with three columns: \code{SPECIES_CATEGORY_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
species_category_colors_for = function(data) {
  return (species_categories_colors[species_categories_colors$SPECIES_CATEGORY_CODE %in% unique(data$SPECIES_CATEGORY_CODE),])
}

#'Returns the fill / outline colors for all species categories
#'@return a multiple rows data frame with three columns: \code{SPECIES_CATEGORY_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_species_category_colors = function() {
  return (species_categories_colors)
}
