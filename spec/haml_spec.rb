require 'spec_helper'
require File.expand_path('../simple', __FILE__)
require File.expand_path('../advanced', __FILE__)
require File.expand_path('../html_content', __FILE__)

describe "Haml files" do
  let(:simple) { Template['simple'] }
  let(:advanced) { Template['advanced'] }
  let(:html_content) { Template['html_content'] }

  it "should be defined by filename on Template namespace" do
    expect(simple).to be_kind_of(Template)
  end

  it "should render using #render" do
    expect(simple.render(self)).to include('lol')
  end

  it "accepts a context to render template with" do
    @haml_message = "hello world"
    expect(advanced.render(self)).to include('hello world')
  end

  it "generates html with a given context" do
    @h1_content = 'Ford Perfect'
    expect(html_content.render(self)).to include('<h1>Ford Perfect</h1>')
  end
end
