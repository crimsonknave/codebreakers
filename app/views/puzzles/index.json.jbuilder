json.array!(@puzzles) do |puzzle|
  json.extract! puzzle, :id
  json.url puzzle_url(puzzle, format: :json)
end
