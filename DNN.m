tic;
a=rand(30000,30000);
b=abs(a);
toc;

tic;
c= gpuArray(rand(30000,30000));
d=abs(c);
toc;