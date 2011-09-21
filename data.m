function [b, H, c] = data
%DATA Generate the data for the problem with different dimension N of the matrices
% b and c are real vectors and H a symmetric positive definite matrix
% If you want to changer the datas of the problem, you have to modify this
% file. Be careful with the size of the matices, b abd c are column vectors
% and H a square matrix, with the same size than b or c.

b = [ 1; 0];
c = [ 1; 1];
H = [ 1, 1 ; 1, 1];

end
