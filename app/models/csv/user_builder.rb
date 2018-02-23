module Csv
  class UserBuilder
    def initialize(existing_user, attrs)
      @existing_user = existing_user
      @attrs = attrs
    end

    def build
      user = @existing_user
      attrs = @attrs.slice(*[:email, :full_name, :father, :mother, :mobile_number, :address, 
                              :married, :pincode, :contact_address, :nationality].collect(&:to_s))
      return User.new(attrs) if user.empty?
      user.assign_attributes(attrs)
      user
    end
  end
end
