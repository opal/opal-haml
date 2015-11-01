require 'spec_helper'
require 'template'

describe Template::OutputBuffer do
  describe "#attributes" do
    it "compiles an empty attribute set as ''" do
      attributes({}).should == ""
    end

    it "can compile simple attributes" do
      result = attributes(name: 'foo', height: '100')
      expect(result).to include("name='foo'", "height='100'")
    end

    it "can compile nested attributes" do
      result = attributes(data: { foo: { bar: 'baz' }, another: 'one' })
      expect(result).to include("data-foo-bar='baz'")
      expect(result).to include("data-another='one'")
    end

    it "skips the attribute for false values" do
      result = attributes(name: false)
      expect(result).to_not include('name')
    end

    it "generates a simple named attribute for true values" do
      result = attributes(closable: true)
      expect(result).to include('closable')
      expect(result).to_not include('closable=')
    end

    def attributes(attrs)
      subject.attributes({}, nil, attrs)
    end
  end
end
