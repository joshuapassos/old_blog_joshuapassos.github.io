# Utilizando Gitflow

-----------

## **Sumário**

### 1. Introdução
### 2. Gitflow
### 3. Links úteis
### 4. Referências




-----------

## Introdução

Um dos grandes problemas de um projeto é como desenvolver ele em conjunto com outros desenvolvedores, sendo que a aplicação esteja sempre atualizada e que esse processo seja o mais automático possível.

Buscando solucionar esse problema foi criado vários controladores de versão, onde a partir de um único repositório toda a equipe possa trabalhar em conjunto.

Uma das grande referências hoje para controlador de versão é o git. Ele foi desenvolvido por Linus Torvalds para gerenciar o kernel Linux e com o passar do tempo essa ferramenta vem sendo utilizada em inúmeros projetos.

![imgit <>](https://git-scm.com/images/about/index1@2x.png "Funcionamento Git")

Mesmo com ferramentas como essa, ainda é necessário algumas regras de uso, para que bugs não aconteçam.


## Gitflow

Quando o projeto e pequeno, uma única branch é suficiente para você concluir o trabalho, porém quando estamos falando de um software com uma versão estável, uma nova versão sendo desenvolvida e simultaneamente corrigir bugs da versão atual, nós precisamos utilizar mais de uma branch e o gitflow fornece um modelo/conjunto de extensões para utilizar esse sistema com eficiência.


![imgitf <>](https://raw.githubusercontent.com/Voronenko/gitflow-release/master/images/git-workflow-release-cycle-4maintenance.png "Funcionamento Gitflow")

A branch Master é a raiz principal da aplicação dela que é gerada a versão para deployment. A partir da branch Master, nós criamos uma outra branch que tem um papel fundamental: a branch Develop serve para gerar as futuras versões que serão lançadas.

No decorrer do desenlvolvimento, integrações entre Develop e Master serão feitas para lançamento de novas versões.

Obviamente, antes de colocar a aplicação para o cliente, é necessário uma etapa de testes, onde a equipe de desenvolvimento possa encontrar/resolver os principais bugs. A Branch intermediária é a Release.

A partir da branch Develop nós iremos criar outras branchs para cada funcionalidade/característica da aplicação. Essas Features será desenvolvidas por cada programador que após desenvolvimento irá integrar a branch Develop.

A branch Hotfix serve para reparar os bugs da aplicação que o cliente está utilizando. Após correção iremos integra-la as duas branchs principais. (Develop e Master)

Diversas empresas de desenvolvimento de software utilizam o gitflow para organização dos seus repositórios. Se adequar a esse método pode fazer com que você economize bastante tempo corrigindo bugs de merges.

A aplicação do gitflow foi construída para facilitar as criações dessas branchs, de modo que os desenvolvedores possam facilmente criar features e integrá-las com a branch Develop. Caso você use aplicações como Gitkraken esses comandos já vem integrados para você fazer os pushs com maior facilidade.

![commgitflow <>](https://danielkummer.github.io/git-flow-cheatsheet/img/git-flow-commands.png "Comandos")


## Links úteis

[Download GitFlow e Manual de utilização](https://danielkummer.github.io/git-flow-cheatsheet/index.pt_BR.html)

[Artigo explicando com detalhes o Gitflow](http://nvie.com/posts/a-successful-git-branching-model)

[Git GUI com suporte à Gitflow](https://www.gitkraken.com)

[Git GUI para utilizar no Atom com suporte a Gitflow](https://atom.io/packages/git-control)


## Referências
[A successful Git branching model](https://www.codementor.io/slavko/implementing-git-flow-releasing-model-in-continuous-integration-process-du1083k06)

[Git official website](https://git-scm.com/about/staging-area)

[Cheatsheet do git-flow](https://danielkummer.github.io/git-flow-cheatsheet/index.pt_BR.html)
