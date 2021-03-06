<%-- 
    Document   : pagProduto
    Created on : 15/10/2018, 16:22:22
    Author     : vinim
--%>

<%@page import="modelDAO.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
           $(function(){
              $("#header").load("MenuNavBar.jsp");
              $("#footer").load("Footer.jsp");
           });
        </script>
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->

        <title> Item</title>

        <!-- Bootstrap core CSS -->
        <link href="res/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="res/css/portfolio-item.css" rel="stylesheet">

        <%
            Produto prod = new ProdutoDAO().getProduto(Integer.parseInt(request.getParameter("id")));
            Usuario userProd = new UsuarioDAO().getUserById(prod.getId_usuario());
            if (session.getAttribute("email") != null) {

                String email = request.getSession().getAttribute("email").toString();

                Usuario user = new UsuarioDAO().getUsuario(email);
            }

        %>
    </head>

    <body>
        <!-- Navigation -->
        <div id="header"></div>

        <!-- Page Content -->
        <div class="container">

            <!-- Portfolio Item Heading -->
            <h1 class="my-4"><%=prod.getTitulo()%>

            </h1>

            <!-- Portfolio Item Row -->
            <div class="row">

                <div class="col-md-8">
                    <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=1" alt="">
                </div>

                <div class="col-md-4">
                    <h3 class="my-3">Descrição</h3>
                    <p><label><%=prod.getDescricao()%> </label></p>
                    <h3 class="my-3">Detalhes</h3>         
                    
                        <form class="compra" method="get" action="AlterarProdutoServlet"> 
                            <ul>
                                <li>Titulo: </li>
                                <input type="text" name="namelivro" id="namelivro" value="<%=prod.getTitulo()%>">
                                <li>Autor: </li>
                                <input type="text" name="nameAutor" id="nameAutor" value="<%=prod.getEditora()%>">
                                <li>Editora: </li>
                                <input type="text" name="nameEditora" id="nameEditora" value="<%=prod.getEditora()%>">
                                <li>Data de publicação: </li>
                                <input type="text" name="anoLancamento" id="anoLancamento" value="<%=prod.getDataPublicacao()%>">
                                <li>Genero: </li>
                                <select class='btn  dropdown-toggle' id='idGenero' name='menuGenero' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' value='<%= prod.getGenero() %>'>
                                        <option>Drama</option>
                                        <option>Ação</option>
                                        <option>Aventura</option>
                                        <option>Comédia</option>
                                        <option>Fantasia</option>
                                    </select>
                                
                                <li>Idioma: </li>
                                    <select class='btn  dropdown-toggle' id='idIdioma' name='menuIdioma' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' value='<%= prod.getIdioma()%>'>                                              
                                        <option>Português</option>
                                        <option>Inglês</option>
                                        <option>Espanhol</option>
                                    </select>
                                <li>Preco: </li>
                                <input type="number" name="valor" id="valor" value="<%=prod.getDataRegistro()%>">
                                <li>Quantidade de livros: </li>
                                <input type="number" name="" id="" value="<%=prod.getQuantidade()%>">
                            </ul>
                            <button type="submit" class="btn btn-secondary" name="livro">Alterar Informações</button>
                        </form>



                </div>
                <!-- /.row -->

                <!-- Related Projects Row -->
                <h3 class="my-4">Fotos Produtos</h3>

                <div class="row">

                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#">
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=2" alt="">
                        </a>
                    </div>

                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#">
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=3" alt="">
                        </a>
                    </div>

                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#">
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=4" alt="">
                        </a>
                    </div>

                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#">
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=5" alt="">
                        </a>
                    </div>


                </div>

                <!-- /.row -->

            </div>
            <!-- /.container -->
        </div>

            <!-- Footer -->
            <div id="footer"></div>
            
            <!-- Bootstrap core JavaScript -->
            <script src="res/vendor/jquery/jquery.min.js"></script>
            <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="res/js/calculoFrete.js"></script>
    </body>

</html>

