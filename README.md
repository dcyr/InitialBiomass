# Initial Biomass - K-Nearest Neighbourg Estimations
Dominic cyr  
Updated on Jul 10 2015

This document presents summary statistics of initial biomass, as estimated by [Beaudoin et al (2014)][1], for all quadrats that are part of an ongoing simulation experiments conducted within the Project Change project by the Canadian Forest Service (Chapter 4 - Integrated Assessment).

The following summary statistics are computed for what are considered 'active' forest pixels in our simulations, i.e. those that are made of at least 50% of productive forest (250-m resolution).

The methodology and known biases associated with the following results are described in [Beaudoin et al][1]'s paper.





















###Simulation areas
<img src="README_files/figure-html/mapPlot-1.png" title="" alt="" style="display: block; margin: auto auto auto 0;" />


###Initial Biomass - K-Nearest Neighbourg Estimations
####Summary statistics - Total above ground biomass


```
##   SimulationArea meanAGBiomass_TonsPerHa maxAGBiomass_TonsPerHa
## 1             AM                  68.022                199.671
## 2             BC                  46.321                239.479
## 3             BP                  40.216                160.997
## 4            BSE                  73.710                179.622
## 5            BSW                  61.791                159.982
## 6             MC                 127.027                349.978
## 7             PM                 259.102                605.389
## 8             TP                  24.903                149.239
##   quantile0.05 quantile0.25 quantile0.5 quantile0.75 quantile0.95
## 1       20.430       46.650      66.382       89.955      118.007
## 2        0.000        6.762      36.035       78.914      123.740
## 3        0.000        7.413      36.279       64.155      102.485
## 4       19.864       55.778      74.253       92.066      124.678
## 5        0.000       37.482      64.765       88.194      114.181
## 6       20.058       77.791     127.414      175.546      230.411
## 7       91.868      185.636     261.176      328.235      430.484
## 8        0.932        6.276      20.372       36.691       70.301
```

Individual species' initial biomass are contained in the following '.csv' tables:

1. Atlantic Maritime ([Display][2]/[Download][3])
2. Boreal Cordillera ([Display][4]/[Download][5])
3. Boreal Plain ([Display][6]/[Download][7])
4. Eastern Boreal Shield ([Display][8]/[Download][9])
5. Western Boreal Shield ([Display][10]/[Download][11])
6. Montane Cordillera ([Display][12]/[Download][13])
7. Pacific Maritime ([Display][14]/[Download][15])
8. Taiga Plain ([Display][16]/[Download][17])


[1]: http://www.nrcresearchpress.com/doi/abs/10.1139/cjfr-2013-0401
[2]: https://github.com/dcyr/InitialBiomass/blob/master/summaryStats/initBiomassSummaryStats_AM.csv
[4]: https://github.com/dcyr/InitialBiomass/blob/master/summaryStats/initBiomassSummaryStats_BC.csv
[6]: https://github.com/dcyr/InitialBiomass/blob/master/summaryStats/initBiomassSummaryStats_BP.csv
[8]: https://github.com/dcyr/InitialBiomass/blob/master/summaryStats/initBiomassSummaryStats_BSE.csv
[10]: https://github.com/dcyr/InitialBiomass/blob/master/summaryStats/initBiomassSummaryStats_BSW.csv
[12]: https://github.com/dcyr/InitialBiomass/blob/master/summaryStats/initBiomassSummaryStats_MC.csv
[14]: https://github.com/dcyr/InitialBiomass/blob/master/summaryStats/initBiomassSummaryStats_PM.csv
[16]: https://github.com/dcyr/InitialBiomass/blob/master/summaryStats/initBiomassSummaryStats_TP.csv
[3]: https://raw.githubusercontent.com/dcyr/InitialBiomass/master/summaryStats/initBiomassSummaryStats_AM.csv
[5]: https://raw.githubusercontent.com/dcyr/InitialBiomass/master/summaryStats/initBiomassSummaryStats_BC.csv
[7]: https://raw.githubusercontent.com/dcyr/InitialBiomass/master/summaryStats/initBiomassSummaryStats_BP.csv
[9]: https://raw.githubusercontent.com/dcyr/InitialBiomass/master/summaryStats/initBiomassSummaryStats_BSE.csv
[11]: https://raw.githubusercontent.com/dcyr/InitialBiomass/master/summaryStats/initBiomassSummaryStats_BSW.csv
[13]: https://raw.githubusercontent.com/dcyr/InitialBiomass/master/summaryStats/initBiomassSummaryStats_MC.csv
[15]: https://raw.githubusercontent.com/dcyr/InitialBiomass/master/summaryStats/initBiomassSummaryStats_PM.csv
[17]: https://raw.githubusercontent.com/dcyr/InitialBiomass/master/summaryStats/initBiomassSummaryStats_TP.csv

