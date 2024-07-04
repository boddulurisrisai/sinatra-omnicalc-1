require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/:square/new") do
  @find = params.fetch("square")
  erb(:fertilize)
end

get("/:input/results") do
  @page = params.fetch("input")
 
 if @page == "square"
  @number = params.fetch("number1").to_f
  @result = (@number **2).to_f
  erb(:finalize)
  
 elsif @page == "square_root"
  @number = params.fetch("root").to_f
  @result = (@number ** 0.5).to_f
  erb(:square_root)
  
 elsif @page == "random"
  @minimum = params.fetch("minimum").to_f
  @maximum = params.fetch("maximum").to_f
  @result = rand(@minimum..@maximum).to_fs
  erb(:random_erb)

 elsif @page == "payment"
  @apr = params.fetch("apr").to_f
  @years = params.fetch("years").to_i
  @principal = params.fetch("principal").to_f
  r = (@apr/1200)
  n = @years * 12
  @numerator = (r * @principal).to_f
  @denominator = (1 - ((1 + r) ** (-n))).to_f
  @result = (@numerator / @denominator).to_f
  erb(:payment_erb)
 end
  
  
 end
