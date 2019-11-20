data = load('ex1data2.txt');
x = data(:,1:2); 
y = data(:,3);
mu = mean(x);
sigma = std(x);
x_norm = x;
for i = 1: size(x,2)
x_norm(:,i) = (x(:,i) - mu(i))/sigma(i);
end
x_norm  = [ones(size(x_norm,1),1) x_norm];
theta = rand(size(x_norm,2), size(y,2)); 
alpha = 0.01;
num_iters = 1500;
m = size(y,1);
cost_history = zeros(num_iters,1);
for i =1: num_iters
h= (x_norm*theta - y)';
for j=1: size(theta,1)
theta(j) = theta(j) - (alpha/m)*h*x_norm(:,j);
end
cost_history(i) = (sum((x_norm*theta-y).^2))/(2*m);
end
plot(cost_history)

price = 0; % You should change this
pin=[1650 3] - mu;
pin(1)= pin(1)/sigma(1);
pin(2)= pin(2)/ sigma(2);
price= [1 pin]*theta;
% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;



Predicted price of a 1650 sq-ft, 3 br house (using gradient descent):
 $289314.620338
Program paused. Press enter to continue.
Solving with normal equations...
Theta computed from the normal equations: 
 89597.909543 
 139.210674 
 -8738.019112 

Predicted price of a 1650 sq-ft, 3 br house (using normal equations):
 $91490.957664
