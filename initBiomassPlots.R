rm(list=ls())
require(raster)
require(dplyr)
require(RCurl)
#setwd("/home/dcyr/Dropbox/LANDIS-II_IA_SCF/InitBiomassData")
inputFolder <- "~/Travail/SCF/BiomassKnn"
setwd(inputFolder)
wwd <- paste(getwd(), Sys.Date(), sep="/")
dir.create(wwd)
setwd(wwd)
rm(wwd)



readURL <- "https://raw.githubusercontent.com/dcyr/LANDIS-II_IA_generalUseFiles/master/"
vegCodes <- read.csv(text = getURL(paste(readURL, "vegCodes.csv", sep="/")))
ecozones <- read.csv(text = getURL(paste(readURL, "ecoNames.csv", sep="/")))

#areas <- c("AM", "BC", "BP", "BSE", "BSW", "MC", "PM", "TP")
areas <- "ALPAC"



a <- areas[1]

require(rasterVis)
require(ggplot2)
#for (a in unique(areas)) { # a <- "BSE"
    simAreaName <- ecozones[ecozones$code==a,"name"]
    files <- list.files(inputFolder)
    files <- files[grep("initBiomassKnnTonsPerHa", files)]

    fileInfo <- strsplit(gsub(".tif", "", files), "-")
    fileArea <- as.character(lapply(fileInfo, function(x) x[2]))
    fileSpp <- as.character(lapply(fileInfo, function(x) x[3]))
    fileSpp <- gsub("-", ".", fileSpp)

    areaIndex <- which(fileArea == a)
    x <- files[areaIndex]
    spp <- fileSpp[areaIndex]
    reorderedIndex <- c(grep("[^Total]", spp), grep("Total", spp))
    x <- x[reorderedIndex]
    spp <- spp[reorderedIndex]

    sppStack <- stack(paste(inputFolder, x, sep="/"))
    # names(sppStack)

    totalAGB <- numeric()
    for (i in 1:nlayers(sppStack)) {
        totalAGB <- append(totalAGB, sum(values(sppStack[[i]]), na.rm=TRUE))
    }
    subsample <- which(totalAGB>1000)
    sppStack <- sppStack[[subsample]]
    sppStack <- stack(sppStack, sum(sppStack))
    
    spp <- c(spp[subsample], "Total")
    names(sppStack) <- formatC(1:nlayers(sppStack), width = 2, flag = "0")
    names(spp) <- names(sppStack)
    spp <- gsub("GENERIC_", "", spp)

    
    ### write "Total" raster as a .tif (has been missing from upstream scripts for a while)
    
    e <- extent(sppStack)
    labelDat <- data.frame(x = e[1] + 0.98*(e[2]-e[1]),
                           y = e[3] + 1.05*(e[4]-e[3]),
                           variable = names(sppStack),
                           spp = spp)


    sppStack <- rasterToPoints(sppStack)
    colnames(sppStack)[3:ncol(sppStack)] <- spp
    require(tidyr)
    sppStack <- as.data.frame(sppStack) %>% 
        gather(species, biomass_tonsPerHa, -x, -y)
    sppStack$species <- factor(sppStack$species, levels = spp)
    
    require(dplyr)
    ### very long... 
    sppLabel <- sppStack %>%
        group_by(species) %>%
        summarize(meanBiomass_tonsPerHa = mean(biomass_tonsPerHa))
       
     
    ncol <- 5
    zLim <- c(0, ceiling(quantile(sppStack$biomass_tonsPerHa, 0.9999)/10)*10)
    ylim <- range(sppStack$y)
    xlim <- range(sppStack$x)
    ## study area (optional)

    
    
    p <- ggplot(data = sppStack, aes(x = x, y = y)) +
        geom_raster(aes(fill = biomass_tonsPerHa)) +
        facet_wrap(~ species, ncol = ncol) +
        scale_fill_gradientn(name = "AGB (tons/ha)",
                             colours = c("grey", "darkblue", "darkgreen", "yellow",  "orange", "red"),
                             values = c(0, 0.001, 0.20, 0.40, 0.60, 1), limits = zLim) +
        geom_text(aes(x = max(xlim), y =  max(ylim),
                      label = "mean AGB"),
                  colour = "white",
                  hjust = 1, vjust = 1, size = rel(3), fontface = 1) +
        geom_text(aes(x = x, y = y,
                      label = paste(signif(meanBiomass_tonsPerHa, 2), "tons/ha")),
                  colour = "white",
                  data = data.frame(sppLabel, x = max(xlim), y =  max(ylim)- 30000),
                  hjust = 1, vjust = 1, size = rel(3), fontface = "bold") +
        coord_equal()


    png(filename = paste0("initialBiomass_", a, ".png"),
        width = 10, height = 10, units = "in", res = 300, pointsize = 10)


        print(p + ggtitle(paste0("k-NN estimates of initial aboveground biomass\n", ecozones[which(ecozones$code == a), "name"])) +
                  theme_dark() +
                  theme(axis.title.x = element_blank(),
                        axis.title.y = element_blank(),
                        axis.ticks = element_blank(),
                        axis.text.x = element_blank(),
                        axis.text.y =  element_blank(),
                        #strip.background = element_blank(),
                        strip.text.x = element_text(size = rel(0.8))))
    dev.off()
#
