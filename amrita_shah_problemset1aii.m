time = [0:0.25:25];     % create array of time values, ranging from 0 to 25s at steps of 0.25s
M = 6.78*cos(time).*exp(-0.21*time)+25.4;      % create 'M' array that is a function of 'time' array
plot(time,M)         % plot the graph of protein concentration vs. time
T = 6.78*exp(-0.21*time)+25.4;          % create 'T' array that is a function of 'time' array
plot(time,M, '-.r', time,T, '--k')      % plot protein concentration in red dot-dash & concentration change in black dash-dash as a function of time
xlabel('Time [s]')                      % label x axis
ylabel('Concentration [mM]')            % label y axis
title('Concentration over Time')        % title the graph
legend('Protein Concentration', 'Concentration Change')    % add a labelled legend
grid on                                 % turn on grid
less = [];              % create empty array for time values <24.75
len=numel(M);           % set a variable equal to the number of elements in 'M' array
for i=1:(len)           % iterate over 'M' that number of times; setting variable 'i' equal to column # in M
    n=M(1,i);           % set variable 'n' equal to the value in M that the for loop is at
    if n<24.75          % if the value in M is less than 24.75
        less(end+1)=time(1,i);      % add the corresponding time value (same row & column) to the end of array 'less'
    end
end
ratio=numel(less)/numel(time)       % find ratio of time where M<24.75 mM and print it in command window

