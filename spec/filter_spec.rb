require 'slim/h_tag/filter'
require 'slim'
require 'temple'

describe Slim::HTag::Filter do

  before(:all) do
    Slim::Engine.after Slim::Interpolation, described_class
  end

  after(:all) do
    Slim::Engine.remove described_class
  end

  context 'with level attribute' do
    [#|source                                    | locals      | expected                                 |#
      ['h level=value'                          , { value: 1 }, '<h1></h1>'                              ],
      ['h level=value Content'                  , { value: 2 }, '<h2>Content</h2>'                       ],
      ['h id="top" level=value Content'         , { value: 2 }, '<h2 id="top">Content</h2>'              ],
      ['h#top.foo level=value class="bar" Title', { value: 3 }, '<h3 class="foo bar" id="top">Title</h3>'],
      ['h level="4" Content'                    , {}          , '<h4>Content</h4>'                       ],
    ].each do |source, locals, expected|
      it "renders '#{source}' #{locals}" do
        expect( slim_render(source, locals: locals) ).to eq expected
      end
    end

    context 'custom option htag_level_attr' do
      source = "h l=value Content"
      locals = { value: 1 }

      it "renders '#{source}' #{locals}" do
        skip if Slim::VERSION[0] == '2'  # XXX: why it doesn't work with slim 2.1?

        expect( slim_render(source, locals: locals, htag_level_attr: 'l') )
          .to eq '<h1>Content</h1>'
      end
    end
  end

  context 'without level attribute' do
    ['h', 'h id="invalid"', 'h Content'].each do |source|
      it "raises FilterError when given '#{source}'" do
        expect { slim_render(source) }.to raise_error Temple::FilterError
      end
    end
  end
end
