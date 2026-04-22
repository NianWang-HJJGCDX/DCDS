function [y,W]=MCDLT(Avd,c,NITER,Z, alpha, beta,eta)

[m,o]=size(Avd);[n, ~] = size(Avd{1});
P = ones(m,o);
W = zeros(n,n);
for v=1:m
    for d=1:o
         W=W+P(v,d)*Avd{v,d};
    end
end
W = W/m/o;

for iter =1:NITER
    J = solveJ(P, Avd, alpha, beta);
    %solve S
    S = solveS(W,J,alpha);
    %solve W
    [y, W] = solveW(S,c,eta);
     %solve P
    Pold = P;
    P = zeros(m, o);
    norm_WS = cellfun(@(x)(norm(W-x,'fro')^2), Avd, 'UniformOutput', true); 
    norm_WS_vec = reshape(norm_WS, 1, m*o);
    [~,ind] = sort(norm_WS_vec,'ascend');
    P(ind(1:Z)) = 1; 
%     if norm(P-Pold,'fro')^2 ==0
%         break;
%     end;
end
end
