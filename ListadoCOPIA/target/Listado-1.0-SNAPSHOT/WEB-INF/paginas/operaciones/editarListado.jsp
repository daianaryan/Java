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
                            <form action = "${pageContext.request.contextPath}/ServletControlador?accion=modificar&idListados=${listado.idlistados}" method="POST">                                
                                <div class="form-group">
                                    <label for="listado" style="font-size: 12px">Listado</label>
                                    <input type="text" class="form-control" name="listado" required="" style="font-size: 12px" value="${listado.listado}">
                                </div>
                                <div class="form-group">
                                    <label for="mail" style="font-size: 12px">Correo Electronico</label>
                                    <input type="text" class="form-control" name="mail" style="font-size: 12px" value="${listado.mail}">
                                </div>                                
                                <div class="form-group">
                                    <label hidden for="idListados" style="font-size: 12px">idListados</label>
                                    <input hidden type="text" class="form-control" name="idListados" required="" style="font-size: 12px" value="${listado.idlistados}">
                                </div>                                
                                <div class="text-center p-3">                                    
                                    <a type="button" href="index.jsp" class="btn btn-outline-danger" style="font-size: 12px">Cerrar</a>
                                    <button type="submit" class="btn btn-outline-success" style="font-size: 12px"></i>Guardar</button>                                                                        
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
