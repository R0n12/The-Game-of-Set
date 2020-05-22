require 'rspec'
require_relative '../Set/Stats.rb'

# Created and test cases added by Jas Bawa on 2/3/20
# Edited on 2/6/2020 by Jas Bawa: Fixed requires because stats was moved to a new file
# Rather than making multiple files, I edit the file each time with the test case and copy and paste the file contents to the file
# I have listed the pre test case content for each test case as a comment inside it. After each case was tested on its own,
# the updated file was checked to match what was expected

describe "Set statistics" do
  context "Read scores to array" do

    it "should return an empty array" do

      #File Content: (Empty File)
      #

      array_of_scores = read_scores_to_array
      puts array_of_scores.to_s
      expect(array_of_scores).to eql []
    end
  end

  context "with file that has a certain number of scores" do

    it "should return array with a single value if it contains one score" do

      #File Content:
      # 123.456

      array_of_scores = read_scores_to_array
      expect(array_of_scores).to eql [123.456]
    end

    it "should return array with two values if it contains two scores" do

      #File Content:
      # 123.456
      # 132.3

      array_of_scores = read_scores_to_array
      expect(array_of_scores).to eql [123.456, 132.3]
    end

    it "should return array with three values if it contains three scores" do

      #File Content:
      # 123.456
      # 132
      # 654.123

      array_of_scores = read_scores_to_array
      expect(array_of_scores == [123.456, 132, 654.123]).to eql true
    end
  end

  context "write array to file" do

    it "should create the file when it doesn't exist and add a single score" do
      #File Content: (File Does Not Exist!)

      score_set = Array.new
      score_set.push 123.456

      write_array_to_file score_set

    end

    it "should write two scores to the file, overwriting the original data" do
      #File Content:
      # 123.456

      score_set = Array.new
      score_set.push 123.456
      score_set.push 132


      write_array_to_file score_set

    end

    it "should write three scores to the file, overwriting the original data, and there is a new top score" do
      #File Content:
      # 123.456
      # 132

      score_set = Array.new
      score_set.push 99.32
      score_set.push 123.456
      score_set.push 132

      write_array_to_file score_set

    end
  end
  context "add score to high scores list" do

    it "should add a new low score to the end of list with only one current score" do
      #File Content:
      # 123.456

      add_score 132

    end

    it "should add a new top score to the top of list with only two current scores" do
      #File Content:
      # 123.456
      # 132

      add_score 99.3

    end

    it "should add a new 2nd place score to the 2nd position of list with only three current scores" do
      #File Content:
      # 99.3
      # 123.456
      # 132

      add_score 101.34729

    end

    it "should add a new 5th place score to the 5th position of list with 10 current saves scores, dropping the last current score" do
      #File Content:
      # 99.3
      # 123.456
      # 132
      # 133.5
      # 145.7
      # 189
      # 206
      # 206.1
      # 206.11
      # 207.4

      add_score 137.5

    end

    it "should add nothing to a list of 10 when trying to add a score that is larger than the 10th place time" do
      #File Content:
      # 99.3
      # 123.456
      # 132
      # 133.5
      # 145.7
      # 189
      # 206
      # 206.1
      # 206.11
      # 207.4

      add_score 300.25

    end

  end
end