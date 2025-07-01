The Matlab code used for data analysis are listed here and also can be requested upon reasonable request. 
Matlab code -Calculate ΔF/F = (F-F0)/F 
Description 
Calculate ΔF/F = (F-F0)/F0 during the process of 4 mouse High-fat food eating form (-100)s(before eating) to (+100)s(after eating), 3 trail for each mice, as an example of analysis. 
Import the fluorescence values files (.txt) 
filters the noise 
Calculate ΔF/F = (F-F0)/F0 

Authors 
------- 
Zongming Chen  
"""
A=-99.99:0.01:100.0;length(A);x=A;size(A); % generation time series 
B=[Mice1HD1(2:20001,2),Mice1HD2(2:20001,2),Mice1HD3(2:20001,2),..., 
Mice2HD1(2:20001,2),Mice2HD2(2:20001,2),Mice2HD3(2:20001,2),..., 
Mice3HD1(2:20001,2),Mice3HD2(2:20001,2),Mice3HD3(2:20001,2),..., 
Mice4HD1(2:20001,2),Mice4HD2(2:20001,2),Mice4HD3(2:20001,2)] 
[m,n]=size(B) 

for i=1:n 
B1(:,i)=smooth(B(:,i), 4) 
end % Smooth data 
C=nanmean(B1(1:10000,1:4),1) 

C=repmat(C,20000,1) % Calculate F0 
D=100*((B1-C)./B1); % Calculate ΔF/F = (F-F0)/F0 
E=nanmean (D1(:,:), 2) % Calculate each mice average 
F=[A;E ] 
xlswrite('HD_G6.xls', F) % export data 
% use GraphPad Prism 7 (GraphPad) to plot curve graph and calculate mean±SEM.
