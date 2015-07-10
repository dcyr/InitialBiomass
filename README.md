# Initial Biomass - K-Nearest Neighbourg Estimations
Dominic cyr  
Updated on Jul 10 2015

This document presents summary statistics of initial biomass as estimated by [Beaudoin et al (2014)][1] for all quadrats that are part of an ongoing simulation experiment conducted within the Project Change project by the Canadian Forest Service (Chapter 4 - Integrated Assessment).

The following summary statistics are computed for what are considered 'active' forest pixels in our simulations, i.e. those that are made of at least 50% of productive forest at a 250-m resolution.

The methodology and known biases associated with the following results are described in [Beaudoin et al][1]'s paper.





















###Simulation areas
<img src="README_files/figure-html/mapPlot-1.png" title="" alt="" style="display: block; margin: auto auto auto 0;" />


###Initial Biomass - K-Nearest Neighbourg Estimations
####Summary statistics - Total above ground biomass


```
##          SimulationArea meanAGBiomass_TonsPerHa maxAGBiomass_TonsPerHa
## 1     Atlantic Maritime                    68.0                  199.7
## 2     Boreal Cordillera                    46.3                  239.5
## 3          Boreal Plain                    40.2                  161.0
## 4 Eastern Boreal Shield                    73.7                  179.6
## 5 Western Boreal Shield                    61.8                  160.0
## 6    Montane Cordillera                   127.0                  350.0
## 7      Pacific Maritime                   259.1                  605.4
## 8           Taiga Plain                    24.9                  149.2
##   quantile0.05 quantile0.25 quantile0.5 quantile0.75 quantile0.95
## 1         20.4         46.6        66.4         90.0        118.0
## 2          0.0          6.8        36.0         78.9        123.7
## 3          0.0          7.4        36.3         64.2        102.5
## 4         19.9         55.8        74.3         92.1        124.7
## 5          0.0         37.5        64.8         88.2        114.2
## 6         20.1         77.8       127.4        175.5        230.4
## 7         91.9        185.6       261.2        328.2        430.5
## 8          0.9          6.3        20.4         36.7         70.3
```

Individual species' initial biomass can be found in the following '.csv' tables:

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

