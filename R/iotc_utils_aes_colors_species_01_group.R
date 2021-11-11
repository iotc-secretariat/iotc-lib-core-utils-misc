### Species groups

species_groups_colors = data.table(SPECIES_GROUP_CODE = character(), FILL = character(), OUTLINE = character())

### BILLFISH species group
sg.billfish.fill = wp.bill.fill
sg.billfish.outline = darken(sg.billfish.fill, amount = 0.2)

### SEERFISH species group
sg.seerfish.fill = darken(wp.neri.fill, amount = 0.2)
sg.seerfish.outline = darken(sg.seerfish.fill, amount = 0.2)

### TUNAS species group
sg.tunas.fill = wp.trop.fill
sg.tunas.outline = darken(sg.tunas.fill, amount = 0.2)

### SHARKS species group
sg.sharks.fill = wp.byct.fill
sg.sharks.outline = darken(sg.sharks.fill, amount = 0.2)

### OTHERS species group
sg.others.fill = "grey"
sg.others.outline = darken(sg.others.fill, amount = 0.2)

species_groups_colors = rbind(species_groups_colors, list(SG_BILLFISH, sg.billfish.fill, sg.billfish.outline))
species_groups_colors = rbind(species_groups_colors, list(SG_SEERFISH, sg.seerfish.fill, sg.seerfish.outline))
species_groups_colors = rbind(species_groups_colors, list(SG_TUNAS,    sg.tunas.fill,    sg.tunas.outline))
species_groups_colors = rbind(species_groups_colors, list(SG_SHARKS,   sg.sharks.fill,   sg.sharks.outline))
species_groups_colors = rbind(species_groups_colors, list(SG_OTHERS,   sg.others.fill,   sg.others.outline))

#'Returns the fill / outline colors for a given species group code (one among \code{SG_BILLFISH}, \code{SG_SEERFISH}, \code{SG_TUNAS}, \code{SG_SHARKS}, \code{SG_OTHER} and \code{OTHR})
#'@param species_group_code A species group code
#'@return a one-row data frame with three columns: \code{SPECIES_GROUP_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_species_group = function(species_group_code = SG_TUNAS) {
  return (species_groups_colors[species_groups_colors$SPECIES_GROUP_CODE == species_group_code, ])
}

#'Returns the fill color (as an RGB string) for a given species group code (one among \code{SG_BILLFISH}, \code{SG_SEERFISH}, \code{SG_TUNAS}, \code{SG_SHARKS}, \code{SG_OTHER} and \code{OTHR})
#'@param species_group_code A species group code
#'@return a string representing the RGB code of the fill color for the given species group
#'@export
fill_for_species_group = function(species_group_code = SG_TUNAS) {
  return (colors_for_species_group(species_group_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given species group code (one among \code{SG_BILLFISH}, \code{SG_SEERFISH}, \code{SG_TUNAS}, \code{SG_SHARKS}, \code{SG_OTHER} and \code{OTHR})
#'@param species_group_code A species group code
#'@return a string representing the RGB code of the outline color for the given species group
#'@export
outline_for_species_group = function(species_group_code = SG_TUNAS) {
  return (colors_for_species_group(species_group_code)$OUTLINE)
}

#'Returns the fill / outline colors for the species groups found within a data set
#'@param data A data set with a \code{SPECIES_GROUP_CODE} column
#'@return a multiple rows data frame with three columns: \code{SPECIES_GROUP_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
species_group_colors_for = function(data) {
  return (species_groups_colors[species_groups_colors$SPECIES_GROUP_CODE %in% unique(data$SPECIES_GROUP_CODE),])
}

#'Returns the fill / outline colors for all species groups
#'@return a multiple rows data frame with three columns: \code{SPECIES_GROUP_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_species_group_colors = function() {
  return (species_groups_colors)
}
