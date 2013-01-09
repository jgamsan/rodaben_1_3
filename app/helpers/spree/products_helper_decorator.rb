Spree::ProductsHelper.class_eval do
  def eco_image(f)
    if f.is_moto? || f.master.tire_fuel_consumption_id.nil?
      image_tag "base_etiqueta.jpg"
    else
      fuel_options = Hash["A", "-14-55", "B", "-13-33", "C", "-13-11", "D", "-13+11", "E", "-13+33", "F", "-13+55", "G", "-13+77"]
      wet_options = Hash["A", "+103-53", "B", "+103-31", "C", "+103-9", "D", "+103+13", "E", "+103+35", "F", "+103+56", "G", "+103+78"]
      image = MiniMagick::Image.open("#{Rails.root}/app/assets/images/base_etiqueta.jpg")
      fuel = f.master.tire_fuel_consumption.name
      wet = f.master.tire_wet_grip.name
      noise_db = f.master.tire_rolling_noise_db
      noise_wave = f.master.tire_rolling_noise_wave
      result = image.composite(MiniMagick::Image.open("#{Rails.root}/app/assets/images/#{fuel.downcase}.jpg"), "jpg") do |c|
        c.gravity "center"
        c.geometry fuel_options[fuel]
      end
      result = result.composite(MiniMagick::Image.open("#{Rails.root}/app/assets/images/#{wet.downcase}.jpg", "jpg")) do |c|
        c.gravity "center"
        c.geometry wet_options[wet]
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