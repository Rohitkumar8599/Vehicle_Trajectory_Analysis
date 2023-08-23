%% Question 1(a):- Plot Graph Between postion vs time for 10 vehicles

clc, clear
file= readmatrix("smoothed_data.xlsx");   % here we read the excel file 
unique1=unique(file(:,1))                 % here we create the unquie vehicle id

for k=1:10                                % here for loop is start from 1 to 10
    veh{k}=file(file(:,1)==unique1(k),:); % here we take the element of respected vehicle id

    f1=figure(1);                         % here we form the blank figure whose name is f1
    plot(veh{k}(:,2),veh{k}(:,3));        %here we plot the graph between postion vs time 
    hold on                               %it hold the graph of each veh id in the figure 
    legend1(k)=sprintf("Veh-ID %d",k);    %it creates loop for legend value fro respective vehicle id  
end

xlabel('Time (sec)')                      %label x-axis
ylabel('Position(m)')                     %label y-axis 
title('Position Vs Time')                 %give the title of the graph
legend(legend1(1:1:10),'Location','northwest')                   %plot the legend in the graph
hold off

%% Question 1(b):- Draw Speed vs Time graph for 2nd, 4th, 6th, 8th and 10th vehicle (using central limit theorem)

for k=2:2:10
    vel=NaN(size(veh{k},1),1)              % here we create null matrix of velocity which contains NaN value
    dt=NaN((size(veh{k},1)-2),1)           %here we create null matrix for time which contain NaN value 
    
    dt(1:end)=veh{k}(2:end-1,2)-veh{k}(1:end-2,2) % here we insert the difference between the time with consecutive row
    vel(2:end-1)= (veh{k}(3:end,3)-veh{k}(1:end-2,3))./(2*dt); % here we insert the difference between the velocity with consecutive row
    
    f2=figure(2);
    veh{k}=[veh{k} vel] 
    plot(veh{k}(:,2),veh{k}(:,4))        % here we plot the graph between velocity vs time 
    hold on
    legend2(k)=sprintf("Veh-ID %d",k);
end

xlabel('Time (sec)')                     % label x-axis 
ylabel('Speed (m/s)')                    % label y-axis
title('Speed Vs Time')                   % give title to the graph
legend(legend2(2:2:10),'Location','southeast');
hold off

%% Question 1(c): Draw Acceleration vs Time graph for 2nd, 4th, 6th, 8th and 10th vehicle (using central limit theorem)

for k=2:2:10
    acc=NaN(size(veh{k},1),1)         % here we create null matrix of acceleration which contains NaN value
    dt=NaN((size(veh{k},1)-2),1)      % here we create null matrix of time which contains NaN value

    dt(1:end)=veh{k}(2:end-1,2)-veh{k}(1:end-2,2) % here we find the difference between the time 
    acc(2:end-1)= (veh{k}(3:end,3)-2*veh{k}(2:end-1,3)+ veh{k}(1:end-2,3))./(dt.^2); % here we find the acceleration 
    
    f3=figure(3);
    veh{k}=[veh{k} acc]
    plot(veh{k}(:,2),veh{k}(:,5))      % here we draw the graph between acceleration and time 
    hold on
    legend3(k)= sprintf("Veh-ID %d",k) 
end

xlabel("Time (sec)");                  % give the label x-axis
ylabel("Acceleration (m/s^2)");        % give the label y-axis
title('Acceleration vs time');         %give the title to the graph
legend(legend3(2:2:10),'Location','southeast');
hold off

%%