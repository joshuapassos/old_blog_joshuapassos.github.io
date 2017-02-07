
# A arte da Recursão

----



### **Sumário**

1. Introdução
2. Tipos de Recursão
     1. Linear
     2. Calda
     3. Árvore
3. Análise de complexidade
4. Links úteis
5. Referências



### **Recursão em Calda**

A ideia da recursividade é sempre ensinada como uma coisa perigosa. De um lado eles defendem que por causa da abstração ela é uma ferramenta maravilhosa. Do outro lado, eles falam que o uso da recursividade remete em um desempenho muito inferior ao uso dos loops.
Quando estudamos um pouco de linguagens de programação funcionais nos deparamos com a filosofia de abandonar os laços e usarmos recursividade para compensar. E o desempenho ? Veremos aqui como melhorar isso.


Vamos utilizar essa função que calcula o fatorial.

Lembrando que:

```
0! = 1
1! = 1
2! = 2 * 1! = 2 * 1 = 2
3! = 3 * 2! = 3 * 2 * 1! = 3 * 2 * 1 = 6
4! = 4 * 3! = 4 * 3 * 2! = 4 * 3 * 2 * 1! = 4 * 3 * 2 * 1 = 24
5! = 5 * 4! = 5 * 4 * 3! = 5 * 4 * 3 * 2! = 5 * 4 * 3 * 2 * 1! = 5 * 4 * 3 * 2 * 1 = 120
```

```c
int fac(int n){  
     if(n==0) return 1;  
   return n*fac(n-1);  
 }
```

Essa função recursiva tem a seguinte execução:

```
(fac(5))  
(5 * (fac(4)))  
(5 * (4 * (fac(3))))  
(5 * (4 * (3 * (fac(2)))))  
(5 * (4 * (3 * (2 * (fac(1))))))  
(5 * (4 * (3 * (2 * (1 * (fac(0)))))))  
(5 * (4 * (3 * (2 * (1 * (1))))))  
(5 * (4 * (3 * (2 * (1)))))   
(5 * (4 * (3 * (2))))  
(5 * (4 * (6)))  
(5 * (24))  
120
```

A recursividade cria uma pilha e só temos o resultado do nosso fatorial na ultima etapa de operação. Esse processo é muito ineficiente comparado ao loop.

```c
int i,fac=1,n=5;  
   if(n>0)   
   for(i=1;i<=n;i++) fac*=i;
```


```
p/ i=1 ~ fac=1  
p/ i=2 ~ fac=2  
p/ i=3 ~ fac=6  
p/ i=4 ~ fac=24  
p/ i=5 ~ fac=120
```


Usando recursão em calda (Tail recursion)

```c
int fac(int n,int a){  
   if(n==0) return a;  
   else  
   return fac(n-1,n*a);  
}  
int fatorial(int n){  
   return fac(n,1);  
}
```

A função fac() acima é a única função necessária para calcular o fatorial, coloquei a função fatorial() para passar somente um parâmetro.
Nesse caso vamos ver como funciona a execução:


```c
fac(5,1)  
  fac(4,5)  
  fac(3,20)  
  fac(2,60)  
  fac(1,120)  
  fac(0,120)  
  120
```


A ideia é o acumulador estar como parâmetro da função em vez de ser o retorno da função como acontece no fatorial la de cima.
O interessante é que muitas linguagens utilizam essa subrotina e o código gerado na compilação é o mesmo do loop. Podemos listar JavaScript, C, Lua, Haskell..
Obs: Em Python e Java, Tail Recursion não funciona nativamente, porem pesquisando pela internet encontrei métodos para implementar :)

### **Recursão de árvore**
Em construção...

## **Análise de complexidade**
Em construção...


## **Links úteis:**

+ [Tail Call Optimization for Python](https://github.com/baruchel/tco)
+ [Does Python optimize tail recursion?](http://stackoverflow.com/questions/13591970/does-python-optimize-tail-recursion)
+ [Recursion or while loops](http://programmers.stackexchange.com/questions/182314/recursion-or-while-loops)


## **Referências:**

+ [Harold Abelson and Gerald J. Sussman. 1996. Structure and Interpretation of Computer Programs (2nd ed.). MIT Press, Cambridge, MA, USA.](https://mitpress.mit.edu/sicp/full-text/book/book.html)

+ [VAN-ROY, Peter; HARIDI, Seif. Concepts, techniques, and models of computer programming. MIT press, 2004.](https://mitpress.mit.edu/books/concepts-techniques-and-models-computer-programming)

----
