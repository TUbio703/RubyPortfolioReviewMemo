class HomeController < ApplicationController
  def index
    guest_user = User.find_by(email: "guest@example.com")
    current = current_user || guest_user

    # タブの切り替え
    if params[:scope] == "everyone"
      @entries = Entry.all
    else
      @entries = current ? current.entries : Entry.none
    end

    @latest_entry = @entries.last

    if params[:q].present?
      keyword = "%#{params[:q]}%"
      @entries = @entries
                   .left_joins(:tags)
                   .where("entries.title LIKE ? OR tags.name LIKE ? OR entries.body LIKE ?", keyword, keyword, keyword)
                   .distinct
    end

    if params[:tag].present?
      keyword = "%#{params[:tag]}%"
      @entries = @entries.joins(:tags).where("tags.name LIKE ?", keyword).distinct
    end
  end
end
