# CineFavorite - Formativa
Construindo um aplicativo do Zero - O CineFavorite permitirá criar uma conta e buscar filmes em uma api e montar uma galeria pessoal de filmes favoritos, com capas e notas.

## Objetivos
- Integrar o Aplicativo a uam API
- Criar uma conta pessoal no FireBase
- Armazenar informações para Cada usuários das preferencias solicitadas
- consultar informações de Filmes (Capas, Título)

## Levantamentos de Requisitos

- Funcionais

- Não Funcionais

## Diagramas

1. ### Diagrama de Classe
    Diagrama de que demonstra as entidades da aplicação

    - usuário (user) : classe criada pelo FireBase
        - email
        - senha
        - id
        - create()
        - login()
        - logout()

    - Filme (Movie) : Clase modelada pelo dev
        - number id:
        - string titulo:
        - string posterpath:
        - boolean favorito
        -double nota
        -adicionar ()
        -update()
        -remover()
        -listarfavoritos()
```mermaid

classDiagram
    class User{
        +String uid
        +String email
        +String password
        +createUser()
        +login()
        +logout()
    }

    class Movie{
        +String id
        +String title
        +String posterPath
        +Boolean Favorite
        +double Rating
        +addFavorite()
        +removeFavorite()
        +updateRating()
        +read()
    } 

    user "1"--"1+" movie : "selecionar"


## Prototipagem

## Codificação