program define spregsdmxt4
version 11.0
args lf XB ZB Rho Sigma
tempvar Rho1 rYW1 D0 D1
qui gen `D0'=0
qui gen `D1'=0
qui replace `D0' =1 if $ML_y1 ==spat_llt
qui replace `D1' =1 if $ML_y1 > spat_llt
qui gen double `Rho1'=`Rho'*spat_eigw
qui gen double `rYW1'=`Rho'*w1y_$ML_y1
qui replace `lf' = log(1-`Rho1')
qui replace `lf' = `D0'*log(normal(-`XB'/((`Sigma'*exp(`ZB')))))
qui replace `lf' = -`D1'*0.5*log(2*_pi)-0.5*log(((`Sigma'*exp(`ZB')))^2) ///
 -0.5*($ML_y1-`rYW1'-`XB')^2/((`Sigma'*exp(`ZB')))^2
end

