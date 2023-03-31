#' GAEZ data download.
#' @param model Climate model.
#' @param time Time.
#' @param crop Crop.
#' @param indicator Indicator.
#' @param rcp RCP.
#' @export
#' @return `download_wrsi()` download all the GEOTIFF files for the period between year_start and year_end from https://edcftp.cr.usgs.gov/project/fews/dekadal.
#' @examples
#'\dontrun{
#' download_wrsi(year_start = 20,year_end = 22,month_start=13,month_end=33, region="west_africa", path="./data-clean")
#'}
#' @import dplyr stringr
#' @importFrom raster raster crop mask writeRaster
#' @importFrom httr GET
#' @importFrom utils unzip

#path <- "C:/Users/WB495141/OneDrive - WBG/poverty/data/global/crop/gaez/version_4/sxHr0"
#model <- "NorESM1-M"
#rcp <- "rcp8p5"
#time <- "2020sH"
#indicator <- "sxHr0"
#crop <- "whe"
gaez_data_extract <- function(path, model, rcp, time, indicator, crop){
url <- paste0("https://s3.eu-west-1.amazonaws.com/data.gaezdev.aws.fao.org/res05","/",model,"/",rcp,"/",time,"/",indicator,"/",crop,".tif")
#url <- paste0("https://s3.eu-west-1.amazonaws.com/data.gaezdev.aws.fao.org/res05/NorESM1-M/rcp8p5/2020sH/sxHr0_whe.tif")
#url <- paste0("https://s3.eu-west-1.amazonaws.com/data.gaezdev.aws.fao.org/res05/NorESM1-M/rcp8p5/2050sH/sxHr0_whe.tif")
tmpFile <- tempfile()
fileName <- gsub(".tif","",basename(url))
geotiff_file <- tempfile(fileext='.tif')
httr::GET(url,httr::write_disk(path=paste0(path,"/",basename(url)), overwrite=TRUE))
}
