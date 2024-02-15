### BAR CHART COLOURS: FLEETS ###

FLEET_CODES = c()

#CPC fleet codes (26)
CPC_FLEET_CODES = c(
  "AUS",  "BGD", "COM", "FRAT", "IND", "IDN",
  "IRN",  "JPN", "KEN", "KOR",  "MDG", "MYS",
  "MDV",  "MUS", "MOZ", "OMN",  "PAK", "PHL",
  "SYC",  "LKA", "ZAF", "TZA",  "THA", "GBR",
  "GBRT", "YEM"
)

#EU fleet codes (9)
CPC_EU_FLEET_CODES = c(
  "EUESP", "EUFRA", "EUITA", "EUPRT",
  "EUREU", "EUMYT", "EUGBR",
  "EUBGR", "EUDEU"
)

#CHN fleet codes (2)
CPC_CHN_FLEET_CODES = c(
  "CHN", "TWN"
)

#Non reporting CPC fleet codes (2)
CPC_NON_REPORTING_FLEET_CODES = c(
  "SOM", "SDN"
)

#Non-CPC fleet codes (16)
NON_CPC_FLEET_CODES = c(
  "BHR", "BLZ", "DJI", "ERI", "TMP", "EGY", "GIN", "ISR",
  "JOR", "KWT", "MMR", "QAT", "SAU", "SEN", "SUN",
  "ARE", "VUT"
)

#Non-CPC NEI fleet codes (5)
NEI_FLEET_CODES = c(
  "NEIDN", "NEISU", "NEICE", "NEIFR", "NEIPS"
)

for(cpc in CPC_FLEET_CODES)               FLEET_CODES = append(FLEET_CODES, cpc)
for(cpc in CPC_EU_FLEET_CODES)            FLEET_CODES = append(FLEET_CODES, cpc)
for(cpc in CPC_CHN_FLEET_CODES)           FLEET_CODES = append(FLEET_CODES, cpc)
for(cpc in CPC_NON_REPORTING_FLEET_CODES) FLEET_CODES = append(FLEET_CODES, cpc)
for(cpc in NON_CPC_FLEET_CODES)           FLEET_CODES = append(FLEET_CODES, cpc)
for(cpc in NEI_FLEET_CODES)               FLEET_CODES = append(FLEET_CODES, cpc)

fleet_colors_vector = character()

#CPCs (26)
fleet_colors_vector = append(fleet_colors_vector, brewer.pal(11, "Paired"))
fleet_colors_vector = append(fleet_colors_vector, brewer.pal(8,  "Dark2"))
fleet_colors_vector = append(fleet_colors_vector, brewer.pal(7,  "Accent")) #Removing last gray that is in common with 'Dark2'

#CPCs EU (9)
fleet_colors_vector = append(fleet_colors_vector, rev(brewer.pal(9, "Blues")))

#CPCs CHN (2)
fleet_colors_vector = append(fleet_colors_vector, first(rev(brewer.pal(3, "OrRd")), 2))

#CPCs non-reporting (3)
fleet_colors_vector = append(fleet_colors_vector, brewer.pal(3, "Greys"))

#Non-CPC fleet codes (16)
fleet_colors_vector = append(fleet_colors_vector, rev(brewer.pal(9, "Pastel1")))
fleet_colors_vector = append(fleet_colors_vector, rev(brewer.pal(7, "Pastel2")))

#Non-CPC NEI fleet codes (5)
fleet_colors_vector = append(fleet_colors_vector, rev(brewer.pal(5, "Set3")))

FLEET_CODESZ = c(
  "ARE",
  "AUS",
  "BGD",
  "BHR",
  "BLZ",
  "CHN",
  "COM",
  "DJI",
  "EGY",
  "ERI",
  "EUBGR",
  "EUDEU",
  "EUESP",
  "EUFRA",
  "EUGBR",
  "EUITA",
  "EUMYT",
  "EUPRT",
  "EUREU",
  "GBRT",
  "GIN",
  "IDN",
  "IND",
  "IRN",
  "ISR",
  "JOR",
  "JPN",
  "KEN",
  "KOR",
  "KWT",
  "LKA",
  "MDG",
  "MDV",
  "MMR",
  "MOZ",
  "MUS",
  "MYS",
  "NEICE",
  "NEIDN",
  "NEIFR",
  "NEIPS",
  "NEISU",
  "OMN",
  "PAK",
  "PHL",
  "QAT",
  "SAU",
  "SDN",
  "SEN",
  "SUN",
  "SYC",
  "THA",
  "TMP",
  "TWN",
  "TZA",
  "VUT",
  "YEM",
  "ZAF"
)

#brewer_qual_palette = brewer.pal.info[brewer.pal.info$category == 'qual',]
#fleet_colors_vector = unlist(mapply(brewer.pal, brewer_qual_palette$maxcolors, rownames(brewer_qual_palette)))

fleet_colors = data.frame(
  FLEET_CODE = FLEET_CODES,
  FILL       =        fleet_colors_vector[1:length(FLEET_CODES)],
  OUTLINE    = darken(fleet_colors_vector[1:length(FLEET_CODES)])
)

fleet_colors = fleet_colors[order(fleet_colors$FLEET_CODE), ]

#'Returns the fill / outline colors for a given fleet code
#'@param fleet_code A fleet code
#'@return a one-row data frame with three columns: \code{FLEET_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
colors_for_fleet = function(fleet_code = "SYC") {
  return (fleet_colors[fleet_colors$FLEET_CODE == fleet_code, ])
}

#'Returns the fill color (as an RGB string) for a given fleet code
#'@param fleet_code A fleet code
#'@return a string representing the RGB code of the fill color for the given fleet
#'@export
fill_for_fleet = function(fleet_code = "SYC") {
  return (colors_for_fleet(fleet_code)$FILL)
}

#'Returns the outline color (as an RGB string) for a given fleet code
#'@param fishery_group_code A fleet code
#'@return a string representing the RGB code of the outline color for the given fleet
#'@export
outline_for_fleet = function(fleet_code = "SYC") {
  return (colors_for_fleet(colors_for_fleet)$OUTLINE)
}

#'Returns the fill / outline colors for the fleets found within a data set
#'@param data A data set with a \code{FLEET_CODE} column
#'@return a multiple rows data frame with three columns: \code{FLEET_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
fleet_colors_for = function(data) {
  return (fleet_colors[fleet_colors$FLEET_CODE %in% unique(data$FLEET_CODE), ])
}

#'Returns the fill / outline colors for all fleets
#'@return a multiple rows data frame with three columns: \code{FLEET_CODE}, \code{FILL} and \code{OUTLINE}, with the latter two corresponding to the RGB values for the specific color
#'@export
all_fleet_colors = function() {
  return (fleet_colors)
}
