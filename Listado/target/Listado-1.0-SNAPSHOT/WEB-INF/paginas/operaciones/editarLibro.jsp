<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libreria</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/382381b436.js" crossorigin="anonymous"></script>
    </head>
    <body>    
        
        <!-- FORMULARIO -->                
        <div class="container p-4">                        
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <div class="card shadow-lg">
                        <div class="card-header label d-flex">
                            <h5 class="modal-title" id="exampleModalLabel" style="font-size: 16px">Modificar Listado</h5>                                                
                            <div class="position-absolute top-0 end-0 me-2 p-2">			
                                <a href="index.jsp" type="button" class="btn-close" data-bs-dismiss="container" style="font-size: 12px" aria-label="Close"></a>            
                            </div>                     
                        </div>
                        <div class="card-body">
                            <form action = "${pageContext.request.contextPath}/ServletControlador?accion=modificar&idLibros=${libro.idlibros}" method="POST">                                
                                <div class="form-group">
                                    <label for="nombre" style="font-size: 12px">Titulo</label>
                                    <input type="text" class="form-control" name="nombre" required="" style="font-size: 12px" value="${libro.nombre}">
                                </div>
                                <div class="form-group">
                                    <label for="autor" style="font-size: 12px">Autor</label>
                                    <input type="text" class="form-control" name="autor" style="font-size: 12px" value="${libro.autor}">
                                </div>
                                <div class="form-group">
                                    <label for="cantPaginas" style="font-size: 12px">Paginas</label>
                                    <input type="number" class="form-control" name="cantPaginas" required="" style="font-size: 12px" value="${libro.cantPaginas}">
                                </div>
                                <div class="form-group">
                                    <label for="precio" style="font-size: 12px">Valor del Libro</label>
                                    <input type="currency" class="form-control" name="precio" required="" style="font-size: 12px" value="${libro.precio}">
                                </div>
                                <div class="form-group">
                                    <label for="copias" style="font-size: 12px">Stock</label>
                                    <input type="number" class="form-control" name="copias" required="" style="font-size: 12px" value="${libro.copias}">
                                </div> 
                                <div class="form-group">
                                    <label for="idLibros" style="font-size: 12px">idLibros</label>
                                    <input type="text" class="form-control" name="idLibros" required="" style="font-size: 12px" value="${libro.idlibros}">
                                </div>                                
                                <div class="text-center p-3">                                    
                                    <a type="button" href="index.jsp" class="btn btn-outline-danger" style="font-size: 12px">Cerrar</a>
                                    <button type="submit" class="btn btn-outline-success" style="font-size: 12px"></i>Guardar Modificación</button>                                                                        
                                </div>  
                                <!--  jsp:include page="/WEB-INF/paginas/comunes/editarNav.jsp"/>-->
                            </form>    
                        </div>  
                    </div> 
                </div>
            </div>             
        </div>  


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
