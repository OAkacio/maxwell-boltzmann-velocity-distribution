import math
from matplotlib import pyplot as plt
def main():
    repeticao=int(input("Escreva aquia quantidade de gráficos que deseja comparar: "))
    i=1
    while i<=repeticao:
        R=8.314 #Constante Termodinâmica
        Tc=float(input("Digite a temperatura do gás em graus célsius: "))
        u=float(input("Digite a quantidade de gás que existe no recipiente em mols: "))
        def cpk(tc): #Função que recebe um valor em céucius e retorna em kelvin.
            tk=((tc/5)*9)+32
            return tk
        def prob(v): #Função que determina a probabilidade de encontrar uma partícula com determinada velocidade no sistema fechado determinado.
            p=4*(math.pi)*((u/(2*(math.pi)*R*T))**(3/2))*(v**2)*(math.e)**((-u*v**(2))/(2*R*T))
            return float(p)
        T=cpk(Tc)
        vp=((2*R*T)/(u))**(1/2) #Equação da velocidade mais provável.
        vm=((8*R*T)/(math.pi*u))**(1/2) #Equação da velocidade média.
        vrms=(3*R*T/u)**(1/2) #Equação da velocidade média quadrática.
        """
        Criar uma lista que existem os valores para o eixo X de 0 à duas vezes o valor da velocidade média quadrática.A partir disso, gerar uma lista para o eixo Y de acordo com a função probabilidade.
        """
        x0=[i for i in range(0,int(3*vrms))]
        y0=[0 for i in range(0,int(3*vrms))]
        vx=[i for i in range (0,int(3*vrms))]
        py=[prob(i) for i in vx]
        vx2=[vp,vrms,vm]
        vy2=[prob(i) for i in vx2]
        vrms2="%.1f"%vrms
        vm2="%.1f"%vm
        vp2="%.1f"%vp
        plt.plot(vx,py)
        plt.scatter(vx2,vy2,c=("red","blue","yellow"))
        plt.text(vp, prob(vp), "VP:{} m/s".format(vp2))
        plt.text(vrms, prob(vrms), "VRMS:{} m/s".format(vrms2))
        plt.text(vm,prob(vm),"VM:{} m/s".format(vm2))
        plt.plot(x0,y0)
        i+=1
    plt.show()
main()