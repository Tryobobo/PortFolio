<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spring MVC Email Example</title>
        <style type="text/css">
            #emailFormDiv {
                text-align: center;
                padding-top: 16px;
            }
             
            #emailFormPage {
                text-decoration: none;
                text-align: center;
                cursor: pointer;
            }
             
            #successMessage {
                text-align: center; 
                color: green; 
                font-size: 25px; 
                padding-top: 17px;
            }
        </style>
    </head>
     
    <body>
        <center>
            <h2>Spring MVC Email Example</h2>
        </center>
        <div id="successMessage">
            <strong>${messageObj}</strong>
        </div>
        <div id="emailFormDiv">
            <a id="emailFormPage" href="emailFormPage">Go To Email Form Page</a>
        </div>
    </body>
</html>