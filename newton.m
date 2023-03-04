# Código de implementação do método de Newton Raphson
# Aplicado a sistemas elétricos de potência
# Desenvolvido no Google Colab por: Lucas Augusto Nunes de Barros
# Estudante de Engenharia Elétrica - IFTO
# v1.0 08/09/2022

%%% Função multivariavel definida em código %%%

clc;pkg load symbolic;
% clear;
tolerancia=1.e-6;
xo=[0;0;1]; % estimativas iniciais para cada incognita; fase = 0, tensão = 1
erro_p = 100;
erro_q = 100;
it = 1; % num. de iterações
max_iter = 15; % numero max iterações
J = zeros(3);
% definindo as variaveis simbolicas
syms theta1 theta3 v1
# vetor de variaveis simbolicas
vars = [theta1,theta3,v1]
# definindo funções das barras
d_p1 = -(15/100)+(33/100)*v1*cos(theta1)-v1*(33/10)*sin(theta1)-(33/100)*v1**2;
d_p3 = 0.1222+0.0778*cos(theta3)-1.2451*sin(theta3);
d_q1 = 0.05+3.3003*v1*cos(theta1)+0.33*v1*sin(theta1)-3.2301*v1**2;
% vetor de funções
ff = [d_p1;d_p3;d_q1];
% montagem da matriz jacobiana
J = jacobian(ff,[theta1,theta3,v1]); % gera a jacobiana. Ordenar as variaveis dessa forma: primeiro:(theta1, theta2, theta3...) segundo(V1,V2,V3...).

while erro_p >= tolerancia && erro_q >= tolerancia
  fx = subs(ff, {theta1, theta3, v1}, {xo(1), xo(2), xo(3)});
  fj = subs(J, {theta1, theta3, v1}, {xo(1), xo(2), xo(3)});
  x1 = -(inv(fj)*fx);
  fx1 = subs(ff, {theta1, theta3, v1}, {x1(1), x1(2), x1(3)});
  erro_p = subs(d_p1, {theta1, theta3, v1}, {xo(1), xo(2), xo(3)});
  erro_q = subs(d_q1, {theta1, theta3, v1}, {xo(1), xo(2), xo(3)});
  xo = x1;
  it = it+1;

  if it > max_iter
      disp(' Numero maximo de iterações excedido \n');
  return;
  endif
endwhile

disp("Jacobiana:\n");
disp(J);
 
