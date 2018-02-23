class CsvUser

  def initialize()
    
  end

  def headers
    %w(email full_name father mother mobile_number address married pincode contact_address nationality)
  end

  def from_hash(attr_hash, existing_users)
    attr_hash.keep_if { |key, value| value.present? && headers.include?(key) }
    user = Csv::UserBuilder.new(existing_users, attr_hash).build
    user
  end

  def batch_from_hash(rows)
    mobile_numbers = rows.collect { |row| mobile_number(row) }.compact
    users = User.where("lower(mobile_number) IN (?) ", mobile_numbers)
    existing_users = Hash[*users.map { |u| [u.mobile_number.downcase, u] }.flatten]
    rows.collect { |row| from_hash(row, existing_users) }
  end

  def unique_attribute
    "mobile_number"
  end

  def template
    headers.join(",")
  end

  private
  def mobile_number(attr_hash)
    attr_hash["mobile_number"].try(:downcase)
  end

end
