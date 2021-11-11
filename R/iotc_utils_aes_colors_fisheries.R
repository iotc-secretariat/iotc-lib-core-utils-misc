### FISHERY GROUPS ###

# Purse seines

ps.fill = rgb(251,  74, 106, alpha=255, max=255)
ps.outline = darken(ps.fill, amount=0.2)

# Longlines

ll.fill = rgb( 55,  75, 229, alpha=255, max=255)
ll.outline = darken(ll.fill, amount=0.2)

# Baitboats

bb.fill = rgb(250, 192, 144, alpha=255, max=255)
bb.outline = darken(bb.fill, amount=0.2)

# Gillnets

gn.fill = rgb(215, 228, 189, alpha=255, max=255)
gn.outline = darken(gn.fill, amount=0.2)

# Lines

li.fill = rgb(179, 162, 199, alpha=255, max=255)
li.outline = darken(li.fill, amount=0.2)

# Other fisheries

ot.fill = rgb(144, 144, 144, alpha=255, max=255)
ot.outline = darken(ot.fill, amount=0.2)

### FISHERY GROUPS methods

fishery_group_colors = data.table(FISHERY_GROUP_CODE = character(), FILL = character(), OUTLINE = character())
fishery_group_colors = rbind(fishery_group_colors, list("PS", ps.fill, ps.outline))
fishery_group_colors = rbind(fishery_group_colors, list("LL", ll.fill, ll.outline))
fishery_group_colors = rbind(fishery_group_colors, list("LI", li.fill, li.outline))
fishery_group_colors = rbind(fishery_group_colors, list("BB", bb.fill, bb.outline))
fishery_group_colors = rbind(fishery_group_colors, list("GN", gn.fill, gn.outline))
fishery_group_colors = rbind(fishery_group_colors, list("OT", ot.fill, ot.outline))

#'Returns the fill / outline colors for a given fishery group code (one among \code{PS}, \code{LL}, \code{BB}, \code{GN}, \code{LI}, \code{OT})
#'@param fishery_group_code A fishery group code
#'@return a one-row data frame with three columns: \code{FISHERY_GROUP_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_fishery_group = function(fishery_group_code = "PS") {
  return (fishery_group_colors[fishery_group_colors$FISHERY_GROUP_CODE == fishery_group_code, ])
}

#'Returns the fill color (as an RGB string) for a given fishery group code (one among \code{PS}, \code{LL}, \code{BB}, \code{GN}, \code{LI}, \code{OT})
#'@param fishery_group_code A fishery group code
#'@return a string representing the RGB code of the fill color for the given fishery group
#'@export
fill_for_fishery_group = function(fishery_group_code = "PS") {
  return (colors_for_fishery_group(fishery_group_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given fishery group code (one among \code{PS}, \code{LL}, \code{BB}, \code{GN}, \code{LI}, \code{OT})
#'@param fishery_group_code A fishery group code
#'@return a string representing the RGB code of the outline color for the given fishery group
#'@export
outline_for_fishery_group = function(fishery_group_code = "PS") {
  return (colors_for_fishery_group(fishery_group_code)$OUTLINE)
}

#'Returns the fill / outline colors for the fishery groups found within a data set
#'@param data A data set with a \code{FISHERY_GROUP_CODE} column
#'@return a multiple rows data frame with three columns: \code{FISHERY_GROUP_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
fishery_group_colors_for = function(data) {
  return (fishery_group_colors[FISHERY_GROUP_CODE %in% unique(data$FISHERY_GROUP_CODE), ])
}

#'Returns the fill / outline colors for all fishery groups
#'@return a multiple rows data frame with three columns: \code{FISHERY_GROUP_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_fishery_group_colors = function() {
  return (fishery_group_colors)
}

### FISHERIES ###

# Purse seines log-school
psls.fill = lighten(ps.fill, amount=0.2)
psls.outline = ps.outline

# Purse seines free-school
psfs.fill = lighten(psls.fill, amount=0.2)
psfs.outline = ps.outline

# Purse seines other (includes unclassified school and small PS)
psot.fill = lighten(psfs.fill, amount=0.3)
psot.outline = ps.outline

# Longlines

# Deep-freezing longline
lld.fill = lighten(ll.fill, amount=0.2)
lld.outline = ll.outline

# Fresh longline
llf.fill = lighten(lld.fill, amount=0.2)
llf.outline = ll.outline

# All other longlines (shark / swordfish longlines)
llo.fill = lighten(llf.fill, amount=0.3)
llo.outline = ll.outline

# Baitboats

# Gillnets

# Lines

# Handlines
lih.fill = lighten(li.fill, amount=0.2)
lih.outline = li.outline

# Trolling
lit.fill = lighten(lih.fill, amount=0.2)
lit.outline = li.outline

# Coastal longline

lic.fill = lighten(lit.fill, amount=0.3)
lic.outline = li.outline

# Other fisheries

### fisheries methods

fishery_colors = data.table(FISHERY_CODE = character(), FILL = character(), OUTLINE = character())
fishery_colors = rbind(fishery_colors, list("PSOT", psot.fill, psot.outline))
fishery_colors = rbind(fishery_colors, list("PSFS", psfs.fill, psfs.outline))
fishery_colors = rbind(fishery_colors, list("PSLS", psls.fill, psls.outline))
fishery_colors = rbind(fishery_colors, list("LLO",  llo.fill,  llo.outline))
fishery_colors = rbind(fishery_colors, list("LLF",  llf.fill,  llf.outline))
fishery_colors = rbind(fishery_colors, list("LLD",  lld.fill,  lld.outline))
fishery_colors = rbind(fishery_colors, list("LIC",  lic.fill,  lic.outline))
fishery_colors = rbind(fishery_colors, list("LIT",  lit.fill,  lit.outline))
fishery_colors = rbind(fishery_colors, list("LIH",  lih.fill,  lih.outline))
fishery_colors = rbind(fishery_colors, list("BB",   bb.fill,   bb.outline))
fishery_colors = rbind(fishery_colors, list("GN",   gn.fill,   gn.outline))
fishery_colors = rbind(fishery_colors, list("OT",   ot.fill,   ot.outline))

#'Returns the fill / outline colors for a given fishery code (one among \code{PSLS}, \code{PSFS}, \code{LLD}, \code{LLF}, \code{BB}, \code{GN}, \code{LIH}, \code{LIT}, \code{LIC}, \code{OT})
#'@param fishery_code A fishery code
#'@return a one-row data frame with three columns: \code{FISHERY_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_fishery = function(fishery_code = "PSLS") {
  return (fishery_colors[fishery_colors$FISHERY_CODE == fishery_code, ])
}

#'Returns the fill color (as an RGB string) for a given fishery code (one among \code{PSLS}, \code{PSFS}, \code{LLD}, \code{LLF}, \code{BB}, \code{GN}, \code{LIH}, \code{LIT}, \code{LIC}, \code{OT})
#'@param fishery_code A fishery code
#'@return a string representing the RGB code of the fill color for the given fishery
#'@export
fill_for_fishery = function(fishery_code = "PSLS") {
  return (colors_for_fishery(fishery_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given fishery code (one among \code{PSLS}, \code{PSFS}, \code{LLD}, \code{LLF}, \code{BB}, \code{GN}, \code{LIH}, \code{LIT}, \code{LIC}, \code{OT})
#'@param fishery_code A fishery code
#'@return a string representing the RGB code of the outline color for the given fishery
#'@export
outline_for_fishery = function(fishery_code = "PSLS") {
  return (colors_for_fishery(fishery_code)$OUTLINE)
}

#'Returns the fill / outline colors for the fisheries found within a data set
#'@param data A data set with a \code{FISHERY_CODE} column
#'@return a multiple rows data frame with three columns: \code{FISHERY_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
fishery_colors_for = function(data) {
  fisheries = unique(data$FISHERY_CODE)
  return (fishery_colors[fishery_colors$FISHERY_CODE %in% fisheries,])
}

#'Returns the fill / outline colors for all fisheries
#'@return a multiple rows data frame with three columns: \code{FISHERY_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_fishery_colors = function() {
  return (fishery_colors)
}
