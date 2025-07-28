clear;clc;
function z_resultante = z_paralelo (real1, img1, real2, img2)

    printf("\n\n\t\tEntrada em coord. cart.\n\tCalculadora de Impendancias em Paralelo\n\n");
    printf("\n\n\tImpendancia em paralelo - Coord. Polar\n\n");
    printf("\n\tPrimeira Impendancia:\n");
    real1 = input("\tReal: ");
    img1 = input("\tImag.: ");

    [fase1, modulo1] = cart2pol (real1, img1);
    fase1 = fase1*180/pi;

    printf("\n\t\tSegunda Impendancia:\n");
    real2 = input("\tReal: ");
    img2 = input("\tImag.: ");

    [fase2, modulo2] = cart2pol (real2, img2);
    fase2 = fase2*180/pi;

    zS = modulo1 * modulo2;
    cS = fase1 + fase2;

    zi = real1+real2;
    ji = img1+img2;
    [cI, zI] = cart2pol (zi, ji);
    cI = cI*180/pi;

    z = zS/zI;
    c = cS-cI;

    printf("\nCoor. polares\n");
    z_resultante = complex(z, c) #retorna o valor em coord. polar
    printf("\nCoor. cartesiana\n");
    [z_real, z_img] = pol2cart((c*pi/180), z);
    complex(z_real, z_img)

  printf("\n\n\n");
    return

 endfunction

