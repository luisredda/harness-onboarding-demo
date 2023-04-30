package com.harness.sshdemo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.stream.Collectors;

import static java.lang.System.lineSeparator;

@WebServlet(urlPatterns = {"/my-servlet"})
public class HelloServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        super.init();
        log("===> Method init =)");
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
       // resp.getWriter().write("Method service\n");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        String params = joinUrlParameters(req);
        resp.getWriter().write("Method doPost\nURI: " + uri + "\nParams:\n" + params + "\n");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            
        //Integer dividir;
        // dividir = 1/0;
            resp.getWriter().write(" <br><a target=\"_blank\" href=\"https://harness.io/products/continuous-integration\"><img src=\"./files/CI.png\"></a><br>Intelligent build &amp; test");
    
        } catch (Exception e) {
            resp.getWriter().write("<div id=\"exception\"><h1>HTTP Status 500 – Internal Server Error</h1><hr class=\"line\" /><p><b>Type</b> Status Report</p><p><b>Message</b>"+ e.getMessage() +"  </p><p><b>Description</b> The origin server did not find a current representation for the target resource or is not wing to disclose that one exists.</p><h3>Apache Tomcat/10.0.26</h3></div>");
        }
       
       //resp.getWriter().write("<p><img src=\"data:image/png;base64,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\" height=\"30\"></p> <p class=\"desc\">Deploy in peace, verify activities that take place in system. Identify risk early.</p><p class=\"actions\"><span class=\"trial\">7-Day Trial</span><span class=\"sep\"></span><button type=\"button\"class=\"btn btn-sm btn-outline-primary\">Enable</button></p>");
    }

    private String joinUrlParameters(HttpServletRequest req) {
        return req.getParameterMap()
                .entrySet()
                .stream()
                .map(entry -> entry.getKey() + " => " + String.join(" and ", entry.getValue()))
                .collect(Collectors.joining(lineSeparator()));
    }

    @Override
    public void destroy() {
        super.destroy();
        log("===> Method destroy =)");
    }
}