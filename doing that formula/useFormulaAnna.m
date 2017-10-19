disp("hello world");
list = ["Anna.txt", "Denis.txt", "Somaia.txt", "Enoch1.txt", "Enoch2.txt", "Martin.txt"]; %you can change these, the code will process these txt files
tolerance = [4.9, 4.9, 4.1, 4.8, 4.8, 4.9]; %these are the tolerances for each person. This is inline with the above order
dataHolder = [];
seperator = 10000; %change this if you want to reduce to increase the amount of readings you get back. Making this number smaller will make the code check the frequency more often

listNames = ["Anna", "Denis", "Somaia", "Enoch1", "Enoch2", "Martin"];

elementNames = [1,2,3,4,5,6,7,8,9,10];
for i = 1:length(list)
    f = figure('Name',list(1,i));
%     axis([0 7.5 0 10]);

    data = tdfread(list(1,i), '\t');
    
    fields = fieldnames(data);
   
    time = data.(fields{1});
    reading = data.(fields{2});

    resultList = zeros(length(time),1);
    
    for x = 1:length(time)
       timeMax = time(x,1);
       fun = @(t) (reading(x,1)^4)*ones(size(t));
       
       result = integral(fun, 0, timeMax);
       
       resultList = nthroot(result,4);
    end
    
    plot(time,resultList);
    
end