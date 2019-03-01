class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end
  # def author
  #   "Marcus Pereira"
  # end
  # def kind_description
  #   self.kind.description
  # end
  # def hello
  #   I18n.t('hello');
  # end
  # def i_18n
  #   I18n.default_locale
  # end
  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:kind_description, :author, :hello, :i_18n]
  #   )
  # end
  # def to_br
  #   { 
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   }
  # end
end
