<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Serasa</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/snackbar.css">
    </head>
    <body>
        <div class="container d-flex h-100">
            <div class="row align-self-center w-100">
                <div class="col-6 mx-auto">
                    <div class="jumbotron jumbotron-lg">
                        <h1 class="display-4 text-center text-uppercase font-weight-bold">SERASA</h1>

                        <hr>

                        <form id="fCpf" method="POST">
                            <input type="text" class="form-control my-4" name="CPF" placeholder="Digite o seu cpf..." maxlength="11">
                            <button type="submit" class="btn btn-block btn-serasa" onclick="handleCpf()">Consultar</button>
                        </form>
                        <div id="content"></div>
                    </div>
                </div>
            </div>
            <div id="snackbar"></div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>
