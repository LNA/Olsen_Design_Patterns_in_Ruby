# We can custom tailor a method to do what we want. 
# I need to create instances of magazines that will allow me to track
# the location of our first photo shoot and cover model choices based on the
# type of magazine and the magazines content..

def new_mag(type, content)

  mag = Magazine.new 

  if type == :fitness
    def mag.location
      'chicago'
    end
  else
    def mag.location
      'new_york'
    end
  end

  if content == :health
    def mag.cover_model
      'naomi_campbell'
    end
  else
    def mag.cover_model
      'anne_thorisdotter'
    end
  end
  mag
end

mag1 = new_mag(:chicago, :naomi_campbell)
mag2 = new_mag(:new_york, :anne_thorisdotter)

puts "The fitness magazine cover will be shot in #{mag1.location} with #{mag1.cover_model.}"
puts "The fashion magazine cover will be shot in #{mag2.location} with #{mag2.cover_model.}"

# Our magazines needs more than just cover models and locations.  Also I don't want to have to
# pass in the method strings as symbols; it doesn't look right to have a first and last name
# with no caps and an underscore in between. 

# The more we want to add to the creation of the magazine the messier
# our code will become.  We can pull some of the functionality of building a magazine into modules. 
# By extending the various modules in our new_mag method, we can fill the creation of our magazine
# with methods while taking up less space.

module FashionPhotoShoot
  def location
    'New York'
  end

  def cover_model
    'Naomi Campbell'
  end

  def photographer
    'Kermit The Frog'
  end

  def stylist
    'Kelly Cutrone'
  end
end

module FitnessPhotoShoot
  def location
    'Chicago'
  end

  def cover_model
    'Annie Thorisdottir'
  end

  def photographer
    'Miss Piggy'
  end

  def stylist
    'Tyra Banks'
  end
end

module HealthContent
  def this_months_theme
    'Plant Based Life Style'
  end

  def guest_editor
    'Rich Roll'
  end

  def horoscope_by
    'The Astro Twins'
  end

  def article_to_cross_promote
    'CrossFit'
  end
end

module ConsumerContent
  def this_months_theme
    'A Guide to Haute Couture'
  end

  def guest_editor
    'Anna Wintour'
  end

  def horoscope_by
    'Cruella De Vil'
  end

  def article_to_cross_promote
    'Chanel'
  end
end

def new_magazine(type, content)

  mag = Magazine.new

  if type == :fitness
    mag.extend(FitnessPhotoShoot)
  else
    mag.extend(FashionPhotoShoot)
  end

  if content == :health 
    mag.extend(HealthContent)
  else
    mag.extend(ConsumerContent)
  end
end

# Note the use of extend; it's more convienient to use
# when modifying an object on the fly.