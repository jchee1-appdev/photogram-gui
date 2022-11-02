Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})
  get("/users", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "show"})
  get("/insert_user_record", { :controller => "users", :action => "create"})
  get("/update_user/:path_id", { :controller => "users", :action => "update"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show"})
  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete"})
  get("/insert_photo_record", { :controller => "photos", :action => "create"})
  get("/update_photo/:path_id", { :controller => "photos", :action => "update"})
  get("/insert_comment_record", { :controller => "photos", :action => "insert_comment"})
end
