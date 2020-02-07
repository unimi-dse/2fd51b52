# 2fd51b52

# Global CO2 emission analysis

This application shows the overview of CO2 emission of each country and area in the world since 1960. Besides, the prediction for the next few years is provided.

## Installation


```bash
# first install the R package "devtools" if not installed
devtools::install_github('unimi-dse/2fd51b52')
```

## Usage

```r
# load the package
require(co2emission)
```
### appGui
The function  `appGUI()` loads Shiny application on the web browser. Type `?appGUI` for a complete description of the function. 
## Dataset
The project uses dataset imported from [Data World Bank](https://data.worldbank.org/) as a CSV file.

Dataset has these fields:
- Country Name
- Country Code
- Indicator Name
- Indicator Code
- CO2 emission volume from 1960 to 2019

## Usage

