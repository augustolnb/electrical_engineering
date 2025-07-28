# Código de implementação do método de Newton Raphson desacoplado
# Aplicado a sistemas elétricos de potência
# Desenvolvido no Google Colab por: Lucas Augusto Nunes de Barros
# Estudante de Engenharia Elétrica - IFTO
# v1.5 10/09/2022

clc;pkg load symbolic;
% clear;

% variaveis numericas
tolerancia=1.e-6;
xo = [0;0;1]; % estimativas iniciais para cada incognita; fase = 0, tensão = 1
erro_p = 100;
erro_q = 100;
it = 1; % controle do num. de iterações
max_iter = 15; % numero max iterações
H_size = 2;
L_size = 1;

% variaveis simbolicas
syms theta1 theta3 v1
H = sym(zeros(H_size)); % H -> submatriz simbolica
L = sym(zeros(L_size)); % L -> submatriz simbolica

# vetor de variaveis simbolicas
vars = [theta1,theta3,v1]

# funções das barras
d_p1 = -(15/100)+(33/100)*v1*cos(theta1)-v1*(33/10)*sin(theta1)-(33/100)*v1**2;
d_p3 = 0.1222+0.0778*cos(theta3)-1.2451*sin(theta3);
d_q1 = 0.05+3.3003*v1*cos(theta1)+0.33*v1*sin(theta1)-3.2301*v1**2;
% vetor de funções
ff = [d_p1;d_p3;d_q1];

% montagem das submatrizes (H e L) da jacobiana
for i = 1 : length(ff)
  for j = 1 : length(vars)
    if( i <= H_size && j <= H_size ) % submatriz H
      H(i,j) = diff(ff(i), vars(j));
    endif
    if( i > H_size && j > H_size ) % submatriz L
      L(i-H_size,j-H_size) = diff(ff(i), vars(j));
    endif
  endfor
endfor


% calcular as raizes usando H e L
####################################
while erro_p >= tolerancia && erro_q >= tolerancia
  fx = subs(ff, {theta1, theta3, v1}, {xo(1), xo(2), xo(3)});
  fj = subs(J, {theta1, theta3, v1}, {xo(1), xo(2), xo(3)});
  x1 = -(inv(fj)*fx);
%  fx1 = subs(ff, {theta1, theta3, v1}, {x1(1), x1(2), x1(3)});
  erro_p = subs(d_p1, {theta1, theta3, v1}, {xo(1), xo(2), xo(3)});
  erro_q = subs(d_q1, {theta1, theta3, v1}, {xo(1), xo(2), xo(3)});
  xo = x1;
  it = it+1;

    if it > max_iter
      disp(' Numero maximo de iterações excedido \n');
  return;
  endif
endwhile

xo
