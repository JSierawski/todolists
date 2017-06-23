require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment
  attr_accessor :username, :password_digest
  #
  # Insert rows in DB
  #
  def create_user(params)
    @username = params[:username]
    @password_digest = params[:password_digest]
    user = User.new(:username => @username, :password_digest => @password_digest)
    user.save
  end

  def create_todolist(params)
    todolist = TodoList.new(:list_name => params[:name], :list_due_date => params[:due_date])
    todolist.save
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
    User.offset(offset).limit(limit).order(updated_at: :asc)
  end

  def find_alllists(offset, limit)
    TodoList.offset(offset).limit(limit).order(list_due_date: :desc)
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
    User.where(username: username)
  end

  def find_todolist_byname(name)
    TodoList.where(list_name: name)
  end

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
    User.find_by(id: id)
  end

  def get_todolist_byid(id)
    TodoList.find_by(id: id)
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
    user = User.find_by(id: id)
    user.password_digest = password_digest
    user.save
  end

  def update_listname(id, name)
      todolist = TodoList.find_by(id: id)
      todolist.list_name = name
      todolist.save
  end

  #
  # Delete rows from DB
  #
  def delete_user(id)
    User.delete(id)
  end

  def delete_todolist(id)
    TodoList.delete(id)
  end
end
