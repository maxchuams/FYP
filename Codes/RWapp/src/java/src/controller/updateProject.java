/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import src.model.ConnectionManager;
import src.model.Person;
import src.model.PersonDAO;
import src.model.Project;
import src.model.ProjectDAO;
import src.model.TrelloBoard;

/**
 *
 * @author maxchua
 */
public class updateProject extends HttpServlet {
    private static final String PROPS_FILENAME = "/trello.properties";
    private static String mainboard;
    private static String devList;
    private static String postDevList;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
HttpSession sess = request.getSession();
       
        
        Person p1 = (Person) sess.getAttribute("loggedInDev");
        Person p2 = (Person) sess.getAttribute("loggedInDesg");
        Person p3 = (Person) sess.getAttribute("loggedInPm");
        Person p4 = (Person) sess.getAttribute("loggedInTester");
        Person currUser = null;

        if (p1 != null) {
            currUser = p1;

        } else if (p2 != null) {
            currUser = p2;

        } else if (p3 != null) {
            currUser = p3;

        } else if (p4 != null) {
            currUser = p4;
        } else {
            response.sendRedirect("login.jsp");
            return;
        }
        String pname = request.getParameter("pname");
        try {
            InputStream is4 = ConnectionManager.class.getResourceAsStream(PROPS_FILENAME);
            Properties props = new Properties();
            props.load(is4);

          
            mainboard = props.getProperty("trello.mainboard").trim();
            devList = props.getProperty("trello.developmentList").trim();
            postDevList = props.getProperty("trello.postdevlist");
        } catch (Exception ex) {
            // unable to load properties file
            String message = "Unable to load '" + PROPS_FILENAME + "'.";
            // System.out.println(message);
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, message, ex);
            throw new RuntimeException(message, ex);
        }

        try {
            String assignedby = request.getParameter("assignedby");
            String due = request.getParameter("duedate");
            String priority = request.getParameter("priority");
            int pInt = Integer.parseInt(priority);
            String iscomplete = request.getParameter("iscomplete");
            int cInt = Integer.parseInt(iscomplete);
            String days = request.getParameter("days");
            int dInt = Integer.parseInt(days);
            String type = request.getParameter("type");

            boolean success = ProjectDAO.updateProject(assignedby, due, pInt, cInt, dInt, type, pname);
            if (success) {
                try {
                    if (cInt == 1) {
                        Person pm = PersonDAO.retrieveUser(assignedby);
                        String token = pm.getToken();
                        String key = pm.getTrelloKey();
                        URL memberUrl = new URL("https://api.trello.com/1/members/" + assignedby + "?fields=username,fullName,url&boards=all&board_fields=name&organizations=all&organization_fields=displayName&key=" + key + "&token=" + token);
                        //System.out.println(memberUrl);

                        URLConnection con = memberUrl.openConnection();
                        InputStream is = con.getInputStream();
                        BufferedReader br = new BufferedReader(new InputStreamReader(is));

                        String line = null;
                        String jsonOutput = "";
                        TrelloBoard tb = null;
                        // read each line and throw string into JSONObject
                        while ((line = br.readLine()) != null) {
                            jsonOutput += line;

                        }

                        JSONObject obj = new JSONObject(jsonOutput);
                        JSONArray boardArr = obj.getJSONArray("boards");
        //iterate through the user's boards and store into an arraylist first

                        //masterboardID - id for masterboard need this for the URL
                        String masterboardID = "";
                        for (int i = 0; i < boardArr.length(); i++) {
                            JSONObject board = boardArr.getJSONObject(i);
                            String name = board.getString("name");
                            if (name.equals(mainboard)) {
                                masterboardID = board.getString("id");
                            }

                        }

                        //now we will call the api to get the boards and check for projects master board
                        URL listUrl = new URL("https://api.trello.com/1/boards/" + masterboardID + "/lists?key=" + key + "&token=" + token);
                        con = listUrl.openConnection();
                        is = con.getInputStream();
                        br = new BufferedReader(new InputStreamReader(is));

                        line = null;
                        jsonOutput = "";
                        while ((line = br.readLine()) != null) {
                            jsonOutput += line;
                        }
                        //store the id of the List
                        String listId = "";

                        JSONArray boardList = new JSONArray(jsonOutput);
                        for (int i = 0; i < boardList.length(); i++) {
                            JSONObject list = boardList.getJSONObject(i);

                            String listName = list.getString("name");
                            if (listName.equals(postDevList)) {
                                listId = list.getString("id");
                            }
                        }
                        Project cardToUpdate = ProjectDAO.retrieveProjectByProjectName(pname);
                        String id = cardToUpdate.getTrelloKey();
                        
                        System.out.println("list id : " + listId + "  ** card id = " + id);

                        String url = "https://api.trello.com/1/cards/"+ id + "/idList?";
                        URL moveToTrello = new URL(url);
                        HttpsURLConnection con1 = (HttpsURLConnection) moveToTrello.openConnection();

                        //add reuqest header
                        con1.setRequestMethod("PUT");
                        con1.setRequestProperty("User-Agent", "Chrome/45.0.2454.101 m");
                        con1.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
                        con1.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

                        String urlParameters = "value="+ listId +"&key=" +key + "&token=" + token;

                        // Send post request
                        con1.setDoOutput(true);
                        DataOutputStream wr = new DataOutputStream(con1.getOutputStream());
                        wr.writeBytes(urlParameters);
                        wr.flush();
                        wr.close();

                        int responseCode = con1.getResponseCode();
                        System.out.println("\nSending 'POST' request to URL : " + url);
                        System.out.println("Post parameters : " + urlParameters);
                        System.out.println("Response Code : " + responseCode);

                        BufferedReader in = new BufferedReader(
                                new InputStreamReader(con.getInputStream()));
                        String inputLine;
                        StringBuffer response1 = new StringBuffer();

                        while ((inputLine = in.readLine()) != null) {
                            response1.append(inputLine);
                        }
                        in.close();

                        //print result
                        System.out.println(response.toString());

                    }
                } catch (Exception e) {
                    RequestDispatcher rd = request.getRequestDispatcher("editProject.jsp?pname=" + pname);
                    request.setAttribute("err", "Project has been updated. However, card could not be moved to the next list in Trello. Please do so manually. ");
                    rd.forward(request, response);
                    return;
                }
                RequestDispatcher rd = request.getRequestDispatcher("viewTrelloCards.jsp?pname=" + pname);
                request.setAttribute("success", "Project successfully updated");
                rd.forward(request, response);
                return;
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("editProject.jsp?pname=" + pname);
                request.setAttribute("err", "Project could not be updated. Please try again!");
                rd.forward(request, response);
                return;
            }
        } catch (Exception e) {
            RequestDispatcher rd = request.getRequestDispatcher("editProject.jsp?pname=" + pname);
            request.setAttribute("err", "Project could not be updated. Please try again!");
            rd.forward(request, response);
            return;
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
