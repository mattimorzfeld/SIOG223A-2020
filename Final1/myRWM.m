function [AccRatio,X,sRMSE]=myRWM(Nsteps,xo,xobs,d,s,lb,ub,sz)
n = length(xo);
%% initialization
X = zeros(n,Nsteps);
sRMSE = zeros(Nsteps,1);

X(:,1) = xo;
dM = RunModel(xo,xobs);
sRMSE(1) = sqrt(mean((s.\(d-dM)).^2));
LogPiOld = -0.5*norm(s.\(d-dM)).^2;

accMovesTotal = 0;
%% move NSteps 
for Step=1:Nsteps-1
    accMoves = 0;
    X(:,Step+1) = X(:,Step);
    sRMSE(Step+1) = sRMSE(Step);
    x_p = X(:,Step) + sz.*randn(n,1);
    if sum(x_p>lb)==n && sum(x_p<=ub)==n
        dM = RunModel(x_p,xobs);
        LogPiProp = -0.5*norm(s.\(d-dM)).^2;
        logalpha =  LogPiProp - LogPiOld;
        if rand<min(1,exp(logalpha))
            X(:,Step+1) = x_p;
            LogPiOld = LogPiProp;
            sRMSE(Step+1) = sqrt(mean((s.\(d-dM)).^2));
            accMoves = accMoves + 1;
        end
    end
    accMovesTotal = accMovesTotal + accMoves;
    fprintf('Acc. ratio at step %g/%g: %g\r',Step,Nsteps,accMovesTotal/Step)
end
AccRatio = accMovesTotal/Step;