%% Two plots

results = VDV;

frequencyData = ProcessData;

for i = 1:6
    f = figure(i);
    tempdata = frequencyData{i};
    
    for x = 1:10
        hold on;
        yyaxis left;
        plot(tempdata{x}.fitted);
    end
    
    legend('Participant ' + string(1:6));
    
    hold on;
    yyaxis right;
    plot(results{i}.time, results{i}.results);
    legend('Participant ' + string(1:6));
end