function [A,r] = constructA_vd(X, k, d)
% X: each column is a data point dim:d*n
% k: number of neighbors
% issymmetric: set W = (W+W')/2 if issymmetric=1
% d:number of transmissions
n = size(X{1}, 1);
for v = 1 : length(X)
    D = L2_distance_1(X{v}', X{v}');
    [dumb, idx] = sort(D, 2); % sort each row
    rr = zeros(n,1);
    W = zeros(n,n);
    for i = 1:n
        di=dumb(i,2:k+2);
        rr(i) = 0.5*(k*di(k+1)-sum(di(1:k)));
        id = idx(i,2:k+2);
        W(i,id) = (di(k+1)-di)/(k*di(k+1)-sum(di(1:k))+eps);
    end
    r = mean(rr);
    A{v, 1} = (W+W')/2;
    for i = 2 : d
        A{v,i} = A{v, i-1} * A{v, 1};
    end
end
end


