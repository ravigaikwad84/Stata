
webuse transport

list id t alt choice trcost trtime age income parttime

//set panel data by
cmset id t alt

//describe data by
describe id t alt choice trcost trtime age income parttime

*choice is function of trcost,trtime and income
*trcost and trtime are alternative-specific variables
*choice is dependent variable
*income is case-specific variable.

cmxtmixlogit choice trcost, casevars(income) random(trtime)

*coeffients for income is negative in all cases meaning individuals are less likely to use public, bycycle or walk as compared to car.

*marginal effect prediction for income(3 and 8)
margins, at(income=(3 8)) plot

*interpretation: If every individual has income of 30000, we would expect 16% would prefer bicycle to work and if every individual has income of 80000, we would expect 8% prefer bycycle to work.

*from graph also we can see decreasing prob for all choices except cars.
