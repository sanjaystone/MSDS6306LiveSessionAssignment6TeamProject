Bronx Analysis
================
Alvarado, Cynthia
June 22, 2017

Bronx Analysis
--------------

Below, we are summarizing statistics on the cleaned up Bronx data.

``` r
load(file = "D:/DoingDataScience/Assignments/bronx_homes.RData")

#mean and standard deviation of Sale Price
mean(bronx.homes$sale.price.n)
```

    ## [1] 467877.8

``` r
sd(bronx.homes$sale.price.n)
```

    ## [1] 267327.3

``` r
#mean and standard deviation of gross square feet
mean(bronx.homes$gross.sqft)
```

    ## [1] 2158.03

``` r
sd(bronx.homes$gross.sqft)
```

    ## [1] 827.2296

Histograms
----------

The histograms for both the sales price and the gross square feet gives the following:

``` r
hist(bronx.homes$sale.price.n)
```

![](Bronx_Analysis_files/figure-markdown_github-ascii_identifiers/hist-1.jpeg)

``` r
hist(bronx.homes$gross.sqft)
```

![](Bronx_Analysis_files/figure-markdown_github-ascii_identifiers/hist-2.jpeg)

``` r
#Boxplots
boxplot(bronx.homes$sale.price.n)
```

![](Bronx_Analysis_files/figure-markdown_github-ascii_identifiers/hist-3.jpeg)

``` r
boxplot(bronx.homes$gross.sqft)
```

![](Bronx_Analysis_files/figure-markdown_github-ascii_identifiers/hist-4.jpeg)

Plots
-----

Plots for Sales Price vs Gross Square Feet:

``` r
plot(bronx.homes$sale.price.n, bronx.homes$gross.sqft)
```

![](Bronx_Analysis_files/figure-markdown_github-ascii_identifiers/plot-1.jpeg)
