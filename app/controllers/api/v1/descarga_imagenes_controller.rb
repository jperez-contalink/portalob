require 'rubygems'
require 'zip'
require 'chilkat'

module Api
  module V1
    class DescargaImagenesController < ApplicationController
      def index
=begin
        @user = current_usuario
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/ws/com.tegik.portalob.DescargaImagenesPortal?productoids=#{params[:productoids]}"
        file_name = "ImagenesPortal2.zip"
        filename ="#{Rails.root}/public/#{file_name}"
        pathDestino = "#{Rails.root}/public/imagenesProductos/"
        File.open(filename, "w:UTF-8") do |file|
          content = (RestClient.get order_link).body
          file.write(content.force_encoding("UTF-8"))
        end

        Zip::File.open(filename) do |zip_file|
          # Handle entries one by one
          zip_file.each do |entry|
            # Extract to file/directory/symlink
            puts "Extracting #{entry.name}"
            File.delete(pathDestino + entry.name) if File.exist?(pathDestino + entry.name)
            entry.extract(pathDestino + entry.name)
            # Read into memory
            content = entry.get_input_stream.read
          end
        end      
=end
    	end
  end
end