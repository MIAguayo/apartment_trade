Rails.application.routes.draw do

  get("/", { :controller => "apartments", :action => "index" })



  # Routes for the Trade request resource:

  # CREATE
  post("/insert_trade_request", { :controller => "trade_requests", :action => "create" })
          
  # READ
  get("/trade_requests", { :controller => "trade_requests", :action => "index" })
  
  get("/trade_requests/:path_id", { :controller => "trade_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_trade_request/:path_id", { :controller => "trade_requests", :action => "update" })
  
  # DELETE
  get("/delete_trade_request/:path_id", { :controller => "trade_requests", :action => "destroy" })

  #------------------------------

  # Routes for the City resource:

  # CREATE
  post("/insert_city", { :controller => "cities", :action => "create" })
          
  # READ
  get("/cities", { :controller => "cities", :action => "index" })
  
  get("/cities/:path_id", { :controller => "cities", :action => "show" })
  
  # UPDATE
  
  post("/modify_city/:path_id", { :controller => "cities", :action => "update" })
  
  # DELETE
  get("/delete_city/:path_id", { :controller => "cities", :action => "destroy" })

  #------------------------------

  # Routes for the Apartment resource:

  # CREATE
  post("/insert_apartment", { :controller => "apartments", :action => "create" })
          
  # READ
  get("/apartments", { :controller => "apartments", :action => "index" })
  
  get("/apartments/:path_id", { :controller => "apartments", :action => "show" })
  
  # UPDATE
  
  post("/modify_apartment/:path_id", { :controller => "apartments", :action => "update" })
  
  # DELETE
  get("/delete_apartment/:path_id", { :controller => "apartments", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
