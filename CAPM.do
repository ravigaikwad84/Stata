import excel "Z:\Users\user\Desktop\Analytics\Stata12\capm.xls", sheet("table") firstrow

replace Date=mofd(Date)

Date%tm
format Date%tm
format Date %tm
tsset Date

codebook
generate rsandp = 100*(ln(SANDP/L.SANDP))
generate rford = 100*(ln(FORD/L.FORD))
generate rge= 100*(ln(GE/L.GE))
generate rmicro= 100*(ln(MICROSOFT/L.MICROSOFT))
generate roracle= 100*(ln(ORACLE/L.ORACLE))
replace  USTB3M =  USTB3M/12
generate ersandp= rsandp- USTB3M
generate erford =  rford- USTB3M

generate erge= rge- USTB3M
generate ermicro = rmicro- USTB3M
generate eroracle = roracle -  USTB3M

regress erford ersandp
test (ersandp = 1)
test (ersandp = 1)
