webuse educwages

describe

*education is endogenous variable.  Parents education is instrumental variable

ivregress 2sls wages union (education = meducation feducation)

*checking endogenity of education by

estat endog

* p-value is small reject H0(enxogeneity) hence there is endogenity

*report first-stage regression by

estat firststage
*partial R-squared is high meaning after keeping union constant, there is high correlation among education and parents education.
*also p-value is very low so reject Ho(instruments are weak).

*perform test of overidentifying restrictions in which H0: IV set is valid and model is correctly specified.
estat overid
* p-value is high hence do not reject H0.



