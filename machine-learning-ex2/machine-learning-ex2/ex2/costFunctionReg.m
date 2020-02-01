function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


z = sigmoid(X*theta);
newtheta = [0;theta(2:size(theta),1)]
J=-1*((sum(y.*log(z)+(1-y).*log(1-z)))/m) + lambda*sum(newtheta.^2)/(2*m);

pos = find(y==1);
neg = find(y==0);
posx = z(pos,1);
negx = z(neg,1); 

posx = posx -1;
negx = negx -0;

for i =1:size(grad,1),
  grad(i) = sum(posx .* (X(pos,i))) + sum(negx .* (X(neg,i)));
  grad(i)= grad(i)/m;
  if(i>=2)
  grad(i)= grad(i)+(lambda/m)*theta(i);
  end;
  end;
  






% =============================================================

end
