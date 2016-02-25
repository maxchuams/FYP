/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import src.model.ProjectDAO;
import src.model.RecommedationDAO;
import src.model.Recommendation;
import src.model.TrelloBoard;
import src.model.TrelloCard;
import src.model.TrelloDetailsDAO;

/**
 *
 * @author maxchua
 */
public class assignRecommendation extends HttpServlet {

    private Object RecommendationDAO;
    private static final String PROPS_FILENAME = "/trello.properties";
    private static String mainboard;
    private static String devList;
    private static String adminUsername;

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
        try {
            InputStream is4 = ConnectionManager.class.getResourceAsStream(PROPS_FILENAME);
            Properties props = new Properties();
            props.load(is4);

            mainboard = props.getProperty("trello.mainboard").trim();
            devList = props.getProperty("trello.developmentList").trim();
            //adminUsername = props.getProperty("trello.admin");
        } catch (Exception ex) {
            // unable to load properties file
            String message = "Unable to load '" + PROPS_FILENAME + "'.";
            // System.out.println(message);
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, message, ex);
            throw new RuntimeException(message, ex);
        }
        try {
            String projName = request.getParameter("card");
            String nameForRequestObj = request.getParameter("name");
            ArrayList<String> pList = ProjectDAO.retrieveAllProjectNames();
            if(pList.contains(nameForRequestObj)){
                String err = "Duplicate name for project. There is already a project with the same name in the database";
                 RequestDispatcher view = request.getRequestDispatcher("editTrelloCard.jsp?name="+ nameForRequestObj + "&id=" + projName);
                 request.setAttribute("err", err);
                    view.forward(request, response);
                    return;
            }
            String intensity = request.getParameter("priority");
            String type = request.getParameter("type");
            String otherType = request.getParameter("otherType");
            if ("Others".equals(type)) {
                type = request.getParameter("inputType");
                if (type == null) {
                    type = "";
                }
            }
            //get todays date
            String sDate = request.getParameter("sDate");
            String daysstr = request.getParameter("days");
            String devCountStr = request.getParameter("devCount");
            String kStr = request.getParameter("k");
            String experienceFactorStr = request.getParameter("experienceFactor");
            String defectFactorStr = request.getParameter("defectFactor");
            String scheduleFactorStr = request.getParameter("scheduleFactor");
            
            String id = request.getParameter("id");

            //Setting attriute to pass back to previous page if needed 
            request.setAttribute("card", projName);
            request.setAttribute("priority", intensity);
            request.setAttribute("type", type);
            request.setAttribute("sDate", sDate);
            request.setAttribute("days", daysstr);
            request.setAttribute("devCount", devCountStr);
            request.setAttribute("k", kStr);
            request.setAttribute("experienceFactor", experienceFactorStr);
            request.setAttribute("defectFactor", defectFactorStr);
            request.setAttribute("scheduleFactor", scheduleFactorStr);
            request.setAttribute("name", nameForRequestObj);
            request.setAttribute("id", id);

            if (projName == null || intensity == null || type == null || sDate == null || daysstr == null
                    || devCountStr == null || experienceFactorStr == null || defectFactorStr == null
                    || scheduleFactorStr == null || kStr == null) {
                response.sendRedirect("login.jsp");
                //request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            int priority = Integer.parseInt(intensity);
            int days = Integer.parseInt(daysstr);
            int devCount = Integer.parseInt(devCountStr);
            int k = Integer.parseInt(kStr);
            double experienceFactor = Double.parseDouble(experienceFactorStr);
            double defectFactor = Double.parseDouble(defectFactorStr);
            double scheduleFactor = Double.parseDouble(scheduleFactorStr);

            RequestDispatcher view = request.getRequestDispatcher("editTrelloCard.jsp?name="+ nameForRequestObj + "&id=" + projName);
            try {
                boolean valid = validDate(sDate);
                if (!valid) {
                    request.setAttribute("err", "Please set a date that is after today");
                    view.forward(request, response);
                    return;
                }
            } catch (ParseException w) {

                request.setAttribute("err", "Invalid date format.");
                view.forward(request, response);
                return;
            }
            try {
                boolean valid = validDate(sDate);

                if (!valid) {
                    request.setAttribute("err", "Please set the start date today/after today.");
                    view.forward(request, response);
                    return;
                }
            } catch (ParseException w) {

                request.setAttribute("err", "invalid date");
                view.forward(request, response);
                return;
            }

            String username = currUser.getUsername();
            String key = TrelloDetailsDAO.retrieveTrelloKey(username);
            String token = TrelloDetailsDAO.retrieveTrelloToken(username);
            //System.out.println("KEY:  " + key + " TOKEN : " + token);
            //first url to call the user's boards

            URL memberUrl = new URL("https://api.trello.com/1/members/" + username + "?fields=username,fullName,url&boards=all&board_fields=name&organizations=all&organization_fields=displayName&key=" + key + "&token=" + token);
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
                if (listName.equals(devList)) {
                    listId = list.getString("id");
                }
            }

            //now we will get all cards related to the user
            //and with the masterboardid as well as the listid, we will be able to identify all 
            //cards related to the development list
            URL cardUrl = new URL("https://api.trello.com/1/boards/" + masterboardID + "/cards?key=" + key + "&token=" + token);
            con = cardUrl.openConnection();
            is = con.getInputStream();
            br = new BufferedReader(new InputStreamReader(is));

            line = null;
            jsonOutput = "";
            while ((line = br.readLine()) != null) {
                jsonOutput += line;
            }

            //get all developers in RW
            ArrayList<Person> devList = PersonDAO.retrievAllDev();

            //get all members in Trello
            ArrayList<String> mTList = new ArrayList<String>();
            URL membersUrl = new URL("https://api.trello.com/1/boards/" + masterboardID + "/members?key=" + key + "&token=" + token);
            con = membersUrl.openConnection();
            is = con.getInputStream();
            br = new BufferedReader(new InputStreamReader(is));

            line = null;
            String jsonOutput1 = "";
            while ((line = br.readLine()) != null) {
                jsonOutput1 += line;
            }
            JSONArray membArr = new JSONArray(jsonOutput1);
            for (int i = 0; i < membArr.length(); i++) {
                JSONObject member = membArr.getJSONObject(i);
                String memUsername = member.getString("username");
                String memID = member.getString("id");
                for (Person toCheck : devList) {
                    if (toCheck.getUsername().contains(memUsername)) {
                        mTList.add(memID);
                    }
                }
            }

            //get the card, add to arraylist
            JSONArray cardsArr = new JSONArray(jsonOutput);
            System.out.println(jsonOutput + "xxxxx");
            TrelloCard toAssign = null;
            for (int i = 0; i < cardsArr.length(); i++) {
                JSONObject tempCard = cardsArr.getJSONObject(i);
                //System.out.println(tempCard);
                String idList = tempCard.getString("idList");
                //System.out.println(idList);
                String cardId = tempCard.getString("id");
                if (idList.equals(listId) && cardId.equals(projName)) {
                    String name = tempCard.getString("name");
                    String due = "";
                    try {
                        due = tempCard.getString("due").substring(0, 10);
                    } catch (Exception de) {
                        Calendar cal = Calendar.getInstance();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        due = sdf.format(cal.getTime());
                    }

                    String desc = tempCard.getString("desc").replace("**", "");
                    if (desc.length() >= 100) {
                        desc = desc.substring(0, 100);
                    }
                    toAssign = new TrelloCard(name, projName, desc, due, priority, type);
                }
            }
            //String dateToFormat = "";
            //if (toAssign.getDue() == null) {
              //  Calendar cal = Calendar.getInstance();
                //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                //dateToFormat = sdf.format(cal.getTime());
            //} else {
                // dateToFormat = toAssign.getDue();
            //}
            
//            String dateToFormat = toAssign.getDue();
//            System.out.println("date " + dateToFormat);
//            
            //System.out.println(toAssign.toString());

            //validate project size
            if (days < 1) {
                request.setAttribute("err", "Project size must be greater than zero days!");
                view.forward(request, response);
                return;
            }
            //validate 
            if (devCount < 1) {
                request.setAttribute("err", "Developer count for project must be greater than zero!");
                view.forward(request, response);
                return;
            }
            //validate project size
            if (k < 1 || k > 10) {
                request.setAttribute("err", "The top K selection must be between 1 to 10!");
                view.forward(request, response);
                return;
            }

            ArrayList<ArrayList<Recommendation>> rList = RecommedationDAO.getRecommendation(type, sDate, days, priority, devCount, experienceFactor, defectFactor, scheduleFactor, k);

            RequestDispatcher rd = null;
            if(rList.size()==0){
                rd = request.getRequestDispatcher("editTrelloCard.jsp?name=" + toAssign.getName());
                request.setAttribute("err", "There is no developer with skill '" + otherType + "', please reselect the project type or add a developer with the skill");
                request.setAttribute("otherType",otherType);
                request.setAttribute("sDate", sDate);
                request.setAttribute("days", daysstr);
                request.setAttribute("devCount", devCountStr);
                request.setAttribute("priority", intensity);
            }else{
                rd = request.getRequestDispatcher("assignDev.jsp?name=" + toAssign.getName());
            }
            request.setAttribute("rList", rList);
            request.setAttribute("project", toAssign);
            request.setAttribute("days", days);

            rd.forward(request, response);
            return;

        } catch (IOException e) {
            RequestDispatcher view = request.getRequestDispatcher("viewUnassignedCards.jsp");
            request.setAttribute("err", "Invalid Trello Key and Token");
            view.forward(request, response);
            return;
        }

    }

    //check if a date is before today, reture false 
    private boolean validDate(String date) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);

        Date validate = sdf.parse(date);

        return !validate.before(new Date());

    }

    //check if 1st param date is after second param date, return true
    private boolean validDate2(String date, String sDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);

        Date validate = sdf.parse(date);
        Date start = sdf.parse(sDate);
        return validate.after(start);

    }

    //check if 1st param date is after second param date, return true
    private boolean validDate3(String cDate, String eDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);

        Date validate = sdf.parse(cDate);
        Date start = sdf.parse(eDate);
        return validate.after(start);

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
