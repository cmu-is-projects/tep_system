class Order < ApplicationRecord
  before_validation :set_dates

  belongs_to :user

  if sync_to_salesforce? then 
    belongs_to :teacher, foreign_key: :teacher_id, primary_key: :sfid
  else 
    belongs_to :teacher
  end
  
  has_many :order_items
  has_many :items, through: :order_items
  
  #allow orderitems to be nested within orders
  accepts_nested_attributes_for :order_items, reject_if: ->(oi) { oi[:quantity].blank? }

  #Validations
  validates_presence_of :user, :teacher
  validates_date :shopping_date, on_or_before: lambda { Date.current }, allow_blank: true
  validates_date :date_entered, on_or_before: lambda { Date.current }
  validates_date :date_entered, on_or_after: :shopping_date

  #Scopes
  scope :for_shopping_date, ->(date) { where(shopping_date: date) }
  scope :for_date_entered, ->(date) { where(date_entered: date) }
  scope :for_teacher, ->(teacher_id) { where(teacher_id: teacher_id) }
  scope :shop_chronological, -> { order(shopping_date: :desc ) } 
  scope :enter_chronological, -> { order(date_entered: :desc ) } 

  scope :uploaded, -> { where(uploaded: true) }
  scope :not_uploaded, -> { where(uploaded: false) }

  #Methods
  def self.set_all_to_uploaded
    self.not_uploaded.update_all(:uploaded => true)
  end

  # the POS Transaction table is automatically synced to write changes
  # to Salesforce, so if we add a row to POS Transaction, Heroku Connect
  # will automatically add the row to Salesforce within 2 minutes
  def self.add_to_pos_transactions
    orders = Order.not_uploaded.all
    orders.each do |o|
      o.order_items.each do |oi|
        pos = PosTransaction.new
        pos.recordtypeid = "012E0000000MzweIAC"
        pos.first_name__c = o.teacher.first_name
        pos.last_name__c = o.teacher.last_name
        pos.units_distributed__c = oi.quantity
        pos.date_distributed__c = o.shopping_date 
        pos.external_id__c = SecureRandom.uuid
        pos.in_related_outgoing_pos__c = oi.item.sfid
        pos.in_contact__c = o.teacher.sfid
        pos.save!
      end 
    end 
  end
  
  # def self.to_csv
  #   attributes = %w{teacher_id  shopping_date uploaded}

  #   CSV.generate(headers: true) do |csv|
  #     csv << attributes

  #     all.each do |order|
  #       csv << attributes.map{ |attr| order.send(attr) }
  #     end
  #   end
  # end

  private 
  # set date_entered to today and shopping_date to today if not given
  def set_dates 
    if self.date_entered.nil?
      self.date_entered = Date.current
    end 
    if self.shopping_date.nil?
      self.shopping_date = self.date_entered
    end
    return true
  end
end
