function dY = MVT(t, Y, modo)

    masa_carro = 290;       % kg
    amort_carro = 1000;     % Ns/m
    masa_rueda = 59;        % kg
    k_susp = 16182;         % N/m
    k_neumatico = 19000;    % N/m
    fuerza_ext = 0;         % N
    
    dY = zeros(4,1); 
    
    if modo == 1
        z_suelo = 0.05 * sin(0.5*pi*t);   
    else
        z_suelo = 0.05 * sin(20*pi*t);     
    end
  
    x_c = Y(1);   
    x_r = Y(2);  
    v_c = Y(3);   
    v_r = Y(4);   
    
    dY(1) = v_c;
    dY(2) = v_r;
    dY(3) = (fuerza_ext - amort_carro*v_c + amort_carro*v_r - k_susp*x_c + k_susp*x_r) / masa_carro;
    dY(4) = (-fuerza_ext + k_neumatico*z_suelo + amort_carro*v_c - amort_carro*v_r + k_susp*x_c - (k_susp+k_neumatico)*x_r) / masa_rueda;
end