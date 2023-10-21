%funkcija na sistemu Monte Carlo
function[res]=mcc_pi(T)

%generiranje naključnih točk
x=2*rand(T,1)-1;
y=2*rand(T,1)-1;

%iskanje točk znotraj kroga
razdelitev=sqrt(x.^2+y.^2);
notr=(razdelitev <= 1);
x_notr = x(notr);
y_notr = y(notr);

%točke znotraj kroga in kvadrata
res_notr_kroga=[x(notr),y(notr)];
res_notr_kvadrata=[x,y];
end