<%-- 
    Document   : crearVehiculo
    Created on : 24/02/2019, 10:58:55 AM
    Author     : Yury Muñoz
--%>

<%@page import="java.sql.Date"%>
<%@page import="modelo.DTOs.VehiculoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>VehiAlpes CRM</title>
  <!-- Favicon -->
  <link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="./assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
  <link href="./assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
  <!-- Argon CSS -->
  <link type="text/css" href="./assets/css/argon.css?v=1.0.0" rel="stylesheet">
 
</head>

<body>
    
    <%
        VehiculoDTO v = new VehiculoDTO();
        v.setVin("");
        v.setMatricula("");
        v.setAnioFabricacion("");
        v.setCilindraje("");
        v.setTipoCombustible(0);
        v.setModelo("");
        v.setColor("");
        v.setNumSillas("");
        v.setIdMarca(1);
        v.setIdTipo(1);
        v.setPaisFab("");
        v.setPrecioCosto(0);
        v.setPrecioVenta(0);
        v.setNombre("");
        
        if(request.getAttribute("vehiculoConsultado")!= null){
           v =  (VehiculoDTO) request.getAttribute("vehiculoConsultado");
            System.out.println("consulto "+v.toString());
        }
       
    %>
    
    
    
  <!-- Sidenav -->
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
     <!-- <a class="navbar-brand pt-0" href="../index.html">
        <img src="../assets/img/brand/blue.png" class="navbar-brand-img" alt="...">
      </a> -->
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        <li class="nav-item dropdown">
          <a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="ni ni-bell-55"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="Image placeholder" src="./assets/img/theme/team-1-800x800.jpg">
              </span>
            </div>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="../taller_1/paginas/crearCliente.jsp" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </a>
            <a href="../taller_1/paginas/crearCliente.jsp" class="dropdown-item">
              <i class="ni ni-settings-gear-65"></i>
              <span>Settings</span>
            </a>
            <a href="../taller_1/paginas/crearCliente.jsp" class="dropdown-item">
              <i class="ni ni-calendar-grid-58"></i>
              <span>Activity</span>
            </a>
            <a href="../taller_1/paginas/crearCliente.jsp" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#!" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Logout</span>
            </a>
          </div>
        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="../index.html">
                <img src="./assets/img/brand/blue.png">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <!-- Form -->
        <form class="mt-4 mb-3 d-md-none">
          <div class="input-group input-group-rounded input-group-merge">
            <input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="Search" aria-label="Search">
            <div class="input-group-prepend">
              <div class="input-group-text">
                <span class="fa fa-search"></span>
              </div>
            </div>
          </div>
        </form>
        <!-- Navigation -->
            <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="../index.html">
              <i class="ni ni-tv-2 text-primary"></i> Dashboard
            </a>
          </li>
         <li class="nav-item active">
            <a class="nav-link" href="../paginas/crearVehiculo.jsp">
              <i class="ni ni-bus-front-12 text-blue"></i> Automóviles
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../examples/crearVentas.jsp">
              <i class="ni ni-cart text-orange"></i> Ventas
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link " href="../paginas/crearCliente.jsp">
              <i class="ni ni-single-02 text-yellow"></i> Clientes
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../examples/tables.html">
              <i class="ni ni-bullet-list-67 text-red"></i> Repuestos
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../examples/login.html">
              <i class="ni ni-key-25 text-info"></i> PQRs
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../examples/register.html">
              <i class="ni ni-circle-08 text-pink"></i> Garantías
            </a>
          </li> 
        </ul>
        <!-- Divider -->
        <hr class="my-3">
        <!-- Heading -->
      
      </div>
    </div>
  </nav>
  <!-- Main content -->
  <div class="main-content">
    <!-- Top navbar -->
    <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
        <!-- Brand -->
      <!--  <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">User profile</a>-->
        <!-- Form -->
        <form method="POST"  action="/taller_1/ControladorBuscarVehiculo"   class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
          <div class="form-group mb-0">
            <div class="input-group input-group-alternative">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-search"></i></span>
              </div>
                <input class="form-control" placeholder="Buscar automóvil" name="input_idBuscarAuto" type="text">
              
            </div>
          </div>
               <input type="submit"  style="margin-top: 10px;" class="btn btn-info" value="buscar"> 
        </form>
        
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="./assets/img/theme/team-4-800x800.jpg">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold">Jessica Jones</span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              <a href="../paginas/crearCliente.jsp" class="dropdown-item">
                <i class="ni ni-single-02"></i>
                <span>My profile</span>
              </a>
              <a href="../paginas/crearCliente.jsp" class="dropdown-item">
                <i class="ni ni-settings-gear-65"></i>
                <span>Settings</span>
              </a>
              <a href="../paginas/crearCliente.jsp" class="dropdown-item">
                <i class="ni ni-calendar-grid-58"></i>
                <span>Activity</span>
              </a>
              <a href="../paginas/crearCliente.jsp" class="dropdown-item">
                <i class="ni ni-support-16"></i>
                <span>Support</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="#!" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- Header -->
    <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 100px; background-size: cover; background-position: center top;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>
      <!-- Header container -->
      <div class="container-fluid d-flex align-items-center">
        <div class="row">
          <div class="col-lg-7 col-md-10">
            <h1 class="display-2 text-white">VehiAlpes</h1>
        <!--    <p class="text-white mt-0 mb-5">This is your profile page. You can see the progress you've made with your work and manage your projects or assigned tasks</p> -->
           
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--7">
      <div class="row">
        
        <div class="col-xl-8 order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                <div class="col-8">
                  <h3 class="mb-0">Automóvil</h3>
                </div>
                <div class="col-4 text-right">
               <!--   <a href="#!" class="btn btn-sm btn-primary">Informacion del cliente</a>-->
                </div>
              </div>
            </div>
            <div class="card-body">
                <form method="POST" action="/taller_1/ControladorCrearVehiculo">
                <h6 class="heading-small text-muted mb-4">Datos  </h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-vin">VIN</label>
                        <input name="input-vin" type="text" id="input-username" class="form-control form-control-alternative" placeholder="0" 
                               value="<%=v.getVin()%>">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-matricula">Matricula</label>
                        <input name="input-matricula" type="text" id="input-matricula" class="form-control form-control-alternative" placeholder=""
                               value="<%=v.getMatricula()%>">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      
                        <label class="form-control-label" for="input-nombre">Nombre</label>
                        <input name="input-nombre" type="text" id="input-first-name" class="form-control form-control-alternative" placeholder="" 
                               value="<%=v.getNombre()%>" >
                      
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-aniofab">Año de fabricacion</label>
                        <input name="input-aniofab" type="text" id="input-last-name" class="form-control form-control-alternative" placeholder=""
                               value="<%=v.getAnioFabricacion()%>">
                      </div>
                    </div>
                  </div>
                      
                    <div class="row">
                    <div class="col-lg-6">
                      
                      <label class="form-control-label" for="input-cilindraje">Cilindraje</label>
                        <input name="input-cilindraje" id="input-address" class="form-control form-control-alternative" placeholder=""  type="text"
                               value="<%=v.getCilindraje()%>">
                      
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                          <label class="form-control-label" for="input-combustible" value="<%=v.getTipoCombustible()%>">Tipo de combustible</label><br/>
                        <select name="input-combustible" style=" width: 200px; height: 40px;">
                            <option value="1">Gasolina</option>
                            <option value="2">Diésel</option>
                            <option value="3">Gas natural</option>
                        </select>
                      </div>
                    </div>
                  </div>   
                        
                  <div class="row">
                    <div class="col-lg-6">
                      
                       <label class="form-control-label" for="input-modelo">Modelo</label>
                        <input name="input-modelo" type="tel" id="input-country" class="form-control form-control-alternative" placeholder="0" 
                               value="<%=v.getModelo()%>">
                      
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-color">Color</label>
                        <input name="input-color" type="text" id="input-postal-code" class="form-control form-control-alternative" placeholder="0" 
                               value="<%=v.getColor()%>">
                      </div>
                    </div>
                  </div>      
                        
                    <div class="row">
                    <div class="col-lg-6">
                      
                         <label class="form-control-label" for="input-nsillas">Número de sillas</label>
                        <input name="input-nsillas" type="text" id="input-city" class="form-control form-control-alternative"
                               value="<%=v.getNumSillas()%>">
                      
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-marca" value="<%=v.getIdMarca()%>">Marca</label><br/>
                        <select name="input-marca" style=" width: 200px;  height: 40px;">
                            <option value="1">x</option>
                        </select>
                      </div>
                    </div>
                  </div>     
                        
                     <div class="row">
                    <div class="col-lg-6">
                      
                        <label class="form-control-label" for="input-tipo" value="<%=v.getIdTipo()%>">Tipo</label>
                        <br/>
                        <select name="input-tipo" style=" width: 200px;  height: 40px;">
                            <option value="1">Automovil (4x2)</option>
                              <option value="2">SUVs (4x4)</option>
                        </select>
                   
                    </div>
                        
                         <div class="col-lg-6">
                      
                        <label class="form-control-label" for="input-paisfab">Pais de fabricación</label>
                        <input name="input-paisfab" type="text" id="input-paisfab" class="form-control form-control-alternative"
                               value="<%=v.getPaisFab()%>">
                     
                    </div>
                      </div>
                      
                     <div class="row">
                    <div class="col-lg-6">
                      
                       <label class="form-control-label" for="input-costo">Costo</label>
                        <input name="input-costo" type="tel" id="input-country" class="form-control form-control-alternative" placeholder="0" 
                               value="<%=v.getPrecioCosto()%>">
                      
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-venta">Valor venta</label>
                        <input name="input-venta" type="text" id="input-postal-code" class="form-control form-control-alternative" placeholder="0" 
                               value="<%=v.getPrecioVenta()%>">
                      </div>
                          <input type="submit"  style="margin-top: 10px;" class="btn btn-info" value="Registrar"> 
                    </div>
                  </div>    
                </div>
                   
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Footer -->
      <footer class="footer">
        <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
            <div class="copyright text-center text-xl-left text-muted">
              &copy; 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
            </div>
          </div>
          <div class="col-xl-6">
            <ul class="nav nav-footer justify-content-center justify-content-xl-end">
              <li class="nav-item">
                <a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a>
              </li>
              <li class="nav-item">
                <a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a>
              </li>
              <li class="nav-item">
                <a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a>
              </li>
              <li class="nav-item">
                <a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a>
              </li>
            </ul>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!-- Argon Scripts -->
  <!-- Core -->
  <script src="../assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Argon JS -->
  <script src="../assets/js/argon.js?v=1.0.0"></script>
</body>

</html>
