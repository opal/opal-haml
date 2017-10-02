require 'spec_helper'
require 'fixtures/simple'
require 'fixtures/advanced'
require 'fixtures/html_content'
require 'fixtures/attributes_helper'

describe "Haml files" do
  let(:simple)            { Template['fixtures/simple'] }
  let(:advanced)          { Template['fixtures/advanced'] }
  let(:html_content)      { Template['fixtures/html_content'] }
  let(:attributes_helper) { Template['fixtures/attributes_helper'] }

  it "should be defined by filename on Template namespace" do
    expect(simple).to be_kind_of(Template)
  end

  it "should render using #render" do
    expect(simple.render(self)).to include('lol')
  end

  it "accepts a context to render template with" do
    @haml_message = "hello world"
    expect(advanced.render(self)).to include('hello world')
    expect([
      %{hello world<a bar='baz' href='#' foo='123' quz='1134'>foofoofoo</a>}, # haml 4
      %{hello world<a bar='baz' foo='123' href='#' quz='1134'>foofoofoo</a>}, # haml 5
    ]).to include(advanced.render(self))
  end

  it "generates html with a given context" do
    @h1_content = 'Ford Perfect'
    expect(html_content.render(self)).to include('<h1>Ford Perfect</h1>')
  end

  it 'can generates attributes' do
    require 'ostruct'
    note = Struct.new(:name, :note_class)
    @keyboard = OpenStruct.new(notes: [note.new(:C, :sharp), note.new(:F, :sharp)])
    expect([
      "<div class='keyboard'>"+
        "<div class='octave'>"+
          "<a class='4 key'></a><div class='key sharp'><div class='name'>C</div></div>"+
          "<a class='4 key'></a><div class='key sharp'><div class='name'>F</div></div>"+
        "</div><div class='octave'>"+
          "<a class='4 key'></a><div class='key sharp'><div class='name'>C</div></div>"+
          "<a class='4 key'></a><div class='key sharp'><div class='name'>F</div></div>"+
        "</div>"+
      "</div>",
      "<div class='keyboard'>"+
        "<div class='octave'>"+
          "<a class='key 4'></a><div class='key sharp'><div class='name'>C</div></div>"+
          "<a class='key 4'></a><div class='key sharp'><div class='name'>F</div></div>"+
        "</div><div class='octave'>"+
          "<a class='key 4'></a><div class='key sharp'><div class='name'>C</div></div>"+
          "<a class='key 4'></a><div class='key sharp'><div class='name'>F</div></div>"+
        "</div>"+
      "</div>"
    ]).to include(attributes_helper.render(self))
  end
end
