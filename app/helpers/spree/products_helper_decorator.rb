Spree::ProductsHelper.class_eval do
  def eco_image(f)
    if f.taxons.first == 9
      image_tag "base_etiqueta.jpg"
    else
      image = MiniMagick::Image.open("#{Rails.root}/app/assets/images/base_etiqueta.jpg")
      fuel = f.master.tire_fuel_consumption.name.downcase
      wet = f.master.tire_wet_grip.name.downcase
      noise_db = f.master.tire_rolling_noise_db
      noise_wave = f.master.tire_rolling_noise_wave
      result = image.composite(MiniMagick::Image.open("#{Rails.root}/app/assets/images/#{fuel}.jpg"), "jpg") do |c|
        c.gravity "center"
        c.geometry "-13-33"
      end
      result = result.composite(MiniMagick::Image.open("#{Rails.root}/app/assets/images/#{wet}.jpg", "jpg")) do |c|
        c.gravity "center"
        c.geometry "+103+13"
      end
      result = result.composite(MiniMagick::Image.open("#{Rails.root}/app/assets/images/emision_ruido_#{noise_wave}.jpg", "jpg")) do |c|
        c.gravity "center"
        c.geometry "-30+165"
      end
      result.combine_options do |c|
        c.gravity "center"
        c.pointsize '30'
        c.draw "text 60,168 '#{noise_db}'"
        c.font 'arial'
        c.fill "#FFFFFF"
      end
      result.write("#{Rails.root}/app/assets/images/output.jpg")
      image_tag "output.jpg"
    end  
  end    
end