class Schematic

  include Mongoid::Document

  belongs_to :user

  mount_uploader :schematic, SchematicUploader

  field :hash, type: String
  field :name, type: String
  field :unlisted, type: Integer, default: 0

  field :created_at, type: Time
  field :views, type: Integer, default: 0 
  field :paste_count, type: Integer, default: 0

  field :materials, type: String

  field :width, type: Integer
  field :height, type: Integer
  field :length, type: Integer

  field :offset_width, type: Integer, default: 0
  field :offset_height, type: Integer, default: 0
  field :offset_length, type: Integer, default: 0

  field :entity_count, type: String, default: 0
  field :block_occurances, type: Hash, default: {}

  def file_name
    File.join(Rails.root, 'public', schematic.url)
  end

  def has_file?
    File.exist? file_name
  end

  def get_file
    File.new file_name
  end

  def unlisted?
    unlisted == 1
  end

end