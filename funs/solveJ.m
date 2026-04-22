function J = solveJ(P, Avd, alpha, beta, W)

[n,k] = size(Avd{1});
[m, d] = size(Avd);
z = length(find(P>0));
sX = [n, k, z];
vec_ones = ones(z,1);

if nargin<5
   W0 = zeros(n,k);
   z_= 1;
   for v_=1:m
        for d_=1:d
            W0=W0+P(v_,d_)*Avd{v_,d_};
            if P(v_,d_)==1
               S{1,z_}=Avd{v_,d_};
               z_ = z_+1;
            end
        end
   end
end
W = W0/2/z;
for v =1:z
    QQ{v} = S{v};
end
Q_tensor = cat(3,QQ{:,:});
[myj, ~] = wshrinkObj_weight_lp(Q_tensor(:), vec_ones*beta./2./alpha,sX, 0,3,1);
J_tensor = reshape(myj, sX);
for v=1:z
    J{v} = J_tensor(:,:,v);
end
end




