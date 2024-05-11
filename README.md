
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
#> 4      AAAAAAEF4+U=             Ian          Smith       Ian Smith
#> 5      AAAAAAEIIHs=          Emilia        Sanchez  Emilia Sanchez
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
#> 4      AAAAAAEF4+U=             Ian          Smith       Ian Smith
#> 5      AAAAAAEIIHs=          Emilia        Sanchez  Emilia Sanchez
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

The Legistar Web API has at least partial support for the [OData Version
3.0](https://www.odata.org/documentation/odata-version-3-0/odata-version-3-0-core-protocol/)
URL conventions. Support for these conventions is incomplete but the
`top` and `orderby` query parameters are available:

``` r
legistar(
  client = "baltimore",
  template = "events",
  top = 10,
  orderby = "EventDate"
)
#>    EventId                            EventGuid   EventLastModifiedUtc
#> 1        1 3265560B-BBCD-4269-B082-CDD49DD99ADD 2015-02-11T21:05:53.99
#> 2        2 2FBB81E4-D83C-4546-B100-2E8B57686395 2015-02-11T21:05:53.99
#> 3        3 8FB567BB-1693-48EE-9FF9-030FF1F4A162 2015-02-11T21:05:53.99
#> 4        4 86D266F6-FCD4-4B90-A2F7-9C9354D4F876 2015-02-11T21:05:53.99
#> 5        5 6692FC0E-9C0D-4221-A38D-40A3D1EEE6C9 2015-02-11T21:05:53.99
#> 6        6 F79EFE5E-9718-4CE3-9AAA-D5A1A0752C91 2015-02-11T21:05:53.99
#> 7        7 C3833F9E-B23C-4E21-B1E6-9649C20F3A0A 2015-02-11T21:05:53.99
#> 8        8 237112BB-F187-4EAC-B96D-789B8829C571 2015-02-11T21:05:53.99
#> 9        9 16AED085-5874-4EEE-AE38-4D45C249E8F0 2015-02-11T21:05:53.99
#> 10      10 3E55EACB-A793-4AE8-926F-4E0E8F64BA3D 2015-02-11T21:05:53.99
#>    EventRowVersion EventBodyId EventBodyName           EventDate EventTime
#> 1     AAAAAAAE4rE=           1  City Council 1999-12-09T00:00:00   5:00 PM
#> 2     AAAAAAAE4rI=           1  City Council 2000-01-24T00:00:00   4:00 PM
#> 3     AAAAAAAE4rM=           1  City Council 2000-01-31T00:00:00   5:00 PM
#> 4     AAAAAAAE4rQ=           1  City Council 2000-02-07T00:00:00   5:00 PM
#> 5     AAAAAAAE4rU=           1  City Council 2000-02-14T00:00:00   5:00 PM
#> 6     AAAAAAAE4rY=           1  City Council 2000-02-28T00:00:00   5:00 PM
#> 7     AAAAAAAE4rc=           1  City Council 2000-03-06T00:00:00   5:00 PM
#> 8     AAAAAAAE4rg=           1  City Council 2000-03-13T00:00:00   5:00 PM
#> 9     AAAAAAAE4rk=           1  City Council 2000-03-20T00:00:00   5:00 PM
#> 10    AAAAAAAE4ro=           1  City Council 2000-03-27T00:00:00   5:00 PM
#>    EventVideoStatus EventAgendaStatusId EventAgendaStatusName
#> 1            Public                   2                 Final
#> 2            Public                   2                 Final
#> 3            Public                   2                 Final
#> 4            Public                   2                 Final
#> 5            Public                   2                 Final
#> 6            Public                   2                 Final
#> 7            Public                   2                 Final
#> 8            Public                   2                 Final
#> 9            Public                   2                 Final
#> 10           Public                   2                 Final
#>    EventMinutesStatusId EventMinutesStatusName EventLocation EventAgendaFile
#> 1                     1                  Draft     City Hall              NA
#> 2                     1                  Draft          <NA>              NA
#> 3                     1                  Draft     City Hall              NA
#> 4                     1                  Draft     City Hall              NA
#> 5                     1                  Draft     City Hall              NA
#> 6                     1                  Draft     City Hall              NA
#> 7                     1                  Draft     City Hall              NA
#> 8                     1                  Draft     City Hall              NA
#> 9                     1                  Draft     City Hall              NA
#> 10                    1                  Draft     City Hall              NA
#>    EventMinutesFile EventAgendaLastPublishedUTC EventMinutesLastPublishedUTC
#> 1                NA                          NA                           NA
#> 2                NA                          NA                           NA
#> 3                NA                          NA                           NA
#> 4                NA                          NA                           NA
#> 5                NA                          NA                           NA
#> 6                NA                          NA                           NA
#> 7                NA                          NA                           NA
#> 8                NA                          NA                           NA
#> 9                NA                          NA                           NA
#> 10               NA                          NA                           NA
#>    EventComment EventVideoPath EventMedia
#> 1            NA             NA         NA
#> 2            NA             NA         NA
#> 3            NA             NA         NA
#> 4            NA             NA         NA
#> 5            NA             NA         NA
#> 6            NA             NA         NA
#> 7            NA             NA         NA
#> 8            NA             NA         NA
#> 9            NA             NA         NA
#> 10           NA             NA         NA
#>                                                                                               EventInSiteURL
#> 1   https://baltimore.legistar.com/MeetingDetail.aspx?LEGID=1&GID=140&G=14BCFA42-2F78-4BCF-8819-CD3B96A3ECE2
#> 2   https://baltimore.legistar.com/MeetingDetail.aspx?LEGID=2&GID=140&G=14BCFA42-2F78-4BCF-8819-CD3B96A3ECE2
#> 3   https://baltimore.legistar.com/MeetingDetail.aspx?LEGID=3&GID=140&G=14BCFA42-2F78-4BCF-8819-CD3B96A3ECE2
#> 4   https://baltimore.legistar.com/MeetingDetail.aspx?LEGID=4&GID=140&G=14BCFA42-2F78-4BCF-8819-CD3B96A3ECE2
#> 5   https://baltimore.legistar.com/MeetingDetail.aspx?LEGID=5&GID=140&G=14BCFA42-2F78-4BCF-8819-CD3B96A3ECE2
#> 6   https://baltimore.legistar.com/MeetingDetail.aspx?LEGID=6&GID=140&G=14BCFA42-2F78-4BCF-8819-CD3B96A3ECE2
#> 7   https://baltimore.legistar.com/MeetingDetail.aspx?LEGID=7&GID=140&G=14BCFA42-2F78-4BCF-8819-CD3B96A3ECE2
#> 8   https://baltimore.legistar.com/MeetingDetail.aspx?LEGID=8&GID=140&G=14BCFA42-2F78-4BCF-8819-CD3B96A3ECE2
#> 9   https://baltimore.legistar.com/MeetingDetail.aspx?LEGID=9&GID=140&G=14BCFA42-2F78-4BCF-8819-CD3B96A3ECE2
#> 10 https://baltimore.legistar.com/MeetingDetail.aspx?LEGID=10&GID=140&G=14BCFA42-2F78-4BCF-8819-CD3B96A3ECE2
#>    EventItems
#> 1        NULL
#> 2        NULL
#> 3        NULL
#> 4        NULL
#> 5        NULL
#> 6        NULL
#> 7        NULL
#> 8        NULL
#> 9        NULL
#> 10       NULL
```

## Related projects

- [Python Legistar
  Scraper](https://github.com/opencivicdata/python-legistar-scraper)
- [scrapers-us-municipal](https://github.com/opencivicdata/scrapers-us-municipal)
  (Scrapers for US municipal governments)
- [Council Data Project](https://councildataproject.org/)
- [cdp-scrapers](https://councildataproject.org/cdp-scrapers/index.html)
  (Scratchpad for scraper development and general utilities for the
  Council Data Project)
