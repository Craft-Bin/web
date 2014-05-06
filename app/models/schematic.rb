class Schematic

  include Mongoid::Document

  field :hash, type: String
  field :name, type: String

  field :created_at, type: Time
  field :views, type: Integer, default: 0 
  field :paste_count, type: Integer, default: 0

  field :materials, type: String

  field :width, type: Integer
  field :height, type: Integer
  field :length, type: Integer

  field :offset_width, type: Integer
  field :offset_height, type: Integer
  field :offset_length, type: Integer


  field :entity_count, type: String
  field :block_occurances, type: Hash

end