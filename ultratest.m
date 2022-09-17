clc
%a = arduino("com3", "uno","libraries", "Ultrasonic")
%ultra = ultrasonic(a, "D3", "D2")

Iterations = 200;
D = zeros(Iterations,1);
tic
for i = 1:Iterations
    distance1 = readEchoTime(ultra)*170;
    pause(0.05);
    distance2 = readEchoTime(ultra)*170;
    distance = (distance1+distance2)/2;
    D(i) = seconds(distance) * 100;
end
T = toc;

time = linspace(0,T,Iterations);

plot(time, D)