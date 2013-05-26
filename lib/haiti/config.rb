module Haiti
  Config = Struct.new :bin_dir, :proving_grounds_dir

  def self.config
    @config ||= Config.new
  end

  def self.configure(&block)
    block.call config
  end
end
