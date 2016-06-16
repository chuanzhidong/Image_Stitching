function H_3x3 = CalHom(Source, Destination)
%-------------------------------- Step 5a ---------------------------------%
% Simplefunction used to calulate the homography matrices with the help of 
% Eigen vectors and eigen values...
n = size(Source,1);
A = zeros(2*n, 9);
for i = 1:n
    A(2*(i-1)+1,1:3) = [Source(i,:),1];
    A(2*(i-1)+1,7:9) = -1*Destination(i,1)*[Source(i,:),1];
    A(2*(i-1)+2,4:6) = [Source(i,:),1];
    A(2*(i-1)+2,7:9) = -1*Destination(i,2)*[Source(i,:),1];
end
A_pseudo_inverse = A'*A;

[V,D] = eig(A_pseudo_inverse);
H_3x3 = [V(1:3,1)';V(4:6,1)';V(7:9,1)'];
end