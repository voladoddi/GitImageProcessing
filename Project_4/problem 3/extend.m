function extension=extend(matrix_array,extend_size)


A=matrix_array;
ES=extend_size/2;

Row=size(A,1);
Col=size(A,2);

B=repmat(A(1,:),ES,1);
D=repmat(A(Row,:),ES,1);

C=vertcat(B,A);
C=vertcat(C,D);
E=repmat(C(:,1),1,ES);
F=repmat(C(:,Col),1,ES);

Res=[E,C];
Res=[Res,F];

extension=Res;

end
