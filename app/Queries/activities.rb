class Activities
  def call(current_user)
    PublicActivity::Activity.order("created_at DESC").where(owner_id: current_user.id, owner_type: "User")
  end
end