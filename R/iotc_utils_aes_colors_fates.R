### FATES ###

# RETAINED

# RFL

fa.rfl.fill = "green"
fa.rfl.outline = darken(fa.rfl.fill, amount = 0.2)

# RFT
fa.rft.fill = lighten(fa.rfl.fill, amount = 0.2)
fa.rft.outline = darken(fa.rft.fill, amount = 0.2)

# RFR
fa.rfr.fill = lighten(fa.rft.fill, amount = 0.2)
fa.rfr.outline = darken(fa.rfr.fill, amount = 0.2)

# RCC
fa.rcc.fill = lighten(fa.rfr.fill, amount = 0.2)
fa.rcc.outline = darken(fa.rcc.fill, amount = 0.2)

# ESCAPED

fa.esc.fill = "orange"
fa.esc.outline = darken(fa.esc.fill, amount = 0.2)

# DISCARDED

# DUN
fa.dun.fill = "red"
fa.dun.outline = darken(fa.dun.fill, amount = 0.2)

# DUS
fa.dus.fill = lighten(fa.dun.fill, amount = 0.2)
fa.dus.outline = darken(fa.dus.fill, amount = 0.2)

# DTS
fa.dts.fill = lighten(fa.dus.fill, amount = 0.2)
fa.dts.outline = darken(fa.dts.fill, amount = 0.2)

# DUD
fa.dud.fill = lighten(fa.dts.fill, amount = 0.2)
fa.dud.outline = darken(fa.dud.fill, amount = 0.2)

# DRB
fa.drb.fill = lighten(fa.dud.fill, amount = 0.2)
fa.drb.outline = darken(fa.drb.fill, amount = 0.2)

# DFR
fa.dfr.fill = lighten(fa.drb.fill, amount = 0.2)
fa.dfr.outline = darken(fa.dfr.fill, amount = 0.2)

# DPQ
fa.dpq.fill = lighten(fa.dfr.fill, amount = 0.2)
fa.dpq.outline = darken(fa.dpq.fill, amount = 0.2)

### UNCLASSIFIED (NA)

fa.uncl.fill = "grey"
fa.uncl.outline = darken(fa.uncl.fill, amount = 0.2)

### FATES methods

fate_colors = data.table(FATE_CODE = character(), FILL = character(), OUTLINE = character())
fate_colors = rbind(fate_colors, list("RFL", fa.rfl.fill, fa.rfl.outline))
fate_colors = rbind(fate_colors, list("RFT", fa.rft.fill, fa.rft.outline))
fate_colors = rbind(fate_colors, list("RFR", fa.rfr.fill, fa.rfr.outline))
fate_colors = rbind(fate_colors, list("RCC", fa.rcc.fill, fa.rcc.outline))

fate_colors = rbind(fate_colors, list("ESC", fa.esc.fill, fa.esc.outline))

fate_colors = rbind(fate_colors, list("DUN", fa.dun.fill, fa.dun.outline))
fate_colors = rbind(fate_colors, list("DUS", fa.dus.fill, fa.dus.outline))
fate_colors = rbind(fate_colors, list("DTS", fa.dts.fill, fa.dts.outline))
fate_colors = rbind(fate_colors, list("DUD", fa.dud.fill, fa.dud.outline))
fate_colors = rbind(fate_colors, list("DRB", fa.drb.fill, fa.drb.outline))
fate_colors = rbind(fate_colors, list("DFR", fa.dfr.fill, fa.dfr.outline))
fate_colors = rbind(fate_colors, list("DPQ", fa.dpq.fill, fa.dpq.outline))

fate_colors = rbind(fate_colors, list("UNCL", fa.uncl.fill, fa.uncl.outline))

#'Returns the fill / outline colors for a given fate code
#'@param fate_code A fate code
#'@return a one-row data frame with three columns: \code{FATE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_fate = function(fate_code = "RFL") {
  return (fate_colors[fate_colors$FATE_CODE == fate_code, ])
}

#'Returns the fill color (as an RGB string) for a given fate code
#'@param fate_code A fate code
#'@return a string representing the RGB code of the fill color for the given fate
#'@export
fill_for_fate = function(fate_code = "RFL") {
  return (colors_for_fate(fate_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given fate code
#'@param fate_code A fate code
#'@return a string representing the RGB code of the outline color for the given fate
#'@export
outline_for_fate = function(fate_code = "RFL") {
  return (colors_for_fate(fate_code)$OUTLINE)
}

#'Returns the fill / outline colors for the fates found within a data set
#'@param data A data set with a \code{FATE_CODE} column
#'@return a multiple rows data frame with three columns: \code{FATE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
fate_colors_for = function(data) {
  return (copy(fate_colors[FATE_CODE %in% unique(data$FATE_CODE), ]))
}

#'Returns the fill / outline colors for all fates
#'@return a multiple rows data frame with three columns: \code{FATE_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_fate_colors = function() {
  return (copy(fate_colors))
}
