#!/usr/bin/env Rscript

library(data.table)
library(magrittr)
library(txtplot)

# shiny app
#library(rsconnect)
# rsconnect::setAccountInfo(name='girishji',
#                           token='363795DB1EA2C40B88AE87AA074FF546',
#                           secret='ISmbLpuFnG9lS7KC0zRyIvYzjrhm778ehMupVIcp')

# CFTC publishes Tuesday's data on Friday every week

read_zip <- function(urladdr) {
  temp <- tempfile()
  download.file(urladdr, temp)
  data <- read.csv(unz(temp, "annual.txt"))
  unlink(temp)
  setDT(data)
  return(data)
}

get_data <- function(dt) {
  names <- c('Futures Name', 
             'As of Date YMD', 
             'As of Date',
             'Open Interest',
             'Long - Noncommercial Positions',
             'Short - Noncommercial Positions')
  setnames(dt, c(1:3, 8:10), names)
  dt[grepl('s&p 500 consolidated|bitcoin', `Futures Name`, 
           ignore.case = T), c(1:3, 8:10)
     ][, `Futures Name` := substr(`Futures Name`, 1, 
                                 nchar(`Futures Name`) - 30)
       ][, `Net Speculator Position (%)` := 
           (`Long - Noncommercial Positions` - 
              `Short - Noncommercial Positions`) /
           `Open Interest` * 100][]
}

this_yr <- substr(Sys.Date(), 1, 4)
last_yr <- as.integer(this_yr) - 1
url_base <- 'https://www.cftc.gov/files/dea/history'

dt <- read_zip(paste0(url_base, '/deacot', this_yr, '.zip'))
dt <- get_data(dt)

dt2 <- read_zip(paste0(url_base, '/deacot', last_yr, '.zip'))
dt2 <- get_data(dt2)

dt <- rbind(dt, dt2)

print_data <- function(dt) {
  cat('Net Speculator Position (%)')
  print(knitr::kable(dt[, c(3, 4, 7)][1:20]))
  cat('\n')
  txtplot(x=-1:-60, 
          y=dt[, as.numeric(`Net Speculator Position (%)`)][1:60], 
          xlab='Week')
  cat('Open Interest:\n\n')
  txtplot(x=-1:-60, 
          y=dt[, as.integer(`Open Interest`)][1:60],
          xlab='Week')
}

cat("BTC\n")
cat("---\n\n")
print_data(dt[grepl('bitcoin', `Futures Name`, ignore.case = T)])

cat("S&P 500\n")
cat("-------\n\n")
print_data(dt[grepl('s&p', `Futures Name`, ignore.case = T)])

str = "We also use data on the positions of speculators and hedgers 
from the Commodity Futures Trading Commission (CFTC).
The CFTC requires all large traders to identify themselves as commercial 
or non-commercial which we, and the previous literature 
(e.g., Bessembinder, 1992; de Roon, Nijman, and Veld, 2000), 
refer to as hedgers and speculators, respectively. For each futures
contract, the long and short open interest held by these traders 
on Tuesday are reported on a weekly basis. Using the positions 
of speculators and hedgers as defined by the CFTC, we define 
the Net speculator position for each asset as follows:
Net speculator position:
(Speculator long positions - Speculator short positions) / Open interest
This signed measure shows whether speculators are net long or short 
in aggregate, and scales their net position by the open interest 
or total number of contracts outstanding in that futures market. 
Since speculators and hedgers approximately add up to zero (except 
for a small difference denoted ‘non-reported’ due to measurement issues 
of very small traders), we focus our attention on speculators. 
Of course, this means that net hedger positions constitute the 
opposite side (i.e., the negative of Net speculator position).

The Commitments of Traders (COT) is a weekly market report issued by 
the Commodity Futures Trading Commission (CFTC) enumerating the 
holdings of participants in various futures markets in the United States.

A common misconception of open interest lies in its purported predictive 
ability. It cannot forecast price action. High or low open interest
reflects investor interest, but it does not mean that their views 
are correct or their positions will be profitable.
Open interest is a measure of market activity. Little or no open
interest means there are no opening positions, or nearly all 
the positions have been closed. High open interest means there 
are many contracts still open, which means market participants 
will be watching that market closely.
Open interest is a measure of the flow of money into a futures or 
options market. Increasing open interest represents new or additional
money coming into the market while decreasing open interest 
indicates money flowing out of the market.
Open interest is also used as an indicator of trend strength. Since rising 
open interest represents additional money and interest coming into a market,
it is generally interpreted to be an indication that the existing 
market trend is gaining momentum or is likely to continue.
Many technical analysts believe that knowledge of open interest can
provide useful information about the market. For example, if there 
is a deceleration in open interest following a sustained move—either 
up or down—in price, then it might be foreshadowing an end to that trend.
"

cat(str)

# dt[grepl('s&p', `Futures Name`, ignore.case = T),
#    .(Date = as.Date(`As of Date Long`), `Net Speculator Position (%)`)] %>% 
#   ggplot(aes(x=Date, y=`Net Speculator Position (%)`)) + geom_point()

#rsconnect::deployApp('path/to/your/app')