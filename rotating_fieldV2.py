# -*- coding: utf-8 -*-

from matplotlib import pyplot as plt
import numpy as np
import cmath as cp

def plot_config():
    ax.set_rticks([0, 1, 2])
    ax.set_rmin(0)
    ax.set_rmax(1)
    ax.set_thetalim(0, np.pi*2)
    ax.set_xticks(np.linspace(0, 2*np.pi, 12, endpoint=False))
    ax.set_ylim(0, 2)
    ax.grid(True)
    ax.set_theta_direction(1)
    ax.set_theta_zero_location("E")

def plot_eixos():
    ax.arrow(0, 0, np.deg2rad(150), 2, edgecolor = 'black',  lw = 0.3, head_width = None, head_length = None)
    ax.arrow(0, 0, np.deg2rad(-30), 2, color = 'orange',  lw = 0.3, ls = '-', head_width = None, head_length = None)

if __name__ == '__main__':

    option = int(input("Escolha a opção:\n1 -> Sentido horário\n2 -> Sentido antihorário\n3 -> Campo resultante com apenas 2 fases\n\n-> "))

    if(option == 1 or option == 2 or option == 3):   

        # Plotagem da figura
        fig = plt.figure(figsize=(10,7))
        ax = plt.axes(projection="polar")

        # Habilita o modo interativo 
        plt.ion()

        # Ponto de origem
        ax.plot(0, 0, color='black', marker='o', markersize=5)

        ################################# Calculo dos complexos ###########################
        ###################################################################################

        # Declaração das constantes
        pi = np.pi
        f = 60
        w = 2 * pi * f
        j = cp.sqrt(-1)
        phi = 2/3*pi
        lim = 180

        # Listas que irão receber os valores da fem de cada fase e da fem resultante
        aa=[]
        bb=[]
        cc=[]
        fem_total = []

        t = np.linspace(0, pi, lim)  # Divide o espaço de 180º (ou pi radiano) em lim partes iguais

        for i in range(lim): # i é o indice da lista t e deve ter o mesmo tamanho

            aa.append(cp.sin(w*t[i]) * (cp.cos(0) + j*cp.sin(0)))

            if(option == 1):
                bb.append(cp.sin(w*t[i] + phi) * (cp.cos(phi) + j*cp.sin(phi)))
                cc.append(cp.sin(w*t[i] - phi) * (cp.cos(-phi) + j*cp.sin(-phi)))
            elif(option == 2):
                bb.append(cp.sin(w*t[i] - phi) * (cp.cos(phi) + j*cp.sin(phi)))
                cc.append(cp.sin(w*t[i] + phi) * (cp.cos(-phi) + j*cp.sin(-phi)))
            elif(option == 3):
                bb.append(cp.sin(w*t[i] + phi) * (cp.cos(phi) + j*cp.sin(phi)))
                cc.append(complex(0,0))

            fem_total.append(aa[i] + bb[i] + cc[i])

            ###################################################################################

            plt.show()
            ax.clear()
            plot_config()

            ax.annotate("", xy=(cp.phase(aa[i]), (abs(aa[i]))), xytext=(0, 0), arrowprops=dict(arrowstyle="simple", color="blue"))
            ax.annotate("", xy=(cp.phase(bb[i]), (abs(bb[i]))), xytext=(0, 0), arrowprops=dict(arrowstyle="simple", color="green"))
            ax.annotate("", xy=(cp.phase(cc[i]), (abs(cc[i]))), xytext=(0, 0), arrowprops=dict(arrowstyle="simple", color="red"))
            ax.annotate("", xy=(cp.phase(fem_total[i]), (abs(fem_total[i]))), xytext=(0, 0), arrowprops=dict(arrowstyle="simple", color="black"))

            plt.pause(0.2)

    else:
        print("\nOpção inválida\n")