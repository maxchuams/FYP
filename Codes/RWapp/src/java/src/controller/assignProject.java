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
import java.util.ArrayList;
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
import src.model.TrelloBoard;
import src.model.TrelloCard;
import src.model.TrelloCardDAO;
import src.model.TrelloDetailsDAO;

/**
 *
 * @author maxchua
 */
public class assignProject extends HttpServlet {
    private static final String PROPS_FILENAME = "/trello.properties";
    private static String mainboard;
    private static String devList;
    //private static String adminUsername;
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
        try{
        HttpSession sess = request.getSession();
        ArrayList<TrelloCard> checkSess = (ArrayList<TrelloCard>) sess.getAttribute("tc");
        if(checkSess != null){
            sess.removeAttribute("tc");
        }
        
        Person p1 = (Person) sess.getAttribute("loggedInDev");
        Person p2 = (Person) sess.getAttribute("loggedInDesg");
        Person p3 = (Person) sess.getAttribute("loggedInPm");

        Person currUser = null;

        if (p1 != null) {
            currUser = p1;

        } else if (p2 != null) {
            currUser = p2;

        } else if (p3 != null) {
            currUser = p3;

        } else {
            response.sendRedirect("login.jsp");
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
        //truncate trello data
//        TrelloCardDAO.clearData();
        //get the trello details
        //System.out.println(currUser);
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
        ArrayList<String> mTList=new ArrayList<String>();
        URL membersUrl = new URL("https://api.trello.com/1/boards/"+masterboardID+"/members?key="+key +"&token="+token);
        con = membersUrl.openConnection();
        is = con.getInputStream();
        br = new BufferedReader(new InputStreamReader(is));

        line = null;
        String jsonOutput1 = "";
        while ((line = br.readLine()) != null) {
            jsonOutput1 += line;
        }
        JSONArray membArr = new JSONArray(jsonOutput1);
        for(int i =0; i<membArr.length();i++){
            JSONObject member = membArr.getJSONObject(i);
            String memUsername= member.getString("username");
            String memID=member.getString("id");
            //store the member ID
            PersonDAO.updateMemberID(memUsername, memID);
            for(Person toCheck : devList){
                
                if(toCheck.getUsername().contains(memUsername)){
                    mTList.add(memID);
                    
                }
            }
        }
        
        //get the card, add to arraylist
        JSONArray cardsArr = new JSONArray(jsonOutput);
        ArrayList<TrelloCard> tcList = new ArrayList<TrelloCard>();
        for(int i = 0; i < cardsArr.length(); i++){
            JSONObject tempCard = cardsArr.getJSONObject(i);
            //System.out.println(tempCard);
            String idList = tempCard.getString("idList");
            //System.out.println(idList);
            JSONArray members = tempCard.getJSONArray("idMembers");
            boolean unassigned = true;
            for(int j = 0; j< members.length(); j++){
          
                String cardmem = members.getString(j);
                for (String dev : mTList){
                   
                    if(cardmem.equals(dev)){
                        unassigned = false;
                    }
                }
                
            }
            if(idList.equals(listId)&& unassigned){
                String desc = tempCard.getString("desc").replace("**","");
                if(desc.length() >= 8000){
                    desc= desc.substring(0,8000);
                }
                String due = "";
                try{
                due = tempCard.getString("due").substring(0,10);
                } catch (Exception e){
                    due = "No due date";
                }
                String cardId = tempCard.getString("id");
                String name = tempCard.getString("name");
                tcList.add(new TrelloCard(cardId, name, due, desc));
                
                
            }
        }
        
        //add to dao, return true if added, return false if not
//        for(TrelloCard tCard : tcList){
//            TrelloCardDAO.addCard(tCard);
//        }
        
        //array of cards:
        //https://api.trello.com/1/boards/560e321c27db2ef9d08873ec/cards?key=7e35111227918de8a37f8c20844ed555&token=65095ea4469fc51399471d010e58e2f6a95b2f15c83b9ddea167940939534b0f
        //array of lists:
        //https://api.trello.com/1/boards/560e321c27db2ef9d08873ec/lists?key=7e35111227918de8a37f8c20844ed555&token=65095ea4469fc51399471d010e58e2f6a95b2f15c83b9ddea167940939534b0f
//        
//        for(int i = 0; i < arr.length() ; i++){
//            JSONObject main = arr.getJSONObject(i);
//            String boardName = main.getString("name");
//            if(boardName.equals("Projects Master Board")){
//                String id = main.getString("id");
//                JSONArray mArr = main.getJSONArray("memberships");
//                ArrayList<TrelloMember> tmList = new ArrayList<TrelloMember> ();
//                for(int j = 0; j<mArr.length(); j++){
//                    String membershipId = mArr.getJSONObject(i).getString("idMember");
//                    TrelloMember tm = new TrelloMember(membershipId);
//                    tmList.add(tm);
//                }
//                tb = new TrelloBoard(boardName, id, tmList);
//            }
//        }
        RequestDispatcher rd = request.getRequestDispatcher("viewUnassignedCards.jsp");
        sess.setAttribute("tc", tcList);

        rd.forward(request, response);
        }catch(IOException ioe){
            RequestDispatcher view = request.getRequestDispatcher("viewUnassignedCards.jsp");
            request.setAttribute("err", "Invalid Trello Key and Token");
            view.forward(request, response);
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
