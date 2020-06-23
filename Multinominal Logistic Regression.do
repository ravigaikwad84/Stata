use https://stats.idre.ucla.edu/stat/data/hsbdemo, clear

tab prog ses, chi2

table prog, con(mean write sd write)

mlogit prog i.ses write, base(2)

mlogit, rrr

margins ses, atmeans predict(outcome(1))

margins ses, atmeans predict(outcome(2))

margins ses, atmeans predict(outcome(3))


*ploting margins

margins ses, atmeans predict(outcome(1))
marginsplot, name(general) 
margins ses, atmeans predict(outcome(2))
marginsplot, name(academic) 
margins ses, atmeans predict(outcome(3))
marginsplot, name(vocational) 
graph combine general academic vocational, ycommon

*predictions for write 
margins, at(write = (30(10) 70)) predict(outcome(1)) vsquish
margins, at(write = (30(10) 70)) predict(outcome(2)) vsquish
margins, at(write = (30(10) 70)) predict(outcome(3)) vsquish

*ploting prob
predict p1 p2 p3
sort write
twoway (line p1 write if ses ==1) (line p1 write if ses==2) (line p1 write if ses ==3), legend(order(1 "ses = 1" 2 "ses = 2" 3 "ses = 3") ring(0) position(7) row(1))

twoway (line p2 write if ses ==1) (line p2 write if ses==2) (line p2 write if ses ==3), legend(order(1 "ses = 1" 2 "ses = 2" 3 "ses = 3") ring(0) position(7) row(1))

twoway (line p3 write if ses ==1) (line p3 write if ses==2) (line p3 write if ses ==3),legend(order(1 "ses = 1" 2 "ses = 2" 3 "ses = 3") ring(0) position(7) row(1))
	
fitstat
