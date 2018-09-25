require 'shrine'
require 'shrine/plugins/activerecord'
require 'shrine/plugins/backgrounding'
require 'shrine/plugins/data_uri'
require 'shrine/plugins/delete_promoted'
require 'shrine/plugins/delete_raw'
require 'shrine/storage/s3'
require 'shrine/storage/file_system'
require 'shrine/plugins/logging'
require 'shrine/plugins/determine_mime_type'
require 'shrine/plugins/store_dimensions'
require 'shrine/plugins/cached_attachment_data'
require 'shrine/plugins/restore_cached_data'
require 'shrine/plugins/validation_helpers'
require 'shrine/plugins/pretty_location'
require 'shrine/plugins/processing'
require 'shrine/plugins/versions'

Shrine.plugin :activerecord
Shrine.plugin :backgrounding
Shrine.plugin :cached_attachment_data
Shrine.plugin :data_uri
Shrine.plugin :determine_mime_type
Shrine.plugin :logging
Shrine.plugin :restore_cached_data
Shrine.plugin :store_dimensions
Shrine.plugin :validation_helpers
Shrine.plugin :versions

def production_storages
  s3_options = {
    access_key_id: Rails.application.credentials.production.dig(:aws, :access_key_id),
    secret_access_key: Rails.application.credentials.production.dig(:aws, :secret_access_key),
    bucket: '',
    endpoint: 'https://foo.com',
    region: 'us-east-2'
  }

  # Your probably want the directory to be in a shared location so its persisted between deployments
  {
    cache: Shrine::Storage::FileSystem.new('public/uploads', prefix: 'cache'), # temporary
    store: Shrine::Storage::S3.new(prefix: 'store', upload_options: { acl: 'public-read' }, **s3_options)
  }
end

def development_storages
  s3_options = {
    access_key_id: Rails.application.credentials.development.dig(:aws, :access_key_id),
    secret_access_key: Rails.application.credentials.development.dig(:aws, :secret_access_key),
    bucket: Rails.application.credentials.development.dig(:aws, :bucket),
    endpoint: 'https://foo.com',
    region: 'us-east-1'
  }

  {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
    store: Shrine::Storage::S3.new(prefix: 'store', upload_options: { acl: 'public-read' }, **s3_options)
    #store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads'),
  }
end

Shrine.storages = Rails.env.production? ? production_storages : development_storages
