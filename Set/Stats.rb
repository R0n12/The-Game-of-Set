#File created 2/6/2020 by Jas Bawa


# Created 1/31/2020 by Jas Bawa
# Edited 2/3/2020 by Jas Bawa, code was fixed after some testing
# Edited 2/5/2020 by Jas Bawa, code was refixed because code wasn't updated for some reason
def add_score(score)

  score_set = read_scores_to_array
  if score_set.length == 0
    score_set.push(score)
  elsif (score_set.length == 10 && score < score_set[9]) || score_set.length < 10

    (0...score_set.length).each { |i|
      info("score is of type: " + score.class.to_s)
      if score < score_set[i]
        score = insert_score! score_set, score, i
      end

    }
    if score_set.length < 10
      score_set.push score
    end
  end

  write_array_to_file(score_set)
end

# Created 2/3/2020 by Jas Bawa
# Edited 2/5/2020 by Jas Bawa, code was refixed because code wasn't updated for some reason
def insert_score!(score_set, score, i)
  # Replaces value at position i with a score and returns the replaced value
  temp = score_set[i]
  score_set[i] = score
  score = temp
end

# Created 1/31/2020 by Jas Bawa
# On 2/3/2020 by Jas Bawa, code was fixed after testing
# Edited 2/5/2020 by Jas Bawa, code was refixed because code wasn't updated for some reason
def read_scores_to_array
  score_set = Array.new
  #Opens file and saves scores if file exists, otherwise just returns an empty array
  if File::exists?("set_scores")

    File.open("set_scores", "r+") do |score_file|
      score_file.each_line do |line|
        score_set.push(line.to_f)
      end
    end
  end
  puts "This is my score set: " + score_set.to_s
  score_set
end

# Created 1/31/2020 by Jas Bawa
# Edited 2/5/2020 by Jas Bawa, code was refixed because code wasn't updated for some reason
def write_array_to_file(score_set)

  # Opens or creates a file and adds all scores in the arry to the file
  File.open("set_scores", "w") do |score_file|
    score_set.each { |score|
      score_file.puts(score)
    }
  end
end
