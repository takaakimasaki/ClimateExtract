#' GAEZ data download.
#' @param res Resolution.
#' @param model Climate model.
#' @param time Time.
#' @param crop Crop.
#' @param indicator Indicator.
#' @param rcp RCP.
#' @param water_supply water supply.
#' @export
#' @return `download_wrsi()` download all the GEOTIFF files for the period between year_start and year_end from https://edcftp.cr.usgs.gov/project/fews/dekadal.
#' @examples
#'\dontrun{
#' gaez_data_extract(path, model, rcp, time, indicator, crop)
#'}
#' @import dplyr stringr
#' @importFrom raster raster crop mask writeRaster
#' @importFrom httr GET
#' @importFrom utils unzip

#path <- "C:/Users/WB495141/OneDrive - WBG/poverty/data/global/crop/gaez/version_4/qga"
#res <- "res05"
#model <- "NorESM1-M"
#rcp <- "rcp8p5"
#time <- "2020sH"
#indicator <- "sxHr0"
#crop <- "whe"
gaez_data_extract <- function(path, res, model, rcp, time, indicator, crop, water_supply){
if(indicator=="sxHr0"){
  url <- paste0("https://s3.eu-west-1.amazonaws.com/data.gaezdev.aws.fao.org/",res,"/",model,"/",rcp,"/",time,"/",indicator,"_",crop,".tif")
}
if(indicator=="qga"){
  url <- paste0("https://s3.eu-west-1.amazonaws.com/data.gaezdev.aws.fao.org/",res,"/",water_supply,"/",time,"/",crop,"_",time,"_",indicator,".tif")
}
fileName <- gsub(".tif","",basename(url))
httr::GET(url,httr::write_disk(path=paste0(path,"/",basename(url)), overwrite=TRUE))
}
