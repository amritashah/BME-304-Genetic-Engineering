%%%Daniel Charlebois R2016b - WSE 187 Assignment #2 Matlab Script
%%%ODE (ordinary differential equation) simulator - numerically simulates 
%%%the coupled ODE model of the Negative Feedback (NF) gene circuit.

clc; clear all; close all;

tic

%parameters
global a theta n b g C f c l  
a=11.6481; theta=0.4323; n=4; b=9.8173; g=0.12; f=0.0042; c=2.8459; l=0.3225;          
t_end = 48; dt = 1;   
C_start=0; C_incr=0.1; C_end=6; 
C_data=C_start:C_incr:C_end;
C_cnt=0;

for C=C_start:C_incr:C_end
   
    C_cnt=C_cnt+1;
    
    %initial numbers for each chemical species
    tetr = 0; dox = 0; gfp = 0;
    
    %call to ODEsolver 
    [t, X] = ODE_NF_dose_response(t_end,dt,tetr,dox,gfp);
    
    %save steady-state (48 hrs) data for each doxycyline concentration
    tetr_data(C_cnt)=X(end,1);
    dox_data(C_cnt)=X(end,2);
    gfp_data(C_cnt)=X(end,3);
    
    
end

%save data
save('NF_ODE_data.mat','C_data','tetr_data','dox_data','gfp_data');

%plot figures
hold on
plot(C_data,tetr_data/max(tetr_data),'r-','LineWidth',2) 
plot(C_data,dox_data/max(dox_data),'b-','LineWidth',2) 
plot(C_data,gfp_data/max(gfp_data),'k-','LineWidth',2) 
hold off
xlabel('extracellular doxycycline (ug/ml)'); ylabel('normalized concentration');
legend('inducer-free tetR (x)', 'intracellular doxycycline (y)', 'yEGFP::ZeoR (z)','Location','northwest')
title('NF Gene Circuit')
 
 toc