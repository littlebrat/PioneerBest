%% Mapa local

A=[0 0; 412 0; 0 344; 412 344];
B=[0 0; 182 0; 0 184; 182 184];
C=[0 0; 207 0; 0 91; 207 91];
D=[0 0; 90 0; 0 50; 90 50];
E=[0 0; 120 0; 0 96; 120 96];
F=[0 0; 90 0; 0 15; 90 15];
G=[0 0; 167 0; 0 167; 167 167];
H=[0 0; 203 0; 0 167; 203 167];
I=[0 0; 217 0; 0 167; 217 167];
J=[0 0; 819 0; 0 167; 819 167];
K=[0 0; 167 0; 0 167; 167 167];
L=[0 0; 167 0; 0 1239; 167 1239];
M=[0 0; 167 0; 0 167; 167 167];
N=[0 0; 1239 0; 0 167; 1239 167];
O=[0 0; 167 0; 0 167; 167 167];
P=[0 0; 167 0; 0 1239; 167 1239];
Q=[0 0; 217 0; 0 54; 217 54];
R=[0 0; 285 0; 0 544; 285 544];

s = struct('A',A,'B',B,'C',C,'D',D,'E',E,'F',F,'G',G,'H',H,'I',I,'J',J,'K',K,'L',L,'M',M,'N',N,'O',O,'P',P,'Q',Q,'R',R);

%% Mapa Global com origem em G
canto=50;
desviosala=24;

H(:,1)=H(:,1)+G(2,1);
I(:,1)=I(:,1)+H(2,1);
J(:,1)=J(:,1)+I(2,1);
K(:,1)=K(:,1)+J(2,1);

P(:,2)=P(:,2)+G(3,2);
O(:,2)=O(:,2)+P(3,2);
N(:,1)=N(:,1)+G(2,1);
N(:,2)=N(:,2)+P(3,2);
M(:,1)=K(:,1);
M(:,2)=O(:,2);
L(:,1)=K(:,1);
L(:,2)=P(:,2);
Q(:,1)=I(:,1);
Q(:,2)=G(3,2)+Q(:,2);
F(:,1)=F(:,1)+canto;
F(:,2)=F(:,2)-F(3,2);
E(:,1)=E(:,1)+G(2,1)-E(2,1);
E(:,2)=E(:,2)-E(3,2)-F(3,2);

gmapa=[G;H;I;J;K;L;M;N;O;P;Q;F;E];
plot(gmapa(:,1),gmapa(:,2),'*');
