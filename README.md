# Projeto Java Web

- [Projeto Java Web](#projeto-java-web)
  - [Itens necessários](#itens-necessários)
  - [Executando localmente](#executando-localmente)
    - [Importando arquivo SQL](#importando-arquivo-sql)
    - [Configurando credenciais de acesso ao banco](#configurando-credenciais-de-acesso-ao-banco)
    - [Fluxo Gerenciamento de notas](#fluxo-gerenciamento-de-notas)
      - [Exclusão](#exclusão)
    - [URL disponíveis](#url-disponíveis)
    - [Autenticação níveis de acesso](#autenticação-níveis-de-acesso)
  - [Integrantes](#integrantes)




## Itens necessários
1. JDK
2. Apache TOMCAT (testado com a versão 9.0)
3. Netbeans


## Executando localmente
No menu superior, selecionar `Run(executar)`, e então `Run Project(av2front)`.

### Importando arquivo SQL
Para que a aplicação funcione em sua total capacidade, temos o arquivo [universidade.sql](universidade.sql), nele está contido toda a estrutura do banco, assim como dados pré-inseridos para testes.
### Configurando credenciais de acesso ao banco
Informe usuário e senha de acesso ao banco no arquivo em `src\main\java\com\av2front` nomeado de [BancoConexao.java](src/main/java/com/av2front/BancoConexao.java)
```java
public class BancoConexao {
    
    private String servidor, porta, banco, login, senha;
    
    public BancoConexao() {
        this.servidor = "127.0.0.1";
        this.porta = "3306";
        this.banco = "universidade";
        this.login = "coloque seu usuario aqui";
        this.senha = "coloque a senha de usuario aqui";
    }
    ... código
}
```

### Fluxo Gerenciamento de notas
1. Escolha a opção
    1. **Adicionar** caso queira inserir um registro de **nota** para um aluno já cadastrado
    2. **Atualizar** caso queira realizar uma **alteração** de um registro existente no banco
2. Escolha o **aluno** das opções disponíveis
3. Escolha a **disciplina**
    1. Caso tenha **escolhido a opção adicionar**, será então apresentando o nome de todas as matérias disponíveis
    2. Caso tenha sido **atualizar**, então só será apresentado disciplinas na **qual o aluno já está cursando**, ou tem **registro**, este sendo ordernado do registro **mais novo para o antigo**
4. Escolha um professor, será **carregado nos mesmos critérios do item acima**, baseado na ação selecionada
5. Informe as notas, o campo não pode ficar vazio, quando não houver notas para as demais avaliações, informe **0.00**
    1. **Observação**, caso tente inserir uma nota para **av1 > 7** ou **aps1 > 3** não será possível inserir ou atualizar o registro, o mesmo para **av2 > 8** e **aps2 > 2**.
6. Aperte em `criar/atualizar registro`

#### Exclusão
1. Informe a opção **atualizar**
2. Informe o **aluno**
3. Informe a **disciplina**
4. Informe o **professor**
5. Clique em **apagar registro**, na falta de informar algum dos campos acima, não **conseguirá realizar a exclusão do dado** e receberá uma mensgem de erro.

<span style="font-size:17px;">**OBS**: ao logar com um professor em específico, o mesmo só poderá criar, atualizar ou deletar registros a si mesmo, enquanto que ao utilizar o usuário **admin** que é um administrador geral, poderá então criar registro para todo e qualquer professor cadastrado no banco.</span>
### URL disponíveis
1. INDEX : http://localhost:8080/av2front/
2. LOGIN : http://localhost:8080/av2front/login.jsp
3. REGISTRAR : http://localhost:8080/av2front/registrar.jsp
4. GERENCIAR NOTAS (somente autenticado e com nível de acesso necessário) : http://localhost:8080/av2front/gerenciarnotas.jsp
5. VISUALIZAR NOTAS (somente autenticado e com nível de acesso necessário) : http://localhost:8080/av2front/visualizarnotas.jsp
6. DASHBOARD (somente autenticado e com nível de acesso necessário) : http://localhost:8080/av2front/dashboard.jsp

### Autenticação níveis de acesso
1. `777` - Acesso a todas as urls
2. `0` - Acesso a url de visualização de notas

## Integrantes 
Emerson Ferreira Fernandes - 2017200458  
Moises Ximenes Albuquerque - 2017201214
