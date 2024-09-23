clear all
version 18
use database.dta

* country analysis
tabulate country
tabulate country if eic == "s"

*country classification analysis
tabulate eic
tabulate country_classification
tabulate country_classification if eic == "s"
tabulate country_classification if eic == "n"

* sex analysis
tabulate s
tabulate s if eic == "s"
tabulate s if eic == "n"

* number of editors per journal 
bysort journal: gen n = _N
bysort journal: gen tag = _n == 1
su n if tag == 1, detail

* number of EiC per journal 
keep if eic == "s"
drop n
drop tag
bysort journal: gen n = _N
bysort journal: gen tag = _n == 1
su n if tag == 1, detail
