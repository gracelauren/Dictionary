require('rspec')
require('term')

describe(Term) do
  before() do
    Term.clear()
  end

  describe("#word") do
    it("lets you give a word and returns it") do
      test_term = Term.new("elephants", "never forget")
      test_term.save()
      expect(test_term.word()).to(eq("elephants"))
    end
  end

  describe("#definition") do
    it("lets you give a definition") do
      test_term = Term.new("elephants", "never forget")
      test_term.save()
      expect(test_term.definition()).to(eq(["never forget"]))
    end
  end

  describe('#id') do
    it("returns the id of the the term entered into all_terms array") do
      test_term = Term.new("elephants", "never forget")
      expect(test_term.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Term.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("adds the term data arguments to the array of terms") do
      test_term = Term.new("elephants", "never forget")
      test_term.save()
      expect(Term.all()).to(eq([test_term]))
    end
  end

  describe(".clear") do
    it("will clear out the 'all_terms' array") do
      test_term = Term.new("cat", "adorable").save()
      Term.clear()
      expect(Term.all()).to(eq([]))
    end
  end

  describe('.find') do
    it("will return the term by its id number 'all_terms' array") do
      test_term = Term.new("elephants", "never forget")
      test_term.save()
      test_term2 = Term.new("cat", "adorable")
      test_term2.save()
      expect(Term.find(test_term.id())).to(eq(test_term))
    end
  end

  describe('.remove') do
    it('will delete a term(the word and definition) in the all_terms array') do
      test_term = Term.new("elephants", "never forget")
      test_term.save()
      test_term2 = Term.new("cat", "adorable")
      test_term2.save()
      Term.remove(test_term.word())
      expect(Term.all()).to(eq([test_term2]))
    end
  end

  describe(".edit") do
    it("will replace the word definition") do
      test_term = Term.new("elephants", "never forget")
      test_term.save()
      Term.edit("never forget", "can hear from miles away")
      expect(test_term.definition()).to(eq(["can hear from miles away"]))
    end
  end

  describe('.search') do
    it('will search for word and and return the entire object') do
      test_term = Term.new("elephants", "never forget")
      test_term.save()
      expect(Term.search("elephants")).to(eq([test_term]))
    end
  end

  describe('.add') do
    it('will add a new definition to the same word') do
      test_term = Term.new("elephants", "never forget")
      test_term.save()
      expect(Term.add("elephants", "poop really smells!")).to(eq([test_term]))
    end
  end
end
