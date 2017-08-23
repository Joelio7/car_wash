require "administrate/base_dashboard"

class WashRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    vehicle_type: Field::String,
    amount_charged: Field::String.with_options(searchable: false),
    muddy_bed: Field::Boolean,
    bed_down: Field::Boolean,
    license_plate: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    status: Field::String,
    location: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :vehicle_type,
    :amount_charged,
    :license_plate,
    :created_at,
    :updated_at,
    :location,

  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :vehicle_type,
    :amount_charged,
    :muddy_bed,
    :bed_down,
    :license_plate,
    :created_at,
    :updated_at,
    :status,
    :location,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :vehicle_type,
    :amount_charged,
    :muddy_bed,
    :bed_down,
    :license_plate,
    :status,
    :location,
  ].freeze

  # Overwrite this method to customize how wash records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(wash_record)
  #   "WashRecord ##{wash_record.id}"
  # end
end
