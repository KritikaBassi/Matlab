% BIG_M
clc
clear all

M = 1000;
cost = [-2 -1 0 0 -M -M 0];
A1 = [3 1 0 0 1 0 ; 4 3 -1 0 0 1; 1 2 0 1 0 0];
b = [3; 6;3]; 
bv = [5 6 4];
A=[A1 b]

B=A(:,bv);
A=inv(B)*A;

ZjCj= cost(bv)*A-cost;
table=[ZjCj;A];

simpTable=array2table(table)
ZC=ZjCj(:,1:end-1);

[colmnVal,ColmnIndx]=min(ZC)

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