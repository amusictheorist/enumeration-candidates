# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.find { |candidate|
  candidate[:id] == id }
end

def experienced?(candidate)
  years_experience = candidate[:years_experience]
  years_experience >= 2
end

def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) &&
    candidate[:github_points] >= 100 &&
    (candidate[:languages].include? ('Ruby') ||
    candidate[:languages].include? ('Python')) &&
    candidate[:date_applied] >= (Date.today - 15) &&
    candidate[:age] > 17
  end
end

def ordered_by_qualifications(candidates)
  candidates.sort_by do |candidate|
    [-candidate[:years_of_experience], -candidate[:github_points]]
  end
end