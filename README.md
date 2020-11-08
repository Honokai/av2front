# Projeto Java Web

## Itens necessários
1. JDK
2. Apache TOMCAT (testado com a versão 9.0)
3. Netbeans


## Executando localmente
No menu superior, selecionar `Run(executar)`, e então `Run Project(av2front)`.

### Configurando credenciais de acesso ao banco
Informe usuário e senha de acesso ao banco no arquivo em `src\main\java\com\av2front` nomeado de **BancoConexao.java**
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
```

### URL disponíveis
1. INDEX : http://localhost:8080/av2front/
2. LOGIN : http://localhost:8080/av2front/login.jsp
3. REGISTRAR : http://localhost:8080/av2front/registrar.jsp
4. GERENCIAR NOTAS (somente autenticado) : http://localhost:8080/av2front/gerenciarnotas.jsp
5. VISUALIZAR NOTAS (somente autenticado) : http://localhost:8080/av2front/visualizarnotas.jsp
6. DASHBOARD (somente autenticado) : http://localhost:8080/av2front/dashboard.jsp

### Autenticação níveis de acesso
1. `777` - Acesso a todas as urls
2. `0` - Acesso a url de visualização de notas

**Obs.: Demais orientações estarão no arquivo disponibilizado na plataforma da faculdade**