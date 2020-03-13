class TransactionsController < ProtectedController
  before_action :set_transaction, only: [:show, :update, :destroy]

  # GET /transactions
  def index
    @transactions = current_user.Transaction.all

    render json: @transactions
  end


  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create
    @transaction = current_user.Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
  end

  def show_by_category
    @transactions_by_category = current_user.Transaction.where(category_id: params[:category_id])
    @transactions = @transactions_by_category.order(date: :desc)

    render json: @transactions
  end

  def show_by_month
    @transactions_by_category = current_user.Transaction.where(category_id: params[:category_id])
    @transactions = @transactions_by_category.where(date: Date.today.all_month)

    render json: @transactions
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = current_user.Transaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.require(:transaction).permit(:amount, :date, :category_id, :note)
    end
end
