# Overview

The code in this replication package performs analysis using two data
sources (OECD (2022); Duncalfe (2022)) using R. A Master file runs all
of the code to generate the data for the 1 figures in the paper. The
replicator should expect the code to run for about 1 min.

# Data Availability and Provenance Statements

The data relied on in this paper can be found in the ‘./input’ folder of
the repository and is described in the Table below:

| Data File                     | Source          | Provided | Additional information                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|:------------------------------|:----------------|:---------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ./input/foreign_born_OECD.csv | (OECD 2022)     | yes      | The foreign-born population covers all people who have ever migrated from their country of birth to their current country of residence. The foreign-born population data shown here include people born abroad as nationals of their current country of residence. The difference across countries between the size of the foreign-born population and that of the foreign population depends on the rules governing the acquisition of citizenship in each country. This indicator is measured as a percentage of population. |
| ./input/country_codes.csv     | (Duncalfe 2022) | yes      | ISO-3166 Country and Dependent Territories Lists with UN Regional Codes                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

# Computing environment

This code was run on a x86_64-w64-mingw32 platform of a Windows 10 x64
(build 19044) computer.

The analysis is conducted in the R programming environment. R is free,
open-source and available for download
[here](https://www.r-project.org/). The code has been tested against R
version R version 4.1.2 (2021-11-01).

Once R is successfully set up on your system, you will need to install a
number of external R libraries. I have used renv to snapshot the
project’s R environment. To install all of the necessary R libraries,
simply open R at the project root (e.g. by clicking on the .Rproj file)
and run the following commands:

``` r
## Run these commands in R

# install.packages("renv") ## Only necessary if the renv package is not yet installed on your computer
# renv::init()  ## Only necessary if you didn't open the repo as an RStudio project
renv::restore(confirm = FALSE)
```

# Instructions to replicators

All code files in this repository are referred to through the package
here(). This package finds the root as the place where the ‘.Rproj’ file
is located. For this repository, the .Rproj file is located in the root
folder, referred to as ‘./.’

The structure of replication package is indicated in the
\`./code/00_MASTER.R’ file. Running this Master file will reproduce all
the results of this analysis and assign these results to their
respective output folders.

## Mapping of Tables and Figures to programs

A mapping of the Figures displayed in the paper to the respective
programs can be found below:

| Nr. | Program              | Output                            | Note |
|----:|:---------------------|:----------------------------------|:-----|
|   1 | ./code/02_analysis.R | ./output/figures/foreign_born.png |      |

A mapping of the Tables displayed in the paper to the respective
programs can be found below:

| Nr. | Program              | Output                            | Note |
|----:|:---------------------|:----------------------------------|:-----|
|   1 | ./code/02_analysis.R | ./output/tables/foreign_born.tex  |      |
|   2 | ./code/02_analysis.R | ./output/tables/foreign_born.docx |      |

# References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-duncalfe2022countries" class="csl-entry">

Duncalfe, Luke. 2022. “<span class="nocase">ISO-3166 Country and
Dependent Territories Lists with UN Regional Codes</span>.”
<https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes>,
Accessed on 11-February-2022.

</div>

<div id="ref-oecd2022foreign" class="csl-entry">

OECD. 2022. “<span class="nocase">Foreign-born population
(indicator)</span>.” <https://doi.org/10.1787/5a368e1b-en>, Accessed on
11-February-2022.

</div>

</div>
