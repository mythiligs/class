

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class MyListener
 *
 */
@WebListener
public class MyListener implements HttpSessionListener {

	public static int tuser,cuser=0;
	public static ServletContext ctx;
    public void sessionCreated(HttpSessionEvent se)  { 
       tuser++;
       cuser++;
       ctx=se.getSession().getServletContext();
       ctx.setAttribute("total", tuser);
       ctx.setAttribute("current",cuser);
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
        cuser--;
        ctx.setAttribute("current", cuser);
    }
	
}
