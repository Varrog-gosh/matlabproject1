function [ b, H, c ] = data
%DATA Generate the data for the problem with different dimension of the matrices
% b and c are real vectors and H a symmetric positive definite matrix
% If you want to changer the datas of the problem, you have to modify this
% file. Be careful with the size of the matices, b abd c are column vectors
% and H a square matrix, with the same size than b and c.
% INPUT
% OUTPUT
%  b	The vector b
%  H	The symmetric positive definite matrix
%  c	The vector c to generate the matrix C

b = [ 1; 0];
c = [ 200; 400];
H = [ 200, 1000 ; 1000, 200];

end
