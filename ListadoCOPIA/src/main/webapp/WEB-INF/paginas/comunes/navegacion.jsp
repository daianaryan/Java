<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row container-fluid m-2 p-2">
    <!-- SECCION PARA INSERTAR PROPIEDADES -->   
       <div class="col-md-5 mb-2">
            <div class="shadow-lg card position-relative">
                <div class="card-header label">                
                    <span style="font-size: 12px"><b><i class="fas fa-cubes"></i> LISTADOS</b></span>                    
                </div>
                <div class="position-absolute top-0 end-0 me-2">
                    <button type="button" class="btn btn-outline-secondary adminInsertbtn" data-bs-toggle="modal" data-bs-target="#adminInsertList" style="font-size: 12px"><i class="fa fa-plus"></i></button>
                </div>
                <div class="card-body">
                <p style="font-size: 12px"><span style="color: red">*</span> Datos obligatorios</p>                                   
                    <!-- Para recepcionar archivos uso enctype-->
                    <form action="${pageContext.request.contextPath}/ServletControlador?accion=buscar" method="GET" enctype="multipart/form-data" autocomplete="off">                                                            
                        <div class="d-flex">
                            <div class="col-md-6 form-group label" style="font-size: 12px">   
                                <label for="importe"><span style="color: red">* </span><i class="fa fa-file-pdf-o" style="font-size:14px"></i> Listados</label>                                
                                <select class="form-select label" name="listado" id="listado" style="font-size: 12px">
                                    <c:forEach var="listado" items="${listado}" varStatus="status">                            
                                        <option hidden value="">-- Seleccione un listado --</option>                                                                   
                                        <option value="${listado.listado}">${listado.listado}</option>                                    
                                    </c:forEach>                           
                                </select> 
                            </div> 	                                 
                            <div class="p-3 text-center">                                                        
                                 <button class="btn btn-outline-success" id="buscar" name="buscar" type="submit" value="buscar" style="font-size: 12px"><i class="fas fa-search"></i></button>                                 
                                <button class="btn btn-outline-danger" id="borrar" name="borrar" type="submit" value="borrar" style="font-size: 12px"><i class="fas fa-trash-alt"></i></button>
                            </div>                                              
                        </div>
                        <div class="d-flex">
                            <div class="col-md-6 form-group label" style="font-size: 12px">                                
                                <label for="importe"><span style="color: red">* </span><i class="fa fa-file-pdf-o" style="font-size:14px"></i> Correo</label>
                                <select class="form-select label" name="mail" id="mail" style="font-size: 12px">                                     
                                        <option hidden value="">-- Seleccione un usuario --</option>                                                                   
                                        <option value=""></option>                                                                                                                                                
                                </select> 
                            </div>
                            <div class="p-3 text-center">                                                        
                                <button class="btn btn-outline-success" id="buscarUser" name="buscarUser" type="submit" value="buscar" style="font-size: 12px"><i class="fas fa-search"></i></button>
                                <button class="btn btn-outline-danger" id="borrarUser" name="borrarUser" type="submit" value="borrar" style="font-size: 12px"><i class="fas fa-trash-alt"></i></button>
                            </div> 
                        </div>                                                                                               	                                                                        
                    </form>
                </div> <!--cierra el body-->
            </div><!--cierra el card-->            
        </div><!--cierra el col-->
        
    <div class="col-md-7">
        <div class="card h-75 shadow-lg">   
            <div class="card-header label">
                <span style="font-size: 12px"><b><i class="fas fa-cubes"></i> PERMISOS</b></span>                                     
                <div class="position-absolute top-0 end-0 me-2">
                    <button type="button" class="btn btn-outline-secondary adminInsertbtn" data-bs-toggle="modal" data-bs-target="#agregarListadoModal" style="font-size: 12px"><i class="fa fa-plus"></i></button>
                </div>
            </div>            
            <div class="card-body label table-responsive position-relative" style="overflow-y:scroll">                                                                
                <table class="table-responsive table table-striped ">                    
                    <thead>
                        <tr class="text-center">                                
                            <th class="w-25" style="font-size: 12px">#</th> 
                            <th scope="col" style="font-size: 12px">Listados</th>   
                            <th scope="col" style="font-size: 12px">Correo Electronico</th>                                                                                 
                            <th></th>                          
                            <th></th>
                            <th scope="col" style="font-size: 12px">Acción</th>
                        </tr>
                    </thead>                
                    <tbody class="bodyContent">
                        <c:forEach var="listado" items="${listado}" varStatus="status">
                            <tr class="input-select justify-content-center text-center w-25">
                                <td class="w-25" style="font-size: 12px">${status.count}</td> <!-- Es un contador -->
                                <td style="font-size: 12px">${listado.listado}</td>
                                <td style="font-size: 12px">${listado.mail}</td>
                                <td></td>  
                                <th></th>                                
                                <td class="d-flex py-3 justify-content-center">                               
                                    <a type="button" href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idListados=${listado.idlistados}" class="btn btn-outline-success btn"  style="font-size: 12px"><i class="far fa-edit"></i></a>                                    
                                    <a type="button" href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&idListados=${listado.idlistados}" class="boton btn btn-outline-danger" style="font-size: 12px"><i class="far fa-trash-alt"></i></a>
                                </td>                            
                            </tr>    
                        </c:forEach>
                    </tbody>                           
                    <tfoot>							
                        <td> <strong>Total de archivos: <fmt:formatNumber value="${cantidadReg}"/></strong> </td>
                    </tfoot>                                     
                </table>                                                               
            </div>                                 
        </div>                       	
    </div> 
</div> 
