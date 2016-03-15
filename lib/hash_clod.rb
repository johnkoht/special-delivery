class HashClod < Hash
  def [](key)
    super _insensitive(key)
  end

  def []=(key, value)
    super _insensitive(key), value
  end

  # Keeping it DRY.
  protected

  def _insensitive(key)
    key.respond_to?(:upcase) ? key.upcase : key
  end
end