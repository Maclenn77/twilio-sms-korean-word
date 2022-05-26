require 'test_helper'

class WordTest < ActiveSupport::TestCase
  test "Invalid when korean word is not written in hangul" do
    @invalid_word = Word.new(korean_word: 'uno', romanja: 'uno', translation: 'uno')
     assert_equal(false, @invalid_word.valid?)
  end

  test "One error message if korean word is false" do
    @invalid_word = Word.new(korean_word: 'uno', romanja: 'uno', translation: 'uno')
    @invalid_word.valid?
     assert_equal(1, @invalid_word.errors.messages.size)
  end

  test "Invalid when word doesn't have romanja" do
    @invalid_word = Word.new(korean_word: 'uno', romanja: nil, translation: 'uno')
     assert_equal(false, @invalid_word.valid?)
  end

  test "One error message if romanja is nil" do
    @invalid_word = Word.new(korean_word: 'uno', romanja: 'uno', translation: 'uno')
    @invalid_word.valid?
     assert_equal(1, @invalid_word.errors.messages.size)
  end

  test "Invalid when word doesn't have translation" do
    @invalid_word = Word.new(korean_word: '하나', romanja: 'nil', translation: nil)
     assert_equal(false, @invalid_word.valid?)
  end

  test "One error message if translation is nil" do
    @invalid_word = Word.new(korean_word: '하나', romanja: 'nil', translation: nil)
    @invalid_word.valid?
     assert_equal(1, @invalid_word.errors.messages.size)
  end
end
