class Definition
  @@definitions = []

  define_method(:initialize) do |explanation|
    @explanation = explanation
  end

  define_method(:explanation) do
    @explanation
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

end
