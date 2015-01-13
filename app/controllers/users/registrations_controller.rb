class Users::RegistrationsController < DeviseInvitable::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  
  def new
    #byebug
    super
  end

  # POST /resource
   def create
     #byebug
     noobie = User.find_by(email: params[:user][:email])
     if !noobie
      User.invite!(email: params[:user][:email],userName: generateName, points: 0, rating: 0, banned: false)
      flash[:success] = "invitation sent"
     else
      if noobie.invitation_accepted_at
        flash[:danger] = "email address already taken"
      else
        flash[:danger] = "invitation pending acceptance"
      end
     end
     redirect_to root_path
   end

   private

   def checkEmail
    email = params[:user][:email]
    return true
   end

   def generateName
     adjs = ["happy", "annoyed", "madly", "highfalutin", "hurt", "hot", "kindhearted", "groovy", "acceptable", "knowledgeable", "plain", "grey", "clumsy", "wide-eyed", "long", "wide", "puffy", "polite", "frequent", "nauseating", "encouraging", "lowly", "complex", "easy", "willing", "naughty", "cold", "abhorrent", "observant", "unruly", "merciful", "accurate", "red", "upset", "boorish", "scary", "huge", "level", "mighty", "good", "picayune", "shaggy", "snobbish", "questionable", "awesome", "guiltless", "secret", "wry", "petite", "organic", "stormy", "obese", "silly", "ajar", "raspy", "mountainous", "abject", "well-to-do", "ahead", "naive", "clammy", "round", "stupendous", "sparkling", "dead", "nimble", "woebegone", "dynamic", "wholesale", "youthful", "hateful", "unusual", "tall", "fortunate", "elated", "rebel", "thick", "lacking", "important", "unwieldy", "smelly", "chivalrous", "puny", "unequal", "ashamed", "hissing", "nosy", "quickest", "ten", "dry", "elderly", "fine", "homely", "bustling", "woozy", "separate", "ruddy", "interesting", "deafening", "needless"]
      nouns = ["ram", "cactus", "celery", "control", "egg",  "hole", "wish", "queen", "air", "monkey", "uncle", "branch", "attraction", "battle", "metal", "instrument", "ant", "duck", "animal", "veil", "knee",  "tomatoe", "yak", "vegetable",  "wave", "business", "room", "secretary", "mailbox", "peace", "crown", "scarf", "book", "nut", "spy", "angle", "carpenter", "fog", "food", "market", "curtain", "prose", "eye", "jam", "quilt", "front", "pizza", "popcorn", "wrench", "potato", "lumber", "head", "plant", "cap", "beef", "worm", "plane", "love", "group", "turkey", "calendar", "quill", "tongue", "approval",  "snake", "smell", "snail", "flock", "jellyfish", "discovery", "sister", "credit", "thread", "pie", "grade", "guitar", "riddle", "sort", "harmony", "can", "lip", "thumb", "payment", "treatment"]
      returnedString = adjs[rand(adjs.length)] + " " + nouns[rand(nouns.length)]
     while User.find_by(id: returnedString)
      returnedString = adjs[rand(adjs.length)] + " " + nouns[rand(nouns.length)]
     end
     return returnedString
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
