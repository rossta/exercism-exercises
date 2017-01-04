class ETL
  def self.transform(old)
    old.each_with_object({}) do |(key, values), transform|
      values.each do |v|
        transform[v.downcase] = key
      end
    end
  end
end
