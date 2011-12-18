class BookmarksController < ApplicationController

  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  # GET /bookmarks
  # GET /bookmarks.xml
  def index
    @bookmarks = Bookmark.all
    
    
  @duplicates = Bookmark.find(:all,
  :select     => "url, COUNT(url) AS duplicate_count",
  :conditions => "url IS NOT NULL AND url != ''",
  :group      => "url HAVING duplicate_count > 1")
  
  @urlcount = Bookmark.count(:group => :url,
    :conditions => "url IS NOT NULL AND url != ''")
  

  @getuid = Bookmark.find(:all,
  :select => "user_id, name",
  :conditions => "user_id =='4'")
  
  @getallpeople = Bookmark.find(:all,
   :select => "url, user_id",
   :conditions => "url = 'http://google.com'")
  
  @getname = User.find(:all,
    :select => "username", :conditions => "id = '4'")


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookmarks }
    end
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.xml
  def show
    @bookmark = Bookmark.find(params[:id])
  
      respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  # GET /bookmarks/new
  # GET /bookmarks/new.xml
  def new
    @bookmark = Bookmark.new
    @users = User.find(:all)
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  # GET /bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  # POST /bookmarks
  # POST /bookmarks.xml
  def create
    #@bookmark = Bookmark.new(params[:bookmark])
    #
    #respond_to do |format|
    #  if @bookmark.save
    #    format.html { redirect_to(@bookmark, :notice => 'Bookmark was successfully created.') }
    #    format.xml { render :xml => @bookmark, :status => :created, :location => @bookmark }
    #  else
    #    format.html { render :action => "new" }
    #    format.xml { render :xml => @bookmark.errors, :status => :unprocessable_entity }
    #  end
    #end

    @bookmark  = current_user.bookmarks.build(params[:bookmark])
    #
    #@bookmark = @current_user.bookmarks.build(params[:bookmark])
    #@bookmarkuser = @current_user.bookmarkusers.build(params[:bookmark])
    #
    
 
    
    #@bookmarkuser.save
    
    if @bookmark.save
      flash[:success] = "Bookmark created!"
      redirect_to root_path, :flash => { :success => "Bookmark created!" }
    else
      render 'pages/home'
    end

  end

  # PUT /bookmarks/1
  # PUT /bookmarks/1.xml
  def update
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to(@bookmark, :notice => 'Bookmark was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.xml
  def destroy
    #@bookmark = Bookmark.find(params[:id])
    #@bookmark.destroy
    
    #@bookmark.destroy
    #redirect_back_or root_path
    #
    #respond_to do |format|
    #  format.html { redirect_to(bookmarks_url) }
    #  format.xml  { head :ok }
    #end
    @bookmark.destroy
    redirect_to root_path, :flash => { :success => "Bookmark deleted!" }
  end
  
  private

    def authorized_user
      @bookmark = current_user.bookmark.find_by_id(params[:id])
      redirect_to root_path if @bookmark.nil?
    end
end
