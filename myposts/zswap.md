
# Utilizando ZSWAP

Data: 05/03/2017

----
> A utilização dessa ferramenta vai depender muito do seu dia-dia. Caso você tenha uma grande quantidade de memoria RAM ou utilize pouca swap, esses métodos não vão ser tão uteis para você.


### **Sumário**

1. Introdução
2. ZRAM
3. ZSWAP
4. ZCACHE
5. Conclusão
6. Referências

------------

## **Introdução**

Nesse texto vou apresentar 3 coisas interessantes para se utilizar: ZRAM, ZSWAP e ZCACHE. No título especifiquei o uso de ZSWAP pois é o recurso que utilizo hoje e combina mais com meu perfil.

O gerenciamento de memória feito pelo sistema operacional é primordial para o bom funcionamento do mesmo. Quando eu comecei a utilizar mais de um monitor para meus trabalhos diários, nitidamente a quantidade de aplicativos em execução aumentaram. Já não bastava utilizar o Chrome com +100 abas abertas, ainda tinha o Atom e diversos outros aplicativos que também utilizam Chromium na sua execução. Pra compensar utilizo o [i3](https://i3wm.org/) para gerenciamento de janelas e ganho uma quantidade de RAM considerável (Que o Unity ou Gnome usária)

![Chrome sendo Chrome <>](myposts/img/9511f847798db5ec08a51a3fa597d4c5.jpg)

O grande problema é que meu notebook tem somente 6GB de RAM e ainda por cima ele é um Dell que utiliza um HD muito lento que trabalha com 5400 RPM. Toda vez que minha memória chegava no limite, o linux assionava o uso da Swap o que era bizarro pois começava a travar tudo e fica impossivel continuar trabalhando sem fechar minhas coisas.

Por conta da infelicidade desse HD que veio no meu notebook, senti a necessidade de comprar um SSD para pelo menos o sistema operacional se comportar de maneira mais fluida. Ao comprar o SSD eu soube que o uso do Swap ficaria muito melhor, porém me perguntei se o grande uso de I/O poderia diminuir a vida útil do meu dispositivo e se existia alguma ferramenta que poderia me ajudar com o gerenciamento de memória. Foi aí que achei alguns textos falando sobre **ZRAM**, **ZSWAP** e **ZCACHE**. Onde vou descrever o que pude entender. Sendo que cada um deles é usado na seguinte situação:

- **ZRAM** Se você não utiliza/tem memória swap.

- **ZSWAP** Se você utiliza/tem memória swap.

- **ZCACHE** Similar ao ZSWAP.

------------

## **ZRAM**

ZRAM é um modulo do kernel linux. Ele monta blocos de memoria baseados na RAM eliminando assim a necessidade de usar memória swap. Essa medida é muito utilizada em dispositivos como netbooks(pouca memória). Com o ZRAM ativado, os dados são comprimidos para esse bloco.

Uma desvantagem é que você consequentemente gasta mais CPU com esse recurso pois vai necessitar comprimir/descomprimir os dados. Mesmo que você tenha uma memoria swap instalada, ela não será utilizada.

Esse recurso foi implementado na versão 3.14 do linux. O Android (+4.4) e o Chrome OS (2013) utilizam esse recurso.

------------

## **ZSWAP**
