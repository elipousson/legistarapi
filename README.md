
<!-- README.md is generated from README.Rmd. Please edit that file -->

# legistarapi

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

The goal of legistarapi is to allow access to the [Legistar Web
API](https://webapi.legistar.com/).

[Legistar](https://granicus.com/solution/govmeetings/legistar/) is
“agenda and legislative management software for large municipalities and
counties” supplied by Granicus. According to [promotional
material](https://granicus.com/pdfs/product_legistar.pdf), Legistar is
used by 70% of the largest cities and counties in the U.S.

## Installation

You can install the development version of legistarapi like so:

``` r
# pak::pkg_install("elipousson/legistarapi")
```

## Example

``` r
library(legistarapi)
```

This easiest way to access Legistar data is using the dedicated
functions that correspond to different types of information. For
example, list Legistar users for a client using the
`legis_get_persons()` function:

``` r
legis_get_persons(client = "seattle", top = 5)
#>   PersonId                           PersonGuid   PersonLastModifiedUtc
#> 1      120 AB1EC5B5-4AFA-4B70-ADDE-C0ECA2C97FEF 2014-05-27T22:02:36.467
#> 2      145 F07E7510-D2B5-4574-8F38-01552AD1B581 2014-05-27T22:02:36.467
#> 3      169 2D8E1621-3625-4BAC-BD75-762C720B3085 2014-05-27T22:02:36.467
#> 4      173 54718D76-B468-43BF-B935-7266D9261349 2014-05-27T22:02:36.467
#> 5      175 02FCAD3D-B104-412C-8566-99184F91BAFB 2014-05-27T22:02:36.467
#>   PersonRowVersion PersonFirstName PersonLastName  PersonFullName
#> 1     AAAAAAD1y1A=                        Daystar         Daystar
#> 2     AAAAAAArSwM=            View           Only       View Only
#> 3     AAAAAAArSwQ=        Legistar         System Legistar System
#> 4     AAAAAAEF4+U=             Ian          Smith       Ian Smith
#> 5     AAAAAAEIIHs=          Emilia        Sanchez  Emilia Sanchez
#>   PersonActiveFlag PersonCanViewFlag PersonUsedSponsorFlag PersonAddress1
#> 1                0                 0                     0               
#> 2                1                 0                     0               
#> 3                1                 0                     0           <NA>
#> 4                1                 1                     0               
#> 5                1                 1                     0               
#>   PersonCity1 PersonState1 PersonZip1 PersonPhone PersonFax
#> 1                                                          
#> 2        <NA>         <NA>       <NA>                      
#> 3        <NA>         <NA>       <NA>        <NA>      <NA>
#> 4                                                          
#> 5                                                          
#>                  PersonEmail PersonWWW PersonAddress2 PersonCity2 PersonState2
#> 1      Legistar@granicus.com                                                  
#> 2                                                <NA>        <NA>         <NA>
#> 3                       <NA>      <NA>           <NA>        <NA>         <NA>
#> 4      Ian.Smith@seattle.gov                                                  
#> 5 Emilia.Sanchez@seattle.gov                                                  
#>   PersonZip2 PersonPhone2 PersonFax2 PersonEmail2 PersonWWW2
#> 1                                                           
#> 2       <NA>         <NA>       <NA>         <NA>       <NA>
#> 3       <NA>         <NA>       <NA>         <NA>       <NA>
#> 4                                                           
#> 5
```

The Legistar Web API has at least partial support for the [OData Version
3.0](https://www.odata.org/documentation/odata-version-3-0/odata-version-3-0-core-protocol/)
URL conventions. Support for these conventions is incomplete but the
`top`, `orderby`, `select`, and `filter` query parameters are supported:

``` r
legis_get_persons(client = "seattle", top = 5, orderby = "PersonFullName", order = "asc", select = c("PersonFirstName", "PersonLastName", "PersonFullName"))
#>     PersonFullName PersonLastName PersonFirstName
#> 1 Aaron Blumenthal     Blumenthal           Aaron
#> 2  Aaron Pritchard      Pritchard           Aaron
#> 3     Abel Pacheco        Pacheco            Abel
#> 4    Abigail Doerr          Doerr         Abigail
#> 5    Adam Schaefer       Schaefer            Adam
```

The functions starting with `legis_get_` are wrappers for the
lower-level `legistar()` function. Using the `template` parameter, you
can access the same data:

``` r
legistar(template = "persons", client = "seattle", top = 5)
#>   PersonId                           PersonGuid   PersonLastModifiedUtc
#> 1      120 AB1EC5B5-4AFA-4B70-ADDE-C0ECA2C97FEF 2014-05-27T22:02:36.467
#> 2      145 F07E7510-D2B5-4574-8F38-01552AD1B581 2014-05-27T22:02:36.467
#> 3      169 2D8E1621-3625-4BAC-BD75-762C720B3085 2014-05-27T22:02:36.467
#> 4      173 54718D76-B468-43BF-B935-7266D9261349 2014-05-27T22:02:36.467
#> 5      175 02FCAD3D-B104-412C-8566-99184F91BAFB 2014-05-27T22:02:36.467
#>   PersonRowVersion PersonFirstName PersonLastName  PersonFullName
#> 1     AAAAAAD1y1A=                        Daystar         Daystar
#> 2     AAAAAAArSwM=            View           Only       View Only
#> 3     AAAAAAArSwQ=        Legistar         System Legistar System
#> 4     AAAAAAEF4+U=             Ian          Smith       Ian Smith
#> 5     AAAAAAEIIHs=          Emilia        Sanchez  Emilia Sanchez
#>   PersonActiveFlag PersonCanViewFlag PersonUsedSponsorFlag PersonAddress1
#> 1                0                 0                     0               
#> 2                1                 0                     0               
#> 3                1                 0                     0           <NA>
#> 4                1                 1                     0               
#> 5                1                 1                     0               
#>   PersonCity1 PersonState1 PersonZip1 PersonPhone PersonFax
#> 1                                                          
#> 2        <NA>         <NA>       <NA>                      
#> 3        <NA>         <NA>       <NA>        <NA>      <NA>
#> 4                                                          
#> 5                                                          
#>                  PersonEmail PersonWWW PersonAddress2 PersonCity2 PersonState2
#> 1      Legistar@granicus.com                                                  
#> 2                                                <NA>        <NA>         <NA>
#> 3                       <NA>      <NA>           <NA>        <NA>         <NA>
#> 4      Ian.Smith@seattle.gov                                                  
#> 5 Emilia.Sanchez@seattle.gov                                                  
#>   PersonZip2 PersonPhone2 PersonFax2 PersonEmail2 PersonWWW2
#> 1                                                           
#> 2       <NA>         <NA>       <NA>         <NA>       <NA>
#> 3       <NA>         <NA>       <NA>         <NA>       <NA>
#> 4                                                           
#> 5
```

The full list of templates with a brief description of each API method
is included in the `legistar_methods` reference data frame:

``` r
str(legistar_methods)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    124 obs. of  8 variables:
#>  $ type       : chr  "Actions" "Actions" "Actions" "Actions" ...
#>  $ method     : chr  "GET" "GET" "POST" "PUT" ...
#>  $ template   : chr  "GET v1/{client}/Actions" "GET v1/{client}/Actions/{action_id}" "POST v1/{client}/Actions" "PUT v1/{client}/Actions/{id}" ...
#>  $ url        : chr  "https://webapi.legistar.com/Help/Api/GET-v1-Client-Actions" "https://webapi.legistar.com/Help/Api/GET-v1-Client-Actions-ActionId" "https://webapi.legistar.com/Help/Api/POST-v1-Client-Actions" "https://webapi.legistar.com/Help/Api/PUT-v1-Client-Actions-Id" ...
#>  $ description: chr  "Gets all Actions." "Gets one Action." "Adds one Action." "Updates one Action." ...
#>  $ response   : chr  "Collection of GranicusAction" "GranicusAction" "HttpResponseMessage" "Collection of GranicusAction" ...
#>  $ modelName  : chr  "GranicusAction" "GranicusAction" "GranicusAction" "GranicusAction" ...
#>  $ nm         : chr  "actions" "actions_action_id" NA NA ...
```

Using the API to access data for your jurisdiction may require trial and
error to figure out how the specific site organized information.

For example, in order to figure out how to list ordinances for Baltimore
City, it is helpful to start by listing the “Matter Types”:

``` r
matter_types <- legistar(
  client = "baltimore",
  template = "matter_types"
)

str(matter_types)
#> 'data.frame':    5 obs. of  9 variables:
#>  $ MatterTypeId             : int  1 2 3 7 10
#>  $ MatterTypeGuid           : chr  "B224BB48-EF8C-4F9C-AA78-5C15A942344A" "E6C16D0D-13DD-4307-95DF-8F8F3E644CDA" "7D89AEED-060E-4F12-91FA-9BF0F23241B3" "7D933938-76F2-44F8-AA20-3BABEA4CACB1" ...
#>  $ MatterTypeLastModifiedUtc: chr  "2015-02-11T21:05:37.437" "2015-02-11T21:05:37.437" "2015-02-11T21:05:37.437" "2015-02-11T21:05:37.437" ...
#>  $ MatterTypeRowVersion     : chr  "AAAAAAAAG0o=" "AAAAAAAAG0s=" "AAAAAAAAG0w=" "AAAAAAAAG00=" ...
#>  $ MatterTypeName           : chr  "Ordinance" "City Council Resolution" "Executive Nomination" "Mayor and City Council Res." ...
#>  $ MatterTypeSort           : int  1 3 6 2 10
#>  $ MatterTypeActiveFlag     : int  1 1 1 1 1
#>  $ MatterTypeDescription    : logi  NA NA NA NA NA
#>  $ MatterTypeUsedFlag       : int  0 0 0 0 0
```

For Baltimore City, the “Ordinance” Matter Type has a ID value of 1. We
can use the filter parameter to return a data frame of ordinances:

``` r
ordinances <- legistar(
  client = "baltimore",
  template = "matters",
  top = 5,
  filter = c(
    "year(MatterPassedDate) > 2022",
    "MatterTypeId == 1"
  ),
  orderby = "MatterPassedDate",
  direction = "desc"
)
#> ℹ Converting `filter` to use OData operators: `c("year(MatterPassedDate) gt
#>   2022", "MatterTypeId eq 1")`

str(ordinances)
#> 'data.frame':    5 obs. of  54 variables:
#>  $ MatterId                : int  9269 9380 9548 9570 9577
#>  $ MatterGuid              : chr  "CCF500CC-21E6-4A9F-9248-4532D4CAE9DB" "4BF92EB4-6ECF-451B-AB54-BCE01B3E9AB6" "0B4764EC-F36A-4EC9-BF41-AC41F64AA743" "F19536EC-63D8-4269-BDFF-8A089B770440" ...
#>  $ MatterLastModifiedUtc   : chr  "2024-05-07T19:55:56.69" "2024-05-07T19:56:17.353" "2024-05-07T19:56:39.28" "2024-05-07T20:03:07.207" ...
#>  $ MatterRowVersion        : chr  "AAAAAACDc9U=" "AAAAAACDc/4=" "AAAAAACDdCM=" "AAAAAACDdlk=" ...
#>  $ MatterFile              : chr  "22-0301" "23-0351" "23-0416" "23-0427" ...
#>  $ MatterName              : chr  "Sale of Property - 844 Roundview Road" "Rezoning - 1801 to 1807 Bloomingdale Road and 1800 to 1816 North Rosedale Street" "Baltimore City Office of Returning Citizens" "Baltimore Police Department - Trauma-Informed Care Training" ...
#>  $ MatterTitle             : chr  "Sale of Property - 844 Roundview Road\r\nFor the purpose of authorizing the Mayor and City Council of Baltimore"| __truncated__ "Rezoning - 1801 to 1807 Bloomingdale Road and 1800 to 1816 North Rosedale Street\r\nFor the purpose of changing"| __truncated__ "Baltimore City Office of Returning Citizens\r\nFor the purpose of establishing a Baltimore City Office of Retur"| __truncated__ "Baltimore Police Department - Trauma-Informed Care Training\r\nFor the purpose of adding the Baltimore Police D"| __truncated__ ...
#>  $ MatterTypeId            : int  1 1 1 1 1
#>  $ MatterTypeName          : chr  "Ordinance" "Ordinance" "Ordinance" "Ordinance" ...
#>  $ MatterStatusId          : int  18 18 18 18 18
#>  $ MatterStatusName        : chr  "Enacted" "Enacted" "Enacted" "Enacted" ...
#>  $ MatterBodyId            : int  3 3 3 3 3
#>  $ MatterBodyName          : chr  "Baltimore City Council" "Baltimore City Council" "Baltimore City Council" "Baltimore City Council" ...
#>  $ MatterIntroDate         : chr  "2022-11-21T00:00:00" "2023-02-06T00:00:00" "2023-08-21T00:00:00" "2023-09-18T00:00:00" ...
#>  $ MatterAgendaDate        : logi  NA NA NA NA NA
#>  $ MatterPassedDate        : chr  "2024-04-24T00:00:00" "2024-04-24T00:00:00" "2024-04-24T00:00:00" "2024-04-24T00:00:00" ...
#>  $ MatterEnactmentDate     : logi  NA NA NA NA NA
#>  $ MatterEnactmentNumber   : chr  "24-323" "24-324" "24-325" "24-338" ...
#>  $ MatterRequester         : chr  "Dept. of Real Estate" NA NA NA ...
#>  $ MatterNotes             : logi  NA NA NA NA NA
#>  $ MatterVersion           : chr  "0" "0" "0" "0" ...
#>  $ MatterCost              : logi  NA NA NA NA NA
#>  $ MatterText1             : chr  "Voting Session: 1:59 p.m" "2:02 P.M" "1:02 p.m" "12:59 P.M" ...
#>  $ MatterText2             : chr  "Natawna B. Austin" "Natawna B. Austin" "Natawna B. Austin" "Natawna B. Austin" ...
#>  $ MatterText3             : logi  NA NA NA NA NA
#>  $ MatterText4             : logi  NA NA NA NA NA
#>  $ MatterText5             : logi  NA NA NA NA NA
#>  $ MatterDate1             : chr  "2024-03-18T00:00:00" "2024-02-27T00:00:00" "2024-02-28T00:00:00" "2024-03-20T00:00:00" ...
#>  $ MatterDate2             : logi  NA NA NA NA NA
#>  $ MatterEXText1           : chr  "Administration" "Torrence" "Torrence" "Cohen" ...
#>  $ MatterEXText2           : chr  "Office of the Comptroller" NA NA NA ...
#>  $ MatterEXText3           : chr  "Department of Real Estate" NA NA NA ...
#>  $ MatterEXText4           : logi  NA NA NA NA NA
#>  $ MatterEXText5           : logi  NA NA NA NA NA
#>  $ MatterEXText6           : logi  NA NA NA NA NA
#>  $ MatterEXText7           : logi  NA NA NA NA NA
#>  $ MatterEXText8           : logi  NA NA NA NA NA
#>  $ MatterEXText9           : logi  NA NA NA NA NA
#>  $ MatterEXText10          : logi  NA NA NA NA NA
#>  $ MatterEXText11          : logi  NA NA NA NA NA
#>  $ MatterEXDate1           : logi  NA NA NA NA NA
#>  $ MatterEXDate2           : logi  NA NA NA NA NA
#>  $ MatterEXDate3           : logi  NA NA NA NA NA
#>  $ MatterEXDate4           : logi  NA NA NA NA NA
#>  $ MatterEXDate5           : logi  NA NA NA NA NA
#>  $ MatterEXDate6           : logi  NA NA NA NA NA
#>  $ MatterEXDate7           : logi  NA NA NA NA NA
#>  $ MatterEXDate8           : logi  NA NA NA NA NA
#>  $ MatterEXDate9           : logi  NA NA NA NA NA
#>  $ MatterEXDate10          : logi  NA NA NA NA NA
#>  $ MatterAgiloftId         : int  0 0 0 0 0
#>  $ MatterReference         : chr  "22-0301" "23-0351" "23-0416" "23-0427" ...
#>  $ MatterRestrictViewViaWeb: logi  FALSE FALSE FALSE FALSE FALSE
#>  $ MatterReports           :List of 5
#>   ..$ : list()
#>   ..$ : list()
#>   ..$ : list()
#>   ..$ : list()
#>   ..$ : list()
```

Note that if `{stringr}` is installed the package will automatically
convert R logical operators contained in the filter string into OData
logical operators, e.g. “\>” converted to “gt” and “==” converted to
“eq”. Only logical operators bracketed by spaces are converted.

## Related projects

- [Python Legistar
  Scraper](https://github.com/opencivicdata/python-legistar-scraper)
- [scrapers-us-municipal](https://github.com/opencivicdata/scrapers-us-municipal):
  Scrapers for US municipal governments
- [Council Data Project](https://councildataproject.org/)
- [cdp-scrapers](https://councildataproject.org/cdp-scrapers/index.html):
  Scratchpad for scraper development and general utilities for the
  Council Data Project
- [legistar-rs](https://github.com/Subzidion/legistar-rs): Rust library
  to access the Legistar Web API.
- [civic-scraper](https://github.com/biglocalnews/civic-scraper): Tools
  for downloading agendas, minutes and other documents produced by local
  government
