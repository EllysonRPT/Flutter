Model Livro(
    titulo,
    autor,
    sinopse,
    categoria,
    ISBN
)
Controller(
    Livros controller(
        -loadLivro(Json)
        -adicionar Livro 
    )
)
View(
    Lista de livros(
        -listar livro do catalogo(ontap => info)
        -info do livro(carregar todas informacao do livro)
    )
)