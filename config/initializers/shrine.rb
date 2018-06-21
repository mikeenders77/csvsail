require "shrine"
require "shrine/storage/file_system"
 
Shrine.plugin :activerecord
Shrine.plugin :logging, logger: Rails.logger
 
Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "public/uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "public/uploads/store"),
}