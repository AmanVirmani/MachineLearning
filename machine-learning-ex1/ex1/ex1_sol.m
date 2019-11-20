data = load('ex1data1.txt');
x= data(:,1); y= data(:,2);
plot(x,y,'rx');
x= [ ones(size(x)) x];
theta = rand( size(x,2), size(y,2));
alpha = 0.01;
num_iter= 1000;
m = length(y);
cost_history = zeros(num_iter,1);
for i= 1:num_iter
 h= (x*theta-y)';
 for j= 1:length(theta)
  theta(j)= theta(j)- (alpha/m)*h*x(:,j);
 end
 cost_history(i)= (sum((x*theta-y).^2))/(2*m);
end
hold on
 plot(x(:,2),x*theta,'b-');
hold off
