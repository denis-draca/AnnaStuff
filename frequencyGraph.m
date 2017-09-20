function [fitobject] = frequencyGraph( points, scale, tolerance )
frequency = [];
loopsDone = 0;


for i = 1:scale:length(points(:,1))
   loopsDone = loopsDone + 1;
   counter = 0;
   try
       for x = i:i+scale
           if(points(x,2) < tolerance)
               counter = counter + 1;
           end
       end

       frequency(loopsDone,1) = loopsDone;
       frequency(loopsDone,2) = counter/(points(i+scale,1) - points(i,1));
   catch
   end
   
    
end

% plot(frequency(:,1), frequency(:,2), '*');

fitobject = fit(frequency(:,1), frequency(:,2),'smoothingspline');

% hold on;
% 
% plot(fitobject);

end

