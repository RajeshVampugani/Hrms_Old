﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="confirmationletterfinal1Default.aspx.cs" Inherits="Forms_confirmationletterfinal1Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<!--[if lt IE 7]>
    <html class="lt-ie9 lt-ie8 lt-ie7" lang="en">
  <![endif]-->

<!--[if IE 7]>
    <html class="lt-ie9 lt-ie8" lang="en">
  <![endif]-->

<!--[if IE 8]>
    <html class="lt-ie9" lang="en">
  <![endif]-->

<!--[if gt IE 8]>
    <!-->

<!--<html lang="en">
  <![endif]-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <meta charset="utf-8" />

    <script src="../js/html5-trunk.js" type="text/javascript"></script>
    <link href="../icomoon/style.css" rel="stylesheet" />
    <script src="js/popup1.js"></script>

    <!--[if lte IE 7]>
    <script src="../css/icomoon-font/lte-ie7.js"></script>
    <![endif]-->

    <!-- NVD graphs css -->
    <link href="../css/nvd-charts.css" rel="stylesheet" />

    <!-- Bootstrap css -->
    <link href="../css/main.css" rel="stylesheet" />

    <!-- fullcalendar css -->
    <link href='../css/fullcalendar/fullcalendar.css' rel='stylesheet' />
    <link href='../css/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
    <script type="text/javascript">
        function disableBtn(btnID, newText) {

            var btn = document.getElementById(btnID);
            setTimeout("setImage('" + btnID + "')", 60000);
            btn.disabled = true;
            btn.value = newText;
        }

        function setImage(btnID) {
            var btn = document.getElementById(btnID);
            btn.style.background = 'url(12501270608.gif)';
        }
    </script>
    <script src="js/validation.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal no-margin">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
         <div class="dashboard-wrapper"  style="margin-left: 0px;">

            <div class="main-container" runat="server" id="dash" style="border-top:0px  ">
                  <div id="Div1" runat="server" style="margin-left:13px">
         <div class="page-header">
        <div class="clearfix">
                        <asp:Button ID="print" runat="server" OnClientClick="hide(); show(); window.print();" class="btn btn-info pull-right"  Text="Print" style="float:right"/>
                    </div>

         <div class="page-header">
                    <div class="pull-left">
                        <h2> </h2>
                    </div>
                   
                    <div class="clearfix"></div>
                </div>
         <asp:Image runat="server" ID="img"  ImageUrl="~/images/esclon.jpg" />
        <br />
        <br />
    <p> <b> Confirmation Letter </b>
         <br />
            ______________________________________</p> 
        <p><b> HR/______/_____	</b></p>
        <br />
       
        <p>  Date ___________</p>
        <br />
        <p><b>  Name : </b>   _______________<br />
       <b> Department: _______________</b> </p> 
        <br />
        
        
        <p> Dear ______________</p>
        <br />

        <p>  Greetings!!  </p>
        <p>Consequent to the review of your performance during your probation, we have the pleasure in informing you 
            that, your services are being confirmed as ________________with effect from ____________.</p>

      
        <p>All the other terms and conditions as detailed in your appointment letter remain unchanged. </p>
        
        <p> We look forward to your valuable contributions and wish you all the very best for a rewarding career with the organization.</p>
        <br />
        <br />
      <p> For <b> Escalon Business Services Pvt Ltd </b></p>
        <p style="font-style:oblique"> Ritu Chitra</p>
        <p> <p> Ritu Chitra<br />
            <b> HR Manager</b>
            </p>   </p>
                </div>
                 <br />
        <br />
        <br />
        <br />
                <center> <p> <P style="font-size:13px;text-align:center;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%">-------------------------------------------- Escalon Business Services Pvt Ltd. ------------------------------------------- <br />
          Office: D-151, 2nd Floor, Industrial Area, Phase 8 Mobile, Phone : 0172-5013839 Website:www.escalon.services
               </P></p></center>  
        <br />
        <br />
        <br />
        <br />
        </div>

</div>









    </form>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/moment.js"></script>

    <!-- Easy Pie Chart JS -->
    <script src="../js/pie-charts/jquery.easy-pie-chart.js"></script>

    <!-- Tiny scrollbar js -->
    <script src="../js/tiny-scrollbar.js"></script>

    <!-- Custom Js -->
    <script src="../js/wizard/bwizard.js"></script>

    <!-- Custom Js -->
    <script src="../js/theming.js"></script>
    <script src="../js/custom.js"></script>
    <script src="../js/jquery.dataTables.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("#wizard").bwizard();
    </script>
    <script type="text/javascript">
        //Data Tables
        $(document).ready(function () {
            $('#gveligible').dataTable({
                "sPaginationType": "full_numbers"
            });
        });
    </script>
    <script type="text/javascript">
        //Data Tables
        $(document).ready(function () {
            $('#gvGoals1').dataTable({
                "sPaginationType": "full_numbers"
            });
        });
    </script>
    <script>
        function hide() {
            var x = document.getElementById('print');

            x.style.display = 'none';

            var y = document.getElementById('dash');

            x.style.display = 'none';

        }

        function show() {
            var y = document.getElementById('Div1');
            y.style.display = 'block';
        }
</script>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '../../www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-41161221-1', 'srinu.html');
        ga('send', 'pageview');

    </script>
</body>
</html>