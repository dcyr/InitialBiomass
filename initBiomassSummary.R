rm(list=ls())
require(raster)
require(dplyr)
require(RCurl)
#setwd("/home/dcyr/Dropbox/LANDIS-II_IA_SCF/InitBiomassData")
inputFolder <- "~/Travail/SCF/BiomassKnn/Data"
setwd(inputFolder)
setwd("../")
wwd <- paste(getwd(), Sys.Date(), sep="/")
dir.create(wwd)
setwd(wwd)
rm(wwd)


# ##

### computing summary statistics from rasters of individual species
# quantiles to compute
q <- c(0.05, 0.25, 0.50, 0.75, 0.95)

###
files <- list.files(inputFolder, full.names = T)
files <- files[grep("initBiomassKnnTonsPerHa", files)]

###
info <- strsplit(basename(files), "-")
areas <- as.character(lapply(info, function(x) x[2]))
###
spp <- as.character(lapply(info, function(x) x[3]))
spp <- gsub(".tif", "", spp)


a <- "Acadian"

#for (a in unique(areas)) { # a <- "BSE"
    index <- grep(a, areas)
    summaryStats <- data.frame(species = c(spp[index], "Total"))
    
    meanAGBiomass_TonsPerHa <- maxAGBiomass_TonsPerHa <- numeric()
    quantiles <- matrix(NA, nrow = nrow(summaryStats), ncol = length(q))
    colnames(quantiles) <- paste0("quantile", q)
    # ### area subset
    # require(rgdal)
    # BSESubset <- readOGR(paste0(inputFolder, "/subsetShapefile"), "BS_EAST_mod_quadrat")
    # BSESubset <- spTransform(BSESubset, crs(r))  # need to load
    # BSESubsetRaster <- rasterize(BSESubset, r)
    # ###
    sppStack <- stack(files[index])
    sppStack <- stack(sppStack, sum(sppStack))
    names(sppStack) <- c(spp[index], "Total")

    for (i in seq_along(1:nlayers(sppStack))) {
        r <- sppStack[[i]]
        ## using only a subset
        # r[is.na(BSESubsetRaster)] <- NA
        rValues <- values(r)
        meanAGBiomass_TonsPerHa <-  append(meanAGBiomass_TonsPerHa, mean(rValues, na.rm=TRUE))
        maxAGBiomass_TonsPerHa <-  append(maxAGBiomass_TonsPerHa, max(rValues, na.rm=TRUE))
        quantiles[i, ] <- quantile(rValues, q, na.rm=TRUE)
        print(paste(a, names(r)))
    }

    summaryStats <- data.frame(meanAGBiomass_TonsPerHa,
                               maxAGBiomass_TonsPerHa,
                               quantiles)
    summaryStats <- round(summaryStats, 3)
    summaryStats <- data.frame(species = names(sppStack),
                               summaryStats)
  


    write.csv(summaryStats, file = paste0("initBiomassSummaryStats_", a, ".csv"), row.names = F)
#}
