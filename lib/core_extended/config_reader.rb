class ConfigReader

  CONFIG_PATH = File.expand_path(File.join(File.dirname(__FILE__), '../../config'))

  def self.yaml(filename)
   YAML.load_file File.join(CONFIG_PATH, filename)
  end

  def self.similar_character_mapping
    @similar_character_mapping ||= yaml('similar_character_mapping.yml').freeze
  end
  
  def self.accents_mapping
    @accents_mapping ||= yaml('accents_mapping.yml').freeze
  end

end