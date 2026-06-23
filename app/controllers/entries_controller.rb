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