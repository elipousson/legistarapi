
<!-- README.md is generated from README.Rmd. Please edit that file -->

# legistarapi

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

The goal of legistarapi is to allow access to the Legistar Web API.

## Installation

You can install the development version of legistarapi like so:

``` r
# pak::pkg_install("elipousson/legistarapi")
```

## Example

``` r
library(legistarapi)
```

Get persons using `legistar()`:

``` r
legistar(template = "persons", client = "seattle")[1:10, ]
#>    PersonId                           PersonGuid   PersonLastModifiedUtc
#> 1       120 AB1EC5B5-4AFA-4B70-ADDE-C0ECA2C97FEF 2014-05-27T22:02:36.467
#> 2       145 F07E7510-D2B5-4574-8F38-01552AD1B581 2014-05-27T22:02:36.467
#> 3       169 2D8E1621-3625-4BAC-BD75-762C720B3085 2014-05-27T22:02:36.467
#> 4       173 54718D76-B468-43BF-B935-7266D9261349 2014-05-27T22:02:36.467
#> 5       175 02FCAD3D-B104-412C-8566-99184F91BAFB 2014-05-27T22:02:36.467
#> 6       177 F53C87FD-BB0A-450F-BA21-C8B872691D0F 2014-05-27T22:02:36.467
#> 7       179 783B6BB6-54A6-4571-AD3D-4DB9C0DB3761 2014-05-27T22:02:36.467
#> 8       183 D304D3B5-4ADF-4854-BF8A-8FE368533E2C 2014-05-27T22:02:36.467
#> 9       184 996E5D3F-C893-426E-83C7-54D063684852 2014-05-27T22:02:36.467
#> 10      185 B9D0E861-3EC2-452D-A527-B63164F888FA 2014-05-27T22:02:36.467
#>    PersonRowVersion PersonFirstName PersonLastName  PersonFullName
#> 1      AAAAAAD1y1A=                        Daystar         Daystar
#> 2      AAAAAAArSwM=            View           Only       View Only
#> 3      AAAAAAArSwQ=        Legistar         System Legistar System
#> 4      AAAAAACWJig=             Ian          Smith       Ian Smith
#> 5      AAAAAAEEpG4=          Emilia        Sanchez  Emilia Sanchez
#> 6      AAAAAAA0ujY=           Julie          Tobin     Julie Tobin
#> 7      AAAAAABB7YY=             Jon       Johansen    Jon Johansen
#> 8      AAAAAAEAfYM=           Sally        Bagshaw   Sally Bagshaw
#> 9      AAAAAAEAfYo=             Tim        Burgess     Tim Burgess
#> 10     AAAAAAEB0kw=            Jean         Godden     Jean Godden
#>    PersonActiveFlag PersonCanViewFlag PersonUsedSponsorFlag
#> 1                 0                 0                     0
#> 2                 1                 0                     0
#> 3                 1                 0                     0
#> 4                 1                 1                     0
#> 5                 1                 1                     0
#> 6                 1                 1                     0
#> 7                 1                 1                     0
#> 8                 0                 1                     0
#> 9                 0                 1                     0
#> 10                0                 1                     0
#>                               PersonAddress1 PersonCity1 PersonState1
#> 1                                                                    
#> 2                                                   <NA>         <NA>
#> 3                                       <NA>        <NA>         <NA>
#> 4                                                                    
#> 5                                                                    
#> 6                                                                    
#> 7                                                                    
#> 8  Seattle City Hall, 600 Fourth Ave, 2nd fl     Seattle           WA
#> 9                                                                    
#> 10                                                                   
#>    PersonZip1  PersonPhone    PersonFax                PersonEmail
#> 1                                            Legistar@granicus.com
#> 2        <NA>                                                     
#> 3        <NA>         <NA>         <NA>                       <NA>
#> 4                                            Ian.Smith@seattle.gov
#> 5                                       Emilia.Sanchez@seattle.gov
#> 6                                          julie.tobin@seattle.gov
#> 7                                                 ats@granicus.com
#> 8       98104 206-684-8801 206-684-8587  sally.bagshaw@seattle.gov
#> 9             206-684-8806 206-684-8587    tim.burgess@seattle.gov
#> 10            206-684-8807 206-684-8587    jean.godden@seattle.gov
#>                                  PersonWWW PersonAddress2 PersonCity2
#> 1                                                                    
#> 2                                                    <NA>        <NA>
#> 3                                     <NA>           <NA>        <NA>
#> 4                                                                    
#> 5                                                                    
#> 6                                                                    
#> 7                                                                    
#> 8  http://www.seattle.gov/council/bagshaw/                           
#> 9  http://www.seattle.gov/council/burgess/                           
#> 10  http://www.seattle.gov/council/godden/                           
#>    PersonState2 PersonZip2 PersonPhone2 PersonFax2 PersonEmail2 PersonWWW2
#> 1                                                                         
#> 2          <NA>       <NA>         <NA>       <NA>         <NA>       <NA>
#> 3          <NA>       <NA>         <NA>       <NA>         <NA>       <NA>
#> 4                                                                         
#> 5                                                                         
#> 6                                                                         
#> 7                                                                         
#> 8                                                                         
#> 9                                                                         
#> 10
```

Or using the dedicated `legistar_get_persons()` function:

``` r
legistar_get_persons(client = "seattle")[1:10, ]
#>    PersonId                           PersonGuid   PersonLastModifiedUtc
#> 1       120 AB1EC5B5-4AFA-4B70-ADDE-C0ECA2C97FEF 2014-05-27T22:02:36.467
#> 2       145 F07E7510-D2B5-4574-8F38-01552AD1B581 2014-05-27T22:02:36.467
#> 3       169 2D8E1621-3625-4BAC-BD75-762C720B3085 2014-05-27T22:02:36.467
#> 4       173 54718D76-B468-43BF-B935-7266D9261349 2014-05-27T22:02:36.467
#> 5       175 02FCAD3D-B104-412C-8566-99184F91BAFB 2014-05-27T22:02:36.467
#> 6       177 F53C87FD-BB0A-450F-BA21-C8B872691D0F 2014-05-27T22:02:36.467
#> 7       179 783B6BB6-54A6-4571-AD3D-4DB9C0DB3761 2014-05-27T22:02:36.467
#> 8       183 D304D3B5-4ADF-4854-BF8A-8FE368533E2C 2014-05-27T22:02:36.467
#> 9       184 996E5D3F-C893-426E-83C7-54D063684852 2014-05-27T22:02:36.467
#> 10      185 B9D0E861-3EC2-452D-A527-B63164F888FA 2014-05-27T22:02:36.467
#>    PersonRowVersion PersonFirstName PersonLastName  PersonFullName
#> 1      AAAAAAD1y1A=                        Daystar         Daystar
#> 2      AAAAAAArSwM=            View           Only       View Only
#> 3      AAAAAAArSwQ=        Legistar         System Legistar System
#> 4      AAAAAACWJig=             Ian          Smith       Ian Smith
#> 5      AAAAAAEEpG4=          Emilia        Sanchez  Emilia Sanchez
#> 6      AAAAAAA0ujY=           Julie          Tobin     Julie Tobin
#> 7      AAAAAABB7YY=             Jon       Johansen    Jon Johansen
#> 8      AAAAAAEAfYM=           Sally        Bagshaw   Sally Bagshaw
#> 9      AAAAAAEAfYo=             Tim        Burgess     Tim Burgess
#> 10     AAAAAAEB0kw=            Jean         Godden     Jean Godden
#>    PersonActiveFlag PersonCanViewFlag PersonUsedSponsorFlag
#> 1                 0                 0                     0
#> 2                 1                 0                     0
#> 3                 1                 0                     0
#> 4                 1                 1                     0
#> 5                 1                 1                     0
#> 6                 1                 1                     0
#> 7                 1                 1                     0
#> 8                 0                 1                     0
#> 9                 0                 1                     0
#> 10                0                 1                     0
#>                               PersonAddress1 PersonCity1 PersonState1
#> 1                                                                    
#> 2                                                   <NA>         <NA>
#> 3                                       <NA>        <NA>         <NA>
#> 4                                                                    
#> 5                                                                    
#> 6                                                                    
#> 7                                                                    
#> 8  Seattle City Hall, 600 Fourth Ave, 2nd fl     Seattle           WA
#> 9                                                                    
#> 10                                                                   
#>    PersonZip1  PersonPhone    PersonFax                PersonEmail
#> 1                                            Legistar@granicus.com
#> 2        <NA>                                                     
#> 3        <NA>         <NA>         <NA>                       <NA>
#> 4                                            Ian.Smith@seattle.gov
#> 5                                       Emilia.Sanchez@seattle.gov
#> 6                                          julie.tobin@seattle.gov
#> 7                                                 ats@granicus.com
#> 8       98104 206-684-8801 206-684-8587  sally.bagshaw@seattle.gov
#> 9             206-684-8806 206-684-8587    tim.burgess@seattle.gov
#> 10            206-684-8807 206-684-8587    jean.godden@seattle.gov
#>                                  PersonWWW PersonAddress2 PersonCity2
#> 1                                                                    
#> 2                                                    <NA>        <NA>
#> 3                                     <NA>           <NA>        <NA>
#> 4                                                                    
#> 5                                                                    
#> 6                                                                    
#> 7                                                                    
#> 8  http://www.seattle.gov/council/bagshaw/                           
#> 9  http://www.seattle.gov/council/burgess/                           
#> 10  http://www.seattle.gov/council/godden/                           
#>    PersonState2 PersonZip2 PersonPhone2 PersonFax2 PersonEmail2 PersonWWW2
#> 1                                                                         
#> 2          <NA>       <NA>         <NA>       <NA>         <NA>       <NA>
#> 3          <NA>       <NA>         <NA>       <NA>         <NA>       <NA>
#> 4                                                                         
#> 5                                                                         
#> 6                                                                         
#> 7                                                                         
#> 8                                                                         
#> 9                                                                         
#> 10
```
