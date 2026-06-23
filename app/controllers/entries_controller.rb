class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]

  def index
    @entries = Entry.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params.except(:tag_names))
    @entry.user = current_user || User.find_by(email: "guest@example.com")
    @entry.tags = tags_from_names(entry_params[:tag_names])

    if @entry.save
      redirect_to root_path, notice: "作成しました"
    else
      render :new
    end
  end

  def update
    @entry.assign_attributes(entry_params.except(:tag_names))
    @entry.user = current_user || User.find_by(email: "guest@example.com")
    @entry.tags = tags_from_names(entry_params[:tag_names])

    if @entry.save
      redirect_to root_path, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy!
    redirect_to root_path
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :rating, :body, :tag_names)
  end

  def tags_from_names(raw_tags)
    raw_tags.to_s
            .split(/[\s,]+/)
            .reject(&:blank?)
            .uniq
            .map { |name| Tag.find_or_create_by(name: name) }
  end
end
