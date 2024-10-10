% Simplex
clc
clear all

cost=[2 1 0 0 0 0];
A1=[1 2 1 0 0;1 1 0 1 0;1 -1 0 0 1];
b=[10;6;2];
A=[A1 b];
bv=[3 4 5];

ZjCj= cost(bv)*A-cost;
table=[ZjCj;A];
simpTable=array2table(table)
ZC=ZjCj(:,1:end-1);
[colmnVal,ColmnIndx]=min(ZC);

while(min(ZC)<0)
    sol=A(:,end);
    colmn=A(:,ColmnIndx);
    for i=1:size(A,1)
        if(colmn(i)>0)
            ratio(i)=sol(i)/colmn(i);
        else
            ratio(i)=inf;
        end
    end
    [rowVal,rowIndx]=min(ratio);
    bv(rowIndx)=ColmnIndx;
    B=A(:,bv);
    A=inv(B)*A;
    
    ZjCj= cost(bv)*A-cost;
    table=[ZjCj;A];
    simpTable=array2table(table)
    ZC=ZjCj(:,1:end-1);
    [colmnVal,ColmnIndx]=min(ZC);
end