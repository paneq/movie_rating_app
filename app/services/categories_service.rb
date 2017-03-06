class CategoriesService
  def call
    Category.all.map{ |c| [c.name, c.id] }
  end
end