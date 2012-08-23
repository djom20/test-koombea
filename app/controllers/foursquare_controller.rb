class FoursquareController < ApplicationController

  before_filter :require_user
   
  def infouser
   @chekins = foursquare.user_checkins(:limit => 1 )
  end


   def find_user

       if (params[:option] == "Email")
        @user_found = foursquare.search_users(:email => params[:value])
       else
        if (params[:option] == "Twitter")
          @user_found =  foursquare.search_users(:twitter => params[:value])
        else
          if (params[:option] == "Name")
          @user_found =  foursquare.search_users(:name => params[:value])
        else
          if (params[:option] == "Phone")
          @user_found =  foursquare.search_users(:phone => params[:value])
        end
      end
      end
     end 
  end

  
  def find_venues
    if(params[:name])
      @venues_found = foursquare.search_venues(:query => params[:name], :ll => "10.971949,-74.796638")
    end
  end


  def find_friends
    if(params[:email])
    @user_found = foursquare.search_users(:email => params[:email])     
    
    if(@user_found.results.size > 0 )then
    @friends_found = foursquare.user_friends(@user_found.results[0]["id"])
    end
    end    
  end

  
  def find_user_badges
  if(params[:email])
    @user_found = foursquare.search_users(:email => params[:email])     
    
    if(@user_found.results.size > 0 )then
    @badges_found = foursquare.user_badges(@user_found.results[0]["id"])
    end
    end 

  end

  
  def find_venue_tips
      
      if(params[:name])
      @venue_found = foursquare.search_venues(:query => params[:name], :ll => "10.971949,-74.796638",:limit => 1)
      
      if(@venue_found.groups[0]["items"].size > 0 ) then
      @tips_found = foursquare.venue_tips(@venue_found.groups[0]["items"][0]["id"])
      end
      end
  
  end

end
