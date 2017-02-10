package lk.grp.synergy;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.glassfish.jersey.client.JerseyClient;
import org.glassfish.jersey.client.JerseyClientBuilder;
import org.glassfish.jersey.client.JerseyWebTarget;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;

/**
 * Created by isuru on 2/6/17.
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    Client client = ClientBuilder.newClient();
    Gson gson = new GsonBuilder().setPrettyPrinting().create();
    JsonParser jsonParser = new JsonParser();
    Logger logger = LogManager.getLogger(LoginServlet.class);

    public LoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logger.info("Received POST request");
        String username = req.getParameter("username");
        String pwd = req.getParameter("password");

        JsonObject payload = new JsonObject();
        payload.addProperty("userId",username);
        payload.addProperty("password",pwd);

        if(username != null && pwd!=null){
            Response login = client.target("http://localhost:8080/oad/oad-api/")
                    .path("login")
                    .request(MediaType.APPLICATION_JSON)
                    .accept(MediaType.APPLICATION_JSON)
                    .post(Entity.entity(gson.toJson(payload),MediaType.APPLICATION_JSON));

            if(login.getStatus()==200){
                JsonObject readEntity = jsonParser.parse(login.readEntity(String.class)).getAsJsonObject();
                System.out.println(readEntity.toString());
                if(readEntity.has("authKey")) {
                    req.getSession().setAttribute("authKey",readEntity.get("authKey").getAsString());
                    req.getSession().setAttribute("studentId",username);
                    req.getRequestDispatcher("/index.jsp").forward(req,resp);
                }else{
                    req.getRequestDispatcher("/sign-in.jsp").forward(req,resp);
                }
            }else{
                req.getRequestDispatcher("/sign-in.jsp").forward(req,resp);
            }
        }else{
            req.getRequestDispatcher("/sign-in.jsp").forward(req,resp);
        }
    }
}
