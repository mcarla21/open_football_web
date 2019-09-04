# frozen_string_literal: true

# this is the controller
# that takes care of all actions related to teams
class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show; end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit; end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(new_team_params)
    respond_to do |format|
      if @team.save
        handle_success(format)
      else
        handle_failure(format)
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name,
                                 :abbreviation,
                                 manager_attributes: %i[first_name last_name age description],
                                 players_attributes: %i[name skill_level])
  end

  def handle_success(format)
    format.html { redirect_to @team, notice: 'Team was successfully created.' }
    format.json { render :show, status: :created, location: @team }
    TeamMailer.send_welcome_email.deliver_later
  end

  def handle_failure(format)
    format.html { render :new }
    format.json { render json: @team.errors, status: :unprocessable_entity }
  end
  # in order to be able to create the abbreviation if it does not exist

  def new_team_params
    team_params[:abbreviation].empty? ? team_params.except(:abbreviation) : team_params
  end
end
