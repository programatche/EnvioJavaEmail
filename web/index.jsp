<%@page import="util.EnviarEmail"%>
<%
String mensagemUsuario=null;

if (request.getMethod().equals("POST")) {
    EnviarEmail enviar = new EnviarEmail();
    enviar.setEmailDestinatario("programatche@gmail.com");
    enviar.setAssunto("Contato - AgroSoftware");
    //uso StringBuffer para otimizar a concatenação 
    //de string
    StringBuffer texto = new StringBuffer(); 
    texto.append("<h2 align='center'>AgroSoftware</h2>");
    texto.append("Informações Enviadas:<br/>");
    texto.append("Software: ");
    texto.append(request.getParameter("txtNomeSoftware"));
    texto.append("<br/>");
    texto.append("Nome Contato: ");
    texto.append(request.getParameter("txtNomeContato"));
    texto.append("<br/>");
    texto.append("Email Contato: ");
    texto.append(request.getParameter("txtEmail"));
    texto.append("<br/>");
    texto.append("Url: ");
    texto.append(request.getParameter("txtUrl"));
    
    enviar.setMsg(texto.toString());
    
    boolean enviou = enviar.enviarHotmail();
    if (enviou) {
            
            mensagemUsuario = "Dados enviados com sucesso";
           
        } else {
            mensagemUsuario = "Não foi enviar as informações";
            
        }
  
}
  
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Envio de Email em Java/Gmail</h1>
        <div class="panel-heading">
                Dados do Software   '
            </div>
            <div class="panel-body">
                <%if (mensagemUsuario != null) {%>
                <div>
                    <%=mensagemUsuario%>
                </div>
                <%}%>
                <h4>Envie o seu Software</h4>
                <form  name="formulario" method="post">
                    <div class="col-lg-12">

                        <div class="form-group">
                            <label>Nome do Software</label>
                            <input class="form-control"  name="txtNomeSoftware" id="txtNomeSoftware" required tabindex="1" autofocus/>
                        </div>
                        <div class="form-group">
                            <label>Nome para Contato</label>
                            <input class="form-control" type="text" name="txtNomeContato" required tabindex="2"/>
                        </div>
                        <div class="form-group">
                            <label>Email para Contato</label>
                            <input class="form-control" name="txtEmail" required tabindex="3"/>
                        </div>
                        <div class="form-group">
                            <label>Url do Software</label>
                            <input class="form-control"  type="text" name="txtUrl" tabindex="4"/>
                        </div>
                    </div>
                    
                    <div class="col-lg-12">
                        <button class="btn btn-primary btn-sm" tabindex="6"> Enviar</button>
                    </div>
                </form>

            </div>


    

    </body>
</html>
