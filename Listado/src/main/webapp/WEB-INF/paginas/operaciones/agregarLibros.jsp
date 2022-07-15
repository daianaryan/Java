<!-- MODAL INSERTAR-->
<div class="modal fade" id="agregarLibroModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel" style="font-size: 16px">Alta de Permisos</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>   
            <div class="modal-body">
                <!-- FORMULARIO -->
                <form action="${pageContext.request.contextPath}/ServletControlador?accion=insertar" method="POST"> <!-- class="was-validated" -->                    
                    <input class="m-2 border border-white" type="text" name="id" id="id" style="font-size: 12px" hidden>					     
                    <div class="row p-2">                        
                        <div class="form-group p-2 label" style="font-size: 12px">
                            <label class="mb-2" for="nombre">Listado</label>
                            <input type="text" class="form-control" name="nombre" id="listado" cols="30" rows="4" placeholder="Ingrese un Listado" maxlength="3500" required="">
                        </div>                        
                        <div class="form-group p-2 label" style="font-size: 12px">
                            <label for="autor">Correo Electronico</label>
                            <textarea type="text" class="form-control" name="autor" id="Mail" cols="30" rows="3" placeholder="Indique un correo electronico" maxlength="3500"></textarea>
                        </div>                         
                        <div class="form-group p-2 label" style="font-size: 12px">
                            <label for="cantPaginas">Paginas</label>
                            <input type="number" class="form-control" name="cantPaginas" required="">
                        </div>  
                        <div class="form-group p-2 label" style="font-size: 12px">
                            <label for="precio">Valor del Libro</label>
                            <input type="currency" class="form-control" name="precio" required="">
                        </div>  
                        <div class="form-group p-2 label" style="font-size: 12px">
                            <label for="copias">Stock</label>
                            <input type="number" class="form-control" name="copias" required="">                        
                        </div>   	
                    </div>                                         					                        											
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger" style="font-size: 12px" data-bs-dismiss="modal">Cerrar</button>
                        <button id="saveListInsert" name="saveListInsert" type="submit" class="btn btn-outline-success" style="font-size: 12px" data-bs-toggle="modal" data-bs-target="#saveInsert" onclick="validar()">Guardar</button>                        
                    </div>                      
                </form>	   
            </div>
        </div>
    </div>
</div> <!-- FIN: MODAL INSERTAR-->


