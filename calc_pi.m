
function calc_pi()
    n=4000;
    r=1;
    [priblizek_pija, napaka] = area_pi(n);
   
    %[znotraj_kroga, znotraj_kvadrata] = mcc_pi(n)
    disp(['Odstopek:', num2str(priblizek_pija)])
    disp(['Približek pija:', num2str(napaka)])
    figure(n)
end



function figure(n)
     x = 2*rand(1,n)-1;
     y = 2*rand(1,n)-1;
     radi = sqrt(x.^2 + y.^2);  
     znotri_kroga = radi <= 1;

    
     scatter(x(znotri_kroga), y(znotri_kroga), 10, 'r', 'filled');  
     hold on;
     scatter(x(~znotri_kroga), y(~znotri_kroga), 10, 'b', 'filled'); 
     hold off;

     % izbira 100 točk za izris 
     theta = linspace(0, 2*pi, 100); 
    radij = 1;  % Radi
    krog_x = radij * cos(theta);
    krog_y = radij * sin(theta);
    hold on;

     % Izris loka 
    plot(krog_x, krog_y, 'y', 'LineWidth', 2);
    title('Metoda Monte Carlo');
    xlabel('x-koordinate točk');
    ylabel('y-koordinate točk');
    legend("znotraj kroga","zunaj kroga","krožnica","Location","best");
    axis equal
    hold off;
end


function [priblizek_pija, napaka] = area_pi(n)     
   znotri=0;
   znotri=0;
   na_loku_kroznice=@(t) [cos(t);sin(t)];
   t=rand(0:pi/2);
    for i=1:n
        x = rand();
        y = rand();
        znotri=2*pi*rand();
         tocka_na_kroznici=[na_loku_kroznice(znotri)];
         tocke_kroznice(:,i) = tocka_na_kroznici;
         tocke_kvadrata(:,i) = [x;y;];
            if (x^2+y^2)<=1
                znotri=znotri+1;
            else
                znotri=znotri+1;
            end
    end
  priblizek_pija=4*znotri/n;
  napaka=abs(priblizek_pija-pi);
end
