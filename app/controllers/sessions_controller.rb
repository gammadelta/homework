class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
      
      if !user.userName
    	 user.points = 5
       user.banned = false
       user.userName = generateName
    	 user.rating = 0
	    end
      if user.email
        user.save!
        session[:user_id] = user.id
        flash[:success] = "Welcome"
      else
        flash[:danger] = "please use an @asu.edu email address"
      end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def show
    @assignment = Assignment.find(:all, :conditions => {UID: current_user.id})
  end
  
  def edit
      user = User.find(current_user.id)
      user.userName = generateName
      user.save!
      redirect_to :back
  end


  private
  def generateName
     adjs = ["happy", "annoyed", "madly", "highfalutin", "hurt", "hot", "kindhearted", "groovy", "acceptable", "knowledgeable", "plain", "grey", "clumsy", "wide-eyed", "long", "wide", "puffy", "polite", "frequent", "nauseating", "encouraging", "lowly", "complex", "easy", "willing", "naughty", "cold", "abhorrent", "observant", "unruly", "merciful", "accurate", "red", "upset", "boorish", "scary", "huge", "level", "mighty", "good", "picayune", "shaggy", "snobbish", "questionable", "awesome", "guiltless", "secret", "wry", "petite", "organic", "stormy", "obese", "silly", "ajar", "raspy", "mountainous", "abject", "well-to-do", "ahead", "naive", "clammy", "round", "stupendous", "sparkling", "dead", "nimble", "woebegone", "dynamic", "wholesale", "youthful", "hateful", "unusual", "tall", "fortunate", "elated", "rebel", "thick", "lacking", "important", "unwieldy", "smelly", "chivalrous", "puny", "unequal", "ashamed", "hissing", "nosy", "quickest", "ten", "dry", "elderly", "fine", "homely", "bustling", "woozy", "separate", "ruddy", "interesting", "deafening", "needless"]
      nouns = ["celery", "control", "egg",  "hole", "wish", "queen", "air", "monkey", "uncle", "branch", "attraction", "battle", "metal", "instrument", "ant", "duck", "animal", "veil", "knee",  "tomatoe", "yak", "vegetable",  "wave", "business", "room", "secretary", "mailbox", "peace", "crown", "scarf", "book", "nut", "spy", "angle", "carpenter", "fog", "food", "market", "curtain", "prose", "eye", "jam", "quilt", "front", "pizza", "popcorn", "wrench", "potato", "lumber", "head", "plant", "cap", "beef", "worm", "plane", "love", "group", "turkey", "calendar", "quill", "tongue", "approval", "hot", "snake", "smell", "snail", "flock", "jellyfish", "discovery", "sister", "credit", "thread", "pie", "grade", "guitar", "riddle", "sort", "harmony", "can", "lip", "thumb", "payment", "treatment"]
      returnedString = adjs[rand(adjs.length)] + " " + nouns[rand(nouns.length)]
     while User.find_by(id: returnedString)
     	returnedString = adjs[rand(adjs.length)] + " " + nouns[rand(nouns.length)]
     end
     return returnedString
  end
end