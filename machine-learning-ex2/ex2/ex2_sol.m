 data = load('ex2data1.txt');
 x = data(:,1:2);
 y = data(:,3);
 pos = find(y==1); neg = find(y==0);
 plot(x(pos,1),x(pos,2),'bo');
 hold on
 plot(x(neg,1),x(neg,2),'r+');
 xlabel('Exam 1 score');
 ylabel('Exam 2 score');
 legend('Admitted','Not Admitted');
 hold off
 x = [ones(size(x,1),1) x];
 theta = rand(size(x,2),size(y,2));
 alpha = 0.001;
 m = length(y);
 num_iters = 1500;
 cost_history = zeros(num_iters,1);
 for i = 1:num_iters
 h = (sigmoid(x*theta) - y);
 for j = 1:length(theta)
 theta(j) = theta(j) - (alpha/m)*h'*x(:,j);
 end
 %theta = theta - (alpha/m)*x'*h;
 g = 1./(1+exp(-(x*theta)));
 cospos= -(y')*log(g);
 cosnos= -(1-y')*log(1-g);
 cost_history(i)= (1/m)*(cospos+cosnos);
 end
 figure;
 plot(cost_history);
 plotDecisionBoundary(theta,x,y)