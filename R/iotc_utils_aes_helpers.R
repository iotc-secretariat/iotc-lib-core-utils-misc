#'Returns if the provided color is perceived as 'dark'
#'
#'See also: https://www.w3.org/TR/AERT#color-contrast
#'
#'@param color A color
#'@param threshold a threshold to tell 'light' colors from 'dark' ones
#'(defaults to 70 but the link above suggests 123 instead, which is less effective, IMHO)
#'@return \code{TRUE} if the color is perceived as 'dark', \code{FALSE} otherwise
#'@export
is_dark = function(color, threshold = 70) {
  return (
    sum(
      col2rgb(color) * c(299, 587, 114)
    ) / 1000 < threshold
  )
}

#'Builds a data table containing the \code{FILL} and \code{OUTLINE} columns for a
#'given set of colors, and a \code{FILL_BY} column with color labels.
#'@param colors a set of colors (e.g. rainbow(10))
#'@param labels the labels for each color. If not provided (i.e., \code{NA}) it is automatically created
#'@return a data table with three columns: \code{FILL_BY}, \code{FILL} and \code{OUTLINE} of which the former is meant to be a label, while the latter two represent fill and outline colors as derived from the provided color inputs
#'@export
color_table = function(colors, labels = NA) {
  if(is.na(labels))
    labels = paste0("COLOR_", c(1:length(colors)))

  table = data.table(labels, colors, darken(colors, .2))

  colnames(table)[1] = "FILL_BY"
  colnames(table)[2] = "FILL"
  colnames(table)[3] = "OUTLINE"

  return(table)
}

#'Returns a given number of unique colors from some of the most distinctive
#'palettes in RColorBrewer in the following order: \code{Paired}, \code{Dark2}, \code{Accent}, \code{Set1}, \code{Set2}, \code{Set3},
#'\code{Accent}, \code{Pastel1}, \code{Pastel2}
#'@param num_colors The number of colors to return
#'@return an set of \code{num} colors extracted from the most distinctive palettes in RColorBrewer
#'@export
unique_colors = function(num_colors = 16) {
  palette = c()

  for(pal in c("Paired", "Dark2", "Set1", "Set2", "Set3", "Accent", "Pastel1", "Pastel2"))
    palette =
      append(
        palette,
        brewer.pal(name = pal,
                   n = brewer.pal.info[pal,]$maxcolors)
      )

  palette = unique(palette)

  if(length(palette) < num_colors)
    warning(
      paste("Available palette includes at maximum",
            length(palette),
            "colors ( required:", num_colors, ")")
    )

  return(head(palette, num_colors))
}

#'Returns a color table for a given number of unique colors.
#'Equivalent to \code{color_table(unique_colors(num))}
#'@param num_colors The number of colors to return
#'@return a data table with \code{num_colors} row and three columns: \code{FILL_BY}, \code{FILL} and \code{OUTLINE}. The colors are taken from the first \code{num_colors} entries returned by \code{\link{unique_colors}}
#'@export
color_table_for = function(num_colors) {
  return(color_table(unique_colors(num_colors)))
}
