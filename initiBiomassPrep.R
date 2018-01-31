rm(list = ls())

setwd("~/Travail/SCF/BiomassKnn")
wwd <- paste(getwd(), Sys.Date(), sep="/")
dir.create(wwd)
setwd(wwd)
rm(wwd)

require(RCurl)
require(raster)

readURL <- "https://raw.githubusercontent.com/dcyr/LANDIS-II_IA_generalUseFiles/master/"
vegCodes <- read.csv(text = getURL(paste(readURL, "vegCodes.csv", sep="/")))
ecozones <- read.csv(text = getURL(paste(readURL, "ecoNames.csv", sep="/")))

# vegCodes[vegCodes$NorthShore == 1,]
# head(vegCodes[vegCodes$NorthShore == 1,])

#areas <- c("Acadian", "AM", "BSE", "SudStl", "NorthShore", "QcCentral" "QcNb")
areas <- "LSJ"

a <- areas[1]

## loading landtypes
readURL <- "https://github.com/dcyr/LANDIS-II_IA_generalUseFiles/raw/master/LandisInputs/"
tmpFile <- tempfile()
url <- paste(readURL, a, "/landtypes_", a, ".tif", sep="")
download.file(url, tmpFile, method="wget")
landtypes <- raster(tmpFile)
## proporiton of forest within pixel
forestProp <- raster("../sourceData/FOREST_250m_50pctplus.tif")
forestProp <- crop(forestProp, landtypes)
forestProp[forestProp == 0] <- NA
## listing source data files (from Beaudoin et al)
files  <- list.files("../sourceData/")
files <-  files[grep(".tif", files)]
# extracting info
spInfo <- strsplit(files, "_")
spInfo <- as.character(lapply(spInfo, function(x) x[5]))
spInfo <- toupper(spInfo)


## fetching area's species list
spp <- as.character(vegCodes[vegCodes[, a] == 1, "LandisCode"] )

## cycling through species
for (i in seq_along(spp)) {
    sp <- spp[i]
    r <- raster(paste("../sourceData", files[grep(sp, spInfo)], sep ="/"))
    r <- crop(r, landtypes)
    
    ### special cases where multiple species where summed up
    if (sp == "POPU.TRE") { ## combine with POPU.BAL and POPU.SPP
        r2 <- raster(paste("../sourceData", files[grep("POPU.BAL", spInfo)], sep ="/"))
        r2 <- crop(r2, landtypes)
        r3 <- raster(paste("../sourceData", files[grep("POPU.SPP", spInfo)], sep ="/"))
        r3 <- crop(r3, landtypes)
        r <- r + r2 + r3
    }
  
    # convert total tons to tons per ha 
    r <- r / (prod(res(r))/10000)
    # consider only productive forests
    r <- r / (forestProp/100)
    fName <- paste0("initBiomassKnnTonsPerHa-", a, "-", sp, ".tif")
    writeRaster(r, filename = fName, overwrite = TRUE)
    print(paste(a, sp))
}


