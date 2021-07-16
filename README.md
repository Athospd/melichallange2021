
<!-- README.md is generated from README.Rmd. Please edit that file -->

# melichallange2021

<!-- badges: start -->
<!-- badges: end -->

A quick start for solving the [MeLi Data Challange
2021](https://ml-challenge.mercadolibre.com/downloads) using R.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("Athospd/melichallange2021")
```

## The 4 files

There are 4 files available:

-   `test_data.csv`
-   `train_data.parquet`
-   `items_static_metadata.jl`
-   `sample_submission.csv.gz`

The following functions will download and cache each one of them in the
default `path = '../datasets'`

``` r
library(melichallange2021)
library(dplyr)

test_data <- test_data() # 4.21 MB
train_data <- train_data() # 2.30 GB
items_static_metadata_full <- items_static_metadata_full() # 83.78 MB
sample_submission <- sample_submission() # 126.2 MB
```

``` r
glimpse(test_data)
```

    Show in New Window
    Rows: 551,472
    Columns: 2
    $ sku          <int> 464801, 645793, 99516, 538100, 557191, 80056, 425233~
    $ target_stock <int> 3, 4, 8, 8, 10, 1, 3, 15, 2, 2, 8, 44, 3, 3, 2, 6, 1~

``` r
glimpse(train_data)
```

    Rows: 37,660,279
    Columns: 9
    $ sku                    <int> 464801, 464801, 464801, 464801, 464801, 46~
    $ date                   <chr> "2021-02-01", "2021-02-02", "2021-02-03", ~
    $ sold_quantity          <int> 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, ~
    $ current_price          <dbl> 156.78, 156.78, 156.78, 156.78, 156.78, 15~
    $ currency               <chr> "REA", "REA", "REA", "REA", "REA", "REA", ~
    $ listing_type           <chr> "classic", "classic", "classic", "classic"~
    $ shipping_logistic_type <chr> "fulfillment", "fulfillment", "fulfillment~
    $ shipping_payment       <chr> "free_shipping", "free_shipping", "free_sh~
    $ minutes_active         <dbl> 1440, 1440, 1440, 1440, 1440, 1440, 1440, ~

``` r
glimpse(items_static_metadata_full)
```

    Rows: 660,916
    Columns: 7
    $ item_domain_id    <chr> "MLB-SNEAKERS", "MLB-SURFBOARD_RACKS", "MLM-NEC~
    $ item_id           <int> 492155, 300279, 69847, 298603, 345949, 124265, ~
    $ item_title        <chr> "Tênis Masculino Olympikus Cyber Barato Promoça~
    $ site_id           <chr> "MLB", "MLB", "MLM", "MLM", "MLB", "MLM", "MLM"~
    $ sku               <int> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1~
    $ product_id        <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "ML~
    $ product_family_id <chr> "MLB15832732", NA, NA, NA, NA, NA, NA, NA, NA, ~

``` r
glimpse(sample_submission)
```

    Rows: 551,472
    Columns: 30
    $ V1  <dbl> 0.052, 0.026, 0.067, 0.017, 0.011, 0.036, 0.050, 0.049, 0.038~
    $ V2  <dbl> 0.006, 0.052, 0.008, 0.045, 0.038, 0.028, 0.031, 0.006, 0.054~
    $ V3  <dbl> 0.044, 0.008, 0.043, 0.027, 0.020, 0.053, 0.034, 0.044, 0.044~
    $ V4  <dbl> 0.001, 0.036, 0.020, 0.045, 0.000, 0.024, 0.030, 0.006, 0.036~
    $ V5  <dbl> 0.061, 0.027, 0.012, 0.036, 0.067, 0.023, 0.017, 0.049, 0.037~
    $ V6  <dbl> 0.043, 0.029, 0.067, 0.025, 0.023, 0.025, 0.005, 0.001, 0.044~
    $ V7  <dbl> 0.061, 0.057, 0.010, 0.068, 0.006, 0.034, 0.050, 0.055, 0.054~
    $ V8  <dbl> 0.035, 0.046, 0.060, 0.067, 0.021, 0.040, 0.026, 0.057, 0.065~
    $ V9  <dbl> 0.002, 0.005, 0.020, 0.002, 0.058, 0.007, 0.052, 0.019, 0.040~
    $ V10 <dbl> 0.057, 0.009, 0.061, 0.015, 0.023, 0.038, 0.051, 0.014, 0.051~
    $ V11 <dbl> 0.004, 0.042, 0.059, 0.040, 0.006, 0.024, 0.033, 0.037, 0.026~
    $ V12 <dbl> 0.005, 0.052, 0.009, 0.044, 0.054, 0.045, 0.016, 0.042, 0.064~
    $ V13 <dbl> 0.013, 0.039, 0.025, 0.002, 0.039, 0.019, 0.016, 0.041, 0.007~
    $ V14 <dbl> 0.048, 0.057, 0.070, 0.029, 0.013, 0.034, 0.047, 0.018, 0.046~
    $ V15 <dbl> 0.031, 0.029, 0.019, 0.020, 0.061, 0.037, 0.032, 0.013, 0.009~
    $ V16 <dbl> 0.039, 0.051, 0.004, 0.001, 0.055, 0.026, 0.060, 0.037, 0.036~
    $ V17 <dbl> 0.019, 0.058, 0.005, 0.023, 0.040, 0.050, 0.058, 0.047, 0.011~
    $ V18 <dbl> 0.014, 0.033, 0.066, 0.037, 0.031, 0.016, 0.001, 0.060, 0.053~
    $ V19 <dbl> 0.031, 0.015, 0.017, 0.031, 0.037, 0.020, 0.036, 0.047, 0.030~
    $ V20 <dbl> 0.063, 0.053, 0.007, 0.043, 0.034, 0.009, 0.020, 0.044, 0.028~
    $ V21 <dbl> 0.025, 0.013, 0.033, 0.060, 0.002, 0.050, 0.053, 0.020, 0.059~
    $ V22 <dbl> 0.032, 0.024, 0.014, 0.053, 0.027, 0.057, 0.044, 0.011, 0.044~
    $ V23 <dbl> 0.043, 0.036, 0.016, 0.027, 0.062, 0.042, 0.008, 0.049, 0.012~
    $ V24 <dbl> 0.069, 0.033, 0.017, 0.021, 0.045, 0.049, 0.032, 0.004, 0.020~
    $ V25 <dbl> 0.011, 0.021, 0.040, 0.050, 0.044, 0.042, 0.055, 0.048, 0.018~
    $ V26 <dbl> 0.058, 0.030, 0.059, 0.045, 0.032, 0.055, 0.033, 0.034, 0.030~
    $ V27 <dbl> 0.051, 0.023, 0.040, 0.060, 0.048, 0.058, 0.017, 0.049, 0.006~
    $ V28 <dbl> 0.010, 0.020, 0.014, 0.063, 0.035, 0.036, 0.070, 0.030, 0.014~
    $ V29 <dbl> 0.004, 0.024, 0.066, 0.004, 0.026, 0.009, 0.021, 0.028, 0.020~
    $ V30 <dbl> 0.068, 0.050, 0.052, 0.003, 0.043, 0.015, 0.001, 0.040, 0.001~
