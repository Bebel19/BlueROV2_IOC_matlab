function S = skewMtrx(lambda)
S = [
    0           -lambda(3)  lambda(2);
    lambda(3)   0           -lambda(1);
    -lambda(2)  lambda(1)    0
    ];
end