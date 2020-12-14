%%function l(x)
clear
close all
clc

k = 0:4;
x = 0:.5:4;
% j = 10;
% LSP = zeros(length(x),1);
% for kk=1:length(x)
%     LSP(kk)=lsp(x(kk),k,j);
% end
% plot(x,LSP)


% theta = randn(11,1);
% LSP = zeros(length(x),1);
% for kk=1:length(x)
%     LSP(kk)= 0;
%     for jj=1:length(theta)
%          LSP(kk)=LSP(kk)+theta(jj)*lsp(x(kk),k,jj-1);
%     end
% end
% plot(x,LSP)
% hold on, plot(k,theta,'.','MarkerSize',20)

theta = randn(length(k),1);
A = makeA(x,k);
plot(x,A*theta)
hold on, plot(k,theta,'.','MarkerSize',20)

        

