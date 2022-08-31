%----------------------------------
%Author: Ravi Kakaiya
%Roll No : 21EE64R06
%----------------------------------
%Instructions:
%------------------------------------------------------------------
% -This code contain use of Custm_SVD function so it is recommended
%  to keep the function(Custm_SVD.m) along with this code.
% -While Running the code Please avoid Running in section in order 
%  to get perfect outputs.
%------------------------------------------------------------------
%% Viewing Input matrics As Image 
G = [255 255 255 255 255 255 255 255;
    255 255 255 100 100 100 255 255;
    255 255 100 150 150 150 100 255;
    255 255 100 150 200 150 100 255;
    255 255 100 150 150 150 100 255;
    255 255 255 100 100 100 255 255;
    255 255 255 255 50 255 255 255;
    50 50 50 50 255 255 255 255];
c=[];
figure;
subplot(2,3,1)
imshow(G,[]);
title('original')
%-------------------------------------------------------------------
%% Recontuction of Image Using Custom SVD function:
for k=1:5
[u,s,v,val] = Custm_SVD(G,k,0.001);
s = diag(s);
new_G = u*s*v;
c=[c norm(G-new_G)]
subplot(2,3,k+1)
imshow(new_G,[]);
title("k=" + k)
end
x = 1:k
figure;
plot(x,c);
title('Difference error between Original and Reconstructed Image')
%-------------------------------------------------------------------
%% Plotting the Convergence Graph
figure;
title('Convergence For Deiiferent values of K')
for i = 1:k
    [u,s,v,val] = Custm_SVD(G,k,0.001);
    hold on
    plot(val);
end
legend('K=1','K=2','K=3','K=4','K=5');
%-------------------------------------------------------------------