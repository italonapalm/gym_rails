class Admin < ApplicationRecord

  before_create :set_admin

  has_many :admin_profiles
  has_many :profiles, through: :admin_profiles

  PER_PAGE_ITEMS = 6

  validate :has_admin_profiles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Scopes
  scope :actives, -> (page) {
    where(active: true).page(page).per(PER_PAGE_ITEMS)
  }

  def has_role? role
    self.roles.include? role
  end

  def roles
    roles = []
    self.profiles.each do |p|
      p.roles.each do |r|
        roles << r.name.to_sym
      end
    end
    roles
  end

  def deactivate
    update(active: false)
  end

  def set_admin
    self.active = true
  end

  def has_admin_profiles
    message = I18n.t "activerecord.errors.messages.association_is_blank", model: Profile.model_name.human
    errors.add(:base, message) if self.admin_profiles.size == 0
  end

  def ability
    @ability ||= Ability.new(self)
  end
end
