module ErrorSerializer
  def self.serializer(erros)
    return if erros.nil?
    json = {}
    new_hash = erros.to_hash.map do |k, v|
      v.map do |msg|
        { id: k, title: msg }
      end
    end.flatten
    json[:erros] = new_hash
    json
  end
end