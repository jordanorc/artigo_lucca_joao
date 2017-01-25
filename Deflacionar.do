clear
insheet N RDATE ACUCAR ETANOL SOJA DATA using  "C:\Users\USUARIO\Documents\Artigo-Volatilidade\dados_cepea.csv", delimiter(,)


substr("abcdef",2,3) = "bcd"

generate C= substr(data, 1,4)
generate E= substr(B, 1,2)
drop A B D

destring E C, replace 


save "C:\Users\USUARIO\Documents\Artigo-Volatilidade\dados_cepea.dta", replace



use "C:\Users\USUARIO\Documents\Artigo-Volatilidade\IPP.dta", clear


generate C= substr(data, 4,7)
generate E= substr(data, 1,2)

destring E C, replace 

save "C:\Users\USUARIO\Documents\Artigo-Volatilidade\IPPDF.dta", replace

sort C E

merge 1:m C E using "C:\Users\USUARIO\Documents\Artigo-Volatilidade\dados_cepea.dta"


keep if _merge==2 | _merge==3

sort C E


gen DFAJ=(DF/1.2039475)


gen SOJADF=(soja/DFAJ)
gen ACUCARDF=(acucar/DFAJ)
gen ETANOLDF=(etanol/DFAJ)

drop T

gen N=_n

save "C:\Users\USUARIO\Documents\Artigo-Volatilidade\dados_cepea_deflacionado.dta", replace


 export delimited DATA IPP data IPP1 TEMPO A DF C E n rdate acucar etanol soja _merge DFAJ ACUCARDF ETANOLDF SOJADF N using "C:\Users\USUARIO\Documents\Artigo-Volatilidade\dados_cepea_deflacionado.csv", replace






keep if _merge==3


