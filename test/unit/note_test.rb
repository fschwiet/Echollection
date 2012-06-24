require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "requires a title" do
  	note = Note.new;

    assert note.invalid?
    assert note.errors[:title].any?
    
    note.title = "hi"

    assert note.valid?
  end

  test "example loading note from fixture" do
  	puts(notes(:one).title)
  end

end
