<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page - Self Service Demo</title>
    <link rel="stylesheet" href="./files/bootstrap.min.css">
    <link rel="stylesheet" href="./files/site.css">
    <link rel="stylesheet" href="./files/HarnessDemoWeb.styles.css">
</head>
<body data-new-gr-c-s-check-loaded="14.1083.0" data-gr-ext-installed="">
  
  <script>
    const request = new XMLHttpRequest();
    const url = './my-servlet';
    request.open("GET", url);
    request.send();
    var doc;
    request.onload = (e) => {
    doc=request.response;
    document.getElementById("ci").innerHTML = doc;
    }
  </script>
  

  <script type="module">
    import { initialize, Event } from 'https://unpkg.com/@harnessio/ff-javascript-client-sdk@1.4.10/dist/sdk.client.js'
    document.addEventListener('DOMContentLoaded', function () {
                  
            var email = login();
            var ClientSDK = "FF-API-KEY";
            var ServerSDK = "FF-API-KEY";
          
                
  
            const cf = initialize(ClientSDK,  {
              identifier: email,
                attributes: {
                  lastUpdated: Date()
                  }
            });

        cf.on(Event.CHANGED, flagInfo => {
        if (flagInfo.deleted) {
          console.log('Flag is deleted')
          console.log(JSON.stringify(flagInfo, null, 2))
        } else {
          console.log('Flag is changed')
          console.log(JSON.stringify(flagInfo, null, 2))
         
          //show and hide modules according to FF variations.
          show_hide_column("ci", cf.variation('Enable_CI_Module'),true);
          show_hide_column("cd", cf.variation('Enable_CD_Module'),true);
          show_hide_column("ff", cf.variation('Enable_FF_Module'),true);
          show_hide_column("srm", cf.variation('Enable_SRM_Module'),true);
          show_hide_column("sto", cf.variation('Enable_STO_Module'),true);
          show_hide_column("ce", cf.variation('Enable_CE_Module'),true);
          show_hide_column("ccm", cf.variation('Enable_CCM_Module'),true);

          
        }
      })
    
    }, false);
  
          </script>

<script>
  function show_hide_column(col_id, do_show) {
  var stl;
  if (do_show) stl = 'block'
  else stl = 'none';

  var tbl = document.getElementsByTagName('table')[0];
  var index = document.getElementById(col_id).cellIndex;
  var rows = tbl.getElementsByTagName('tr');

  for (var row = 0; row < rows.length; row++) {
    var cels = rows[row].getElementsByTagName('td')
    cels[index].style.display = stl;
  }
}
function logout() {
      sessionStorage.removeItem('email');
      login();
    }

    function login() {
      
      var email = sessionStorage.getItem('email');
      
      if (null == email) {
        email = prompt("Login with your Email Address");
        sessionStorage.setItem('email', email);
        location.reload();
      }

      $(".email").text(email);

      return email;
    }
</script>
  
<header>
        <nav b-4lauca5nue="" class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
            <div b-4lauca5nue="" class="container-fluid">
                <a class="navbar-brand" href="http://ssh-demo.harness-demo.site/ssh-demo/index.jsp">Harness Demo - Traditional Java</a>
                <button b-4lauca5nue="" class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span b-4lauca5nue="" class="navbar-toggler-icon"></span>
                </button>
                <div b-4lauca5nue="" class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                    <ul b-4lauca5nue="" class="navbar-nav flex-grow-1">
                        <li b-4lauca5nue="" class="nav-item">
                            <a class="nav-link text-dark" href="http://ssh-demo.harness-demo.site/ssh-demo/index.jsp">Home</a>
                        </li>
                        <li b-4lauca5nue="" class="nav-item">
                            <a class="nav-link text-dark" href="http://ssh-demo.harness-demo.site/ssh-demo/index.jspHome/Privacy">Privacy</a>
                        </li>
                        <li b-4lauca5nue="" class="nav-item">
                            <a b-4lauca5nue="" class="nav-link text-dark" target="_blank" href="https://harness.io/">
                                <img alt="Harness.io" src="./files/harness.jpg" width="50" height="25">
                            </a>
                        </li>
                        <li b-4lauca5nue="" class="nav-item">
                            <a b-4lauca5nue="" class="nav-link text-dark" target="_blank" href="https://github.com/gacerioni">
                                <img alt="GitHub" src="./files/github_icon.png" width="25" height="25">
                            </a>
                        </li>
                    </ul>
                    <div class="page-header-actions">
                      <div>Welcome, <strong class="email">admin@harness.io</strong>! 
                        <div class="dropdown" style="display: inline;">
                          <a href="#" class="logout" type="button" onclick="logout(); return false;">Log Out</a>
                        </div>
                      </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <div b-4lauca5nue="" class="container">
        <main b-4lauca5nue="" role="main" class="pb-3">
            

<div class="text-center">
    <h1 class="display-4">Demo Version: v1.0.0</h1>
    <p>Harness has successfully deployed your new Java application in K8s!</p>
</div>


<table cellpadding="0" cellspacing="0" width="100%">
    <tbody><tr>
        <td id ="ci">
                <br><a target="_blank" href="https://harness.io/products/continuous-integration"><img src="./files/CI.png"></a><br>Intelligent build &amp; test
        </td>
        <td id ="cd">
                <br><a target="_blank" href="https://harness.io/products/continuous-delivery"><img src="./files/CG_GitOps.png"></a><br>Fast &amp; Secure deployments
        </td>
        <td id="ccm">
                <br><a target="_blank" href="https://harness.io/products/cloud-cost"><img src="./files/CCM.png"></a><br>Cloud Cost Management
        </td>
        <td id="ff">
                <br><a target="_blank" href="https://harness.io/products/feature-flags"><img src="./files/FF.png"></a><br>Manage feature flags
        </td>
        <td id="srm">
                <br><a target="_blank" href="https://harness.io/products/service-reliability-management"><img src="./files/SRM.png"></a><br>SLO-driven software delivery
        </td>
        <td id="sto">
                <br><a target="_blank" href="https://harness.io/products/security-testing-orchestration"><img src="./files/STO.png"></a><br>Shift-left application security
        </td>
        <td id="ce">
                <br><a target="_blank" href="https://harness.io/products/chaos-engineering"><img src="./files/chaos.png"></a><br>Improve application resiliency
        </td>
    </tr>
</tbody></table>
        </main>
    </div>
   
    <footer b-4lauca5nue="" class="border-top footer text-muted">
        <div b-4lauca5nue="" class="container">
            © 2022 - Harness Demo Web - <a href="http://ssh-demo.harness-demo.site/ssh-demo/index.jsp">Gabs the Creator</a>
        </div>
    </footer>
    <script src="./files/jquery.min.js.download"></script>
    <script src="./files/bootstrap.bundle.min.js.download"></script>
    <script src="./files/site.js.download"></script>
    


</body><grammarly-desktop-integration data-grammarly-shadow-root="true"></grammarly-desktop-integration></html>