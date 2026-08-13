<h1>REPOSITÓRIO CENTRAL</h1>
<p>
  O Repositório Central do Sistema de Registro e Análise Integrada, ou apenas SiRAI, é um ambiente estruturado para conter todas as camadas da aplicação, reunindo todas as informações pertinentes do sistema.
</p>
<h2>Objetivo do SiRAI</h2>
<p>
  O sistema visa estruturar e consolidar meios para que pesquisadores armazenem e visualizem dados do monitoramento de animais domésticos e selvagens. Um dos focos é analisar a movimentação de animais cadastrados via GPS e observar sua relação com doenças contraídas e organizar dados veterinários feitos em visitas com profissionais da área.
</p>
<p>
  Além disso, o sistema gerencia dados de animais envolvidos em atropelamentos e registra informações detalhadas da necrópsia realizada, bem como as amostras coletadas e análises feitas sobre estas amostras.
</p>
<p>
  Por fim, outro objetivo é implementar ferramentas de dashboard e análise integrada.
</p>
<h2>Desenvolvimento do SiRAI</h2>
<p>
  O SiRAI é um projeto web fullstack e utiliza as seguintes tecnologias:
  <ul>
    <li><a href='https://www.typescriptlang.org/'>Typescript</a></li>
    <li><a href='https://react.dev/'>React</a></li>
    <li><a href='https://tailwindcss.com/'>Tailwindcss</a></li>
    <li><a href='https://axios-http.com/ptbr/'>Axios</a></li>
    <li><a href='https://zod.dev/'>Zod</a></li>
    <li><a href='https://www.prisma.io/'>Prisma</a></li>
    <li><a href='https://expressjs.com/'>Express</a></li>
    <li><a href='https://www.mysql.com/'>MySQL</a></li>
  </ul>
</p>

<h2>Visão Geral do Sistema</h2>
<p>
  As telas a seguir ilustram os principais fluxos do SiRAI, desde o acesso controlado até o registro e consulta de dados veterinários.
</p>

<h3>Controle de Acesso</h3>
<p>
  O sistema adota um modelo de acesso por solicitação. Novos pesquisadores preenchem o formulário de <strong>Solicitação de Acesso</strong> (nome, e-mail, senha e justificativa opcional) e aguardam a aprovação de um administrador. Após a aprovação, o acesso é liberado pela tela de <strong>Login</strong>, que também oferece a opção de recuperação de senha. Esse fluxo garante que apenas usuários autorizados possam visualizar ou manipular os dados do projeto.
</p>
<table>
  <tr>
    <td align="center"><strong>Solicitação de Acesso</strong></td>
    <td align="center"><strong>Login</strong></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/79081840-afc0-4be3-bf6c-fb1755c1b436" alt="Tela de Solicitação de Acesso" width="480"/></td>
    <td><img src="https://github.com/user-attachments/assets/5992756c-be66-488c-80e2-a36330742e59" alt="Tela de Login" width="480"/></td>
  </tr>
</table>

<h3>Formulários</h3>
<p>
   Os formulários são acessados pelo menu lateral e sua visualização depende do nível de acesso do usuário para determinado formulário. A partir do registro expandido, é possível visualizar e navegar diretamente entre os sub-registros associados, facilitando a navegação e a composição de registros.
</p>

<table>
  <tr>
    <td align="center"><strong>Formulário com Acesso Bloqueado</strong></td>
    <td align="center"><strong>Visualização Padrão</strong></td>
    <td align="center"><strong>Sidedrawer</strong></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/d6e654f6-1fdf-45d4-8add-82a456a0d66d" alt="Formulário com Acesso Bloqueado" width="320"></td>
    <td><img src="https://github.com/user-attachments/assets/d40f4a86-0a66-482d-95aa-0846c262b316" alt="Visualização padrão" width="320"/></td>
    <td><img src="https://github.com/user-attachments/assets/bd1b8fa1-f1cc-4af3-bc14-482f9ba65e4e" alt="Visualização padrão" width="320"/></td>
  </tr>
</table>

<p>
  A tela de <strong>Filtros</strong> permite refinar a listagem de registros, combinando múltiplos critérios de busca de forma intuitiva.
</p>

<table>
  <tr>
    <td align="center"><strong>Filtros Avançados</strong></td>
    <td align="center"><strong>Novo Registro</strong></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/919645d8-553f-4e52-badf-e9d39917b2e8" alt="Filtros" width="480"/></td>
    <td><img src="https://github.com/user-attachments/assets/f7bd5592-2ac6-41c8-b6a0-07176262f478" alt="Novo Registro" width="480"/></td>
  </tr>
</table>

<h3>Gerenciamento de Permissões</h3>
<p>
  Acessível pelo link <strong>Gerenciar Permissões</strong> no rodapé do menu lateral, este módulo é exclusivo para administradores. Na aba <strong>Usuários</strong>, é exibida a lista de todos os usuários do sistema com nome, e-mail e nível de papel (Admin, Super Admin ou comum), além de ações de visualizar, editar e remover cada conta. A aba <strong>Solicitações</strong> centraliza os pedidos de acesso pendentes, permitindo aprová-los ou rejeitá-los.
</p>
<p>
  Ao editar um usuário, o modal de <strong>Edição de Permissões</strong> apresenta um controle granular por recurso do sistema. Para cada entidade — como <em>Animal</em>, <em>Amostra</em>, <em>Necrópsia</em>, <em>Análises</em>, entre outras — é possível definir individualmente o nível de acesso: <strong>Ler</strong>, <strong>Editar</strong>, <strong>Editar sem Restrições</strong> ou simplesmente nenhuma permissão. O grupo de permissões do usuário também pode ser alterado diretamente nessa tela, agilizando a configuração de perfis padronizados.
</p>

<table>
  <tr>
    <td align="center"><strong>Listagem de Usuários</strong></td>
    <td align="center"><strong>Editor de Permissões</strong></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/2884d2b1-2ffe-4aa4-b4ed-04aaf4a32254" alt="Listagem de Usuários e Permissões" width="480"/></td>
    <td><img src="https://github.com/user-attachments/assets/a478e810-ad90-4a16-9cfb-1c176a5f75a8" alt="Modal de Edição de Permissões" width="480"/></td>
  </tr>
</table>

<h2>Copiando o SiRAI</h2>
<p>
  A estrutura do sistema pode ser utilizada, mas é necessário configurar o ambiente de desenvolvimento para que o site funcione corretamente.
</p>
<h3>.env</h3>
<p>
  Você vai precisar de um .env para o repositório funcionar localmente. Crie <strong>.env's</strong> tanto na pasta de <strong>front-end</strong> quanto na de <strong>back-end</strong> e siga os exemplos:
</p>
<h5>Front-end</h5>
<pre>
VITE_API_URL=http://localhost:3333
</pre>
<h5>Back-end</h5>
<pre>
DATABASE_URL="mysql://[user]:[senha]@localhost:3306/[banco_de_dados]?schema=public"
DATABASE_USER="[user]"
DATABASE_PASSWORD="[senha]"
DATABASE_NAME="[banco_de_dados]"
DATABASE_HOST="localhost"
DATABASE_PORT=3306
<br/>
PORT=3333
JWT_SECRET="[string_aleatória]"
<br/>
EMAIL_HOST="[email do provedor SMTP]"
EMAIL_PORT=[porta do provedor]
SENDER_NAME='no-reply'
SENDER_EMAIL='[email de envio]'
SENDER_PASSWORD='[senha do email de envio]'
</pre>

<h3>Instalação</h3>
<h5>1. Instalar Dependências</h5>
<p>Na pasta raiz do projeto, execute:</p>
<pre>
npm i
</pre>
<p>O projeto utiliza <strong>npm workspaces</strong>, então esse único comando instala as dependências do front-end, back-end e shared-types.</p>

<h5>2. Banco de Dados</h5>
<p>Crie um banco de dados MySQL/MariaDB e importe os dados básicos utilizando o arquivo <a href='https://github.com/nicolasfouv/sistema-resgistro-analise-integrada/blob/main/tables-and-data.sql'>tables-and-data.sql</a>.</p>

<h5>3. Gerar o Prisma Client</h5>
<p>Na pasta de <strong>back-end</strong>, execute:</p>
<pre>
cd srf-backend
npx prisma generate
cd ..
</pre>

<h5>4. Rodar o Projeto</h5>
<pre>
npm run dev
</pre>
<p>
  Desta forma, o sistema estará pronto para ser utilizado localmente.
</p>
<h3>Utilizando o Sistema</h3>
<p>
  Há usuários pré-cadastrados para que você possa experimentar diferentes visões do sistema rapidamente:
  <ul>
    <li>
      Visão como um administrador do sistema:<br/>
        E-mail: admin@exemplo.com<br/>
        Senha: 123123
    </li>
    <li>
      Visão como um usuário comum do sistema:<br/>
        E-mail: comum@exemplo.com<br/>
        Senha: 123123
    </li>
  </ul>
</p>


<footer>
  <hr>
  <p align="center">
    <em>Sistema desenvolvido para apoio à pesquisa do LEIMa.</em>
  </p>
</footer>
