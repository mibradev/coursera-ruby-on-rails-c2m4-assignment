class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_name_and_last_name_cannot_be_both_blank
  validates :gender, inclusion: { in: ["male", "female"] }
  validate :male_first_name_cannot_be_sue

  def self.get_all_profiles(min_birth_year, max_birth_year)
    where("birth_year BETWEEN ? AND ?", min_birth_year, max_birth_year).order(:birth_year)
  end

  private
    def first_name_and_last_name_cannot_be_both_blank
      if first_name.blank? && last_name.blank?
        errors[:base] << "First name and last name can't be both blank"
      end
    end

    def male_first_name_cannot_be_sue
      if gender == "male" && first_name == "Sue"
        errors[:base] << "Male first name can't be Sue"
      end
    end
end
