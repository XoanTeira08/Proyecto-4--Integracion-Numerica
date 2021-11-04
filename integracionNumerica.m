%Integracion Numerica
fprintf('Bienvenido al programa para calcular la intregacion numerica\nde cualquier funcion\n')
fprintf(' \n');

%Introduccion de datos 
fprintf('Ejemplo de como ingresar una función: (3*x^2+6*x-10*x^3)\n')
funcion=input('Ingrese la función/f(x) entre parentesis: ','s');
funcion=inline(funcion);
fprintf(' \n');
a=input('Ingrese el límite inferior de la integral: ');
b=input('Ingrese el límite superior de la integral: ');
fprintf(' \n');
nTrap=input('Ingrese el número de intervalos para el trapecio compuesto: ');
nSimp1=input('Ingrese el número de intervalos el cual debe ser un numero par para el simpson 1/3: ');
nSimpOcta=input('Ingrese el número de intervalos el cual debe ser un numero multiplo de 3 para el simpson 3/8: ');;
%Calculos
%Trapecio Simple
trapSimple=(b-a)*((funcion(a)+funcion(b))/2);
%Trapecio Compuesto
hTrap=(b-a)/nTrap;
trapComp=0
for(i=1:(nTrap-1))
xTrap=a+hTrap*i;
trapComp=trapComp+funcion(xTrap);
endfor
trapComp=hTrap*(funcion(a)+funcion(b))/2+hTrap*trapComp;
%Simpson Simple
xm1=((a+b)/2);
simpSimple=((b-a)/6)*(funcion(a)+4*funcion(xm1)+funcion(b));
%Simpson Compuesto 1/3
hSimp1=(b-a)/nSimp1;
nSimp1=nSimp1/2;
sum1=0;
sum2=0;
for(i=1:nSimp1)
xSimp1=a+hSimp1*(2*i-1);
sum1=sum1+funcion(xSimp1);
endfor
for(i=1:(nSimp1-1))
xSimp1=a+hSimp1*2*i;
sum2=sum2+funcion(xSimp1);
endfor
simpCompuesto=hSimp1*(funcion(a)+funcion(b)+4*sum1+2*sum2)/3;
%Simpson Compuesto 3/8
if (mod(nSimpOcta,3)==0)
  hSimpOcta=(b-a)/nSimpOcta;
  s3=0;
  st=0;
  for(i=1:nSimpOcta-1)
  if (mod(i,3)==0)
  xSimpOcta=a+hSimpOcta*i;
  s3=s3+funcion(xSimpOcta);
end
end
for(i=1:nSimpOcta)
xSimpOcta=a+hSimpOcta*i;
st=st+funcion(xSimpOcta);
end
st=st+funcion(a);
sr=st-(funcion(a)+funcion(b)+s3);
simpOcta=(3*hSimpOcta/8)*(funcion(a)+2*s3+3*sr+funcion(b));
end

%Impresion
%Trapecios
fprintf(' \n');
fprintf('El resultado utilizando Trapecio Simple es de: %i\n', trapSimple);
fprintf('El resultado utilizando Trapecio Compuesto es de: %i\n', trapComp);
%Simpson
fprintf(' \n');
fprintf('El resultado utilizando Simpson Simple es de: %i\n', simpSimple);
fprintf('El resultado utilizando Simpson Compuesto 1/3 es de: %i\n',simpCompuesto);
fprintf('El resultado utilizando Simpson Compuesto 3/8 es de: %i\n',simpOcta);