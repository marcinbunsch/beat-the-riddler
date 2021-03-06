class PuzzlesController < ApplicationController

  before_filter :require_staff, :except => [:index, :show, :take_a_guess]

  # GET /puzzles
  # GET /puzzles.json
  def index
    @puzzles = Puzzle.all
    @levels = @puzzles.group_by(&:level).sort_by { |a| a[0] }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @puzzles }
    end
  end

  # GET /puzzles/1
  # GET /puzzles/1.json
  def show
    @puzzle = Puzzle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @puzzle }
    end
  end

  # GET /puzzles/new
  # GET /puzzles/new.json
  def new
    @puzzle = Puzzle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @puzzle }
    end
  end

  # GET /puzzles/1/edit
  def edit
    @puzzle = Puzzle.find(params[:id])
  end

  # POST /puzzles
  # POST /puzzles.json
  def create
    @puzzle = Puzzle.new(puzzle_params)
    @puzzle.user_id = current_user.id
    respond_to do |format|
      if @puzzle.save
        format.html { redirect_to @puzzle, notice: 'Puzzle was successfully created.' }
        format.json { render json: @puzzle, status: :created, location: @puzzle }
      else
        format.html { render action: "new" }
        format.json { render json: @puzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /puzzles/1
  # PUT /puzzles/1.json
  def update
    @puzzle = Puzzle.find(params[:id])

    respond_to do |format|
      if @puzzle.update_attributes(puzzle_params)
        format.html { redirect_to @puzzle, notice: 'Puzzle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @puzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puzzles/1
  # DELETE /puzzles/1.json
  def destroy
    @puzzle = Puzzle.find(params[:id])
    @puzzle.destroy

    respond_to do |format|
      format.html { redirect_to puzzles_url }
      format.json { head :no_content }
    end
  end


  def take_a_guess
    @puzzle = Puzzle.find(params[:id])

    if Guess.attempt_blocked?(@puzzle, current_user)
      flash[:error] = "Sorry, too many tries within 1 minute. Please wait a moment and try again."
      return redirect_to(@puzzle)
    end

    guessed = Guess.validate_answer(@puzzle, params[:guess], current_user)
    if guessed
      flash[:notice] = "Correct! WOOT!"
    else
      flash[:error] = "Sorry, that is incorrect. Try again!"
    end
    redirect_to @puzzle
  end

  private

  def puzzle_params
    params.require(:puzzle).permit(:name, :content, :answer, :level)
  end

end
