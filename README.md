## Sobre ℹ️
O backend do Concord foi desenvolvido utilizando a linguagem Ruby juntamente com o framework Ruby on Rails, foi utilizado uma API seguindo o padrão MVC do rails, porém, sem utilizar as views, visto que é uma API

## Tecnologias 💻
Essas são as tecnologias utilizadas na API:
- ![PostgreSQL Badge](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=fff&style=for-the-badge) -> Banco de dados relacional principal
- ![Ruby on Rails Badge](https://img.shields.io/badge/Ruby%20on%20Rails-D30001?logo=rubyonrails&logoColor=fff&style=for-the-badge) -> Framework web
  - ![Interactors](https://img.shields.io/badge/interactors-%23CC342D.svg?style=for-the-badge&logo=rubygems&logoColor=white) -> Utilizado para modularização
  - ![Rspec](https://img.shields.io/badge/rspec-%23CC342D.svg?style=for-the-badge&logo=rubygems&logoColor=white) -> Utilizado para testes automatizados
  - ![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white) -> Utlizado para rodar websocket
  - ![FFaker](https://img.shields.io/badge/ffaker-%23CC342D.svg?style=for-the-badge&logo=rubygems&logoColor=white) -> Utilizado para geração de dados fake para testes
  - ![Factory_Bot](https://img.shields.io/badge/factory_bot-%23CC342D.svg?style=for-the-badge&logo=rubygems&logoColor=white) -> Utilizado para criação de fábricas para testes

## Diagrama do Banco de Dados

![Diagrama](https://github.com/user-attachments/assets/eaffb0e0-1e5b-4b50-bd9c-22db13ea2ad3)

  
## Rodando o Projeto 🚀

- Caso possua o Ruby, o Rails e o Postgresql, utilize os seguintes comandos abaixo:

1. Clone o repositório:
```
git clone -b develop https://github.com/dev-Gois/concord-api
cd concord-api
```
2. Instale as dependências:

```
bundle install
```

3. Configure o banco de dados:

```
rails db:setup
```

4. Inicie o servidor:

```
rails s
```

- Com isso o projeto estará rodando na URL 'localhost:3000'

