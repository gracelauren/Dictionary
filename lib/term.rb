class Term
  @@all_terms = []
  define_method(:initialize) do |word, definition|
    @word = word.downcase()
    @definitions = [definition.downcase()]
    @id = @@all_terms.length().+(1)
  end


  define_method(:word) do
    @word
  end

  define_method(:definition) do
    @definitions
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@all_terms.push(self)
  end

  define_singleton_method(:all) do
    @@all_terms
  end

  define_singleton_method(:clear) do
    @@all_terms = []
  end

  define_singleton_method(:add) do |word, definition_add|
    @@all_terms.each() do |term|
      if word == term.word()
        term.definition().push(definition_add.downcase())
      end
    end
  end

  define_singleton_method(:find) do |identification|
    found_term = nil
    @@all_terms.each() do |term|
      if term.id().eql?(identification.to_i())
        found_term = term
      end
    end
    found_term
  end

  define_singleton_method(:remove) do |word|
    @@all_terms.each() do |term|
      if word == term.word()
        @@all_terms.delete(term)
      end
    end
  end

  define_singleton_method(:edit) do |definition_original, definition_replace|
    @@all_terms.each() do |term|
      term.definition().each() do |definition|
        if definition_original.downcase() == definition
          definition.replace(definition_replace.downcase())
        end
      end
    end
  end

  define_singleton_method(:search) do |word|
    search_array = []
    @@all_terms.each() do |term|
      if word.downcase() == term.word()
        search_array.push(term)
      end
    end
    search_array
  end
end
