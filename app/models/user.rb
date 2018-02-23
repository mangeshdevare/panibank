class User < ActiveRecord::Base
  
  extend CSVImportable
  # extend Admin::Reports::ParticipantReport
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name, :father, :mother, :mobile_number, :address, 
                  :married, :pincode, :contact_address, :nationality, :dob, :role
  
  has_many :async_jobs
  
  validates :password, :confirmation => {:if => :password_required?}, :presence => {:if => :password_required?},
    :length => {:within => 6..30, :allow_blank => true}
  validates :email, :presence => true, :format => {:with => Devise.email_regexp, :allow_blank => true}
  validates :mobile_number, :presence => true, :format => {:with => /^\d*$/, :allow_blank => true}, :length => {:is => 10, :allow_blank => true}
  validates :email, :uniqueness => true
  validates :mobile_number, :uniqueness => true
  
  
  def self.create_many_from_csv(csv_file)
    self.import_from_file(csv_file, CsvUser.new())
  end
  
  private
  def password_required?
    !password.nil? || !password_confirmation.nil?
  end
  
end
