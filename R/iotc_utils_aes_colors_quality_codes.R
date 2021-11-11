### QUALITY SCORES ###

quality_colors = data.table(QUALITY_CODE = integer(), FILL = character(), OUTLINE = character())

# Score 0

score0.fill = rgb(163, 192,104, alpha=255, max=255)
score0.outline = darken(score0.fill, amount=0.2)

quality_colors = rbind(quality_colors, list(0, score0.fill, score0.outline))

# Score 2

score2.fill = rgb(215, 228,189, alpha=255, max=255)
score2.outline = darken(score2.fill, amount=0.2)

quality_colors = rbind(quality_colors, list(2, score2.fill, score2.outline))

# Score 4

score4.fill = rgb(217, 150,148, alpha=255, max=255)
score4.outline = darken(score4.fill, amount=0.2)

quality_colors = rbind(quality_colors, list(4, score4.fill, score4.outline))

# Score 6

score6.fill = rgb(149,  55, 53, alpha=255, max=255)
score6.outline = darken(score6.fill, amount=0.2)

quality_colors = rbind(quality_colors, list(6, score6.fill, score6.outline))

# Score 8

score8.fill = rgb( 99,  37, 35, alpha=255, max=255)
score8.outline = darken(score8.fill, amount=0.2)

quality_colors = rbind(quality_colors, list(8, score8.fill, score8.outline))

#'Returns the fill / outline colors for a given quality code (one among \code{0}, \code{2}, \code{4}, \code{6} and \code{8})
#'@param quality_code A quality code
#'@return a one-row data frame with three columns: \code{QUALITY_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_quality = function(quality_code = 0) {
  return (quality_colors[quality_colors$QUALITY_CODE == quality_code, ])
}

#'Returns the fill color (as an RGB string) for a given quality code (one among \code{0}, \code{2}, \code{4}, \code{6} and \code{8})
#'@param quality_code A quality code
#'@return a string representing the RGB code of the fill color for the given quality code
#'@export
fill_for_quality = function(quality_code = 0) {
  return (colors_for_quality(quality_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given quality code (one among \code{0}, \code{2}, \code{4}, \code{6} and \code{8})
#'@param quality_code A quality code
#'@return a string representing the RGB code of the outline color for the given quality code
#'@export
outline_for_quality = function(quality_code = 0) {
  return (colors_for_quality(quality_code)$OUTLINE)
}

#'Returns the fill / outline colors for the quality codes found within a data set
#'@param data A data set with a \code{QUALITY_CODE} column
#'@return a multiple rows data frame with three columns: \code{QUALITY_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
quality_colors_for = function(data) {
  qualities = unique(data$QUALITY_CODE)
  return (quality_colors[quality_colors$QUALITY_CODE %in% qualities,])
}

#'Returns the fill / outline colors for all quality codes
#'@return a multiple rows data frame with three columns: \code{QUALITY_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_quality_colors = function() {
  return (quality_colors)
}
