class ComparisonsController < ApplicationController
  before_action :set_comparison, only: [:show, :edit, :update, :destroy]
  require 'csv'
  # GET /comparisons
  # GET /comparisons.json
  def index
    @comparisons = Comparison.all(:created_at)
  end

  # GET /comparisons/1
  # GET /comparisons/1.json
  def show
    @comparisons = Comparison.order(:created_at).reverse
  end

  # GET /comparisons/new
  def new
    @comparison = Comparison.new
    @comparisons = Comparison.order(:created_at).reverse
  end

  # GET /comparisons/1/edit
  def edit
  end


  def download(file)
    send_file file.path, :disposition => 'attachment'
  end
  # POST /comparisons
  # POST /comparisons.json
  def create
    @comparison = Comparison.new(comparison_params)
    @comparison.textFile = @comparison.attachment_url
    @comparison.csvFile = @comparison.attachment2_url
    @comparison.downloadUrl = "/download/" + @comparison.company + ".csv"
    @user = current_user
    #@comparison = Comparison.order(:update)
    respond_to do |format|
      if @comparison.save
        format.html { redirect_to @comparison, notice: 'Comparison was successfully created. You will receive an email attachment shortly' }
        format.json { render :show, status: :created, location: @comparison }
      else
        format.html { render :new }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
      
      f = File.open("public/" + @comparison.textFile)
      a = []
      File.readlines(f).each do |line|
      a.push(line.strip) 
      end

      title = @comparison.company


      book = CSV.open("public/download/" + title + ".csv", "wb", headers:true)
      @attach = title + ".csv"
     
      auto = []

      Thread.new do

      CSV.foreach("public/" + @comparison.csvFile, headers:true) do |row|
          #puts row['Car make']
          auto = row['Phoneday'].gsub(/\D/, '')
          
        #   auto.push(row['Car make'])
          if a.any? {|word| word == auto}
          
          
          else
          
          book << row   
          end 
          end

          CsvMailer.csv_email(@user, @attach).deliver_now
        end

    end


 




  end

  # PATCH/PUT /comparisons/1
  # PATCH/PUT /comparisons/1.json
  def update
    respond_to do |format|
      if @comparison.update(comparison_params)
        format.html { redirect_to @comparison, notice: 'Comparison was successfully updated.' }
        format.json { render :show, status: :ok, location: @comparison }
      else
        format.html { render :edit }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comparisons/1
  # DELETE /comparisons/1.json
  def destroy
    @comparison.destroy
    respond_to do |format|
      format.html { redirect_to comparisons_url, notice: 'Comparison was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comparison
      @comparison = Comparison.find(params[:id])
    end

    private
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def comparison_params
      params.require(:comparison).permit(:company, :textFile, :csvFile, :downloadUrl, :attachment, :attachment2 )
    end
end
